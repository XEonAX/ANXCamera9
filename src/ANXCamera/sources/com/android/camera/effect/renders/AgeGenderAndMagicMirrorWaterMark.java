package com.android.camera.effect.renders;

import android.graphics.Bitmap;
import com.android.gallery3d.ui.BasicTexture;
import com.android.gallery3d.ui.BitmapTexture;

class AgeGenderAndMagicMirrorWaterMark extends WaterMark {
    private int mCenterX;
    private int mCenterY;
    private int mHeight;
    private BitmapTexture mImageTexture;
    private int mPaddingX;
    private int mPaddingY;
    private int mWidth;

    public AgeGenderAndMagicMirrorWaterMark(Bitmap bitmap, int i, int i2, int i3, int i4, int i5, float f, float f2) {
        super(i, i2, i3);
        float min = (float) (Math.min(i, i2) / Math.min(i4, i5));
        this.mHeight = Math.max(i, i2);
        this.mWidth = Math.min(i, i2);
        this.mPaddingX = Math.round(f * min);
        this.mPaddingY = Math.round(f2 * min);
        this.mImageTexture = new BitmapTexture(bitmap);
        this.mImageTexture.setOpaque(false);
        calcCenterAxis();
    }

    private void calcCenterAxis() {
        this.mCenterX = this.mPaddingY + (getHeight() / 2);
        this.mCenterY = this.mPaddingX + (getWidth() / 2);
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

    public int getLeft() {
        return super.getLeft();
    }

    public int getTop() {
        return super.getTop();
    }
}
