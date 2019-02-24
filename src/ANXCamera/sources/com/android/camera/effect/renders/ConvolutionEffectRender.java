package com.android.camera.effect.renders;

import android.opengl.GLES20;
import com.android.gallery3d.ui.GLCanvas;

public abstract class ConvolutionEffectRender extends PixelEffectRender {
    protected float mStepX;
    protected float mStepY;
    protected int mUniformStepH;

    public ConvolutionEffectRender(GLCanvas gLCanvas) {
        super(gLCanvas);
    }

    public ConvolutionEffectRender(GLCanvas gLCanvas, int i) {
        super(gLCanvas, i);
    }

    protected void initShader() {
        super.initShader();
        this.mUniformStepH = GLES20.glGetUniformLocation(this.mProgram, "uStep");
    }

    public void setPreviewSize(int i, int i2) {
        super.setPreviewSize(i, i2);
        setStep(this.mPreviewWidth, this.mPreviewHeight);
    }

    public void setStep(int i, int i2) {
        this.mStepX = 1.0f / ((float) i);
        this.mStepY = 1.0f / ((float) i2);
    }

    protected void initShaderValue(boolean z) {
        super.initShaderValue(z);
        GLES20.glUniform2f(this.mUniformStepH, this.mStepX, this.mStepY);
    }
}
