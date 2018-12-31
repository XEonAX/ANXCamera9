package com.miui.filtersdk.filter;

import android.opengl.GLES20;
import com.miui.filtersdk.filter.base.BaseBeautyFilter;
import com.miui.filtersdk.utils.OpenGlUtils;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.FloatBuffer;

public class YUVBeautyFilter extends BaseBeautyFilter {
    public static final String fragmentShader = "precision highp float;                             \nvarying vec2 v_texCoord;                           \nuniform sampler2D y_texture;                       \nuniform sampler2D uv_texture;                      \nvoid main (void){                                  \n   float r, g, b, y, u, v;                         \n   y = texture2D(y_texture, v_texCoord).r;         \n   u = texture2D(uv_texture, v_texCoord).a - 0.5;  \n   v = texture2D(uv_texture, v_texCoord).r - 0.5;  \n   r = y + 1.402 * v;\n   g = y - 0.34414 * u - 0.71414 * v;\n   b = y + 1.772 * u;\n   gl_FragColor = vec4(r, g, b, 1.0);              \n}                                                  \n";
    public static final String vertexShader = "attribute vec4 a_position;                         \nattribute vec2 a_texCoord;                         \nvarying vec2 v_texCoord;                           \nvoid main(){                                       \n   gl_Position = a_position;                       \n   v_texCoord = a_texCoord;                        \n}                                                  \n";
    private int mGLUniformUVTexture;
    private int mGLUniformYTexture;
    private ByteBuffer mUVBuffer;
    private int mWindowHeight;
    private int mWindowWidth;
    private ByteBuffer mYBuffer;
    private int[] yuvTextureIds;

    public void init() {
        onInit();
        this.yuvTextureIds = new int[2];
        this.yuvTextureIds[0] = -1;
        this.yuvTextureIds[1] = -1;
        initBeauty();
    }

    protected void onInit() {
        this.mGLProgId = OpenGlUtils.loadProgram("attribute vec4 a_position;                         \nattribute vec2 a_texCoord;                         \nvarying vec2 v_texCoord;                           \nvoid main(){                                       \n   gl_Position = a_position;                       \n   v_texCoord = a_texCoord;                        \n}                                                  \n", fragmentShader);
        this.mGLAttribPosition = GLES20.glGetAttribLocation(this.mGLProgId, "a_position");
        this.mGLUniformYTexture = GLES20.glGetUniformLocation(this.mGLProgId, "y_texture");
        this.mGLUniformUVTexture = GLES20.glGetUniformLocation(this.mGLProgId, "uv_texture");
        this.mGLAttribTextureCoordinate = GLES20.glGetAttribLocation(this.mGLProgId, "a_texCoord");
        this.mIsInitialized = true;
    }

    private void initBeauty() {
        this.mBeautyProcessor.init(this.mWindowWidth, this.mWindowHeight);
    }

    public int onDrawFrame(int i, FloatBuffer floatBuffer, FloatBuffer floatBuffer2) {
        return onDrawFrame(this.yuvTextureIds, floatBuffer, floatBuffer2);
    }

    public int onDrawFrame(int[] iArr, FloatBuffer floatBuffer, FloatBuffer floatBuffer2) {
        GLES20.glUseProgram(this.mGLProgId);
        runPendingOnDrawTasks();
        if (!isInitialized()) {
            return -1;
        }
        floatBuffer.position(0);
        GLES20.glVertexAttribPointer(this.mGLAttribPosition, 2, 5126, false, 0, floatBuffer);
        GLES20.glEnableVertexAttribArray(this.mGLAttribPosition);
        floatBuffer2.position(0);
        GLES20.glVertexAttribPointer(this.mGLAttribTextureCoordinate, 2, 5126, false, 0, floatBuffer2);
        GLES20.glEnableVertexAttribArray(this.mGLAttribTextureCoordinate);
        if (iArr[0] != -1) {
            GLES20.glActiveTexture(33984);
            GLES20.glBindTexture(3553, iArr[0]);
            GLES20.glUniform1i(this.mGLUniformYTexture, 0);
        }
        if (iArr[1] != -1) {
            GLES20.glActiveTexture(33985);
            GLES20.glBindTexture(3553, iArr[1]);
            GLES20.glUniform1i(this.mGLUniformUVTexture, 1);
        }
        onDrawArraysPre();
        GLES20.glDrawArrays(5, 0, 4);
        GLES20.glDisableVertexAttribArray(this.mGLAttribPosition);
        GLES20.glDisableVertexAttribArray(this.mGLAttribTextureCoordinate);
        onDrawArraysAfter();
        return 1;
    }

    protected void onDestroy() {
        super.onDestroy();
    }

    public void genYUVTextures(byte[] bArr, final int i, final int i2) {
        this.mBeautyProcessor.beautify(bArr, 0, i, i2, null, 0);
        int i3 = i * i2;
        if (this.mYBuffer == null) {
            this.mYBuffer = ByteBuffer.allocateDirect(i3);
            this.mYBuffer.order(ByteOrder.nativeOrder());
        }
        if (this.mUVBuffer == null) {
            this.mUVBuffer = ByteBuffer.allocateDirect(i3 / 2);
            this.mUVBuffer.order(ByteOrder.nativeOrder());
        }
        this.mYBuffer.put(bArr, 0, i3).position(0);
        this.mUVBuffer.put(bArr, i3, i3 >> 1).position(0);
        runOnDraw(new Runnable() {
            public void run() {
                OpenGlUtils.loadYuvToTextures(YUVBeautyFilter.this.mYBuffer, YUVBeautyFilter.this.mUVBuffer, i, i2, YUVBeautyFilter.this.yuvTextureIds);
            }
        });
    }

    public void initBeautyProcessor(int i, int i2) {
        if (this.mBeautyProcessor != null) {
            this.mWindowWidth = i;
            this.mWindowHeight = i2;
        }
    }
}
