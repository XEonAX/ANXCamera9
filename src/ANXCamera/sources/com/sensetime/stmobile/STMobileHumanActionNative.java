package com.sensetime.stmobile;

public class STMobileHumanActionNative {
    public static final int ST_MOBILE_BROW_JUMP = 32;
    public static final int ST_MOBILE_EYE_BLINK = 2;
    public static final int ST_MOBILE_FACE_DETECT = 1;
    public static final int ST_MOBILE_HAND_CONGRATULATE = 131072;
    public static final int ST_MOBILE_HAND_FINGER_HEART = 262144;
    public static final int ST_MOBILE_HAND_GOOD = 2048;
    public static final int ST_MOBILE_HAND_HOLDUP = 32768;
    public static final int ST_MOBILE_HAND_LOVE = 16384;
    public static final int ST_MOBILE_HAND_PALM = 4096;
    public static final int ST_MOBILE_HEAD_PITCH = 16;
    public static final int ST_MOBILE_HEAD_YAW = 8;
    public static final int ST_MOBILE_HUMAN_ACTION_DEFAULT_CONFIG_DETECT = 514111;
    public static final int ST_MOBILE_HUMAN_ACTION_DEFAULT_CONFIG_IMAGE = 65984;
    public static final int ST_MOBILE_HUMAN_ACTION_DEFAULT_CONFIG_VIDEO = 496;
    public static final int ST_MOBILE_MOUTH_AH = 4;
    public static final int ST_MOBILE_SEG_BACKGROUND = 65536;
    private static final String TAG = STMobileHumanActionNative.class.getSimpleName();
    private long nativeHumanActionHandle;

    public native int createInstance(String str, int i);

    public native void destroyInstance();

    public native STHumanAction humanActionDetect(byte[] bArr, int i, int i2, int i3, int i4, int i5);

    public native void reset();

    public native int setParam(int i, float f);

    static {
        System.loadLibrary("st_mobile");
        System.loadLibrary("stmobile_jni");
    }
}
