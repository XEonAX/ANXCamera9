package com.miui.filtersdk.filter;

import android.opengl.GLES20;
import com.miui.filtersdk.filter.base.BaseBeautyFilter;
import com.miui.filtersdk.utils.OpenGlUtils;
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
    private static void dumpToBitmap(int r2, int r3, java.nio.ByteBuffer r4) {
        /*
        if (r4 == 0) goto L_0x0080;
    L_0x0003:
        r0 = android.graphics.Bitmap.Config.ARGB_8888;
        r2 = android.graphics.Bitmap.createBitmap(r2, r3, r0);
        r2.copyPixelsFromBuffer(r4);
        r3 = new java.lang.StringBuilder;
        r3.<init>();
        r4 = android.os.Environment.getExternalStorageDirectory();
        r4 = r4.getPath();
        r3.append(r4);
        r4 = "/hehe/";
        r3.append(r4);
        r0 = java.lang.System.currentTimeMillis();
        r3.append(r0);
        r4 = ".jpg";
        r3.append(r4);
        r3 = r3.toString();
        r4 = 0;
        r0 = new java.io.FileOutputStream;	 Catch:{ FileNotFoundException -> 0x0066 }
        r1 = new java.io.File;	 Catch:{ FileNotFoundException -> 0x0066 }
        r1.<init>(r3);	 Catch:{ FileNotFoundException -> 0x0066 }
        r0.<init>(r1);	 Catch:{ FileNotFoundException -> 0x0066 }
        r4 = android.graphics.Bitmap.CompressFormat.JPEG;	 Catch:{ FileNotFoundException -> 0x0060, all -> 0x005e }
        r1 = 100;
        r2.compress(r4, r1, r0);	 Catch:{ FileNotFoundException -> 0x0060, all -> 0x005e }
        r2 = "BeautificationFilter";
        r4 = new java.lang.StringBuilder;	 Catch:{ FileNotFoundException -> 0x0060, all -> 0x005e }
        r4.<init>();	 Catch:{ FileNotFoundException -> 0x0060, all -> 0x005e }
        r1 = "dump to ";
        r4.append(r1);	 Catch:{ FileNotFoundException -> 0x0060, all -> 0x005e }
        r4.append(r3);	 Catch:{ FileNotFoundException -> 0x0060, all -> 0x005e }
        r3 = r4.toString();	 Catch:{ FileNotFoundException -> 0x0060, all -> 0x005e }
        android.util.Log.d(r2, r3);	 Catch:{ FileNotFoundException -> 0x0060, all -> 0x005e }
        r0.close();	 Catch:{ Exception -> 0x0070 }
        goto L_0x006f;
    L_0x005e:
        r2 = move-exception;
        goto L_0x0075;
    L_0x0060:
        r2 = move-exception;
        r4 = r0;
        goto L_0x0067;
    L_0x0063:
        r2 = move-exception;
        r0 = r4;
        goto L_0x0075;
    L_0x0066:
        r2 = move-exception;
    L_0x0067:
        r2.printStackTrace();	 Catch:{ all -> 0x0063 }
        if (r4 == 0) goto L_0x0080;
    L_0x006c:
        r4.close();	 Catch:{ Exception -> 0x0070 }
    L_0x006f:
        goto L_0x0080;
    L_0x0070:
        r2 = move-exception;
        r2.printStackTrace();
        goto L_0x006f;
    L_0x0075:
        if (r0 == 0) goto L_0x007f;
    L_0x0077:
        r0.close();	 Catch:{ Exception -> 0x007b }
        goto L_0x007f;
    L_0x007b:
        r3 = move-exception;
        r3.printStackTrace();
    L_0x007f:
        throw r2;
    L_0x0080:
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.miui.filtersdk.filter.NewBeautificationFilter.dumpToBitmap(int, int, java.nio.ByteBuffer):void");
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
