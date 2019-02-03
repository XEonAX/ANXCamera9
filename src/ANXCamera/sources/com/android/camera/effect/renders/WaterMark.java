package com.android.camera.effect.renders;

import com.android.gallery3d.ui.BasicTexture;

abstract class WaterMark {
    protected int mOrientation;
    protected int mPictureHeight;
    protected int mPictureWidth;

    public abstract int getCenterX();

    public abstract int getCenterY();

    public abstract int getHeight();

    public abstract int getPaddingX();

    public abstract int getPaddingY();

    public abstract BasicTexture getTexture();

    public abstract int getWidth();

    public WaterMark(int i, int i2, int i3) {
        this.mPictureWidth = i;
        this.mPictureHeight = i2;
        this.mOrientation = i3;
    }

    public int getLeft() {
        return getCenterX() - (getWidth() / 2);
    }

    public int getTop() {
        return getCenterY() - (getHeight() / 2);
    }
}
