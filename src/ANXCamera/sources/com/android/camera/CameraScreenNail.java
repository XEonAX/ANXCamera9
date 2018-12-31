package com.android.camera;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Rect;
import android.graphics.SurfaceTexture;
import android.opengl.GLES20;
import android.opengl.Matrix;
import android.os.ConditionVariable;
import com.android.camera.SurfaceTextureScreenNail.SurfaceTextureScreenNailCallback;
import com.android.camera.effect.FrameBuffer;
import com.android.camera.effect.draw_mode.DrawBasicTexAttribute;
import com.android.camera.effect.draw_mode.DrawBlurTexAttribute;
import com.android.camera.effect.draw_mode.DrawExtTexAttribute;
import com.android.camera.log.Log;
import com.android.camera.module.ModuleManager;
import com.android.camera.statistic.ScenarioTrackUtil;
import com.android.camera.ui.drawable.PanoramaArrowAnimateDrawable;
import com.android.gallery3d.ui.BitmapTexture;
import com.android.gallery3d.ui.GLCanvas;
import com.android.gallery3d.ui.RawTexture;
import com.mi.config.b;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.nio.Buffer;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.atomic.AtomicBoolean;

public class CameraScreenNail extends SurfaceTextureScreenNail {
    private static final int ANIM_CAPTURE_RUNNING = 12;
    private static final int ANIM_CAPTURE_START = 11;
    private static final int ANIM_MODULE_COPY_TEXTURE = 31;
    private static final int ANIM_MODULE_COPY_TEXTURE_WITH_ALPHA = 37;
    private static final int ANIM_MODULE_DRAW_PREVIEW = 32;
    private static final int ANIM_MODULE_RESUME = 35;
    private static final int ANIM_MODULE_RUNNING = 33;
    private static final int ANIM_MODULE_WAITING_FIRST_FRAME = 34;
    private static final int ANIM_NONE = 0;
    private static final int ANIM_READ_LAST_FRAME_GAUSSIAN = 36;
    private static final int ANIM_SWITCH_COPY_TEXTURE = 21;
    private static final int ANIM_SWITCH_DRAW_PREVIEW = 22;
    private static final int ANIM_SWITCH_RESUME = 25;
    private static final int ANIM_SWITCH_RUNNING = 23;
    private static final int ANIM_SWITCH_WAITING_FIRST_FRAME = 24;
    public static final int FRAME_AVAILABLE_AFTER_CATCH = 4;
    public static final int FRAME_AVAILABLE_ON_CREATE = 1;
    private static final int STATE_HIBERNATE = 14;
    private static final int STATE_READ_PIXELS = 13;
    private static final String TAG = CameraScreenNail.class.getSimpleName();
    private int mAnimState = 0;
    private CaptureAnimManager mCaptureAnimManager = new CaptureAnimManager();
    private boolean mDisableSwitchAnimationOnce;
    private boolean mFirstFrameArrived;
    private AtomicBoolean mFrameAvailableNotified = new AtomicBoolean(false);
    private int mFrameNumber = 0;
    private Bitmap mLastFrameGaussianBitmap;
    private final Object mLock = new Object();
    private SwitchAnimManager mModuleAnimManager = new SwitchAnimManager();
    private NailListener mNailListener;
    private ConditionVariable mReadLastFrameVariable = new ConditionVariable();
    private List<RequestRenderListener> mRequestRenderListeners;
    private SwitchAnimManager mSwitchAnimManager = new SwitchAnimManager();
    private final float[] mTextureTransformMatrix = new float[16];
    private boolean mVisible;

    public interface NailListener extends SurfaceTextureScreenNailCallback {
        int getOrientation();

        boolean isKeptBitmapTexture();

        void onFrameAvailable(int i);

        void onPreviewPixelsRead(byte[] bArr, int i, int i2);

        void onPreviewTextureCopied();
    }

    public interface RequestRenderListener {
        void requestRender();
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface ArrivedType {
    }

    public CameraScreenNail(NailListener nailListener, RequestRenderListener requestRenderListener) {
        super(nailListener);
        this.mNailListener = nailListener;
        this.mRequestRenderListeners = new ArrayList();
        addRequestListener(requestRenderListener);
    }

    public void addRequestListener(RequestRenderListener requestRenderListener) {
        synchronized (this.mLock) {
            this.mRequestRenderListeners.add(requestRenderListener);
        }
    }

    public void removeRequestListener(RequestRenderListener requestRenderListener) {
        synchronized (this.mLock) {
            this.mRequestRenderListeners.remove(requestRenderListener);
        }
    }

    private void postRequestListener() {
        for (RequestRenderListener requestRender : this.mRequestRenderListeners) {
            requestRender.requestRender();
        }
    }

    public void acquireSurfaceTexture() {
        Log.v(TAG, "acquireSurfaceTexture");
        synchronized (this.mLock) {
            this.mFirstFrameArrived = false;
            this.mFrameNumber = 0;
            this.mDisableSwitchAnimationOnce = false;
            super.acquireSurfaceTexture();
        }
    }

    public void releaseSurfaceTexture() {
        synchronized (this.mLock) {
            super.releaseSurfaceTexture();
            this.mAnimState = 0;
            Log.v(TAG, "release: state=NONE");
            this.mFirstFrameArrived = false;
            this.mFrameNumber = 0;
            this.mModuleSwitching = false;
        }
    }

    public void disableSwitchAnimationOnce() {
        this.mDisableSwitchAnimationOnce = true;
    }

    public void animateModuleCopyTexture(boolean z) {
        synchronized (this.mLock) {
            if (this.mAnimTexture == null || this.mFrameAvailableNotified.get()) {
                if (z) {
                    this.mAnimState = 37;
                    Log.v(TAG, "state=MODULE_COPY_TEXTURE_WITH_ALPHA");
                } else {
                    this.mAnimState = 31;
                    Log.v(TAG, "state=MODULE_COPY_TEXTURE");
                }
                postRequestListener();
                return;
            }
        }
    }

    public void readLastFrameGaussian() {
        this.mReadLastFrameVariable.close();
        synchronized (this.mLock) {
            if (!this.mFirstFrameArrived || getSurfaceTexture() == null) {
                Log.d(TAG, "readLastFrameGaussian: not start preview return!!!");
            } else if (this.mAnimTexture == null || this.mFrameAvailableNotified.get()) {
                this.mAnimState = 36;
                postRequestListener();
                Log.d(TAG, "readLastFrameGaussian: state=ANIM_READ_LAST_FRAME_GAUSSIAN start block");
                this.mReadLastFrameVariable.block(50);
                Log.d(TAG, "readLastFrameGaussian: state=ANIM_READ_LAST_FRAME_GAUSSIAN end block");
            }
        }
    }

    public Bitmap getLastFrameGaussianBitmap() {
        return this.mLastFrameGaussianBitmap;
    }

    private void toBlurBitmap(GLCanvas gLCanvas, int i, int i2) {
        if (gLCanvas == null || i <= 0 || i2 <= 0) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("toBlurBitmap: start... canvas = ");
            stringBuilder.append(gLCanvas);
            stringBuilder.append(", size = ");
            stringBuilder.append(i);
            stringBuilder.append("x");
            stringBuilder.append(i2);
            Log.w(str, stringBuilder.toString());
            return;
        }
        long currentTimeMillis = System.currentTimeMillis();
        int width = this.mAnimTexture.getWidth();
        int height = this.mAnimTexture.getHeight();
        int i3 = i * height;
        int i4 = i2 * width;
        if (i3 > i4) {
            height = i4 / i;
        } else {
            width = i3 / i2;
        }
        byte[] readPreviewPixels = readPreviewPixels(gLCanvas, width, height);
        Bitmap createBitmap = Bitmap.createBitmap(width, height, Config.ARGB_8888);
        createBitmap.copyPixelsFromBuffer(ByteBuffer.wrap(readPreviewPixels));
        this.mLastFrameGaussianBitmap = Util.getBlurBitmap(createBitmap);
        String str2 = TAG;
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append("toBlurBitmap: end... mLastFrameGaussianBitmap = ");
        stringBuilder2.append(this.mLastFrameGaussianBitmap);
        stringBuilder2.append(", cost time = ");
        stringBuilder2.append(System.currentTimeMillis() - currentTimeMillis);
        stringBuilder2.append("ms");
        Log.d(str2, stringBuilder2.toString());
    }

    public void clearAnimation() {
        if (this.mAnimState != 0) {
            this.mAnimState = 0;
            this.mSwitchAnimManager.clearAnimation();
            this.mCaptureAnimManager.clearAnimation();
            this.mModuleAnimManager.clearAnimation();
        }
    }

    public void animateSwitchCopyTexture() {
        synchronized (this.mLock) {
            postRequestListener();
            this.mAnimState = 21;
            Log.v(TAG, "state=SWITCH_COPY_TEXTURE");
        }
    }

    public void animateSwitchCameraBefore() {
        synchronized (this.mLock) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("switchBefore: state=");
            stringBuilder.append(this.mAnimState);
            Log.v(str, stringBuilder.toString());
            if (this.mAnimState == 22) {
                this.mAnimState = 23;
                this.mSwitchAnimManager.startAnimation(false);
                postRequestListener();
            }
        }
    }

    public void switchCameraDone() {
        synchronized (this.mLock) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("switchDone: state=");
            stringBuilder.append(this.mAnimState);
            Log.v(str, stringBuilder.toString());
            if (this.mAnimState == 23) {
                this.mAnimState = 24;
            }
        }
    }

    public void animateCapture(int i) {
        synchronized (this.mLock) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("animateCapture: state=");
            stringBuilder.append(this.mAnimState);
            Log.v(str, stringBuilder.toString());
            if (this.mAnimState == 0) {
                this.mCaptureAnimManager.animateHoldAndSlide();
                postRequestListener();
                this.mAnimState = 11;
            }
        }
    }

    public void requestHibernate() {
        synchronized (this.mLock) {
            if (this.mAnimState == 0) {
                this.mAnimState = 14;
                postRequestListener();
            }
        }
    }

    public void requestAwaken() {
        synchronized (this.mLock) {
            if (this.mAnimState == 14) {
                this.mAnimState = 0;
                this.mFirstFrameArrived = false;
                this.mFrameNumber = 0;
            }
        }
    }

    public void requestReadPixels() {
        synchronized (this.mLock) {
            if (this.mAnimState == 0) {
                this.mAnimState = 13;
                postRequestListener();
            }
        }
    }

    public boolean isAnimationRunning() {
        return this.mAnimState != 0;
    }

    public void animateHold(int i) {
        synchronized (this.mLock) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("animateHold: state=");
            stringBuilder.append(this.mAnimState);
            Log.v(str, stringBuilder.toString());
            if (this.mAnimState == 0) {
                this.mCaptureAnimManager.animateHold();
                postRequestListener();
                this.mAnimState = 11;
            }
        }
    }

    public void animateSlide() {
        synchronized (this.mLock) {
            if (this.mAnimState != 12) {
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("Cannot animateSlide outside of animateCapture! Animation state = ");
                stringBuilder.append(this.mAnimState);
                Log.w(str, stringBuilder.toString());
            }
            this.mCaptureAnimManager.animateSlide();
            postRequestListener();
        }
    }

    public void directDraw(GLCanvas gLCanvas, int i, int i2, int i3, int i4) {
        super.draw(gLCanvas, i, i2, i3, i4);
    }

    /* JADX WARNING: Missing block: B:26:0x005d, code:
            r15 = 0;
     */
    /* JADX WARNING: Missing block: B:33:0x00b7, code:
            r8.updateTexImage();
            r15 = 0;
            r0.mSwitchAnimManager.drawPreview(r9, r10, r11, r12, r13, r0.mAnimTexture);
     */
    /* JADX WARNING: Missing block: B:43:0x0124, code:
            if (r0.mAnimState == 23) goto L_0x0182;
     */
    /* JADX WARNING: Missing block: B:45:0x012a, code:
            if (r0.mAnimState == 24) goto L_0x0182;
     */
    /* JADX WARNING: Missing block: B:47:0x012e, code:
            if (r0.mAnimState != 25) goto L_0x0131;
     */
    /* JADX WARNING: Missing block: B:49:0x0135, code:
            if (r0.mAnimState != 12) goto L_0x014c;
     */
    /* JADX WARNING: Missing block: B:51:0x013f, code:
            if (r0.mCaptureAnimManager.drawAnimation(r9, r0.mCaptureAnimTexture) == false) goto L_0x0145;
     */
    /* JADX WARNING: Missing block: B:52:0x0141, code:
            postRequestListener();
     */
    /* JADX WARNING: Missing block: B:53:0x0145, code:
            r0.mAnimState = r15;
            super.draw(r19, r20, r21, r22, r23);
     */
    /* JADX WARNING: Missing block: B:55:0x0152, code:
            if (r0.mAnimState == 33) goto L_0x015e;
     */
    /* JADX WARNING: Missing block: B:57:0x0158, code:
            if (r0.mAnimState == 34) goto L_0x015e;
     */
    /* JADX WARNING: Missing block: B:59:0x015c, code:
            if (r0.mAnimState != 35) goto L_0x01bd;
     */
    /* JADX WARNING: Missing block: B:60:0x015e, code:
            r8.updateTexImage();
            r15 = 35;
     */
    /* JADX WARNING: Missing block: B:61:0x0170, code:
            if (r0.mModuleAnimManager.drawAnimation(r9, r10, r11, r12, r13, r0, r0.mAnimTexture) != false) goto L_0x017e;
     */
    /* JADX WARNING: Missing block: B:63:0x0174, code:
            if (r0.mAnimState == r15) goto L_0x0177;
     */
    /* JADX WARNING: Missing block: B:64:0x0177, code:
            r0.mAnimState = 0;
            super.draw(r19, r20, r21, r22, r23);
     */
    /* JADX WARNING: Missing block: B:65:0x017e, code:
            postRequestListener();
     */
    /* JADX WARNING: Missing block: B:66:0x0182, code:
            r8.updateTexImage();
     */
    /* JADX WARNING: Missing block: B:67:0x0188, code:
            if (r0.mDisableSwitchAnimationOnce == false) goto L_0x019a;
     */
    /* JADX WARNING: Missing block: B:68:0x018a, code:
            r15 = 25;
            r0.mSwitchAnimManager.drawPreview(r9, r10, r11, r12, r13, r0.mAnimTexture);
            r6 = false;
     */
    /* JADX WARNING: Missing block: B:69:0x019a, code:
            r15 = 25;
            r6 = r0.mSwitchAnimManager.drawAnimation(r9, r10, r11, r12, r13, r0, r0.mAnimTexture);
     */
    /* JADX WARNING: Missing block: B:70:0x01a9, code:
            if (r6 != false) goto L_0x01b9;
     */
    /* JADX WARNING: Missing block: B:72:0x01ad, code:
            if (r0.mAnimState == r15) goto L_0x01b0;
     */
    /* JADX WARNING: Missing block: B:73:0x01b0, code:
            r0.mAnimState = 0;
            r0.mDisableSwitchAnimationOnce = false;
            super.draw(r19, r20, r21, r22, r23);
     */
    /* JADX WARNING: Missing block: B:74:0x01b9, code:
            postRequestListener();
     */
    /* JADX WARNING: Missing block: B:76:0x01be, code:
            return;
     */
    /* JADX WARNING: Missing block: B:81:0x01e5, code:
            return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void draw(GLCanvas gLCanvas, int i, int i2, int i3, int i4) {
        GLCanvas gLCanvas2 = gLCanvas;
        int i5 = i;
        int i6 = i2;
        int i7 = i3;
        int i8 = i4;
        synchronized (this.mLock) {
            boolean z = true;
            if (!this.mVisible) {
                this.mVisible = true;
            }
            int height;
            int i9;
            int i10;
            if (this.mBitmapTexture == null) {
                SurfaceTexture surfaceTexture = getSurfaceTexture();
                if (surfaceTexture != null && (this.mFirstFrameArrived || this.mAnimState != 0)) {
                    int i11;
                    switch (this.mAnimState) {
                        case 0:
                            i11 = 0;
                            super.draw(gLCanvas, i, i2, i3, i4);
                            break;
                        case 11:
                            i11 = 0;
                            super.draw(gLCanvas, i, i2, i3, i4);
                            copyPreviewTexture(gLCanvas2, this.mCaptureAnimTexture, this.mCaptureAnimFrameBuffer);
                            this.mCaptureAnimManager.startAnimation(i5, i6, i7, i8);
                            this.mAnimState = 12;
                            Log.v(TAG, "draw: state=CAPTURE_RUNNING");
                            break;
                        case 13:
                            i11 = 0;
                            super.draw(gLCanvas, i, i2, i3, i4);
                            int width = this.mCaptureAnimTexture.getWidth();
                            height = this.mCaptureAnimTexture.getHeight();
                            i9 = i7 * height;
                            i10 = i8 * width;
                            if (i9 > i10) {
                                height = i10 / i7;
                            } else {
                                width = i9 / i8;
                            }
                            byte[] readPreviewPixels = readPreviewPixels(gLCanvas2, width, height);
                            this.mAnimState = i11;
                            this.mNailListener.onPreviewPixelsRead(readPreviewPixels, width, height);
                            break;
                        case 14:
                            i11 = 0;
                            surfaceTexture.updateTexImage();
                            gLCanvas.clearBuffer();
                            break;
                        case 21:
                            copyPreviewTexture(gLCanvas2, this.mAnimTexture, this.mFrameBuffer);
                            this.mSwitchAnimManager.setReviewDrawingSize(i5, i6, i7, i8);
                            this.mNailListener.onPreviewTextureCopied();
                            this.mAnimState = 22;
                            Log.v(TAG, "draw: state=SWITCH_DRAW_PREVIEW");
                            break;
                        case 22:
                            break;
                        case 31:
                        case 37:
                            copyPreviewTexture(gLCanvas2, this.mAnimTexture, this.mFrameBuffer);
                            this.mModuleAnimManager.setReviewDrawingSize(i5, i6, i7, i8);
                            Log.v(TAG, "draw: state=MODULE_DRAW_PREVIEW");
                            if (this.mAnimState != 37) {
                                z = false;
                            }
                            this.mAnimState = 33;
                            this.mModuleAnimManager.startAnimation(z);
                            postRequestListener();
                            break;
                        case 36:
                            super.draw(gLCanvas, i, i2, i3, i4);
                            Log.v(TAG, "draw: state=ANIM_READ_LAST_FRAME_GAUSSIAN");
                            toBlurBitmap(gLCanvas2, i7, i8);
                            this.mAnimState = 0;
                            this.mReadLastFrameVariable.open();
                            break;
                    }
                }
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("draw: firstFrame=");
                stringBuilder.append(this.mFirstFrameArrived);
                stringBuilder.append(" surface=");
                stringBuilder.append(surfaceTexture);
                Log.w(str, stringBuilder.toString());
                if (surfaceTexture != null) {
                    surfaceTexture.updateTexImage();
                }
            } else {
                int i12;
                if (ModuleManager.isSquareModule()) {
                    if (i7 > i8) {
                        height = ((i7 - i8) / 2) + i5;
                        i9 = i6;
                        i10 = i8;
                    } else {
                        i9 = ((i8 - i7) / 2) + i6;
                        height = i5;
                        i10 = i7;
                    }
                    i12 = i10;
                } else {
                    height = i5;
                    i9 = i6;
                    i10 = i7;
                    i12 = i8;
                }
                this.mBitmapTexture.draw(gLCanvas2, height, i9, i10, i12);
            }
        }
    }

    private byte[] readPreviewPixels(GLCanvas gLCanvas, int i, int i2) {
        Buffer allocate = ByteBuffer.allocate((i * i2) * 4);
        getSurfaceTexture().getTransformMatrix(this.mTextureTransformMatrix);
        updateTransformMatrix(this.mTextureTransformMatrix);
        if (this.mCaptureAnimFrameBuffer == null) {
            this.mCaptureAnimFrameBuffer = new FrameBuffer(gLCanvas, this.mCaptureAnimTexture, 0);
        }
        gLCanvas.beginBindFrameBuffer(this.mCaptureAnimFrameBuffer);
        gLCanvas.draw(new DrawExtTexAttribute(this.mExtTexture, this.mTextureTransformMatrix, 0, 0, i, i2));
        GLES20.glReadPixels(0, 0, i, i2, 6408, 5121, allocate);
        gLCanvas.endBindFrameBuffer();
        return allocate.array();
    }

    private void copyPreviewTexture(GLCanvas gLCanvas, RawTexture rawTexture, FrameBuffer frameBuffer) {
        int width = rawTexture.getWidth();
        int height = rawTexture.getHeight();
        getSurfaceTexture().getTransformMatrix(this.mTextureTransformMatrix);
        updateTransformMatrix(this.mTextureTransformMatrix);
        if (frameBuffer == null) {
            frameBuffer = new FrameBuffer(gLCanvas, rawTexture, 0);
        }
        gLCanvas.beginBindFrameBuffer(frameBuffer);
        gLCanvas.draw(new DrawExtTexAttribute(this.mExtTexture, this.mTextureTransformMatrix, 0, 0, width, height));
        gLCanvas.endBindFrameBuffer();
    }

    public void drawBlurTexture(GLCanvas gLCanvas, int i, int i2, int i3, int i4) {
        gLCanvas.draw(new DrawBasicTexAttribute(this.mAnimTexture, i, i2, i3, i4));
    }

    public void renderBlurTexture(GLCanvas gLCanvas) {
        renderBlurTexture(gLCanvas, this.mAnimTexture);
    }

    private void renderBlurTexture(GLCanvas gLCanvas, RawTexture rawTexture) {
        int width = rawTexture.getWidth();
        int height = rawTexture.getHeight();
        if (this.mFrameBuffer == null) {
            this.mFrameBuffer = new FrameBuffer(gLCanvas, rawTexture, 0);
        }
        gLCanvas.prepareBlurRenders();
        gLCanvas.beginBindFrameBuffer(this.mFrameBuffer);
        gLCanvas.draw(new DrawBlurTexAttribute(rawTexture, 0, 0, width, height));
        gLCanvas.endBindFrameBuffer();
    }

    public void renderBitmapToCanvas(Bitmap bitmap) {
        this.mVisible = false;
        this.mBitmapTexture = new BitmapTexture(bitmap);
        postRequestListener();
    }

    public void releaseBitmapIfNeeded() {
        if (this.mBitmapTexture != null && !this.mNailListener.isKeptBitmapTexture()) {
            this.mBitmapTexture = null;
            postRequestListener();
        }
    }

    public void noDraw() {
        synchronized (this.mLock) {
            this.mVisible = false;
        }
    }

    public void recycle() {
        synchronized (this.mLock) {
            this.mVisible = false;
        }
    }

    /* JADX WARNING: Missing block: B:25:0x0075, code:
            return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void onFrameAvailable(SurfaceTexture surfaceTexture) {
        if (getSurfaceTexture() != surfaceTexture) {
            Log.e(TAG, "onFrameAvailable: surface changed");
            return;
        }
        synchronized (this.mLock) {
            if (!this.mFirstFrameArrived) {
                Log.d(TAG, "onFrameAvailable first frame arrived.");
                if (this.mFrameNumber < CameraSettings.getSkipFrameNumber()) {
                    this.mFrameNumber++;
                    postRequestListener();
                    return;
                }
                ScenarioTrackUtil.trackSwitchCameraEnd();
                ScenarioTrackUtil.trackSwitchModeEnd();
                notifyFrameAvailable(1);
                this.mVisible = true;
                this.mFirstFrameArrived = true;
            }
            if (this.mVisible) {
                if (this.mAnimState == 24) {
                    this.mAnimState = 25;
                    Log.v(TAG, "SWITCH_WAITING_FIRST_FRAME->SWITCH_RESUME");
                    this.mSwitchAnimManager.startResume();
                } else if (this.mAnimState == 34) {
                    this.mAnimState = 35;
                    Log.v(TAG, "MODULE_WAITING_FIRST_FRAME->MODULE_RESUME");
                    this.mModuleAnimManager.startResume();
                }
                postRequestListener();
                notifyFrameAvailable(4);
            }
        }
    }

    public void setPreviewFrameLayoutSize(int i, int i2) {
        synchronized (this.mLock) {
            Log.d(TAG, String.format(Locale.ENGLISH, "setPreviewFrameLayoutSize: %dx%d", new Object[]{Integer.valueOf(i), Integer.valueOf(i2)}));
            this.mSurfaceWidth = !b.gH() ? i : Util.LIMIT_SURFACE_WIDTH;
            if (b.gH()) {
                i2 = (Util.LIMIT_SURFACE_WIDTH * i2) / i;
            }
            this.mSurfaceHeight = i2;
            this.mSwitchAnimManager.setPreviewFrameLayoutSize(this.mSurfaceWidth, this.mSurfaceHeight);
            updateRenderRect();
        }
    }

    protected void updateExtraTransformMatrix(float[] fArr) {
        float extScaleX;
        float extScaleY;
        if (this.mAnimState == 23 || this.mAnimState == 24 || this.mAnimState == 25) {
            extScaleX = this.mSwitchAnimManager.getExtScaleX();
            extScaleY = this.mSwitchAnimManager.getExtScaleY();
        } else {
            extScaleX = 1.0f;
            extScaleY = extScaleX;
        }
        if (extScaleX != 1.0f || extScaleY != 1.0f) {
            Matrix.translateM(fArr, 0, 0.5f, 0.5f, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO);
            Matrix.scaleM(fArr, 0, extScaleX, extScaleY, 1.0f);
            Matrix.translateM(fArr, 0, -0.5f, -0.5f, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO);
        }
    }

    public Rect getRenderRect() {
        return this.mRenderLayoutRect;
    }

    public void resetFrameAvailableFlag() {
        this.mFrameAvailableNotified.set(false);
        synchronized (this.mLock) {
            this.mFirstFrameArrived = false;
            this.mFrameNumber = 0;
        }
    }

    public boolean getFrameAvailableFlag() {
        return this.mFrameAvailableNotified.get();
    }

    private void notifyFrameAvailable(int i) {
        if (!this.mFrameAvailableNotified.get()) {
            this.mFrameAvailableNotified.set(true);
            this.mNailListener.onFrameAvailable(i);
        }
    }
}
