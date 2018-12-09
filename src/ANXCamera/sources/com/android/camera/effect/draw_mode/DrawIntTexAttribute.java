package com.android.camera.effect.draw_mode;

public class DrawIntTexAttribute extends DrawAttribute {
    public int mHeight;
    public boolean mIsSnapshot;
    public int mTexId;
    public int mWidth;
    public int mX;
    public int mY;

    public DrawIntTexAttribute(int i, int i2, int i3, int i4, int i5, boolean z) {
        this.mX = i2;
        this.mY = i3;
        this.mWidth = i4;
        this.mHeight = i5;
        this.mTexId = i;
        this.mTarget = 6;
        this.mIsSnapshot = z;
    }
}
