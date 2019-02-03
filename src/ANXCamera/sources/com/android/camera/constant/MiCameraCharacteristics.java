package com.android.camera.constant;

import android.graphics.Rect;
import android.hardware.camera2.CameraCharacteristics.Key;
import android.hardware.camera2.params.StreamConfiguration;

public class MiCameraCharacteristics {
    public static final Key<Boolean> BEAUTY_MAKEUP = new Key(KEY_FEATURE_BEAUTY_MAKEUP, Boolean.class);
    public static final Key<byte[]> CAM_CALIBRATION_DATA = new Key(KEY_ALGO_UP_CALIBRATION_DATA, byte[].class);
    public static final Key<int[]> CUSTOM_HFR_FPS_TABLE = new Key(KEY_HFR_FPS_TABLE, int[].class);
    public static final Key<Byte> EIS_PREVIEW_SUPPORTED = new Key(KEY_EIS_PREVIEW_SUPPORTED, Byte.class);
    public static final Key<int[]> EXTRA_HIGH_SPEED_VIDEO_CONFIGURATIONS = new Key(KEY_HFR_VIDE_SIZE, int[].class);
    public static final Key<Integer> EXTRA_HIGH_SPEED_VIDEO_NUMBER = new Key(KEY_HFR_VALID_NUM, Integer.class);
    public static Key<Byte> IS_QCFA_SENSOR = new Key(KEY_QCFA_SENSOR, Byte.class);
    private static final String KEY_ALGO_UP_CALIBRATION_DATA = "com.xiaomi.camera.algoup.dualCalibrationData";
    private static final String KEY_AVAILABLE_STREAM_CON = "xiaomi.scaler.availableStreamConfigurations";
    private static final String KEY_EIS_PREVIEW_SUPPORTED = "xiaomi.capabilities.videoStabilization.previewSupported";
    private static final String KEY_FEATURE_BEAUTY_MAKEUP = "com.xiaomi.camera.supportedfeatures.beautyMakeup";
    private static final String KEY_FEATURE_VIDEO_BEAUTY = "com.xiaomi.camera.supportedfeatures.videoBeauty";
    private static final String KEY_HFR_FPS_TABLE = "org.quic.camera2.customhfrfps.info.CustomHFRFpsTable";
    private static final String KEY_HFR_VALID_NUM = "org.codeaurora.qcamera3.additional_hfr_video_sizes.valid_number";
    private static final String KEY_HFR_VIDE_SIZE = "org.codeaurora.qcamera3.additional_hfr_video_sizes.hfr_video_size";
    private static final String KEY_LIMIT_STREAM_CON = "xiaomi.scaler.availableLimitStreamConfigurations";
    private static final String KEY_QCFA_ACTIVE_ARRAY_SIZE = "org.codeaurora.qcamera3.quadra_cfa.activeArraySize";
    private static final String KEY_QCFA_SENSOR = "org.codeaurora.qcamera3.quadra_cfa.is_qcfa_sensor";
    private static final String KEY_QCFA_STREAM_CONFIGURATIONS = "org.codeaurora.qcamera3.quadra_cfa.availableStreamConfigurations";
    private static final String KEY_XIAOMI_SCALER_AVAILABLE_SR_STREAM_CONFIGURATIONS = "xiaomi.scaler.availableSuperResolutionStreamConfigurations";
    public static final Key<Rect> QCFA_ACTIVE_ARRAY_SIZE = new Key(KEY_QCFA_ACTIVE_ARRAY_SIZE, Rect.class);
    public static final Key<StreamConfiguration[]> QCFA_STREAM_CONFIGURATIONS = new Key(KEY_QCFA_STREAM_CONFIGURATIONS, StreamConfiguration[].class);
    public static final Key<StreamConfiguration[]> SCALER_AVAILABLE_LIMIT_STREAM_CONFIGURATIONS = new Key(KEY_LIMIT_STREAM_CON, StreamConfiguration[].class);
    public static final Key<StreamConfiguration[]> SCALER_AVAILABLE_STREAM_CONFIGURATIONS = new Key(KEY_AVAILABLE_STREAM_CON, StreamConfiguration[].class);
    public static final Key<Boolean> VIDEO_BEAUTY = new Key(KEY_FEATURE_VIDEO_BEAUTY, Boolean.class);
    public static final Key<StreamConfiguration[]> XIAOMI_SCALER_AVAILABLE_SR_STREAM_CONFIGURATIONS = new Key(KEY_XIAOMI_SCALER_AVAILABLE_SR_STREAM_CONFIGURATIONS, StreamConfiguration[].class);
}
