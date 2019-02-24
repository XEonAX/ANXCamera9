package com.android.camera.effect;

import com.android.camera.log.Log;

public class ShaderNativeUtil {
    private static final String TAG = "ShaderNativeUtil";

    private static native byte[] compressJpeg(byte[] bArr, int i, int i2, int i3);

    private static native byte[] decompressJpeg(byte[] bArr, int i);

    private static native byte[] getJpegPicture(int i, int i2, int i3, int i4, int i5);

    private static native int[] initJpegTexture(byte[] bArr, int i, int i2);

    static {
        try {
            System.loadLibrary("CameraEffectJNI");
        } catch (Throwable th) {
            Log.e(TAG, "ShaderNativeUtil load CameraEffectJNI.so failed.", th);
        }
    }

    public static int[] initTexture(byte[] bArr, int i) {
        return initJpegTexture(bArr, i, 1);
    }

    public static int[] initTexture(byte[] bArr, int i, int i2) {
        return initJpegTexture(bArr, i, i2);
    }

    public static byte[] getPicture(int i, int i2, int i3) {
        return getJpegPicture(0, 0, i, i2, i3);
    }

    public static byte[] getPicture(int i, int i2, int i3, int i4, int i5) {
        return getJpegPicture(i, i2, i3, i4, i5);
    }

    public static byte[] decompressPicture(byte[] bArr, int i) {
        return decompressJpeg(bArr, i);
    }

    public static byte[] compressPicture(byte[] bArr, int i, int i2, int i3) {
        return compressJpeg(bArr, i, i2, i3);
    }
}
