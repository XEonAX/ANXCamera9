package com.ss.android.ttve.nativePort;

import android.support.annotation.Keep;

@Keep
public class TEGPUInfoReader {
    public static native String nativeGetGLVersion();

    public static native String nativeGetGPURenderer();

    static {
        TENativeLibsLoader.loadLibrary();
    }
}
