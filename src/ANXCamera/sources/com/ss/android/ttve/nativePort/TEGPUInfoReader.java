package com.ss.android.ttve.nativePort;

public class TEGPUInfoReader {
    public static native String nativeGetGLVersion();

    public static native String nativeGetGPURenderer();

    static {
        TENativeLibsLoader.loadLibrary();
    }
}
