package com.android.camera.effect.draw_mode;

import com.android.gallery3d.ui.GLPaint;

public class DrawLineAttribute extends DrawAttribute {
    public GLPaint mGLPaint;
    public float mX1;
    public float mX2;
    public float mY1;
    public float mY2;

    public DrawLineAttribute(float f, float f2, float f3, float f4, GLPaint gLPaint) {
        this.mX1 = f;
        this.mY1 = f2;
        this.mX2 = f3;
        this.mY2 = f4;
        this.mGLPaint = gLPaint;
        this.mTarget = 0;
    }
}
