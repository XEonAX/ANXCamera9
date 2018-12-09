package com.android.camera;

import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.SurfaceTexture;
import android.graphics.SurfaceTexture.OnFrameAvailableListener;
import android.opengl.Matrix;
import android.os.Build.VERSION;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Process;
import com.android.camera.effect.FrameBuffer;
import com.android.camera.effect.draw_mode.DrawExtTexAttribute;
import com.android.camera.lib.compatibility.util.CompatibilityUtils;
import com.android.camera.log.Log;
import com.android.camera.module.ModuleManager;
import com.android.camera.ui.Rotatable;
import com.android.camera.ui.drawable.PanoramaArrowAnimateDrawable;
import com.android.gallery3d.ui.BitmapTexture;
import com.android.gallery3d.ui.ExtTexture;
import com.android.gallery3d.ui.GLCanvas;
import com.android.gallery3d.ui.RawTexture;
import com.android.gallery3d.ui.ScreenNail;
import com.mi.config.b;

public abstract class SurfaceTextureScreenNail implements OnFrameAvailableListener, Rotatable, ScreenNail {
    private static final float MOVIE_SOLID_CROPPED_X = (b.fX() ? 0.9f : 0.8f);
    private static final float MOVIE_SOLID_CROPPED_Y;
    private static final String TAG = "STScreenNail";
    private static HandlerThread sFrameListener = new HandlerThread("FrameListener");
    private static int sMaxHighPriorityFrameCount = 8;
    private int currentFrameCount = 0;
    protected RawTexture mAnimTexture;
    protected BitmapTexture mBitmapTexture;
    private int mCameraHeight;
    private int mCameraWidth;
    protected FrameBuffer mCaptureAnimFrameBuffer;
    protected RawTexture mCaptureAnimTexture;
    private int mDisplayOrientation;
    private DrawExtTexAttribute mDrawAttribute = new DrawExtTexAttribute();
    protected ExtTexture mExtTexture;
    protected FrameBuffer mFrameBuffer;
    private boolean mHasTexture = false;
    private int mHeight;
    private boolean mIsFullScreen;
    private boolean mIsRatio16_9 = true;
    protected boolean mModuleSwitching;
    private boolean mNeedCropped;
    private int mRenderHeight;
    protected Rect mRenderLayoutRect = new Rect();
    private int mRenderOffsetX;
    private int mRenderOffsetY;
    private int mRenderWidth;
    private float mScaleX = 1.0f;
    private float mScaleY = 1.0f;
    private SurfaceTextureScreenNailCallback mScreenNailCallback;
    protected boolean mSkipFirstFrame;
    private long mSurfaceCreatedTimestamp;
    protected int mSurfaceHeight;
    private SurfaceTexture mSurfaceTexture;
    protected int mSurfaceWidth;
    private int mTargetRatio = -1;
    protected int mTheight;
    private float[] mTransform = new float[16];
    protected int mTwidth;
    protected int mTx;
    protected int mTy;
    private int mUncroppedRenderHeight;
    private int mUncroppedRenderWidth;
    private boolean mVideoStabilizationCropped;
    private int mWidth;

    public interface SurfaceTextureScreenNailCallback {
        void onSurfaceTextureCreated(SurfaceTexture surfaceTexture);

        void onSurfaceTextureReleased();

        void onSurfaceTextureUpdated(DrawExtTexAttribute drawExtTexAttribute);
    }

    public abstract void noDraw();

    public abstract void onFrameAvailable(SurfaceTexture surfaceTexture);

    public abstract void recycle();

    public abstract void releaseBitmapIfNeeded();

    static {
        float f = 0.8f;
        if (b.fX()) {
            f = 0.9f;
        }
        MOVIE_SOLID_CROPPED_Y = f;
    }

    public SurfaceTextureScreenNail(SurfaceTextureScreenNailCallback surfaceTextureScreenNailCallback) {
        this.mScreenNailCallback = surfaceTextureScreenNailCallback;
    }

    public void acquireSurfaceTexture() {
        synchronized (this) {
            if (this.mHasTexture) {
                return;
            }
            initializePreviewTexture();
            this.mAnimTexture = new RawTexture(this.mWidth / 4, this.mHeight / 4, true);
            this.mCaptureAnimTexture = new RawTexture(Util.LIMIT_SURFACE_WIDTH, (this.mHeight * Util.LIMIT_SURFACE_WIDTH) / this.mWidth, true);
            this.mFrameBuffer = null;
            this.mCaptureAnimFrameBuffer = null;
            synchronized (this) {
                this.mHasTexture = true;
                this.mModuleSwitching = false;
                this.mSkipFirstFrame = false;
            }
        }
    }

    private void initializePreviewTexture() {
        if (this.mExtTexture == null) {
            this.mExtTexture = new ExtTexture();
        }
        this.mExtTexture.setSize(this.mWidth, this.mHeight);
        if (b.gJ() && !sFrameListener.isAlive()) {
            sFrameListener.start();
        }
        if (this.mSurfaceTexture == null) {
            this.mSurfaceTexture = new SurfaceTexture(this.mExtTexture.getId());
        }
        this.mSurfaceCreatedTimestamp = System.currentTimeMillis();
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("setDefaultBufferSize: ");
        stringBuilder.append(this.mWidth);
        stringBuilder.append("x");
        stringBuilder.append(this.mHeight);
        Log.d(str, stringBuilder.toString());
        this.mSurfaceTexture.setDefaultBufferSize(this.mWidth, this.mHeight);
        if (VERSION.SDK_INT < 21 || !b.gJ()) {
            this.mSurfaceTexture.setOnFrameAvailableListener(this);
        } else {
            CompatibilityUtils.setSurfaceTextureOnFrameAvailableListener(this.mSurfaceTexture, this, new Handler(sFrameListener.getLooper()));
            Log.i(TAG, "fullHandlerCapacity:set urgent display");
            Process.setThreadPriority(sFrameListener.getThreadId(), -8);
            this.currentFrameCount = 0;
        }
        if (this.mScreenNailCallback != null) {
            this.mScreenNailCallback.onSurfaceTextureCreated(this.mSurfaceTexture);
        }
    }

    public ExtTexture getExtTexture() {
        return this.mExtTexture;
    }

    public SurfaceTexture getSurfaceTexture() {
        return this.mSurfaceTexture;
    }

    public long getSurfaceCreatedTimestamp() {
        return this.mSurfaceCreatedTimestamp;
    }

    public void releaseSurfaceTexture() {
        synchronized (this) {
            this.mHasTexture = false;
        }
        if (this.mExtTexture != null) {
            this.mExtTexture.recycle();
            this.mExtTexture = null;
        }
        if (this.mSurfaceTexture != null) {
            this.mSurfaceTexture.release();
            this.mSurfaceTexture.setOnFrameAvailableListener(null);
            this.mSurfaceTexture = null;
            this.mSurfaceCreatedTimestamp = 0;
        }
        if (this.mScreenNailCallback != null) {
            this.mScreenNailCallback.onSurfaceTextureReleased();
        }
        if (this.mAnimTexture != null) {
            this.mAnimTexture.recycle();
            this.mAnimTexture = null;
        }
        if (this.mCaptureAnimTexture != null) {
            this.mCaptureAnimTexture.recycle();
            this.mCaptureAnimTexture = null;
        }
        this.mFrameBuffer = null;
        this.mCaptureAnimFrameBuffer = null;
        releaseBitmapIfNeeded();
    }

    private void checkThreadPriority() {
        if (this.currentFrameCount == sMaxHighPriorityFrameCount) {
            Log.i(TAG, "normalHandlerCapacity:set normal");
            Process.setThreadPriority(sFrameListener.getThreadId(), 0);
            this.currentFrameCount++;
        } else if (this.currentFrameCount < sMaxHighPriorityFrameCount) {
            this.currentFrameCount++;
        }
    }

    public int getRenderTargetRatio() {
        return this.mTargetRatio;
    }

    public void setPreviewSize(int i, int i2) {
        if (i > i2) {
            this.mCameraWidth = i2;
            this.mCameraHeight = i;
        } else {
            this.mCameraWidth = i;
            this.mCameraHeight = i2;
        }
        this.mTargetRatio = CameraSettings.getRenderAspectRatio(i, i2);
        computeRatio();
        if (this.mSurfaceTexture != null) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("setDefaultBufferSize: ");
            stringBuilder.append(i);
            stringBuilder.append(" | ");
            stringBuilder.append(i2);
            Log.e(str, stringBuilder.toString());
            this.mSurfaceTexture.setDefaultBufferSize(i, i2);
        }
    }

    public void setDisplayOrientation(int i) {
        this.mDisplayOrientation = i;
    }

    /* JADX WARNING: Removed duplicated region for block: B:38:0x0106  */
    private void computeRatio() {
        /*
        r10 = this;
        r0 = r10.mRenderWidth;
        r1 = r10.mRenderHeight;
        r0 = com.android.camera.CameraSettings.getStrictAspectRatio(r0, r1);
        r1 = 0;
        r2 = 1065353216; // 0x3f800000 float:1.0 double:5.263544247E-315;
        r3 = 1;
        r4 = -1;
        if (r0 > r4) goto L_0x00a7;
    L_0x000f:
        r0 = r10.mCameraWidth;
        r4 = r10.mCameraHeight;
        r5 = r10.mRenderWidth;
        r6 = r10.mRenderHeight;
        r0 = com.android.camera.CameraSettings.isNearAspectRatio(r0, r4, r5, r6);
        if (r0 != 0) goto L_0x001f;
    L_0x001d:
        goto L_0x00a7;
    L_0x001f:
        r0 = r10.mCameraWidth;
        if (r0 == 0) goto L_0x016e;
    L_0x0023:
        r0 = r10.mCameraHeight;
        if (r0 == 0) goto L_0x016e;
    L_0x0027:
        r0 = r10.mRenderWidth;
        if (r0 == 0) goto L_0x007d;
    L_0x002b:
        r0 = r10.mRenderHeight;
        if (r0 == 0) goto L_0x007d;
    L_0x002f:
        r0 = r10.mRenderWidth;
        r4 = r10.mCameraHeight;
        r0 = r0 * r4;
        r4 = r10.mRenderHeight;
        r5 = r10.mCameraWidth;
        r4 = r4 * r5;
        if (r0 == r4) goto L_0x007d;
    L_0x003b:
        r10.mNeedCropped = r3;
        r0 = r10.mCameraWidth;
        r4 = r10.mRenderHeight;
        r0 = r0 * r4;
        r4 = r10.mCameraHeight;
        r5 = r10.mRenderWidth;
        r4 = r4 * r5;
        if (r0 <= r4) goto L_0x0063;
    L_0x0049:
        r0 = r10.mCameraHeight;
        r10.mHeight = r0;
        r0 = r10.mCameraHeight;
        r4 = r10.mRenderWidth;
        r0 = r0 * r4;
        r4 = r10.mRenderHeight;
        r0 = r0 / r4;
        r10.mWidth = r0;
        r0 = r10.mWidth;
        r0 = (float) r0;
        r4 = r10.mCameraWidth;
        r4 = (float) r4;
        r0 = r0 / r4;
        r10.mScaleX = r0;
        r10.mScaleY = r2;
        goto L_0x008b;
    L_0x0063:
        r0 = r10.mCameraWidth;
        r10.mWidth = r0;
        r0 = r10.mCameraWidth;
        r4 = r10.mRenderHeight;
        r0 = r0 * r4;
        r4 = r10.mRenderWidth;
        r0 = r0 / r4;
        r10.mHeight = r0;
        r10.mScaleX = r2;
        r0 = r10.mHeight;
        r0 = (float) r0;
        r2 = r10.mCameraHeight;
        r2 = (float) r2;
        r0 = r0 / r2;
        r10.mScaleY = r0;
        goto L_0x008b;
    L_0x007d:
        r10.mNeedCropped = r1;
        r10.mScaleX = r2;
        r10.mScaleY = r2;
        r0 = r10.mCameraWidth;
        r10.mWidth = r0;
        r0 = r10.mCameraHeight;
        r10.mHeight = r0;
    L_0x008b:
        r0 = r10.mRenderHeight;
        r0 = (float) r0;
        r2 = r10.mRenderWidth;
        r2 = (float) r2;
        r0 = r0 / r2;
        r2 = com.android.camera.Util.sWindowHeight;
        r2 = (float) r2;
        r4 = com.android.camera.Util.sWindowWidth;
        r4 = (float) r4;
        r2 = r2 / r4;
        r0 = r0 - r2;
        r2 = 1036831949; // 0x3dcccccd float:0.1 double:5.122630465E-315;
        r0 = (r0 > r2 ? 1 : (r0 == r2 ? 0 : -1));
        if (r0 >= 0) goto L_0x00a3;
    L_0x00a1:
        r1 = r3;
    L_0x00a3:
        r10.mIsFullScreen = r1;
        goto L_0x016e;
    L_0x00a7:
        r0 = r10.mCameraWidth;
        r4 = r10.mCameraHeight;
        r5 = r10.mTargetRatio;
        r6 = 1098907648; // 0x41800000 float:16.0 double:5.42932517E-315;
        r7 = 1091567616; // 0x41100000 float:9.0 double:5.39306059E-315;
        r8 = 1061158912; // 0x3f400000 float:0.75 double:5.24282163E-315;
        switch(r5) {
            case 0: goto L_0x0115;
            case 1: goto L_0x00cc;
            case 2: goto L_0x00b8;
            default: goto L_0x00b6;
        };
    L_0x00b6:
        goto L_0x0168;
    L_0x00b8:
        r10.mIsFullScreen = r1;
        r10.mIsRatio16_9 = r1;
        r10.mNeedCropped = r3;
        if (r0 == r4) goto L_0x0168;
    L_0x00c0:
        r10.mScaleX = r2;
        r1 = (float) r0;
        r2 = (float) r4;
        r1 = r1 / r2;
        r10.mScaleY = r1;
        r1 = r0;
        goto L_0x0169;
    L_0x00cc:
        r10.mIsRatio16_9 = r3;
        r10.mIsFullScreen = r3;
        r5 = com.android.camera.CameraSettings.isAspectRatio16_9(r0, r4);
        if (r5 != 0) goto L_0x00f8;
    L_0x00d6:
        r10.mNeedCropped = r3;
        r2 = r0 * 16;
        r5 = r4 * 9;
        if (r2 <= r5) goto L_0x00e9;
        r2 = (float) r4;
        r2 = r2 * r7;
        r2 = r2 / r6;
        r2 = (int) r2;
        r5 = (float) r2;
        r0 = (float) r0;
        r5 = r5 / r0;
        r10.mScaleX = r5;
        goto L_0x00ff;
        r2 = (float) r0;
        r2 = r2 * r6;
        r2 = r2 / r7;
        r2 = (int) r2;
        r5 = (float) r2;
        r4 = (float) r4;
        r5 = r5 / r4;
        r10.mScaleY = r5;
        r9 = r2;
        r2 = r0;
        r0 = r9;
        goto L_0x0100;
    L_0x00f8:
        r10.mNeedCropped = r1;
        r10.mScaleX = r2;
        r10.mScaleY = r2;
        r2 = r0;
    L_0x00ff:
        r0 = r4;
    L_0x0100:
        r4 = com.mi.config.b.isPad();
        if (r4 == 0) goto L_0x0112;
    L_0x0106:
        r10.mIsRatio16_9 = r1;
        r10.mNeedCropped = r3;
        r0 = (float) r0;
        r0 = r0 * r8;
        r0 = (int) r0;
        r1 = r10.mScaleY;
        r1 = r1 * r8;
        r10.mScaleY = r1;
    L_0x0112:
        r1 = r0;
        r0 = r2;
        goto L_0x0169;
    L_0x0115:
        r10.mIsFullScreen = r1;
        r10.mIsRatio16_9 = r1;
        r5 = com.android.camera.CameraSettings.isAspectRatio4_3(r0, r4);
        if (r5 != 0) goto L_0x0144;
    L_0x011f:
        r10.mNeedCropped = r3;
        r1 = r0 * 4;
        r2 = r4 * 3;
        if (r1 <= r2) goto L_0x0133;
        r1 = (float) r4;
        r1 = r1 * r8;
        r1 = (int) r1;
        r2 = (float) r1;
        r0 = (float) r0;
        r2 = r2 / r0;
        r10.mScaleX = r2;
        r0 = r1;
        goto L_0x014a;
        r1 = (float) r0;
        r2 = 1082130432; // 0x40800000 float:4.0 double:5.34643471E-315;
        r1 = r1 * r2;
        r2 = 1077936128; // 0x40400000 float:3.0 double:5.325712093E-315;
        r1 = r1 / r2;
        r1 = (int) r1;
        r2 = (float) r1;
        r4 = (float) r4;
        r2 = r2 / r4;
        r10.mScaleY = r2;
        r4 = r1;
        goto L_0x014a;
    L_0x0144:
        r10.mNeedCropped = r1;
        r10.mScaleX = r2;
        r10.mScaleY = r2;
    L_0x014a:
        r1 = com.android.camera.CameraSettings.sCroppedIfNeeded;
        if (r1 == 0) goto L_0x015e;
    L_0x014e:
        r10.mIsFullScreen = r3;
        r10.mNeedCropped = r3;
        r10.mIsRatio16_9 = r3;
        r1 = (float) r0;
        r1 = r1 * r6;
        r1 = r1 / r7;
        r1 = (int) r1;
        r2 = r10.mScaleX;
        r2 = r2 * r8;
        r10.mScaleX = r2;
        goto L_0x015f;
    L_0x015e:
        r1 = r4;
    L_0x015f:
        r2 = com.mi.config.b.isPad();
        if (r2 == 0) goto L_0x0169;
    L_0x0165:
        r10.mIsFullScreen = r3;
        goto L_0x0169;
    L_0x0168:
        r1 = r4;
    L_0x0169:
        r10.mWidth = r0;
        r10.mHeight = r1;
    L_0x016e:
        r10.updateRenderSize();
        r10.updateRenderRect();
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.SurfaceTextureScreenNail.computeRatio():void");
    }

    public void setRenderArea(Rect rect) {
        this.mRenderOffsetX = rect.left;
        this.mRenderOffsetY = rect.top;
        this.mRenderWidth = rect.width();
        this.mRenderHeight = rect.height();
        computeRatio();
    }

    private void updateRenderSize() {
        if (2 != this.mTargetRatio) {
            this.mUncroppedRenderWidth = (int) (((float) this.mRenderWidth) / this.mScaleX);
            this.mUncroppedRenderHeight = (int) (((float) this.mRenderHeight) / this.mScaleY);
            return;
        }
        this.mUncroppedRenderWidth = (int) (((float) this.mRenderWidth) / this.mScaleX);
        this.mUncroppedRenderHeight = (int) (((float) this.mRenderWidth) / this.mScaleY);
    }

    public int getRenderWidth() {
        return this.mUncroppedRenderWidth;
    }

    public int getRenderHeight() {
        return this.mUncroppedRenderHeight;
    }

    public int getWidth() {
        return this.mWidth;
    }

    public int getHeight() {
        return this.mHeight;
    }

    public void draw(GLCanvas gLCanvas) {
        if (this.mSkipFirstFrame) {
            if (this.mSkipFirstFrame) {
                this.mSkipFirstFrame = false;
                this.mSurfaceTexture.updateTexImage();
            }
            return;
        }
        gLCanvas.clearBuffer();
        if (!this.mIsFullScreen || b.fP() || Util.isNotchDevice || Util.isLongRatioScreen) {
            draw(gLCanvas, this.mTx, this.mTy, this.mTwidth, this.mTheight);
        } else {
            draw(gLCanvas, 0, 0, this.mSurfaceWidth, this.mSurfaceHeight);
        }
    }

    public void draw(GLCanvas gLCanvas, int i, int i2, int i3, int i4) {
        synchronized (this) {
            if (this.mHasTexture) {
                if (b.gJ()) {
                    checkThreadPriority();
                }
                gLCanvas.setPreviewSize(this.mWidth, this.mHeight);
                this.mSurfaceTexture.updateTexImage();
                this.mSurfaceTexture.getTransformMatrix(this.mTransform);
                gLCanvas.getState().pushState();
                updateTransformMatrix(this.mTransform);
                updateExtraTransformMatrix(this.mTransform);
                gLCanvas.draw(this.mDrawAttribute.init(this.mExtTexture, this.mTransform, i, i2, i3, i4));
                if (this.mScreenNailCallback != null) {
                    this.mScreenNailCallback.onSurfaceTextureUpdated(this.mDrawAttribute);
                }
                gLCanvas.getState().popState();
                return;
            }
        }
    }

    public void setOrientation(int i, boolean z) {
    }

    public void setVideoStabilizationCropped(boolean z) {
        if (b.fF()) {
            this.mVideoStabilizationCropped = z;
        } else {
            this.mVideoStabilizationCropped = false;
        }
    }

    protected void updateTransformMatrix(float[] fArr) {
        float f;
        float f2;
        int i;
        int i2 = 1;
        if (this.mVideoStabilizationCropped && ModuleManager.isVideoModule()) {
            f = MOVIE_SOLID_CROPPED_X * 1.0f;
            f2 = MOVIE_SOLID_CROPPED_Y * 1.0f;
            i = 1;
        } else {
            f = 1.0f;
            f2 = f;
            i = 0;
        }
        if (this.mNeedCropped) {
            f *= this.mScaleX;
            f2 *= this.mScaleY;
            i = 1;
        }
        if (this.mDisplayOrientation == 0) {
            i2 = i;
        }
        if (i2 != 0) {
            Matrix.translateM(fArr, 0, 0.5f, 0.5f, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO);
            Matrix.rotateM(fArr, 0, (float) this.mDisplayOrientation, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, 1.0f);
            Matrix.scaleM(fArr, 0, f, f2, 1.0f);
            Matrix.translateM(fArr, 0, -0.5f, -0.5f, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO);
        }
    }

    protected void updateExtraTransformMatrix(float[] fArr) {
    }

    protected void updateRenderRect() {
        int i = 0;
        if (this.mTargetRatio == 2) {
            this.mTx = this.mRenderWidth == 0 ? 0 : (this.mRenderOffsetX * this.mSurfaceWidth) / this.mRenderWidth;
            int i2 = (this.mSurfaceHeight - this.mSurfaceWidth) / 2;
            if (this.mRenderHeight != 0) {
                i = (this.mRenderOffsetY * this.mSurfaceHeight) / this.mRenderHeight;
            }
            this.mTy = i2 + i;
            this.mTwidth = this.mSurfaceWidth;
            this.mTheight = this.mSurfaceWidth;
            this.mRenderLayoutRect.set(this.mRenderOffsetX, ((this.mRenderHeight - this.mRenderWidth) / 2) + this.mRenderOffsetY, this.mRenderWidth + this.mRenderOffsetX, (((this.mRenderHeight - this.mRenderWidth) / 2) + this.mRenderOffsetY) + this.mRenderWidth);
            return;
        }
        this.mTx = this.mRenderWidth == 0 ? 0 : (this.mRenderOffsetX * this.mSurfaceWidth) / this.mRenderWidth;
        this.mTy = this.mRenderHeight == 0 ? 0 : (this.mRenderOffsetY * this.mSurfaceHeight) / this.mRenderHeight;
        this.mTwidth = this.mSurfaceWidth;
        this.mTheight = this.mSurfaceHeight;
        this.mRenderLayoutRect.set(0, 0, this.mRenderWidth, this.mRenderHeight);
    }

    public void draw(GLCanvas gLCanvas, RectF rectF, RectF rectF2) {
        throw new UnsupportedOperationException();
    }
}
