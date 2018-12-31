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
    private static final float MOVIE_SOLID_CROPPED_X = (b.ga() ? 0.9f : 0.8f);
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
        if (b.ga()) {
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
        if (b.gM() && !sFrameListener.isAlive()) {
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
        if (VERSION.SDK_INT < 21 || !b.gM()) {
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
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void computeRatio() {
        boolean z = false;
        if (CameraSettings.getStrictAspectRatio(this.mRenderWidth, this.mRenderHeight) > -1 || !CameraSettings.isNearAspectRatio(this.mCameraWidth, this.mCameraHeight, this.mRenderWidth, this.mRenderHeight)) {
            int i;
            int i2 = this.mCameraWidth;
            int i3 = this.mCameraHeight;
            switch (this.mTargetRatio) {
                case 0:
                    this.mIsFullScreen = false;
                    this.mIsRatio16_9 = false;
                    if (CameraSettings.isAspectRatio4_3(i2, i3)) {
                        this.mNeedCropped = false;
                        this.mScaleX = 1.0f;
                        this.mScaleY = 1.0f;
                    } else {
                        this.mNeedCropped = true;
                        if (i2 * 4 > i3 * 3) {
                            i = (int) (((float) i3) * 0.75f);
                            this.mScaleX = ((float) i) / ((float) i2);
                            i2 = i;
                        } else {
                            i = (int) ((((float) i2) * 4.0f) / 3.0f);
                            this.mScaleY = ((float) i) / ((float) i3);
                            i3 = i;
                        }
                    }
                    if (CameraSettings.sCroppedIfNeeded) {
                        this.mIsFullScreen = true;
                        this.mNeedCropped = true;
                        this.mIsRatio16_9 = true;
                        i = (int) ((((float) i2) * 16.0f) / 9.0f);
                        this.mScaleX *= 0.75f;
                    } else {
                        i = i3;
                    }
                    if (b.isPad()) {
                        this.mIsFullScreen = true;
                        break;
                    }
                    break;
                case 1:
                    int i4;
                    this.mIsRatio16_9 = true;
                    this.mIsFullScreen = true;
                    if (!CameraSettings.isAspectRatio16_9(i2, i3)) {
                        this.mNeedCropped = true;
                        if (i2 * 16 <= i3 * 9) {
                            i4 = (int) ((((float) i2) * 16.0f) / 9.0f);
                            this.mScaleY = ((float) i4) / ((float) i3);
                            int i5 = i4;
                            i4 = i2;
                            i2 = i5;
                            if (b.isPad()) {
                                this.mIsRatio16_9 = false;
                                this.mNeedCropped = true;
                                i2 = (int) (((float) i2) * 0.75f);
                                this.mScaleY *= 0.75f;
                            }
                            i = i2;
                            i2 = i4;
                            break;
                        }
                        i4 = (int) ((((float) i3) * 9.0f) / 16.0f);
                        this.mScaleX = ((float) i4) / ((float) i2);
                    } else {
                        this.mNeedCropped = false;
                        this.mScaleX = 1.0f;
                        this.mScaleY = 1.0f;
                        i4 = i2;
                    }
                    i2 = i3;
                    if (b.isPad()) {
                    }
                    i = i2;
                    i2 = i4;
                case 2:
                    this.mIsFullScreen = false;
                    this.mIsRatio16_9 = false;
                    this.mNeedCropped = true;
                    if (i2 != i3) {
                        this.mScaleX = 1.0f;
                        this.mScaleY = ((float) i2) / ((float) i3);
                        i = i2;
                        break;
                    }
                default:
                    i = i3;
                    break;
            }
            this.mWidth = i2;
            this.mHeight = i;
        } else if (!(this.mCameraWidth == 0 || this.mCameraHeight == 0)) {
            if (this.mRenderWidth == 0 || this.mRenderHeight == 0 || this.mRenderWidth * this.mCameraHeight == this.mRenderHeight * this.mCameraWidth) {
                this.mNeedCropped = false;
                this.mScaleX = 1.0f;
                this.mScaleY = 1.0f;
                this.mWidth = this.mCameraWidth;
                this.mHeight = this.mCameraHeight;
            } else {
                this.mNeedCropped = true;
                if (this.mCameraWidth * this.mRenderHeight > this.mCameraHeight * this.mRenderWidth) {
                    this.mHeight = this.mCameraHeight;
                    this.mWidth = (this.mCameraHeight * this.mRenderWidth) / this.mRenderHeight;
                    this.mScaleX = ((float) this.mWidth) / ((float) this.mCameraWidth);
                    this.mScaleY = 1.0f;
                } else {
                    this.mWidth = this.mCameraWidth;
                    this.mHeight = (this.mCameraWidth * this.mRenderHeight) / this.mRenderWidth;
                    this.mScaleX = 1.0f;
                    this.mScaleY = ((float) this.mHeight) / ((float) this.mCameraHeight);
                }
            }
            if ((((float) this.mRenderHeight) / ((float) this.mRenderWidth)) - (((float) Util.sWindowHeight) / ((float) Util.sWindowWidth)) < 0.1f) {
                z = true;
            }
            this.mIsFullScreen = z;
        }
        updateRenderSize();
        updateRenderRect();
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
        if (!this.mIsFullScreen || b.fS() || Util.isNotchDevice || Util.isLongRatioScreen) {
            draw(gLCanvas, this.mTx, this.mTy, this.mTwidth, this.mTheight);
        } else {
            draw(gLCanvas, 0, 0, this.mSurfaceWidth, this.mSurfaceHeight);
        }
    }

    public void draw(GLCanvas gLCanvas, int i, int i2, int i3, int i4) {
        synchronized (this) {
            if (this.mHasTexture) {
                if (b.gM()) {
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
        if (b.fI()) {
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
