package com.android.camera2.compat;

import android.hardware.camera2.CaptureRequest.Builder;
import com.android.camera.fragment.beauty.BeautyParameters.Type;
import com.android.camera.fragment.beauty.BeautyValues;
import com.mi.config.b;
import java.util.HashSet;

public class MiCameraCompat {
    static final MiCameraCompatBaseImpl IMPL;

    static {
        if (b.gk()) {
            IMPL = new MiCameraCompatQcomImpl();
        } else if (b.isMTKPlatform()) {
            IMPL = new MiCameraCompatMtkImpl();
        } else {
            IMPL = new MiCameraCompatBaseImpl();
        }
    }

    public static void applyISO(Builder builder, int i) {
        IMPL.applyISO(builder, i);
    }

    public static void applyExposureTime(Builder builder, long j) {
        IMPL.applyExposureTime(builder, j);
    }

    public static void applyCustomAWB(Builder builder, int i) {
        IMPL.applyCustomWB(builder, i);
    }

    public static void applyContrast(Builder builder, int i) {
        IMPL.applyContrast(builder, i);
    }

    public static void applySaturation(Builder builder, int i) {
        IMPL.applySaturation(builder, i);
    }

    public static void applySharpness(Builder builder, int i) {
        IMPL.applySharpness(builder, i);
    }

    public static void applyExposureMeteringMode(Builder builder, int i) {
        IMPL.applyExposureMeteringMode(builder, i);
    }

    public static void applyHHT(Builder builder, boolean z) {
        IMPL.applyHHT(builder, z);
    }

    public static void applyHDR(Builder builder, boolean z) {
        IMPL.applyHDR(builder, z);
    }

    public static void applyHDRCheckerEnable(Builder builder, boolean z) {
        IMPL.applyHDRCheckerEnable(builder, z);
    }

    public static void applyParallelProcessPath(Builder builder, String str) {
        IMPL.applyParallelProcessPath(builder, str);
    }

    public static void applyParallelProcessEnable(Builder builder, boolean z) {
        IMPL.applyParallelProcessEnable(builder, z);
    }

    public static void applySuperResolution(Builder builder, boolean z) {
        IMPL.applySuperResolution(builder, z);
    }

    public static void applyWaterMarkAppliedList(Builder builder, String str) {
        IMPL.applyWaterMarkAppliedList(builder, str);
    }

    public static void applyTimeWaterMark(Builder builder, String str) {
        IMPL.applyTimeWaterMark(builder, str);
    }

    public static void applyFaceWaterMark(Builder builder, String str) {
        IMPL.applyFaceWaterMark(builder, str);
    }

    public static void applyMfnrEnable(Builder builder, boolean z) {
        IMPL.applyMfnr(builder, z);
    }

    public static void applySwMfnrEnable(Builder builder, boolean z) {
        IMPL.applySwMfnr(builder, z);
    }

    public static void applyBokehEnable(Builder builder, boolean z) {
        IMPL.applyBokeh(builder, z);
    }

    public static void applyStFastZoomIn(Builder builder, boolean z) {
        IMPL.applyStFastZoomIn(builder, z);
    }

    public static void applyFaceAgeAnalyzeEnable(Builder builder, boolean z) {
        IMPL.applyFaceAnalyzeAge(builder, z);
    }

    public static void applyFaceScoreEnable(Builder builder, boolean z) {
        IMPL.applyFaceScore(builder, z);
    }

    public static void applyDeviceOrientation(Builder builder, int i) {
        IMPL.applyDeviceOrientation(builder, i);
    }

    public static void applyBeautyParameter(Builder builder, BeautyValues beautyValues) {
        IMPL.applyBeautyParameter(builder, beautyValues);
    }

    public static void applyVideoStreamState(Builder builder, boolean z) {
        IMPL.applyVideoStreamState(builder, z);
    }

    public static void applyASDEnable(Builder builder, boolean z) {
        IMPL.applyASDEnable(builder, z);
    }

    public static void applyCameraAi30Enable(Builder builder, boolean z) {
        IMPL.applyCameraAi30Enable(builder, z);
    }

    public static void applyNormalWideLDC(Builder builder, boolean z) {
        IMPL.applyNormalWideLDC(builder, z);
    }

    public static void applyUltraWideLDC(Builder builder, boolean z) {
        IMPL.applyUltraWideLDC(builder, z);
    }

    public static void applyDepurpleEnable(Builder builder, boolean z) {
        IMPL.applyDepurpleEnable(builder, z);
    }

    public static void applyASDScene(Builder builder, int i) {
        IMPL.applyASDScene(builder, i);
    }

    public static void applyAiScenePeriod(Builder builder, int i) {
        IMPL.applyAiScenePeriod(builder, i);
    }

    public static void applySnapshotTorch(Builder builder, boolean z) {
        IMPL.applySnapshotTorch(builder, z);
    }

    public static void applyFrontMirror(Builder builder, boolean z) {
        IMPL.applyFrontMirror(builder, z);
    }

    public static void applyBurstHint(Builder builder, int i) {
        IMPL.applyBurstHint(builder, i);
    }

    public static void applyBurstFps(Builder builder, int i) {
        IMPL.applyBurstFps(builder, i);
    }

    public static void applyIsHfrPreview(Builder builder, boolean z) {
        IMPL.applyIsHfrPreview(builder, z);
    }

    public static void applyLensDirtyDetect(Builder builder, boolean z) {
        IMPL.applyLensDirtyDetect(builder, z);
    }

    public static void applyPortraitLighting(Builder builder, int i) {
        IMPL.applyPortraitLighting(builder, i);
    }

    public static void applyEyeLight(Builder builder, int i, int i2) {
        IMPL.applyEyeLight(builder, i, i2);
    }

    public static void applySuperNightScene(Builder builder, boolean z) {
        IMPL.applySuperNightScene(builder, z);
    }

    public static void applyHdrBracketMode(Builder builder, byte b) {
        IMPL.applyHdrBracketMode(builder, b);
    }

    public static void applyMultiFrameInputNum(Builder builder, int i) {
        IMPL.applyMultiFrameInputNum(builder, i);
    }

    public static void applyFNumber(Builder builder, String str) {
        IMPL.applyFNumber(builder, str);
    }

    public static boolean supportContrast(HashSet<String> hashSet) {
        return IMPL.supportContrast(hashSet);
    }

    public static boolean supportLensDirtyDetect(HashSet<String> hashSet) {
        return IMPL.supportLensDirtyDetect(hashSet);
    }

    public static boolean supportBeautyType(HashSet<String> hashSet, Type type) {
        return IMPL.supportBeautyType(hashSet, type);
    }

    public static boolean supportExtraHighSpeedVideoConfiguration(HashSet<String> hashSet) {
        return IMPL.supportExtraHighSpeedVideoConfiguration(hashSet);
    }

    public static boolean supportEyeLight(HashSet<String> hashSet) {
        return IMPL.supportEyeLight(hashSet);
    }
}
