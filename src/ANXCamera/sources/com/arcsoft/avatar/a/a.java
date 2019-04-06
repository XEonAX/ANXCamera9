package com.arcsoft.avatar.a;

import android.opengl.GLES30;
import java.nio.Buffer;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.FloatBuffer;

/* compiled from: DrawTexture */
public class a {
    private final String a = "#version 310 es\nprecision mediump float;\nin vec2 vTextureCoord;\nuniform sampler2D sTexture;\nout vec4 fragColor;\nvoid main()\n{ \n   fragColor = texture(sTexture, vTextureCoord); \n}";
    private final String b = "#version 310 es\nlayout(location = 0) in vec2 arc_tex_coord;\nlayout(location = 1) in vec2 aPosition;\nout vec2 vTextureCoord;\nvoid main()\n{\n   vTextureCoord = arc_tex_coord;\n   gl_Position = vec4(aPosition, 1.0, 1.0);\n} ";
    private boolean bN;
    private int c = -1;
    private int[] ct = new int[2];
    private int[] cu = new int[1];
    private FloatBuffer cv;
    private float[] cw = new float[]{-1.0f, 1.0f, -1.0f, -1.0f, 1.0f, -1.0f, 1.0f, 1.0f};
    private float[] cx = new float[]{0.0f, 1.0f, 0.0f, 0.0f, 1.0f, 0.0f, 1.0f, 1.0f};
    private int d = -1;
    private int e = -1;
    private int f = -1;
    private float[] l = new float[]{0.0f, 0.0f, 0.0f, 1.0f, 1.0f, 1.0f, 1.0f, 0.0f};

    private void a(boolean z) {
        float[] fArr = z ? this.cx : this.l;
        int[] iArr = this.ct;
        this.ct[1] = -1;
        iArr[0] = -1;
        this.cu[0] = -1;
        GLES30.glGenVertexArrays(1, this.cu, 0);
        GLES30.glBindVertexArray(this.cu[0]);
        GLES30.glGenBuffers(2, this.ct, 0);
        ByteBuffer allocateDirect = ByteBuffer.allocateDirect(this.cw.length * 4);
        allocateDirect.order(ByteOrder.nativeOrder());
        Buffer asFloatBuffer = allocateDirect.asFloatBuffer();
        asFloatBuffer.put(this.cw);
        asFloatBuffer.position(0);
        this.e = GLES30.glGetAttribLocation(this.d, "aPosition");
        GLES30.glBindBuffer(34962, this.ct[0]);
        GLES30.glBufferData(34962, this.cw.length * 4, asFloatBuffer, 35044);
        GLES30.glEnableVertexAttribArray(this.e);
        GLES30.glVertexAttribPointer(this.e, 2, 5126, false, 8, 0);
        allocateDirect = ByteBuffer.allocateDirect(fArr.length * 4);
        allocateDirect.order(ByteOrder.nativeOrder());
        this.cv = allocateDirect.asFloatBuffer();
        this.cv.put(fArr);
        this.cv.position(0);
        this.bN = false;
        this.f = GLES30.glGetAttribLocation(this.d, "arc_tex_coord");
        GLES30.glBindBuffer(34962, this.ct[1]);
        GLES30.glBufferData(34962, 4 * fArr.length, this.cv, 35048);
        GLES30.glEnableVertexAttribArray(this.f);
        GLES30.glVertexAttribPointer(this.f, 2, 5126, false, 8, 0);
        GLES30.glBindBuffer(34962, 0);
        GLES30.glBindVertexArray(0);
    }

    private void b(boolean z) {
        this.cv.position(0);
        if (z && !this.bN) {
            this.cv.put(this.cx);
            this.bN = true;
        } else if (!z && this.bN) {
            this.cv.put(this.l);
            this.bN = false;
        } else {
            return;
        }
        GLES30.glBindBuffer(34962, this.ct[1]);
        this.cv.position(0);
        GLES30.glBufferSubData(34962, 0, 4 * this.l.length, this.cv);
        GLES30.glBindBuffer(34962, 0);
    }

    public void d(boolean z) {
        int[] iArr;
        int glCreateShader = GLES30.glCreateShader(35633);
        int glCreateShader2 = GLES30.glCreateShader(35632);
        if (glCreateShader != 0) {
            GLES30.glShaderSource(glCreateShader, "#version 310 es\nlayout(location = 0) in vec2 arc_tex_coord;\nlayout(location = 1) in vec2 aPosition;\nout vec2 vTextureCoord;\nvoid main()\n{\n   vTextureCoord = arc_tex_coord;\n   gl_Position = vec4(aPosition, 1.0, 1.0);\n} ");
            GLES30.glCompileShader(glCreateShader);
            iArr = new int[1];
            GLES30.glGetShaderiv(glCreateShader, 35713, iArr, 0);
            if (iArr[0] == 0) {
                GLES30.glDeleteShader(glCreateShader);
            }
        }
        if (glCreateShader2 != 0) {
            GLES30.glShaderSource(glCreateShader2, "#version 310 es\nprecision mediump float;\nin vec2 vTextureCoord;\nuniform sampler2D sTexture;\nout vec4 fragColor;\nvoid main()\n{ \n   fragColor = texture(sTexture, vTextureCoord); \n}");
            GLES30.glCompileShader(glCreateShader2);
            iArr = new int[1];
            GLES30.glGetShaderiv(glCreateShader2, 35713, iArr, 0);
            if (iArr[0] == 0) {
                GLES30.glDeleteShader(glCreateShader2);
            }
        }
        this.d = GLES30.glCreateProgram();
        if (this.d != 0) {
            GLES30.glAttachShader(this.d, glCreateShader);
            GLES30.glAttachShader(this.d, glCreateShader2);
            GLES30.glLinkProgram(this.d);
            int[] iArr2 = new int[1];
            GLES30.glGetProgramiv(this.d, 35714, iArr2, 0);
            if (iArr2[0] == 0) {
                this.d = 0;
            }
        }
        a(z);
        this.c = GLES30.glGetUniformLocation(this.d, "sTexture");
    }

    public void e(int i) {
        GLES30.glUseProgram(this.d);
        GLES30.glBindVertexArray(this.cu[0]);
        GLES30.glActiveTexture(33984);
        GLES30.glBindTexture(3553, i);
        GLES30.glUniform1i(this.c, 0);
        GLES30.glDrawArrays(6, 0, 4);
        GLES30.glBindTexture(3553, 0);
        GLES30.glBindVertexArray(0);
    }

    public void h() {
        if (this.d > 0) {
            GLES30.glDeleteProgram(this.d);
            this.d = -1;
        }
        if (this.cu[0] > 0) {
            GLES30.glDeleteVertexArrays(1, this.cu, 0);
            this.cu[0] = -1;
        }
        if (this.ct[0] > 0) {
            GLES30.glDeleteBuffers(2, this.ct, 0);
            int[] iArr = this.ct;
            this.ct[1] = -1;
            iArr[0] = -1;
        }
    }
}
