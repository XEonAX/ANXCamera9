package com.android.camera.constant;

import android.hardware.camera2.CaptureRequest.Key;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

public class MiCaptureRequest {
    public static final Key<Integer> VIDEO_RECORD_CONTROL = new Key("xiaomi.video.recordControl", Integer.class);
    public static final int VIDEO_RECORD_CONTROL_START = 1;
    public static final int VIDEO_RECORD_CONTROL_STOP = 2;

    @Retention(RetentionPolicy.SOURCE)
    public @interface VideoRecordControl {
    }
}
