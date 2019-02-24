package com.android.camera.effect.renders;

import android.graphics.Bitmap;
import com.android.camera.Util;
import com.android.gallery3d.ui.BasicTexture;
import com.android.gallery3d.ui.BitmapTexture;

class ImageWaterMark extends WaterMark {
    private int mCenterX;
    private int mCenterY;
    private int mHeight;
    private BitmapTexture mImageTexture;
    private int mPaddingX;
    private int mPaddingY;
    private int mWidth;

    public ImageWaterMark(Bitmap bitmap, int i, int i2, int i3, float f, float f2, float f3) {
        super(i, i2, i3);
        int[] calcDualCameraWatermarkLocation = Util.calcDualCameraWatermarkLocation(i, i2, bitmap.getWidth(), bitmap.getHeight(), f, f2, f3);
        this.mWidth = calcDualCameraWatermarkLocation[0];
        this.mHeight = calcDualCameraWatermarkLocation[1];
        this.mPaddingX = calcDualCameraWatermarkLocation[2];
        this.mPaddingY = calcDualCameraWatermarkLocation[3];
        this.mImageTexture = new BitmapTexture(bitmap);
        this.mImageTexture.setOpaque(false);
        calcCenterAxis();
    }

    private void calcCenterAxis() {
        int i = this.mOrientation;
        if (i == 0) {
            this.mCenterX = this.mPaddingX + (getWidth() / 2);
            this.mCenterY = (this.mPictureHeight - this.mPaddingY) - (getHeight() / 2);
        } else if (i == 90) {
            this.mCenterX = (this.mPictureWidth - this.mPaddingY) - (getHeight() / 2);
            this.mCenterY = (this.mPictureHeight - this.mPaddingX) - (getWidth() / 2);
        } else if (i == 180) {
            this.mCenterX = (this.mPictureWidth - this.mPaddingX) - (getWidth() / 2);
            this.mCenterY = this.mPaddingY + (getHeight() / 2);
        } else if (i == 270) {
            this.mCenterX = this.mPaddingY + (getHeight() / 2);
            this.mCenterY = this.mPaddingX + (getWidth() / 2);
        }
    }

    public int getCenterX() {
        return this.mCenterX;
    }

    public int getCenterY() {
        return this.mCenterY;
    }

    public int getWidth() {
        return this.mWidth;
    }

    public int getHeight() {
        return this.mHeight;
    }

    public BasicTexture getTexture() {
        return this.mImageTexture;
    }

    public int getPaddingX() {
        return this.mPaddingX;
    }

    public int getPaddingY() {
        return this.mPaddingY;
    }
}
