package com.ss.android.ttve.nativePort;

import android.support.annotation.Keep;
import android.text.TextUtils;

@Keep
public final class TEVideoUtils {
    private static native int nativeClearWavSeg(String str, int i, int i2);

    private static native int nativeConcat(String[] strArr, String str);

    private static native int nativeGenerateMuteWav(String str, int i, int i2, int i3);

    private static native int nativeGetFileInfo(String str, int[] iArr);

    private static native int nativeGetVideoFrame(String str, int[] iArr, TEVideoUtilsCallback tEVideoUtilsCallback);

    private static native int nativeIsCanImport(String str);

    private static native int nativeMux(String str, String str2, String str3);

    static {
        TENativeLibsLoader.loadLibrary();
    }

    public static int concat(String[] strArr, String str) {
        return nativeConcat(strArr, str);
    }

    public static int mux(String str, String str2, String str3) {
        return nativeMux(str, str2, str3);
    }

    public static int getVideoFileInfo(String str, int[] iArr) {
        return nativeGetFileInfo(str, iArr);
    }

    public static int isCanImport(String str) {
        if (TextUtils.isEmpty(str)) {
            return -100;
        }
        return nativeIsCanImport(str);
    }

    public static int generateMuteWav(String str, int i, int i2, int i3) {
        return nativeGenerateMuteWav(str, i, i2, i3);
    }

    public static int clearWavSeg(String str, int i, int i2) {
        return nativeClearWavSeg(str, i, i2);
    }

    public static int getVideoFrames(String str, int[] iArr, TEVideoUtilsCallback tEVideoUtilsCallback) {
        return nativeGetVideoFrame(str, iArr, tEVideoUtilsCallback);
    }
}
