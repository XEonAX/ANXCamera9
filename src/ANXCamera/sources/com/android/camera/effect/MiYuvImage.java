package com.android.camera.effect;

import com.android.camera.log.Log;
import java.nio.ByteBuffer;

public class MiYuvImage {
    private static final String TAG = MiYuvImage.class.getSimpleName();
    public byte[] mData;
    public int mFormat;
    public int mHeight;
    public int mWidth;

    public MiYuvImage(byte[] bArr, int i, int i2, int i3) {
        this.mData = bArr;
        this.mWidth = i;
        this.mHeight = i2;
        this.mFormat = i3;
    }

    public ByteBuffer getYuvBuffer() {
        if (this.mData != null) {
            return ByteBuffer.wrap(this.mData);
        }
        Log.e(TAG, "data is null when getYuvBuffer");
        return null;
    }

    public ByteBuffer getYBuffer() {
        if (this.mData == null) {
            Log.e(TAG, "data is null when getYBuffer");
            return null;
        } else if (this.mFormat == 35) {
            byte[] bArr = new byte[(this.mWidth * this.mHeight)];
            System.arraycopy(this.mData, 0, bArr, 0, this.mWidth * this.mHeight);
            return ByteBuffer.wrap(bArr);
        } else {
            Log.d(TAG, "Not supprot this format");
            return null;
        }
    }

    public ByteBuffer getUVBuffer() {
        if (this.mData == null) {
            Log.e(TAG, "data is null when getUVBuffer");
            return null;
        } else if (this.mFormat == 35) {
            byte[] bArr = new byte[((this.mWidth * this.mHeight) / 2)];
            System.arraycopy(this.mData, this.mWidth * this.mHeight, bArr, 0, (this.mWidth * this.mHeight) / 2);
            return ByteBuffer.wrap(bArr);
        } else {
            Log.d(TAG, "Not supprot this format");
            return null;
        }
    }

    public ByteBuffer getVUBuffer() {
        if (this.mData == null) {
            Log.e(TAG, "data is null when getUVBuffer");
            return null;
        } else if (this.mFormat == 35) {
            byte[] bArr = new byte[((this.mWidth * this.mHeight) / 2)];
            System.arraycopy(this.mData, (this.mWidth * this.mHeight) + 1, bArr, 0, ((this.mWidth * this.mHeight) / 2) - 1);
            bArr[bArr.length - 1] = bArr[bArr.length - 3];
            return ByteBuffer.wrap(bArr);
        } else {
            Log.d(TAG, "Not supprot this format");
            return null;
        }
    }
}
