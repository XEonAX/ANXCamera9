package com.android.zxing;

import android.media.Image;
import android.util.Log;
import java.nio.ByteBuffer;
import java.util.Arrays;

public class PreviewImage {
    private static final String TAG = "PreviewImage";
    private byte[] mData;
    private int mFormat;
    private int mHeight;
    private long mTimestamp;
    private int mWidth;

    public PreviewImage(Image image, int i, int i2) {
        long currentTimeMillis = System.currentTimeMillis();
        this.mTimestamp = image.getTimestamp();
        this.mWidth = image.getWidth();
        this.mHeight = image.getHeight();
        this.mFormat = image.getFormat();
        this.mData = convertYUV420ToNV21(image, i, i2);
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("QRCodeManager convertYUV420ToNV21: cost = ");
        stringBuilder.append(System.currentTimeMillis() - currentTimeMillis);
        stringBuilder.append("ms");
        Log.d(str, stringBuilder.toString());
    }

    public byte[] getData() {
        return this.mData;
    }

    public long getTimestamp() {
        return this.mTimestamp;
    }

    public int getWidth() {
        return this.mWidth;
    }

    public int getHeight() {
        return this.mHeight;
    }

    public int getFormat() {
        return this.mFormat;
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("PreviewImage{mData=");
        stringBuilder.append(Arrays.toString(this.mData));
        stringBuilder.append(", mTimestamp=");
        stringBuilder.append(this.mTimestamp);
        stringBuilder.append(", mWidth=");
        stringBuilder.append(this.mWidth);
        stringBuilder.append(", mHeight=");
        stringBuilder.append(this.mHeight);
        stringBuilder.append(", mFormat=");
        stringBuilder.append(this.mFormat);
        stringBuilder.append('}');
        return stringBuilder.toString();
    }

    private static byte[] convertYUV420ToNV21(Image image, int i, int i2) {
        if (image == null || image.getFormat() != 35) {
            return null;
        }
        int i3 = 0;
        ByteBuffer buffer = image.getPlanes()[0].getBuffer();
        ByteBuffer buffer2 = image.getPlanes()[2].getBuffer();
        int limit = buffer.limit();
        int limit2 = buffer2.limit();
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("convertYUV420888ToNV21: size = ");
        stringBuilder.append(image.getWidth());
        stringBuilder.append("x");
        stringBuilder.append(image.getHeight());
        stringBuilder.append(", yStride = ");
        stringBuilder.append(image.getPlanes()[0].getRowStride());
        stringBuilder.append(", uvStride = ");
        stringBuilder.append(image.getPlanes()[2].getRowStride());
        Log.v(str, stringBuilder.toString());
        byte[] bArr = new byte[(limit + limit2)];
        buffer.get(bArr, 0, limit);
        buffer2.get(bArr, limit, limit2);
        double d = ((double) (i * i2)) * 1.5d;
        if (((double) bArr.length) <= d) {
            Log.d(TAG, "removePadding: no padding found in data");
            return bArr;
        }
        int rowStride = image.getPlanes()[0].getRowStride();
        int rowStride2 = image.getPlanes()[2].getRowStride();
        byte[] bArr2 = new byte[((int) d)];
        limit = 0;
        limit2 = limit;
        int i4 = limit2;
        while (limit < i2) {
            System.arraycopy(bArr, limit2, bArr2, i4, i);
            if (limit == i2 - 1) {
                limit2 += i;
            } else {
                limit2 += rowStride;
            }
            i4 += i;
            limit++;
        }
        while (true) {
            rowStride = i2 / 2;
            if (i3 >= rowStride) {
                return bArr2;
            }
            if (i3 == rowStride - 1) {
                System.arraycopy(bArr, limit2, bArr2, i4, i - 1);
            } else {
                System.arraycopy(bArr, limit2, bArr2, i4, i);
            }
            limit2 += rowStride2;
            i4 += i;
            i3++;
        }
    }
}
