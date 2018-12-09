package com.android.camera.constant;

import android.hardware.camera2.CameraCharacteristics.Key;
import android.hardware.camera2.params.StreamConfiguration;

public class MiCameraCharacteristics {
    public static final Key<Boolean> BEAUTY_MAKEUP = new Key("com.xiaomi.camera.supportedfeatures.beautyMakeup", Boolean.class);
    public static final Key<byte[]> CAM_CALIBRATION_DATA = new Key("com.xiaomi.camera.algoup.dualCalibrationData", byte[].class);
    public static final Key<int[]> CUSTOM_HFR_FPS_TABLE = new Key("org.quic.camera2.customhfrfps.info.CustomHFRFpsTable", int[].class);
    public static final Key<int[]> EXTRA_HIGH_SPEED_VIDEO_CONFIGURATIONS = new Key("org.codeaurora.qcamera3.additional_hfr_video_sizes.hfr_video_size", int[].class);
    public static final Key<Integer> EXTRA_HIGH_SPEED_VIDEO_NUMBER = new Key("org.codeaurora.qcamera3.additional_hfr_video_sizes.valid_number", Integer.class);
    public static Key<Byte> IS_QCFA_SENSOR = new Key("org.codeaurora.qcamera3.quadra_cfa.is_qcfa_sensor", Byte.class);
    public static final Key<StreamConfiguration[]> SCALER_AVAILABLE_LIMIT_STREAM_CONFIGURATIONS = new Key("xiaomi.scaler.availableLimitStreamConfigurations", StreamConfiguration[].class);
    public static final Key<StreamConfiguration[]> SCALER_AVAILABLE_STREAM_CONFIGURATIONS = new Key("xiaomi.scaler.availableStreamConfigurations", StreamConfiguration[].class);
    public static final Key<Boolean> VIDEO_BEAUTY = new Key("com.xiaomi.camera.supportedfeatures.videoBeauty", Boolean.class);
}
