package com.android.camera.effect.draw_mode;

import com.android.gallery3d.ui.BasicTexture;

public class DrawMeshAttribute extends DrawAttribute {
    public BasicTexture mBasicTexture;
    public float mHeight;
    public int mIndexBuffer;
    public int mIndexCount;
    public int mUVBuffer;
    public float mWidth;
    public float mX;
    public int mXYBuffer;
    public float mY;

    public DrawMeshAttribute(BasicTexture basicTexture, float f, float f2, int i, int i2, int i3, int i4) {
        this.mX = f;
        this.mY = f2;
        this.mXYBuffer = i;
        this.mUVBuffer = i2;
        this.mIndexBuffer = i3;
        this.mBasicTexture = basicTexture;
        this.mIndexCount = i4;
        this.mTarget = 2;
    }
}
