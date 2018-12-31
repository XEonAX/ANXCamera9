package com.android.camera.effect.renders;

import android.graphics.Bitmap;
import com.android.camera.CameraSettings;
import com.android.camera.R;
import com.android.camera.data.DataRepository;
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
        float min = ((float) Math.min(i, i2)) / 1080.0f;
        boolean fE = DataRepository.dataItemFeature().fE();
        float f4 = 1.0f;
        float resourceFloat = CameraSettings.getResourceFloat(R.dimen.custom_watermark_height_scale, 1.0f);
        if (!fE) {
            resourceFloat = 1.0f;
        }
        this.mHeight = Math.round((f * min) * resourceFloat) & -2;
        this.mWidth = ((this.mHeight * bitmap.getWidth()) / bitmap.getHeight()) & -2;
        this.mPaddingX = Math.round(f2 * min) & -2;
        f = CameraSettings.getResourceFloat(R.dimen.custom_watermark_pandingY_scale, 1.0f);
        if (fE) {
            f4 = f;
        }
        this.mPaddingY = Math.round((f3 * min) * f4) & -2;
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
}
