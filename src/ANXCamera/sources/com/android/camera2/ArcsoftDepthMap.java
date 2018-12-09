package com.android.camera2;

import android.graphics.Point;
import com.android.camera.log.Log;
import com.android.gallery3d.exif.ExifInterface;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;

public class ArcsoftDepthMap {
    private static final int BLUR_LEVEL_START_ADDR = 16;
    private static final int DAPTH_MAP_START_ADDR = 152;
    private static final int DATA_LENGTH_4 = 4;
    private static final int DATA_LENGTH_START_ADDR = 148;
    private static final int HEADER_LENGTH_START_ADDR = 4;
    private static final int HEADER_START_ADDR = 0;
    private static final int POINT_X_START_ADDR = 8;
    private static final int POINT_Y_START_ADDR = 12;
    private static final String TAG = ArcsoftDepthMap.class.getSimpleName();
    @Deprecated
    public static final int TAG_DEPTH_MAP_BLUR_LEVEL = ExifInterface.defineTag(2, (short) -30575);
    @Deprecated
    public static final int TAG_DEPTH_MAP_FOCUS_POINT = ExifInterface.defineTag(2, (short) -30576);
    private byte[] mDepthMapHeader;
    private byte[] mDepthMapOriginalData;

    public ArcsoftDepthMap(byte[] bArr) {
        if (bArr != null) {
            int headerTag = getHeaderTag(bArr);
            if (headerTag == 128) {
                this.mDepthMapOriginalData = bArr;
                this.mDepthMapHeader = getDepthMapHeader();
                return;
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Illegal depth format! 0x80 != ");
            stringBuilder.append(headerTag);
            throw new IllegalArgumentException(stringBuilder.toString());
        }
        throw new IllegalArgumentException("Null depth data!");
    }

    public static boolean isDepthMapData(byte[] bArr) {
        boolean z = bArr != null && bArr.length > 4 && getHeaderTag(bArr) == 128;
        if (!z) {
            Log.e(TAG, "Illegal depth format", new RuntimeException());
        }
        return z;
    }

    public byte[] getDepthMapHeader() {
        return getBytes(this.mDepthMapOriginalData, 0, getInteger(getBytes(this.mDepthMapOriginalData, 4, 4)));
    }

    public Point getFocusPoint() {
        return new Point(getInteger(getBytes(this.mDepthMapHeader, 8, 4)), getInteger(getBytes(this.mDepthMapHeader, 12, 4)));
    }

    public int getBlurLevel() {
        return getInteger(getBytes(this.mDepthMapHeader, 16, 4));
    }

    public int getDepthMapLength() {
        return getInteger(getBytes(this.mDepthMapHeader, 148, 4));
    }

    public byte[] getDepthMapData() {
        return getBytes(this.mDepthMapOriginalData, 152, getDepthMapLength());
    }

    public byte[] writePortraitExif(byte[] bArr, byte[] bArr2, byte[] bArr3, int i, boolean z, boolean z2) {
        Throwable e;
        OutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        try {
            ExifInterface exifInterface = new ExifInterface();
            exifInterface.readExif(bArr);
            Point focusPoint = getFocusPoint();
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("writePortraitExif: focusPoint: ");
            stringBuilder.append(focusPoint);
            Log.d(str, stringBuilder.toString());
            exifInterface.addDepthMapFocusPoint(focusPoint);
            int blurLevel = getBlurLevel();
            str = TAG;
            stringBuilder = new StringBuilder();
            stringBuilder.append("writePortraitExif: blurLevel: ");
            stringBuilder.append(blurLevel);
            Log.d(str, stringBuilder.toString());
            exifInterface.addDepthMapBlurLevel(blurLevel);
            if (bArr2 != null) {
                exifInterface.addDulCameraWaterMark(bArr2);
            }
            if (bArr3 != null) {
                exifInterface.addTimeWaterMark(bArr3);
            }
            exifInterface.addPortraitLighting(i);
            if (z2) {
                exifInterface.addFrontMirror(z);
            }
            exifInterface.writeExif(bArr, byteArrayOutputStream);
            bArr2 = byteArrayOutputStream.toByteArray();
            try {
                byteArrayOutputStream.close();
                return bArr2;
            } catch (Throwable e2) {
                byte[] bArr4 = bArr2;
                e = e2;
                bArr = bArr4;
                Log.e(ExifInterface.class.getName(), e.getMessage(), e);
                return bArr;
            }
        } catch (IOException e3) {
            e = e3;
            Log.e(ExifInterface.class.getName(), e.getMessage(), e);
            return bArr;
        }
    }

    private static int getHeaderTag(byte[] bArr) {
        return getInteger(getBytes(bArr, 0, 4));
    }

    private static int getInteger(byte[] bArr) {
        if (bArr.length == 4) {
            int i = 0;
            int i2 = 0;
            while (i < 4) {
                i2 += (bArr[i] & 255) << (i * 8);
                i++;
            }
            return i2;
        }
        throw new IllegalArgumentException("bytes can not covert to a integer value!");
    }

    private static byte[] getBytes(byte[] bArr, int i, int i2) {
        if (i2 <= 0 || i < 0 || i2 > bArr.length - i) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("WRONG ARGUMENT: from =");
            stringBuilder.append(i);
            stringBuilder.append(", length = ");
            stringBuilder.append(i2);
            throw new IllegalArgumentException(stringBuilder.toString());
        }
        byte[] bArr2 = new byte[i2];
        System.arraycopy(bArr, i, bArr2, 0, i2);
        return bArr2;
    }
}
