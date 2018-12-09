package com.android.camera.panorama;

import android.annotation.SuppressLint;
import android.util.Size;

@SuppressLint({"NewApi"})
public class DirectionFunction {
    public static final int DIRECTION_DOWN = 3;
    public static final int DIRECTION_LEFT = 0;
    public static final int DIRECTION_NONE = -1;
    public static final int DIRECTION_RIGHT = 1;
    public static final int DIRECTION_UP = 2;
    public static final int ERROR_NO_EFFECTIVE_PIXEL = -1;
    public static final int SUCCEEDED = 0;
    private final int mAngle;
    protected int mDirection = -1;
    private final int mInputHeight;
    private final int mInputWidth;
    private final int mMaxHeight;
    private final int mMaxWidth;
    private final int mScale;

    public DirectionFunction(int i, int i2, int i3, int i4, int i5, int i6) {
        this.mInputWidth = i;
        this.mInputHeight = i2;
        this.mScale = i5;
        this.mAngle = i6;
        this.mMaxWidth = i3;
        this.mMaxHeight = i4;
    }

    public int getDirection() {
        return this.mDirection;
    }

    public int getScale() {
        return this.mScale;
    }

    public int getAngle() {
        return this.mAngle;
    }

    public boolean enabled() {
        return false;
    }

    public Size getPreviewSize() {
        return new Size(this.mInputWidth, this.mInputHeight);
    }

    protected Size getVerticalPreviewSize() {
        int i;
        int i2 = this.mMaxHeight / this.mScale;
        if (90 == this.mAngle || 270 == this.mAngle) {
            i = this.mInputHeight / this.mScale;
        } else {
            i = this.mInputWidth / this.mScale;
        }
        return new Size(i & -2, i2 & -2);
    }

    protected Size getHorizontalPreviewSize() {
        int i;
        int i2 = this.mMaxWidth / this.mScale;
        if (90 == this.mAngle || 270 == this.mAngle) {
            i = this.mInputWidth / this.mScale;
        } else {
            i = this.mInputHeight / this.mScale;
        }
        return new Size(i2 & -2, i & -2);
    }
}
