package com.android.camera2;

import android.annotation.TargetApi;
import android.graphics.Rect;
import android.hardware.camera2.CameraCharacteristics;
import android.hardware.camera2.CameraCharacteristics.Key;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.params.HighSpeedVideoConfiguration;
import android.hardware.camera2.params.ReprocessFormatsMap;
import android.hardware.camera2.params.StreamConfiguration;
import android.hardware.camera2.params.StreamConfigurationDuration;
import android.hardware.camera2.params.StreamConfigurationMap;
import android.util.Range;
import android.util.Rational;
import android.util.Size;
import android.util.SizeF;
import android.util.SparseArray;
import com.android.camera.CameraSize;
import com.android.camera.Util;
import com.android.camera.constant.MiCameraCharacteristics;
import com.android.camera.fragment.beauty.BeautyParameters.Type;
import com.android.camera.log.Log;
import com.android.camera.module.BaseModule;
import com.android.camera2.compat.MiCameraCompat;
import com.android.camera2.compat.MiCameraCompatBaseImpl;
import com.mi.config.b;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;

@TargetApi(21)
public class CameraCapabilities {
    public static final int CAMERA_ILLEGALSTATE_EXCEPTION = 256;
    private static final float DEFAULT_VIEW_ANGLE = 51.5f;
    private static final int HAL_PIXEL_FORMAT_BLOB = 33;
    private static final Key<StreamConfiguration[]> LIMIT_STREAM_CONFIGURATIONS = MiCameraCharacteristics.SCALER_AVAILABLE_LIMIT_STREAM_CONFIGURATIONS;
    private static final Key<Rect> QCFA_ACTIVE_ARRAY_SIZE = new Key("org.codeaurora.qcamera3.quadra_cfa.activeArraySize", Rect.class);
    private static final Key<StreamConfiguration[]> QCFA_STREAM_CONFIGURATIONS = new Key("org.codeaurora.qcamera3.quadra_cfa.availableStreamConfigurations", StreamConfiguration[].class);
    public static final int SESSION_OPERATION_MODE_ALGO_UP = 36864;
    public static final int SESSION_OPERATION_MODE_ALGO_UP_QCFA = 36865;
    public static final int SESSION_OPERATION_MODE_ALGO_UP_SAT = 36866;
    public static final int SESSION_OPERATION_MODE_FOVC = 61456;
    public static final int SESSION_OPERATION_MODE_FRONT_PORTRAIT = 33009;
    public static final int SESSION_OPERATION_MODE_HFR_120 = 32888;
    public static final int SESSION_OPERATION_MODE_HSR_60 = 32828;
    public static final int SESSION_OPERATION_MODE_MANUAL = 32771;
    public static final int SESSION_OPERATION_MODE_MCTF = 32816;
    public static final int SESSION_OPERATION_MODE_MIUI_BACK = 32769;
    public static final int SESSION_OPERATION_MODE_MIUI_FRONT = 32773;
    public static final int SESSION_OPERATION_MODE_NORMAL = 0;
    public static final int SESSION_OPERATION_MODE_NORMAL_ULTRA_PIXEL_PHOTOGRAPHY = 33011;
    public static final int SESSION_OPERATION_MODE_PANORMA = 32776;
    public static final int SESSION_OPERATION_MODE_PORTRAIT = 32770;
    public static final int SESSION_OPERATION_MODE_PROFESSIONAL_ULTRA_PIXEL_PHOTOGRAPHY = 33013;
    public static final int SESSION_OPERATION_MODE_QCFA = 32775;
    public static final int SESSION_OPERATION_MODE_SUPER_NIGHT = 32778;
    public static final int SESSION_OPERATION_MODE_VIDEO = 32772;
    public static final int SESSION_OPERATION_MODE_VIDEO_BEAUTY = 32777;
    private static final String TAG = CameraCapabilities.class.getSimpleName();
    public static final int ULTRA_PIXEL_32M = 32275200;
    public static final int ULTRA_PIXEL_48M = 48000000;
    public static final Map<Integer, Size> ULTRA_PIXEL_SIZE_LIST = new HashMap<Integer, Size>() {
        {
            put(Integer.valueOf(CameraCapabilities.ULTRA_PIXEL_32M), new Size(6560, 4920));
            put(Integer.valueOf(CameraCapabilities.ULTRA_PIXEL_48M), new Size(BaseModule.LENS_DIRTY_DETECT_HINT_DURATION, 6000));
        }
    };
    private static final List<Key<StreamConfiguration[]>> ULTRA_PIXEL_STREAM_CONFIGURATIONS_VENDOR_KEYS = new ArrayList<Key<StreamConfiguration[]>>(3) {
    };
    private final int mCameraId;
    private final HashSet<String> mCaptureRequestVendorKeys;
    private final CameraCharacteristics mCharacteristics;
    private int mOperatingMode;
    private SparseArray<StreamConfigurationMap> mStreamConfigurationMap;

    @Retention(RetentionPolicy.SOURCE)
    public @interface OperationMode {
    }

    public CameraCapabilities(CameraCharacteristics cameraCharacteristics, int i) {
        if (cameraCharacteristics != null) {
            this.mCharacteristics = cameraCharacteristics;
            this.mCameraId = i;
            if (((Integer) this.mCharacteristics.get(CameraCharacteristics.INFO_SUPPORTED_HARDWARE_LEVEL)).intValue() == 2) {
                this.mCaptureRequestVendorKeys = new HashSet();
                return;
            }
            List<CaptureRequest.Key> allVendorKeys = this.mCharacteristics.getNativeCopy().getAllVendorKeys(CaptureRequest.Key.class);
            this.mCaptureRequestVendorKeys = new HashSet(allVendorKeys.size());
            for (CaptureRequest.Key name : allVendorKeys) {
                this.mCaptureRequestVendorKeys.add(name.getName());
            }
            return;
        }
        throw new IllegalArgumentException("Null CameraCharacteristics");
    }

    public void setOperatingMode(int i) {
        this.mOperatingMode = i;
    }

    public int getOperatingMode() {
        return this.mOperatingMode;
    }

    public int getCameraId() {
        return this.mCameraId;
    }

    public int getFacing() {
        Integer num = (Integer) this.mCharacteristics.get(CameraCharacteristics.LENS_FACING);
        return num != null ? num.intValue() : 1;
    }

    public int getSensorOrientation() {
        Integer num = (Integer) this.mCharacteristics.get(CameraCharacteristics.SENSOR_ORIENTATION);
        return num != null ? num.intValue() : 0;
    }

    public Rect getActiveArraySize() {
        if (isSupportedQcfa() && this.mCaptureRequestVendorKeys.contains(QCFA_ACTIVE_ARRAY_SIZE.getName())) {
            return (Rect) this.mCharacteristics.get(QCFA_ACTIVE_ARRAY_SIZE);
        }
        return (Rect) this.mCharacteristics.get(CameraCharacteristics.SENSOR_INFO_ACTIVE_ARRAY_SIZE);
    }

    public Range<Integer> getIsoRange() {
        return (Range) this.mCharacteristics.get(CameraCharacteristics.SENSOR_INFO_SENSITIVITY_RANGE);
    }

    public int getMaxIso() {
        Range isoRange = getIsoRange();
        if (isoRange == null) {
            return 0;
        }
        return ((Integer) isoRange.getUpper()).intValue();
    }

    public float getMaxZoomRatio() {
        Float f = (Float) this.mCharacteristics.get(CameraCharacteristics.SCALER_AVAILABLE_MAX_DIGITAL_ZOOM);
        return f != null ? f.floatValue() : 1.0f;
    }

    public boolean isZoomSupported() {
        return getMaxZoomRatio() > 1.0f;
    }

    public boolean isFlashSupported() {
        Boolean bool = (Boolean) this.mCharacteristics.get(CameraCharacteristics.FLASH_INFO_AVAILABLE);
        return bool != null && bool.booleanValue();
    }

    public boolean isAERegionSupported() {
        Integer num = (Integer) this.mCharacteristics.get(CameraCharacteristics.CONTROL_MAX_REGIONS_AE);
        return num != null && num.intValue() > 0;
    }

    public boolean isAFRegionSupported() {
        Float f = (Float) this.mCharacteristics.get(CameraCharacteristics.LENS_INFO_MINIMUM_FOCUS_DISTANCE);
        return f != null && f.floatValue() > 0.0f;
    }

    public boolean isSupportedQcfa() {
        boolean z = false;
        if (this.mCaptureRequestVendorKeys == null || !this.mCaptureRequestVendorKeys.contains(MiCameraCharacteristics.IS_QCFA_SENSOR.getName())) {
            return false;
        }
        Byte b = (Byte) this.mCharacteristics.get(MiCameraCharacteristics.IS_QCFA_SENSOR);
        if (b != null && b.byteValue() == (byte) 1) {
            z = true;
        }
        return z;
    }

    @TargetApi(23)
    public boolean isAELockSupported() {
        Boolean bool = (Boolean) this.mCharacteristics.get(CameraCharacteristics.CONTROL_AE_LOCK_AVAILABLE);
        return bool != null && bool.booleanValue();
    }

    @TargetApi(23)
    public boolean isAWBLockSupported() {
        Boolean bool = (Boolean) this.mCharacteristics.get(CameraCharacteristics.CONTROL_AWB_LOCK_AVAILABLE);
        return bool != null && bool.booleanValue();
    }

    public boolean isAutoFocusSupported() {
        return Util.isSupported(1, getSupportedFocusModes());
    }

    public float getMinimumFocusDistance() {
        Float f = (Float) this.mCharacteristics.get(CameraCharacteristics.LENS_INFO_MINIMUM_FOCUS_DISTANCE);
        return f != null ? f.floatValue() : 0.0f;
    }

    public boolean isFixedFocus() {
        return getMinimumFocusDistance() > 0.0f;
    }

    public boolean isFaceDetectionSupported() {
        int[] iArr = (int[]) this.mCharacteristics.get(CameraCharacteristics.STATISTICS_INFO_AVAILABLE_FACE_DETECT_MODES);
        if (iArr != null) {
            for (int i : iArr) {
                if (i == 1) {
                    return true;
                }
            }
        }
        return false;
    }

    public int getMaxFaceCount() {
        Integer num = (Integer) this.mCharacteristics.get(CameraCharacteristics.STATISTICS_INFO_MAX_FACE_COUNT);
        return num != null ? num.intValue() : 0;
    }

    public Range<Integer>[] getSupportedFpsRange() {
        return (Range[]) this.mCharacteristics.get(CameraCharacteristics.CONTROL_AE_AVAILABLE_TARGET_FPS_RANGES);
    }

    public List<MiCustomFpsRange> getSupportedCustomFpsRange() {
        try {
            return MiCustomFpsRange.unmarshal((int[]) this.mCharacteristics.get(MiCameraCharacteristics.CUSTOM_HFR_FPS_TABLE));
        } catch (IllegalArgumentException e) {
            Log.e(TAG, e.getMessage());
            return null;
        }
    }

    private List<CameraSize> convertToPictureSize(Size[] sizeArr) {
        List<CameraSize> arrayList = new ArrayList();
        if (sizeArr != null) {
            for (Size size : sizeArr) {
                arrayList.add(new CameraSize(size.getWidth(), size.getHeight()));
            }
        }
        return arrayList;
    }

    public List<CameraSize> getSupportedThumbnailSizes() {
        return convertToPictureSize((Size[]) this.mCharacteristics.get(CameraCharacteristics.JPEG_AVAILABLE_THUMBNAIL_SIZES));
    }

    private boolean isQcfaMode() {
        return this.mOperatingMode == 32775 || this.mOperatingMode == SESSION_OPERATION_MODE_ALGO_UP_QCFA;
    }

    private boolean isUltraPixelPhotographyMode() {
        return this.mOperatingMode == SESSION_OPERATION_MODE_NORMAL_ULTRA_PIXEL_PHOTOGRAPHY || this.mOperatingMode == SESSION_OPERATION_MODE_PROFESSIONAL_ULTRA_PIXEL_PHOTOGRAPHY;
    }

    private StreamConfigurationMap getStreamConfigurationMap() {
        if (this.mStreamConfigurationMap == null) {
            this.mStreamConfigurationMap = new SparseArray(5);
        }
        if (this.mStreamConfigurationMap.get(this.mOperatingMode) == null) {
            List arrayList = new ArrayList();
            boolean contains = this.mCaptureRequestVendorKeys.contains(MiCameraCharacteristics.SCALER_AVAILABLE_LIMIT_STREAM_CONFIGURATIONS.getName());
            boolean contains2 = this.mCaptureRequestVendorKeys.contains(MiCameraCharacteristics.XIAOMI_SCALER_AVAILABLE_SR_STREAM_CONFIGURATIONS.getName());
            String str;
            StringBuilder stringBuilder;
            if (isSupportedQcfa() && contains2 && isUltraPixelPhotographyMode()) {
                arrayList.addAll(Arrays.asList((StreamConfiguration[]) this.mCharacteristics.get(MiCameraCharacteristics.XIAOMI_SCALER_AVAILABLE_SR_STREAM_CONFIGURATIONS)));
                str = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("getStreamConfigurationMap: sr stream configs size = ");
                stringBuilder.append(arrayList.size());
                Log.d(str, stringBuilder.toString());
            } else if (isSupportedQcfa() && this.mCaptureRequestVendorKeys.contains(QCFA_STREAM_CONFIGURATIONS.getName()) && (isQcfaMode() || !contains || isUltraPixelPhotographyMode())) {
                arrayList.addAll(Arrays.asList((StreamConfiguration[]) this.mCharacteristics.get(QCFA_STREAM_CONFIGURATIONS)));
                if (contains) {
                    arrayList.addAll(Arrays.asList((StreamConfiguration[]) this.mCharacteristics.get(MiCameraCharacteristics.SCALER_AVAILABLE_LIMIT_STREAM_CONFIGURATIONS)));
                } else {
                    arrayList.addAll(Arrays.asList((StreamConfiguration[]) this.mCharacteristics.get(MiCameraCharacteristics.SCALER_AVAILABLE_STREAM_CONFIGURATIONS)));
                }
                str = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("getStreamConfigurationMap: qcfa stream configs size = ");
                stringBuilder.append(arrayList.size());
                Log.d(str, stringBuilder.toString());
            } else if (contains) {
                arrayList.addAll(Arrays.asList((StreamConfiguration[]) this.mCharacteristics.get(MiCameraCharacteristics.SCALER_AVAILABLE_LIMIT_STREAM_CONFIGURATIONS)));
                str = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("getStreamConfigurationMap: limit stream configs size = ");
                stringBuilder.append(arrayList.size());
                Log.d(str, stringBuilder.toString());
            }
            if (arrayList.size() == 0) {
                this.mStreamConfigurationMap.put(this.mOperatingMode, (StreamConfigurationMap) this.mCharacteristics.get(CameraCharacteristics.SCALER_STREAM_CONFIGURATION_MAP));
            } else {
                this.mStreamConfigurationMap.put(this.mOperatingMode, new StreamConfigurationMap((StreamConfiguration[]) arrayList.toArray(new StreamConfiguration[0]), (StreamConfigurationDuration[]) this.mCharacteristics.get(CameraCharacteristics.SCALER_AVAILABLE_MIN_FRAME_DURATIONS), (StreamConfigurationDuration[]) this.mCharacteristics.get(CameraCharacteristics.SCALER_AVAILABLE_STALL_DURATIONS), (StreamConfiguration[]) this.mCharacteristics.get(CameraCharacteristics.DEPTH_AVAILABLE_DEPTH_STREAM_CONFIGURATIONS), (StreamConfigurationDuration[]) this.mCharacteristics.get(CameraCharacteristics.DEPTH_AVAILABLE_DEPTH_MIN_FRAME_DURATIONS), (StreamConfigurationDuration[]) this.mCharacteristics.get(CameraCharacteristics.DEPTH_AVAILABLE_DEPTH_STALL_DURATIONS), (HighSpeedVideoConfiguration[]) this.mCharacteristics.get(CameraCharacteristics.CONTROL_AVAILABLE_HIGH_SPEED_VIDEO_CONFIGURATIONS), (ReprocessFormatsMap) this.mCharacteristics.get(CameraCharacteristics.SCALER_AVAILABLE_INPUT_OUTPUT_FORMATS_MAP), true));
            }
        }
        return (StreamConfigurationMap) this.mStreamConfigurationMap.get(this.mOperatingMode);
    }

    public byte[] getCameraCalibrationData() {
        return (byte[]) this.mCharacteristics.get(MiCameraCharacteristics.CAM_CALIBRATION_DATA);
    }

    public List<CameraSize> getSupportedOutputSize(int i) {
        StreamConfigurationMap streamConfigurationMap = getStreamConfigurationMap();
        if (streamConfigurationMap != null) {
            return convertToPictureSize(streamConfigurationMap.getOutputSizes(i));
        }
        return new ArrayList(0);
    }

    public List<CameraSize> getSupportedOutputSize(Class cls) {
        StreamConfigurationMap streamConfigurationMap = getStreamConfigurationMap();
        if (streamConfigurationMap != null) {
            return convertToPictureSize(streamConfigurationMap.getOutputSizes(cls));
        }
        return new ArrayList(0);
    }

    public Size[] getSupportedHighSpeedVideoSize() {
        Size[] highSpeedVideoSizes = ((StreamConfigurationMap) this.mCharacteristics.get(CameraCharacteristics.SCALER_STREAM_CONFIGURATION_MAP)).getHighSpeedVideoSizes();
        if (!isSupportExtraHighSpeedVideoConfiguration()) {
            return highSpeedVideoSizes;
        }
        List<MiHighSpeedVideoConfiguration> extraHighSpeedVideoConfiguration = getExtraHighSpeedVideoConfiguration();
        if (extraHighSpeedVideoConfiguration == null) {
            return highSpeedVideoSizes;
        }
        List arrayList = new ArrayList();
        for (MiHighSpeedVideoConfiguration size : extraHighSpeedVideoConfiguration) {
            Size size2 = size.getSize();
            if (!arrayList.contains(size2)) {
                arrayList.add(size2);
            }
        }
        if (highSpeedVideoSizes != null) {
            for (Object obj : highSpeedVideoSizes) {
                if (!arrayList.contains(obj)) {
                    arrayList.add(obj);
                }
            }
        }
        return (Size[]) arrayList.toArray(new Size[0]);
    }

    public Range<Integer>[] getSupportedHighSpeedVideoFPSRange(Size size) {
        Range<Integer>[] highSpeedVideoFpsRangesFor = ((StreamConfigurationMap) this.mCharacteristics.get(CameraCharacteristics.SCALER_STREAM_CONFIGURATION_MAP)).getHighSpeedVideoFpsRangesFor(size);
        if (!isSupportExtraHighSpeedVideoConfiguration()) {
            return highSpeedVideoFpsRangesFor;
        }
        List<MiHighSpeedVideoConfiguration> extraHighSpeedVideoConfiguration = getExtraHighSpeedVideoConfiguration();
        if (extraHighSpeedVideoConfiguration == null) {
            return highSpeedVideoFpsRangesFor;
        }
        List arrayList = new ArrayList();
        for (MiHighSpeedVideoConfiguration miHighSpeedVideoConfiguration : extraHighSpeedVideoConfiguration) {
            if (size != null && size.equals(miHighSpeedVideoConfiguration.getSize())) {
                arrayList.add(miHighSpeedVideoConfiguration.getFpsRange());
            }
        }
        if (highSpeedVideoFpsRangesFor != null) {
            for (Object add : highSpeedVideoFpsRangesFor) {
                arrayList.add(add);
            }
        }
        return (Range[]) arrayList.toArray(new Range[arrayList.size()]);
    }

    public List<Integer> getSupportedHFRVideoFPSList(Size size) {
        List<Integer> arrayList = new ArrayList();
        for (Range range : getSupportedHighSpeedVideoFPSRange(size)) {
            if (((Integer) range.getUpper()).equals(range.getLower()) && !arrayList.contains(range.getUpper())) {
                arrayList.add((Integer) range.getUpper());
            }
        }
        return arrayList;
    }

    public int[] getSupportedAWBModes() {
        return (int[]) this.mCharacteristics.get(CameraCharacteristics.CONTROL_AWB_AVAILABLE_MODES);
    }

    public int[] getSupportedFlashModes() {
        return (int[]) this.mCharacteristics.get(CameraCharacteristics.CONTROL_AE_AVAILABLE_MODES);
    }

    public int[] getSupportedFocusModes() {
        return (int[]) this.mCharacteristics.get(CameraCharacteristics.CONTROL_AF_AVAILABLE_MODES);
    }

    public int[] getSupportedColorEffects() {
        return (int[]) this.mCharacteristics.get(CameraCharacteristics.CONTROL_AVAILABLE_EFFECTS);
    }

    public int[] getSupportedAntiBandingModes() {
        return (int[]) this.mCharacteristics.get(CameraCharacteristics.CONTROL_AE_AVAILABLE_ANTIBANDING_MODES);
    }

    public int[] getSupportedSceneModes() {
        return (int[]) this.mCharacteristics.get(CameraCharacteristics.CONTROL_AVAILABLE_SCENE_MODES);
    }

    public Range<Integer> getExposureCompensationRange() {
        return (Range) this.mCharacteristics.get(CameraCharacteristics.CONTROL_AE_COMPENSATION_RANGE);
    }

    public int getMaxExposureCompensation() {
        Range exposureCompensationRange = getExposureCompensationRange();
        if (exposureCompensationRange == null) {
            return 0;
        }
        return ((Integer) exposureCompensationRange.getUpper()).intValue();
    }

    public float getExposureCompensationStep() {
        Rational rational = (Rational) this.mCharacteristics.get(CameraCharacteristics.CONTROL_AE_COMPENSATION_STEP);
        return rational != null ? rational.floatValue() : 1.0f;
    }

    public Rational getExposureCompensationRational() {
        return (Rational) this.mCharacteristics.get(CameraCharacteristics.CONTROL_AE_COMPENSATION_STEP);
    }

    public Range<Long> getExposureTimeRange() {
        return (Range) this.mCharacteristics.get(CameraCharacteristics.SENSOR_INFO_EXPOSURE_TIME_RANGE);
    }

    public float getViewAngle(boolean z) {
        float[] fArr = (float[]) this.mCharacteristics.get(CameraCharacteristics.LENS_INFO_AVAILABLE_FOCAL_LENGTHS);
        if (fArr != null && fArr.length > 0) {
            float f = fArr[0];
            SizeF sizeF = (SizeF) this.mCharacteristics.get(CameraCharacteristics.SENSOR_INFO_PHYSICAL_SIZE);
            if (sizeF != null) {
                float height = z ? sizeF.getHeight() : sizeF.getWidth();
                if (height > 0.0f) {
                    height = (float) (2.0d * Math.toDegrees(Math.atan((0.5d * ((double) height)) / ((double) f))));
                    String str = TAG;
                    Locale locale = Locale.US;
                    String str2 = "%s view angle: %.2f, size = %s, focalLength = %.4f";
                    Object[] objArr = new Object[4];
                    objArr[0] = z ? "vertical" : "horizontal";
                    objArr[1] = Float.valueOf(height);
                    objArr[2] = sizeF;
                    objArr[3] = Float.valueOf(f);
                    Log.d(str, String.format(locale, str2, objArr));
                    return height;
                }
            }
        }
        String str3 = TAG;
        Locale locale2 = Locale.US;
        String str4 = "failed to get %s view angle";
        Object[] objArr2 = new Object[1];
        objArr2[0] = z ? "vertical" : "horizontal";
        Log.e(str3, String.format(locale2, str4, objArr2));
        return DEFAULT_VIEW_ANGLE;
    }

    public int getSupportedHardwareLevel() {
        return ((Integer) this.mCharacteristics.get(CameraCharacteristics.INFO_SUPPORTED_HARDWARE_LEVEL)).intValue();
    }

    public int getSensorInfoTimestampSource() {
        return ((Integer) this.mCharacteristics.get(CameraCharacteristics.SENSOR_INFO_TIMESTAMP_SOURCE)).intValue();
    }

    public <T> T getCameraCharacteristic(Key<T> key) {
        return this.mCharacteristics.get(key);
    }

    public boolean isSupportOIS() {
        int[] iArr = (int[]) this.mCharacteristics.get(CameraCharacteristics.LENS_INFO_AVAILABLE_OPTICAL_STABILIZATION);
        if (iArr == null || iArr.length == 0) {
            return false;
        }
        if (iArr.length == 1 && iArr[0] == 0) {
            return false;
        }
        return true;
    }

    public static int getBurstShootCount() {
        return b.getBurstShootCount();
    }

    private List<MiHighSpeedVideoConfiguration> getExtraHighSpeedVideoConfiguration() {
        try {
            Integer num = (Integer) this.mCharacteristics.get(MiCameraCharacteristics.EXTRA_HIGH_SPEED_VIDEO_NUMBER);
            if (num != null && num.intValue() > 0) {
                return MiHighSpeedVideoConfiguration.unmarshal((int[]) this.mCharacteristics.get(MiCameraCharacteristics.EXTRA_HIGH_SPEED_VIDEO_CONFIGURATIONS), num.intValue());
            }
        } catch (IllegalArgumentException e) {
            Log.e(TAG, e.getMessage());
        }
        return null;
    }

    public boolean isSupportHdr() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.HDR_ENABLED.getName());
    }

    public boolean isSupportAutoHdr() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.HDR_CHECKER_ENABLE.getName());
    }

    public boolean isSupportHHT() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.HHT_ENABLED.getName());
    }

    public boolean isSupportSuperResolution() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.SUPER_RESOLUTION_ENABLED.getName());
    }

    public boolean isSupportParallel() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.PARALLEL_ENABLED.getName());
    }

    public boolean isSupportMfnr() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.MFNR_ENABLED.getName());
    }

    public boolean isSupportSwMfnr() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.SW_MFNR_ENABLED.getName());
    }

    public boolean isSupportBokeh() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.MFNR_BOKEH.getName());
    }

    public boolean isSupportFaceAgeAnalyze() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.FACE_AGE_ANALYZE_ENABLED.getName());
    }

    public boolean isSupportFaceScore() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.FACE_SCORE_ENABLED.getName());
    }

    public boolean isSupportDeviceOrientation() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.DEVICE_ORIENTATION.getName());
    }

    public boolean isSupportBeauty() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.BEAUTY_LEVEL.getName());
    }

    public boolean isSupportVideoBeauty() {
        boolean z = false;
        if (this.mCaptureRequestVendorKeys == null || !this.mCaptureRequestVendorKeys.contains(MiCameraCharacteristics.VIDEO_BEAUTY.getName())) {
            return false;
        }
        Boolean bool = (Boolean) this.mCharacteristics.get(MiCameraCharacteristics.VIDEO_BEAUTY);
        if (bool != null && bool.booleanValue()) {
            z = true;
        }
        return z;
    }

    public boolean isSupportBeautyMakeup() {
        boolean z = false;
        if (this.mCaptureRequestVendorKeys == null || !this.mCaptureRequestVendorKeys.contains(MiCameraCharacteristics.BEAUTY_MAKEUP.getName())) {
            return false;
        }
        Boolean bool = (Boolean) this.mCharacteristics.get(MiCameraCharacteristics.BEAUTY_MAKEUP);
        if (bool != null && bool.booleanValue()) {
            z = true;
        }
        return z;
    }

    public int getZoomRatioTeleReal() {
        return b.qT ? 17 : 20;
    }

    public boolean isSupportSnapShotTorch() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.SNAP_SHOT_TORCH.getName());
    }

    public boolean isSupportWatermark() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.WATERMARK_APPLIEDTYPE.getName());
    }

    public boolean isSupportFrontMirror() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.FRONT_MIRROR.getName());
    }

    public boolean isSupportBurstHint() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.BURST_CAPTURE_HINT.getName());
    }

    public boolean isSupportBurstFps() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.BURST_SHOOT_FPS.getName());
    }

    public boolean isSupportPortraitLighting() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.PORTRAIT_LIGHTING.getName());
    }

    public boolean isSupportCameraAi30() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.CAMERA_AI_30.getName());
    }

    public boolean isSupportDepurple() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.DEPURPLE_TAG.getName());
    }

    public boolean isSupportContrast() {
        return MiCameraCompat.supportContrast(this.mCaptureRequestVendorKeys);
    }

    public boolean isSupportLensDirtyDetect() {
        return MiCameraCompat.supportLensDirtyDetect(this.mCaptureRequestVendorKeys);
    }

    public boolean isSupportBeautyType(Type type) {
        return MiCameraCompat.supportBeautyType(this.mCaptureRequestVendorKeys, type);
    }

    public boolean isSupportExtraHighSpeedVideoConfiguration() {
        return MiCameraCompat.supportExtraHighSpeedVideoConfiguration(this.mCaptureRequestVendorKeys);
    }

    public boolean isSupportEyeLight() {
        return MiCameraCompat.supportEyeLight(this.mCaptureRequestVendorKeys);
    }

    public boolean isSupportFastZoomIn() {
        return this.mCaptureRequestVendorKeys.contains(CaptureResultParser.FAST_ZOOM_RESULT.getName());
    }

    public boolean isUltraPixelPhotographySupported(int i) {
        Size size = (Size) ULTRA_PIXEL_SIZE_LIST.get(Integer.valueOf(i));
        if (size == null || !isSupportedQcfa()) {
            return false;
        }
        for (Key key : ULTRA_PIXEL_STREAM_CONFIGURATIONS_VENDOR_KEYS) {
            if (this.mCaptureRequestVendorKeys.contains(key.getName())) {
                StreamConfiguration[] streamConfigurationArr = (StreamConfiguration[]) this.mCharacteristics.get(key);
                if (streamConfigurationArr == null) {
                    continue;
                } else if (streamConfigurationArr.length > 0) {
                    for (StreamConfiguration streamConfiguration : streamConfigurationArr) {
                        if (streamConfiguration.getFormat() == 33 && streamConfiguration.getWidth() == size.getWidth() && streamConfiguration.getHeight() == size.getHeight()) {
                            return true;
                        }
                    }
                }
            }
        }
        return false;
    }

    public boolean isSupportNormalWideLDC() {
        if (this.mCaptureRequestVendorKeys == null || !this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.NORMAL_WIDE_LENS_DISTORTION_CORRECTION_LEVEL.getName())) {
            Log.d(TAG, "isSupportNormalWideLDC: false");
            return false;
        }
        Log.d(TAG, "isSupportNormalWideLDC: true");
        return true;
    }

    public boolean isSupportUltraWideLDC() {
        if (this.mCaptureRequestVendorKeys == null || !this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.ULTRA_WIDE_LENS_DISTORTION_CORRECTION_LEVEL.getName())) {
            Log.d(TAG, "isSupportUltraWideLDC: false");
            return false;
        }
        Log.d(TAG, "isSupportUltraWideLDC: true");
        return true;
    }

    public boolean isSupportBokehAdjust() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.BOKEH_F_NUMBER.getName());
    }

    public boolean isEISPreviewSupported() {
        boolean z = false;
        if (this.mCaptureRequestVendorKeys == null || !this.mCaptureRequestVendorKeys.contains(MiCameraCharacteristics.EIS_PREVIEW_SUPPORTED.getName())) {
            return false;
        }
        Byte b = (Byte) this.mCharacteristics.get(MiCameraCharacteristics.EIS_PREVIEW_SUPPORTED);
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("isEISPreviewSupported: ");
        stringBuilder.append(b);
        Log.d(str, stringBuilder.toString());
        if (b != null && b.byteValue() == (byte) 1) {
            z = true;
        }
        return z;
    }

    public boolean isPartialMetadataSupported() {
        Integer num = (Integer) this.mCharacteristics.get(CameraCharacteristics.REQUEST_PARTIAL_RESULT_COUNT);
        return num != null && num.intValue() > 1;
    }
}
