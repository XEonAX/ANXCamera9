package com.android.camera2.compat;

import android.annotation.TargetApi;
import android.hardware.camera2.CaptureRequest.Builder;
import android.hardware.camera2.CaptureRequest.Key;
import com.android.camera.constant.MiCameraCharacteristics;
import com.android.camera.log.Log;
import com.android.camera2.CaptureResultParser;
import com.bytedance.frameworks.core.monitor.MonitorCommonConstants;
import java.util.HashSet;

@TargetApi(21)
class MiCameraCompatQcomImpl extends MiCameraCompatBaseImpl {
    private static final Key<Boolean> AI_SCENE = new Key(CaptureResultParser.VENDER_TAG_ASD_ENABLE, Boolean.class);
    private static final Key<Integer> AI_SCENE_APPLY = new Key("xiaomi.ai.asd.sceneApplied", Integer.class);
    private static final Key<int[]> AI_SCENE_AVAILABLE_MODES = new Key("xiaomi.ai.asd.availableSceneMode", int[].class);
    private static final Key<Integer> AI_SCENE_PERIOD = new Key("xiaomi.ai.asd.period", Integer.class);
    private static final Key<Integer> CONTRAST_LEVEL = new Key("org.codeaurora.qcamera3.contrast.level", Integer.class);
    private static final Key<Integer> EXPOSURE_METERING = new Key("org.codeaurora.qcamera3.exposure_metering.exposure_metering_mode", Integer.class);
    private static final int EXP_TIME_PRIORITY = 1;
    private static final Key<Long> ISO_EXP = new Key("org.codeaurora.qcamera3.iso_exp_priority.use_iso_exp_priority", Long.class);
    private static final int ISO_PRIORITY = 0;
    private static final Key<Byte> IS_HFR_PREVIEW = new Key("xiaomi.hfrPreview.isHFRPreview", Byte.TYPE);
    private static final Key<Byte> KEY_HDR_BRACKET_MODE = new Key("org.codeaurora.qcamera3.ae_bracket.mode", Byte.TYPE);
    private static final Key<Integer> KEY_MULTIFRAME_INPUTNUM = new Key(CaptureResultParser.VENDER_TAG_MULTIFRAME_INPUTNUM, Integer.TYPE);
    private static final Key<Byte> RECORDING_END_STREAM = new Key("org.quic.camera.recording.endOfStream", Byte.TYPE);
    private static final Key<Integer> SATURATION = new Key("org.codeaurora.qcamera3.saturation.use_saturation", Integer.class);
    private static final Key<Integer> SELECT_PRIORITY = new Key("org.codeaurora.qcamera3.iso_exp_priority.select_priority", Integer.class);
    private static final Key<Integer> SHARPNESS_CONTROL = new Key("org.codeaurora.qcamera3.sharpness.strength", Integer.class);
    private static final Key<Integer> USE_CUSTOM_WB = new Key("com.qti.stats.awbwrapper.AWBCCT", Integer.class);
    private static final Key<Integer> USE_ISO_VALUE = new Key("org.codeaurora.qcamera3.iso_exp_priority.use_iso_value", Integer.class);

    MiCameraCompatQcomImpl() {
    }

    public void applyISO(Builder builder, int i) {
        builder.set(SELECT_PRIORITY, Integer.valueOf(0));
        if (i == 0) {
            builder.set(ISO_EXP, Long.valueOf(0));
        } else if (i == 100) {
            builder.set(ISO_EXP, Long.valueOf(2));
        } else if (i == 200) {
            builder.set(ISO_EXP, Long.valueOf(3));
        } else if (i == MonitorCommonConstants.MAX_COUNT_UPLOAD_SINGLE_TIME) {
            builder.set(ISO_EXP, Long.valueOf(4));
        } else if (i == 800) {
            builder.set(ISO_EXP, Long.valueOf(5));
        } else if (i == 1600) {
            builder.set(ISO_EXP, Long.valueOf(6));
        } else if (i != 3200) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("applyISO(): set manual absolute iso value to ");
            stringBuilder.append(i);
            Log.d("MiCamera2", stringBuilder.toString());
            builder.set(ISO_EXP, Long.valueOf(8));
            builder.set(USE_ISO_VALUE, Integer.valueOf(i));
        } else {
            builder.set(ISO_EXP, Long.valueOf(7));
        }
    }

    public void applyExposureTime(Builder builder, long j) {
        if (0 == ((Long) builder.get(ISO_EXP)).longValue() && j > 0) {
            builder.set(SELECT_PRIORITY, Integer.valueOf(1));
        }
        super.applyExposureTime(builder, j);
    }

    public void applyCustomWB(Builder builder, int i) {
        builder.set(USE_CUSTOM_WB, Integer.valueOf(i));
    }

    public void applyContrast(Builder builder, int i) {
        builder.set(CONTRAST_LEVEL, Integer.valueOf(i + 1));
    }

    public void applySaturation(Builder builder, int i) {
        int i2 = 0;
        switch (i) {
            case 1:
                i2 = 2;
                break;
            case 2:
                i2 = 4;
                break;
            case 3:
                i2 = 5;
                break;
            case 4:
                i2 = 6;
                break;
            case 5:
                i2 = 8;
                break;
            case 6:
                i2 = 10;
                break;
        }
        builder.set(SATURATION, Integer.valueOf(i2));
    }

    public void applySharpness(Builder builder, int i) {
        int i2 = 0;
        switch (i) {
            case 1:
                i2 = 1;
                break;
            case 2:
                i2 = 2;
                break;
            case 3:
                i2 = 3;
                break;
            case 4:
                i2 = 4;
                break;
            case 5:
                i2 = 5;
                break;
            case 6:
                i2 = 6;
                break;
        }
        builder.set(SHARPNESS_CONTROL, Integer.valueOf(i2));
    }

    public void applyExposureMeteringMode(Builder builder, int i) {
        builder.set(EXPOSURE_METERING, Integer.valueOf(i));
    }

    public void applyVideoStreamState(Builder builder, boolean z) {
        String str = "MiCameraCompat";
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("recordingEndOfStream: ");
        stringBuilder.append(z ? "0x0" : "0x1");
        Log.d(str, stringBuilder.toString());
        builder.set(RECORDING_END_STREAM, Byte.valueOf(z ^ 1));
    }

    public void applyCameraAi30Enable(Builder builder, boolean z) {
        builder.set(CAMERA_AI_30, Byte.valueOf(z));
    }

    public void applyNormalWideLDC(Builder builder, boolean z) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("applyNormalWideLDC: ");
        stringBuilder.append(z);
        Log.d("MiCameraCompat", stringBuilder.toString());
        builder.set(NORMAL_WIDE_LENS_DISTORTION_CORRECTION_LEVEL, Byte.valueOf(z));
    }

    public void applyUltraWideLDC(Builder builder, boolean z) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("applyUltraWideLDC: ");
        stringBuilder.append(z);
        Log.d("MiCameraCompat", stringBuilder.toString());
        builder.set(ULTRA_WIDE_LENS_DISTORTION_CORRECTION_LEVEL, Byte.valueOf(z));
    }

    public void applyASDEnable(Builder builder, boolean z) {
        builder.set(AI_SCENE, Boolean.valueOf(z));
    }

    public void applyASDScene(Builder builder, int i) {
        builder.set(AI_SCENE_APPLY, Integer.valueOf(i));
    }

    public void applyAiScenePeriod(Builder builder, int i) {
        builder.set(AI_SCENE_PERIOD, Integer.valueOf(i));
    }

    public void applyIsHfrPreview(Builder builder, boolean z) {
        builder.set(IS_HFR_PREVIEW, Byte.valueOf(z));
    }

    public void applyHdrBracketMode(Builder builder, byte b) {
        builder.set(KEY_HDR_BRACKET_MODE, Byte.valueOf(b));
    }

    public void applyMultiFrameInputNum(Builder builder, int i) {
        builder.set(KEY_MULTIFRAME_INPUTNUM, Integer.valueOf(i));
    }

    public boolean supportContrast(HashSet<String> hashSet) {
        return hashSet.contains(CONTRAST_LEVEL.getName());
    }

    public boolean supportExtraHighSpeedVideoConfiguration(HashSet<String> hashSet) {
        return hashSet != null && hashSet.contains(MiCameraCharacteristics.EXTRA_HIGH_SPEED_VIDEO_CONFIGURATIONS.getName()) && hashSet.contains(MiCameraCharacteristics.EXTRA_HIGH_SPEED_VIDEO_NUMBER.getName());
    }

    public void applyDepurpleEnable(Builder builder, boolean z) {
        builder.set(DEPURPLE_TAG, Byte.valueOf(z));
    }
}
