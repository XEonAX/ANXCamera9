package com.arcsoft.avatar.a;

import android.opengl.GLES20;
import java.nio.Buffer;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;

/* compiled from: GLRender */
public class e {
    private static final String a = "Arc_GLRender";
    private static final int cL = 4;
    private static final String cM = "attribute vec2 vPos;\nattribute vec2 vTex;\nvarying   vec2 vTextureCoord;\nvoid main(){\ngl_Position=vec4(vPos,0.0,1.0);\nvTextureCoord = vTex;\n}\n";
    private static final String cN = "precision mediump float;\nvarying vec2 vTextureCoord;\nuniform sampler2D sTexture;\nvoid main() {\n    gl_FragColor = texture2D(sTexture, vTextureCoord);\n}\n";
    private int b;
    private boolean bM;
    private boolean bO;
    private int c;
    private int cH;
    private int cI;
    private int[] cK = new int[2];
    private int d;
    private int e;
    private int j;

    public e(int i, int i2, int i3, boolean z) {
        if (i2 * i2 <= 0 || i < 0 || i2 < 0) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("GLRender() frameWidth=");
            stringBuilder.append(i);
            stringBuilder.append(" ,frameHeight=");
            stringBuilder.append(i2);
            stringBuilder.append(" invalid.");
            throw new RuntimeException(stringBuilder.toString());
        }
        this.cH = i;
        this.cI = i2;
        this.bO = false;
    }

    public void e(boolean z) {
        GLES20.glGenBuffers(2, this.cK, 0);
        float[] fArr = new float[]{-1.0f, 1.0f, -1.0f, -1.0f, 1.0f, -1.0f, 1.0f, 1.0f};
        ByteBuffer allocateDirect = ByteBuffer.allocateDirect(fArr.length * 4);
        allocateDirect.order(ByteOrder.nativeOrder());
        Buffer asFloatBuffer = allocateDirect.asFloatBuffer();
        asFloatBuffer.put(fArr);
        asFloatBuffer.position(0);
        GLES20.glBindBuffer(34962, this.cK[0]);
        GLES20.glBufferData(34962, fArr.length * 4, asFloatBuffer, 35044);
        GLES20.glBindBuffer(34962, 0);
        fArr = new float[]{0.0f, 0.0f, 0.0f, 1.0f, 1.0f, 1.0f, 1.0f, 0.0f};
        float[] fArr2 = new float[]{0.0f, 1.0f, 0.0f, 0.0f, 1.0f, 0.0f, 1.0f, 1.0f};
        if (!z) {
            fArr2 = fArr;
        }
        ByteBuffer allocateDirect2 = ByteBuffer.allocateDirect(fArr2.length * 4);
        allocateDirect2.order(ByteOrder.nativeOrder());
        Buffer asFloatBuffer2 = allocateDirect2.asFloatBuffer();
        asFloatBuffer2.put(fArr2);
        asFloatBuffer2.position(0);
        GLES20.glBindBuffer(34962, this.cK[1]);
        GLES20.glBufferData(34962, 4 * fArr2.length, asFloatBuffer2, 35044);
        GLES20.glBindBuffer(34962, 0);
        this.b = g.createProgram(cM, cN);
        if (this.b != 0) {
            this.c = GLES20.glGetAttribLocation(this.b, "vPos");
            this.d = GLES20.glGetAttribLocation(this.b, "vTex");
            this.e = GLES20.glGetUniformLocation(this.b, "sTexture");
            this.bO = true;
        }
    }

    public void f(int i) {
        if (this.bO) {
            GLES20.glUseProgram(this.b);
            GLES20.glClear(16640);
            GLES20.glBindBuffer(34962, this.cK[0]);
            GLES20.glVertexAttribPointer(this.c, 2, 5126, false, 8, 0);
            GLES20.glEnableVertexAttribArray(this.c);
            GLES20.glBindBuffer(34962, this.cK[1]);
            GLES20.glVertexAttribPointer(this.d, 2, 5126, false, 8, 0);
            GLES20.glEnableVertexAttribArray(this.d);
            GLES20.glActiveTexture(33984);
            GLES20.glBindTexture(3553, i);
            GLES20.glUniform1i(this.e, 0);
            GLES20.glDrawArrays(6, 0, 4);
            GLES20.glDisableVertexAttribArray(this.c);
            GLES20.glDisableVertexAttribArray(this.d);
            GLES20.glBindBuffer(34962, 0);
            GLES20.glBindTexture(3553, 0);
            GLES20.glUseProgram(0);
        }
    }

    public void n() {
        if (this.bO) {
            GLES20.glDeleteProgram(this.b);
            GLES20.glDeleteBuffers(2, this.cK, 0);
        }
        this.bO = false;
    }

    public void o() {
    }
}
