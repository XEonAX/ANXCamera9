package com.android.camera.effect.draw_mode;

import com.android.gallery3d.ui.BasicTexture;

public class DrawMixedAttribute extends DrawAttribute {
    public BasicTexture mBasicTexture;
    public float mHeight;
    public float mRatio;
    public int mToColor;
    public float mWidth;
    public float mX;
    public float mY;

    public DrawMixedAttribute(BasicTexture basicTexture, int i, float f, float f2, float f3, float f4) {
        this.mX = f;
        this.mY = f2;
        this.mWidth = f3;
        this.mHeight = f4;
        this.mBasicTexture = basicTexture;
        this.mToColor = i;
        this.mTarget = 3;
    }
}
