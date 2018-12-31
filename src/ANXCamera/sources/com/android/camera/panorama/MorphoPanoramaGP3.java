package com.android.camera.panorama;

import android.graphics.Bitmap;
import android.graphics.Rect;
import android.media.Image;
import android.text.format.DateFormat;
import android.util.Log;
import com.android.camera.panorama.MorphoSensorFusion.SensorData;
import java.io.FileDescriptor;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Locale;

public class MorphoPanoramaGP3 {
    public static final int DIRECTION_AUTO = 0;
    public static final int DIRECTION_HORIZONTAL = 2;
    public static final int DIRECTION_HORIZONTAL_LEFT = 5;
    public static final int DIRECTION_HORIZONTAL_RIGHT = 6;
    public static final int DIRECTION_INVALID = -1;
    public static final int DIRECTION_VERTICAL = 1;
    public static final int DIRECTION_VERTICAL_DOWN = 4;
    public static final int DIRECTION_VERTICAL_UP = 3;
    public static final int END_MODE_CANCEL = 2;
    public static final int END_MODE_MAKE_360 = 0;
    public static final int END_MODE_NOT_MAKE_360 = 1;
    public static final int END_STATUS_CANCEL = 2;
    public static final int END_STATUS_MAKE_360 = 0;
    public static final int END_STATUS_NOT_MAKE_360 = 1;
    public static final int ERROR_INVALID_DIR = -1073741823;
    public static final int FAST_SPEED_THRESHOLD = 4500;
    private static double GAIN_COEF = 1.0d;
    public static final int MODE_PANORAMA = 0;
    public static final int MODE_SCANNER = 1;
    private static final int POINT_INFO_SIZE = 2;
    private static final int POINT_X_OFFSET = 0;
    private static final int POINT_Y_OFFSET = 1;
    private static final int RECT_BOTTOM_OFFSET = 3;
    private static final int RECT_INFO_SIZE = 4;
    private static final int RECT_LEFT_OFFSET = 0;
    private static final int RECT_RIGHT_OFFSET = 2;
    private static final int RECT_TOP_OFFSET = 1;
    public static final String TAG = "MorphoPanoramaGP3";
    private static final boolean USE_STANDARD_DEVIATION = true;
    private long mAttachCount;
    private boolean mAttachEnabled;
    private long mAttachFirstNanoTime;
    private long mAttachLastNanoTime;
    private String mFolderPathInputImages;
    private final GravityParam mGravity;
    private int[] mIndexBase;
    private String mInputImageFormat;
    private ArrayList<Long> mIntervalArray;
    private long mNative;
    private long mNativeOutputInfo;
    private boolean mSaveInputImages;

    public static class GalleryInfoData {
        public int crop_height;
        public int crop_left;
        public int crop_top;
        public int crop_width;
        public int whole_height;
        public int whole_width;

        public String toString() {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("GalleryInfoData{whole_width=");
            stringBuilder.append(this.whole_width);
            stringBuilder.append(", whole_height=");
            stringBuilder.append(this.whole_height);
            stringBuilder.append(", crop_left=");
            stringBuilder.append(this.crop_left);
            stringBuilder.append(", crop_top=");
            stringBuilder.append(this.crop_top);
            stringBuilder.append(", crop_width=");
            stringBuilder.append(this.crop_width);
            stringBuilder.append(", crop_height=");
            stringBuilder.append(this.crop_height);
            stringBuilder.append('}');
            return stringBuilder.toString();
        }
    }

    public static class GravityParam {
        public double x = 0.0d;
        public double y = 0.0d;
        public double z = 0.0d;

        public GravityParam copyInstance() {
            GravityParam gravityParam = new GravityParam();
            gravityParam.x = this.x;
            gravityParam.y = this.y;
            gravityParam.z = this.z;
            return gravityParam;
        }
    }

    public static class InitParam {
        public double aovx;
        public double aovy;
        public int direction;
        public double goal_angle;
        public String input_format;
        public int input_height;
        public int input_width;
        public String output_format;
        public int output_rotation;
    }

    private native long createNativeObject();

    private native long createNativeOutputInfoObject();

    private native void deleteNativeObject(long j);

    private native void deleteNativeOutputInfoObject(long j);

    private native int nativeAttach(long j, byte[] bArr);

    private native int nativeAttachYuv(long j, ByteBuffer byteBuffer, ByteBuffer byteBuffer2, ByteBuffer byteBuffer3, int i, int i2, int i3, int i4, int i5, int i6, String str, double[] dArr);

    private native int nativeCreateOutputImage(long j, int i, int i2, int i3, int i4);

    private native int nativeEnd(long j, int i, double d);

    private native int nativeFinish(long j);

    private native int nativeGetClippingRect(long j, int[] iArr);

    private native int nativeGetDirection(long j, int[] iArr);

    private native int nativeGetEndStatus(long j);

    private static native int nativeGetGain(ByteBuffer byteBuffer, ByteBuffer byteBuffer2, ByteBuffer byteBuffer3, int i, int i2, int i3, int i4, int i5, int i6, String str, int i7, int i8, double[] dArr);

    private native int nativeGetImage(long j, byte[] bArr, int i, int i2, int i3, int i4);

    private native int nativeGetOutputImage(long j, byte[] bArr, int i, int i2, int i3, int i4);

    private native int nativeGetOutputSize(long j, int[] iArr);

    private native int nativeGetRotatedSmallImage(long j, byte[] bArr, int i, int i2, int i3, int i4, int i5, int i6);

    private static native String nativeGetVersion();

    private native int nativeInitialize(long j, InitParam initParam, long j2);

    private native int nativePreparePanorama360(long j, int i, int i2, String str, String str2, boolean z, GalleryInfoData galleryInfoData);

    private static native int nativeRenderByteArray(byte[] bArr, ByteBuffer byteBuffer, ByteBuffer byteBuffer2, ByteBuffer byteBuffer3, int i, int i2, int i3, int i4, int i5, int i6, String str, int i7, int i8);

    private static native int nativeRenderByteArrayRaw(byte[] bArr, byte[] bArr2, String str, int i, int i2);

    private static native int nativeRenderByteBuffer(ByteBuffer byteBuffer, ByteBuffer byteBuffer2, ByteBuffer byteBuffer3, ByteBuffer byteBuffer4, int i, int i2, int i3, int i4, int i5, int i6, String str, int i7, int i8);

    private static native int nativeRenderByteBufferRaw(ByteBuffer byteBuffer, byte[] bArr, String str, int i, int i2);

    private native int nativeSaveLog(long j, String str, String str2);

    private static native int nativeSaveNotPanorama(ByteBuffer byteBuffer, ByteBuffer byteBuffer2, ByteBuffer byteBuffer3, ByteBuffer byteBuffer4, int i, int i2, int i3, int i4, int i5, int i6, String str, int i7, int i8, String str2, int i9);

    private native int nativeSavePanorama360(long j, int i, int i2, String str, int i3, String str2, String str3, boolean z, GalleryInfoData galleryInfoData, boolean z2);

    private native int nativeSavePanorama360Delay(long j, String str, int i, boolean z, int i2, boolean z2);

    private native int nativeSaveYuv(long j, ByteBuffer byteBuffer, ByteBuffer byteBuffer2, ByteBuffer byteBuffer3, int i, int i2, int i3, int i4, int i5, int i6, String str);

    private native int nativeSetAovGain(long j, double d);

    private native int nativeSetCalcseamPixnum(long j, int i);

    private native int nativeSetDistortionCorrectionParam(long j, double d, double d2, double d3, double d4);

    private native int nativeSetDrawThreshold(long j, double d);

    private native int nativeSetGyroscopeData(long j, SensorData[] sensorDataArr);

    private native int nativeSetImageFormat(long j, String str);

    private native int nativeSetInitialRotationByGravity(long j, double d, double d2, double d3);

    private native int nativeSetMotionDetectionMode(long j, int i);

    private native int nativeSetNoiseReductionParam(long j, int i);

    private native int nativeSetPreviewImage(long j, int i, int i2);

    private native int nativeSetProjectionMode(long j, int i);

    private native int nativeSetRotationRatio(long j, double d);

    private native int nativeSetRotationVector(long j, double[] dArr);

    private native int nativeSetSeamsearchRatio(long j, double d);

    private native int nativeSetSensorUseMode(long j, int i);

    private native int nativeSetShrinkRatio(long j, double d);

    private native int nativeSetUnsharpStrength(long j, int i);

    private native int nativeSetUseDeform(long j, int i);

    private native int nativeSetUseLuminanceCorrection(long j, int i);

    private native int nativeSetZrotationCoeff(long j, double d);

    private native int nativeStart(long j, int i, int i2);

    private native int nativeUpdatePreviewImage(long j, Bitmap bitmap);

    private static native int nativeYuv2Bitmap8888(byte[] bArr, int i, int i2, Bitmap bitmap, int i3, int i4);

    static {
        try {
            System.loadLibrary("morpho_panorama_gp3");
        } catch (UnsatisfiedLinkError e) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("can't loadLibrary, ");
            stringBuilder.append(e.getMessage());
            Log.e(str, stringBuilder.toString());
        }
    }

    public MorphoPanoramaGP3() {
        this.mNative = 0;
        this.mNativeOutputInfo = 0;
        this.mSaveInputImages = false;
        this.mIntervalArray = null;
        this.mAttachEnabled = false;
        this.mGravity = new GravityParam();
        this.mIndexBase = new int[4];
        this.mAttachFirstNanoTime = 0;
        this.mAttachLastNanoTime = 0;
        this.mIntervalArray = new ArrayList();
    }

    public void setAttachEnabled(boolean z) {
        this.mAttachEnabled = z;
    }

    public static String getVersion() {
        return nativeGetVersion();
    }

    public int initialize(InitParam initParam) {
        if (this.mNativeOutputInfo == 0) {
            return -2147483646;
        }
        int nativeInitialize;
        this.mNative = createNativeObject();
        if (this.mNative != 0) {
            nativeInitialize = nativeInitialize(this.mNative, initParam, this.mNativeOutputInfo);
        } else {
            nativeInitialize = -2147483644;
        }
        return nativeInitialize;
    }

    public int finish(boolean z) {
        if (this.mNative == 0) {
            return -2147483646;
        }
        int nativeFinish = nativeFinish(this.mNative);
        if (!z) {
            return nativeFinish;
        }
        deleteNativeObject(this.mNative);
        this.mNative = 0;
        return nativeFinish;
    }

    public int deleteObject() {
        if (this.mNative != 0) {
            deleteNativeObject(this.mNative);
            this.mNative = 0;
        }
        return 0;
    }

    public int start(int i, int i2) {
        if (this.mNative == 0) {
            return -2147483646;
        }
        i = nativeStart(this.mNative, i, i2);
        this.mAttachCount = 0;
        return i;
    }

    public int attach(byte[] bArr) {
        if (this.mNative == 0) {
            return -2147483646;
        }
        int nativeAttach = nativeAttach(this.mNative, bArr);
        if (this.mSaveInputImages) {
            String.format(Locale.US, "%06d", new Object[]{Long.valueOf(this.mAttachCount)});
        }
        this.mAttachCount++;
        return nativeAttach;
    }

    /* JADX WARNING: Removed duplicated region for block: B:17:0x0112  */
    /* JADX WARNING: Removed duplicated region for block: B:16:0x00f3  */
    /* JADX WARNING: Removed duplicated region for block: B:23:0x015b  */
    public int attach(java.nio.ByteBuffer r21, java.nio.ByteBuffer r22, java.nio.ByteBuffer r23, int r24, int r25, int r26, int r27, int r28, int r29, com.android.camera.panorama.SensorInfoManager r30, double[] r31, android.content.Context r32) {
        /*
        r20 = this;
        r14 = r20;
        r0 = r30;
        r1 = r14.mNative;
        r3 = 0;
        r1 = (r1 > r3 ? 1 : (r1 == r3 ? 0 : -1));
        if (r1 != 0) goto L_0x0010;
    L_0x000c:
        r0 = -2147483646; // 0xffffffff80000002 float:-2.8E-45 double:NaN;
        return r0;
    L_0x0010:
        r1 = r14.mAttachCount;
        r1 = (r1 > r3 ? 1 : (r1 == r3 ? 0 : -1));
        if (r1 != 0) goto L_0x001c;
    L_0x0016:
        r1 = java.lang.System.nanoTime();
        r14.mAttachFirstNanoTime = r1;
        r15 = java.lang.System.nanoTime();
        r1 = 0;
        r2 = r14.mSaveInputImages;
        r13 = 1;
        r17 = 0;
        if (r2 == 0) goto L_0x00ee;
    L_0x0029:
        r1 = 2;
        if (r0 == 0) goto L_0x00ba;
    L_0x002c:
        r2 = r0.timeMillis;
        r2 = createName(r2);
        r3 = java.util.Locale.US;
        r4 = "%s/%06d_";
        r5 = new java.lang.Object[r1];
        r6 = r14.mFolderPathInputImages;
        r5[r17] = r6;
        r6 = r14.mAttachCount;
        r6 = java.lang.Long.valueOf(r6);
        r5[r13] = r6;
        r3 = java.lang.String.format(r3, r4, r5);
        r4 = new java.lang.StringBuilder;
        r4.<init>();
        r4.append(r3);
        r4.append(r2);
        r2 = java.util.Locale.US;
        r3 = "_sg%05d_sr%05d_sa%05d.yuv";
        r5 = 3;
        r6 = new java.lang.Object[r5];
        r7 = r0.g_ix;
        r8 = r14.mIndexBase;
        r8 = r8[r17];
        r7 = r7 + r8;
        r7 = java.lang.Integer.valueOf(r7);
        r6[r17] = r7;
        r7 = r0.r_ix;
        r8 = r14.mIndexBase;
        r8 = r8[r5];
        r7 = r7 + r8;
        r7 = java.lang.Integer.valueOf(r7);
        r6[r13] = r7;
        r7 = r0.a_ix;
        r8 = r14.mIndexBase;
        r8 = r8[r13];
        r7 = r7 + r8;
        r7 = java.lang.Integer.valueOf(r7);
        r6[r1] = r7;
        r1 = java.lang.String.format(r2, r3, r6);
        r4.append(r1);
        r1 = r4.toString();
        r2 = r14.mIndexBase;
        r3 = r2[r17];
        r4 = r0.sensorData;
        r4 = r4[r17];
        r4 = r4.size();
        r3 = r3 + r4;
        r2[r17] = r3;
        r2 = r14.mIndexBase;
        r3 = r2[r5];
        r4 = r0.sensorData;
        r4 = r4[r5];
        r4 = r4.size();
        r3 = r3 + r4;
        r2[r5] = r3;
        r2 = r14.mIndexBase;
        r3 = r2[r13];
        r0 = r0.sensorData;
        r0 = r0[r13];
        r0 = r0.size();
        r3 = r3 + r0;
        r2[r13] = r3;
        goto L_0x00ee;
    L_0x00ba:
        r2 = java.lang.System.currentTimeMillis();
        r0 = createName(r2);
        r2 = java.util.Locale.US;
        r3 = "%s/%06d_";
        r1 = new java.lang.Object[r1];
        r4 = r14.mFolderPathInputImages;
        r1[r17] = r4;
        r4 = r14.mAttachCount;
        r4 = java.lang.Long.valueOf(r4);
        r1[r13] = r4;
        r1 = java.lang.String.format(r2, r3, r1);
        r2 = new java.lang.StringBuilder;
        r2.<init>();
        r2.append(r1);
        r2.append(r0);
        r0 = ".yuv";
        r2.append(r0);
        r0 = r2.toString();
        r12 = r0;
        goto L_0x00ef;
    L_0x00ee:
        r12 = r1;
    L_0x00ef:
        r0 = r14.mAttachEnabled;
        if (r0 == 0) goto L_0x0112;
    L_0x00f3:
        r1 = r14.mNative;
        r0 = r14;
        r3 = r21;
        r4 = r22;
        r5 = r23;
        r6 = r24;
        r7 = r25;
        r8 = r26;
        r9 = r27;
        r10 = r28;
        r11 = r29;
        r18 = r15;
        r15 = r13;
        r13 = r31;
        r0 = r0.nativeAttachYuv(r1, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13);
        goto L_0x0133;
    L_0x0112:
        r18 = r15;
        r15 = r13;
        if (r12 == 0) goto L_0x0131;
    L_0x0117:
        r1 = r14.mNative;
        r0 = r14;
        r3 = r21;
        r4 = r22;
        r5 = r23;
        r6 = r24;
        r7 = r25;
        r8 = r26;
        r9 = r27;
        r10 = r28;
        r11 = r29;
        r0 = r0.nativeSaveYuv(r1, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12);
        goto L_0x0133;
    L_0x0131:
        r0 = r17;
    L_0x0133:
        r1 = java.lang.System.nanoTime();
        r3 = "MorphoPanoramaGP3";
        r4 = java.util.Locale.US;
        r5 = "Performance.JNI %1$,3d nsec";
        r6 = new java.lang.Object[r15];
        r7 = r1 - r18;
        r7 = java.lang.Long.valueOf(r7);
        r6[r17] = r7;
        r4 = java.lang.String.format(r4, r5, r6);
        com.android.camera.log.Log.v(r3, r4);
        r3 = r14.mAttachCount;
        r5 = 1;
        r3 = r3 + r5;
        r14.mAttachCount = r3;
        r3 = r14.mAttachCount;
        r3 = (r3 > r5 ? 1 : (r3 == r5 ? 0 : -1));
        if (r3 <= 0) goto L_0x0168;
    L_0x015b:
        r3 = r14.mIntervalArray;
        r4 = r14.mAttachLastNanoTime;
        r4 = r1 - r4;
        r4 = java.lang.Long.valueOf(r4);
        r3.add(r4);
    L_0x0168:
        r14.mAttachLastNanoTime = r1;
        return r0;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.panorama.MorphoPanoramaGP3.attach(java.nio.ByteBuffer, java.nio.ByteBuffer, java.nio.ByteBuffer, int, int, int, int, int, int, com.android.camera.panorama.SensorInfoManager, double[], android.content.Context):int");
    }

    private static String createName(long j) {
        return DateFormat.format("yyyy-MM-dd_kk-mm-ss", j).toString();
    }

    public int getImage(byte[] bArr, Rect rect) {
        if (this.mNative == 0) {
            return -2147483646;
        }
        return nativeGetImage(this.mNative, bArr, rect.left, rect.top, rect.right, rect.bottom);
    }

    public int getRotatedSmallImage(byte[] bArr, Rect rect, int i, int i2) {
        if (this.mNative == 0) {
            return -2147483646;
        }
        return nativeGetRotatedSmallImage(this.mNative, bArr, rect.left, rect.top, rect.right, rect.bottom, i, i2);
    }

    public int updatePreviewImage(Bitmap bitmap) {
        if (this.mNative == 0) {
            return -2147483646;
        }
        return nativeUpdatePreviewImage(this.mNative, bitmap);
    }

    public int setPreviewImage(int i, int i2) {
        if (this.mNative == 0) {
            return -2147483646;
        }
        return nativeSetPreviewImage(this.mNative, i, i2);
    }

    public int getClippingRect(Rect rect) {
        int nativeGetClippingRect;
        int[] iArr = new int[4];
        if (this.mNative != 0) {
            nativeGetClippingRect = nativeGetClippingRect(this.mNative, iArr);
            if (nativeGetClippingRect == 0) {
                rect.set(iArr[0], iArr[1], iArr[2], iArr[3]);
            }
        } else {
            nativeGetClippingRect = -2147483646;
        }
        if (nativeGetClippingRect != 0) {
            rect.set(0, 0, 0, 0);
        }
        return nativeGetClippingRect;
    }

    public String getInputImageFormat() {
        return this.mInputImageFormat;
    }

    public int setInputImageFormat(String str) {
        this.mInputImageFormat = "";
        if (this.mNative == 0) {
            return -2147483646;
        }
        int nativeSetImageFormat = nativeSetImageFormat(this.mNative, str);
        if (nativeSetImageFormat != 0) {
            return nativeSetImageFormat;
        }
        this.mInputImageFormat = str;
        return nativeSetImageFormat;
    }

    public long getAttachCount() {
        return this.mAttachCount;
    }

    public void enableSaveInputImages(String str) {
        this.mSaveInputImages = true;
        this.mFolderPathInputImages = str;
    }

    public void disableSaveInputImages() {
        this.mSaveInputImages = false;
    }

    public String getInputFolderPath() {
        return this.mFolderPathInputImages;
    }

    public int inputSave(Image image) {
        if (this.mNative == 0) {
            return -2147483646;
        }
        long currentTimeMillis = System.currentTimeMillis();
        String str = null;
        if (this.mSaveInputImages) {
            str = String.format(Locale.US, "%s/%06d.yuv", new Object[]{this.mFolderPathInputImages, Long.valueOf(this.mAttachCount)});
        }
        String str2 = str;
        int nativeSaveYuv = nativeSaveYuv(this.mNative, image.getPlanes()[0].getBuffer(), image.getPlanes()[1].getBuffer(), image.getPlanes()[2].getBuffer(), image.getPlanes()[0].getRowStride(), image.getPlanes()[1].getRowStride(), image.getPlanes()[2].getRowStride(), image.getPlanes()[0].getPixelStride(), image.getPlanes()[1].getPixelStride(), image.getPlanes()[2].getPixelStride(), str2);
        long currentTimeMillis2 = System.currentTimeMillis();
        String str3 = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Performance.JNI ");
        stringBuilder.append(currentTimeMillis2 - currentTimeMillis);
        stringBuilder.append(" msec");
        com.android.camera.log.Log.v(str3, stringBuilder.toString());
        this.mAttachCount++;
        return nativeSaveYuv;
    }

    public static double getGain(Image image) {
        String imageFormat = PanoramaGP3ImageFormat.getImageFormat(image);
        double[] dArr = new double[1];
        int nativeGetGain = nativeGetGain(image.getPlanes()[0].getBuffer(), image.getPlanes()[1].getBuffer(), image.getPlanes()[2].getBuffer(), image.getPlanes()[0].getRowStride(), image.getPlanes()[1].getRowStride(), image.getPlanes()[2].getRowStride(), image.getPlanes()[0].getPixelStride(), image.getPlanes()[1].getPixelStride(), image.getPlanes()[2].getPixelStride(), imageFormat, image.getWidth(), image.getHeight(), dArr);
        if (nativeGetGain != 0) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("nativeGetGain error. ret=");
            stringBuilder.append(nativeGetGain);
            com.android.camera.log.Log.e(str, stringBuilder.toString());
            return 1.0d;
        }
        dArr[0] = GAIN_COEF * dArr[0];
        return dArr[0];
    }

    public int getDirection() {
        int[] iArr = new int[]{-1};
        if (this.mNative != 0) {
            int nativeGetDirection = nativeGetDirection(this.mNative, iArr);
            if (nativeGetDirection != 0) {
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("MorphoPanoramaGP3.getDirection error. ret=");
                stringBuilder.append(nativeGetDirection);
                com.android.camera.log.Log.e(str, stringBuilder.toString());
            }
        }
        return iArr[0];
    }

    public int end(int i, double d) {
        if (this.mNative == 0) {
            return 0;
        }
        return nativeEnd(this.mNative, i, d);
    }

    public int getEndStatus() {
        if (this.mNative != 0) {
            return nativeGetEndStatus(this.mNative);
        }
        return -1;
    }

    public int getOutputImageSize(int[] iArr) {
        if (this.mNative != 0) {
            return nativeGetOutputSize(this.mNative, iArr);
        }
        return -2147483646;
    }

    public int getOutputImage(byte[] bArr, Rect rect) {
        if (this.mNative == 0) {
            return -2147483646;
        }
        return nativeGetOutputImage(this.mNative, bArr, rect.left, rect.top, rect.right, rect.bottom);
    }

    public int setShrinkRatio(double d) {
        if (this.mNative != 0) {
            return nativeSetShrinkRatio(this.mNative, d);
        }
        return -2147483646;
    }

    public int setCalcseamPixnum(int i) {
        if (this.mNative != 0) {
            return nativeSetCalcseamPixnum(this.mNative, i);
        }
        return -2147483646;
    }

    public int setInitialRotationByGravity(double d, double d2, double d3) {
        if (this.mNative == 0) {
            return -2147483646;
        }
        int nativeSetInitialRotationByGravity = nativeSetInitialRotationByGravity(this.mNative, d, d2, d3);
        this.mGravity.x = d;
        this.mGravity.y = d2;
        this.mGravity.z = d3;
        return nativeSetInitialRotationByGravity;
    }

    public GravityParam getLastGravity() {
        return this.mGravity.copyInstance();
    }

    public int setUseDeform(boolean z) {
        if (this.mNative != 0) {
            return nativeSetUseDeform(this.mNative, z);
        }
        return -2147483646;
    }

    public int setUseLuminanceCorrection(boolean z) {
        if (this.mNative != 0) {
            return nativeSetUseLuminanceCorrection(this.mNative, z);
        }
        return -2147483646;
    }

    public int setSeamsearchRatio(double d) {
        if (this.mNative != 0) {
            return nativeSetSeamsearchRatio(this.mNative, d);
        }
        return -2147483646;
    }

    public int setZrotationCoeff(double d) {
        if (this.mNative != 0) {
            return nativeSetZrotationCoeff(this.mNative, d);
        }
        return -2147483646;
    }

    public int setDrawThreshold(double d) {
        if (this.mNative != 0) {
            return nativeSetDrawThreshold(this.mNative, d);
        }
        return -2147483646;
    }

    public int setGyroscopeData(SensorData[] sensorDataArr) {
        if (this.mNative != 0) {
            return nativeSetGyroscopeData(this.mNative, sensorDataArr);
        }
        return -2147483646;
    }

    public int setRotationVector(double[] dArr) {
        if (this.mNative != 0) {
            return nativeSetRotationVector(this.mNative, dArr);
        }
        return -2147483646;
    }

    public int setUnsharpStrength(int i) {
        if (this.mNative != 0) {
            return nativeSetUnsharpStrength(this.mNative, i);
        }
        return -2147483646;
    }

    public int setAovGain(double d) {
        if (this.mNative != 0) {
            return nativeSetAovGain(this.mNative, d);
        }
        return -2147483646;
    }

    public int setRotationRatio(double d) {
        if (this.mNative != 0) {
            return nativeSetRotationRatio(this.mNative, d);
        }
        return -2147483646;
    }

    public int setSensorUseMode(int i) {
        if (this.mNative != 0) {
            return nativeSetSensorUseMode(this.mNative, i);
        }
        return -2147483646;
    }

    public int setNoiseReductionParam(int i) {
        if (this.mNative != 0) {
            return nativeSetNoiseReductionParam(this.mNative, i);
        }
        return -2147483646;
    }

    public int setDistortionCorrectionParam(double d, double d2, double d3, double d4) {
        if (this.mNative != 0) {
            return nativeSetDistortionCorrectionParam(this.mNative, d, d2, d3, d4);
        }
        return -2147483646;
    }

    /* JADX WARNING: Removed duplicated region for block: B:3:0x0011 A:{ExcHandler: java.lang.NoSuchFieldException (e java.lang.NoSuchFieldException), Splitter: B:0:0x0000} */
    /* JADX WARNING: Missing block: B:5:0x0013, code:
            return -1;
     */
    private static int getFD(java.io.FileDescriptor r2) {
        /*
        r0 = java.io.FileDescriptor.class;
        r1 = "descriptor";
        r0 = r0.getDeclaredField(r1);	 Catch:{ NoSuchFieldException -> 0x0011, NoSuchFieldException -> 0x0011 }
        r1 = 1;
        r0.setAccessible(r1);	 Catch:{ NoSuchFieldException -> 0x0011, NoSuchFieldException -> 0x0011 }
        r2 = r0.getInt(r2);	 Catch:{ NoSuchFieldException -> 0x0011, NoSuchFieldException -> 0x0011 }
        return r2;
    L_0x0011:
        r2 = move-exception;
        r2 = -1;
        return r2;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.panorama.MorphoPanoramaGP3.getFD(java.io.FileDescriptor):int");
    }

    public int savePanorama360(int i, int i2, String str, String str2, String str3, boolean z, GalleryInfoData galleryInfoData, boolean z2) {
        if (this.mNative != 0) {
            return nativeSavePanorama360(this.mNative, i, i2, str, 0, str2, str3, z, galleryInfoData, z2);
        }
        return -2147483646;
    }

    public int savePanorama360(int i, int i2, FileDescriptor fileDescriptor, String str, String str2, boolean z, GalleryInfoData galleryInfoData, boolean z2) {
        if (this.mNative == 0) {
            return -2147483646;
        }
        int fd = getFD(fileDescriptor);
        if (fd >= 0) {
            return nativeSavePanorama360(this.mNative, i, i2, null, fd, str, str2, z, galleryInfoData, z2);
        }
        return -2147483632;
    }

    public int saveLog(String str, String str2) {
        if (this.mNative != 0) {
            return nativeSaveLog(this.mNative, str, str2);
        }
        return -2147483646;
    }

    public static int yuv2Bitmap8888(byte[] bArr, int i, int i2, Bitmap bitmap, int i3) {
        return nativeYuv2Bitmap8888(bArr, i, i2, bitmap, i3, 1);
    }

    public static int yvu2Bitmap8888(byte[] bArr, int i, int i2, Bitmap bitmap, int i3) {
        return nativeYuv2Bitmap8888(bArr, i, i2, bitmap, i3, 0);
    }

    public int createNativeOutputInfo() {
        this.mNativeOutputInfo = createNativeOutputInfoObject();
        if (this.mNativeOutputInfo != 0) {
            return 0;
        }
        return -2147483646;
    }

    public int deleteNativeOutputInfo() {
        deleteNativeOutputInfoObject(this.mNativeOutputInfo);
        this.mNativeOutputInfo = 0;
        return 0;
    }

    public int createOutputImage(Rect rect) {
        if (this.mNative == 0) {
            return -2147483646;
        }
        return nativeCreateOutputImage(this.mNative, rect.left, rect.top, rect.right, rect.bottom);
    }

    public int preparePanorama360(int i, int i2, String str, String str2, boolean z, GalleryInfoData galleryInfoData) {
        if (this.mNative == 0) {
            return -2147483646;
        }
        return nativePreparePanorama360(this.mNative, i, i2, str, str2, z, galleryInfoData);
    }

    public int savePanorama360Delay(String str, boolean z, int i, boolean z2) {
        if (this.mNativeOutputInfo == 0) {
            return -2147483646;
        }
        return nativeSavePanorama360Delay(this.mNativeOutputInfo, str, 0, z, i, z2);
    }

    public int savePanorama360Delay(FileDescriptor fileDescriptor, boolean z, int i, boolean z2) {
        if (this.mNativeOutputInfo == 0) {
            return -2147483646;
        }
        int fd = getFD(fileDescriptor);
        if (fd < 0) {
            return -2147483632;
        }
        return nativeSavePanorama360Delay(this.mNativeOutputInfo, null, fd, z, i, z2);
    }

    public int setProjectionMode(int i) {
        if (this.mNative != 0) {
            return nativeSetProjectionMode(this.mNative, i);
        }
        return -2147483646;
    }

    public int setMotionDetectionMode(int i) {
        if (this.mNative != 0) {
            return nativeSetMotionDetectionMode(this.mNative, i);
        }
        return -2147483646;
    }

    public static int saveNotPanorama_sub(CaptureImage captureImage, String str, int i) {
        int nativeSaveNotPanorama;
        Image image = captureImage.image();
        String imageFormat;
        int width;
        int height;
        if (image != null) {
            imageFormat = captureImage.getImageFormat();
            width = captureImage.getWidth();
            height = captureImage.getHeight();
            nativeSaveNotPanorama = nativeSaveNotPanorama(null, image.getPlanes()[0].getBuffer(), image.getPlanes()[1].getBuffer(), image.getPlanes()[2].getBuffer(), image.getPlanes()[0].getRowStride(), image.getPlanes()[1].getRowStride(), image.getPlanes()[2].getRowStride(), image.getPlanes()[0].getPixelStride(), image.getPlanes()[1].getPixelStride(), image.getPlanes()[2].getPixelStride(), imageFormat, width, height, str, i);
        } else {
            Camera1Image camera1Image = (Camera1Image) captureImage;
            imageFormat = camera1Image.getImageFormat();
            width = camera1Image.getWidth();
            height = camera1Image.getHeight();
            byte[] raw = camera1Image.raw();
            ByteBuffer allocateBuffer = NativeMemoryAllocator.allocateBuffer(raw.length);
            allocateBuffer.put(raw);
            allocateBuffer.clear();
            ByteBuffer byteBuffer = allocateBuffer;
            int nativeSaveNotPanorama2 = nativeSaveNotPanorama(allocateBuffer, null, null, null, 0, 0, 0, 0, 0, 0, imageFormat, width, height, str, i);
            NativeMemoryAllocator.freeBuffer(byteBuffer);
            nativeSaveNotPanorama = nativeSaveNotPanorama2;
        }
        if (nativeSaveNotPanorama != 0) {
            String str2 = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("nativeSaveNotPanorama error. ret=");
            stringBuilder.append(nativeSaveNotPanorama);
            com.android.camera.log.Log.e(str2, stringBuilder.toString());
        }
        return nativeSaveNotPanorama;
    }

    public static int saveNotPanorama(CaptureImage captureImage, FileDescriptor fileDescriptor) {
        int fd = getFD(fileDescriptor);
        if (fd >= 0) {
            return saveNotPanorama_sub(captureImage, null, fd);
        }
        return -2147483632;
    }

    public static int saveNotPanorama(CaptureImage captureImage, String str) {
        return saveNotPanorama_sub(captureImage, str, -1);
    }
}
