package com.android.camera.effect.renders;

import android.provider.MiuiSettings.System;
import com.android.camera.Util;
import com.android.camera.log.Log;
import com.android.gallery3d.ui.BasicTexture;
import com.android.gallery3d.ui.StringTexture;

class TextWaterMark extends WaterMark {
    private static final float RATIO = 0.82f;
    private static final String TAG = TextWaterMark.class.getSimpleName();
    private static final int TEXT_COLOR = -262152;
    private static final int TEXT_PIXEL_SIZE = 144;
    private final int[][] PIC_WIDTHS = new int[][]{new int[]{0, 149}, new int[]{150, 239}, new int[]{240, 279}, new int[]{280, 400}, new int[]{401, 1439}, new int[]{1440, 1511}, new int[]{1512, 1799}, new int[]{1800, 1899}, new int[]{1900, 2299}, new int[]{2300, 3120}, new int[]{3121, System.STATUS_BAR_UPDATE_NETWORK_SPEED_INTERVAL_DEFAULT}};
    private final int[][] WATERMARK_FONT_SIZES = new int[][]{new int[]{5, 4, 2, 4, 3, 7}, new int[]{8, 6, 2, 6, 3, 7}, new int[]{11, 6, 5, 6, 5, 12}, new int[]{12, 7, 5, 7, 5, 12}, new int[]{50, 32, 11, 31, 20, 47}, new int[]{58, 36, 19, 38, 24, 55}, new int[]{65, 41, 24, 42, 27, 63}, new int[]{80, 50, 24, 50, 32, 75}, new int[]{83, 52, 25, 52, 33, 78}, new int[]{104, 65, 33, 65, 42, 98}, new int[]{128, 80, 40, 80, 48, 132}};
    private int mCenterX;
    private int mCenterY;
    private int mCharMargin;
    private int mFontIndex;
    private int mPadding;
    private int mWaterHeight;
    private String mWaterText;
    private BasicTexture mWaterTexture;
    private int mWaterWidth;

    public TextWaterMark(String str, int i, int i2, int i3) {
        int i4 = i;
        int i5 = i2;
        super(i4, i5, i3);
        this.mWaterText = str;
        this.mWaterTexture = StringTexture.newInstance(this.mWaterText, 144.0f, TEXT_COLOR, 0.0f, false, 1);
        this.mFontIndex = getFontIndex(i4, i5);
        this.mWaterWidth = getWaterMarkWidth(this.mWaterText, this.mFontIndex);
        this.mWaterHeight = (int) (((float) this.WATERMARK_FONT_SIZES[this.mFontIndex][0]) / RATIO);
        this.mPadding = this.WATERMARK_FONT_SIZES[this.mFontIndex][5];
        this.mCharMargin = (int) ((((float) this.mWaterHeight) * 0.18f) / 2.0f);
        calcCenterAxis();
        if (Util.sIsDumpLog) {
            print();
        }
    }

    private int getFontIndex(int i, int i2) {
        i = Math.min(i, i2);
        i2 = this.WATERMARK_FONT_SIZES.length - 1;
        int i3 = 0;
        while (i3 < this.PIC_WIDTHS.length) {
            if (i >= this.PIC_WIDTHS[i3][0] && i <= this.PIC_WIDTHS[i3][1]) {
                return i3;
            }
            i3++;
        }
        return i2;
    }

    private int getWaterMarkWidth(String str, int i) {
        int i2 = this.WATERMARK_FONT_SIZES[i][1];
        int i3 = this.WATERMARK_FONT_SIZES[i][2];
        int i4 = this.WATERMARK_FONT_SIZES[i][3];
        i = this.WATERMARK_FONT_SIZES[i][4];
        char[] toCharArray = str.toCharArray();
        int length = toCharArray.length;
        int i5 = 0;
        int i6 = 0;
        while (i5 < length) {
            char c = toCharArray[i5];
            if (c >= '0' && c <= '9') {
                i6 += i2;
            } else if (c == ':') {
                i6 += i;
            } else if (c == '-') {
                i6 += i3;
            } else if (c == ' ') {
                i6 += i4;
            }
            i5++;
        }
        return i6;
    }

    private void calcCenterAxis() {
        int i = this.mOrientation;
        if (i == 0) {
            this.mCenterX = (this.mPictureWidth - this.mPadding) - (this.mWaterWidth / 2);
            this.mCenterY = ((this.mPictureHeight - this.mPadding) - (this.mWaterHeight / 2)) + this.mCharMargin;
        } else if (i == 90) {
            this.mCenterX = ((this.mPictureWidth - this.mPadding) - (this.mWaterHeight / 2)) + this.mCharMargin;
            this.mCenterY = this.mPadding + (this.mWaterWidth / 2);
        } else if (i == 180) {
            this.mCenterX = this.mPadding + (this.mWaterWidth / 2);
            this.mCenterY = (this.mPadding + (this.mWaterHeight / 2)) - this.mCharMargin;
        } else if (i == 270) {
            this.mCenterX = (this.mPadding + (this.mWaterHeight / 2)) - this.mCharMargin;
            this.mCenterY = (this.mPictureHeight - this.mPadding) - (this.mWaterWidth / 2);
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
        stringBuilder.append("WaterMark mPictureWidth=");
        stringBuilder.append(this.mPictureWidth);
        stringBuilder.append(" mPictureHeight =");
        stringBuilder.append(this.mPictureHeight);
        stringBuilder.append(" mWaterText=");
        stringBuilder.append(this.mWaterText);
        stringBuilder.append(" mFontIndex=");
        stringBuilder.append(this.mFontIndex);
        stringBuilder.append(" mCenterX=");
        stringBuilder.append(this.mCenterX);
        stringBuilder.append(" mCenterY=");
        stringBuilder.append(this.mCenterY);
        stringBuilder.append(" mWaterWidth=");
        stringBuilder.append(this.mWaterWidth);
        stringBuilder.append(" mWaterHeight=");
        stringBuilder.append(this.mWaterHeight);
        stringBuilder.append(" mPadding=");
        stringBuilder.append(this.mPadding);
        Log.v(str, stringBuilder.toString());
    }
}
