package com.android.camera.constant;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

public class WhiteBalance {
    public static final String AUTO = "1";
    public static final String CLOUDY_DAYLIGHT = "6";
    public static final String DAYLIGHT = "5";
    public static final String FLUORESCENT = "3";
    public static final String INCANDESCENT = "2";
    public static final String MANUAL = "manual";

    @Retention(RetentionPolicy.SOURCE)
    public @interface AWBMode {
    }
}
