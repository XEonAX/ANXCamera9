package com.ss.android.medialib;

import android.support.annotation.Keep;
import com.ss.android.medialib.NativePort.NativeLibsLoader;

@Keep
public class SpdLogInvoker {
    public native void close();

    public native int err(String str);

    public native String getLogFiles(String str);

    public native int info(int i, String str);

    public native int initSpdLog(String str, int i, int i2);

    public native void setLevel(int i);

    public native int warn(String str);

    static {
        NativeLibsLoader.loadLibrary();
    }
}
