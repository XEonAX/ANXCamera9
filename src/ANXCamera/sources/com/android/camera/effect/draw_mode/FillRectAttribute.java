package com.android.camera.effect.draw_mode;

public class FillRectAttribute extends DrawAttribute {
    public int mColor;
    public float mHeight;
    public float mWidth;
    public float mX;
    public float mY;

    public FillRectAttribute(float f, float f2, float f3, float f4, int i) {
        this.mX = f;
        this.mY = f2;
        this.mWidth = f3;
        this.mHeight = f4;
        this.mColor = i;
        this.mTarget = 4;
    }
}
