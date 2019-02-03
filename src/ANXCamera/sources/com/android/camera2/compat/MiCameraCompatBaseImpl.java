package com.android.camera2.compat;

import android.annotation.TargetApi;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.CaptureRequest.Builder;
import android.hardware.camera2.CaptureRequest.Key;
import com.android.camera.fragment.beauty.BeautyParameters;
import com.android.camera.fragment.beauty.BeautyParameters.Type;
import com.android.camera.fragment.beauty.BeautyValues;
import com.android.camera2.autozoom.AutoZoomTags.TAG;
import com.mi.config.b;
import java.util.HashMap;
import java.util.HashSet;

@TargetApi(21)
public class MiCameraCompatBaseImpl {
    public static final Key<Integer> BEAUTY_BLUSHER = new Key("xiaomi.beauty.blushRatio", Integer.class);
    private static final Key<Integer> BEAUTY_BODY_SLIM = new Key("xiaomi.beauty.bodySlimRatio", Integer.class);
    public static final Key<Integer> BEAUTY_CHIN = new Key("xiaomi.beauty.chinRatio", Integer.class);
    public static final Key<Integer> BEAUTY_ENLARGE_EYE = new Key("xiaomi.beauty.enlargeEyeRatio", Integer.class);
    public static final Key<Integer> BEAUTY_EYEBROW_DYE = new Key("xiaomi.beauty.eyeBrowDyeRatio", Integer.class);
    private static final Key<Integer> BEAUTY_HEAD_SLIM = new Key("xiaomi.beauty.headSlimRatio", Integer.class);
    public static final Key<Integer> BEAUTY_JELLY_LIPS = new Key("xiaomi.beauty.lipGlossRatio", Integer.class);
    private static final Key<Integer> BEAUTY_LEG_SLIM = new Key("xiaomi.beauty.legSlimRatio", Integer.class);
    public static final Key<String> BEAUTY_LEVEL = new Key("xiaomi.beauty.beautyLevelApplied", String.class);
    public static final Key<Integer> BEAUTY_LIPS = new Key("xiaomi.beauty.lipsRatio", Integer.class);
    public static final Key<Integer> BEAUTY_NECK = new Key("xiaomi.beauty.neckRatio", Integer.class);
    public static final Key<Integer> BEAUTY_NOSE = new Key("xiaomi.beauty.noseRatio", Integer.class);
    public static final Key<Integer> BEAUTY_PUPIL_LINE = new Key("xiaomi.beauty.pupilLineRatio", Integer.class);
    public static final Key<Integer> BEAUTY_RISORIUS = new Key("xiaomi.beauty.risoriusRatio", Integer.class);
    private static final Key<Integer> BEAUTY_SHOULDER_SLIM = new Key("xiaomi.beauty.shoulderSlimRatio", Integer.class);
    public static final Key<Integer> BEAUTY_SKIN_COLOR = new Key("xiaomi.beauty.skinColorRatio", Integer.class);
    public static final Key<Integer> BEAUTY_SKIN_SMOOTH = new Key("xiaomi.beauty.skinSmoothRatio", Integer.class);
    public static final Key<Integer> BEAUTY_SLIM_FACE = new Key("xiaomi.beauty.slimFaceRatio", Integer.class);
    public static final Key<Integer> BEAUTY_SLIM_NOSE = new Key("xiaomi.beauty.slimNoseRatio", Integer.class);
    public static final Key<Integer> BEAUTY_SMILE = new Key("xiaomi.beauty.smileRatio", Integer.class);
    private static final HashMap<Type, Key<Integer>> BEAUTY_TYPE_MAP = new HashMap();
    public static final Key<String> BOKEH_F_NUMBER = new Key("xiaomi.bokeh.fNumberApplied", String.class);
    public static final Key<Integer> BURST_CAPTURE_HINT = new Key("xiaomi.burst.captureHint", Integer.class);
    public static final Key<Integer> BURST_SHOOT_FPS = new Key("xiaomi.burst.shootFPS", Integer.class);
    public static final Key<Byte> CAMERA_AI_30 = new Key("xiaomi.ai.segment.enabled", Byte.class);
    public static final Key<Byte> DEPURPLE_TAG = new Key("xiaomi.depurple.enabled", Byte.class);
    public static final Key<Integer> DEVICE_ORIENTATION = new Key("xiaomi.device.orientation", Integer.class);
    private static final Key<Integer> EYE_LIGHT_STRENGTH = new Key("xiaomi.beauty.eyeLightStrength", Integer.class);
    private static final Key<Integer> EYE_LIGHT_TYPE = new Key("xiaomi.beauty.eyeLightType", Integer.class);
    public static final Key<Boolean> FACE_AGE_ANALYZE_ENABLED = new Key("xiaomi.faceGenderAndAge.enabled", Boolean.class);
    public static final Key<Boolean> FACE_SCORE_ENABLED = new Key("xiaomi.faceScore.enabled", Boolean.class);
    public static final Key<Boolean> FRONT_MIRROR = new Key("xiaomi.flip.enabled", Boolean.class);
    public static final Key<Boolean> HDR_CHECKER_ENABLE = new Key("xiaomi.hdr.hdrChecker.enabled", Boolean.class);
    public static final Key<Boolean> HDR_ENABLED = new Key("xiaomi.hdr.enabled", Boolean.class);
    public static final Key<Boolean> HHT_ENABLED = new Key("xiaomi.hht.enabled", Boolean.class);
    public static final Key<Boolean> LENS_DIRTY_DETECT = new Key("xiaomi.ai.add.enabled", Boolean.class);
    public static final Key<Boolean> MFNR_BOKEH = new Key("xiaomi.bokeh.enabled", Boolean.class);
    public static final Key<Boolean> MFNR_ENABLED = new Key("xiaomi.mfnr.enabled", Boolean.class);
    public static final Key<Byte> NORMAL_WIDE_LENS_DISTORTION_CORRECTION_LEVEL = new Key("xiaomi.distortion.distortionLevelApplied", Byte.class);
    public static final Key<Boolean> PARALLEL_ENABLED = new Key("xiaomi.parallel.enabled", Boolean.class);
    public static final Key<byte[]> PARALLEL_PATH = new Key("xiaomi.parallel.path", byte[].class);
    public static final Key<Integer> PORTRAIT_LIGHTING = new Key("xiaomi.portrait.lighting", Integer.class);
    public static final Key<Boolean> SNAP_SHOT_TORCH = new Key("xiaomi.snapshotTorch.enabled", Boolean.class);
    public static final Key<Boolean> ST_FAST_ZOOM_IN = new Key("xiaomi.smoothTransition.fastZoomIn", Boolean.class);
    public static final Key<Boolean> SUPER_NIGHT_SCENE_ENABLED = new Key("xiaomi.supernight.enabled", Boolean.class);
    public static final Key<Boolean> SUPER_RESOLUTION_ENABLED = new Key("xiaomi.superResolution.enabled", Boolean.class);
    public static final Key<Boolean> SW_MFNR_ENABLED = new Key("xiaomi.swmf.enabled", Boolean.class);
    public static final Key<Byte> ULTRA_WIDE_LENS_DISTORTION_CORRECTION_LEVEL = new Key("xiaomi.distortion.ultraWideDistortionLevel", Byte.class);
    public static final Key<String> WATERMARK_APPLIEDTYPE = new Key("xiaomi.watermark.typeApplied", String.class);
    public static final Key<String> WATERMARK_AVAILABLETYPE = new Key("xiaomi.watermark.availableType", String.class);
    public static final Key<String> WATERMARK_FACE = new Key("xiaomi.watermark.face", String.class);
    public static final Key<String> WATERMARK_TIME = new Key("xiaomi.watermark.time", String.class);
    public static final Key<Byte> XIAOMI_BACKWARD_CAPTURE_HINT = new Key("xiaomi.snapshot.backwardfetchframe.enabled", Byte.class);

    static {
        BEAUTY_TYPE_MAP.put(Type.WHITEN_STRENGTH, BEAUTY_SKIN_COLOR);
        BEAUTY_TYPE_MAP.put(Type.SHRINK_FACE_RATIO, BEAUTY_SLIM_FACE);
        BEAUTY_TYPE_MAP.put(Type.ENLARGE_EYE_RATIO, BEAUTY_ENLARGE_EYE);
        BEAUTY_TYPE_MAP.put(Type.SMOOTH_STRENGTH, BEAUTY_SKIN_SMOOTH);
        BEAUTY_TYPE_MAP.put(Type.NOSE_RATIO, BEAUTY_NOSE);
        BEAUTY_TYPE_MAP.put(Type.RISORIUS_RATIO, BEAUTY_RISORIUS);
        BEAUTY_TYPE_MAP.put(Type.LIPS_RATIO, BEAUTY_LIPS);
        BEAUTY_TYPE_MAP.put(Type.CHIN_RATIO, BEAUTY_CHIN);
        BEAUTY_TYPE_MAP.put(Type.NECK_RATIO, BEAUTY_NECK);
        BEAUTY_TYPE_MAP.put(Type.SMILE_RATIO, BEAUTY_SMILE);
        BEAUTY_TYPE_MAP.put(Type.SLIM_NOSE_RATIO, BEAUTY_SLIM_NOSE);
        BEAUTY_TYPE_MAP.put(Type.EYEBROW_DYE_RATIO, BEAUTY_EYEBROW_DYE);
        BEAUTY_TYPE_MAP.put(Type.PUPIL_LINE_RATIO, BEAUTY_PUPIL_LINE);
        BEAUTY_TYPE_MAP.put(Type.JELLY_LIPS_RATIO, BEAUTY_JELLY_LIPS);
        BEAUTY_TYPE_MAP.put(Type.BLUSHER_RATIO, BEAUTY_BLUSHER);
        BEAUTY_TYPE_MAP.put(Type.HEAD_SLIM_RATIO, BEAUTY_HEAD_SLIM);
        BEAUTY_TYPE_MAP.put(Type.BODY_SLIM_RATIO, BEAUTY_BODY_SLIM);
        BEAUTY_TYPE_MAP.put(Type.SHOULDER_SLIM_RATIO, BEAUTY_SHOULDER_SLIM);
        BEAUTY_TYPE_MAP.put(Type.LEG_SLIM_RATIO, BEAUTY_LEG_SLIM);
    }

    public void applyISO(Builder builder, int i) {
        builder.set(CaptureRequest.SENSOR_SENSITIVITY, Integer.valueOf(i));
    }

    public void applyExposureTime(Builder builder, long j) {
        if (j > 0) {
            builder.set(CaptureRequest.CONTROL_MODE, Integer.valueOf(0));
            builder.set(CaptureRequest.SENSOR_EXPOSURE_TIME, Long.valueOf(j));
            return;
        }
        builder.set(CaptureRequest.CONTROL_MODE, (Integer) builder.get(CaptureRequest.CONTROL_MODE));
    }

    public void applyCustomWB(Builder builder, int i) {
        throw new RuntimeException("unSupported CustomWb");
    }

    public void applyContrast(Builder builder, int i) {
        throw new RuntimeException("unSupported Contrast");
    }

    public void applySaturation(Builder builder, int i) {
        throw new RuntimeException("unSupported Saturation");
    }

    public void applySharpness(Builder builder, int i) {
        throw new RuntimeException("unSupported Sharpness");
    }

    public void applyExposureMeteringMode(Builder builder, int i) {
        throw new RuntimeException("unSupported ExposureMeteringMode");
    }

    public void applyVideoStreamState(Builder builder, boolean z) {
    }

    public void applyCameraAi30Enable(Builder builder, boolean z) {
        throw new RuntimeException("unSupported action");
    }

    public void applyNormalWideLDC(Builder builder, boolean z) {
        throw new RuntimeException("unSupported action");
    }

    public void applyUltraWideLDC(Builder builder, boolean z) {
        throw new RuntimeException("unSupported action");
    }

    public void applyDepurpleEnable(Builder builder, boolean z) {
        throw new RuntimeException("unSupported action");
    }

    public void applyASDEnable(Builder builder, boolean z) {
        throw new RuntimeException("unSupported action");
    }

    public void applyASDScene(Builder builder, int i) {
        throw new RuntimeException("unSupported action");
    }

    public void applyAiScenePeriod(Builder builder, int i) {
        throw new RuntimeException("unSupported action");
    }

    public void applyHHT(Builder builder, boolean z) {
        builder.set(HHT_ENABLED, Boolean.valueOf(z));
    }

    public void applyHDR(Builder builder, boolean z) {
        builder.set(HDR_ENABLED, Boolean.valueOf(z));
    }

    public void applyHDRCheckerEnable(Builder builder, boolean z) {
        builder.set(HDR_CHECKER_ENABLE, Boolean.valueOf(z));
    }

    public void applyParallelProcessPath(Builder builder, String str) {
        builder.set(PARALLEL_PATH, str.getBytes());
    }

    public void applyParallelProcessEnable(Builder builder, boolean z) {
        builder.set(PARALLEL_ENABLED, Boolean.valueOf(z));
    }

    public void applySuperResolution(Builder builder, boolean z) {
        builder.set(SUPER_RESOLUTION_ENABLED, Boolean.valueOf(z));
    }

    public void applyWaterMarkAppliedList(Builder builder, String str) {
        builder.set(WATERMARK_APPLIEDTYPE, str);
    }

    public void applyTimeWaterMark(Builder builder, String str) {
        builder.set(WATERMARK_TIME, str);
    }

    public void applyFaceWaterMark(Builder builder, String str) {
        builder.set(WATERMARK_FACE, str);
    }

    public void applyMfnr(Builder builder, boolean z) {
        builder.set(MFNR_ENABLED, Boolean.valueOf(z));
    }

    public void applySwMfnr(Builder builder, boolean z) {
        builder.set(SW_MFNR_ENABLED, Boolean.valueOf(z));
    }

    public void applyBokeh(Builder builder, boolean z) {
        builder.set(MFNR_BOKEH, Boolean.valueOf(z));
    }

    public void applyStFastZoomIn(Builder builder, boolean z) {
        builder.set(ST_FAST_ZOOM_IN, Boolean.valueOf(z));
    }

    public void applyFaceAnalyzeAge(Builder builder, boolean z) {
        builder.set(FACE_AGE_ANALYZE_ENABLED, Boolean.valueOf(z));
    }

    public void applyFaceScore(Builder builder, boolean z) {
        builder.set(FACE_SCORE_ENABLED, Boolean.valueOf(z));
    }

    public void applyDeviceOrientation(Builder builder, int i) {
        builder.set(DEVICE_ORIENTATION, Integer.valueOf(i));
    }

    public void applyBeautyParameter(Builder builder, BeautyValues beautyValues) {
        builder.set(BEAUTY_LEVEL, beautyValues.mBeautyLevel);
        if (b.hR()) {
            for (Type type : BeautyParameters.getInstance().getAdjustableTypes()) {
                if (BEAUTY_TYPE_MAP.containsKey(type)) {
                    builder.set((Key) BEAUTY_TYPE_MAP.get(type), Integer.valueOf(beautyValues.get(type)));
                }
            }
            return;
        }
        builder.set(BEAUTY_SKIN_COLOR, Integer.valueOf(beautyValues.mBeautySkinColor));
        builder.set(BEAUTY_SLIM_FACE, Integer.valueOf(beautyValues.mBeautySlimFace));
        builder.set(BEAUTY_SKIN_SMOOTH, Integer.valueOf(beautyValues.mBeautySkinSmooth));
        builder.set(BEAUTY_ENLARGE_EYE, Integer.valueOf(beautyValues.mBeautyEnlargeEye));
    }

    public void applyAutoZoomMode(Builder builder, int i) {
        builder.set(TAG.MODE.toCaptureRequestKey(), Integer.valueOf(i));
    }

    public void applyAutoZoomScaleOffset(Builder builder, float f) {
        builder.set(TAG.SCALE_OFFSET.toCaptureRequestKey(), Float.valueOf(f));
    }

    public void applySnapshotTorch(Builder builder, boolean z) {
        builder.set(SNAP_SHOT_TORCH, Boolean.valueOf(z));
    }

    public void applyWaterMarkType(Builder builder, String str) {
        builder.set(WATERMARK_APPLIEDTYPE, str);
    }

    public void applyFrontMirror(Builder builder, boolean z) {
        builder.set(FRONT_MIRROR, Boolean.valueOf(z));
    }

    public void applyBurstHint(Builder builder, int i) {
        builder.set(BURST_CAPTURE_HINT, Integer.valueOf(i));
    }

    public void applyBurstFps(Builder builder, int i) {
        builder.set(BURST_SHOOT_FPS, Integer.valueOf(i));
    }

    public void applyIsHfrPreview(Builder builder, boolean z) {
    }

    public void applyLensDirtyDetect(Builder builder, boolean z) {
        builder.set(LENS_DIRTY_DETECT, Boolean.valueOf(z));
    }

    public void applyPortraitLighting(Builder builder, int i) {
        builder.set(PORTRAIT_LIGHTING, Integer.valueOf(i));
    }

    public void applyEyeLight(Builder builder, int i, int i2) {
        builder.set(EYE_LIGHT_TYPE, Integer.valueOf(i));
        builder.set(EYE_LIGHT_STRENGTH, Integer.valueOf(i2));
    }

    public void applySuperNightScene(Builder builder, boolean z) {
        builder.set(SUPER_NIGHT_SCENE_ENABLED, Boolean.valueOf(z));
    }

    public void applyHdrBracketMode(Builder builder, byte b) {
        throw new RuntimeException("unSupported action");
    }

    public void applyMultiFrameInputNum(Builder builder, int i) {
        throw new RuntimeException("unSupported action");
    }

    public void applyFNumber(Builder builder, String str) {
        builder.set(BOKEH_F_NUMBER, str);
    }

    public boolean supportContrast(HashSet<String> hashSet) {
        return false;
    }

    public boolean supportLensDirtyDetect(HashSet<String> hashSet) {
        return hashSet.contains(LENS_DIRTY_DETECT.getName());
    }

    public boolean supportBeautyType(HashSet<String> hashSet, Type type) {
        if (BEAUTY_TYPE_MAP.containsKey(type)) {
            return hashSet.contains(((Key) BEAUTY_TYPE_MAP.get(type)).getName());
        }
        return false;
    }

    public boolean supportExtraHighSpeedVideoConfiguration(HashSet<String> hashSet) {
        return false;
    }

    public boolean supportEyeLight(HashSet<String> hashSet) {
        return hashSet.contains(EYE_LIGHT_TYPE.getName());
    }

    public void applyBackwardCaptureHint(Builder builder, byte b) {
        builder.set(XIAOMI_BACKWARD_CAPTURE_HINT, Byte.valueOf(b));
    }
}
