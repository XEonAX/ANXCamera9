package com.android.camera.effect.renders;

import com.android.camera.Util;
import com.android.camera.log.Log;
import com.android.gallery3d.ui.BasicTexture;
import com.android.gallery3d.ui.StringTexture;

public class NewStyleTextWaterMark extends WaterMark {
    private static final float RATIO = 0.87f;
    private static final String TAG = NewStyleTextWaterMark.class.getSimpleName();
    public static final int TEXT_COLOR = -1;
    public static final float TEXT_PIXEL_SIZE = 30.079576f;
    private int mCenterX;
    private int mCenterY;
    private int mCharMargin;
    private int mHorizontalPadding;
    private int mPadding;
    private int mVerticalPadding;
    private int mWaterHeight = this.mWaterTexture.getHeight();
    private String mWaterText;
    private BasicTexture mWaterTexture;
    private int mWaterWidth = this.mWaterTexture.getWidth();

    public NewStyleTextWaterMark(String str, int i, int i2, int i3) {
        super(i, i2, i3);
        float min = ((float) Math.min(i, i2)) / 1080.0f;
        this.mWaterText = str;
        this.mWaterTexture = StringTexture.newInstance(this.mWaterText, 30.079576f * min, -1, 2);
        this.mPadding = (int) Math.round(43.687002653d * ((double) min));
        this.mCharMargin = (int) ((((float) this.mWaterHeight) * 0.13f) / 2.0f);
        this.mHorizontalPadding = this.mPadding & -2;
        this.mVerticalPadding = (this.mPadding - this.mCharMargin) & -2;
        calcCenterAxis();
        if (Util.sIsDumpLog) {
            print();
        }
    }

    private void calcCenterAxis() {
        int i = this.mOrientation;
        if (i == 0) {
            this.mCenterX = (this.mPictureWidth - this.mHorizontalPadding) - (this.mWaterWidth / 2);
            this.mCenterY = (this.mPictureHeight - this.mVerticalPadding) - (this.mWaterHeight / 2);
        } else if (i == 90) {
            this.mCenterX = (this.mPictureWidth - this.mVerticalPadding) - (this.mWaterHeight / 2);
            this.mCenterY = this.mHorizontalPadding + (this.mWaterWidth / 2);
        } else if (i == 180) {
            this.mCenterX = this.mHorizontalPadding + (this.mWaterWidth / 2);
            this.mCenterY = this.mVerticalPadding + (this.mWaterHeight / 2);
        } else if (i == 270) {
            this.mCenterX = this.mVerticalPadding + (this.mWaterHeight / 2);
            this.mCenterY = (this.mPictureHeight - this.mHorizontalPadding) - (this.mWaterWidth / 2);
        }
    }

    public int getCenterX() {
        return this.mCenterX;
    }

    public int getCenterY() {
        return this.mCenterY;
    }

    public int getWidth() {
        return this.mWaterWidth;
    }

    public int getHeight() {
        return this.mWaterHeight;
    }

    public BasicTexture getTexture() {
        return this.mWaterTexture;
    }

    private void print() {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("WaterMark pictureWidth=");
        stringBuilder.append(this.mPictureWidth);
        stringBuilder.append(" pictureHeight =");
        stringBuilder.append(this.mPictureHeight);
        stringBuilder.append(" waterText=");
        stringBuilder.append(this.mWaterText);
        stringBuilder.append(" centerX=");
        stringBuilder.append(this.mCenterX);
        stringBuilder.append(" centerY=");
        stringBuilder.append(this.mCenterY);
        stringBuilder.append(" waterWidth=");
        stringBuilder.append(this.mWaterWidth);
        stringBuilder.append(" waterHeight=");
        stringBuilder.append(this.mWaterHeight);
        stringBuilder.append(" padding=");
        stringBuilder.append(this.mPadding);
        Log.v(str, stringBuilder.toString());
    }
}
