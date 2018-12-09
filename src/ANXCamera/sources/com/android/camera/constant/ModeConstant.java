package com.android.camera.constant;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

public class ModeConstant {
    public static final int MODE_CAPTURE = 163;
    public static final int MODE_FAST_MOTION = 169;
    public static final int MODE_FUN = 161;
    public static final int MODE_LIVE = 174;
    public static final int MODE_MANUAL = 167;
    public static final int MODE_NEW_SLOW_MOTION = 172;
    public static final int MODE_PANORAMA = 166;
    public static final int MODE_PORTRAIT = 171;
    public static final int MODE_RECORD_VIDEO = 162;
    public static final int MODE_SLOW_MOTION = 168;
    public static final int MODE_SQUARE = 165;
    public static final int MODE_SUPER_NIGHT = 173;
    public static final int MODE_UNSPECIFIED = 160;
    public static final int MODE_VIDEO_HFR = 170;
    static int[] sModeList = new int[]{161, 172, 162, 163, 174, 173, 165, 166, 166, 167, 168, 170, 169, 171};

    @Retention(RetentionPolicy.SOURCE)
    public @interface ConstantMode {
    }

    public static int[] getAllModes() {
        return sModeList;
    }
}
