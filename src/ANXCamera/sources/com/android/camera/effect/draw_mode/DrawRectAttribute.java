package com.android.camera.effect.draw_mode;

import com.android.gallery3d.ui.GLPaint;

public class DrawRectAttribute extends DrawAttribute {
    public GLPaint mGLPaint;
    public float mHeight;
    public float mWidth;
    public float mX;
    public float mY;

    public DrawRectAttribute(float f, float f2, float f3, float f4, GLPaint gLPaint) {
        this.mX = f;
        this.mY = f2;
        this.mWidth = f3;
        this.mHeight = f4;
        this.mGLPaint = gLPaint;
        this.mTarget = 1;
    }
}
