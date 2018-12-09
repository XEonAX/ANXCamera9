package com.android.camera.constant;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

public class AlertConstant {
    public static final int ALERT_CLEAR = 1;
    public static final int ALERT_IMAGE_TYPE_FLASH_ON = 1;
    public static final int ALERT_IMAGE_TYPE_FLASH_TORCH = 2;
    public static final int ALERT_IMAGE_TYPE_HDR_LIVE = 4;
    public static final int ALERT_IMAGE_TYPE_HDR_ON = 3;
    public static final int ALERT_IMAGE_TYPE_NULL = -1;
    public static final int ALERT_NOT_CLEAR = 2;
    public static final int RECORD_STATE_GONE = 2;
    public static final int RECORD_STATE_HIDE = 5;
    public static final int RECORD_STATE_PAUSE = 3;
    public static final int RECORD_STATE_RESUME = 4;
    public static final int RECORD_STATE_UNKNOWN = 0;
    public static final int RECORD_STATE_VISIBLE = 1;
    public static final int VALUE_CHANGE_ALL = 4;
    public static final int VALUE_CHANGE_EV = 1;
    public static final int VALUE_CHANGE_STEREO = 3;
    public static final int VALUE_CHANGE_ZOOM = 2;

    @Retention(RetentionPolicy.SOURCE)
    public @interface AlertCLearType {
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface AlertImageType {
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface RecordState {
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface ValueChangeType {
    }
}
