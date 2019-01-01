package com.miui.filtersdk.filter;

import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.Bitmap.Config;
import android.opengl.GLES20;
import android.os.Environment;
import android.util.Log;
import com.android.camera.storage.Storage;
import com.miui.filtersdk.filter.base.BaseBeautyFilter;
import com.miui.filtersdk.utils.OpenGlUtils;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.nio.ByteBuffer;
import java.nio.FloatBuffer;

public class NewBeautificationFilter extends BaseBeautyFilter {
    private static final String TAG = "BeautificationFilter";
    public static final String fragmentShader = "precision highp float;                             \nvarying vec2 v_texCoord;                           \nuniform sampler2D texture;                         \nvoid main (void){                                  \n   vec3 rgb = texture2D(texture, v_texCoord).rgb;  \n   gl_FragColor = vec4(rgb, 1.0);                  \n}                                                  \n";
    public static final String vertexShader = "attribute vec4 a_position;                         \nattribute vec2 a_texCoord;                         \nvarying vec2 v_texCoord;                           \nvoid main(){                                       \n   gl_Position = a_position;                       \n   v_texCoord = a_texCoord;                        \n}                                                  \n";
    private int mWindowHeight;
    private int mWindowWidth;
    private boolean mbGetValidTexureID = false;

    public void init() {
        onInit();
        initBeauty();
    }

    protected void onInit() {
        this.mGLProgId = OpenGlUtils.loadProgram("attribute vec4 a_position;                         \nattribute vec2 a_texCoord;                         \nvarying vec2 v_texCoord;                           \nvoid main(){                                       \n   gl_Position = a_position;                       \n   v_texCoord = a_texCoord;                        \n}                                                  \n", fragmentShader);
        this.mGLAttribPosition = GLES20.glGetAttribLocation(this.mGLProgId, "a_position");
        this.mGLAttribTextureCoordinate = GLES20.glGetAttribLocation(this.mGLProgId, "a_texCoord");
        this.mGLUniformTexture = GLES20.glGetUniformLocation(this.mGLProgId, "texture");
        initFrameBuffers(this.mWindowWidth, this.mWindowHeight);
        this.mIsInitialized = true;
    }

    public void initBeautyProcessor(int i, int i2) {
        if (this.mBeautyProcessor != null) {
            this.mWindowWidth = i;
            this.mWindowHeight = i2;
        }
    }

    private void initBeauty() {
        this.mBeautyProcessor.init(this.mWindowWidth, this.mWindowHeight);
    }

    public int onDrawFrame(int i, FloatBuffer floatBuffer, FloatBuffer floatBuffer2) {
        runPendingOnDrawTasks();
        if (!this.mIsInitialized) {
            return -1;
        }
        GLES20.glUseProgram(this.mGLProgId);
        floatBuffer.position(0);
        GLES20.glVertexAttribPointer(this.mGLAttribPosition, 2, 5126, false, 0, floatBuffer);
        GLES20.glEnableVertexAttribArray(this.mGLAttribPosition);
        floatBuffer2.position(0);
        GLES20.glVertexAttribPointer(this.mGLAttribTextureCoordinate, 2, 5126, false, 0, floatBuffer2);
        GLES20.glEnableVertexAttribArray(this.mGLAttribTextureCoordinate);
        if (this.mTextureId != -1 && this.mbGetValidTexureID) {
            GLES20.glActiveTexture(33984);
            GLES20.glBindTexture(3553, this.mTextureId);
            GLES20.glUniform1i(this.mGLUniformTexture, 0);
        }
        onDrawArraysPre();
        GLES20.glDrawArrays(5, 0, 4);
        GLES20.glDisableVertexAttribArray(this.mGLAttribPosition);
        GLES20.glDisableVertexAttribArray(this.mGLAttribTextureCoordinate);
        onDrawArraysAfter();
        GLES20.glBindTexture(3553, 0);
        return 1;
    }

    public static String dumpMatrix(float[] fArr) {
        int length = fArr.length;
        StringBuilder stringBuilder = new StringBuilder("[");
        for (int i = 0; i < length; i++) {
            stringBuilder.append(String.format("%f", new Object[]{Float.valueOf(fArr[i])}));
            if (i != length - 1) {
                stringBuilder.append(" ");
            }
        }
        stringBuilder.append("]");
        return stringBuilder.toString();
    }

    public int onDrawToTexture(int i, FloatBuffer floatBuffer, FloatBuffer floatBuffer2) {
        if (this.mFrameBuffers == null) {
            return -1;
        }
        runPendingOnDrawTasks();
        if (!isInitialized() || this.mTextureId == -1 || !this.mbGetValidTexureID) {
            return -1;
        }
        GLES20.glViewport(0, 0, this.mFrameWidth, this.mFrameHeight);
        GLES20.glBindFramebuffer(36160, this.mFrameBuffers[0]);
        GLES20.glUseProgram(this.mGLProgId);
        floatBuffer.position(0);
        GLES20.glVertexAttribPointer(this.mGLAttribPosition, 2, 5126, false, 0, floatBuffer);
        GLES20.glEnableVertexAttribArray(this.mGLAttribPosition);
        floatBuffer2.position(0);
        GLES20.glVertexAttribPointer(this.mGLAttribTextureCoordinate, 2, 5126, false, 0, floatBuffer2);
        GLES20.glEnableVertexAttribArray(this.mGLAttribTextureCoordinate);
        if (this.mTextureId != -1 && this.mbGetValidTexureID) {
            GLES20.glActiveTexture(33984);
            GLES20.glBindTexture(3553, this.mTextureId);
            GLES20.glUniform1i(this.mGLUniformTexture, 0);
        }
        onDrawArraysPre();
        GLES20.glDrawArrays(5, 0, 4);
        GLES20.glDisableVertexAttribArray(this.mGLAttribPosition);
        GLES20.glDisableVertexAttribArray(this.mGLAttribTextureCoordinate);
        onDrawArraysAfter();
        GLES20.glBindTexture(3553, 0);
        GLES20.glBindFramebuffer(36160, 0);
        GLES20.glViewport(0, 0, this.mOutputWidth, this.mOutputHeight);
        return this.mFrameBufferTextures[0];
    }

    /* JADX WARNING: Removed duplicated region for block: B:23:0x0077 A:{SYNTHETIC, Splitter: B:23:0x0077} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private static void dumpToBitmap(int i, int i2, ByteBuffer byteBuffer) {
        FileNotFoundException e;
        Throwable th;
        if (byteBuffer != null) {
            Bitmap createBitmap = Bitmap.createBitmap(i, i2, Config.ARGB_8888);
            createBitmap.copyPixelsFromBuffer(byteBuffer);
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(Environment.getExternalStorageDirectory().getPath());
            stringBuilder.append("/hehe/");
            stringBuilder.append(System.currentTimeMillis());
            stringBuilder.append(Storage.JPEG_SUFFIX);
            String stringBuilder2 = stringBuilder.toString();
            FileOutputStream fileOutputStream = null;
            FileOutputStream fileOutputStream2;
            try {
                fileOutputStream2 = new FileOutputStream(new File(stringBuilder2));
                try {
                    createBitmap.compress(CompressFormat.JPEG, 100, fileOutputStream2);
                    String str = TAG;
                    StringBuilder stringBuilder3 = new StringBuilder();
                    stringBuilder3.append("dump to ");
                    stringBuilder3.append(stringBuilder2);
                    Log.d(str, stringBuilder3.toString());
                } catch (FileNotFoundException e2) {
                    e = e2;
                    fileOutputStream = fileOutputStream2;
                } catch (Throwable th2) {
                    th = th2;
                    if (fileOutputStream2 != null) {
                    }
                    throw th;
                }
                try {
                    fileOutputStream2.close();
                } catch (Exception e3) {
                    e3.printStackTrace();
                }
            } catch (FileNotFoundException e4) {
                e = e4;
                try {
                    e.printStackTrace();
                    if (fileOutputStream != null) {
                        fileOutputStream.close();
                    }
                } catch (Throwable th3) {
                    th = th3;
                    fileOutputStream2 = fileOutputStream;
                    if (fileOutputStream2 != null) {
                        try {
                            fileOutputStream2.close();
                        } catch (Exception e5) {
                            e5.printStackTrace();
                        }
                    }
                    throw th;
                }
            }
        }
    }

    public void onDisplaySizeChanged(int i, int i2) {
        super.onDisplaySizeChanged(i, i2);
        this.mBeautyProcessor.onDisplaySizeChanged(i, i2);
    }

    public void onInputSizeChanged(int i, int i2) {
        super.onInputSizeChanged(i, i2);
        this.mBeautyProcessor.onDisplaySizeChanged(i, i2);
    }

    public void passPreviewFrameToTexture(final byte[] bArr, final int i, final int i2) {
        if (!hasPendingDrawTasks()) {
            runOnDraw(new Runnable() {
                public void run() {
                    NewBeautificationFilter.this.mTextureId = NewBeautificationFilter.this.mBeautyProcessor.beautify(bArr, i, i2);
                    NewBeautificationFilter.this.mbGetValidTexureID = true;
                }
            });
        }
    }

    protected void onDestroy() {
        super.onDestroy();
        this.mTextureId = -1;
        this.mbGetValidTexureID = false;
        this.mBeautyProcessor.release();
    }
}
