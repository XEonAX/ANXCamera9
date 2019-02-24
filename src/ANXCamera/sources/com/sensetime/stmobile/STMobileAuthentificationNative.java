package com.sensetime.stmobile;

public class STMobileAuthentificationNative {
    public static native int checkActiveCode(String str, String str2);

    public static native int checkActiveCodeFromBuffer(String str, int i, String str2);

    public static native String generateActiveCode(String str);

    public static native String generateActiveCodeFromBuffer(String str, int i);

    static {
        System.loadLibrary("st_mobile");
        System.loadLibrary("stmobile_jni");
    }
}
