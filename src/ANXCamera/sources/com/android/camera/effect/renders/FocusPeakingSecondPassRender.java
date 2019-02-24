package com.android.camera.effect.renders;

import android.graphics.Color;
import android.opengl.GLES20;
import android.support.v4.internal.view.SupportMenu;
import com.android.gallery3d.ui.GLCanvas;

/* compiled from: FocusPeakingRender */
class FocusPeakingSecondPassRender extends ConvolutionEffectRender {
    private static final String FRAG = "precision mediump float; \nuniform vec2 uStep; \nuniform vec3 uPeakColor; \nuniform sampler2D sTexture; \nvarying vec2 vTexCoord; \nvec3 neighbor_color() { \n    vec3 sum = vec3(0.0, 0.0, 0.0); \n    vec2 step = uStep; \n    //sum += texture2D(sTexture, vTexCoord -                  step).rgb; \n    sum += texture2D(sTexture, vTexCoord + vec2(0.0,    -step.y)).rgb; \n    //sum += texture2D(sTexture, vTexCoord + vec2(step.x, -step.y)).rgb; \n    sum += texture2D(sTexture, vTexCoord + vec2(step.x,     0.0)).rgb; \n    sum += texture2D(sTexture, vTexCoord                        ).rgb; \n    sum += texture2D(sTexture, vTexCoord + vec2(-step.x,    0.0)).rgb; \n    //sum += texture2D(sTexture, vTexCoord + vec2(-step.x, step.y)).rgb; \n    sum += texture2D(sTexture, vTexCoord + vec2(0.0,     step.y)).rgb; \n    //sum += texture2D(sTexture, vTexCoord +                  step).rgb; \n    return sum; \n} \nvoid main() { \n    vec3 sum = neighbor_color(); \n    if (any(greaterThan(sum, vec3(0.0, 0.0, 0.0)))) { \n        gl_FragColor.rgb = uPeakColor; \n        gl_FragColor.a = 1.0; \n    } else { \n        gl_FragColor.rgb = vec3(0.0, 0.0, 0.0); \n        gl_FragColor.a = 0.0; \n    } \n}";
    private int mPeakColor = SupportMenu.CATEGORY_MASK;
    private int mUniformPeakColorH;

    public FocusPeakingSecondPassRender(GLCanvas gLCanvas) {
        super(gLCanvas);
    }

    public FocusPeakingSecondPassRender(GLCanvas gLCanvas, int i) {
        super(gLCanvas, i);
    }

    protected void initShader() {
        super.initShader();
        this.mUniformPeakColorH = GLES20.glGetUniformLocation(this.mProgram, "uPeakColor");
    }

    protected void initShaderValue(boolean z) {
        super.initShaderValue(z);
        GLES20.glUniform3f(this.mUniformPeakColorH, (float) Color.red(this.mPeakColor), (float) Color.green(this.mPeakColor), (float) Color.blue(this.mPeakColor));
    }

    public void setPeakColor(int i) {
        this.mPeakColor = i;
    }

    protected void setBlendEnabled(boolean z) {
        GLES20.glEnable(3042);
    }

    public String getFragShaderString() {
        return FRAG;
    }
}
