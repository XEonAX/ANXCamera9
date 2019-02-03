package com.ss.android.ttve.common;

import com.ss.android.ttve.nativePort.TENativeLibsLoader;

public class TESpdLogInvoker {
    public native void close();

    public native int error(String str);

    public native String getLogFiles(String str);

    public native int info(int i, String str);

    public native int initSpdLog(String str, int i, int i2);

    public native void setLevel(int i);

    public native int warn(String str);

    static {
        TENativeLibsLoader.loadLibrary();
    }
}
