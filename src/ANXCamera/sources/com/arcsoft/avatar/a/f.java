package com.arcsoft.avatar.a;

import android.opengl.GLES20;
import android.opengl.GLES30;
import com.arcsoft.avatar.d.a;
import java.nio.Buffer;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.FloatBuffer;

/* compiled from: GLRenderEngine */
public class f {
    public static String VERTEX_SHADER = "#version 310 es\nlayout(location = 0) in vec3 a_position;\nlayout(location = 1) in vec2 a_texCoord;\nuniform int needFlipY;\nuniform float depth_value;\nlayout (location = 0) out vec2 v_texCoord;\nvoid main() {vec3 newPos = a_position;\nif(1==needFlipY){ newPos = vec3(a_position.x,a_position.y * -1.0,a_position.z);\n}gl_Position = vec4(newPos.xy,depth_value,1.0);\nv_texCoord = a_texCoord;\n}";
    private static final String a = f.class.getSimpleName();
    private static final String b = "y_sampler";
    private static final String c = "uv_sampler";
    private static final float cO = 1.0f;
    public static final int cP = 0;
    public static final int cQ = 1;
    public static final int cR = 1;
    public static final int cS = 0;
    private static final String d = "rgba_sampler";
    public static String dk = "#version 310 es\nprecision mediump float;\nlayout(location = 0) in vec2 v_texCoord;\nout vec4 outColor;\nuniform sampler2D y_sampler;\nuniform sampler2D uv_sampler;\nvoid main() {vec3 yuv;\nvec3 rgb;\nvec4 temp;\nyuv.x = texture(y_sampler,v_texCoord).r;\ntemp = texture(uv_sampler,v_texCoord);\nyuv.y = temp.a - 0.5;\nyuv.z = temp.r - 0.5;\nrgb = mat3(1.0,1.0,1.0,   0.0,-0.344,1.770,   1.403,-0.714,0.0) * yuv;\noutColor = vec4(rgb,1.0);\n}";
    public static String dl = "#version 310 es\nprecision mediump float;\nlayout(location = 0) in vec2 v_texCoord;\nout vec4 outColor;\nuniform sampler2D rgba_sampler;\nvoid main(){outColor = texture(rgba_sampler,v_texCoord);\n}";
    private static final String e = "needFlipY";
    private static final String f = "depth_value";
    private int A;
    private int bW;
    private float cT;
    private int[] cU;
    private int[] cV;
    private int[] cW;
    private int[] cX;
    private int cY;
    private int[] cZ;
    private boolean ce;
    private int cf;
    private int[] da;
    private FloatBuffer dc;
    private FloatBuffer dd;
    private float[] de;
    private float[] df;
    private int[] dg;
    private int dh;
    private d di;
    private float dj;
    private int m;
    private int n;
    private final int w;
    private final int x;
    private int z;

    public f(int i) {
        this.cT = 1.0f;
        this.cU = new int[2];
        this.cV = new int[1];
        this.cW = new int[2];
        this.cX = new int[1];
        this.m = -1;
        this.n = -1;
        this.cZ = new int[2];
        this.da = new int[1];
        this.de = new float[]{-1.0f, 1.0f, 0.0f, -1.0f, -1.0f, 0.0f, 1.0f, -1.0f, 0.0f, 1.0f, 1.0f, 0.0f};
        this.df = new float[]{0.0f, 0.0f, 0.0f, 1.0f, 1.0f, 1.0f, 1.0f, 0.0f};
        this.w = this.de.length * 4;
        this.x = this.df.length * 4;
        this.dg = new int[4];
        this.z = 0;
        this.A = 0;
        this.bW = i;
    }

    public f(int i, int i2) {
        this.cT = 1.0f;
        this.cU = new int[2];
        this.cV = new int[1];
        this.cW = new int[2];
        this.cX = new int[1];
        this.m = -1;
        this.n = -1;
        this.cZ = new int[2];
        this.da = new int[1];
        this.de = new float[]{-1.0f, 1.0f, 0.0f, -1.0f, -1.0f, 0.0f, 1.0f, -1.0f, 0.0f, 1.0f, 1.0f, 0.0f};
        this.df = new float[]{0.0f, 0.0f, 0.0f, 1.0f, 1.0f, 1.0f, 1.0f, 0.0f};
        this.w = this.de.length * 4;
        this.x = this.df.length * 4;
        this.dg = new int[4];
        this.z = i;
        this.A = i2;
        this.bW = 2050;
    }

    public f(int i, int i2, int i3) {
        this.cT = 1.0f;
        this.cU = new int[2];
        this.cV = new int[1];
        this.cW = new int[2];
        this.cX = new int[1];
        this.m = -1;
        this.n = -1;
        this.cZ = new int[2];
        this.da = new int[1];
        this.de = new float[]{-1.0f, 1.0f, 0.0f, -1.0f, -1.0f, 0.0f, 1.0f, -1.0f, 0.0f, 1.0f, 1.0f, 0.0f};
        this.df = new float[]{0.0f, 0.0f, 0.0f, 1.0f, 1.0f, 1.0f, 1.0f, 0.0f};
        this.w = this.de.length * 4;
        this.x = this.df.length * 4;
        this.dg = new int[4];
        this.z = i;
        this.A = i2;
        this.bW = i3;
    }

    private void a() {
        GLES20.glUseProgram(this.cY);
        GLES30.glBindVertexArray(this.da[0]);
        int i = this.bW;
        if (i == 773) {
            GLES20.glUniform1i(this.cX[0], 3);
        } else if (i == 2050) {
            GLES20.glUniform1i(this.cW[0], 0);
            GLES20.glUniform1i(this.cW[1], 1);
        } else {
            return;
        }
        if (1 == this.dh) {
            GLES20.glUniform1i(this.m, 1);
        } else {
            GLES20.glUniform1i(this.m, 0);
        }
        GLES20.glUniform1f(this.n, this.dj);
        GLES20.glDrawArrays(6, 0, 4);
        GLES30.glBindVertexArray(0);
        GLES20.glBindTexture(3553, 0);
    }

    private void a(float[] fArr) {
        int i;
        if (this.ce) {
            i = this.cf;
            if (i == 0) {
                fArr[0] = this.cT;
                fArr[1] = 0.0f;
                fArr[2] = this.cT;
                fArr[3] = 1.0f;
                fArr[4] = 0.0f;
                fArr[5] = 1.0f;
                fArr[6] = 0.0f;
                fArr[7] = 0.0f;
            } else if (i == 90) {
                fArr[0] = this.cT;
                fArr[1] = 1.0f;
                fArr[2] = 0.0f;
                fArr[3] = 1.0f;
                fArr[4] = 0.0f;
                fArr[5] = 0.0f;
                fArr[6] = this.cT;
                fArr[7] = 0.0f;
            } else if (i == 180) {
                fArr[0] = 0.0f;
                fArr[1] = 1.0f;
                fArr[2] = 0.0f;
                fArr[3] = 0.0f;
                fArr[4] = this.cT;
                fArr[5] = 0.0f;
                fArr[6] = this.cT;
                fArr[7] = 1.0f;
            } else if (i == 270) {
                fArr[0] = 0.0f;
                fArr[1] = 0.0f;
                fArr[2] = this.cT;
                fArr[3] = 0.0f;
                fArr[4] = this.cT;
                fArr[5] = 1.0f;
                fArr[6] = 0.0f;
                fArr[7] = 1.0f;
            }
        } else {
            i = this.cf;
            if (i == 0) {
                fArr[0] = 0.0f;
                fArr[1] = 0.0f;
                fArr[2] = 0.0f;
                fArr[3] = 1.0f;
                fArr[4] = this.cT;
                fArr[5] = 1.0f;
                fArr[6] = this.cT;
                fArr[7] = 0.0f;
            } else if (i == 90) {
                fArr[0] = 0.0f;
                fArr[1] = 1.0f;
                fArr[2] = this.cT;
                fArr[3] = 1.0f;
                fArr[4] = this.cT;
                fArr[5] = 0.0f;
                fArr[6] = 0.0f;
                fArr[7] = 0.0f;
            } else if (i == 180) {
                fArr[0] = this.cT;
                fArr[1] = 1.0f;
                fArr[2] = this.cT;
                fArr[3] = 0.0f;
                fArr[4] = 0.0f;
                fArr[5] = 0.0f;
                fArr[6] = 0.0f;
                fArr[7] = 1.0f;
            } else if (i == 270) {
                fArr[0] = this.cT;
                fArr[1] = 0.0f;
                fArr[2] = 0.0f;
                fArr[3] = 0.0f;
                fArr[4] = 0.0f;
                fArr[5] = 1.0f;
                fArr[6] = this.cT;
                fArr[7] = 1.0f;
            }
        }
        GLES20.glBindBuffer(34962, this.cZ[1]);
        this.dd.position(0);
        this.dd.put(fArr);
        this.dd.position(0);
        GLES20.glBufferData(34962, fArr.length * 4, this.dd, 35048);
    }

    private void b() {
        this.dh = 0;
        this.ce = false;
        this.cf = 0;
        this.A = 0;
        this.z = 0;
        this.cY = 0;
    }

    private void c() {
        GLES20.glTexParameteri(3553, 10242, 33071);
        GLES20.glTexParameteri(3553, 10243, 33071);
        GLES20.glTexParameteri(3553, 10241, 9728);
        GLES20.glTexParameteri(3553, 10240, 9729);
    }

    public void a(float f) {
        this.dj = f;
    }

    public void a(boolean z, int i) {
        this.ce = z;
        this.cf = i;
        a(new float[this.df.length]);
    }

    public void a(int[] iArr) {
        if (iArr == null) {
            iArr = this.dg;
            int[] iArr2 = this.dg;
            int i = this.z;
            iArr2[1] = i;
            iArr[0] = i;
            return;
        }
        this.dg[0] = iArr[0];
        this.dg[1] = iArr[1];
        iArr = this.dg;
        int[] iArr3 = this.dg;
        int i2 = this.dg[1];
        iArr3[3] = i2;
        iArr[2] = i2;
        if (this.z != this.dg[0]) {
            float f = 1.0f - ((((float) (this.dg[0] - this.z)) + 1.0f) / ((float) this.dg[0]));
            float[] fArr = this.df;
            this.df[6] = f;
            fArr[4] = f;
            this.cT = f;
        }
    }

    public void b(a aVar) {
        if (this.bW == 2050) {
            int i = aVar.Q()[0];
            int height = aVar.getHeight() * i;
            Buffer wrap = ByteBuffer.wrap(aVar.O(), 0, height);
            wrap.position(0);
            int i2 = height >> 1;
            Buffer allocate = ByteBuffer.allocate(i2);
            allocate.put(aVar.O(), height, i2);
            allocate.position(0);
            GLES20.glActiveTexture(33984);
            GLES20.glBindTexture(3553, this.cU[0]);
            GLES20.glTexImage2D(3553, 0, 6409, i, aVar.getHeight(), 0, 6409, 5121, wrap);
            GLES20.glActiveTexture(33985);
            GLES20.glBindTexture(3553, this.cU[1]);
            GLES20.glTexImage2D(3553, 0, 6410, i >> 1, aVar.getHeight() >> 1, 0, 6410, 5121, allocate);
            a();
        }
    }

    public void f(int i) {
        int i2 = this.bW;
        if (i2 == 773) {
            GLES20.glActiveTexture(33987);
            GLES20.glBindTexture(3553, i);
        } else if (i2 != 2050) {
        }
        a();
    }

    public void g(int i) {
        this.dh = i;
    }

    public void p() {
        GLES20.glGenTextures(2, this.cU, 0);
        GLES20.glBindTexture(3553, this.cU[0]);
        c();
        GLES20.glBindTexture(3553, 0);
        GLES20.glBindTexture(3553, this.cU[1]);
        c();
        GLES20.glBindTexture(3553, 0);
        this.cY = g.createProgram(VERTEX_SHADER, dk);
        this.cW[0] = GLES20.glGetUniformLocation(this.cY, b);
        this.cW[1] = GLES20.glGetUniformLocation(this.cY, c);
        this.m = GLES20.glGetUniformLocation(this.cY, e);
        this.n = GLES20.glGetUniformLocation(this.cY, f);
    }

    public void q() {
        this.cY = g.createProgram(VERTEX_SHADER, dl);
        this.cX[0] = GLES20.glGetUniformLocation(this.cY, d);
        this.m = GLES20.glGetUniformLocation(this.cY, e);
        this.n = GLES20.glGetUniformLocation(this.cY, f);
    }

    public void r() {
        this.dj = 0.0f;
        GLES30.glGenVertexArrays(1, this.da, 0);
        GLES30.glBindVertexArray(this.da[0]);
        GLES20.glGenBuffers(2, this.cZ, 0);
        GLES20.glBindBuffer(34962, this.cZ[0]);
        ByteBuffer allocateDirect = ByteBuffer.allocateDirect(this.w);
        allocateDirect.order(ByteOrder.nativeOrder());
        this.dc = allocateDirect.asFloatBuffer();
        this.dc.position(0);
        this.dc.put(this.de);
        this.dc.position(0);
        GLES20.glBufferData(34962, this.w, this.dc, 35044);
        GLES20.glEnableVertexAttribArray(0);
        GLES20.glVertexAttribPointer(0, 3, 5126, false, 12, 0);
        GLES20.glBindBuffer(34962, this.cZ[1]);
        allocateDirect = ByteBuffer.allocateDirect(this.x);
        allocateDirect.order(ByteOrder.nativeOrder());
        this.dd = allocateDirect.asFloatBuffer();
        this.dd.position(0);
        this.dd.put(this.df);
        this.dd.position(0);
        GLES20.glBufferData(34962, this.x, this.dd, 35044);
        GLES20.glEnableVertexAttribArray(1);
        GLES20.glVertexAttribPointer(1, 2, 5126, false, 8, 0);
        GLES20.glBindBuffer(34962, 0);
        GLES30.glBindVertexArray(0);
    }

    public void unInit() {
        int[] iArr;
        if (this.cY != 0) {
            GLES20.glDeleteProgram(this.cY);
            this.cY = 0;
        }
        if (this.da[0] != 0) {
            GLES30.glDeleteVertexArrays(1, this.da, 0);
            this.da[0] = 0;
        }
        if (this.cU[0] != 0) {
            GLES20.glDeleteTextures(2, this.cU, 0);
            iArr = this.cU;
            this.cU[1] = 0;
            iArr[0] = 0;
        }
        if (this.cV[0] != 0) {
            GLES20.glDeleteTextures(1, this.cV, 0);
            this.cV[0] = 0;
        }
        if (this.cZ[0] != 0) {
            GLES20.glDeleteBuffers(2, this.cZ, 0);
            iArr = this.cZ;
            this.cZ[1] = 0;
            iArr[0] = 0;
        }
        b();
    }
}
