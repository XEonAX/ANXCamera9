package com.ss.android.medialib;

import android.annotation.TargetApi;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.Bitmap.Config;
import android.media.MediaCodec;
import android.media.MediaCodec.BufferInfo;
import android.media.MediaCodecInfo;
import android.media.MediaCodecInfo.CodecCapabilities;
import android.media.MediaCodecList;
import android.media.MediaFormat;
import android.opengl.GLES20;
import android.os.Build.VERSION;
import android.util.Log;
import android.util.Pair;
import android.view.Surface;
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
    public android.view.Surface initAVCEncoder(int r18, int r19, int r20, int r21, int r22, int r23, boolean r24) {
        /*
        r17 = this;
        r1 = r17;
        r0 = r18;
        r2 = r19;
        r3 = r21;
        r4 = r22;
        r5 = r24;
        r6 = 0;
        if (r5 != 0) goto L_0x0010;
    L_0x000f:
        return r6;
    L_0x0010:
        r7 = android.os.Build.VERSION.SDK_INT;
        r8 = 18;
        if (r7 >= r8) goto L_0x0017;
    L_0x0016:
        return r6;
    L_0x0017:
        r7 = 0;
        r1.mDrawCount = r7;
        r1.mEncodeCount = r7;
        r8 = "AVCEncoder";
        r9 = "initAVCEncoder == enter";
        android.util.Log.d(r8, r9);
        r8 = 2;
        r9 = 1;
        if (r3 < 0) goto L_0x0029;
    L_0x0027:
        if (r3 <= r8) goto L_0x0046;
    L_0x0029:
        r10 = "AVCEncoder";
        r11 = new java.lang.StringBuilder;
        r11.<init>();
        r12 = "Do not support bitrate mode ";
        r11.append(r12);
        r11.append(r3);
        r3 = ", set VBR mode";
        r11.append(r3);
        r3 = r11.toString();
        android.util.Log.e(r10, r3);
        r3 = r9;
    L_0x0046:
        if (r4 < r9) goto L_0x004c;
    L_0x0048:
        r10 = 64;
        if (r4 <= r10) goto L_0x0069;
    L_0x004c:
        r10 = "AVCEncoder";
        r11 = new java.lang.StringBuilder;
        r11.<init>();
        r12 = "Do not support profile ";
        r11.append(r12);
        r11.append(r4);
        r4 = ", use baseline";
        r11.append(r4);
        r4 = r11.toString();
        android.util.Log.e(r10, r4);
        r4 = r9;
    L_0x0069:
        r10 = 12000000; // 0xb71b00 float:1.6815582E-38 double:5.9287878E-317;
        r11 = r20;
        if (r11 <= r10) goto L_0x0071;
    L_0x0070:
        goto L_0x0072;
    L_0x0071:
        r10 = r11;
    L_0x0072:
        r11 = "AVCEncoder";
        r12 = new java.lang.StringBuilder;
        r12.<init>();
        r13 = "width + ";
        r12.append(r13);
        r12.append(r0);
        r13 = "\theight = ";
        r12.append(r13);
        r12.append(r2);
        r13 = "\tbitrate = ";
        r12.append(r13);
        r12.append(r10);
        r13 = "\tuseTextureInput = ";
        r12.append(r13);
        r12.append(r5);
        r5 = r12.toString();
        android.util.Log.d(r11, r5);
        if (r0 <= 0) goto L_0x034f;
    L_0x00a2:
        if (r2 > 0) goto L_0x00a6;
    L_0x00a4:
        goto L_0x034f;
    L_0x00a6:
        r1.mWidth = r0;
        r1.mHeight = r2;
        monitor-enter(r17);
        r5 = r17.getOneColorFormat();	 Catch:{ Exception -> 0x0346 }
        if (r5 >= 0) goto L_0x00b3;
    L_0x00b1:
        monitor-exit(r17);	 Catch:{ all -> 0x0344 }
        return r6;
    L_0x00b3:
        r11 = mEncoderCaller;	 Catch:{ Exception -> 0x0346 }
        if (r11 == 0) goto L_0x00bc;
    L_0x00b7:
        r11 = mEncoderCaller;	 Catch:{ Exception -> 0x0346 }
        r11.setColorFormat(r5);	 Catch:{ Exception -> 0x0346 }
    L_0x00bc:
        r11 = r1.mCodecName;	 Catch:{ Exception -> 0x0346 }
        r11 = android.media.MediaCodec.createEncoderByType(r11);	 Catch:{ Exception -> 0x0346 }
        r1.mMediaCodec = r11;	 Catch:{ Exception -> 0x0346 }
        r11 = r1.mMediaCodec;	 Catch:{ Exception -> 0x0346 }
        r11 = r11.getCodecInfo();	 Catch:{ Exception -> 0x0346 }
        r12 = r11.getName();	 Catch:{ Exception -> 0x0346 }
        r13 = "OMX.google.";
        r12 = r12.startsWith(r13);	 Catch:{ Exception -> 0x0346 }
        if (r12 == 0) goto L_0x00d8;
    L_0x00d6:
        monitor-exit(r17);	 Catch:{ all -> 0x0344 }
        return r6;
    L_0x00d8:
        r12 = r11.getSupportedTypes();	 Catch:{ Exception -> 0x0346 }
        r13 = "AVCEncoder";
        r14 = "CodecNames: ";
        android.util.Log.d(r13, r14);	 Catch:{ Exception -> 0x0346 }
        r13 = r12.length;	 Catch:{ Exception -> 0x0346 }
        r14 = r7;
    L_0x00e5:
        if (r14 >= r13) goto L_0x0105;
    L_0x00e7:
        r15 = r12[r14];	 Catch:{ Exception -> 0x0346 }
        r7 = "AVCEncoder";
        r6 = new java.lang.StringBuilder;	 Catch:{ Exception -> 0x0346 }
        r6.<init>();	 Catch:{ Exception -> 0x0346 }
        r8 = "Codec: ";
        r6.append(r8);	 Catch:{ Exception -> 0x0346 }
        r6.append(r15);	 Catch:{ Exception -> 0x0346 }
        r6 = r6.toString();	 Catch:{ Exception -> 0x0346 }
        android.util.Log.d(r7, r6);	 Catch:{ Exception -> 0x0346 }
        r14 = r14 + 1;
        r6 = 0;
        r7 = 0;
        r8 = 2;
        goto L_0x00e5;
    L_0x0105:
        r1.status = r9;	 Catch:{ Exception -> 0x0346 }
        r6 = r1.mCodecName;	 Catch:{ Exception -> 0x0346 }
        r0 = android.media.MediaFormat.createVideoFormat(r6, r0, r2);	 Catch:{ Exception -> 0x0346 }
        r2 = r1.mCodecName;	 Catch:{ Exception -> 0x0346 }
        r2 = r11.getCapabilitiesForType(r2);	 Catch:{ Exception -> 0x0346 }
        r6 = r2.profileLevels;	 Catch:{ Exception -> 0x0346 }
        r7 = r6.length;	 Catch:{ Exception -> 0x0346 }
        r8 = 0;
        r11 = 0;
    L_0x0119:
        if (r8 >= r7) goto L_0x017a;
    L_0x011b:
        r13 = r6[r8];	 Catch:{ Exception -> 0x0346 }
        r14 = "AVCEncoder";
        r15 = new java.lang.StringBuilder;	 Catch:{ Exception -> 0x0346 }
        r15.<init>();	 Catch:{ Exception -> 0x0346 }
        r12 = "Profile = ";
        r15.append(r12);	 Catch:{ Exception -> 0x0346 }
        r12 = r13.profile;	 Catch:{ Exception -> 0x0346 }
        r15.append(r12);	 Catch:{ Exception -> 0x0346 }
        r12 = ", Level = ";
        r15.append(r12);	 Catch:{ Exception -> 0x0346 }
        r12 = r13.level;	 Catch:{ Exception -> 0x0346 }
        r15.append(r12);	 Catch:{ Exception -> 0x0346 }
        r12 = r15.toString();	 Catch:{ Exception -> 0x0346 }
        android.util.Log.d(r14, r12);	 Catch:{ Exception -> 0x0346 }
        r12 = r13.profile;	 Catch:{ Exception -> 0x0346 }
        if (r12 != r9) goto L_0x014b;
    L_0x0143:
        r11 = "AVCEncoder";
        r12 = "Support Baseline Profile!";
        android.util.Log.d(r11, r12);	 Catch:{ Exception -> 0x0346 }
        goto L_0x0171;
    L_0x014b:
        r12 = r13.profile;	 Catch:{ Exception -> 0x0346 }
        r14 = 2;
        if (r12 != r14) goto L_0x015d;
    L_0x0150:
        r12 = "AVCEncoder";
        r14 = "Support Main Profile!";
        android.util.Log.d(r12, r14);	 Catch:{ Exception -> 0x0346 }
        r12 = r11.profile;	 Catch:{ Exception -> 0x0346 }
        r14 = 2;
        if (r12 >= r14) goto L_0x0172;
    L_0x015c:
        goto L_0x0171;
    L_0x015d:
        r12 = r13.profile;	 Catch:{ Exception -> 0x0346 }
        r14 = 8;
        if (r12 != r14) goto L_0x0172;
    L_0x0163:
        r12 = "AVCEncoder";
        r14 = "Support High Profile!";
        android.util.Log.d(r12, r14);	 Catch:{ Exception -> 0x0346 }
        r12 = r11.profile;	 Catch:{ Exception -> 0x0346 }
        r14 = 8;
        if (r12 >= r14) goto L_0x0172;
    L_0x0171:
        r11 = r13;
    L_0x0172:
        r12 = r13.profile;	 Catch:{ Exception -> 0x0346 }
        if (r12 != r4) goto L_0x0177;
    L_0x0176:
        goto L_0x017a;
    L_0x0177:
        r8 = r8 + 1;
        goto L_0x0119;
    L_0x017a:
        r6 = android.os.Build.VERSION.SDK_INT;	 Catch:{ Exception -> 0x0346 }
        r7 = 3;
        r8 = 21;
        if (r6 < r8) goto L_0x01ac;
    L_0x0181:
        r6 = r2.getEncoderCapabilities();	 Catch:{ Exception -> 0x0346 }
        r12 = 0;
    L_0x0186:
        if (r12 >= r7) goto L_0x01ac;
    L_0x0188:
        r13 = "AVCEncoder";
        r14 = new java.lang.StringBuilder;	 Catch:{ Exception -> 0x0346 }
        r14.<init>();	 Catch:{ Exception -> 0x0346 }
        r15 = BITRATE_MODES;	 Catch:{ Exception -> 0x0346 }
        r15 = r15[r12];	 Catch:{ Exception -> 0x0346 }
        r14.append(r15);	 Catch:{ Exception -> 0x0346 }
        r15 = ": ";
        r14.append(r15);	 Catch:{ Exception -> 0x0346 }
        r15 = r6.isBitrateModeSupported(r12);	 Catch:{ Exception -> 0x0346 }
        r14.append(r15);	 Catch:{ Exception -> 0x0346 }
        r14 = r14.toString();	 Catch:{ Exception -> 0x0346 }
        android.util.Log.d(r13, r14);	 Catch:{ Exception -> 0x0346 }
        r12 = r12 + 1;
        goto L_0x0186;
        r6 = android.os.Build.VERSION.SDK_INT;	 Catch:{ Exception -> 0x0346 }
        r12 = 24;
        if (r6 < r12) goto L_0x0210;
    L_0x01b3:
        if (r11 == 0) goto L_0x0210;
    L_0x01b5:
        r4 = "AVCEncoder";
        r6 = new java.lang.StringBuilder;	 Catch:{ Exception -> 0x0346 }
        r6.<init>();	 Catch:{ Exception -> 0x0346 }
        r12 = "Set Profile: ";
        r6.append(r12);	 Catch:{ Exception -> 0x0346 }
        r12 = r11.profile;	 Catch:{ Exception -> 0x0346 }
        r6.append(r12);	 Catch:{ Exception -> 0x0346 }
        r12 = ", Level = ";
        r6.append(r12);	 Catch:{ Exception -> 0x0346 }
        r12 = r11.level;	 Catch:{ Exception -> 0x0346 }
        r6.append(r12);	 Catch:{ Exception -> 0x0346 }
        r6 = r6.toString();	 Catch:{ Exception -> 0x0346 }
        android.util.Log.d(r4, r6);	 Catch:{ Exception -> 0x0346 }
        r4 = r11.profile;	 Catch:{ Exception -> 0x0346 }
        r1.mProfile = r4;	 Catch:{ Exception -> 0x0346 }
        r4 = "profile";
        r6 = r11.profile;	 Catch:{ Exception -> 0x0346 }
        r0.setInteger(r4, r6);	 Catch:{ Exception -> 0x0346 }
        r4 = "level";
        r6 = r11.level;	 Catch:{ Exception -> 0x0346 }
        r0.setInteger(r4, r6);	 Catch:{ Exception -> 0x0346 }
        r4 = r11.profile;	 Catch:{ Exception -> 0x0346 }
        r6 = 2;
        if (r4 == r6) goto L_0x0202;
    L_0x01ee:
        r6 = 8;
        if (r4 == r6) goto L_0x01f4;
    L_0x01f2:
        r4 = r10;
        goto L_0x020f;
    L_0x01f4:
        r4 = "AVCEncoder";
        r6 = "Set High Profile";
        android.util.Log.d(r4, r6);	 Catch:{ Exception -> 0x0346 }
        r4 = (float) r10;	 Catch:{ Exception -> 0x0346 }
        r6 = 1058306785; // 0x3f147ae1 float:0.58 double:5.22873025E-315;
        r4 = r4 * r6;
        r4 = (int) r4;	 Catch:{ Exception -> 0x0346 }
        goto L_0x020f;
    L_0x0202:
        r4 = "AVCEncoder";
        r6 = "Set Main Profile";
        android.util.Log.d(r4, r6);	 Catch:{ Exception -> 0x0346 }
        r4 = (float) r10;	 Catch:{ Exception -> 0x0346 }
        r6 = 1059816735; // 0x3f2b851f float:0.67 double:5.236190397E-315;
        r4 = r4 * r6;
        r4 = (int) r4;	 Catch:{ Exception -> 0x0346 }
    L_0x020f:
        goto L_0x022c;
    L_0x0210:
        r6 = "AVCEncoder";
        r11 = new java.lang.StringBuilder;	 Catch:{ Exception -> 0x0346 }
        r11.<init>();	 Catch:{ Exception -> 0x0346 }
        r12 = "Do not support profile ";
        r11.append(r12);	 Catch:{ Exception -> 0x0346 }
        r11.append(r4);	 Catch:{ Exception -> 0x0346 }
        r4 = ", use baseline";
        r11.append(r4);	 Catch:{ Exception -> 0x0346 }
        r4 = r11.toString();	 Catch:{ Exception -> 0x0346 }
        android.util.Log.w(r6, r4);	 Catch:{ Exception -> 0x0346 }
        r4 = r10;
    L_0x022c:
        r6 = "AVCEncoder";
        r11 = new java.lang.StringBuilder;	 Catch:{ Exception -> 0x0346 }
        r11.<init>();	 Catch:{ Exception -> 0x0346 }
        r12 = "bitrate = ";
        r11.append(r12);	 Catch:{ Exception -> 0x0346 }
        r12 = (float) r4;	 Catch:{ Exception -> 0x0346 }
        r13 = 1065353216; // 0x3f800000 float:1.0 double:5.263544247E-315;
        r12 = r12 * r13;
        r13 = 1232348160; // 0x49742400 float:1000000.0 double:6.088608896E-315;
        r12 = r12 / r13;
        r11.append(r12);	 Catch:{ Exception -> 0x0346 }
        r12 = "Mb/s";
        r11.append(r12);	 Catch:{ Exception -> 0x0346 }
        r11 = r11.toString();	 Catch:{ Exception -> 0x0346 }
        android.util.Log.d(r6, r11);	 Catch:{ Exception -> 0x0346 }
        r6 = "AVCEncoder";
        r11 = new java.lang.StringBuilder;	 Catch:{ Exception -> 0x0346 }
        r11.<init>();	 Catch:{ Exception -> 0x0346 }
        r12 = "speed = ";
        r11.append(r12);	 Catch:{ Exception -> 0x0346 }
        r12 = r23;
        r11.append(r12);	 Catch:{ Exception -> 0x0346 }
        r11 = r11.toString();	 Catch:{ Exception -> 0x0346 }
        android.util.Log.d(r6, r11);	 Catch:{ Exception -> 0x0346 }
        r6 = "bitrate";
        r0.setInteger(r6, r4);	 Catch:{ Exception -> 0x0346 }
        r4 = android.os.Build.VERSION.SDK_INT;	 Catch:{ Exception -> 0x0346 }
        if (r4 < r8) goto L_0x02d9;
    L_0x0270:
        r2 = r2.getEncoderCapabilities();	 Catch:{ Exception -> 0x0346 }
        r4 = 0;
    L_0x0275:
        if (r4 >= r7) goto L_0x029b;
    L_0x0277:
        r6 = "AVCEncoder";
        r11 = new java.lang.StringBuilder;	 Catch:{ Exception -> 0x0346 }
        r11.<init>();	 Catch:{ Exception -> 0x0346 }
        r12 = BITRATE_MODES;	 Catch:{ Exception -> 0x0346 }
        r12 = r12[r4];	 Catch:{ Exception -> 0x0346 }
        r11.append(r12);	 Catch:{ Exception -> 0x0346 }
        r12 = ": ";
        r11.append(r12);	 Catch:{ Exception -> 0x0346 }
        r12 = r2.isBitrateModeSupported(r4);	 Catch:{ Exception -> 0x0346 }
        r11.append(r12);	 Catch:{ Exception -> 0x0346 }
        r11 = r11.toString();	 Catch:{ Exception -> 0x0346 }
        android.util.Log.d(r6, r11);	 Catch:{ Exception -> 0x0346 }
        r4 = r4 + 1;
        goto L_0x0275;
    L_0x029b:
        r4 = "bitrate-mode";
        r0.setInteger(r4, r3);	 Catch:{ Exception -> 0x0346 }
        r4 = "AVCEncoder";
        r6 = new java.lang.StringBuilder;	 Catch:{ Exception -> 0x0346 }
        r6.<init>();	 Catch:{ Exception -> 0x0346 }
        r7 = "Bitrate mode = ";
        r6.append(r7);	 Catch:{ Exception -> 0x0346 }
        r6.append(r3);	 Catch:{ Exception -> 0x0346 }
        r3 = r6.toString();	 Catch:{ Exception -> 0x0346 }
        android.util.Log.d(r4, r3);	 Catch:{ Exception -> 0x0346 }
        r3 = "max-bitrate";
        r0.setInteger(r3, r10);	 Catch:{ Exception -> 0x0346 }
        r3 = "AVCEncoder";
        r4 = new java.lang.StringBuilder;	 Catch:{ Exception -> 0x0346 }
        r4.<init>();	 Catch:{ Exception -> 0x0346 }
        r6 = "Encoder ComplexityRange: ";
        r4.append(r6);	 Catch:{ Exception -> 0x0346 }
        r2 = r2.getComplexityRange();	 Catch:{ Exception -> 0x0346 }
        r2 = r2.toString();	 Catch:{ Exception -> 0x0346 }
        r4.append(r2);	 Catch:{ Exception -> 0x0346 }
        r2 = r4.toString();	 Catch:{ Exception -> 0x0346 }
        android.util.Log.d(r3, r2);	 Catch:{ Exception -> 0x0346 }
    L_0x02d9:
        r2 = "color-format";
        r0.setInteger(r2, r5);	 Catch:{ Exception -> 0x0346 }
        r2 = "frame-rate";
        r3 = r1.mFrameRate;	 Catch:{ Exception -> 0x0346 }
        r0.setInteger(r2, r3);	 Catch:{ Exception -> 0x0346 }
        r2 = "i-frame-interval";
        r0.setInteger(r2, r9);	 Catch:{ Exception -> 0x0346 }
        r2 = "AVCEncoder";
        r3 = new java.lang.StringBuilder;	 Catch:{ Exception -> 0x0346 }
        r3.<init>();	 Catch:{ Exception -> 0x0346 }
        r4 = "initAVCEncoder: format = ";
        r3.append(r4);	 Catch:{ Exception -> 0x0346 }
        r3.append(r0);	 Catch:{ Exception -> 0x0346 }
        r3 = r3.toString();	 Catch:{ Exception -> 0x0346 }
        android.util.Log.d(r2, r3);	 Catch:{ Exception -> 0x0346 }
        r2 = r1.mMediaCodec;	 Catch:{ Exception -> 0x0346 }
        r3 = 0;
        r2.configure(r0, r3, r3, r9);	 Catch:{ Exception -> 0x0346 }
        r0 = r1.mMediaCodec;	 Catch:{ Exception -> 0x0346 }
        r0 = r0.createInputSurface();	 Catch:{ Exception -> 0x0346 }
        r1.mSurface = r0;	 Catch:{ Exception -> 0x0346 }
        r0 = r1.mMediaCodec;	 Catch:{ Exception -> 0x0346 }
        r0.start();	 Catch:{ Exception -> 0x0346 }
        r0 = 2;
        r1.status = r0;	 Catch:{ Exception -> 0x0346 }
        r0 = android.os.Build.VERSION.SDK_INT;	 Catch:{ Exception -> 0x0346 }
        if (r0 >= r8) goto L_0x032a;
    L_0x031a:
        r0 = r1.mMediaCodec;	 Catch:{ Exception -> 0x0346 }
        r0 = r0.getInputBuffers();	 Catch:{ Exception -> 0x0346 }
        r1.inputBuffers = r0;	 Catch:{ Exception -> 0x0346 }
        r0 = r1.mMediaCodec;	 Catch:{ Exception -> 0x0346 }
        r0 = r0.getOutputBuffers();	 Catch:{ Exception -> 0x0346 }
        r1.outputBuffers = r0;	 Catch:{ Exception -> 0x0346 }
    L_0x032a:
        r0 = new android.media.MediaCodec$BufferInfo;	 Catch:{ Exception -> 0x0346 }
        r0.<init>();	 Catch:{ Exception -> 0x0346 }
        r1.mBufferInfo = r0;	 Catch:{ Exception -> 0x0346 }
        r0 = r1.mSurface;	 Catch:{ all -> 0x0344 }
        if (r0 != 0) goto L_0x0339;
    L_0x0336:
        monitor-exit(r17);	 Catch:{ all -> 0x0344 }
        r1 = 0;
        return r1;
    L_0x0339:
        monitor-exit(r17);	 Catch:{ all -> 0x0344 }
        r0 = "AVCEncoder";
        r2 = "initAVCEncoder == exit";
        android.util.Log.i(r0, r2);
        r0 = r1.mSurface;
        return r0;
    L_0x0344:
        r0 = move-exception;
        goto L_0x034d;
    L_0x0346:
        r0 = move-exception;
        r0.printStackTrace();	 Catch:{ all -> 0x0344 }
        monitor-exit(r17);	 Catch:{ all -> 0x0344 }
        r1 = 0;
        return r1;
    L_0x034d:
        monitor-exit(r17);	 Catch:{ all -> 0x0344 }
        throw r0;
    L_0x034f:
        r1 = 0;
        return r1;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.ss.android.medialib.AVCEncoder.initAVCEncoder(int, int, int, int, int, int, boolean):android.view.Surface");
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
    public void uninitAVCEncoder() {
        /*
        r2 = this;
        r0 = "AVCEncoder";
        r1 = "uninitAVCEncoder == enter";
        android.util.Log.i(r0, r1);
        monitor-enter(r2);
        r0 = r2.status;	 Catch:{ all -> 0x0042 }
        if (r0 == 0) goto L_0x0040;
    L_0x000c:
        r0 = r2.mMediaCodec;	 Catch:{ all -> 0x0042 }
        if (r0 != 0) goto L_0x0011;
    L_0x0010:
        goto L_0x0040;
    L_0x0011:
        r0 = r2.status;	 Catch:{ all -> 0x0042 }
        r1 = 2;
        if (r0 != r1) goto L_0x0024;
    L_0x0016:
        r0 = r2.mMediaCodec;	 Catch:{ Exception -> 0x001c }
        r0.stop();	 Catch:{ Exception -> 0x001c }
        goto L_0x0024;
    L_0x001c:
        r0 = move-exception;
        r0 = "AVCEncoder";
        r1 = "MediaCodec Exception";
        android.util.Log.e(r0, r1);	 Catch:{ all -> 0x0042 }
    L_0x0024:
        r0 = r2.mMediaCodec;	 Catch:{ Exception -> 0x002a }
        r0.release();	 Catch:{ Exception -> 0x002a }
        goto L_0x002b;
    L_0x002a:
        r0 = move-exception;
    L_0x002b:
        r0 = 0;
        r2.mMediaCodec = r0;	 Catch:{ all -> 0x0042 }
        r0 = r2.mSurface;	 Catch:{ all -> 0x0042 }
        if (r0 == 0) goto L_0x0037;
    L_0x0032:
        r0 = r2.mSurface;	 Catch:{ all -> 0x0042 }
        r0.release();	 Catch:{ all -> 0x0042 }
    L_0x0037:
        monitor-exit(r2);	 Catch:{ all -> 0x0042 }
        r0 = "AVCEncoder";
        r1 = "uninitAVCEncoder == exit";
        android.util.Log.i(r0, r1);
        return;
    L_0x0040:
        monitor-exit(r2);	 Catch:{ all -> 0x0042 }
        return;
    L_0x0042:
        r0 = move-exception;
        monitor-exit(r2);	 Catch:{ all -> 0x0042 }
        throw r0;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.ss.android.medialib.AVCEncoder.uninitAVCEncoder():void");
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
    public int encode(int r19, int r20, int r21, boolean r22) {
        /*
        r18 = this;
        r1 = r18;
        r0 = r19;
        r2 = r20;
        r3 = r22;
        r4 = "AVCEncoder";
        r5 = new java.lang.StringBuilder;
        r5.<init>();
        r6 = "encodeTexture::texID: ";
        r5.append(r6);
        r5.append(r0);
        r6 = " pts: ";
        r5.append(r6);
        r5.append(r2);
        r6 = " duration:";
        r5.append(r6);
        r6 = r21;
        r5.append(r6);
        r7 = "  isEndStream = ";
        r5.append(r7);
        r5.append(r3);
        r5 = r5.toString();
        android.util.Log.d(r4, r5);
        monitor-enter(r18);
        r4 = r1.status;	 Catch:{ all -> 0x0240 }
        r5 = 2;
        r7 = -1;
        if (r4 != r5) goto L_0x0237;
    L_0x003f:
        r4 = r1.mMediaCodec;	 Catch:{ all -> 0x0240 }
        if (r4 != 0) goto L_0x0045;
    L_0x0043:
        goto L_0x0237;
    L_0x0045:
        if (r0 <= 0) goto L_0x0217;
    L_0x0047:
        if (r2 >= 0) goto L_0x004b;
    L_0x0049:
        goto L_0x0217;
    L_0x004b:
        r4 = r1.mTextureDrawer;	 Catch:{ all -> 0x0240 }
        if (r4 != 0) goto L_0x0057;
    L_0x004f:
        r4 = r18.initEGLCtx();	 Catch:{ all -> 0x0240 }
        if (r4 != 0) goto L_0x0057;
    L_0x0055:
        monitor-exit(r18);	 Catch:{ all -> 0x0240 }
        return r7;
        r4 = r1.mPTSQueue;	 Catch:{ all -> 0x0240 }
        r2 = java.lang.Integer.valueOf(r20);	 Catch:{ all -> 0x0240 }
        r6 = java.lang.Integer.valueOf(r21);	 Catch:{ all -> 0x0240 }
        r2 = android.util.Pair.create(r2, r6);	 Catch:{ all -> 0x0240 }
        r4.offer(r2);	 Catch:{ all -> 0x0240 }
        r2 = r1.mWidth;	 Catch:{ all -> 0x0240 }
        r4 = r1.mHeight;	 Catch:{ all -> 0x0240 }
        r6 = 0;
        android.opengl.GLES20.glViewport(r6, r6, r2, r4);	 Catch:{ all -> 0x0240 }
        r2 = "AVCEncoder";
        r4 = new java.lang.StringBuilder;	 Catch:{ all -> 0x0240 }
        r4.<init>();	 Catch:{ all -> 0x0240 }
        r8 = "encode: width = ";
        r4.append(r8);	 Catch:{ all -> 0x0240 }
        r8 = r1.mWidth;	 Catch:{ all -> 0x0240 }
        r4.append(r8);	 Catch:{ all -> 0x0240 }
        r8 = " height = ";
        r4.append(r8);	 Catch:{ all -> 0x0240 }
        r8 = r1.mHeight;	 Catch:{ all -> 0x0240 }
        r4.append(r8);	 Catch:{ all -> 0x0240 }
        r4 = r4.toString();	 Catch:{ all -> 0x0240 }
        android.util.Log.v(r2, r4);	 Catch:{ all -> 0x0240 }
        r2 = r1.mTextureDrawer;	 Catch:{ all -> 0x0240 }
        r2.drawTexture(r0);	 Catch:{ all -> 0x0240 }
        android.opengl.GLES20.glFinish();	 Catch:{ all -> 0x0240 }
        r0 = r1.mDrawCount;	 Catch:{ all -> 0x0240 }
        r2 = 1;
        r0 = r0 + r2;
        r1.mDrawCount = r0;	 Catch:{ all -> 0x0240 }
        r0 = mEncoderCaller;	 Catch:{ all -> 0x0240 }
        r0.onSwapGlBuffers();	 Catch:{ all -> 0x0240 }
        r0 = r1.mFlag;	 Catch:{ all -> 0x0240 }
        if (r0 == 0) goto L_0x00af;
    L_0x00aa:
        r1.testCode(r3);	 Catch:{ all -> 0x0240 }
        r1.mFlag = r6;	 Catch:{ all -> 0x0240 }
    L_0x00af:
        if (r3 == 0) goto L_0x00b6;
    L_0x00b1:
        r0 = r1.mMediaCodec;	 Catch:{ all -> 0x0240 }
        r0.signalEndOfInputStream();	 Catch:{ all -> 0x0240 }
    L_0x00b6:
        r0 = r6;
    L_0x00b7:
        r0 = r0 + r2;
        r4 = android.os.Build.VERSION.SDK_INT;	 Catch:{ all -> 0x0240 }
        r8 = 21;
        if (r4 >= r8) goto L_0x00c6;
    L_0x00be:
        r4 = r1.mMediaCodec;	 Catch:{ all -> 0x0240 }
        r4 = r4.getOutputBuffers();	 Catch:{ all -> 0x0240 }
        r1.outputBuffers = r4;	 Catch:{ all -> 0x0240 }
    L_0x00c6:
        r4 = -2;
        r9 = r1.mMediaCodec;	 Catch:{ Throwable -> 0x0214 }
        r10 = r1.mBufferInfo;	 Catch:{ Throwable -> 0x0214 }
        r11 = TIMEOUT_USEC;	 Catch:{ Throwable -> 0x0214 }
        r11 = (long) r11;	 Catch:{ Throwable -> 0x0214 }
        r9 = r9.dequeueOutputBuffer(r10, r11);	 Catch:{ Throwable -> 0x0214 }
        r10 = "AVCEncoder";
        r11 = new java.lang.StringBuilder;	 Catch:{ all -> 0x0240 }
        r11.<init>();	 Catch:{ all -> 0x0240 }
        r12 = "outputBufferIndex = ";
        r11.append(r12);	 Catch:{ all -> 0x0240 }
        r11.append(r9);	 Catch:{ all -> 0x0240 }
        r11 = r11.toString();	 Catch:{ all -> 0x0240 }
        android.util.Log.v(r10, r11);	 Catch:{ all -> 0x0240 }
        r10 = "AVCEncoder";
        r11 = new java.lang.StringBuilder;	 Catch:{ all -> 0x0240 }
        r11.<init>();	 Catch:{ all -> 0x0240 }
        r12 = "mBufferInfo.flags = ";
        r11.append(r12);	 Catch:{ all -> 0x0240 }
        r12 = r1.mBufferInfo;	 Catch:{ all -> 0x0240 }
        r12 = r12.flags;	 Catch:{ all -> 0x0240 }
        r11.append(r12);	 Catch:{ all -> 0x0240 }
        r11 = r11.toString();	 Catch:{ all -> 0x0240 }
        android.util.Log.v(r10, r11);	 Catch:{ all -> 0x0240 }
        if (r9 != r7) goto L_0x011e;
    L_0x0105:
        if (r3 == 0) goto L_0x0111;
    L_0x0107:
        r4 = TIMEOUT_USEC;	 Catch:{ all -> 0x0240 }
        r8 = 5000; // 0x1388 float:7.006E-42 double:2.4703E-320;
        if (r4 >= r8) goto L_0x0111;
    L_0x010d:
        r4 = 10000; // 0x2710 float:1.4013E-41 double:4.9407E-320;
        TIMEOUT_USEC = r4;	 Catch:{ all -> 0x0240 }
    L_0x0111:
        if (r3 == 0) goto L_0x0140;
    L_0x0113:
        r4 = r1.mDrawCount;	 Catch:{ all -> 0x0240 }
        r8 = r1.mEncodeCount;	 Catch:{ all -> 0x0240 }
        if (r4 == r8) goto L_0x0140;
    L_0x0119:
        r4 = 10;
        if (r0 >= r4) goto L_0x0140;
    L_0x011d:
        goto L_0x00b7;
    L_0x011e:
        r10 = -3;
        if (r9 != r10) goto L_0x012b;
    L_0x0121:
        r4 = r1.mMediaCodec;	 Catch:{ all -> 0x0240 }
        r4 = r4.getOutputBuffers();	 Catch:{ all -> 0x0240 }
        r1.outputBuffers = r4;	 Catch:{ all -> 0x0240 }
        goto L_0x0212;
    L_0x012b:
        if (r9 != r4) goto L_0x0136;
    L_0x012d:
        r4 = "AVCEncoder";
        r8 = "encode: output format change!";
        android.util.Log.w(r4, r8);	 Catch:{ all -> 0x0240 }
        goto L_0x0212;
    L_0x0136:
        if (r9 >= 0) goto L_0x0147;
    L_0x0138:
        r0 = "AVCEncoder";
        r2 = "encode: error.";
        android.util.Log.w(r0, r2);	 Catch:{ all -> 0x0240 }
    L_0x0140:
        if (r3 == 0) goto L_0x0145;
    L_0x0142:
        r18.releaseEGLCtx();	 Catch:{ all -> 0x0240 }
    L_0x0145:
        monitor-exit(r18);	 Catch:{ all -> 0x0240 }
        return r6;
        r0 = android.os.Build.VERSION.SDK_INT;	 Catch:{ all -> 0x0240 }
        if (r0 < r8) goto L_0x0154;
    L_0x014c:
        r0 = r1.mMediaCodec;	 Catch:{ all -> 0x0240 }
        r0 = r0.getOutputBuffer(r9);	 Catch:{ all -> 0x0240 }
    L_0x0152:
        r11 = r0;
        goto L_0x0159;
    L_0x0154:
        r0 = r1.outputBuffers;	 Catch:{ all -> 0x0240 }
        r0 = r0[r9];	 Catch:{ all -> 0x0240 }
        goto L_0x0152;
    L_0x0159:
        r0 = r1.mBufferInfo;	 Catch:{ all -> 0x0240 }
        r0 = r0.offset;	 Catch:{ all -> 0x0240 }
        r11.position(r0);	 Catch:{ all -> 0x0240 }
        r0 = r1.mBufferInfo;	 Catch:{ all -> 0x0240 }
        r0 = r0.offset;	 Catch:{ all -> 0x0240 }
        r4 = r1.mBufferInfo;	 Catch:{ all -> 0x0240 }
        r4 = r4.size;	 Catch:{ all -> 0x0240 }
        r0 = r0 + r4;
        r11.limit(r0);	 Catch:{ all -> 0x0240 }
        r0 = r1.mBufferInfo;	 Catch:{ all -> 0x0240 }
        r0 = r0.flags;	 Catch:{ all -> 0x0240 }
        r0 = r0 & r5;
        if (r0 == 0) goto L_0x0189;
    L_0x0173:
        r0 = "AVCEncoder";
        r4 = "mEncoderCaller.onSetCodecConfig";
        android.util.Log.e(r0, r4);	 Catch:{ all -> 0x0240 }
        r0 = mEncoderCaller;	 Catch:{ all -> 0x0240 }
        if (r0 == 0) goto L_0x0183;
    L_0x017e:
        r0 = mEncoderCaller;	 Catch:{ all -> 0x0240 }
        r0.onSetCodecConfig(r11);	 Catch:{ all -> 0x0240 }
    L_0x0183:
        r0 = r1.mBufferInfo;	 Catch:{ all -> 0x0240 }
        r0.size = r6;	 Catch:{ all -> 0x0240 }
        goto L_0x020c;
        r0 = r1.mBufferInfo;	 Catch:{ all -> 0x0240 }
        r0 = r0.flags;	 Catch:{ all -> 0x0240 }
        r0 = r0 & r2;
        if (r0 == 0) goto L_0x0195;
        r17 = r2;
        goto L_0x0197;
    L_0x0195:
        r17 = r6;
    L_0x0197:
        r0 = "AVCEncoder";
        r4 = "mEncoderCaller.onWriteFile";
        android.util.Log.v(r0, r4);	 Catch:{ all -> 0x0240 }
        r0 = mEncoderCaller;	 Catch:{ all -> 0x0240 }
        if (r0 == 0) goto L_0x0205;
    L_0x01a2:
        r0 = "AVCEncoder";
        r4 = new java.lang.StringBuilder;	 Catch:{ all -> 0x0240 }
        r4.<init>();	 Catch:{ all -> 0x0240 }
        r8 = "encode: pts queue size = ";
        r4.append(r8);	 Catch:{ all -> 0x0240 }
        r8 = r1.mPTSQueue;	 Catch:{ all -> 0x0240 }
        r8 = r8.size();	 Catch:{ all -> 0x0240 }
        r4.append(r8);	 Catch:{ all -> 0x0240 }
        r4 = r4.toString();	 Catch:{ all -> 0x0240 }
        android.util.Log.d(r0, r4);	 Catch:{ all -> 0x0240 }
        r0 = r1.mPTSQueue;	 Catch:{ all -> 0x0240 }
        r0 = r0.size();	 Catch:{ all -> 0x0240 }
        if (r0 <= 0) goto L_0x01fd;
    L_0x01c6:
        r0 = r1.mEncodeCount;	 Catch:{ all -> 0x0240 }
        r0 = r0 + r2;
        r1.mEncodeCount = r0;	 Catch:{ all -> 0x0240 }
        r0 = r1.mPTSQueue;	 Catch:{ all -> 0x0240 }
        r0 = r0.poll();	 Catch:{ all -> 0x0240 }
        r0 = (android.util.Pair) r0;	 Catch:{ all -> 0x0240 }
        r4 = r1.mBufferInfo;	 Catch:{ all -> 0x0240 }
        r12 = r4.presentationTimeUs;	 Catch:{ all -> 0x0240 }
        r14 = 0;
        r4 = (r12 > r14 ? 1 : (r12 == r14 ? 0 : -1));
        if (r4 <= 0) goto L_0x01e2;
    L_0x01dd:
        r4 = r1.mBufferInfo;	 Catch:{ all -> 0x0240 }
        r14 = r4.presentationTimeUs;	 Catch:{ all -> 0x0240 }
    L_0x01e2:
        r10 = mEncoderCaller;	 Catch:{ all -> 0x0240 }
        r12 = 1000; // 0x3e8 float:1.401E-42 double:4.94E-321;
        r12 = r14 / r12;
        r4 = r0.first;	 Catch:{ all -> 0x0240 }
        r4 = (java.lang.Integer) r4;	 Catch:{ all -> 0x0240 }
        r4 = r4.intValue();	 Catch:{ all -> 0x0240 }
        r14 = (long) r4;	 Catch:{ all -> 0x0240 }
        r0 = r0.second;	 Catch:{ all -> 0x0240 }
        r0 = (java.lang.Integer) r0;	 Catch:{ all -> 0x0240 }
        r16 = r0.intValue();	 Catch:{ all -> 0x0240 }
        r10.onWriteFile(r11, r12, r14, r16, r17);	 Catch:{ all -> 0x0240 }
        goto L_0x020c;
    L_0x01fd:
        r0 = "AVCEncoder";
        r4 = "encode: no available pts!!!";
        android.util.Log.w(r0, r4);	 Catch:{ all -> 0x0240 }
        goto L_0x020c;
    L_0x0205:
        r0 = "AVCEncoder";
        r4 = "encode: no output.";
        android.util.Log.i(r0, r4);	 Catch:{ all -> 0x0240 }
    L_0x020c:
        r0 = r1.mMediaCodec;	 Catch:{ all -> 0x0240 }
        r0.releaseOutputBuffer(r9, r6);	 Catch:{ all -> 0x0240 }
        r0 = r6;
    L_0x0212:
        goto L_0x00b7;
    L_0x0214:
        r0 = move-exception;
        monitor-exit(r18);	 Catch:{ all -> 0x0240 }
        return r4;
    L_0x0217:
        r3 = "AVCEncoder";
        r4 = new java.lang.StringBuilder;	 Catch:{ all -> 0x0240 }
        r4.<init>();	 Catch:{ all -> 0x0240 }
        r5 = "encode: invalidate params: texID = ";
        r4.append(r5);	 Catch:{ all -> 0x0240 }
        r4.append(r0);	 Catch:{ all -> 0x0240 }
        r0 = ", pts = ";
        r4.append(r0);	 Catch:{ all -> 0x0240 }
        r4.append(r2);	 Catch:{ all -> 0x0240 }
        r0 = r4.toString();	 Catch:{ all -> 0x0240 }
        android.util.Log.e(r3, r0);	 Catch:{ all -> 0x0240 }
        monitor-exit(r18);	 Catch:{ all -> 0x0240 }
        return r7;
    L_0x0237:
        r0 = "AVCEncoder";
        r2 = "encode: codec is not reayd.";
        android.util.Log.w(r0, r2);	 Catch:{ all -> 0x0240 }
        monitor-exit(r18);	 Catch:{ all -> 0x0240 }
        return r7;
    L_0x0240:
        r0 = move-exception;
        monitor-exit(r18);	 Catch:{ all -> 0x0240 }
        throw r0;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.ss.android.medialib.AVCEncoder.encode(int, int, int, boolean):int");
    }

    /* JADX WARNING: Missing block: B:62:0x01b2, code:
            return 0;
     */
    public int encode(byte[] r22, int r23, boolean r24) {
        /*
        r21 = this;
        r1 = r21;
        r0 = r22;
        r2 = r23;
        r3 = r24;
        monitor-enter(r21);
        r4 = r1.status;	 Catch:{ all -> 0x01b6 }
        r5 = 2;
        if (r4 != r5) goto L_0x01b3;
    L_0x000e:
        r4 = r1.mMediaCodec;	 Catch:{ all -> 0x01b6 }
        if (r4 != 0) goto L_0x0014;
    L_0x0012:
        goto L_0x01b3;
    L_0x0014:
        r4 = "AVCEncoder";
        r6 = new java.lang.StringBuilder;	 Catch:{ all -> 0x01b6 }
        r6.<init>();	 Catch:{ all -> 0x01b6 }
        r7 = "encodeBuffer pts: ";
        r6.append(r7);	 Catch:{ all -> 0x01b6 }
        r6.append(r2);	 Catch:{ all -> 0x01b6 }
        r7 = "  isEndStream = ";
        r6.append(r7);	 Catch:{ all -> 0x01b6 }
        r6.append(r3);	 Catch:{ all -> 0x01b6 }
        r6 = r6.toString();	 Catch:{ all -> 0x01b6 }
        android.util.Log.e(r4, r6);	 Catch:{ all -> 0x01b6 }
        r4 = android.os.Build.VERSION.SDK_INT;	 Catch:{ all -> 0x01b6 }
        r6 = 21;
        r7 = 0;
        r9 = 4;
        r10 = -1;
        r12 = 1;
        r13 = 0;
        if (r4 < r6) goto L_0x010c;
    L_0x0040:
        r4 = r1.mMediaCodec;	 Catch:{ all -> 0x01b6 }
        r15 = r4.dequeueInputBuffer(r10);	 Catch:{ all -> 0x01b6 }
        if (r15 < 0) goto L_0x0069;
    L_0x0048:
        r4 = r1.mMediaCodec;	 Catch:{ all -> 0x01b6 }
        r4 = r4.getInputBuffer(r15);	 Catch:{ all -> 0x01b6 }
        r4.clear();	 Catch:{ all -> 0x01b6 }
        r6 = r0.length;	 Catch:{ all -> 0x01b6 }
        r4.put(r0, r13, r6);	 Catch:{ all -> 0x01b6 }
        r14 = r1.mMediaCodec;	 Catch:{ all -> 0x01b6 }
        r16 = 0;
        r0 = r0.length;	 Catch:{ all -> 0x01b6 }
        r10 = (long) r2;	 Catch:{ all -> 0x01b6 }
        if (r3 != r12) goto L_0x0060;
    L_0x005d:
        r20 = r9;
        goto L_0x0062;
    L_0x0060:
        r20 = r13;
    L_0x0062:
        r17 = r0;
        r18 = r10;
        r14.queueInputBuffer(r15, r16, r17, r18, r20);	 Catch:{ all -> 0x01b6 }
    L_0x0069:
        r0 = r1.mMediaCodec;	 Catch:{ all -> 0x01b6 }
        r2 = r1.mBufferInfo;	 Catch:{ all -> 0x01b6 }
        r3 = TIMEOUT_USEC;	 Catch:{ all -> 0x01b6 }
        r3 = (long) r3;	 Catch:{ all -> 0x01b6 }
        r0 = r0.dequeueOutputBuffer(r2, r3);	 Catch:{ all -> 0x01b6 }
        r2 = "AVCEncoder";
        r3 = new java.lang.StringBuilder;	 Catch:{ all -> 0x01b6 }
        r3.<init>();	 Catch:{ all -> 0x01b6 }
        r4 = "outputBufferIndex = ";
        r3.append(r4);	 Catch:{ all -> 0x01b6 }
        r3.append(r0);	 Catch:{ all -> 0x01b6 }
        r3 = r3.toString();	 Catch:{ all -> 0x01b6 }
        android.util.Log.e(r2, r3);	 Catch:{ all -> 0x01b6 }
        r2 = "AVCEncoder";
        r3 = new java.lang.StringBuilder;	 Catch:{ all -> 0x01b6 }
        r3.<init>();	 Catch:{ all -> 0x01b6 }
        r4 = "mBufferInfo.flags = ";
        r3.append(r4);	 Catch:{ all -> 0x01b6 }
        r4 = r1.mBufferInfo;	 Catch:{ all -> 0x01b6 }
        r4 = r4.flags;	 Catch:{ all -> 0x01b6 }
        r3.append(r4);	 Catch:{ all -> 0x01b6 }
        r3 = r3.toString();	 Catch:{ all -> 0x01b6 }
        android.util.Log.e(r2, r3);	 Catch:{ all -> 0x01b6 }
    L_0x00a4:
        if (r0 < 0) goto L_0x010a;
    L_0x00a6:
        r2 = r1.mMediaCodec;	 Catch:{ all -> 0x01b6 }
        r2 = r2.getOutputBuffer(r0);	 Catch:{ all -> 0x01b6 }
        r3 = r1.mBufferInfo;	 Catch:{ all -> 0x01b6 }
        r3 = r3.offset;	 Catch:{ all -> 0x01b6 }
        r2.position(r3);	 Catch:{ all -> 0x01b6 }
        r3 = r1.mBufferInfo;	 Catch:{ all -> 0x01b6 }
        r3 = r3.offset;	 Catch:{ all -> 0x01b6 }
        r4 = r1.mBufferInfo;	 Catch:{ all -> 0x01b6 }
        r4 = r4.size;	 Catch:{ all -> 0x01b6 }
        r3 = r3 + r4;
        r2.limit(r3);	 Catch:{ all -> 0x01b6 }
        r3 = r1.mBufferInfo;	 Catch:{ all -> 0x01b6 }
        r3 = r3.flags;	 Catch:{ all -> 0x01b6 }
        r3 = r3 & r5;
        if (r3 == 0) goto L_0x00db;
    L_0x00c6:
        r3 = "AVCEncoder";
        r4 = "mEncoderCaller.onSetCodecConfig";
        android.util.Log.e(r3, r4);	 Catch:{ all -> 0x01b6 }
        r3 = mEncoderCaller;	 Catch:{ all -> 0x01b6 }
        if (r3 == 0) goto L_0x00d6;
    L_0x00d1:
        r3 = mEncoderCaller;	 Catch:{ all -> 0x01b6 }
        r3.onSetCodecConfig(r2);	 Catch:{ all -> 0x01b6 }
    L_0x00d6:
        r2 = r1.mBufferInfo;	 Catch:{ all -> 0x01b6 }
        r2.size = r13;	 Catch:{ all -> 0x01b6 }
        goto L_0x00fc;
    L_0x00db:
        r3 = r1.mBufferInfo;	 Catch:{ all -> 0x01b6 }
        r3 = r3.presentationTimeUs;	 Catch:{ all -> 0x01b6 }
        r3 = (int) r3;	 Catch:{ all -> 0x01b6 }
        r4 = r1.mBufferInfo;	 Catch:{ all -> 0x01b6 }
        r4 = r4.flags;	 Catch:{ all -> 0x01b6 }
        r4 = r4 & r12;
        if (r4 == 0) goto L_0x00eb;
        r4 = r12;
        goto L_0x00ec;
    L_0x00eb:
        r4 = r13;
    L_0x00ec:
        r6 = "AVCEncoder";
        r9 = "mEncoderCaller.onWriteFile";
        android.util.Log.e(r6, r9);	 Catch:{ all -> 0x01b6 }
        r6 = mEncoderCaller;	 Catch:{ all -> 0x01b6 }
        if (r6 == 0) goto L_0x00fc;
    L_0x00f7:
        r6 = mEncoderCaller;	 Catch:{ all -> 0x01b6 }
        r6.onWriteFile(r2, r3, r13, r4);	 Catch:{ all -> 0x01b6 }
    L_0x00fc:
        r2 = r1.mMediaCodec;	 Catch:{ all -> 0x01b6 }
        r2.releaseOutputBuffer(r0, r13);	 Catch:{ all -> 0x01b6 }
        r0 = r1.mMediaCodec;	 Catch:{ all -> 0x01b6 }
        r2 = r1.mBufferInfo;	 Catch:{ all -> 0x01b6 }
        r0 = r0.dequeueOutputBuffer(r2, r7);	 Catch:{ all -> 0x01b6 }
        goto L_0x00a4;
    L_0x010a:
        goto L_0x01b1;
    L_0x010c:
        r4 = r1.mMediaCodec;	 Catch:{ all -> 0x01b6 }
        r15 = r4.dequeueInputBuffer(r10);	 Catch:{ all -> 0x01b6 }
        if (r15 < 0) goto L_0x0133;
    L_0x0114:
        r4 = r1.inputBuffers;	 Catch:{ all -> 0x01b6 }
        r4 = r4[r15];	 Catch:{ all -> 0x01b6 }
        r4.clear();	 Catch:{ all -> 0x01b6 }
        r6 = r0.length;	 Catch:{ all -> 0x01b6 }
        r4.put(r0, r13, r6);	 Catch:{ all -> 0x01b6 }
        r14 = r1.mMediaCodec;	 Catch:{ all -> 0x01b6 }
        r16 = 0;
        r0 = r0.length;	 Catch:{ all -> 0x01b6 }
        r10 = (long) r2;	 Catch:{ all -> 0x01b6 }
        if (r3 != r12) goto L_0x012a;
    L_0x0127:
        r20 = r9;
        goto L_0x012c;
    L_0x012a:
        r20 = r13;
    L_0x012c:
        r17 = r0;
        r18 = r10;
        r14.queueInputBuffer(r15, r16, r17, r18, r20);	 Catch:{ all -> 0x01b6 }
    L_0x0133:
        r0 = r1.mMediaCodec;	 Catch:{ all -> 0x01b6 }
        r2 = r1.mBufferInfo;	 Catch:{ all -> 0x01b6 }
        r3 = TIMEOUT_USEC;	 Catch:{ all -> 0x01b6 }
        r3 = (long) r3;	 Catch:{ all -> 0x01b6 }
        r0 = r0.dequeueOutputBuffer(r2, r3);	 Catch:{ all -> 0x01b6 }
    L_0x013e:
        if (r0 < 0) goto L_0x01b1;
    L_0x0140:
        r2 = -3;
        if (r0 != r2) goto L_0x014c;
    L_0x0143:
        r0 = r1.mMediaCodec;	 Catch:{ all -> 0x01b6 }
        r0 = r0.getOutputBuffers();	 Catch:{ all -> 0x01b6 }
        r1.outputBuffers = r0;	 Catch:{ all -> 0x01b6 }
        goto L_0x01a8;
    L_0x014c:
        r2 = -2;
        if (r0 == r2) goto L_0x01a8;
    L_0x014f:
        r2 = r1.outputBuffers;	 Catch:{ all -> 0x01b6 }
        r2 = r2[r0];	 Catch:{ all -> 0x01b6 }
        r3 = r1.mBufferInfo;	 Catch:{ all -> 0x01b6 }
        r3 = r3.offset;	 Catch:{ all -> 0x01b6 }
        r2.position(r3);	 Catch:{ all -> 0x01b6 }
        r3 = r1.mBufferInfo;	 Catch:{ all -> 0x01b6 }
        r3 = r3.offset;	 Catch:{ all -> 0x01b6 }
        r4 = r1.mBufferInfo;	 Catch:{ all -> 0x01b6 }
        r4 = r4.size;	 Catch:{ all -> 0x01b6 }
        r3 = r3 + r4;
        r2.limit(r3);	 Catch:{ all -> 0x01b6 }
        r3 = r1.mBufferInfo;	 Catch:{ all -> 0x01b6 }
        r3 = r3.flags;	 Catch:{ all -> 0x01b6 }
        r3 = r3 & r5;
        if (r3 == 0) goto L_0x0182;
    L_0x016d:
        r3 = "AVCEncoder";
        r4 = "mEncoderCaller.onSetCodecConfig";
        android.util.Log.e(r3, r4);	 Catch:{ all -> 0x01b6 }
        r3 = mEncoderCaller;	 Catch:{ all -> 0x01b6 }
        if (r3 == 0) goto L_0x017d;
    L_0x0178:
        r3 = mEncoderCaller;	 Catch:{ all -> 0x01b6 }
        r3.onSetCodecConfig(r2);	 Catch:{ all -> 0x01b6 }
    L_0x017d:
        r2 = r1.mBufferInfo;	 Catch:{ all -> 0x01b6 }
        r2.size = r13;	 Catch:{ all -> 0x01b6 }
        goto L_0x01a3;
    L_0x0182:
        r3 = r1.mBufferInfo;	 Catch:{ all -> 0x01b6 }
        r3 = r3.presentationTimeUs;	 Catch:{ all -> 0x01b6 }
        r3 = (int) r3;	 Catch:{ all -> 0x01b6 }
        r4 = r1.mBufferInfo;	 Catch:{ all -> 0x01b6 }
        r4 = r4.flags;	 Catch:{ all -> 0x01b6 }
        r4 = r4 & r12;
        if (r4 == 0) goto L_0x0192;
        r4 = r12;
        goto L_0x0193;
    L_0x0192:
        r4 = r13;
    L_0x0193:
        r6 = "AVCEncoder";
        r9 = "mEncoderCaller.onWriteFile";
        android.util.Log.e(r6, r9);	 Catch:{ all -> 0x01b6 }
        r6 = mEncoderCaller;	 Catch:{ all -> 0x01b6 }
        if (r6 == 0) goto L_0x01a3;
    L_0x019e:
        r6 = mEncoderCaller;	 Catch:{ all -> 0x01b6 }
        r6.onWriteFile(r2, r3, r13, r4);	 Catch:{ all -> 0x01b6 }
    L_0x01a3:
        r2 = r1.mMediaCodec;	 Catch:{ all -> 0x01b6 }
        r2.releaseOutputBuffer(r0, r13);	 Catch:{ all -> 0x01b6 }
    L_0x01a8:
        r0 = r1.mMediaCodec;	 Catch:{ all -> 0x01b6 }
        r2 = r1.mBufferInfo;	 Catch:{ all -> 0x01b6 }
        r0 = r0.dequeueOutputBuffer(r2, r7);	 Catch:{ all -> 0x01b6 }
        goto L_0x013e;
    L_0x01b1:
        monitor-exit(r21);	 Catch:{ all -> 0x01b6 }
        return r13;
    L_0x01b3:
        r0 = -1;
        monitor-exit(r21);	 Catch:{ all -> 0x01b6 }
        return r0;
    L_0x01b6:
        r0 = move-exception;
        monitor-exit(r21);	 Catch:{ all -> 0x01b6 }
        throw r0;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.ss.android.medialib.AVCEncoder.encode(byte[], int, boolean):int");
    }
}
