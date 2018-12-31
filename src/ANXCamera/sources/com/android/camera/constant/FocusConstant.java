package com.android.camera.constant;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

public class FocusConstant {
    public static final int PENDING_FAIL_AFTER_FOCUSING = 4;
    public static final int PENDING_FAIL_AFTER_TOUCH_DOWN = 3;
    public static final int PENDING_NULL = -1;
    public static final int PENDING_SUCCESS_AFTER_FOCUSING = 2;
    public static final int PENDING_SUCCESS_AFTER_TOUCH_DOWN = 1;

    @Retention(RetentionPolicy.SOURCE)
    public @interface PendingState {
    }
}
