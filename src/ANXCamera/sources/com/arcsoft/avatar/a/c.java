package com.arcsoft.avatar.a;

import android.opengl.GLES20;

/* compiled from: FBOUtil */
public class c {
    private static final String cJ = "/sdcard/Pictures/readfbo/";
    private static final String f = c.class.getSimpleName();
    int[] a = new int[1];
    int[] cE = new int[1];
    int[] cF = new int[1];
    int[] cG = new int[1];
    private int cH;
    private int cI;
    boolean e;
    private int i = 0;

    public void c(int i, int i2) {
        int i3 = i;
        int i4 = i2;
        this.cH = i3;
        this.cI = i4;
        this.a[0] = 0;
        this.cE[0] = 0;
        this.cF[0] = 0;
        GLES20.glGetIntegerv(36006, this.a, 0);
        GLES20.glGenFramebuffers(1, this.cE, 0);
        GLES20.glBindFramebuffer(36160, this.cE[0]);
        GLES20.glPixelStorei(3317, 1);
        GLES20.glGenTextures(1, this.cF, 0);
        GLES20.glBindTexture(3553, this.cF[0]);
        GLES20.glTexParameteri(3553, 10241, 9728);
        GLES20.glTexParameteri(3553, 10240, 9728);
        GLES20.glTexParameteri(3553, 10242, 33071);
        GLES20.glTexParameteri(3553, 10243, 33071);
        GLES20.glTexImage2D(3553, 0, 6408, i3, i4, 0, 6408, 5121, null);
        GLES20.glFramebufferTexture2D(36160, 36064, 3553, this.cF[0], 0);
        GLES20.glGenRenderbuffers(1, this.cG, 0);
        GLES20.glBindRenderbuffer(36161, this.cG[0]);
        GLES20.glRenderbufferStorage(36161, 33190, i3, i4);
        GLES20.glFramebufferRenderbuffer(36160, 36096, 36161, this.cG[0]);
        GLES20.glCheckFramebufferStatus(36160);
        GLES20.glBindFramebuffer(36160, this.a[0]);
        GLES20.glBindTexture(3553, 0);
    }

    public int getHeight() {
        return this.cI;
    }

    public int getTextureId() {
        return this.cF[0];
    }

    public int getWidth() {
        return this.cH;
    }

    public void j() {
        GLES20.glDeleteTextures(1, this.cF, 0);
        this.cF[0] = 0;
        GLES20.glDeleteFramebuffers(1, this.cE, 0);
        this.cE[0] = 0;
        GLES20.glDeleteRenderbuffers(1, this.cG, 0);
        this.cG[0] = 0;
    }

    public void k() {
        this.e = GLES20.glIsEnabled(2929);
        GLES20.glEnable(2929);
        GLES20.glGetIntegerv(36006, this.a, 0);
        GLES20.glBindFramebuffer(36160, this.cE[0]);
        GLES20.glClear(16640);
    }

    public void l() {
        GLES20.glFinish();
        if (this.e) {
            GLES20.glEnable(2929);
        } else {
            GLES20.glDisable(2929);
        }
        GLES20.glBindFramebuffer(36160, this.a[0]);
    }
}
