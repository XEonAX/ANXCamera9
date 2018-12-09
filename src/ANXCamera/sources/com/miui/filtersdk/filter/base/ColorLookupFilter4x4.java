package com.miui.filtersdk.filter.base;

import android.opengl.GLES20;
import com.miui.filtersdk.BeautificationSDK;
import com.miui.filtersdk.utils.OpenGlUtils;

public class ColorLookupFilter4x4 extends BaseOriginalFilter {
    public static final String AI_LOOKUP_FRAGMENT_SHADER = " precision mediump float;\n varying highp vec2 textureCoordinate;\n uniform sampler2D inputImageTexture;\n uniform sampler2D inputImageTexture2; // lookup texture\n uniform lowp float strength;\n \n void main()\n {\n     lowp vec4 textureColor = texture2D(inputImageTexture, textureCoordinate);\n     \n     mediump float blueColor = textureColor.b * 15.0;\n     \n     mediump vec2 quad1;\n     quad1.y = floor(floor(blueColor) / 4.0);\n     quad1.x = floor(blueColor) - (quad1.y * 4.0);\n     \n     mediump vec2 quad2;\n     quad2.y = floor(ceil(blueColor) / 4.0);\n     quad2.x = ceil(blueColor) - (quad2.y * 4.0);\n     \n     highp vec2 texPos1;\n     texPos1.x = (quad1.x * 1.0/4.0) + 0.5/64.0 + ((1.0/4.0 - 1.0/64.0) * textureColor.r);\n     texPos1.y = (quad1.y * 1.0/4.0) + 0.5/64.0 + ((1.0/4.0 - 1.0/64.0) * textureColor.g);\n     \n     highp vec2 texPos2;\n     texPos2.x = (quad2.x * 1.0/4.0) + 0.5/64.0 + ((1.0/4.0 - 1.0/64.0) * textureColor.r);\n     texPos2.y = (quad2.y * 1.0/4.0) + 0.5/64.0 + ((1.0/4.0 - 1.0/64.0) * textureColor.g);\n     \n     lowp vec4 newColor1 = texture2D(inputImageTexture2, texPos1);\n     lowp vec4 newColor2 = texture2D(inputImageTexture2, texPos2);\n     \n     lowp vec4 newColor = mix(newColor1, newColor2, fract(blueColor));\n     gl_FragColor = mix(textureColor, vec4(newColor.rgb, textureColor.w), strength);\n }";
    private int mGLStrengthLocation;
    public int mLookupSourceTexture = -1;
    public int mLookupTextureUniform;
    private float mStrength = 1.0f;
    protected String mTable;

    public ColorLookupFilter4x4(String str) {
        super(GPUImageFilter.NO_FILTER_VERTEX_SHADER, AI_LOOKUP_FRAGMENT_SHADER);
        this.mTable = str;
    }

    protected void onInit() {
        super.onInit();
        this.mLookupTextureUniform = GLES20.glGetUniformLocation(getProgram(), "inputImageTexture2");
        this.mGLStrengthLocation = GLES20.glGetUniformLocation(getProgram(), "strength");
    }

    protected void onInitialized() {
        super.onInitialized();
        runOnDraw(new Runnable() {
            public void run() {
                ColorLookupFilter4x4.this.mLookupSourceTexture = OpenGlUtils.loadTexture(BeautificationSDK.sContext, ColorLookupFilter4x4.this.mTable);
            }
        });
    }

    protected void onDestroy() {
        super.onDestroy();
        GLES20.glDeleteTextures(1, new int[]{this.mLookupSourceTexture}, 0);
        this.mLookupSourceTexture = -1;
    }

    protected void onDrawArraysAfter() {
        if (this.mLookupSourceTexture != -1) {
            GLES20.glActiveTexture(33987);
            GLES20.glBindTexture(3553, 0);
            GLES20.glActiveTexture(33984);
        }
    }

    protected void onDrawArraysPre() {
        if (this.mLookupSourceTexture != -1) {
            GLES20.glActiveTexture(33987);
            GLES20.glBindTexture(3553, this.mLookupSourceTexture);
            GLES20.glUniform1i(this.mLookupTextureUniform, 3);
        }
        GLES20.glUniform1f(this.mGLStrengthLocation, this.mStrength);
    }

    public boolean isDegreeAdjustSupported() {
        return true;
    }

    public void setDegree(int i) {
        this.mStrength = ((float) i) / 100.0f;
    }
}
