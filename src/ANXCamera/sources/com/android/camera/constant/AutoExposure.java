package com.android.camera.constant;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

public class AutoExposure {
    public static final int FLASH_MODE_AUTO = 3;
    public static final int FLASH_MODE_OFF = 0;
    public static final int FLASH_MODE_ON = 1;
    public static final int FLASH_MODE_RED_EYE = 4;
    public static final int FLASH_MODE_SCREEN_LIGHT_AUTO = 103;
    public static final int FLASH_MODE_SCREEN_LIGHT_ON = 101;
    public static final int FLASH_MODE_TORCH = 2;
    public static final int METERING_MODE_CENTER_WEIGHTED = 1;
    public static final int METERING_MODE_FRAME_AVERAGE = 0;
    public static final int METERING_MODE_SPOT_METERING = 2;

    @Retention(RetentionPolicy.SOURCE)
    public @interface AntiBandingMode {
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface FlashMode {
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface MeteringMode {
    }
}
