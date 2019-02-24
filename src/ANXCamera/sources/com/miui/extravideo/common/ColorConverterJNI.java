package com.miui.extravideo.common;

class ColorConverterJNI {
    public static native int convertYuv420pToYvu420sp(int i, int i2, byte[] bArr, byte[] bArr2);

    public static native int convertYuv420sp32mToYvu420sp(int i, int i2, byte[] bArr, byte[] bArr2, int i3);

    public static native int convertYuv420sp64x32TileToYvu420sp(int i, int i2, byte[] bArr, byte[] bArr2);

    public static native int convertYuv420spToYvu420sp(int i, int i2, byte[] bArr, byte[] bArr2, int i3, int i4, int i5, int i6, boolean z);

    ColorConverterJNI() {
    }

    static {
        System.loadLibrary("video_extra_color_converter");
    }
}
