package com.android.zxing;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.support.v4.view.ViewCompat;
import com.google.zxing.LuminanceSource;

final class YUVLuminanceSource extends LuminanceSource {
    private final int mDataHeight;
    private final int mDataWidth;
    private final int mLeft;
    private final int mTop;
    private final byte[] mYUVData;

    public YUVLuminanceSource(byte[] bArr, int i, int i2, int i3, int i4, int i5, int i6) {
        super(i5, i6);
        if (i5 + i3 > i || i6 + i4 > i2) {
            throw new IllegalArgumentException("Crop rectangle does not fit within image data.");
        }
        this.mYUVData = bArr;
        this.mDataWidth = i;
        this.mDataHeight = i2;
        this.mLeft = i3;
        this.mTop = i4;
    }

    public byte[] getRow(int i, byte[] bArr) {
        if (i < 0 || i >= getHeight()) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Requested row is outside the image: ");
            stringBuilder.append(i);
            throw new IllegalArgumentException(stringBuilder.toString());
        }
        int width = getWidth();
        if (bArr == null || bArr.length < width) {
            bArr = new byte[width];
        }
        System.arraycopy(this.mYUVData, ((i + this.mTop) * this.mDataWidth) + this.mLeft, bArr, 0, width);
        return bArr;
    }

    public byte[] getMatrix() {
        int width = getWidth();
        int height = getHeight();
        if (width == this.mDataWidth && height == this.mDataHeight) {
            return this.mYUVData;
        }
        int i = width * height;
        byte[] bArr = new byte[i];
        int i2 = (this.mTop * this.mDataWidth) + this.mLeft;
        int i3 = 0;
        if (width == this.mDataWidth) {
            System.arraycopy(this.mYUVData, i2, bArr, 0, i);
            return bArr;
        }
        byte[] bArr2 = this.mYUVData;
        while (i3 < height) {
            System.arraycopy(bArr2, i2, bArr, i3 * width, width);
            i2 += this.mDataWidth;
            i3++;
        }
        return bArr;
    }

    public boolean isCropSupported() {
        return true;
    }

    public int getDataWidth() {
        return this.mDataWidth;
    }

    public int getDataHeight() {
        return this.mDataHeight;
    }

    public Bitmap renderCroppedGreyscaleBitmap() {
        int width = getWidth();
        int height = getHeight();
        int[] iArr = new int[(width * height)];
        byte[] bArr = this.mYUVData;
        int i = (this.mTop * this.mDataWidth) + this.mLeft;
        for (int i2 = 0; i2 < height; i2++) {
            int i3 = i2 * width;
            for (int i4 = 0; i4 < width; i4++) {
                iArr[i3 + i4] = ((bArr[i + i4] & 255) * 65793) | ViewCompat.MEASURED_STATE_MASK;
            }
            i += this.mDataWidth;
        }
        Bitmap createBitmap = Bitmap.createBitmap(width, height, Config.ARGB_8888);
        createBitmap.setPixels(iArr, 0, width, 0, 0, width, height);
        return createBitmap;
    }
}
