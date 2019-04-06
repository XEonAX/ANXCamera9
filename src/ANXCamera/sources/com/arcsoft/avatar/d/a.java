package com.arcsoft.avatar.d;

/* compiled from: ASVLOFFSCREEN */
public class a {
    public static final int ASVL_PAF_NV21 = 2050;
    public static final int ASVL_PAF_RGB32_R8G8B8A8 = 773;
    private int a;
    private int b;
    private int c;
    private int[] ct;
    private byte[] eP;
    private byte[] eQ;
    private byte[] eR;

    public a(int i, int i2, byte[] bArr) {
        this.b = i;
        this.c = i2;
        this.a = 773;
        this.eR = bArr;
    }

    public a(byte[] bArr, int i, int i2, int i3) {
        this.b = i2;
        this.c = i3;
        this.a = 2050;
        this.eP = bArr;
        this.eQ = null;
        this.ct = new int[]{i, i, i};
    }

    public a(byte[] bArr, int i, int i2, int i3, boolean z) {
        this(bArr, i, i2, i3);
        if (z) {
            this.eP = new byte[bArr.length];
            System.arraycopy(bArr, 0, this.eP, 0, bArr.length);
        }
    }

    public a(byte[] bArr, byte[] bArr2, int[] iArr, int i, int i2) {
        this.b = i;
        this.c = i2;
        this.a = 2050;
        this.eP = bArr;
        this.eQ = bArr2;
        this.ct = iArr;
    }

    public byte[] N() {
        return this.eR;
    }

    public byte[] O() {
        return this.eP;
    }

    public byte[] P() {
        return this.eQ;
    }

    public int[] Q() {
        return this.ct;
    }

    public int getHeight() {
        return this.c;
    }

    public int getPixelFormat() {
        return this.a;
    }

    public int getWidth() {
        return this.b;
    }
}
