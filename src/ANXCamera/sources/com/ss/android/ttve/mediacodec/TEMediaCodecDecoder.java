package com.ss.android.ttve.mediacodec;

import android.annotation.SuppressLint;
import android.graphics.SurfaceTexture;
import android.graphics.SurfaceTexture.OnFrameAvailableListener;
import android.media.MediaCodec;
import android.media.MediaCodec.BufferInfo;
import android.media.MediaFormat;
import android.opengl.EGL14;
import android.opengl.GLES20;
import android.opengl.Matrix;
import android.os.Build;
import android.os.Build.VERSION;
import android.support.annotation.Keep;
import android.util.Log;
import android.view.Surface;
import com.ss.android.ttve.common.TEEglStateSaver;
import com.ss.android.ttve.common.TESharedContext;
import com.ss.android.ttve.common.TETextureDrawer;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.FloatBuffer;

@Keep
@SuppressLint({"NewApi"})
public class TEMediaCodecDecoder implements OnFrameAvailableListener {
    private static final int ERROR_EOF = -1;
    private static final int ERROR_FAIL = -2;
    private static final int ERROR_OK = 0;
    private static final int ERROR_UNUSUAL = -3;
    private static final String TAG = "MediaCodecDecoder";
    private static final String VIDEO_MIME_TYPE = "video/avc";
    private static final boolean m_verbose = false;
    private final int MAX_DELAY_COUNT = 10;
    private final long MAX_SLEEP_MS = 0;
    private boolean m_bIsNeedReconfigure = false;
    private BufferInfo m_bufferInfo = new BufferInfo();
    private MediaCodec m_decoder = null;
    private boolean m_decoderStarted = false;
    private TEEglStateSaver m_eglStateSaver = null;
    private ByteBuffer m_extraDataBuf = null;
    private MediaFormat m_format = null;
    private boolean m_frameAvailable = false;
    private final Object m_frameSyncObject = new Object();
    private int m_iCurCount = 0;
    private int m_iHeight = 0;
    private int m_iWidth = 0;
    private boolean m_inputBufferQueued = false;
    private int m_pendingInputFrameCount = 0;
    private ByteBuffer m_ppsBuf = null;
    private boolean m_sawInputEOS = false;
    private boolean m_sawOutputEOS = false;
    private TESharedContext m_sharedContext = null;
    private ByteBuffer m_spsBuf = null;
    private Surface m_surface = null;
    private int[] m_surfaceTexID = new int[1];
    private SurfaceTexture m_surfaceTexture = null;
    private TETextureDrawer m_textureDrawer = null;
    private SOES2DTextureRender m_textureRender = null;
    private long m_timestampOfCurTexFrame = Long.MIN_VALUE;
    private long m_timestampOfLastDecodedFrame = Long.MIN_VALUE;

    private static class SOES2DTextureRender {
        private static final int FLOAT_SIZE_BYTES = 4;
        private static final String FRAGMENT_SHADER = "#extension GL_OES_EGL_image_external : require\nprecision mediump float;\nvarying vec2 vTextureCoord;\nuniform samplerExternalOES sTexture;\nvoid main() {\n  gl_FragColor = texture2D(sTexture, vTextureCoord);\n}\n";
        private static final int TRIANGLE_VERTICES_DATA_POS_OFFSET = 0;
        private static final int TRIANGLE_VERTICES_DATA_STRIDE_BYTES = 20;
        private static final int TRIANGLE_VERTICES_DATA_UV_OFFSET = 3;
        private static final String VERTEX_SHADER = "uniform mat4 uMVPMatrix;\nuniform mat4 uSTMatrix;\nattribute vec4 aPosition;\nattribute vec4 aTextureCoord;\nvarying vec2 vTextureCoord;\nvoid main() {\n  gl_Position = uMVPMatrix * aPosition;\n  vTextureCoord = (uSTMatrix * aTextureCoord).xy;\n}\n";
        private float[] mMVPMatrix = new float[16];
        private int mProgram;
        private float[] mSTMatrix = new float[16];
        private FloatBuffer mTriangleVertices = ByteBuffer.allocateDirect(this.mTriangleVerticesData.length * 4).order(ByteOrder.nativeOrder()).asFloatBuffer();
        private final float[] mTriangleVerticesData = new float[]{-1.0f, -1.0f, 0.0f, 0.0f, 0.0f, 1.0f, -1.0f, 0.0f, 1.0f, 0.0f, -1.0f, 1.0f, 0.0f, 0.0f, 1.0f, 1.0f, 1.0f, 0.0f, 1.0f, 1.0f};
        private int maPositionHandle;
        private int maTextureHandle;
        private int[] muFrameBuffer = new int[1];
        private int muMVPMatrixHandle;
        private int muSTMatrixHandle;

        public SOES2DTextureRender(SurfaceTexture surfaceTexture) {
            this.mTriangleVertices.put(this.mTriangleVerticesData).position(0);
            if (surfaceTexture != null) {
                surfaceTexture.getTransformMatrix(this.mSTMatrix);
            } else {
                Matrix.setIdentityM(this.mSTMatrix, 0);
            }
        }

        public void drawFrame(int i, int i2, int i3, int i4) throws IOException {
            GLES20.glViewport(0, 0, i, i2);
            GLES20.glBindTexture(3553, i4);
            checkGlError("glBindTexture");
            GLES20.glBindFramebuffer(36160, this.muFrameBuffer[0]);
            GLES20.glFramebufferTexture2D(36160, 36064, 3553, i4, 0);
            checkGlError("glFramebufferTexture2D");
            checkGlError("onDrawFrame start");
            GLES20.glClearColor(0.0f, 1.0f, 0.0f, 1.0f);
            GLES20.glClear(16640);
            GLES20.glUseProgram(this.mProgram);
            checkGlError("glUseProgram");
            GLES20.glActiveTexture(33984);
            GLES20.glBindTexture(36197, i3);
            checkGlError("glBindTexture");
            this.mTriangleVertices.position(0);
            GLES20.glVertexAttribPointer(this.maPositionHandle, 3, 5126, false, 20, this.mTriangleVertices);
            checkGlError("glVertexAttribPointer maPosition");
            GLES20.glEnableVertexAttribArray(this.maPositionHandle);
            checkGlError("glEnableVertexAttribArray maPositionHandle");
            this.mTriangleVertices.position(3);
            GLES20.glVertexAttribPointer(this.maTextureHandle, 2, 5126, false, 20, this.mTriangleVertices);
            checkGlError("glVertexAttribPointer maTextureHandle");
            GLES20.glEnableVertexAttribArray(this.maTextureHandle);
            checkGlError("glEnableVertexAttribArray maTextureHandle");
            Matrix.setIdentityM(this.mMVPMatrix, 0);
            GLES20.glUniformMatrix4fv(this.muMVPMatrixHandle, 1, false, this.mMVPMatrix, 0);
            GLES20.glUniformMatrix4fv(this.muSTMatrixHandle, 1, false, this.mSTMatrix, 0);
            GLES20.glDrawArrays(5, 0, 4);
            checkGlError("glDrawArrays");
            GLES20.glDisableVertexAttribArray(this.maPositionHandle);
            GLES20.glDisableVertexAttribArray(this.maTextureHandle);
            GLES20.glBindTexture(36197, 0);
            GLES20.glBindTexture(3553, 0);
            GLES20.glFramebufferTexture2D(36160, 36064, 3553, 0, 0);
            GLES20.glBindFramebuffer(36160, 0);
            GLES20.glFinish();
        }

        public void surfaceCreated() {
            this.mProgram = createProgram(VERTEX_SHADER, FRAGMENT_SHADER);
            if (this.mProgram != 0) {
                this.maPositionHandle = GLES20.glGetAttribLocation(this.mProgram, "aPosition");
                checkGlError("glGetAttribLocation aPosition");
                if (this.maPositionHandle != -1) {
                    this.maTextureHandle = GLES20.glGetAttribLocation(this.mProgram, "aTextureCoord");
                    checkGlError("glGetAttribLocation aTextureCoord");
                    if (this.maTextureHandle != -1) {
                        this.muMVPMatrixHandle = GLES20.glGetUniformLocation(this.mProgram, "uMVPMatrix");
                        checkGlError("glGetUniformLocation uMVPMatrix");
                        if (this.muMVPMatrixHandle != -1) {
                            this.muSTMatrixHandle = GLES20.glGetUniformLocation(this.mProgram, "uSTMatrix");
                            checkGlError("glGetUniformLocation uSTMatrix");
                            if (this.muSTMatrixHandle != -1) {
                                GLES20.glGenFramebuffers(1, this.muFrameBuffer, 0);
                                checkGlError("glGenFramebuffers");
                                return;
                            }
                            throw new RuntimeException("Could not get attrib location for uSTMatrix");
                        }
                        throw new RuntimeException("Could not get attrib location for uMVPMatrix");
                    }
                    throw new RuntimeException("Could not get attrib location for aTextureCoord");
                }
                throw new RuntimeException("Could not get attrib location for aPosition");
            }
            throw new RuntimeException("failed creating program");
        }

        public void changeFragmentShader(String str) {
            if (str == null) {
                str = FRAGMENT_SHADER;
            }
            GLES20.glDeleteProgram(this.mProgram);
            this.mProgram = createProgram(VERTEX_SHADER, str);
            if (this.mProgram == 0) {
                throw new RuntimeException("failed creating program");
            }
        }

        private int loadShader(int i, String str) {
            int glCreateShader = GLES20.glCreateShader(i);
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("glCreateShader type=");
            stringBuilder.append(i);
            checkGlError(stringBuilder.toString());
            GLES20.glShaderSource(glCreateShader, str);
            GLES20.glCompileShader(glCreateShader);
            int[] iArr = new int[1];
            GLES20.glGetShaderiv(glCreateShader, 35713, iArr, 0);
            if (iArr[0] != 0) {
                return glCreateShader;
            }
            str = TEMediaCodecDecoder.TAG;
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("Could not compile shader ");
            stringBuilder2.append(i);
            stringBuilder2.append(":");
            Log.e(str, stringBuilder2.toString());
            String str2 = TEMediaCodecDecoder.TAG;
            StringBuilder stringBuilder3 = new StringBuilder();
            stringBuilder3.append(" ");
            stringBuilder3.append(GLES20.glGetShaderInfoLog(glCreateShader));
            Log.e(str2, stringBuilder3.toString());
            GLES20.glDeleteShader(glCreateShader);
            return 0;
        }

        private int createProgram(String str, String str2) {
            int loadShader = loadShader(35633, str);
            int i = 0;
            if (loadShader == 0) {
                return 0;
            }
            int loadShader2 = loadShader(35632, str2);
            if (loadShader2 == 0) {
                return 0;
            }
            int glCreateProgram = GLES20.glCreateProgram();
            checkGlError("glCreateProgram");
            if (glCreateProgram == 0) {
                Log.e(TEMediaCodecDecoder.TAG, "Could not create program");
            }
            GLES20.glAttachShader(glCreateProgram, loadShader);
            checkGlError("glAttachShader");
            GLES20.glAttachShader(glCreateProgram, loadShader2);
            checkGlError("glAttachShader");
            GLES20.glLinkProgram(glCreateProgram);
            int[] iArr = new int[1];
            GLES20.glGetProgramiv(glCreateProgram, 35714, iArr, 0);
            if (iArr[0] != 1) {
                Log.e(TEMediaCodecDecoder.TAG, "Could not link program: ");
                Log.e(TEMediaCodecDecoder.TAG, GLES20.glGetProgramInfoLog(glCreateProgram));
                GLES20.glDeleteProgram(glCreateProgram);
            } else {
                i = glCreateProgram;
            }
            return i;
        }

        public void release() {
            if (this.mProgram != 0) {
                GLES20.glDeleteProgram(this.mProgram);
                this.mProgram = 0;
            }
            if (this.muFrameBuffer[0] != 0) {
                GLES20.glDeleteFramebuffers(1, this.muFrameBuffer, 0);
            }
        }

        public void checkGlError(String str) {
            int glGetError = GLES20.glGetError();
            if (glGetError != 0) {
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append(str);
                stringBuilder.append(": glError ");
                stringBuilder.append(glGetError);
                Log.e(TEMediaCodecDecoder.TAG, stringBuilder.toString());
                StringBuilder stringBuilder2 = new StringBuilder();
                stringBuilder2.append(str);
                stringBuilder2.append(": glError ");
                stringBuilder2.append(glGetError);
                throw new RuntimeException(stringBuilder2.toString());
            }
        }
    }

    public int initDecoder(int i, int i2, byte[] bArr, int i3, byte[] bArr2, int i4) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("width = ");
        stringBuilder.append(i);
        stringBuilder.append(" height = ");
        stringBuilder.append(i2);
        Log.e(str, stringBuilder.toString());
        i = setEncoder(i, i2, bArr, i3, bArr2, i4);
        if (this.m_bIsNeedReconfigure) {
            i = reconfigureMediaFormat();
        }
        if (this.m_eglStateSaver == null) {
            this.m_eglStateSaver = new TEEglStateSaver();
            this.m_eglStateSaver.saveEGLState();
        }
        if (this.m_bIsNeedReconfigure) {
            restartDecoder();
            this.m_bIsNeedReconfigure = false;
        }
        return i;
    }

    public int setEncoder(int i, int i2, byte[] bArr, int i3, byte[] bArr2, int i4) {
        this.m_iWidth = i;
        this.m_iHeight = i2;
        this.m_spsBuf = null;
        this.m_ppsBuf = null;
        if (i3 > 0) {
            this.m_spsBuf = ByteBuffer.wrap(bArr, 0, i3);
        }
        if (i4 > 0) {
            this.m_ppsBuf = ByteBuffer.wrap(bArr2, 0, i4);
        }
        this.m_bIsNeedReconfigure = true;
        return 0;
    }

    public int closeEncoder() {
        stopDecoder();
        if (this.m_textureDrawer != null) {
            this.m_textureDrawer.release();
            this.m_textureDrawer = null;
        }
        deleteTexture();
        return 0;
    }

    public int decodeFrame(byte[] bArr, int i, long j, int i2) throws IOException {
        if (this.m_eglStateSaver == null) {
            this.m_eglStateSaver = new TEEglStateSaver();
            this.m_eglStateSaver.saveEGLState();
        }
        if (!EGL14.eglGetCurrentContext().equals(this.m_eglStateSaver.getSavedEGLContext())) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("eglGetCurrentContext = ");
            stringBuilder.append(EGL14.eglGetCurrentContext());
            stringBuilder.append(" getSavedEGLContext = ");
            stringBuilder.append(this.m_eglStateSaver.getSavedEGLContext());
            Log.e(str, stringBuilder.toString());
            this.m_bIsNeedReconfigure = true;
        }
        if (this.m_bIsNeedReconfigure) {
            restartDecoder();
            this.m_bIsNeedReconfigure = false;
            this.m_eglStateSaver.saveEGLState();
        }
        if (this.m_decoder == null) {
            return -2;
        }
        long currentTimeMillis = System.currentTimeMillis();
        int DecodeFrame2Surface = DecodeFrame2Surface(bArr, i, j);
        long currentTimeMillis2 = 0 - (System.currentTimeMillis() - currentTimeMillis);
        if (this.m_iCurCount < 10 && currentTimeMillis2 > 0) {
            try {
                Thread.sleep(currentTimeMillis2, 0);
                String str2 = TAG;
                StringBuilder stringBuilder2 = new StringBuilder();
                stringBuilder2.append("Sleep ");
                stringBuilder2.append(currentTimeMillis2);
                stringBuilder2.append("ms for delay output!!!");
                Log.e(str2, stringBuilder2.toString());
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            this.m_iCurCount++;
        }
        if (DecodeFrame2Surface == 0) {
            this.m_surfaceTexture.updateTexImage();
            if (this.m_textureRender != null && i2 > 0) {
                this.m_textureRender.drawFrame(this.m_iWidth, this.m_iHeight, this.m_surfaceTexID[0], i2);
            }
        }
        return DecodeFrame2Surface;
    }

    public int getInfoByFlag(int[] iArr, int i) {
        if (i == 1) {
            iArr[0] = (int) (this.m_timestampOfLastDecodedFrame & -1);
            iArr[1] = (int) ((this.m_timestampOfLastDecodedFrame >> 32) & -1);
            return 2;
        } else if (i != 2) {
            return 0;
        } else {
            iArr[0] = (int) (this.m_timestampOfCurTexFrame & -1);
            iArr[1] = (int) ((this.m_timestampOfCurTexFrame >> 32) & -1);
            return 2;
        }
    }

    public int flushDecoder() {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("flushDecoder m_decoder = ");
        stringBuilder.append(this.m_decoder);
        Log.e(str, stringBuilder.toString());
        if (this.m_decoder == null) {
            return -3;
        }
        try {
            if (this.m_sawInputEOS || this.m_sawOutputEOS) {
                CleanupDecoder();
                if (!SetupDecoder(VIDEO_MIME_TYPE)) {
                    return -2;
                }
            } else if (!this.m_inputBufferQueued) {
                return -3;
            } else {
                this.m_decoder.flush();
                this.m_inputBufferQueued = false;
                this.m_pendingInputFrameCount = 0;
            }
            return 0;
        } catch (Exception e) {
            e.printStackTrace();
            return -3;
        }
    }

    private int reconfigureMediaFormat() {
        try {
            this.m_format = MediaFormat.createVideoFormat(VIDEO_MIME_TYPE, this.m_iWidth, this.m_iHeight);
            if (this.m_spsBuf != null) {
                this.m_format.setByteBuffer("csd-0", this.m_spsBuf);
            }
            if (this.m_ppsBuf != null) {
                this.m_format.setByteBuffer("csd-1", this.m_ppsBuf);
            }
            if (VERSION.SDK_INT != 16) {
                return 0;
            }
            this.m_format.setInteger("max-input-size", 0);
            return 0;
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    private int createTexture() {
        GLES20.glGenTextures(1, this.m_surfaceTexID, 0);
        if (this.m_surfaceTexID[0] <= 0) {
            Log.e(TAG, "createTexture failed");
            return 0;
        }
        GLES20.glBindTexture(36197, this.m_surfaceTexID[0]);
        GLES20.glTexParameterf(36197, 10241, 9728.0f);
        GLES20.glTexParameterf(36197, 10240, 9729.0f);
        GLES20.glTexParameteri(36197, 10242, 33071);
        GLES20.glTexParameteri(36197, 10243, 33071);
        return this.m_surfaceTexID[0];
    }

    private void deleteTexture() {
        if (this.m_surfaceTexID[0] != 0) {
            GLES20.glDeleteTextures(1, this.m_surfaceTexID, 0);
            this.m_surfaceTexID[0] = 0;
        }
    }

    public boolean initTextureDrawer() {
        if (this.m_textureDrawer != null) {
            this.m_textureDrawer.release();
            this.m_textureDrawer = null;
        }
        this.m_textureDrawer = TETextureDrawer.create();
        if (this.m_textureDrawer == null) {
            return false;
        }
        this.m_textureDrawer.setRotation(0.0f);
        this.m_textureDrawer.setFlipScale(1.0f, -1.0f);
        return true;
    }

    private int startDecoder() {
        if (IsValid()) {
            Log.e(TAG, "You can't call startDecoder() twice!");
            return -1;
        }
        int i = this.m_surfaceTexID[0];
        if (i == 0) {
            i = createTexture();
        }
        if (i == 0) {
            return -1;
        }
        try {
            this.m_surfaceTexture = new SurfaceTexture(i);
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Surface texture with texture (id=");
            stringBuilder.append(i);
            stringBuilder.append(") has been created.");
            Log.e(str, stringBuilder.toString());
            this.m_surfaceTexture.setOnFrameAvailableListener(this);
            this.m_surface = new Surface(this.m_surfaceTexture);
            this.m_textureRender = new SOES2DTextureRender(this.m_surfaceTexture);
            this.m_textureRender.surfaceCreated();
            if (SetupDecoder(VIDEO_MIME_TYPE)) {
                return 0;
            }
            stopDecoder();
            return -1;
        } catch (Exception e) {
            String str2 = TAG;
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("");
            stringBuilder2.append(e.getMessage());
            Log.e(str2, stringBuilder2.toString());
            e.printStackTrace();
            stopDecoder();
            return -1;
        }
    }

    private int stopDecoder() {
        CleanupDecoder();
        if (this.m_textureRender != null) {
            this.m_textureRender.release();
            this.m_textureRender = null;
        }
        if (this.m_surface != null) {
            this.m_surface.release();
            this.m_surface = null;
        }
        if (this.m_surfaceTexture != null) {
            this.m_surfaceTexture.setOnFrameAvailableListener(null);
            this.m_surfaceTexture.release();
            this.m_surfaceTexture = null;
        }
        return 0;
    }

    private int restartDecoder() {
        stopDecoder();
        return startDecoder();
    }

    public void onFrameAvailable(SurfaceTexture surfaceTexture) {
        synchronized (this.m_frameSyncObject) {
            if (this.m_frameAvailable) {
                Log.e(TAG, "m_frameAvailable already set, frame could be dropped!");
            }
            this.m_frameAvailable = true;
            this.m_frameSyncObject.notifyAll();
        }
    }

    private boolean IsValid() {
        return this.m_decoder != null;
    }

    private boolean SetupDecoder(String str) {
        try {
            this.m_decoder = MediaCodec.createDecoderByType(str);
            this.m_decoder.configure(this.m_format, this.m_surface, null, 0);
            this.m_decoder.start();
            this.m_decoderStarted = true;
            this.m_iCurCount = 0;
            return true;
        } catch (Exception e) {
            String str2 = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("");
            stringBuilder.append(e.getMessage());
            Log.e(str2, stringBuilder.toString());
            e.printStackTrace();
            CleanupDecoder();
            return false;
        }
    }

    public void CleanupDecoder() {
        if (this.m_decoder != null) {
            if (this.m_decoderStarted) {
                try {
                    if (this.m_inputBufferQueued) {
                        this.m_decoder.flush();
                        this.m_inputBufferQueued = false;
                    }
                    this.m_decoder.stop();
                } catch (Exception e) {
                    String str = TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("");
                    stringBuilder.append(e.getMessage());
                    Log.e(str, stringBuilder.toString());
                    e.printStackTrace();
                }
                this.m_decoderStarted = false;
            }
            this.m_decoder.release();
            this.m_decoder = null;
        }
        this.m_timestampOfLastDecodedFrame = Long.MIN_VALUE;
        this.m_timestampOfCurTexFrame = Long.MIN_VALUE;
        this.m_pendingInputFrameCount = 0;
        this.m_sawInputEOS = false;
        this.m_sawOutputEOS = false;
    }

    private ByteBuffer getInputBufferByIdx(int i) {
        if (VERSION.SDK_INT >= 21) {
            return this.m_decoder.getInputBuffer(i);
        }
        return this.m_decoder.getInputBuffers()[i];
    }

    private boolean AwaitNewImage() {
        synchronized (this.m_frameSyncObject) {
            while (!this.m_frameAvailable) {
                try {
                    this.m_frameSyncObject.wait(500);
                    if (!this.m_frameAvailable) {
                        Log.e(TAG, "Frame wait timed out!");
                        return false;
                    }
                } catch (InterruptedException e) {
                    String str = TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("");
                    stringBuilder.append(e.getMessage());
                    Log.e(str, stringBuilder.toString());
                    e.printStackTrace();
                    return false;
                }
            }
            this.m_frameAvailable = false;
            return true;
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:23:0x008b  */
    /* JADX WARNING: Removed duplicated region for block: B:22:0x0087  */
    /* JADX WARNING: Removed duplicated region for block: B:30:0x00a2  */
    /* JADX WARNING: Removed duplicated region for block: B:29:0x00a1  */
    /* JADX WARNING: Removed duplicated region for block: B:38:0x00b2  */
    /* JADX WARNING: Removed duplicated region for block: B:35:0x00ae  */
    private int DecodeFrame2Surface(byte[] r19, int r20, long r21) throws java.io.IOException {
        /*
        r18 = this;
        r1 = r18;
        r5 = r20;
        r0 = r1.m_sawInputEOS;
        r9 = 0;
        r10 = 1;
        if (r0 != 0) goto L_0x0082;
    L_0x000e:
        r0 = r1.m_decoder;
        r2 = 30000; // 0x7530 float:4.2039E-41 double:1.4822E-319;
        r0 = r0.dequeueInputBuffer(r2);
        r4 = r9;
    L_0x0018:
        if (r0 >= 0) goto L_0x0047;
    L_0x001a:
        r6 = 5;
        java.lang.Thread.sleep(r6, r9);	 Catch:{ InterruptedException -> 0x0020 }
        goto L_0x0025;
    L_0x0020:
        r0 = move-exception;
        r6 = r0;
        r6.printStackTrace();
    L_0x0025:
        r0 = r1.m_decoder;
        r0 = r0.dequeueInputBuffer(r2);
        r4 = r4 + r10;
        r6 = 20;
        if (r4 < r6) goto L_0x0018;
    L_0x0030:
        r2 = "MediaCodecDecoder";
        r3 = new java.lang.StringBuilder;
        r3.<init>();
        r6 = "try dequeueInputBuffer timeout -- ";
        r3.append(r6);
        r3.append(r4);
        r3 = r3.toString();
        android.util.Log.e(r2, r3);
    L_0x0047:
        r12 = r0;
        if (r12 < 0) goto L_0x0078;
    L_0x004a:
        r0 = r1.getInputBufferByIdx(r12);
        if (r5 != 0) goto L_0x005e;
    L_0x0050:
        r11 = r1.m_decoder;
        r13 = 0;
        r14 = 0;
        r15 = 0;
        r17 = 4;
        r11.queueInputBuffer(r12, r13, r14, r15, r17);
        r1.m_sawInputEOS = r10;
        goto L_0x0077;
    L_0x005e:
        r0.clear();
        r2 = r19;
        r0.put(r2, r9, r5);
        r2 = r1.m_decoder;
        r4 = 0;
        r8 = 0;
        r3 = r12;
        r6 = r21;
        r2.queueInputBuffer(r3, r4, r5, r6, r8);
        r1.m_inputBufferQueued = r10;
        r0 = r1.m_pendingInputFrameCount;
        r0 = r0 + r10;
        r1.m_pendingInputFrameCount = r0;
    L_0x0077:
        goto L_0x0082;
        r0 = "MediaCodecDecoder";
        r2 = "Input buffer not available";
        android.util.Log.e(r0, r2);
        r0 = r10;
        goto L_0x0083;
    L_0x0082:
        r0 = r9;
    L_0x0083:
        r2 = r1.m_sawOutputEOS;
        if (r2 == 0) goto L_0x008b;
    L_0x0087:
        r2 = 600000; // 0x927c0 float:8.40779E-40 double:2.964394E-318;
        goto L_0x0095;
    L_0x008b:
        r2 = r1.m_pendingInputFrameCount;
        r3 = 2;
        if (r2 <= r3) goto L_0x0093;
    L_0x0090:
        r2 = 30000; // 0x7530 float:4.2039E-41 double:1.4822E-319;
        goto L_0x0095;
        r2 = r9;
    L_0x0095:
        r3 = r1.m_decoder;
        r4 = r1.m_bufferInfo;
        r5 = (long) r2;
        r3 = r3.dequeueOutputBuffer(r4, r5);
        r4 = -3;
        if (r3 != r4) goto L_0x00a2;
    L_0x00a1:
        goto L_0x0095;
    L_0x00a2:
        r5 = -2;
        if (r3 != r5) goto L_0x00ab;
    L_0x00a5:
        r3 = r1.m_decoder;
        r3.getOutputFormat();
        goto L_0x0095;
    L_0x00ab:
        r2 = -1;
        if (r3 != r2) goto L_0x00b2;
    L_0x00ae:
        if (r0 == 0) goto L_0x00b1;
    L_0x00b0:
        return r4;
    L_0x00b1:
        return r5;
    L_0x00b2:
        if (r3 >= 0) goto L_0x00cb;
    L_0x00b4:
        r0 = "MediaCodecDecoder";
        r1 = new java.lang.StringBuilder;
        r1.<init>();
        r2 = "Unexpected result from decoder.dequeueOutputBuffer: ";
        r1.append(r2);
        r1.append(r3);
        r1 = r1.toString();
        android.util.Log.e(r0, r1);
        return r5;
    L_0x00cb:
        r0 = r1.m_bufferInfo;
        r0 = r0.flags;
        r0 = r0 & 4;
        if (r0 == 0) goto L_0x00d5;
    L_0x00d3:
        r1.m_sawOutputEOS = r10;
        r0 = r1.m_sawOutputEOS;
        if (r0 != 0) goto L_0x00e6;
    L_0x00da:
        r0 = r1.m_bufferInfo;
        r6 = r0.presentationTimeUs;
        r1.m_timestampOfLastDecodedFrame = r6;
        r0 = r1.m_pendingInputFrameCount;
        r0 = r0 - r10;
        r1.m_pendingInputFrameCount = r0;
        goto L_0x00e7;
    L_0x00e6:
        r10 = r9;
    L_0x00e7:
        r0 = r1.m_decoder;
        r0.releaseOutputBuffer(r3, r10);
        if (r10 == 0) goto L_0x0136;
    L_0x00ee:
        r0 = r18.AwaitNewImage();
        if (r0 == 0) goto L_0x012e;
    L_0x00f4:
        r0 = r1.m_bufferInfo;
        r2 = r0.presentationTimeUs;
        r1.m_timestampOfCurTexFrame = r2;
        r0 = android.opengl.GLES20.glGetError();
        if (r0 != 0) goto L_0x0101;
    L_0x0100:
        return r9;
    L_0x0101:
        r1 = new java.lang.StringBuilder;
        r1.<init>();
        r2 = ": glError ";
        r1.append(r2);
        r1.append(r0);
        r1 = r1.toString();
        r2 = "MediaCodecDecoder";
        android.util.Log.e(r2, r1);
        r1 = new java.lang.RuntimeException;
        r2 = new java.lang.StringBuilder;
        r2.<init>();
        r3 = ": glError ";
        r2.append(r3);
        r2.append(r0);
        r0 = r2.toString();
        r1.<init>(r0);
        throw r1;
    L_0x012e:
        r0 = "MediaCodecDecoder";
        r1 = "Render decoded frame to surface texture failed!";
        android.util.Log.e(r0, r1);
        return r5;
    L_0x0136:
        return r2;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.ss.android.ttve.mediacodec.TEMediaCodecDecoder.DecodeFrame2Surface(byte[], int, long):int");
    }

    public static boolean IsInAndriodHardwareBlacklist() {
        String str = Build.MANUFACTURER;
        String str2 = Build.MODEL;
        if (str.compareTo("Meizu") == 0 && str2.compareTo("m2") == 0) {
            return true;
        }
        if (str.compareTo("Xiaomi") == 0 && str2.compareTo("MI 4W") == 0) {
            return true;
        }
        return false;
    }

    public static boolean IsInAndriodHardwareWhitelist() {
        String str = Build.MANUFACTURER;
        String str2 = Build.MODEL;
        if (str.compareTo("samsung") == 0 && str2.compareTo("GT-I9152") == 0) {
            return true;
        }
        if (str.compareTo("HUAWEI") == 0 && str2.compareTo("HUAWEI P6-C00") == 0) {
            return true;
        }
        return false;
    }
}
