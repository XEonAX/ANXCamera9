package com.xiaomi.engine;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

@Retention(RetentionPolicy.SOURCE)
public @interface CameraOperationMode {
    public static final int CAMERA_ILLEGALSTATE_EXCEPTION = 256;
    public static final int SESSION_OPERATION_MODE_ALGO_UP = 36864;
    public static final int SESSION_OPERATION_MODE_CONSTRAINED_HIGH_SPEED = 1;
    @Deprecated
    public static final int SESSION_OPERATION_MODE_FACE_UNLOCK = 32774;
    public static final int SESSION_OPERATION_MODE_FOVC = 61456;
    public static final int SESSION_OPERATION_MODE_FRONT_PORTRAIT = 33009;
    public static final int SESSION_OPERATION_MODE_HFR_120 = 32888;
    public static final int SESSION_OPERATION_MODE_MANUAL = 32771;
    public static final int SESSION_OPERATION_MODE_MIUI_BACK = 32769;
    public static final int SESSION_OPERATION_MODE_MIUI_FRONT = 32773;
    public static final int SESSION_OPERATION_MODE_NORMAL = 0;
    public static final int SESSION_OPERATION_MODE_PANORMA = 32776;
    public static final int SESSION_OPERATION_MODE_PORTRAIT = 32770;
    public static final int SESSION_OPERATION_MODE_QCFA_FRONT = 32775;
    public static final int SESSION_OPERATION_MODE_VENDOR_START = 32768;
    public static final int SESSION_OPERATION_MODE_VIDEO = 32772;
}
