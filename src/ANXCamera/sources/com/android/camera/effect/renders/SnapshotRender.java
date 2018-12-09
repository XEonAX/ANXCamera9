package com.android.camera.effect.renders;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.os.ConditionVariable;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import com.android.camera.CameraSettings;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.effect.FilterInfo;
import com.android.camera.effect.FrameBuffer;
import com.android.camera.effect.SnapshotCanvas;
import com.android.camera.effect.draw_mode.DrawBasicTexAttribute;
import com.android.camera.effect.draw_mode.DrawYuvAttribute;
import com.android.camera.log.Log;
import com.ss.android.ttve.common.TEDefine;
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
        public void drawFaceWaterMarkInfos(int r13, int r14, int r15, int r16, int r17, java.util.List<com.android.camera.watermark.WaterMarkData> r18) {
            /*
            r12 = this;
            r0 = r18;
            if (r0 == 0) goto L_0x0049;
        L_0x0004:
            r1 = r18.isEmpty();
            if (r1 == 0) goto L_0x000b;
        L_0x000a:
            goto L_0x0049;
        L_0x000b:
            r1 = com.android.camera.CameraSettings.isAgeGenderAndMagicMirrorWaterOpen();
            if (r1 == 0) goto L_0x0048;
        L_0x0011:
            r1 = new com.android.camera.watermark.WaterMarkBitmap;
            r1.<init>(r0);
            r0 = r1.getWaterMarkData();
            if (r0 == 0) goto L_0x003a;
        L_0x001c:
            r11 = new com.android.camera.effect.renders.AgeGenderAndMagicMirrorWaterMark;
            r3 = r0.getImage();
            r9 = 0;
            r10 = 0;
            r2 = r11;
            r4 = r13;
            r5 = r14;
            r6 = r17;
            r7 = r15;
            r8 = r16;
            r2.<init>(r3, r4, r5, r6, r7, r8, r9, r10);
            r0 = r0.getOrientation();
            r0 = r17 - r0;
            r2 = 0;
            r3 = r12;
            r3.drawWaterMark(r11, r2, r2, r0);
        L_0x003a:
            r1.releaseBitmap();
            r0 = com.android.camera.watermark.WaterMarkBitmap.class;
            r0 = r0.getSimpleName();
            r1 = "Draw age_gender_and_magic_mirror water mark";
            com.android.camera.log.Log.d(r0, r1);
        L_0x0048:
            return;
        L_0x0049:
            return;
            */
            throw new UnsupportedOperationException("Method not decompiled: com.android.camera.effect.renders.SnapshotRender.EGLHandler.drawFaceWaterMarkInfos(int, int, int, int, int, java.util.List):void");
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
        private byte[] applyEffect(com.android.camera.effect.draw_mode.DrawYuvAttribute r25) {
            /*
            r24 = this;
            r7 = r24;
            r8 = r25;
            r0 = r24.getEffectRender(r25);
            if (r0 != 0) goto L_0x0015;
        L_0x000a:
            r0 = com.android.camera.effect.renders.SnapshotRender.TAG;
            r1 = "init render failed";
            com.android.camera.log.Log.w(r0, r1);
            r0 = 0;
            return r0;
        L_0x0015:
            r7.updateRenderParameters(r0, r8);
            r1 = r8.mWidth;
            r2 = r8.mHeight;
            r7.checkFrameBuffer(r1, r2);
            r3 = r7.mGLCanvas;
            r4 = r7.mFrameBuffer;
            r3.beginBindFrameBuffer(r4);
            r3 = java.lang.System.currentTimeMillis();
            android.opengl.GLES20.glFlush();
            r5 = r7.mFrameBuffer;
            r5 = r5.getId();
            r0.setParentFrameBufferId(r5);
            r0.draw(r8);
            r5 = com.android.camera.effect.renders.SnapshotRender.TAG;
            r6 = new java.lang.StringBuilder;
            r6.<init>();
            r9 = "drawTime=";
            r6.append(r9);
            r9 = java.lang.System.currentTimeMillis();
            r9 = r9 - r3;
            r6.append(r9);
            r3 = r6.toString();
            com.android.camera.log.Log.d(r5, r3);
            r0.deleteBuffer();
            r8.mOriginalWidth = r1;
            r8.mOriginalHeight = r2;
            r0 = com.android.camera.module.ModuleManager.isSquareModule();
            if (r0 == 0) goto L_0x0078;
        L_0x0065:
            if (r1 <= r2) goto L_0x0070;
        L_0x0067:
            r1 = r1 - r2;
            r1 = r1 / 2;
            r15 = r1;
            r12 = r2;
            r13 = r12;
            r14 = 0;
            goto L_0x007c;
        L_0x0070:
            r2 = r2 - r1;
            r2 = r2 / 2;
            r12 = r1;
            r13 = r12;
            r14 = r2;
            goto L_0x007b;
        L_0x0078:
            r13 = r1;
            r12 = r2;
            r14 = 0;
        L_0x007b:
            r15 = 0;
        L_0x007c:
            r0 = r8.mApplyWaterMark;
            if (r0 == 0) goto L_0x011f;
        L_0x0080:
            r10 = java.lang.System.currentTimeMillis();
            r5 = r8.mJpegRotation;
            r6 = r8.mTimeWatermark;
            r0 = r7;
            r1 = r15;
            r2 = r14;
            r3 = r13;
            r4 = r12;
            r0.drawWaterMark(r1, r2, r3, r4, r5, r6);
            r1 = r8.mOriginalWidth;
            r2 = r8.mOriginalHeight;
            r3 = r8.mPreviewWidth;
            r4 = r8.mPreviewHeight;
            r5 = r8.mJpegRotation;
            r6 = r25.getWaterInfos();
            r0.drawFaceWaterMarkInfos(r1, r2, r3, r4, r5, r6);
            r0 = com.android.camera.effect.renders.SnapshotRender.TAG;
            r1 = new java.lang.StringBuilder;
            r1.<init>();
            r2 = "watermarkTime=";
            r1.append(r2);
            r2 = java.lang.System.currentTimeMillis();
            r2 = r2 - r10;
            r1.append(r2);
            r1 = r1.toString();
            com.android.camera.log.Log.d(r0, r1);
            r0 = r7.mGLCanvas;
            r0.endBindFrameBuffer();
            r7.checkWatermarkFrameBuffer(r13, r12);
            r0 = r7.mGLCanvas;
            r1 = r7.mWatermarkFrameBuffer;
            r0.beginBindFrameBuffer(r1);
            r0 = java.lang.System.currentTimeMillis();
            r2 = com.android.camera.effect.FilterInfo.FILTER_ID_RGB2YUV;
            r2 = r7.fetchRender(r2);
            r2 = (com.android.camera.effect.renders.RgbToYuvRender) r2;
            r7.updateRenderParameters(r2, r8);
            r3 = r7.mFrameBuffer;
            r3 = r3.getId();
            r2.setParentFrameBufferId(r3);
            r3 = r7.mFrameBuffer;
            r3 = r3.getTexture();
            r17 = r3.getId();
            r3 = (float) r15;
            r4 = (float) r14;
            r5 = (float) r13;
            r6 = (float) r12;
            r22 = 1;
            r16 = r2;
            r18 = r3;
            r19 = r4;
            r20 = r5;
            r21 = r6;
            r16.drawTexture(r17, r18, r19, r20, r21, r22);
            r2 = com.android.camera.effect.renders.SnapshotRender.TAG;
            r3 = new java.lang.StringBuilder;
            r3.<init>();
            r4 = "rgb2YuvTime=";
            r3.append(r4);
            r4 = java.lang.System.currentTimeMillis();
            r4 = r4 - r0;
            r3.append(r4);
            r0 = r3.toString();
            com.android.camera.log.Log.d(r2, r0);
        L_0x011f:
            r0 = 3333; // 0xd05 float:4.67E-42 double:1.6467E-320;
            r1 = 1;
            android.opengl.GLES20.glPixelStorei(r0, r1);
            r0 = java.lang.System.currentTimeMillis();
            r2 = r13 - r15;
            r3 = r12 - r14;
            r4 = r2 * r3;
            r5 = r4 * 3;
            r5 = r5 / 2;
            r5 = java.nio.ByteBuffer.allocate(r5);
            r2 = r2 / 2;
            r3 = r3 * 3;
            r3 = r3 / 4;
            r6 = 6408; // 0x1908 float:8.98E-42 double:3.166E-320;
            r16 = 5121; // 0x1401 float:7.176E-42 double:2.53E-320;
            r10 = r15;
            r11 = r14;
            r9 = r12;
            r12 = r2;
            r2 = r13;
            r13 = r3;
            r3 = r14;
            r14 = r6;
            r6 = r15;
            r15 = r16;
            r16 = r5;
            android.opengl.GLES20.glReadPixels(r10, r11, r12, r13, r14, r15, r16);
            r5.rewind();
            r10 = com.android.camera.effect.renders.SnapshotRender.TAG;
            r11 = new java.lang.StringBuilder;
            r11.<init>();
            r12 = "readSize=";
            r11.append(r12);
            r11.append(r2);
            r2 = "x";
            r11.append(r2);
            r11.append(r9);
            r2 = " offset=";
            r11.append(r2);
            r11.append(r6);
            r2 = "x";
            r11.append(r2);
            r11.append(r3);
            r2 = r11.toString();
            com.android.camera.log.Log.d(r10, r2);
            r2 = com.android.camera.effect.renders.SnapshotRender.TAG;
            r3 = new java.lang.StringBuilder;
            r3.<init>();
            r6 = "readTime=";
            r3.append(r6);
            r9 = java.lang.System.currentTimeMillis();
            r9 = r9 - r0;
            r3.append(r9);
            r0 = r3.toString();
            com.android.camera.log.Log.d(r2, r0);
            r0 = java.lang.System.currentTimeMillis();
            r2 = r5.array();
            r3 = r8.mYBuffer;
            r3.rewind();
            r3 = r8.mYBuffer;
            r6 = 0;
            r3.put(r2, r6, r4);
            r3 = r8.mYBuffer;
            r3.rewind();
            r3 = r4 / 2;
            r6 = r8.mUVBuffer;
            r6 = r6.remaining();
            r3 = java.lang.Math.min(r3, r6);
            r6 = r8.mUVBuffer;
            r6.rewind();
            r6 = r8.mUVBuffer;
            r6.put(r2, r4, r3);
            r2 = r8.mUVBuffer;
            r2.rewind();
            r2 = com.android.camera.effect.renders.SnapshotRender.TAG;
            r3 = new java.lang.StringBuilder;
            r3.<init>();
            r4 = "convertTime=";
            r3.append(r4);
            r8 = java.lang.System.currentTimeMillis();
            r8 = r8 - r0;
            r3.append(r8);
            r0 = r3.toString();
            com.android.camera.log.Log.d(r2, r0);
            r0 = r7.mGLCanvas;
            r0.endBindFrameBuffer();
            r0 = r7.mGLCanvas;
            r0.recycledResources();
            r0 = r5.array();
            return r0;
            */
            throw new UnsupportedOperationException("Method not decompiled: com.android.camera.effect.renders.SnapshotRender.EGLHandler.applyEffect(com.android.camera.effect.draw_mode.DrawYuvAttribute):byte[]");
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
