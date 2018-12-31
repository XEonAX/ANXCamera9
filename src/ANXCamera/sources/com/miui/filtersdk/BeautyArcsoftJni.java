package com.miui.filtersdk;

import android.graphics.Bitmap;

public class BeautyArcsoftJni {
    public static native void beautifyProcess(byte[] bArr, int i, int i2, int i3, int i4, int i5, int i6, int i7, int i8, int i9, int i10, int i11, int i12, int i13, int i14);

    public static native void beautifyProcessBitmap(Bitmap bitmap, int i, int i2, int i3, int i4, int i5, int i6, int i7, int i8, int i9, int i10, int i11, int i12, int i13, int i14);

    static {
        System.loadLibrary("image_arcsoft_4plus");
    }
}
