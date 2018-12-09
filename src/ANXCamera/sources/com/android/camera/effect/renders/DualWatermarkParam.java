package com.android.camera.effect.renders;

public class DualWatermarkParam {
    private float mPaddingX;
    private float mPaddingY;
    private String mPath;
    private float mSize;

    public DualWatermarkParam(String str, float f, float f2, float f3) {
        this.mPath = str;
        this.mSize = f;
        this.mPaddingX = f2;
        this.mPaddingY = f3;
    }

    public String getPath() {
        return this.mPath;
    }

    public float getSize() {
        return this.mSize;
    }

    public float getPaddingX() {
        return this.mPaddingX;
    }

    public float getPaddingY() {
        return this.mPaddingY;
    }
}
