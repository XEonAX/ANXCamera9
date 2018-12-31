package com.android.camera.constant;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

public class CameraStateConstant {
    public static final int FOCUSING = 2;
    public static final int IDLE = 1;
    public static final int PREVIEW_STOPPED = 0;
    public static final int SNAPSHOT_IN_PROGRESS = 3;
    public static final int SWITCHING_CAMERA = 4;

    @Retention(RetentionPolicy.SOURCE)
    public @interface CameraState {
    }
}
