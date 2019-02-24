package com.ss.android.medialib;

import android.annotation.TargetApi;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.Bitmap.Config;
import android.media.MediaCodec;
import android.media.MediaCodec.BufferInfo;
import android.media.MediaCodecInfo;
import android.media.MediaCodecInfo.CodecCapabilities;
import android.media.MediaCodecInfo.CodecProfileLevel;
import android.media.MediaCodecInfo.EncoderCapabilities;
import android.media.MediaCodecList;
import android.media.MediaFormat;
import android.opengl.GLES20;
import android.os.Build.VERSION;
import android.util.Log;
import android.util.Pair;
import android.view.Surface;
import com.android.camera.constant.DurationConstant;
import com.ss.android.medialib.common.TextureDrawer;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.Buffer;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.LinkedList;
import java.util.Queue;

@TargetApi(18)
public class AVCEncoder {
    private static final String[] BITRATE_MODES = new String[]{"BITRATE_MODE_CQ", "BITRATE_MODE_VBR", "BITRATE_MODE_CBR"};
    private static final boolean DEBUG = true;
    private static final String TAG = "AVCEncoder";
    private static int TIMEOUT_USEC = 5000;
    static AVCEncoderInterface mEncoderCaller = null;
    private byte[] codec_config;
    BufferedOutputStream fileWriter = null;
    ByteBuffer[] inputBuffers;
    BufferInfo mBufferInfo = null;
    private String mCodecName = "video/avc";
    private int mDrawCount = 0;
    private int mEncodeCount = 0;
    private boolean mFlag = false;
    int mFrameRate = 30;
    private int mHeight;
    private MediaCodec mMediaCodec = null;
    private MediaCodecInfo mMediaCodecInfo = null;
    private Queue<Pair<Integer, Integer>> mPTSQueue = new LinkedList();
    private int mProfile = 1;
    private Surface mSurface;
    private TextureDrawer mTextureDrawer;
    private int mWidth;
    ByteBuffer[] outputBuffers;
    int status = 0;

    private interface Status {
        public static final int INITED = 1;
        public static final int STATED = 2;
        public static final int STOPPED = 3;
        public static final int UNSET = 0;
    }

    static {
        new Thread(new Runnable() {
            public void run() {
                MediaCodecList.getCodecCount();
            }
        }).start();
    }

    public static void setDrainWaitTimeout(int i) {
        TIMEOUT_USEC = i;
    }

    public void setFrameRate(int i) {
        this.mFrameRate = i;
    }

    public void setEncoderCaller(AVCEncoderInterface aVCEncoderInterface) {
        mEncoderCaller = aVCEncoderInterface;
    }

    private MediaCodecInfo getMediaCodecInfo() {
        int codecCount = MediaCodecList.getCodecCount();
        for (int i = 0; i < codecCount; i++) {
            MediaCodecInfo codecInfoAt = MediaCodecList.getCodecInfoAt(i);
            if (codecInfoAt.isEncoder()) {
                String name = codecInfoAt.getName();
                if (!(name.startsWith("OMX.google.") || name.startsWith("OMX.Nvidia.") || name.equals("OMX.TI.DUCATI1.VIDEO.H264E"))) {
                    String[] supportedTypes = codecInfoAt.getSupportedTypes();
                    for (String equalsIgnoreCase : supportedTypes) {
                        if (equalsIgnoreCase.equalsIgnoreCase(this.mCodecName)) {
                            return codecInfoAt;
                        }
                    }
                    continue;
                }
            }
        }
        return null;
    }

    @TargetApi(21)
    private MediaCodecInfo getMediaCodecInfo21() {
        MediaCodecInfo[] codecInfos = new MediaCodecList(1).getCodecInfos();
        if (codecInfos == null || codecInfos.length == 0) {
            return null;
        }
        for (MediaCodecInfo mediaCodecInfo : codecInfos) {
            if (mediaCodecInfo != null && mediaCodecInfo.isEncoder()) {
                String name = mediaCodecInfo.getName();
                if (!(name.startsWith("OMX.google.") || name.startsWith("OMX.Nvidia.") || name.equals("OMX.TI.DUCATI1.VIDEO.H264E"))) {
                    String[] supportedTypes = mediaCodecInfo.getSupportedTypes();
                    for (String equalsIgnoreCase : supportedTypes) {
                        if (equalsIgnoreCase.equalsIgnoreCase(this.mCodecName)) {
                            return mediaCodecInfo;
                        }
                    }
                    continue;
                }
            }
        }
        return null;
    }

    public int[] getColorFormats() {
        Log.e(TAG, "start == ");
        this.mMediaCodecInfo = VERSION.SDK_INT >= 21 ? getMediaCodecInfo21() : getMediaCodecInfo();
        Log.e(TAG, "end == ");
        if (this.mMediaCodecInfo == null) {
            return null;
        }
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("mMediaCodecInfo name = ");
        stringBuilder.append(this.mMediaCodecInfo.getName());
        Log.e(str, stringBuilder.toString());
        CodecCapabilities capabilitiesForType = this.mMediaCodecInfo.getCapabilitiesForType(this.mCodecName);
        int length = capabilitiesForType.colorFormats.length;
        int[] iArr = new int[length];
        for (int i = 0; i < length; i++) {
            iArr[i] = capabilitiesForType.colorFormats[i];
        }
        return iArr;
    }

    public int getProfile() {
        return this.mProfile;
    }

    @TargetApi(21)
    public MediaFormat setBitrateMode(MediaFormat mediaFormat) {
        mediaFormat.setInteger("bitrate-mode", 0);
        return mediaFormat;
    }

    private int getOneColorFormat() {
        int[] colorFormats = getColorFormats();
        if (colorFormats == null) {
            return -1;
        }
        for (int i = 0; i < colorFormats.length; i++) {
            if (colorFormats[i] == 2130708361) {
                Log.e(TAG, "====== colorFormat support COLOR_FormatSurface ======");
                return colorFormats[i];
            }
        }
        return -1;
    }

    public Surface initAVCEncoder(int i, int i2, int i3, int i4) {
        return initAVCEncoder(i, i2, i3, 1, 8, i4, true);
    }

    public Surface initAVCEncoder(int i, int i2, int i3, int i4, boolean z) {
        return initAVCEncoder(i, i2, i3, 1, 1, i4, z);
    }

    /* JADX WARNING: Removed duplicated region for block: B:57:0x0177 A:{LOOP_END, LOOP:1: B:42:0x0119->B:57:0x0177, Catch:{ Exception -> 0x0346 }} */
    /* JADX WARNING: Removed duplicated region for block: B:105:0x017a A:{SYNTHETIC, EDGE_INSN: B:105:0x017a->B:58:0x017a ?: BREAK  } */
    /* JADX WARNING: Missing block: B:49:0x015a, code:
            if (r11.profile < 2) goto L_0x0171;
     */
    /* JADX WARNING: Missing block: B:53:0x016e, code:
            if (r11.profile < 8) goto L_0x0171;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public Surface initAVCEncoder(int i, int i2, int i3, int i4, int i5, int i6, boolean z) {
        int i7 = i;
        int i8 = i2;
        int i9 = i4;
        int i10 = i5;
        boolean z2 = z;
        if (!z2 || VERSION.SDK_INT < 18) {
            return null;
        }
        String str;
        StringBuilder stringBuilder;
        this.mDrawCount = 0;
        this.mEncodeCount = 0;
        Log.d(TAG, "initAVCEncoder == enter");
        if (i9 < 0 || i9 > 2) {
            str = TAG;
            stringBuilder = new StringBuilder();
            stringBuilder.append("Do not support bitrate mode ");
            stringBuilder.append(i9);
            stringBuilder.append(", set VBR mode");
            Log.e(str, stringBuilder.toString());
            i9 = 1;
        }
        if (i10 < 1 || i10 > 64) {
            str = TAG;
            stringBuilder = new StringBuilder();
            stringBuilder.append("Do not support profile ");
            stringBuilder.append(i10);
            stringBuilder.append(", use baseline");
            Log.e(str, stringBuilder.toString());
            i10 = 1;
        }
        int i11 = 12000000;
        int i12 = i3;
        if (i12 <= 12000000) {
            i11 = i12;
        }
        String str2 = TAG;
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append("width + ");
        stringBuilder2.append(i7);
        stringBuilder2.append("\theight = ");
        stringBuilder2.append(i8);
        stringBuilder2.append("\tbitrate = ");
        stringBuilder2.append(i11);
        stringBuilder2.append("\tuseTextureInput = ");
        stringBuilder2.append(z2);
        Log.d(str2, stringBuilder2.toString());
        if (i7 <= 0 || i8 <= 0) {
            return null;
        }
        this.mWidth = i7;
        this.mHeight = i8;
        synchronized (this) {
            try {
                int oneColorFormat = getOneColorFormat();
                if (oneColorFormat < 0) {
                    return null;
                }
                if (mEncoderCaller != null) {
                    mEncoderCaller.setColorFormat(oneColorFormat);
                }
                this.mMediaCodec = MediaCodec.createEncoderByType(this.mCodecName);
                MediaCodecInfo codecInfo = this.mMediaCodec.getCodecInfo();
                if (codecInfo.getName().startsWith("OMX.google.")) {
                    return null;
                }
                StringBuilder stringBuilder3;
                String str3;
                String str4;
                String[] supportedTypes = codecInfo.getSupportedTypes();
                Log.d(TAG, "CodecNames: ");
                for (String str5 : supportedTypes) {
                    String str6 = TAG;
                    stringBuilder3 = new StringBuilder();
                    stringBuilder3.append("Codec: ");
                    stringBuilder3.append(str5);
                    Log.d(str6, stringBuilder3.toString());
                }
                this.status = 1;
                MediaFormat createVideoFormat = MediaFormat.createVideoFormat(this.mCodecName, i7, i8);
                CodecCapabilities capabilitiesForType = codecInfo.getCapabilitiesForType(this.mCodecName);
                CodecProfileLevel[] codecProfileLevelArr = capabilitiesForType.profileLevels;
                int length = codecProfileLevelArr.length;
                int i13 = 0;
                CodecProfileLevel codecProfileLevel = null;
                while (i13 < length) {
                    CodecProfileLevel codecProfileLevel2 = codecProfileLevelArr[i13];
                    String str7 = TAG;
                    StringBuilder stringBuilder4 = new StringBuilder();
                    stringBuilder4.append("Profile = ");
                    stringBuilder4.append(codecProfileLevel2.profile);
                    stringBuilder4.append(", Level = ");
                    stringBuilder4.append(codecProfileLevel2.level);
                    Log.d(str7, stringBuilder4.toString());
                    if (codecProfileLevel2.profile == 1) {
                        Log.d(TAG, "Support Baseline Profile!");
                    } else if (codecProfileLevel2.profile == 2) {
                        Log.d(TAG, "Support Main Profile!");
                    } else {
                        if (codecProfileLevel2.profile == 8) {
                            Log.d(TAG, "Support High Profile!");
                        }
                        if (codecProfileLevel2.profile != i10) {
                            break;
                        }
                        i13++;
                    }
                    codecProfileLevel = codecProfileLevel2;
                    if (codecProfileLevel2.profile != i10) {
                    }
                }
                if (VERSION.SDK_INT >= 21) {
                    EncoderCapabilities encoderCapabilities = capabilitiesForType.getEncoderCapabilities();
                    for (int i14 = 0; i14 < 3; i14++) {
                        String str8 = TAG;
                        StringBuilder stringBuilder5 = new StringBuilder();
                        stringBuilder5.append(BITRATE_MODES[i14]);
                        stringBuilder5.append(": ");
                        stringBuilder5.append(encoderCapabilities.isBitrateModeSupported(i14));
                        Log.d(str8, stringBuilder5.toString());
                    }
                }
                if (VERSION.SDK_INT < 24 || codecProfileLevel == null) {
                    str3 = TAG;
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("Do not support profile ");
                    stringBuilder.append(i10);
                    stringBuilder.append(", use baseline");
                    Log.w(str3, stringBuilder.toString());
                    i10 = i11;
                } else {
                    str4 = TAG;
                    stringBuilder3 = new StringBuilder();
                    stringBuilder3.append("Set Profile: ");
                    stringBuilder3.append(codecProfileLevel.profile);
                    stringBuilder3.append(", Level = ");
                    stringBuilder3.append(codecProfileLevel.level);
                    Log.d(str4, stringBuilder3.toString());
                    this.mProfile = codecProfileLevel.profile;
                    createVideoFormat.setInteger("profile", codecProfileLevel.profile);
                    createVideoFormat.setInteger("level", codecProfileLevel.level);
                    i10 = codecProfileLevel.profile;
                    if (i10 == 2) {
                        Log.d(TAG, "Set Main Profile");
                        i10 = (int) (((float) i11) * 0.67f);
                    } else if (i10 != 8) {
                        i10 = i11;
                    } else {
                        Log.d(TAG, "Set High Profile");
                        i10 = (int) (((float) i11) * 0.58f);
                    }
                }
                str3 = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("bitrate = ");
                stringBuilder.append((((float) i10) * 1.0f) / 1000000.0f);
                stringBuilder.append("Mb/s");
                Log.d(str3, stringBuilder.toString());
                str3 = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("speed = ");
                stringBuilder.append(i6);
                Log.d(str3, stringBuilder.toString());
                createVideoFormat.setInteger("bitrate", i10);
                if (VERSION.SDK_INT >= 21) {
                    EncoderCapabilities encoderCapabilities2 = capabilitiesForType.getEncoderCapabilities();
                    for (i10 = 0; i10 < 3; i10++) {
                        str3 = TAG;
                        stringBuilder = new StringBuilder();
                        stringBuilder.append(BITRATE_MODES[i10]);
                        stringBuilder.append(": ");
                        stringBuilder.append(encoderCapabilities2.isBitrateModeSupported(i10));
                        Log.d(str3, stringBuilder.toString());
                    }
                    createVideoFormat.setInteger("bitrate-mode", i9);
                    str4 = TAG;
                    stringBuilder3 = new StringBuilder();
                    stringBuilder3.append("Bitrate mode = ");
                    stringBuilder3.append(i9);
                    Log.d(str4, stringBuilder3.toString());
                    createVideoFormat.setInteger("max-bitrate", i11);
                    String str9 = TAG;
                    StringBuilder stringBuilder6 = new StringBuilder();
                    stringBuilder6.append("Encoder ComplexityRange: ");
                    stringBuilder6.append(encoderCapabilities2.getComplexityRange().toString());
                    Log.d(str9, stringBuilder6.toString());
                }
                createVideoFormat.setInteger("color-format", oneColorFormat);
                createVideoFormat.setInteger("frame-rate", this.mFrameRate);
                createVideoFormat.setInteger("i-frame-interval", 1);
                String str10 = TAG;
                StringBuilder stringBuilder7 = new StringBuilder();
                stringBuilder7.append("initAVCEncoder: format = ");
                stringBuilder7.append(createVideoFormat);
                Log.d(str10, stringBuilder7.toString());
                this.mMediaCodec.configure(createVideoFormat, null, null, 1);
                this.mSurface = this.mMediaCodec.createInputSurface();
                this.mMediaCodec.start();
                this.status = 2;
                if (VERSION.SDK_INT < 21) {
                    this.inputBuffers = this.mMediaCodec.getInputBuffers();
                    this.outputBuffers = this.mMediaCodec.getOutputBuffers();
                }
                this.mBufferInfo = new BufferInfo();
                if (this.mSurface == null) {
                    return null;
                }
                Log.i(TAG, "initAVCEncoder == exit");
                return this.mSurface;
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        }
    }

    public boolean initEGLCtx() {
        if (this.mSurface == null) {
            Log.e(TAG, "initEGLCtx: MediaCodec should initialized ahead.");
            return false;
        }
        this.mTextureDrawer = TextureDrawer.create();
        this.mTextureDrawer.setRotation(0.0f);
        this.mTextureDrawer.setFlipScale(1.0f, -1.0f);
        return true;
    }

    public void releaseEGLCtx() {
        if (this.mTextureDrawer != null) {
            this.mTextureDrawer.release();
            this.mTextureDrawer = null;
        }
    }

    /* JADX WARNING: Missing block: B:24:0x0038, code:
            android.util.Log.i(TAG, "uninitAVCEncoder == exit");
     */
    /* JADX WARNING: Missing block: B:25:0x003f, code:
            return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void uninitAVCEncoder() {
        Log.i(TAG, "uninitAVCEncoder == enter");
        synchronized (this) {
            if (this.status == 0 || this.mMediaCodec == null) {
                return;
            }
            if (this.status == 2) {
                try {
                    this.mMediaCodec.stop();
                } catch (Exception e) {
                    Log.e(TAG, "MediaCodec Exception");
                }
            }
            try {
                this.mMediaCodec.release();
            } catch (Exception e2) {
            }
            this.mMediaCodec = null;
            if (this.mSurface != null) {
                this.mSurface.release();
            }
        }
    }

    private void testCode(boolean z) {
        Buffer order = ByteBuffer.allocateDirect((this.mWidth * this.mHeight) * 4).order(ByteOrder.nativeOrder());
        GLES20.glReadPixels(0, 0, this.mWidth, this.mHeight, 6408, 5121, order);
        try {
            if (this.fileWriter == null) {
                this.fileWriter = new BufferedOutputStream(new FileOutputStream("/storage/emulated/0/xzw/rgbaBig.rgba"));
            }
            this.fileWriter.write(order.array());
        } catch (IOException e) {
            e.printStackTrace();
        }
        Bitmap createBitmap = Bitmap.createBitmap(this.mWidth, this.mHeight, Config.ARGB_8888);
        createBitmap.copyPixelsFromBuffer(order);
        if (z) {
            saveBitmap(createBitmap, "/sdcard/aweme/picture/record_e.jpeg");
        } else {
            saveBitmap(createBitmap, "/sdcard/aweme/picture/record_s.jpeg");
        }
        createBitmap.recycle();
    }

    public void saveBitmap(Bitmap bitmap, String str) {
        String str2 = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("saving Bitmap : ");
        stringBuilder.append(str);
        Log.i(str2, stringBuilder.toString());
        try {
            OutputStream bufferedOutputStream = new BufferedOutputStream(new FileOutputStream(str));
            bitmap.compress(CompressFormat.JPEG, 100, bufferedOutputStream);
            bufferedOutputStream.flush();
            bufferedOutputStream.close();
            String str3 = TAG;
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("Bitmap ");
            stringBuilder2.append(str);
            stringBuilder2.append(" saved!");
            Log.i(str3, stringBuilder2.toString());
        } catch (IOException e) {
            Log.e(TAG, "Err when saving bitmap...");
            e.printStackTrace();
        }
    }

    /* JADX WARNING: Missing block: B:50:0x0146, code:
            return 0;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public int encode(int i, int i2, int i3, boolean z) {
        int i4 = i;
        int i5 = i2;
        boolean z2 = z;
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("encodeTexture::texID: ");
        stringBuilder.append(i4);
        stringBuilder.append(" pts: ");
        stringBuilder.append(i5);
        stringBuilder.append(" duration:");
        stringBuilder.append(i3);
        stringBuilder.append("  isEndStream = ");
        stringBuilder.append(z2);
        Log.d(str, stringBuilder.toString());
        synchronized (this) {
            StringBuilder stringBuilder2;
            if (this.status != 2 || this.mMediaCodec == null) {
                Log.w(TAG, "encode: codec is not reayd.");
                return -1;
            } else if (i4 <= 0 || i5 < 0) {
                String str2 = TAG;
                stringBuilder2 = new StringBuilder();
                stringBuilder2.append("encode: invalidate params: texID = ");
                stringBuilder2.append(i4);
                stringBuilder2.append(", pts = ");
                stringBuilder2.append(i5);
                Log.e(str2, stringBuilder2.toString());
                return -1;
            } else if (this.mTextureDrawer != null || initEGLCtx()) {
                this.mPTSQueue.offer(Pair.create(Integer.valueOf(i2), Integer.valueOf(i3)));
                GLES20.glViewport(0, 0, this.mWidth, this.mHeight);
                String str3 = TAG;
                stringBuilder2 = new StringBuilder();
                stringBuilder2.append("encode: width = ");
                stringBuilder2.append(this.mWidth);
                stringBuilder2.append(" height = ");
                stringBuilder2.append(this.mHeight);
                Log.v(str3, stringBuilder2.toString());
                this.mTextureDrawer.drawTexture(i4);
                GLES20.glFinish();
                this.mDrawCount++;
                mEncoderCaller.onSwapGlBuffers();
                if (this.mFlag) {
                    testCode(z2);
                    this.mFlag = false;
                }
                if (z2) {
                    this.mMediaCodec.signalEndOfInputStream();
                }
                i4 = 0;
                while (true) {
                    i4++;
                    if (VERSION.SDK_INT < 21) {
                        this.outputBuffers = this.mMediaCodec.getOutputBuffers();
                    }
                    try {
                        int dequeueOutputBuffer = this.mMediaCodec.dequeueOutputBuffer(this.mBufferInfo, (long) TIMEOUT_USEC);
                        String str4 = TAG;
                        StringBuilder stringBuilder3 = new StringBuilder();
                        stringBuilder3.append("outputBufferIndex = ");
                        stringBuilder3.append(dequeueOutputBuffer);
                        Log.v(str4, stringBuilder3.toString());
                        str4 = TAG;
                        stringBuilder3 = new StringBuilder();
                        stringBuilder3.append("mBufferInfo.flags = ");
                        stringBuilder3.append(this.mBufferInfo.flags);
                        Log.v(str4, stringBuilder3.toString());
                        if (dequeueOutputBuffer == -1) {
                            if (z2 && TIMEOUT_USEC < 5000) {
                                TIMEOUT_USEC = DurationConstant.DURATION_VIDEO_RECORDING_CIRCLE;
                            }
                            if (!z2 || this.mDrawCount == this.mEncodeCount || i4 >= 10) {
                                break;
                            }
                        } else if (dequeueOutputBuffer == -3) {
                            this.outputBuffers = this.mMediaCodec.getOutputBuffers();
                        } else if (dequeueOutputBuffer == -2) {
                            Log.w(TAG, "encode: output format change!");
                        } else if (dequeueOutputBuffer < 0) {
                            Log.w(TAG, "encode: error.");
                            break;
                        } else {
                            ByteBuffer outputBuffer;
                            if (VERSION.SDK_INT >= 21) {
                                outputBuffer = this.mMediaCodec.getOutputBuffer(dequeueOutputBuffer);
                            } else {
                                outputBuffer = this.outputBuffers[dequeueOutputBuffer];
                            }
                            ByteBuffer byteBuffer = outputBuffer;
                            byteBuffer.position(this.mBufferInfo.offset);
                            byteBuffer.limit(this.mBufferInfo.offset + this.mBufferInfo.size);
                            if ((this.mBufferInfo.flags & 2) != 0) {
                                Log.e(TAG, "mEncoderCaller.onSetCodecConfig");
                                if (mEncoderCaller != null) {
                                    mEncoderCaller.onSetCodecConfig(byteBuffer);
                                }
                                this.mBufferInfo.size = 0;
                            } else {
                                int i6 = (this.mBufferInfo.flags & 1) != 0 ? 1 : 0;
                                Log.v(TAG, "mEncoderCaller.onWriteFile");
                                if (mEncoderCaller != null) {
                                    String str5 = TAG;
                                    stringBuilder2 = new StringBuilder();
                                    stringBuilder2.append("encode: pts queue size = ");
                                    stringBuilder2.append(this.mPTSQueue.size());
                                    Log.d(str5, stringBuilder2.toString());
                                    if (this.mPTSQueue.size() > 0) {
                                        this.mEncodeCount++;
                                        Pair pair = (Pair) this.mPTSQueue.poll();
                                        long j = 0;
                                        if (this.mBufferInfo.presentationTimeUs > 0) {
                                            j = this.mBufferInfo.presentationTimeUs;
                                        }
                                        mEncoderCaller.onWriteFile(byteBuffer, j / 1000, (long) ((Integer) pair.first).intValue(), ((Integer) pair.second).intValue(), i6);
                                    } else {
                                        Log.w(TAG, "encode: no available pts!!!");
                                    }
                                } else {
                                    Log.i(TAG, "encode: no output.");
                                }
                            }
                            this.mMediaCodec.releaseOutputBuffer(dequeueOutputBuffer, false);
                            i4 = 0;
                        }
                    } catch (Throwable th) {
                        return -2;
                    }
                }
                if (z2) {
                    releaseEGLCtx();
                }
            } else {
                return -1;
            }
        }
    }

    /* JADX WARNING: Missing block: B:62:0x01b2, code:
            return 0;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public int encode(byte[] bArr, int i, boolean z) {
        byte[] bArr2 = bArr;
        int i2 = i;
        boolean z2 = z;
        synchronized (this) {
            if (this.status != 2 || this.mMediaCodec == null) {
                return -1;
            }
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("encodeBuffer pts: ");
            stringBuilder.append(i2);
            stringBuilder.append("  isEndStream = ");
            stringBuilder.append(z2);
            Log.e(str, stringBuilder.toString());
            int dequeueInputBuffer;
            ByteBuffer inputBuffer;
            int dequeueOutputBuffer;
            ByteBuffer outputBuffer;
            int i3;
            int i4;
            if (VERSION.SDK_INT >= 21) {
                dequeueInputBuffer = this.mMediaCodec.dequeueInputBuffer(-1);
                if (dequeueInputBuffer >= 0) {
                    inputBuffer = this.mMediaCodec.getInputBuffer(dequeueInputBuffer);
                    inputBuffer.clear();
                    inputBuffer.put(bArr2, 0, bArr2.length);
                    this.mMediaCodec.queueInputBuffer(dequeueInputBuffer, 0, bArr2.length, (long) i2, z2 ? 4 : 0);
                }
                dequeueOutputBuffer = this.mMediaCodec.dequeueOutputBuffer(this.mBufferInfo, (long) TIMEOUT_USEC);
                String str2 = TAG;
                StringBuilder stringBuilder2 = new StringBuilder();
                stringBuilder2.append("outputBufferIndex = ");
                stringBuilder2.append(dequeueOutputBuffer);
                Log.e(str2, stringBuilder2.toString());
                str2 = TAG;
                stringBuilder2 = new StringBuilder();
                stringBuilder2.append("mBufferInfo.flags = ");
                stringBuilder2.append(this.mBufferInfo.flags);
                Log.e(str2, stringBuilder2.toString());
                while (dequeueOutputBuffer >= 0) {
                    outputBuffer = this.mMediaCodec.getOutputBuffer(dequeueOutputBuffer);
                    outputBuffer.position(this.mBufferInfo.offset);
                    outputBuffer.limit(this.mBufferInfo.offset + this.mBufferInfo.size);
                    if ((this.mBufferInfo.flags & 2) != 0) {
                        Log.e(TAG, "mEncoderCaller.onSetCodecConfig");
                        if (mEncoderCaller != null) {
                            mEncoderCaller.onSetCodecConfig(outputBuffer);
                        }
                        this.mBufferInfo.size = 0;
                    } else {
                        i3 = (int) this.mBufferInfo.presentationTimeUs;
                        i4 = (this.mBufferInfo.flags & 1) != 0 ? 1 : 0;
                        Log.e(TAG, "mEncoderCaller.onWriteFile");
                        if (mEncoderCaller != null) {
                            mEncoderCaller.onWriteFile(outputBuffer, i3, 0, i4);
                        }
                    }
                    this.mMediaCodec.releaseOutputBuffer(dequeueOutputBuffer, false);
                    dequeueOutputBuffer = this.mMediaCodec.dequeueOutputBuffer(this.mBufferInfo, 0);
                }
            } else {
                dequeueInputBuffer = this.mMediaCodec.dequeueInputBuffer(-1);
                if (dequeueInputBuffer >= 0) {
                    inputBuffer = this.inputBuffers[dequeueInputBuffer];
                    inputBuffer.clear();
                    inputBuffer.put(bArr2, 0, bArr2.length);
                    this.mMediaCodec.queueInputBuffer(dequeueInputBuffer, 0, bArr2.length, (long) i2, z2 ? 4 : 0);
                }
                for (dequeueOutputBuffer = this.mMediaCodec.dequeueOutputBuffer(this.mBufferInfo, (long) TIMEOUT_USEC); dequeueOutputBuffer >= 0; dequeueOutputBuffer = this.mMediaCodec.dequeueOutputBuffer(this.mBufferInfo, 0)) {
                    if (dequeueOutputBuffer == -3) {
                        this.outputBuffers = this.mMediaCodec.getOutputBuffers();
                    } else if (dequeueOutputBuffer != -2) {
                        outputBuffer = this.outputBuffers[dequeueOutputBuffer];
                        outputBuffer.position(this.mBufferInfo.offset);
                        outputBuffer.limit(this.mBufferInfo.offset + this.mBufferInfo.size);
                        if ((this.mBufferInfo.flags & 2) != 0) {
                            Log.e(TAG, "mEncoderCaller.onSetCodecConfig");
                            if (mEncoderCaller != null) {
                                mEncoderCaller.onSetCodecConfig(outputBuffer);
                            }
                            this.mBufferInfo.size = 0;
                        } else {
                            i3 = (int) this.mBufferInfo.presentationTimeUs;
                            i4 = (this.mBufferInfo.flags & 1) != 0 ? 1 : 0;
                            Log.e(TAG, "mEncoderCaller.onWriteFile");
                            if (mEncoderCaller != null) {
                                mEncoderCaller.onWriteFile(outputBuffer, i3, 0, i4);
                            }
                        }
                        this.mMediaCodec.releaseOutputBuffer(dequeueOutputBuffer, false);
                    }
                }
            }
        }
    }
}
