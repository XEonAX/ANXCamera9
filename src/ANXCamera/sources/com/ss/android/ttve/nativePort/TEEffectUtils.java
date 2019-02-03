package com.ss.android.ttve.nativePort;

import android.support.annotation.Keep;

@Keep
public class TEEffectUtils {
    public static native String getEffectVersion();

    static {
        TENativeLibsLoader.loadLibrary();
    }
}
