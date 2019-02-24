package com.android.camera.effect.renders;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.media.Image.Plane;
import android.opengl.GLES20;
import android.os.ConditionVariable;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import android.support.annotation.NonNull;
import android.util.Size;
import com.android.camera.CameraAppImpl;
import com.android.camera.CameraSettings;
import com.android.camera.Util;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.runing.ComponentRunningTiltValue;
import com.android.camera.effect.FilterInfo;
import com.android.camera.effect.FrameBuffer;
import com.android.camera.effect.MiYuvImage;
import com.android.camera.effect.SnapshotCanvas;
import com.android.camera.effect.draw_mode.DrawAttribute;
import com.android.camera.effect.draw_mode.DrawBasicTexAttribute;
import com.android.camera.effect.draw_mode.DrawYuvAttribute;
import com.android.camera.log.Log;
import com.android.camera.module.ModuleManager;
import com.android.camera.ui.drawable.PanoramaArrowAnimateDrawable;
import com.android.camera.watermark.WaterMarkBitmap;
import com.android.camera.watermark.WaterMarkData;
import com.ss.android.ttve.common.TEDefine;
import com.xiaomi.camera.base.ImageUtil;
import java.io.File;
import java.io.FileInputStream;
import java.nio.Buffer;
import java.nio.ByteBuffer;
import java.util.List;
import java.util.Locale;
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
    private Bitmap m48MCameraWaterMarkBitmap;
    private String mCurrentCustomWaterMarkText;
    private Bitmap mDualCameraWaterMarkBitmap;
    private DualWatermarkParam mDualCameraWaterMarkParam;
    private EGL10 mEgl;
    private EGLConfig mEglConfig;
    private EGLContext mEglContext;
    private EGLDisplay mEglDisplay;
    private EGLHandler mEglHandler;
    private EGLSurface mEglSurface;
    private HandlerThread mEglThread;
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
                    Size size = (Size) message.obj;
                    this.mGLCanvas.setSize(size.getWidth(), size.getHeight());
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
                this.mGLCanvas.getState().rotate((float) (-i3), PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, 1.0f);
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
            if (SnapshotRender.this.mDualCameraWaterMarkBitmap != null && SnapshotRender.this.mDualCameraWaterMarkParam.isDualWatermarkEnable()) {
                if (!(SnapshotRender.this.mCurrentCustomWaterMarkText == null || SnapshotRender.this.mCurrentCustomWaterMarkText.equals(CameraSettings.getCustomWatermark()))) {
                    SnapshotRender.this.mCurrentCustomWaterMarkText = CameraSettings.getCustomWatermark();
                    SnapshotRender.this.mDualCameraWaterMarkBitmap = SnapshotRender.this.loadCameraWatermark(CameraAppImpl.getAndroidContext());
                }
                Bitmap access$1100 = SnapshotRender.this.mDualCameraWaterMarkBitmap;
                boolean equals = CameraSettings.getCustomWatermark().equals(CameraSettings.getDefaultWatermarkStr());
                Object obj = (CameraSettings.isUltraPixelPhotographyOn() || CameraSettings.isRearMenuUltraPixelPhotographyOn()) ? 1 : null;
                if (obj != null && equals) {
                    if (SnapshotRender.this.m48MCameraWaterMarkBitmap == null) {
                        SnapshotRender.this.m48MCameraWaterMarkBitmap = SnapshotRender.this.load48MWatermark(CameraAppImpl.getAndroidContext());
                    }
                    if (SnapshotRender.this.m48MCameraWaterMarkBitmap != null) {
                        access$1100 = SnapshotRender.this.m48MCameraWaterMarkBitmap;
                    }
                }
                drawWaterMark(new ImageWaterMark(access$1100, i3, i4, i5, SnapshotRender.this.mDualCameraWaterMarkParam.getSize(), SnapshotRender.this.mDualCameraWaterMarkParam.getPaddingX(), SnapshotRender.this.mDualCameraWaterMarkParam.getPaddingY()), i, i2, i5);
            }
        }

        /* JADX WARNING: Missing block: B:10:0x004f, code:
            return;
     */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        public void drawFaceWaterMarkInfos(Size size, Size size2, int i, List<WaterMarkData> list) {
            if (!(list == null || list.isEmpty() || !CameraSettings.isAgeGenderAndMagicMirrorWaterOpen())) {
                WaterMarkBitmap waterMarkBitmap = new WaterMarkBitmap(list);
                WaterMarkData waterMarkData = waterMarkBitmap.getWaterMarkData();
                if (waterMarkData != null) {
                    drawWaterMark(new AgeGenderAndMagicMirrorWaterMark(waterMarkData.getImage(), size.getWidth(), size.getHeight(), i, size2.getWidth(), size2.getHeight(), PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO), 0, 0, i - waterMarkData.getOrientation());
                }
                waterMarkBitmap.releaseBitmap();
                Log.d(WaterMarkBitmap.class.getSimpleName(), "Draw age_gender_and_magic_mirror water mark");
            }
        }

        private void updateRenderParameters(Render render, DrawYuvAttribute drawYuvAttribute) {
            if (render instanceof PipeRender) {
                ((PipeRender) render).setFrameBufferSize(drawYuvAttribute.mPictureSize.getWidth(), drawYuvAttribute.mPictureSize.getHeight());
            }
            render.setViewportSize(drawYuvAttribute.mPictureSize.getWidth(), drawYuvAttribute.mPictureSize.getHeight());
            render.setPreviewSize(drawYuvAttribute.mPreviewSize.getWidth(), drawYuvAttribute.mPreviewSize.getHeight());
            render.setEffectRangeAttribute(drawYuvAttribute.mAttribute);
            render.setMirror(drawYuvAttribute.mMirror);
            render.setSnapshotSize(drawYuvAttribute.mPictureSize.getWidth(), drawYuvAttribute.mPictureSize.getHeight());
            render.setOrientation(drawYuvAttribute.mOrientation);
            render.setShootRotation(drawYuvAttribute.mShootRotation);
            render.setJpegOrientation(drawYuvAttribute.mJpegRotation);
        }

        /* JADX WARNING: Removed duplicated region for block: B:43:0x01f1  */
        /* JADX WARNING: Removed duplicated region for block: B:54:0x02b6  */
        /* JADX WARNING: Removed duplicated region for block: B:56:0x02bf  */
        /* JADX WARNING: Removed duplicated region for block: B:59:0x0345  */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        private byte[] applyEffect(DrawYuvAttribute drawYuvAttribute) {
            DrawAttribute drawAttribute = drawYuvAttribute;
            Render effectRender = getEffectRender(drawYuvAttribute);
            if (effectRender == null) {
                Log.w(SnapshotRender.TAG, "init render failed");
                return null;
            }
            Render render;
            int i;
            int i2;
            int i3;
            DrawAttribute drawAttribute2;
            byte[] bArr;
            int[] iArr;
            boolean z;
            int i4;
            int i5;
            int i6;
            StringBuilder stringBuilder;
            long currentTimeMillis;
            Buffer allocate;
            String access$600;
            byte[] array;
            int width = drawAttribute.mPictureSize.getWidth();
            int height = drawAttribute.mPictureSize.getHeight();
            long currentTimeMillis2 = System.currentTimeMillis();
            Plane plane = drawAttribute.mImage.getPlanes()[0];
            Plane plane2 = drawAttribute.mImage.getPlanes()[1];
            int rowStride = plane.getRowStride();
            int rowStride2 = plane2.getRowStride();
            String access$6002 = SnapshotRender.TAG;
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("plane0 stride =  ");
            stringBuilder2.append(plane.getRowStride());
            stringBuilder2.append(", plane1 stride = ");
            stringBuilder2.append(plane2.getRowStride());
            Log.d(access$6002, stringBuilder2.toString());
            if (drawAttribute.mEffectIndex != FilterInfo.FILTER_ID_NONE || CameraSettings.isAgeGenderAndMagicMirrorWaterOpen() || ModuleManager.isSquareModule() || CameraSettings.isGradienterOn() || CameraSettings.isTiltShiftOn() || (!drawAttribute.mApplyWaterMark && drawAttribute.mTimeWatermark == null)) {
                render = effectRender;
                i = width;
                i2 = height;
                i3 = rowStride;
                drawAttribute2 = drawAttribute;
                bArr = null;
                iArr = bArr;
                z = false;
            } else {
                int[] watermarkRange = Util.getWatermarkRange(drawAttribute.mPictureSize.getWidth(), drawAttribute.mPictureSize.getHeight(), (drawAttribute.mJpegRotation + 270) % 360, drawAttribute.mApplyWaterMark, drawAttribute.mTimeWatermark != null, 0.1f);
                byte[] yuvData = ImageUtil.getYuvData(drawAttribute.mImage);
                if (rowStride != drawAttribute.mPictureSize.getWidth()) {
                    watermarkRange[2] = watermarkRange[2] - 4;
                }
                i3 = rowStride;
                MiYuvImage subYuvImage = Util.getSubYuvImage(yuvData, width, height, rowStride, rowStride2, watermarkRange);
                String access$6003 = SnapshotRender.TAG;
                StringBuilder stringBuilder3 = new StringBuilder();
                stringBuilder3.append("get sub range data spend total tome =");
                stringBuilder3.append(System.currentTimeMillis() - currentTimeMillis2);
                Log.d(access$6003, stringBuilder3.toString());
                int[] iArr2 = watermarkRange;
                i = width;
                i2 = height;
                render = effectRender;
                MiYuvImage miYuvImage = subYuvImage;
                DrawAttribute drawYuvAttribute2 = new DrawYuvAttribute(drawAttribute.mImage, drawAttribute.mPreviewSize, new Size(watermarkRange[2], watermarkRange[3]), drawAttribute.mEffectIndex, drawAttribute.mOrientation, drawAttribute.mJpegRotation, drawAttribute.mShootRotation, drawAttribute.mDate, drawAttribute.mMirror, drawAttribute.mApplyWaterMark, drawAttribute.mIsGradienterOn, drawAttribute.mTiltShiftMode, drawAttribute.mTimeWatermark, drawAttribute.mAttribute, drawAttribute.mWaterInfos);
                drawYuvAttribute2.mYuvImage = miYuvImage;
                drawAttribute2 = drawYuvAttribute2;
                bArr = yuvData;
                iArr = iArr2;
                z = true;
            }
            Render render2 = render;
            updateRenderParameters(render2, drawAttribute2);
            if (z) {
                i4 = iArr[2];
            } else {
                i4 = i;
            }
            if (z) {
                i5 = iArr[3];
            } else {
                i5 = i2;
            }
            checkFrameBuffer(i4, i5);
            this.mGLCanvas.beginBindFrameBuffer(this.mFrameBuffer);
            long currentTimeMillis3 = System.currentTimeMillis();
            GLES20.glFlush();
            render2.setParentFrameBufferId(this.mFrameBuffer.getId());
            render2.draw(drawAttribute2);
            String access$6004 = SnapshotRender.TAG;
            StringBuilder stringBuilder4 = new StringBuilder();
            stringBuilder4.append("drawTime=");
            stringBuilder4.append(System.currentTimeMillis() - currentTimeMillis3);
            Log.d(access$6004, stringBuilder4.toString());
            render2.deleteBuffer();
            int i7 = i;
            int i8 = i2;
            drawAttribute2.mOriginalSize = new Size(i7, i8);
            int i9;
            int i10;
            if (!ModuleManager.isSquareModule()) {
                rowStride = i7;
                i9 = i8;
                i10 = 0;
            } else if (i7 > i8) {
                i6 = (i7 - i8) / 2;
                rowStride = i8;
                i9 = rowStride;
                i10 = 0;
                if (drawAttribute2.mApplyWaterMark) {
                    long currentTimeMillis4 = System.currentTimeMillis();
                    if (z) {
                        i8 = -iArr[1];
                        i7 = -iArr[0];
                    } else {
                        i8 = i10;
                        i7 = i6;
                    }
                    drawWaterMark(i7, i8, rowStride, i9, drawAttribute2.mJpegRotation, drawAttribute2.mTimeWatermark);
                    drawFaceWaterMarkInfos(drawAttribute2.mOriginalSize, drawAttribute2.mPreviewSize, drawAttribute2.mJpegRotation, drawAttribute2.mWaterInfos);
                    String access$6005 = SnapshotRender.TAG;
                    StringBuilder stringBuilder5 = new StringBuilder();
                    stringBuilder5.append("watermarkTime=");
                    stringBuilder5.append(System.currentTimeMillis() - currentTimeMillis4);
                    Log.d(access$6005, stringBuilder5.toString());
                    this.mGLCanvas.endBindFrameBuffer();
                    Size size = z ? new Size(i4, i5) : drawAttribute2.mOriginalSize;
                    checkWatermarkFrameBuffer(size);
                    this.mGLCanvas.beginBindFrameBuffer(this.mWatermarkFrameBuffer);
                    currentTimeMillis3 = System.currentTimeMillis();
                    RgbToYuvRender rgbToYuvRender = (RgbToYuvRender) fetchRender(FilterInfo.FILTER_ID_RGB2YUV);
                    updateRenderParameters(rgbToYuvRender, drawAttribute2);
                    rgbToYuvRender.setParentFrameBufferId(this.mFrameBuffer.getId());
                    rgbToYuvRender.drawTexture(this.mFrameBuffer.getTexture().getId(), (float) PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, (float) PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, (float) size.getWidth(), (float) size.getHeight(), true);
                    access$6005 = SnapshotRender.TAG;
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("rgb2YuvTime=");
                    stringBuilder.append(System.currentTimeMillis() - currentTimeMillis3);
                    Log.d(access$6005, stringBuilder.toString());
                }
                GLES20.glPixelStorei(3333, 1);
                currentTimeMillis = System.currentTimeMillis();
                if (!z) {
                    i4 = drawAttribute2.mOriginalSize.getWidth();
                }
                if (!z) {
                    i5 = drawAttribute2.mOriginalSize.getHeight();
                }
                i8 = (int) Math.ceil(((double) i4) / 2.0d);
                width = (int) Math.ceil((((double) i5) * 3.0d) / 4.0d);
                allocate = ByteBuffer.allocate((i8 * width) * 4);
                GLES20.glReadPixels(0, 0, i8, width, 6408, 5121, allocate);
                allocate.rewind();
                Log.d(SnapshotRender.TAG, String.format(Locale.ENGLISH, "readSize=%dx%d imageSize=%dx%d", new Object[]{Integer.valueOf(i8), Integer.valueOf(width), Integer.valueOf(i4), Integer.valueOf(i5)}));
                access$600 = SnapshotRender.TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("readTime=");
                stringBuilder.append(System.currentTimeMillis() - currentTimeMillis);
                Log.d(access$600, stringBuilder.toString());
                array = allocate.array();
                if (z) {
                    currentTimeMillis = System.currentTimeMillis();
                    Util.coverSubYuvImage(bArr, rowStride, i9, i3, rowStride2, allocate.array(), iArr);
                    access$600 = SnapshotRender.TAG;
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("cover sub range data spend total time =");
                    stringBuilder.append(System.currentTimeMillis() - currentTimeMillis);
                    Log.d(access$600, stringBuilder.toString());
                    array = bArr;
                }
                currentTimeMillis3 = System.currentTimeMillis();
                ImageUtil.updateYuvImage(drawAttribute2.mImage, array, z);
                access$6004 = SnapshotRender.TAG;
                stringBuilder4 = new StringBuilder();
                stringBuilder4.append("updateImageTime=");
                stringBuilder4.append(System.currentTimeMillis() - currentTimeMillis3);
                Log.d(access$6004, stringBuilder4.toString());
                this.mGLCanvas.endBindFrameBuffer();
                this.mGLCanvas.recycledResources();
                return array;
            } else {
                rowStride = i7;
                i9 = rowStride;
                i10 = (i8 - i7) / 2;
            }
            i6 = 0;
            if (drawAttribute2.mApplyWaterMark) {
            }
            GLES20.glPixelStorei(3333, 1);
            currentTimeMillis = System.currentTimeMillis();
            if (z) {
            }
            if (z) {
            }
            i8 = (int) Math.ceil(((double) i4) / 2.0d);
            width = (int) Math.ceil((((double) i5) * 3.0d) / 4.0d);
            allocate = ByteBuffer.allocate((i8 * width) * 4);
            GLES20.glReadPixels(0, 0, i8, width, 6408, 5121, allocate);
            allocate.rewind();
            Log.d(SnapshotRender.TAG, String.format(Locale.ENGLISH, "readSize=%dx%d imageSize=%dx%d", new Object[]{Integer.valueOf(i8), Integer.valueOf(width), Integer.valueOf(i4), Integer.valueOf(i5)}));
            access$600 = SnapshotRender.TAG;
            stringBuilder = new StringBuilder();
            stringBuilder.append("readTime=");
            stringBuilder.append(System.currentTimeMillis() - currentTimeMillis);
            Log.d(access$600, stringBuilder.toString());
            array = allocate.array();
            if (z) {
            }
            currentTimeMillis3 = System.currentTimeMillis();
            ImageUtil.updateYuvImage(drawAttribute2.mImage, array, z);
            access$6004 = SnapshotRender.TAG;
            stringBuilder4 = new StringBuilder();
            stringBuilder4.append("updateImageTime=");
            stringBuilder4.append(System.currentTimeMillis() - currentTimeMillis3);
            Log.d(access$6004, stringBuilder4.toString());
            this.mGLCanvas.endBindFrameBuffer();
            this.mGLCanvas.recycledResources();
            return array;
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
                if (ComponentRunningTiltValue.TILT_CIRCLE.equals(drawYuvAttribute.mTiltShiftMode)) {
                    fetchRender = fetchRender(FilterInfo.FILTER_ID_GAUSSIAN);
                } else if (ComponentRunningTiltValue.TILT_PARALLEL.equals(drawYuvAttribute.mTiltShiftMode)) {
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
            if (this.mFrameBuffer == null || this.mFrameBuffer.getWidth() != i || this.mFrameBuffer.getHeight() != i2) {
                this.mFrameBuffer = new FrameBuffer(this.mGLCanvas, i, i2, 0);
            }
        }

        private void checkWatermarkFrameBuffer(Size size) {
            if (this.mWatermarkFrameBuffer == null || this.mWatermarkFrameBuffer.getWidth() < size.getWidth() || this.mWatermarkFrameBuffer.getHeight() < size.getHeight()) {
                this.mWatermarkFrameBuffer = new FrameBuffer(this.mGLCanvas, size.getWidth(), size.getHeight(), 0);
            }
        }

        private void release() {
            this.mFrameBuffer = null;
            this.mWatermarkFrameBuffer = null;
            this.mGLCanvas.recycledResources();
            this.mGLCanvas = null;
            SnapshotRender.this.destroy();
        }

        public void sendMessageSync(Message message) {
            SnapshotRender.this.mEglThreadBlockVar.close();
            sendMessage(message);
            SnapshotRender.this.mEglThreadBlockVar.block();
        }
    }

    public SnapshotRender(@NonNull Size size) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("SnapshotRender created ");
        stringBuilder.append(this);
        stringBuilder.append("; with size : ");
        stringBuilder.append(size);
        Log.d(str, stringBuilder.toString());
        this.mEglThread = new HandlerThread("SnapshotRender");
        this.mEglThread.start();
        this.mEglHandler = new EGLHandler(this.mEglThread.getLooper());
        this.mEglHandler.sendMessageSync(this.mEglHandler.obtainMessage(0, size));
        this.mRelease = false;
    }

    private Bitmap loadCameraWatermark(Context context) {
        AutoCloseable fileInputStream;
        Throwable th;
        Throwable th2;
        Options options = new Options();
        options.inScaled = false;
        options.inPurgeable = true;
        options.inPremultiplied = false;
        if (!DataRepository.dataItemFeature().fg()) {
            return BitmapFactory.decodeFile(CameraSettings.getDualCameraWaterMarkFilePathVendor(), options);
        }
        File file = new File(context.getFilesDir(), Util.WATERMARK_FILE_NAME);
        if (!file.exists()) {
            Util.generateWatermark2File();
        }
        try {
            fileInputStream = new FileInputStream(file);
            try {
                Bitmap decodeStream = BitmapFactory.decodeStream(fileInputStream, null, options);
                $closeResource(null, fileInputStream);
                return decodeStream;
            } catch (Throwable th22) {
                Throwable th3 = th22;
                th22 = th;
                th = th3;
            }
        } catch (Throwable th4) {
            Log.d(TAG, "Failed to load app camera watermark ", th4);
            return null;
        }
        $closeResource(th22, fileInputStream);
        throw th4;
    }

    private static /* synthetic */ void $closeResource(Throwable th, AutoCloseable autoCloseable) {
        if (th != null) {
            try {
                autoCloseable.close();
                return;
            } catch (Throwable th2) {
                th.addSuppressed(th2);
                return;
            }
        }
        autoCloseable.close();
    }

    private Bitmap load48MWatermark(Context context) {
        AutoCloseable fileInputStream;
        Throwable th;
        Throwable th2;
        Options options = new Options();
        options.inScaled = false;
        options.inPurgeable = true;
        options.inPremultiplied = false;
        if (DataRepository.dataItemFeature().fg()) {
            File file = new File(context.getFilesDir(), Util.WATERMARK_48M_FILE_NAME);
            if (!file.exists()) {
                return Util.generate48MWatermark2File();
            }
            try {
                fileInputStream = new FileInputStream(file);
                try {
                    Bitmap decodeStream = BitmapFactory.decodeStream(fileInputStream, null, options);
                    $closeResource(null, fileInputStream);
                    return decodeStream;
                } catch (Throwable th22) {
                    Throwable th3 = th22;
                    th22 = th;
                    th = th3;
                }
            } catch (Throwable e) {
                Log.d(TAG, "Failed to load app camera watermark ", e);
            }
        }
        return null;
        $closeResource(th22, fileInputStream);
        throw th;
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
            Log.d(TAG, "release: try to release but message is not null, so pending it");
            this.mReleasePending = true;
            return;
        }
        this.mEglHandler.sendEmptyMessage(5);
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

    public void prepareEffectRender(DualWatermarkParam dualWatermarkParam, int i) {
        this.mDualCameraWaterMarkParam = dualWatermarkParam;
        if (dualWatermarkParam.isDualWatermarkEnable() && this.mDualCameraWaterMarkBitmap == null) {
            Options options = new Options();
            options.inScaled = false;
            options.inPurgeable = true;
            options.inPremultiplied = false;
            this.mDualCameraWaterMarkBitmap = loadCameraWatermark(CameraAppImpl.getAndroidContext());
            this.mCurrentCustomWaterMarkText = CameraSettings.getCustomWatermark();
        }
        if (i != FilterInfo.FILTER_ID_NONE) {
            this.mEglHandler.obtainMessage(6, i, 0).sendToTarget();
        }
    }

    private void destroy() {
        this.mRelease = true;
        this.mReleasePending = false;
        this.mEgl.eglDestroySurface(this.mEglDisplay, this.mEglSurface);
        this.mEgl.eglDestroyContext(this.mEglDisplay, this.mEglContext);
        this.mEgl.eglMakeCurrent(this.mEglDisplay, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_CONTEXT);
        this.mEgl.eglTerminate(this.mEglDisplay);
        this.mEglSurface = null;
        this.mEglContext = null;
        this.mEglDisplay = null;
        this.mEglThread.quit();
        if (!(this.mDualCameraWaterMarkBitmap == null || this.mDualCameraWaterMarkBitmap.isRecycled())) {
            this.mDualCameraWaterMarkBitmap.recycle();
            this.mDualCameraWaterMarkBitmap = null;
        }
        System.gc();
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("SnapshotRender released ");
        stringBuilder.append(this);
        Log.d(str, stringBuilder.toString());
    }
}
