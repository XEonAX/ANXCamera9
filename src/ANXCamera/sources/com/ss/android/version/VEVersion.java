package com.ss.android.version;

public class VEVersion {
    public static native String nativeCability();

    public static String getCability() {
        return nativeCability();
    }
}
