package com.android.camera.constant;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

public class CaptureHelper {
    public static final int APPLY_BURST = 4;
    public static final int APPLY_CAPTURE = 3;
    public static final int APPLY_PREVIEW = 1;
    public static final int APPLY_PRE_CAPTURE = 6;
    public static final int STATE_FOCUSING = 2;
    public static final int STATE_PICTURE_TAKEN = 6;
    public static final int STATE_PREVIEWING = 1;
    public static final int STATE_WAITING_AE_LOCK = 4;
    public static final int STATE_WAITING_AF_LOCK = 3;
    public static final int STATE_WAITING_FLASH_CLOSE = 7;
    public static final int STATE_WAITING_FLASH_FIRED = 8;
    public static final int STATE_WAITING_PRECAPTURE = 5;
    public static final int STATE_WAITING_PREVIEW = 0;

    @Retention(RetentionPolicy.SOURCE)
    public @interface ApplyType {
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface PictureState {
    }
}
