package com.android.camera.constant;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

public class LightingConstant {
    public static final int FACE_LOCATION_OK = 6;
    public static final int FACE_NEEDED = 5;
    public static final int FACE_TOO_CLOSE = 3;
    public static final int FACE_TOO_FAR = 4;
    public static final String LIGHTING_DOT = "6";
    public static final String LIGHTING_HOLI = "8";
    public static final String LIGHTING_LEAF = "7";
    public static final String LIGHTING_MOVIE = "3";
    public static final String LIGHTING_NATURE = "1";
    public static final String LIGHTING_NONE = "0";
    public static final String LIGHTING_RAINBOW = "4";
    public static final String LIGHTING_SHUTTER = "5";
    public static final String LIGHTING_STATE = "2";
    public static final int NOT_ENABLE = -1;

    @Retention(RetentionPolicy.SOURCE)
    public @interface FaceResult {
    }
}
