package com.android.camera.effect.renders;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.opengl.GLES20;
import android.os.ConditionVariable;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import com.aeonax.camera.R;
import com.android.camera.CameraSettings;
import com.android.camera.Util;
import com.android.camera.effect.FilterInfo;
import com.android.camera.effect.FrameBuffer;
import com.android.camera.effect.SnapshotCanvas;
import com.android.camera.effect.draw_mode.DrawAttribute;
import com.android.camera.effect.draw_mode.DrawBasicTexAttribute;
import com.android.camera.effect.draw_mode.DrawYuvAttribute;
import com.android.camera.log.Log;
import com.android.camera.module.ModuleManager;
import com.android.camera.watermark.WaterMarkBitmap;
import com.android.camera.watermark.WaterMarkData;
import com.ss.android.ttve.common.TEDefine;
import java.nio.Buffer;
import java.nio.ByteBuffer;
import java.util.List;
import javax.microedition.khronos.egl.EGL10;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.egl.EGLContext;
import javax.microedition.khronos.egl.EGLDisplay;
import javax.microedition.khronos.egl.EGLSurface;

public class SnapshotRender {
    private static final int[] CONFIG_SPEC = new int[]{12352, 4, 12324, 8, 12323, 8, 12322, 8, 12344};
    private static final boolean DUMP_TEXTURE = false;
    private static final int EGL_CONTEXT_CLIENT_VERSION = 12440;
    private static final int EGL_OPENGL_ES2_BIT = 4;
    private static final int QUEUE_LIMIT = 7;
    private static final String TAG = SnapshotRender.class.getSimpleName();
    private Bitmap mDualCameraWaterMark;
    private DualWatermarkParam mDualCameraWaterMarkParam;
    private EGL10 mEgl;
    private EGLConfig mEglConfig;
    private EGLContext mEglContext;
    private EGLDisplay mEglDisplay;
    private EGLHandler mEglHandler;
    private EGLSurface mEglSurface;
    private HandlerThread mEglThread = new HandlerThread("SnapshotRender");
    private ConditionVariable mEglThreadBlockVar = new ConditionVariable();
    private volatile int mImageQueueSize = 0;
    private final Object mLock = new Object();
    private boolean mRelease;
    private boolean mReleasePending;

    private class EGLHandler extends Handler implements WatermarkRender {
        public static final int MSG_DRAW_MAIN_ASYNC = 1;
        public static final int MSG_DRAW_MAIN_SYNC = 2;
        public static final int MSG_INIT_EGL_SYNC = 0;
        public static final int MSG_PREPARE_EFFECT_RENDER = 6;
        public static final int MSG_RELEASE = 5;
        private FrameBuffer mFrameBuffer;
        private SnapshotCanvas mGLCanvas;
        private FrameBuffer mWatermarkFrameBuffer;

        public EGLHandler(Looper looper) {
            super(looper);
        }

        public void handleMessage(Message message) {
            switch (message.what) {
                case 0:
                    initEGL();
                    this.mGLCanvas = new SnapshotCanvas();
                    this.mGLCanvas.setSize(message.arg1, message.arg2);
                    SnapshotRender.this.mEglThreadBlockVar.open();
                    return;
                case 1:
                    drawImage((DrawYuvAttribute) message.obj);
                    this.mGLCanvas.recycledResources();
                    if (SnapshotRender.this.mReleasePending && !hasMessages(1)) {
                        release();
                    }
                    synchronized (SnapshotRender.this.mLock) {
                        SnapshotRender.this.mImageQueueSize = SnapshotRender.this.mImageQueueSize - 1;
                    }
                    return;
                case 2:
                    drawImage((DrawYuvAttribute) message.obj);
                    this.mGLCanvas.recycledResources();
                    SnapshotRender.this.mEglThreadBlockVar.open();
                    return;
                case 5:
                    release();
                    return;
                case 6:
                    this.mGLCanvas.prepareEffectRenders(false, message.arg1);
                    return;
                default:
                    return;
            }
        }

        private void initEGL() {
            SnapshotRender.this.mEgl = (EGL10) EGLContext.getEGL();
            SnapshotRender.this.mEglDisplay = SnapshotRender.this.mEgl.eglGetDisplay(EGL10.EGL_DEFAULT_DISPLAY);
            if (SnapshotRender.this.mEglDisplay != EGL10.EGL_NO_DISPLAY) {
                int[] iArr = new int[2];
                if (SnapshotRender.this.mEgl.eglInitialize(SnapshotRender.this.mEglDisplay, iArr)) {
                    String access$600 = SnapshotRender.TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("EGL version: ");
                    stringBuilder.append(iArr[0]);
                    stringBuilder.append('.');
                    stringBuilder.append(iArr[1]);
                    Log.v(access$600, stringBuilder.toString());
                    int[] iArr2 = new int[]{SnapshotRender.EGL_CONTEXT_CLIENT_VERSION, 2, 12344};
                    SnapshotRender.this.mEglConfig = SnapshotRender.chooseConfig(SnapshotRender.this.mEgl, SnapshotRender.this.mEglDisplay);
                    SnapshotRender.this.mEglContext = SnapshotRender.this.mEgl.eglCreateContext(SnapshotRender.this.mEglDisplay, SnapshotRender.this.mEglConfig, EGL10.EGL_NO_CONTEXT, iArr2);
                    if (SnapshotRender.this.mEglContext == null || SnapshotRender.this.mEglContext == EGL10.EGL_NO_CONTEXT) {
                        throw new RuntimeException("failed to createContext");
                    }
                    SnapshotRender.this.mEglSurface = SnapshotRender.this.mEgl.eglCreatePbufferSurface(SnapshotRender.this.mEglDisplay, SnapshotRender.this.mEglConfig, new int[]{12375, Util.sWindowWidth, 12374, Util.sWindowHeight, 12344});
                    if (SnapshotRender.this.mEglSurface == null || SnapshotRender.this.mEglSurface == EGL10.EGL_NO_SURFACE) {
                        throw new RuntimeException("failed to createWindowSurface");
                    } else if (!SnapshotRender.this.mEgl.eglMakeCurrent(SnapshotRender.this.mEglDisplay, SnapshotRender.this.mEglSurface, SnapshotRender.this.mEglSurface, SnapshotRender.this.mEglContext)) {
                        throw new RuntimeException("failed to eglMakeCurrent");
                    } else {
                        return;
                    }
                }
                throw new RuntimeException("eglInitialize failed");
            }
            throw new RuntimeException("eglGetDisplay failed");
        }

        private void drawWaterMark(WaterMark waterMark, int i, int i2, int i3) {
            this.mGLCanvas.getState().pushState();
            if (i3 != 0) {
                this.mGLCanvas.getState().translate((float) (waterMark.getCenterX() + i), (float) (waterMark.getCenterY() + i2));
                this.mGLCanvas.getState().rotate((float) (-i3), 0.0f, 0.0f, 1.0f);
                this.mGLCanvas.getState().translate((float) ((-i) - waterMark.getCenterX()), (float) ((-i2) - waterMark.getCenterY()));
            }
            this.mGLCanvas.getBasicRender().draw(new DrawBasicTexAttribute(waterMark.getTexture(), i + waterMark.getLeft(), i2 + waterMark.getTop(), waterMark.getWidth(), waterMark.getHeight()));
            this.mGLCanvas.getState().popState();
            this.mGLCanvas.deleteTexture(waterMark.getTexture().getId());
        }

        public void drawWaterMark(int i, int i2, int i3, int i4, int i5, String str) {
            if (str != null) {
                drawWaterMark(new NewStyleTextWaterMark(str, i3, i4, i5), i, i2, i5);
            }
            if (CameraSettings.isDualCameraWaterMarkOpen() && SnapshotRender.this.mDualCameraWaterMark != null) {
                drawWaterMark(new ImageWaterMark(SnapshotRender.this.mDualCameraWaterMark, i3, i4, i5, SnapshotRender.this.mDualCameraWaterMarkParam.getSize(), SnapshotRender.this.mDualCameraWaterMarkParam.getPaddingX(), SnapshotRender.this.mDualCameraWaterMarkParam.getPaddingY()), i, i2, i5);
            }
        }

        /* JADX WARNING: Missing block: B:11:0x0049, code:
            return;
     */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        public void drawFaceWaterMarkInfos(int i, int i2, int i3, int i4, int i5, List<WaterMarkData> list) {
            List<WaterMarkData> list2 = list;
            if (!(list2 == null || list.isEmpty() || !CameraSettings.isAgeGenderAndMagicMirrorWaterOpen())) {
                WaterMarkBitmap waterMarkBitmap = new WaterMarkBitmap(list2);
                WaterMarkData waterMarkData = waterMarkBitmap.getWaterMarkData();
                if (waterMarkData != null) {
                    drawWaterMark(new AgeGenderAndMagicMirrorWaterMark(waterMarkData.getImage(), i, i2, i5, i3, i4, 0.0f, 0.0f), 0, 0, i5 - waterMarkData.getOrientation());
                }
                waterMarkBitmap.releaseBitmap();
                Log.d(WaterMarkBitmap.class.getSimpleName(), "Draw age_gender_and_magic_mirror water mark");
            }
        }

        private void updateRenderParameters(Render render, DrawYuvAttribute drawYuvAttribute) {
            if (render instanceof PipeRender) {
                ((PipeRender) render).setFrameBufferSize(drawYuvAttribute.mWidth, drawYuvAttribute.mHeight);
            }
            render.setViewportSize(drawYuvAttribute.mWidth, drawYuvAttribute.mHeight);
            render.setPreviewSize(drawYuvAttribute.mPreviewWidth, drawYuvAttribute.mPreviewHeight);
            render.setEffectRangeAttribute(drawYuvAttribute.mAttribute);
            render.setMirror(drawYuvAttribute.mMirror);
            render.setSnapshotSize(drawYuvAttribute.mWidth, drawYuvAttribute.mHeight);
            render.setOrientation(drawYuvAttribute.mOrientation);
            render.setShootRotation(drawYuvAttribute.mShootRotation);
            render.setJpegOrientation(drawYuvAttribute.mJpegRotation);
        }

        /* JADX WARNING: Removed duplicated region for block: B:13:0x0080  */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        private byte[] applyEffect(DrawYuvAttribute drawYuvAttribute) {
            DrawAttribute drawAttribute = drawYuvAttribute;
            Render effectRender = getEffectRender(drawYuvAttribute);
            if (effectRender == null) {
                Log.w(SnapshotRender.TAG, "init render failed");
                return null;
            }
            int i;
            int i2;
            int i3;
            int i4;
            long currentTimeMillis;
            String access$600;
            StringBuilder stringBuilder;
            int i5;
            int i6;
            Buffer allocate;
            int i7;
            int i8;
            String access$6002;
            StringBuilder stringBuilder2;
            byte[] array;
            updateRenderParameters(effectRender, drawAttribute);
            int i9 = drawAttribute.mWidth;
            int i10 = drawAttribute.mHeight;
            checkFrameBuffer(i9, i10);
            this.mGLCanvas.beginBindFrameBuffer(this.mFrameBuffer);
            long currentTimeMillis2 = System.currentTimeMillis();
            GLES20.glFlush();
            effectRender.setParentFrameBufferId(this.mFrameBuffer.getId());
            effectRender.draw(drawAttribute);
            String access$6003 = SnapshotRender.TAG;
            StringBuilder stringBuilder3 = new StringBuilder();
            stringBuilder3.append("drawTime=");
            stringBuilder3.append(System.currentTimeMillis() - currentTimeMillis2);
            Log.d(access$6003, stringBuilder3.toString());
            effectRender.deleteBuffer();
            drawAttribute.mOriginalWidth = i9;
            drawAttribute.mOriginalHeight = i10;
            if (!ModuleManager.isSquareModule()) {
                i = i9;
                i2 = i10;
                i3 = 0;
            } else if (i9 > i10) {
                i4 = (i9 - i10) / 2;
                i2 = i10;
                i = i2;
                i3 = 0;
                if (drawAttribute.mApplyWaterMark) {
                    long currentTimeMillis3 = System.currentTimeMillis();
                    drawWaterMark(i4, i3, i, i2, drawAttribute.mJpegRotation, drawAttribute.mTimeWatermark);
                    drawFaceWaterMarkInfos(drawAttribute.mOriginalWidth, drawAttribute.mOriginalHeight, drawAttribute.mPreviewWidth, drawAttribute.mPreviewHeight, drawAttribute.mJpegRotation, drawYuvAttribute.getWaterInfos());
                    String access$6004 = SnapshotRender.TAG;
                    StringBuilder stringBuilder4 = new StringBuilder();
                    stringBuilder4.append("watermarkTime=");
                    stringBuilder4.append(System.currentTimeMillis() - currentTimeMillis3);
                    Log.d(access$6004, stringBuilder4.toString());
                    this.mGLCanvas.endBindFrameBuffer();
                    checkWatermarkFrameBuffer(i, i2);
                    this.mGLCanvas.beginBindFrameBuffer(this.mWatermarkFrameBuffer);
                    currentTimeMillis = System.currentTimeMillis();
                    RgbToYuvRender rgbToYuvRender = (RgbToYuvRender) fetchRender(FilterInfo.FILTER_ID_RGB2YUV);
                    updateRenderParameters(rgbToYuvRender, drawAttribute);
                    rgbToYuvRender.setParentFrameBufferId(this.mFrameBuffer.getId());
                    rgbToYuvRender.drawTexture(this.mFrameBuffer.getTexture().getId(), (float) i4, (float) i3, (float) i, (float) i2, true);
                    access$600 = SnapshotRender.TAG;
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("rgb2YuvTime=");
                    stringBuilder.append(System.currentTimeMillis() - currentTimeMillis);
                    Log.d(access$600, stringBuilder.toString());
                }
                GLES20.glPixelStorei(3333, 1);
                currentTimeMillis = System.currentTimeMillis();
                i10 = i - i4;
                i5 = i2 - i3;
                i6 = i10 * i5;
                allocate = ByteBuffer.allocate((i6 * 3) / 2);
                i7 = i2;
                i2 = i10 / 2;
                i10 = i;
                i = (i5 * 3) / 4;
                i5 = i3;
                i8 = i4;
                GLES20.glReadPixels(i4, i3, i2, i, 6408, 5121, allocate);
                allocate.rewind();
                access$6002 = SnapshotRender.TAG;
                stringBuilder2 = new StringBuilder();
                stringBuilder2.append("readSize=");
                stringBuilder2.append(i10);
                stringBuilder2.append("x");
                stringBuilder2.append(i7);
                stringBuilder2.append(" offset=");
                stringBuilder2.append(i8);
                stringBuilder2.append("x");
                stringBuilder2.append(i5);
                Log.d(access$6002, stringBuilder2.toString());
                access$600 = SnapshotRender.TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("readTime=");
                stringBuilder.append(System.currentTimeMillis() - currentTimeMillis);
                Log.d(access$600, stringBuilder.toString());
                currentTimeMillis = System.currentTimeMillis();
                array = allocate.array();
                drawAttribute.mYBuffer.rewind();
                drawAttribute.mYBuffer.put(array, 0, i6);
                drawAttribute.mYBuffer.rewind();
                i5 = Math.min(i6 / 2, drawAttribute.mUVBuffer.remaining());
                drawAttribute.mUVBuffer.rewind();
                drawAttribute.mUVBuffer.put(array, i6, i5);
                drawAttribute.mUVBuffer.rewind();
                access$600 = SnapshotRender.TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("convertTime=");
                stringBuilder.append(System.currentTimeMillis() - currentTimeMillis);
                Log.d(access$600, stringBuilder.toString());
                this.mGLCanvas.endBindFrameBuffer();
                this.mGLCanvas.recycledResources();
                return allocate.array();
            } else {
                i2 = i9;
                i = i2;
                i3 = (i10 - i9) / 2;
            }
            i4 = 0;
            if (drawAttribute.mApplyWaterMark) {
            }
            GLES20.glPixelStorei(3333, 1);
            currentTimeMillis = System.currentTimeMillis();
            i10 = i - i4;
            i5 = i2 - i3;
            i6 = i10 * i5;
            allocate = ByteBuffer.allocate((i6 * 3) / 2);
            i7 = i2;
            i2 = i10 / 2;
            i10 = i;
            i = (i5 * 3) / 4;
            i5 = i3;
            i8 = i4;
            GLES20.glReadPixels(i4, i3, i2, i, 6408, 5121, allocate);
            allocate.rewind();
            access$6002 = SnapshotRender.TAG;
            stringBuilder2 = new StringBuilder();
            stringBuilder2.append("readSize=");
            stringBuilder2.append(i10);
            stringBuilder2.append("x");
            stringBuilder2.append(i7);
            stringBuilder2.append(" offset=");
            stringBuilder2.append(i8);
            stringBuilder2.append("x");
            stringBuilder2.append(i5);
            Log.d(access$6002, stringBuilder2.toString());
            access$600 = SnapshotRender.TAG;
            stringBuilder = new StringBuilder();
            stringBuilder.append("readTime=");
            stringBuilder.append(System.currentTimeMillis() - currentTimeMillis);
            Log.d(access$600, stringBuilder.toString());
            currentTimeMillis = System.currentTimeMillis();
            array = allocate.array();
            drawAttribute.mYBuffer.rewind();
            drawAttribute.mYBuffer.put(array, 0, i6);
            drawAttribute.mYBuffer.rewind();
            i5 = Math.min(i6 / 2, drawAttribute.mUVBuffer.remaining());
            drawAttribute.mUVBuffer.rewind();
            drawAttribute.mUVBuffer.put(array, i6, i5);
            drawAttribute.mUVBuffer.rewind();
            access$600 = SnapshotRender.TAG;
            stringBuilder = new StringBuilder();
            stringBuilder.append("convertTime=");
            stringBuilder.append(System.currentTimeMillis() - currentTimeMillis);
            Log.d(access$600, stringBuilder.toString());
            this.mGLCanvas.endBindFrameBuffer();
            this.mGLCanvas.recycledResources();
            return allocate.array();
        }

        private Render fetchRender(int i) {
            RenderGroup effectRenderGroup = this.mGLCanvas.getEffectRenderGroup();
            Render render = effectRenderGroup.getRender(i);
            if (render != null) {
                return render;
            }
            this.mGLCanvas.prepareEffectRenders(false, i);
            return effectRenderGroup.getRender(i);
        }

        private PipeRender getEffectRender(DrawYuvAttribute drawYuvAttribute) {
            Render fetchRender;
            PipeRender pipeRender = new PipeRender(this.mGLCanvas);
            pipeRender.addRender(fetchRender(FilterInfo.FILTER_ID_YUV2RGB));
            if (drawYuvAttribute.mEffectIndex != FilterInfo.FILTER_ID_NONE) {
                fetchRender = fetchRender(drawYuvAttribute.mEffectIndex);
                if (fetchRender != null) {
                    pipeRender.addRender(fetchRender);
                }
            }
            if (drawYuvAttribute.mIsGradienterOn) {
                fetchRender = fetchRender(FilterInfo.FILTER_ID_GRADIENTER);
                if (fetchRender != null) {
                    pipeRender.addRender(fetchRender);
                }
            } else if (drawYuvAttribute.mTiltShiftMode != null) {
                fetchRender = null;
                if (drawYuvAttribute.mTiltShiftMode.equals(CameraSettings.getString(R.string.pref_camera_tilt_shift_entryvalue_circle))) {
                    fetchRender = fetchRender(FilterInfo.FILTER_ID_GAUSSIAN);
                } else if (drawYuvAttribute.mTiltShiftMode.equals(CameraSettings.getString(R.string.pref_camera_tilt_shift_entryvalue_parallel))) {
                    fetchRender = fetchRender(FilterInfo.FILTER_ID_TILTSHIFT);
                }
                if (fetchRender != null) {
                    pipeRender.addRender(fetchRender);
                }
            }
            if (!drawYuvAttribute.mApplyWaterMark) {
                pipeRender.addRender(fetchRender(FilterInfo.FILTER_ID_RGB2YUV));
            }
            return pipeRender;
        }

        private boolean drawImage(DrawYuvAttribute drawYuvAttribute) {
            byte[] applyEffect = applyEffect(drawYuvAttribute);
            String access$600 = SnapshotRender.TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("mainLen=");
            stringBuilder.append(applyEffect == null ? TEDefine.FACE_BEAUTY_NULL : Integer.valueOf(applyEffect.length));
            Log.d(access$600, stringBuilder.toString());
            return true;
        }

        private void checkFrameBuffer(int i, int i2) {
            if (this.mFrameBuffer == null || this.mFrameBuffer.getWidth() < i || this.mFrameBuffer.getHeight() < i2) {
                this.mFrameBuffer = null;
                this.mFrameBuffer = new FrameBuffer(this.mGLCanvas, i, i2, 0);
            }
        }

        private void checkWatermarkFrameBuffer(int i, int i2) {
            if (this.mWatermarkFrameBuffer == null || this.mWatermarkFrameBuffer.getWidth() < i || this.mWatermarkFrameBuffer.getHeight() < i2) {
                this.mWatermarkFrameBuffer = null;
                this.mWatermarkFrameBuffer = new FrameBuffer(this.mGLCanvas, i, i2, 0);
            }
        }

        private void release() {
            SnapshotRender.this.mRelease = true;
            SnapshotRender.this.mReleasePending = false;
            SnapshotRender.this.mEgl.eglDestroySurface(SnapshotRender.this.mEglDisplay, SnapshotRender.this.mEglSurface);
            SnapshotRender.this.mEgl.eglDestroyContext(SnapshotRender.this.mEglDisplay, SnapshotRender.this.mEglContext);
            SnapshotRender.this.mEgl.eglMakeCurrent(SnapshotRender.this.mEglDisplay, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_CONTEXT);
            SnapshotRender.this.mEgl.eglTerminate(SnapshotRender.this.mEglDisplay);
            SnapshotRender.this.mEglSurface = null;
            SnapshotRender.this.mEglContext = null;
            SnapshotRender.this.mEglDisplay = null;
            this.mFrameBuffer = null;
            this.mWatermarkFrameBuffer = null;
            System.gc();
            this.mGLCanvas.recycledResources();
            SnapshotRender.this.mEglThread.quit();
            this.mGLCanvas = null;
        }

        public void sendMessageSync(Message message) {
            SnapshotRender.this.mEglThreadBlockVar.close();
            sendMessage(message);
            SnapshotRender.this.mEglThreadBlockVar.block();
        }
    }

    public SnapshotRender(DualWatermarkParam dualWatermarkParam, int i, int i2) {
        this.mEglThread.start();
        this.mEglHandler = new EGLHandler(this.mEglThread.getLooper());
        this.mEglHandler.sendMessageSync(this.mEglHandler.obtainMessage(0, i, i2));
        this.mRelease = false;
        if (CameraSettings.isSupportedDualCameraWaterMark()) {
            Options options = new Options();
            options.inScaled = false;
            options.inPurgeable = true;
            options.inPremultiplied = false;
            this.mDualCameraWaterMarkParam = dualWatermarkParam;
            this.mDualCameraWaterMark = BitmapFactory.decodeFile(dualWatermarkParam.getPath(), options);
        }
    }

    public boolean processImageAsync(DrawYuvAttribute drawYuvAttribute) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("queueSize=");
        stringBuilder.append(this.mImageQueueSize);
        Log.d(str, stringBuilder.toString());
        if (this.mImageQueueSize >= 7) {
            Log.d(TAG, "queueSize is full");
            return false;
        }
        synchronized (this.mLock) {
            this.mImageQueueSize++;
        }
        this.mEglHandler.obtainMessage(1, drawYuvAttribute).sendToTarget();
        return true;
    }

    public void processImageSync(DrawYuvAttribute drawYuvAttribute) {
        this.mEglThreadBlockVar.close();
        this.mEglHandler.obtainMessage(2, drawYuvAttribute).sendToTarget();
        this.mEglThreadBlockVar.block();
    }

    public boolean isRelease() {
        return this.mReleasePending || this.mRelease;
    }

    public void release() {
        if (this.mEglHandler.hasMessages(1)) {
            this.mReleasePending = true;
        } else {
            this.mEglHandler.sendEmptyMessage(5);
        }
    }

    private static EGLConfig chooseConfig(EGL10 egl10, EGLDisplay eGLDisplay) {
        int[] iArr = new int[1];
        if (egl10.eglChooseConfig(eGLDisplay, CONFIG_SPEC, null, 0, iArr)) {
            int i = iArr[0];
            if (i > 0) {
                EGLConfig[] eGLConfigArr = new EGLConfig[i];
                if (egl10.eglChooseConfig(eGLDisplay, CONFIG_SPEC, eGLConfigArr, i, iArr)) {
                    return eGLConfigArr[0];
                }
                throw new IllegalArgumentException("eglChooseConfig#2 failed");
            }
            throw new IllegalArgumentException("No configs match configSpec");
        }
        throw new IllegalArgumentException("eglChooseConfig failed");
    }

    public void prepareEffectRender(int i) {
        this.mEglHandler.obtainMessage(6, i, 0).sendToTarget();
    }
}
