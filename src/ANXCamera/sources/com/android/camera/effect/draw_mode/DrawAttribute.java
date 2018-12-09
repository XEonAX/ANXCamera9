package com.android.camera.effect.draw_mode;

public abstract class DrawAttribute {
    public static final int BASIC_TEXTURE = 5;
    public static final int BLUR_TEXTURE = 10;
    public static final int EXT_TEXTURE = 8;
    public static final int FILL_RECT = 4;
    public static final int INT_TEXTURE = 6;
    public static final int JPEG = 9;
    public static final int LINE = 0;
    public static final int MESH = 2;
    public static final int MIXED = 3;
    public static final int NONE = -1;
    public static final int RECT = 1;
    public static final int RECTF_TEXTURE = 7;
    public static final int YUV_TEXTURE = 11;
    protected int mTarget = -1;

    public int getTarget() {
        return this.mTarget;
    }
}
