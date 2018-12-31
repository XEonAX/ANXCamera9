package com.android.camera2;

import android.media.Image;
import com.android.camera.log.Log;
import com.android.camera.panorama.CaptureImage;
import java.nio.ByteBuffer;

public class PreviewImageProp extends CaptureImage {
    private static final String TAG = PreviewImageProp.class.getSimpleName();
    private byte[] mData;
    private Image mImage;
    private byte[] mNoStrideData;
    private boolean mReady = false;
    private int mUVStride;
    private int mYLength;
    private int mYStride;

    public PreviewImageProp(Image image) {
        super(image);
        this.mImage = image;
    }

    public void close() {
        if (this.mImage != null) {
            this.mImage.close();
            this.mImage = null;
        }
    }

    public String getImageFormat() {
        return null;
    }

    public int getWidth() {
        return this.mImage != null ? this.mImage.getWidth() : 0;
    }

    public int getHeight() {
        return this.mImage != null ? this.mImage.getHeight() : 0;
    }

    public byte[] getData() {
        if (!this.mReady) {
            convert();
        }
        return this.mData;
    }

    public int getYLength() {
        if (!this.mReady) {
            convert();
        }
        return this.mYLength;
    }

    public int getYStride() {
        if (!this.mReady) {
            convert();
        }
        return this.mYStride;
    }

    public int getUVStride() {
        if (!this.mReady) {
            convert();
        }
        return this.mUVStride;
    }

    private void convert() {
        if (this.mImage != null) {
            Image image = this.mImage;
            if (image != null && image.getFormat() == 35) {
                ByteBuffer buffer = image.getPlanes()[0].getBuffer();
                ByteBuffer buffer2 = image.getPlanes()[2].getBuffer();
                int limit = buffer.limit();
                int limit2 = buffer2.limit();
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("convertYUV420888ToNV21: ");
                stringBuilder.append(image.getWidth());
                stringBuilder.append("x");
                stringBuilder.append(image.getHeight());
                stringBuilder.append(" ");
                stringBuilder.append(image.getPlanes()[2].getRowStride());
                Log.v(str, stringBuilder.toString());
                this.mData = new byte[(limit + limit2)];
                buffer.get(this.mData, 0, limit);
                buffer2.get(this.mData, limit, limit2);
                this.mYLength = limit;
                this.mYStride = image.getPlanes()[0].getRowStride();
                this.mUVStride = image.getPlanes()[2].getRowStride();
                Log.e("convert:", "yes");
            }
            image.close();
        }
        this.mImage = null;
        this.mReady = true;
    }

    public static byte[] removePadding(PreviewImageProp previewImageProp, int i, int i2) {
        byte[] data = previewImageProp.getData();
        double d = ((double) (i * i2)) * 1.5d;
        if (((double) data.length) <= d) {
            Log.d(TAG, "removePadding: no padding found in data");
            return data;
        }
        byte[] bArr = new byte[((int) d)];
        int i3 = 0;
        int i4 = 0;
        int i5 = i4;
        int i6 = i5;
        while (i4 < i2) {
            System.arraycopy(data, i5, bArr, i6, i);
            if (i4 == i2 - 1) {
                i5 += i;
            } else {
                i5 += previewImageProp.getYStride();
            }
            i6 += i;
            i4++;
        }
        while (true) {
            i4 = i2 / 2;
            if (i3 >= i4) {
                return bArr;
            }
            if (i3 == i4 - 1) {
                System.arraycopy(data, i5, bArr, i6, i - 1);
            } else {
                System.arraycopy(data, i5, bArr, i6, i);
            }
            i5 += previewImageProp.getUVStride();
            i6 += i;
            i3++;
        }
    }
}
