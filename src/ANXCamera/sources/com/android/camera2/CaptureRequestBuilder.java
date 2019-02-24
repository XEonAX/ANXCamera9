package com.android.camera2;

import android.graphics.Rect;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.CaptureRequest.Builder;
import android.hardware.camera2.CaptureRequest.Key;
import android.util.Range;
import android.util.Rational;
import com.android.camera.Util;
import com.android.camera.data.DataRepository;
import com.android.camera.lib.compatibility.util.CompatibilityUtils;
import com.android.camera.log.Log;
import com.android.camera.module.ModuleManager;
import com.android.camera2.compat.MiCameraCompat;
import com.mi.config.b;

public class CaptureRequestBuilder {
    private static final long MAX_REALTIME_EXPOSURE_TIME = 125000000;
    private static final String TAG = CaptureRequestBuilder.class.getSimpleName();

    static void applyAELock(Builder builder, boolean z) {
        if (builder != null) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("applyAELock: ");
            stringBuilder.append(z);
            Log.d(str, stringBuilder.toString());
            builder.set(CaptureRequest.CONTROL_AE_LOCK, Boolean.valueOf(z));
        }
    }

    static void applyAWBLock(Builder builder, boolean z) {
        if (builder != null) {
            builder.set(CaptureRequest.CONTROL_AWB_LOCK, Boolean.valueOf(z));
        }
    }

    static void applyAWBMode(Builder builder, int i) {
        if (builder != null) {
            builder.set(CaptureRequest.CONTROL_AWB_MODE, Integer.valueOf(i));
        }
    }

    static void applyCustomAWB(Builder builder, int i) {
        MiCameraCompat.applyCustomAWB(builder, i);
    }

    static void applyAERegions(Builder builder, CameraConfigs cameraConfigs) {
        if (builder != null) {
            Object aERegions = cameraConfigs.getAERegions();
            if (aERegions != null) {
                builder.set(CaptureRequest.CONTROL_AE_REGIONS, aERegions);
            } else {
                builder.set(CaptureRequest.CONTROL_AE_REGIONS, MiCamera2.ZERO_WEIGHT_3A_REGION);
            }
        }
    }

    static void applyAFRegions(Builder builder, CameraConfigs cameraConfigs) {
        if (builder != null) {
            Object aFRegions = cameraConfigs.getAFRegions();
            if (aFRegions != null) {
                builder.set(CaptureRequest.CONTROL_AF_REGIONS, aFRegions);
            } else {
                builder.set(CaptureRequest.CONTROL_AF_REGIONS, MiCamera2.ZERO_WEIGHT_3A_REGION);
            }
        }
    }

    static void applyAntiBanding(Builder builder, CameraConfigs cameraConfigs) {
        if (builder != null) {
            builder.set(CaptureRequest.CONTROL_AE_ANTIBANDING_MODE, Integer.valueOf(cameraConfigs.getAntiBanding()));
        }
    }

    static void applyColorEffect(Builder builder, CameraConfigs cameraConfigs) {
        if (builder != null) {
            builder.set(CaptureRequest.CONTROL_EFFECT_MODE, Integer.valueOf(cameraConfigs.getColorEffect()));
        }
    }

    static void applyFaceDetection(Builder builder, CameraConfigs cameraConfigs) {
        if (builder != null) {
            int i;
            if (cameraConfigs.isFaceDetectionEnabled()) {
                i = 2;
            } else {
                i = 0;
            }
            builder.set(CaptureRequest.STATISTICS_FACE_DETECT_MODE, Integer.valueOf(i));
        }
    }

    static void applyFocusMode(Builder builder, CameraConfigs cameraConfigs) {
        if (builder != null) {
            builder.set(CaptureRequest.CONTROL_AF_MODE, Integer.valueOf(cameraConfigs.getFocusMode()));
            applyAFRegions(builder, cameraConfigs);
            applyAERegions(builder, cameraConfigs);
        }
    }

    static void applyFocusDistance(Builder builder, CameraConfigs cameraConfigs) {
        if (builder != null && cameraConfigs.getFocusMode() == 0) {
            builder.set(CaptureRequest.LENS_FOCUS_DISTANCE, Float.valueOf(cameraConfigs.getFocusDistance()));
        }
    }

    static void applyFpsRange(Builder builder, CameraConfigs cameraConfigs) {
        if (builder != null) {
            Range previewFpsRange = cameraConfigs.getPreviewFpsRange();
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("applyFpsRange: fpsRange = ");
            stringBuilder.append(previewFpsRange);
            Log.d(str, stringBuilder.toString());
            if (previewFpsRange != null) {
                builder.set(CaptureRequest.CONTROL_AE_TARGET_FPS_RANGE, previewFpsRange);
            }
        }
    }

    static void applyVideoFpsRange(Builder builder, CameraConfigs cameraConfigs) {
        if (builder != null) {
            Range videoFpsRange = cameraConfigs.getVideoFpsRange();
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("applyVideoFpsRange: fpsRange = ");
            stringBuilder.append(videoFpsRange);
            Log.d(str, stringBuilder.toString());
            if (videoFpsRange != null) {
                builder.set(CaptureRequest.CONTROL_AE_TARGET_FPS_RANGE, videoFpsRange);
            }
        }
    }

    static void applyExposureTime(Builder builder, int i, CameraConfigs cameraConfigs) {
        if (builder != null) {
            long exposureTime = cameraConfigs.getExposureTime();
            if (b.hU() && i == 1) {
                exposureTime = Math.min(exposureTime, MAX_REALTIME_EXPOSURE_TIME);
            }
            if (b.hU() || i == 3) {
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("applyExposureTime: ");
                stringBuilder.append(exposureTime);
                Log.d(str, stringBuilder.toString());
                MiCameraCompat.applyExposureTime(builder, exposureTime);
            }
        }
    }

    static void applyContrast(Builder builder, CameraCapabilities cameraCapabilities, CameraConfigs cameraConfigs) {
        if (builder != null && cameraCapabilities.isSupportContrast()) {
            MiCameraCompat.applyContrast(builder, cameraConfigs.getContrastLevel());
        }
    }

    static void applySaturation(Builder builder, CameraConfigs cameraConfigs) {
        if (builder != null) {
            MiCameraCompat.applySaturation(builder, cameraConfigs.getSaturationLevel());
        }
    }

    static void applySharpness(Builder builder, CameraConfigs cameraConfigs) {
        if (builder != null) {
            MiCameraCompat.applySharpness(builder, cameraConfigs.getSharpnessLevel());
        }
    }

    static void applyExposureMeteringMode(Builder builder, CameraConfigs cameraConfigs) {
        if (builder != null) {
            MiCameraCompat.applyExposureMeteringMode(builder, cameraConfigs.getExposureMeteringMode());
        }
    }

    static void applyCameraAi30Enable(Builder builder, CameraCapabilities cameraCapabilities, CameraConfigs cameraConfigs) {
        if (builder != null && cameraCapabilities.isSupportCameraAi30()) {
            MiCameraCompat.applyCameraAi30Enable(builder, cameraConfigs.isCameraAi30Enabled());
        }
    }

    static void applyDepurpleEnable(Builder builder, CameraCapabilities cameraCapabilities, boolean z) {
        if (builder != null) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("applyDepurpleEnable: isSupport = ");
            stringBuilder.append(cameraCapabilities.isSupportDepurple());
            stringBuilder.append(", enadled = ");
            stringBuilder.append(z);
            Log.d(str, stringBuilder.toString());
            if (cameraCapabilities.isSupportDepurple()) {
                MiCameraCompat.applyDepurpleEnable(builder, z);
            }
        }
    }

    static void applyAiSceneDetectEnable(Builder builder, CameraConfigs cameraConfigs) {
        if (builder != null) {
            MiCameraCompat.applyASDEnable(builder, cameraConfigs.isAiSceneDetectEnabled());
        }
    }

    static void applyAiSceneDetectPeriod(Builder builder, CameraConfigs cameraConfigs) {
        if (builder != null) {
            MiCameraCompat.applyAiScenePeriod(builder, cameraConfigs.getAiSceneDetectPeriod());
        }
    }

    static void applySceneMode(Builder builder, CameraConfigs cameraConfigs) {
        if (builder != null) {
            int sceneMode = cameraConfigs.getSceneMode();
            if (sceneMode != 0) {
                builder.set(CaptureRequest.CONTROL_SCENE_MODE, Integer.valueOf(sceneMode));
                builder.set(CaptureRequest.CONTROL_MODE, Integer.valueOf(2));
            } else {
                builder.set(CaptureRequest.CONTROL_MODE, Integer.valueOf(1));
            }
        }
    }

    static void applyZoomRatio(Builder builder, CameraCapabilities cameraCapabilities, CameraConfigs cameraConfigs) {
        if (builder != null) {
            float zoomRatio = cameraConfigs.getZoomRatio();
            Rect activeArraySize = cameraCapabilities.getActiveArraySize();
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("applyZoomRatio: ActiveArraySize=");
            stringBuilder.append(activeArraySize);
            Log.v(str, stringBuilder.toString());
            Rect rect = new Rect();
            int width = activeArraySize.width() / 2;
            int height = activeArraySize.height() / 2;
            float f = 2.0f * zoomRatio;
            int width2 = (int) (((float) activeArraySize.width()) / f);
            int height2 = (int) (((float) activeArraySize.height()) / f);
            rect.set(width - width2, height - height2, width + width2, height + height2);
            String str2 = TAG;
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("applyZoomRatio: cropRegion=");
            stringBuilder2.append(rect);
            Log.v(str2, stringBuilder2.toString());
            builder.set(CaptureRequest.SCALER_CROP_REGION, rect);
        }
    }

    static void applyZsl(Builder builder, CameraConfigs cameraConfigs) {
        if (builder != null) {
            CompatibilityUtils.setZsl(builder, cameraConfigs.isZslEnabled());
        }
    }

    static void applyAntiShake(Builder builder, CameraCapabilities cameraCapabilities, CameraConfigs cameraConfigs) {
        if (builder != null) {
            boolean isEISEnabled = cameraConfigs.isEISEnabled();
            boolean isOISEnabled = cameraConfigs.isOISEnabled();
            if (isEISEnabled && isOISEnabled && Util.isDebugOsBuild()) {
                throw new RuntimeException("EIS&OIS are both on");
            }
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("EIS: ");
            stringBuilder.append(isEISEnabled ? "on" : "off");
            Log.v(str, stringBuilder.toString());
            int i = 0;
            builder.set(CaptureRequest.CONTROL_VIDEO_STABILIZATION_MODE, Integer.valueOf(isEISEnabled ? 1 : 0));
            if (cameraCapabilities.isSupportOIS()) {
                String str2 = TAG;
                StringBuilder stringBuilder2 = new StringBuilder();
                stringBuilder2.append("OIS: ");
                String str3 = (isEISEnabled || !isOISEnabled) ? "off" : "on";
                stringBuilder2.append(str3);
                Log.v(str2, stringBuilder2.toString());
                Key key = CaptureRequest.LENS_OPTICAL_STABILIZATION_MODE;
                if (!isEISEnabled && isOISEnabled) {
                    i = 1;
                }
                builder.set(key, Integer.valueOf(i));
            }
        }
    }

    static void applyHHT(Builder builder, int i, CameraCapabilities cameraCapabilities, CameraConfigs cameraConfigs) {
        if (builder != null && i == 3 && cameraCapabilities.isSupportHHT()) {
            MiCameraCompat.applyHHT(builder, cameraConfigs.isHHTEnabled());
        }
    }

    static void applyHDR(Builder builder, int i, CameraCapabilities cameraCapabilities, CameraConfigs cameraConfigs) {
        if (builder == null || !cameraCapabilities.isSupportHdr()) {
            return;
        }
        if (i != 3) {
            MiCameraCompat.applyHDR(builder, false);
        } else {
            MiCameraCompat.applyHDR(builder, cameraConfigs.isHDREnabled());
        }
    }

    static void applyHDRCheckerEnable(Builder builder, int i, CameraCapabilities cameraCapabilities, CameraConfigs cameraConfigs) {
        if (builder != null && i == 1 && cameraCapabilities.isSupportAutoHdr()) {
            MiCameraCompat.applyHDRCheckerEnable(builder, cameraConfigs.isHDRCheckerEnabled());
        }
    }

    static void applyHwMfnr(Builder builder, int i, CameraCapabilities cameraCapabilities, CameraConfigs cameraConfigs) {
        if (builder == null || !cameraCapabilities.isSupportMfnr()) {
            return;
        }
        if (i != 3) {
            MiCameraCompat.applyMfnrEnable(builder, false);
            return;
        }
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("applyMfnrEnable: ");
        stringBuilder.append(cameraConfigs.isMfnrEnabled());
        Log.d(str, stringBuilder.toString());
        MiCameraCompat.applyMfnrEnable(builder, cameraConfigs.isMfnrEnabled());
    }

    static void applySwMfnr(Builder builder, int i, CameraCapabilities cameraCapabilities, CameraConfigs cameraConfigs) {
        if (builder == null || !cameraCapabilities.isSupportSwMfnr()) {
            return;
        }
        if (i != 3) {
            MiCameraCompat.applySwMfnrEnable(builder, false);
            return;
        }
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("applySwMfnrEnable: ");
        stringBuilder.append(cameraConfigs.isSwMfnrEnabled());
        Log.d(str, stringBuilder.toString());
        MiCameraCompat.applySwMfnrEnable(builder, cameraConfigs.isSwMfnrEnabled());
    }

    static void applyBokeh(Builder builder, CameraCapabilities cameraCapabilities, CameraConfigs cameraConfigs) {
        if (builder != null && cameraCapabilities.isSupportBokeh()) {
            MiCameraCompat.applyBokehEnable(builder, cameraConfigs.isBokehEnabled());
        }
    }

    static void applyLensDirtyDetect(Builder builder, CameraCapabilities cameraCapabilities, CameraConfigs cameraConfigs) {
        if (builder != null && cameraCapabilities.isSupportLensDirtyDetect()) {
            MiCameraCompat.applyLensDirtyDetect(builder, cameraConfigs.isLensDirtyDetectEnabled());
        }
    }

    static void applyPortraitLighting(Builder builder, int i, CameraCapabilities cameraCapabilities, CameraConfigs cameraConfigs) {
        if (builder != null && i == 3 && cameraCapabilities.isSupportPortraitLighting()) {
            MiCameraCompat.applyPortraitLighting(builder, cameraConfigs.getPortraitLightingPattern());
        }
    }

    static void applyFaceAgeAnalyze(Builder builder, CameraCapabilities cameraCapabilities, CameraConfigs cameraConfigs) {
        if (builder != null && cameraCapabilities.isSupportFaceAgeAnalyze()) {
            MiCameraCompat.applyFaceAgeAnalyzeEnable(builder, cameraConfigs.isFaceAgeAnalyzeEnabled());
        }
    }

    static void applyFaceScore(Builder builder, CameraCapabilities cameraCapabilities, CameraConfigs cameraConfigs) {
        if (builder != null && cameraCapabilities.isSupportFaceScore()) {
            MiCameraCompat.applyFaceScoreEnable(builder, cameraConfigs.isFaceScoreEnabled());
        }
    }

    static void applySuperResolution(Builder builder, int i, CameraCapabilities cameraCapabilities, CameraConfigs cameraConfigs) {
        if (builder != null && cameraCapabilities.isSupportSuperResolution()) {
            if (i != 3) {
                MiCameraCompat.applySuperResolution(builder, false);
                return;
            }
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("applySuperResolution: ");
            stringBuilder.append(cameraConfigs.isSuperResolutionEnabled());
            Log.d(str, stringBuilder.toString());
            MiCameraCompat.applySuperResolution(builder, cameraConfigs.isSuperResolutionEnabled());
        }
    }

    static void applyWaterMark(Builder builder, int i, CameraCapabilities cameraCapabilities, CameraConfigs cameraConfigs) {
        if (builder != null && i == 3 && cameraCapabilities.isSupportWatermark()) {
            String join = Util.join(",", cameraConfigs.getWaterMarkAppliedList());
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("applyWaterMark appliedList:");
            stringBuilder.append(join);
            Log.d(str, stringBuilder.toString());
            MiCameraCompat.applyWaterMarkAppliedList(builder, join);
            if (join.contains("watermark")) {
                MiCameraCompat.applyTimeWaterMark(builder, cameraConfigs.getTimeWaterMarkValue());
            }
            if (join.contains("beautify")) {
                MiCameraCompat.applyFaceWaterMark(builder, cameraConfigs.getFaceWaterMarkFormat());
            }
        }
    }

    static void applyDeviceOrientation(Builder builder, CameraCapabilities cameraCapabilities, CameraConfigs cameraConfigs) {
        if (builder != null && cameraCapabilities.isSupportDeviceOrientation()) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("applyDeviceOrientation: ");
            stringBuilder.append(cameraConfigs.getDeviceOrientation());
            Log.d(str, stringBuilder.toString());
            MiCameraCompat.applyDeviceOrientation(builder, cameraConfigs.getDeviceOrientation());
        }
    }

    static void applyFrontMirror(Builder builder, int i, CameraCapabilities cameraCapabilities, CameraConfigs cameraConfigs) {
        if (builder != null && cameraCapabilities.isSupportFrontMirror() && i == 3) {
            MiCameraCompat.applyFrontMirror(builder, cameraConfigs.isFrontMirror());
        }
    }

    static void applyVideoFlash(Builder builder, CameraConfigs cameraConfigs) {
        if (builder != null) {
            int i;
            if (2 == cameraConfigs.getFlashMode()) {
                i = 1;
            } else {
                i = 0;
            }
            if (i != 0) {
                builder.set(CaptureRequest.FLASH_MODE, Integer.valueOf(2));
            } else {
                builder.set(CaptureRequest.FLASH_MODE, Integer.valueOf(0));
            }
        }
    }

    static void applyIso(Builder builder, int i, CameraCapabilities cameraCapabilities, CameraConfigs cameraConfigs) {
        if (builder != null) {
            int iso = cameraConfigs.getISO();
            if (b.hU() && i == 1 && iso > 0 && cameraConfigs.getExposureTime() > MAX_REALTIME_EXPOSURE_TIME) {
                iso = Math.min((int) (((float) iso) * ((float) (((double) cameraConfigs.getExposureTime()) / 1.25E8d))), cameraCapabilities.getMaxIso());
            }
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("applyIso: ");
            stringBuilder.append(iso);
            Log.d(str, stringBuilder.toString());
            MiCameraCompat.applyISO(builder, iso);
        }
    }

    static void applyBeautyValues(Builder builder, CameraCapabilities cameraCapabilities, CameraConfigs cameraConfigs) {
        if (builder == null || !cameraCapabilities.isSupportBeauty()) {
            return;
        }
        if (((!ModuleManager.isVideoModule() && !ModuleManager.isFunModule()) || cameraCapabilities.isSupportVideoBeauty()) && cameraConfigs.getBeautyValues() != null) {
            MiCameraCompat.applyBeautyParameter(builder, cameraConfigs.getBeautyValues());
        }
    }

    static void applyAutoZoomMode(Builder builder, CameraCapabilities cameraCapabilities, CameraConfigs cameraConfigs) {
        if (builder != null) {
            MiCameraCompat.applyAutoZoomMode(builder, cameraConfigs.getAutoZoomMode());
        }
    }

    static void applyAutoZoomScaleOffset(Builder builder, CameraCapabilities cameraCapabilities, CameraConfigs cameraConfigs) {
        if (builder != null) {
            MiCameraCompat.applyAutoZoomScaleOffset(builder, cameraConfigs.getAutoZoomScaleOffset());
        }
    }

    static void applyFNumber(Builder builder, CameraCapabilities cameraCapabilities, CameraConfigs cameraConfigs) {
        if (builder != null) {
            if (!cameraCapabilities.isSupportBokehAdjust()) {
                Log.d(TAG, "set f number on unsupported devices");
            } else if (cameraConfigs.getFNumber() != null) {
                MiCameraCompat.applyFNumber(builder, cameraConfigs.getFNumber());
            }
        }
    }

    static void applyEyeLight(Builder builder, CameraCapabilities cameraCapabilities, CameraConfigs cameraConfigs) {
        if (builder != null && cameraCapabilities.isSupportEyeLight() && DataRepository.dataItemFeature().ft()) {
            int eyeLightType = cameraConfigs.getEyeLightType();
            if (eyeLightType < 0) {
                MiCameraCompat.applyEyeLight(builder, 0, 0);
            } else {
                MiCameraCompat.applyEyeLight(builder, eyeLightType, 100);
            }
        }
    }

    static void applyNormalWideLDC(Builder builder, int i, CameraCapabilities cameraCapabilities, CameraConfigs cameraConfigs) {
        if (builder != null && cameraCapabilities.isSupportNormalWideLDC()) {
            boolean normalWideLDCEnabled = cameraConfigs.getNormalWideLDCEnabled();
            if (i == 4) {
                normalWideLDCEnabled = false;
            }
            MiCameraCompat.applyNormalWideLDC(builder, normalWideLDCEnabled);
        }
    }

    static void applyUltraWideLDC(Builder builder, CameraCapabilities cameraCapabilities, CameraConfigs cameraConfigs) {
        if (builder != null && cameraCapabilities.isSupportUltraWideLDC()) {
            MiCameraCompat.applyUltraWideLDC(builder, cameraConfigs.getUltraWideLDCEnabled());
        }
    }

    static void applyExposureCompensation(Builder builder, int i, CameraCapabilities cameraCapabilities, CameraConfigs cameraConfigs) {
        if (builder != null) {
            String str;
            int exposureCompensationIndex = cameraConfigs.getExposureCompensationIndex();
            if (b.hU() && ModuleManager.isManualModule() && i == 1 && cameraConfigs.getISO() == 0 && cameraConfigs.getExposureTime() > MAX_REALTIME_EXPOSURE_TIME) {
                double log = Math.log((double) ((float) (((double) cameraConfigs.getExposureTime()) / 1.25E8d))) / Math.log(2.0d);
                str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("applyExposureCompensation: EV = ");
                stringBuilder.append(log);
                Log.d(str, stringBuilder.toString());
                Rational exposureCompensationRational = cameraCapabilities.getExposureCompensationRational();
                exposureCompensationIndex = Math.min((int) ((log * ((double) exposureCompensationRational.getDenominator())) / ((double) exposureCompensationRational.getNumerator())), cameraCapabilities.getMaxExposureCompensation());
            }
            str = TAG;
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("applyExposureCompensation: ");
            stringBuilder2.append(exposureCompensationIndex);
            Log.d(str, stringBuilder2.toString());
            builder.set(CaptureRequest.CONTROL_AE_EXPOSURE_COMPENSATION, Integer.valueOf(exposureCompensationIndex));
        }
    }

    static void applySuperNightScene(Builder builder, int i) {
        if (builder != null && i == 3) {
            Log.d(TAG, "applySuperNightScene: true");
            MiCameraCompat.applySuperNightScene(builder, true);
        }
    }

    private void applyNoiseReduction(Builder builder) {
        if (builder != null) {
            builder.set(CaptureRequest.NOISE_REDUCTION_MODE, Integer.valueOf(2));
        }
    }

    public static void applyASDScene(Builder builder, CameraConfigs cameraConfigs) {
        if (builder != null && cameraConfigs != null) {
            MiCameraCompat.applyASDScene(builder, cameraConfigs.getASDScene());
        }
    }

    public static void applyBackwardCaptureHint(CameraCapabilities cameraCapabilities, Builder builder, boolean z) {
        if (builder != null) {
            if (cameraCapabilities.isBackwardCaptureSupported()) {
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("applyBackwardCaptureHint(): ");
                stringBuilder.append(z);
                Log.d(str, stringBuilder.toString());
                MiCameraCompat.applyBackwardCaptureHint(builder, z);
                return;
            }
            Log.d(TAG, "applyBackwardCaptureHint(): unsupported");
        }
    }
}
