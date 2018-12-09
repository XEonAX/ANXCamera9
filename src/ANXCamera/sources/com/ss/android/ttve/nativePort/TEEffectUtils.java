package com.ss.android.ttve.nativePort;

public class TEEffectUtils {
    public static native String getEffectVersion();

    static {
        TENativeLibsLoader.loadLibrary();
    }
}
