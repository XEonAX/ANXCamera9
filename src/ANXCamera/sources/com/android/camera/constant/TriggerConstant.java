package com.android.camera.constant;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

public class TriggerConstant {
    public static final int MODE_AUDIO_CAPTURE = 70;
    public static final int MODE_EXPOSURE_VIEW = 90;
    public static final int MODE_FINGERPRINT = 30;
    public static final int MODE_FOCUS_SHOOT = 80;
    public static final int MODE_KEYCODE_CAMERA = 40;
    public static final int MODE_KEYCODE_DPAD = 50;
    public static final int MODE_OBJECT_TRACK = 60;
    public static final int MODE_SHUTTER_BUTTON = 10;
    public static final int MODE_VOLUME_KEY = 20;

    @Retention(RetentionPolicy.SOURCE)
    public @interface TriggerMode {
    }
}
