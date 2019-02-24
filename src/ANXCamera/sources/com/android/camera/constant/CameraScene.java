package com.android.camera.constant;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

public class CameraScene {
    public static final String AUTO = "0";
    public static final String BACKLIGHT = "backlight";
    public static final String BEACH = "8";
    public static final String FIREWORKS = "12";
    public static final String FLOWERS = "flowers";
    public static final String HDR = "18";
    public static final String LANDSCAPE = "4";
    public static final String NIGHT = "5";
    public static final String NIGHT_PORTRAIT = "6";
    public static final String PORTRAIT = "3";
    public static final String SNOW = "9";
    public static final String SPORTS = "13";
    public static final String SUNSET = "10";

    @Retention(RetentionPolicy.SOURCE)
    public @interface SceneMode {
    }
}
