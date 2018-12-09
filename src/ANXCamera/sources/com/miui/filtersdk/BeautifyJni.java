package com.miui.filtersdk;

public class BeautifyJni {
    public static native int Cleanbeautify();

    public static native int Initbeautify();

    public static native int beautifyFaceSetScreenSize(int i, int i2);

    public static native int beautifyFaceUpdateIntensity(int[] iArr);

    public static native int beautifyFaceYUVEditPicture(byte[] bArr, byte[] bArr2, int i, int i2, int i3);

    public static native int beautifyFaceYUVPreviewGPU(byte[] bArr, int i, int i2, int i3, int[] iArr);

    static {
        System.loadLibrary("beauty_jni");
    }
}
