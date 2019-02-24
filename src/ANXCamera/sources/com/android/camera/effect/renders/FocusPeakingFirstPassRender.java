package com.android.camera.effect.renders;

import android.graphics.Color;
import android.opengl.GLES20;
import android.support.v4.internal.view.SupportMenu;
import com.android.gallery3d.ui.GLCanvas;

/* compiled from: FocusPeakingRender */
class FocusPeakingFirstPassRender extends ConvolutionEffectRender {
    private static final String FRAG = "precision mediump float; \nuniform float uThreshold; \nuniform vec3 uPeakColor; \nuniform vec2 uStep; \nuniform sampler2D sTexture; \nvarying vec2 vTexCoord; \nfloat laplacian_filter() { \n    vec3 factor = vec3(0.299, 0.587, 0.114); \n    vec2 step = uStep; \n    vec3 sum = vec3(0.0, 0.0, 0.0); \n    sum += texture2D(sTexture, vTexCoord -                  step).rgb *  0.0; \n    sum += texture2D(sTexture, vTexCoord + vec2(0.0,    -step.y)).rgb *  1.0; \n    sum += texture2D(sTexture, vTexCoord + vec2(step.x, -step.y)).rgb *  0.0; \n    sum += texture2D(sTexture, vTexCoord + vec2(step.x,     0.0)).rgb *  1.0; \n    sum += texture2D(sTexture, vTexCoord                        ).rgb * -4.0; \n    sum += texture2D(sTexture, vTexCoord + vec2(-step.x,    0.0)).rgb *  1.0; \n    sum += texture2D(sTexture, vTexCoord + vec2(-step.x, step.y)).rgb *  0.0; \n    sum += texture2D(sTexture, vTexCoord + vec2(0.0,     step.y)).rgb *  1.0; \n    sum += texture2D(sTexture, vTexCoord +                  step).rgb *  0.0; \n    return dot(sum, factor); \n} \nvoid main() { \n    float gray = laplacian_filter(); \n    if (gray > uThreshold) { \n        gl_FragColor.rgb = uPeakColor; \n        gl_FragColor.a = 1.0; \n    } else { \n        gl_FragColor.rgb = vec3(0.0, 0.0, 0.0); \n        gl_FragColor.a = 1.0; \n    } \n}";
    private int mPeakColor = SupportMenu.CATEGORY_MASK;
    private float mThreshold = FocusPeakingRender.DEFAULT_THRESHOLD;
    private int mUniformPeakColorH;
    private int mUniformThresholdH;

    public FocusPeakingFirstPassRender(GLCanvas gLCanvas) {
        super(gLCanvas);
    }

    public FocusPeakingFirstPassRender(GLCanvas gLCanvas, int i) {
        super(gLCanvas, i);
    }

    protected void initShader() {
        super.initShader();
        this.mUniformThresholdH = GLES20.glGetUniformLocation(this.mProgram, "uThreshold");
        this.mUniformPeakColorH = GLES20.glGetUniformLocation(this.mProgram, "uPeakColor");
    }

    protected void initShaderValue(boolean z) {
        super.initShaderValue(z);
        GLES20.glUniform1f(this.mUniformThresholdH, this.mThreshold);
        GLES20.glUniform3f(this.mUniformPeakColorH, (float) Color.red(this.mPeakColor), (float) Color.green(this.mPeakColor), (float) Color.blue(this.mPeakColor));
    }

    public String getFragShaderString() {
        return FRAG;
    }

    public void setThreshold(float f) {
        this.mThreshold = f;
    }

    public void setPeakColor(int i) {
        this.mPeakColor = i;
    }

    protected void setBlendEnabled(boolean z) {
        GLES20.glEnable(3042);
    }
}
