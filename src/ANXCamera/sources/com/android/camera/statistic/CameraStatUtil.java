package com.android.camera.statistic;

import android.content.Intent;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.provider.MiuiSettings.System;
import android.util.SparseArray;
import com.android.camera.CameraAppImpl;
import com.android.camera.CameraIntentManager;
import com.android.camera.CameraSettings;
import com.android.camera.MutexModeManager;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.config.ComponentConfigFlash;
import com.android.camera.data.data.config.ComponentConfigHdr;
import com.android.camera.data.data.config.ComponentConfigSlowMotion;
import com.android.camera.data.data.config.ComponentManuallyDualLens;
import com.android.camera.data.data.config.DataItemConfig;
import com.android.camera.data.data.runing.ComponentRunningTimer;
import com.android.camera.data.data.runing.DataItemRunning;
import com.android.camera.effect.EffectController;
import com.android.camera.effect.FilterInfo;
import com.android.camera.fragment.beauty.BeautyParameters;
import com.android.camera.fragment.beauty.BeautyParameters.Type;
import com.android.camera.fragment.beauty.BeautyValues;
import com.android.camera.log.Log;
import com.android.camera.module.BaseModule;
import com.android.camera.module.loader.FunctionParseBeautyBodySlimCount;
import com.mi.config.b;
import com.miui.filtersdk.filter.helper.FilterType;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

public class CameraStatUtil {
    private static final String AUTO = "auto";
    public static final String AUTO_OFF = "auto-off";
    public static final String AUTO_ON = "auto-on";
    public static final String NONE = "none";
    private static final String OTHERS = "others";
    private static final String TAG = CameraStatUtil.class.getSimpleName();
    private static SparseArray<String> sBeautyTypeToName = new SparseArray();
    private static SparseArray<String> sCameraModeIdToName = new SparseArray();
    private static SparseArray<String> sExposureTimeLessThan1sToName = new SparseArray();
    private static SparseArray<String> sFilterTypeToName = new SparseArray();
    private static SparseArray<String> sPictureQualityIndexToName = new SparseArray();
    private static SparseArray<String> sTriggerModeIdToName = new SparseArray();

    static {
        sCameraModeIdToName.put(161, "小视频");
        sCameraModeIdToName.put(163, "拍照");
        sCameraModeIdToName.put(165, "方形");
        sCameraModeIdToName.put(166, "全景");
        sCameraModeIdToName.put(167, "手动");
        sCameraModeIdToName.put(171, "人像");
        sCameraModeIdToName.put(172, "慢动作");
        sCameraModeIdToName.put(173, "夜景");
        sTriggerModeIdToName.put(10, "拍照键");
        sTriggerModeIdToName.put(20, CameraStat.ZOOM_MODE_VOLUME);
        sTriggerModeIdToName.put(30, "指纹");
        sTriggerModeIdToName.put(40, "相机键");
        sTriggerModeIdToName.put(50, "dpad键");
        sTriggerModeIdToName.put(60, "物体追踪");
        sTriggerModeIdToName.put(70, "声控快门");
        sTriggerModeIdToName.put(80, "长按屏幕");
        sTriggerModeIdToName.put(90, "曝光环");
        sTriggerModeIdToName.put(100, "手势拍照");
        sPictureQualityIndexToName.put(0, "最低");
        sPictureQualityIndexToName.put(1, "更低");
        sPictureQualityIndexToName.put(2, "低");
        sPictureQualityIndexToName.put(3, "标准");
        sPictureQualityIndexToName.put(4, "高");
        sPictureQualityIndexToName.put(5, "更高");
        sPictureQualityIndexToName.put(6, "最高");
        sExposureTimeLessThan1sToName.put(0, "auto");
        sExposureTimeLessThan1sToName.put(1000, "1/1000s");
        sExposureTimeLessThan1sToName.put(2000, "1/500s");
        sExposureTimeLessThan1sToName.put(System.STATUS_BAR_UPDATE_NETWORK_SPEED_INTERVAL_DEFAULT, "1/250s");
        sExposureTimeLessThan1sToName.put(5000, "1/250s");
        sExposureTimeLessThan1sToName.put(BaseModule.LENS_DIRTY_DETECT_HINT_DURATION, "1/125s");
        sExposureTimeLessThan1sToName.put(16667, "1/60s");
        sExposureTimeLessThan1sToName.put(33333, "1/30s");
        sExposureTimeLessThan1sToName.put(66667, "1/15s");
        sExposureTimeLessThan1sToName.put(125000, "1/8s");
        sExposureTimeLessThan1sToName.put(250000, "1/4s");
        sExposureTimeLessThan1sToName.put(500000, "1/2s");
        sExposureTimeLessThan1sToName.put(1000000, "1s");
        sExposureTimeLessThan1sToName.put(2000000, "2s");
        sExposureTimeLessThan1sToName.put(4000000, "4s");
        sExposureTimeLessThan1sToName.put(8000000, "8s");
        sExposureTimeLessThan1sToName.put(16000000, "16s");
        sExposureTimeLessThan1sToName.put(32000000, "32s");
        sBeautyTypeToName.put(Type.WHITEN_STRENGTH.ordinal(), CameraStat.PARAM_BEAUTY_SKIN_COLOR);
        sBeautyTypeToName.put(Type.SHRINK_FACE_RATIO.ordinal(), CameraStat.PARAM_BEAUTY_SLIM_FACE);
        sBeautyTypeToName.put(Type.ENLARGE_EYE_RATIO.ordinal(), CameraStat.PARAM_BEAUTY_ENLARGE_EYE);
        sBeautyTypeToName.put(Type.SMOOTH_STRENGTH.ordinal(), CameraStat.PARAM_BEAUTY_SKIN_SMOOTH);
        sBeautyTypeToName.put(Type.NOSE_RATIO.ordinal(), CameraStat.PARAM_BEAUTY_NOSE);
        sBeautyTypeToName.put(Type.RISORIUS_RATIO.ordinal(), CameraStat.PARAM_BEAUTY_RISORIUS);
        sBeautyTypeToName.put(Type.LIPS_RATIO.ordinal(), CameraStat.PARAM_BEAUTY_LIPS);
        sBeautyTypeToName.put(Type.CHIN_RATIO.ordinal(), CameraStat.PARAM_BEAUTY_CHIN);
        sBeautyTypeToName.put(Type.NECK_RATIO.ordinal(), CameraStat.PARAM_BEAUTY_NECK);
        sBeautyTypeToName.put(Type.SMILE_RATIO.ordinal(), CameraStat.PARAM_BEAUTY_SMILE);
        sBeautyTypeToName.put(Type.SLIM_NOSE_RATIO.ordinal(), CameraStat.PARAM_BEAUTY_SLIM_NOSE);
        sFilterTypeToName.put(FilterType.N_BERRY.ordinal(), "浆果");
        sFilterTypeToName.put(FilterType.N_COOKIE.ordinal(), "曲奇");
        sFilterTypeToName.put(FilterType.N_DELICACY.ordinal(), "美味");
        sFilterTypeToName.put(FilterType.N_FADE.ordinal(), "褪色");
        sFilterTypeToName.put(FilterType.N_FILM.ordinal(), "胶片(拍照)");
        sFilterTypeToName.put(FilterType.N_KOIZORA.ordinal(), "恋空");
        sFilterTypeToName.put(FilterType.N_LATTE.ordinal(), "拿铁");
        sFilterTypeToName.put(FilterType.N_LIGHT.ordinal(), "浮光");
        sFilterTypeToName.put(FilterType.N_LIVELY.ordinal(), "生动");
        sFilterTypeToName.put(FilterType.N_QUIET.ordinal(), "静谧");
        sFilterTypeToName.put(FilterType.N_SODA.ordinal(), "汽水");
        sFilterTypeToName.put(FilterType.N_WARM.ordinal(), "暖阳");
        sFilterTypeToName.put(FilterType.B_FAIRYTALE.ordinal(), "童话");
        sFilterTypeToName.put(FilterType.B_JAPANESE.ordinal(), "日系");
        sFilterTypeToName.put(FilterType.B_MINT.ordinal(), "薄荷");
        sFilterTypeToName.put(FilterType.B_MOOD.ordinal(), "心境");
        sFilterTypeToName.put(FilterType.B_NATURE.ordinal(), "自然");
        sFilterTypeToName.put(FilterType.B_PINK.ordinal(), "粉嫩");
        sFilterTypeToName.put(FilterType.B_ROMANCE.ordinal(), "浪漫");
        sFilterTypeToName.put(FilterType.B_MAZE.ordinal(), "迷宫");
        sFilterTypeToName.put(FilterType.B_WHITEANDBLACK.ordinal(), "黑白(人像)");
        sFilterTypeToName.put(FilterType.S_FILM.ordinal(), "胶片(录像)");
        sFilterTypeToName.put(FilterType.S_YEARS.ordinal(), "那些年");
        sFilterTypeToName.put(FilterType.S_POLAROID.ordinal(), "拍立得");
        sFilterTypeToName.put(FilterType.S_FOREST.ordinal(), "小森林");
        sFilterTypeToName.put(FilterType.S_BYGONE.ordinal(), "往事");
        sFilterTypeToName.put(FilterType.S_WHITEANDBLACK.ordinal(), "黑白(录像)");
        sFilterTypeToName.put(FilterType.N_WHITEANDBLACK.ordinal(), "黑白(拍照)");
    }

    private static String filterIdToName(int i) {
        if (FilterInfo.FILTER_ID_NONE == i) {
            return "none";
        }
        String str;
        switch (FilterInfo.getCategory(i)) {
            case 1:
            case 2:
            case 3:
                str = (String) sFilterTypeToName.get(FilterInfo.getIndex(i));
                if (str != null) {
                    return str;
                }
                break;
        }
        str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("unexpected filter id: ");
        stringBuilder.append(Integer.toHexString(i));
        Log.e(str, stringBuilder.toString());
        return "none";
    }

    public static String modeIdToName(int i) {
        String str = (String) sCameraModeIdToName.get(i);
        if (str == null) {
            return "录像";
        }
        return str;
    }

    public static String slowMotionConfigToName(String str) {
        if (ComponentConfigSlowMotion.DATA_CONFIG_NEW_SLOW_MOTION_120.equals(str)) {
            return "点击至120";
        }
        if (ComponentConfigSlowMotion.DATA_CONFIG_NEW_SLOW_MOTION_240.equals(str)) {
            return "点击至240";
        }
        return "点击至960";
    }

    public static String cameraIdToName(boolean z) {
        return z ? CameraStat.VALUE_FRONT_CAMERA : CameraStat.VALUE_BACK_CAMERA;
    }

    private static String videoQualityToName(String str) {
        if (String.valueOf(8).equals(str)) {
            return "4k";
        }
        if (String.valueOf(6).equals(str)) {
            return "1080p";
        }
        if (String.valueOf(5).equals(str)) {
            return "720p";
        }
        if (String.valueOf(4).equals(str)) {
            return "480p";
        }
        String str2 = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("unexpected video quality: ");
        stringBuilder.append(str);
        Log.e(str2, stringBuilder.toString());
        return OTHERS;
    }

    public static String faceBeautyRatioToName(int i) {
        if (i == 0) {
            return "0";
        }
        return divideTo10Section(i);
    }

    private static String burstShotNumToName(int i) {
        return divideTo10Section(i);
    }

    private static String divideTo10Section(int i) {
        switch (i > 0 ? (i - 1) / 10 : 0) {
            case 0:
                return "1+";
            case 1:
                return "10+";
            case 2:
                return "20+";
            case 3:
                return "30+";
            case 4:
                return "40+";
            case 5:
                return "50+";
            case 6:
                return "60+";
            case 7:
                return "70+";
            case 8:
                return "80+";
            default:
                return "90+";
        }
    }

    private static String autoExposureToName(String str) {
        if (str != null) {
            Resources resources = CameraAppImpl.getAndroidContext().getResources();
            if (str.equals(resources.getString(R.string.pref_camera_autoexposure_value_frameaverage))) {
                return "平均测光";
            }
            if (str.equals(resources.getString(R.string.pref_camera_autoexposure_value_centerweighted))) {
                return "中心权重";
            }
            if (str.equals(resources.getString(R.string.pref_camera_autoexposure_value_spotmetering))) {
                return "中点测光";
            }
        }
        String str2 = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("unexpected auto exposure ");
        stringBuilder.append(str);
        Log.e(str2, stringBuilder.toString());
        return OTHERS;
    }

    private static String autoWhiteBalanceToName(String str) {
        if (str == null) {
            Log.e(TAG, "null awb");
            return OTHERS;
        }
        Object obj = -1;
        switch (str.hashCode()) {
            case -1081415738:
                if (str.equals("manual")) {
                    obj = null;
                    break;
                }
                break;
            case 49:
                if (str.equals("1")) {
                    obj = 1;
                    break;
                }
                break;
            case 50:
                if (str.equals("2")) {
                    obj = 2;
                    break;
                }
                break;
            case 51:
                if (str.equals("3")) {
                    obj = 3;
                    break;
                }
                break;
            case 53:
                if (str.equals("5")) {
                    obj = 4;
                    break;
                }
                break;
            case 54:
                if (str.equals("6")) {
                    obj = 5;
                    break;
                }
                break;
        }
        switch (obj) {
            case null:
                return str;
            case 1:
                return "auto";
            case 2:
                return "incandescent";
            case 3:
                return "fluorescent";
            case 4:
                return "daylight";
            case 5:
                return "cloudy-daylight";
            default:
                String str2 = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("unexpected awb ");
                stringBuilder.append(str);
                Log.e(str2, stringBuilder.toString());
                return OTHERS;
        }
    }

    private static String exposureTimeToName(String str) {
        String str2;
        StringBuilder stringBuilder;
        if (str != null) {
            try {
                int parseLong = (int) (Long.parseLong(str) / 1000);
                if (parseLong < 1000000) {
                    str2 = (String) sExposureTimeLessThan1sToName.get(parseLong);
                    if (str2 != null) {
                        return str2;
                    }
                }
                parseLong /= 1000000;
                stringBuilder = new StringBuilder();
                stringBuilder.append(parseLong);
                stringBuilder.append("s");
                return stringBuilder.toString();
            } catch (NumberFormatException e) {
                str2 = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("invalid exposure time ");
                stringBuilder.append(str);
                Log.e(str2, stringBuilder.toString());
            }
        }
        str2 = TAG;
        stringBuilder = new StringBuilder();
        stringBuilder.append("unexpected exposure time ");
        stringBuilder.append(str);
        Log.e(str2, stringBuilder.toString());
        return "auto";
    }

    private static String isoToName(String str) {
        if (str != null) {
            if ("auto".equalsIgnoreCase(str)) {
                return "auto";
            }
            if (str.toUpperCase(Locale.ENGLISH).indexOf("ISO") > -1) {
                return str.substring(3);
            }
        }
        return str;
    }

    private static String focusPositionToName(int i) {
        if (1000 == i) {
            return "auto";
        }
        return divideTo10Section((1000 - i) / 10);
    }

    private static String triggerModeToName(int i) {
        return (String) sTriggerModeIdToName.get(i);
    }

    private static String getDualZoomName(int i) {
        switch (i) {
            case 166:
            case 167:
                return ComponentManuallyDualLens.LENS_TELE.equals(CameraSettings.getCameraZoomMode(i)) ? CameraStat.ZOOM_2X : CameraStat.ZOOM_1X;
            default:
                return zoomRatioToName(CameraSettings.readZoom());
        }
    }

    private static String zoomRatioToName(float f) {
        if (1.0f == f) {
            return CameraStat.ZOOM_1X;
        }
        if (2.0f == f) {
            return CameraStat.ZOOM_2X;
        }
        int i = (int) (f * 10.0f);
        return String.format(Locale.US, "%.1fx", new Object[]{Float.valueOf(((float) i) / 10.0f)});
    }

    private static String contrastToName(String str) {
        return pictureQualityToName(R.array.pref_camera_contrast_entryvalues, str);
    }

    private static String saturationToName(String str) {
        return pictureQualityToName(R.array.pref_camera_saturation_entryvalues, str);
    }

    private static String sharpnessToName(String str) {
        return pictureQualityToName(R.array.pref_camera_sharpness_entryvalues, str);
    }

    private static String antiBandingToName(String str) {
        if (str == null) {
            Log.e(TAG, "null antiBanding");
            return OTHERS;
        }
        Object obj = -1;
        switch (str.hashCode()) {
            case 48:
                if (str.equals("0")) {
                    obj = null;
                    break;
                }
                break;
            case 49:
                if (str.equals("1")) {
                    obj = 1;
                    break;
                }
                break;
            case 50:
                if (str.equals("2")) {
                    obj = 2;
                    break;
                }
                break;
            case 51:
                if (str.equals("3")) {
                    obj = 3;
                    break;
                }
                break;
        }
        switch (obj) {
            case null:
                return "off";
            case 1:
                return "50hz";
            case 2:
                return "60hz";
            case 3:
                return "auto";
            default:
                String str2 = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("unexpected antiBanding ");
                stringBuilder.append(str);
                Log.e(str2, stringBuilder.toString());
                return OTHERS;
        }
    }

    private static String slowMotionQualityIdToName(String str) {
        if (str == null) {
            return OTHERS;
        }
        Object obj = -1;
        switch (str.hashCode()) {
            case 53:
                if (str.equals("5")) {
                    obj = null;
                    break;
                }
                break;
            case 54:
                if (str.equals("6")) {
                    obj = 1;
                    break;
                }
                break;
        }
        switch (obj) {
            case null:
                return "720p";
            case 1:
                return "1080p";
            default:
                return OTHERS;
        }
    }

    private static String pictureQualityToName(int i, String str) {
        String[] stringArray = CameraAppImpl.getAndroidContext().getResources().getStringArray(i);
        if (sPictureQualityIndexToName.size() >= stringArray.length) {
            int indexOfString = indexOfString(stringArray, str);
            if (indexOfString <= -1) {
                return OTHERS;
            }
            return (String) sPictureQualityIndexToName.get(indexOfString + ((sPictureQualityIndexToName.size() - stringArray.length) / 2));
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("picture quality array size is smaller than values size ");
        stringBuilder.append(str.length());
        throw new RuntimeException(stringBuilder.toString());
    }

    private static int indexOfString(String[] strArr, String str) {
        if (!(strArr == null || str == null)) {
            for (int i = 0; i < strArr.length; i++) {
                if (str.equals(strArr[i])) {
                    return i;
                }
            }
        }
        return -1;
    }

    private static String flashModeToName(String str) {
        if (str == null) {
            Log.e(TAG, "null flash mode");
            return OTHERS;
        }
        Object obj = -1;
        int hashCode = str.hashCode();
        if (hashCode != 48626) {
            if (hashCode != 48628) {
                switch (hashCode) {
                    case 48:
                        if (str.equals("0")) {
                            obj = 5;
                            break;
                        }
                        break;
                    case 49:
                        if (str.equals("1")) {
                            obj = 1;
                            break;
                        }
                        break;
                    case 50:
                        if (str.equals("2")) {
                            obj = 4;
                            break;
                        }
                        break;
                    case 51:
                        if (str.equals("3")) {
                            obj = null;
                            break;
                        }
                        break;
                }
            } else if (str.equals(ComponentConfigFlash.FLASH_VALUE_SCREEN_LIGHT_AUTO)) {
                obj = 2;
            }
        } else if (str.equals(ComponentConfigFlash.FLASH_VALUE_SCREEN_LIGHT_ON)) {
            obj = 3;
        }
        switch (obj) {
            case null:
                return "auto";
            case 1:
                return "on";
            case 2:
                return "screen-light-auto";
            case 3:
                return "screen-light-on";
            case 4:
                return "torch";
            case 5:
                return "off";
            default:
                String str2 = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("unexpected flash mode ");
                stringBuilder.append(str);
                Log.e(str2, stringBuilder.toString());
                return OTHERS;
        }
    }

    private static String addCameraSuffix(String str) {
        if (str == null) {
            return str;
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(str);
        stringBuilder.append("_");
        stringBuilder.append(CameraSettings.isFrontCamera() ? "front" : "back");
        return stringBuilder.toString();
    }

    public static void trackCameraError(String str) {
        Map hashMap = new HashMap();
        hashMap.put(CameraStat.PARAM_CAMERA_ID, CameraSettings.isFrontCamera() ? CameraStat.VALUE_FRONT_CAMERA : CameraStat.VALUE_BACK_CAMERA);
        hashMap.put("模式", modeIdToName(DataRepository.dataItemGlobal().getCurrentMode()));
        hashMap.put("error", str);
        CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_CAMERA_HARDWARE_ERROR, hashMap);
    }

    public static void trackCameraErrorDialogShow() {
        Map hashMap = new HashMap();
        hashMap.put(CameraStat.PARAM_CAMERA_ID, CameraSettings.isFrontCamera() ? CameraStat.VALUE_FRONT_CAMERA : CameraStat.VALUE_BACK_CAMERA);
        hashMap.put("模式", modeIdToName(DataRepository.dataItemGlobal().getCurrentMode()));
        CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_CAMERA_ERROR_DIALOG_SHOW, hashMap);
    }

    public static void trackBroadcastKillService() {
        Map hashMap = new HashMap();
        hashMap.put(CameraStat.PARAM_CAMERA_ID, CameraSettings.isFrontCamera() ? CameraStat.VALUE_FRONT_CAMERA : CameraStat.VALUE_BACK_CAMERA);
        hashMap.put("模式", modeIdToName(DataRepository.dataItemGlobal().getCurrentMode()));
        CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_CAMERA_BROADCAST_KILL_SERVICE, hashMap);
    }

    public static void trackZoomAdjusted(String str) {
        Map hashMap = new HashMap();
        hashMap.put(CameraStat.PARAM_CAMERA_ID, CameraSettings.isFrontCamera() ? CameraStat.VALUE_FRONT_CAMERA : CameraStat.VALUE_BACK_CAMERA);
        hashMap.put("模式", modeIdToName(DataRepository.dataItemGlobal().getCurrentMode()));
        hashMap.put("mode", str);
        CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_ZOOM_ADJUSTED, hashMap);
    }

    private static String timeLapseIntervalToName(int i) {
        if (i < 1000) {
            return String.format(Locale.ENGLISH, "%.2fs", new Object[]{Float.valueOf(((float) i) / 1000.0f)});
        }
        return String.format(Locale.ENGLISH, "%ds", new Object[]{Integer.valueOf(i / 1000)});
    }

    public static void track(String str, String str2, String... strArr) {
        int i = 0;
        Util.Assert(strArr.length % 2 == 0);
        Map hashMap = new HashMap();
        while (i < strArr.length) {
            hashMap.put(strArr[i], strArr[i + 1]);
            i += 2;
        }
        CameraStat.recordCountEvent(str, str2, hashMap);
    }

    public static void trackTakePictureCost(long j, boolean z, int i) {
        Map hashMap = new HashMap();
        hashMap.put(CameraStat.PARAM_CAMERA_ID, z ? CameraStat.VALUE_FRONT_CAMERA : CameraStat.VALUE_BACK_CAMERA);
        hashMap.put("模式", modeIdToName(i));
        CameraStat.recordCalculateEvent(CameraStat.CATEGORY_CAMERA, CameraStat.KEY_TAKE_PICTURE_COST, round(j, 50), hashMap);
    }

    private static long round(long j, int i) {
        if (i <= 0) {
            return j;
        }
        long j2 = (long) i;
        return ((j + ((long) (i / 2))) / j2) * j2;
    }

    public static void trackStartAppCost(long j) {
        if (j < 0 || j > FunctionParseBeautyBodySlimCount.TIP_INTERVAL_TIME) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("The time cost when start app is illegal: ");
            stringBuilder.append(j);
            throw new IllegalArgumentException(stringBuilder.toString());
        }
        CameraStat.recordCalculateEvent(CameraStat.CATEGORY_CAMERA, CameraStat.KEY_START_APP_COST, round(j, 50));
    }

    public static void trackGeneralInfo(int i, boolean z, int i2, int i3, boolean z2, MutexModeManager mutexModeManager, String str) {
        DataItemRunning dataItemRunning = DataRepository.dataItemRunning();
        DataItemConfig dataItemConfig = DataRepository.dataItemConfig();
        Map hashMap = new HashMap();
        hashMap.put("模式", modeIdToName(i2));
        String str2 = CameraStat.PARAM_GROUP_SHOT;
        Object obj = (z || !CameraSettings.isGroupShotOn()) ? "off" : "on";
        hashMap.put(str2, obj);
        hashMap.put(CameraStat.PARAM_TRIGGER_MODE, triggerModeToName(i3));
        Object obj2 = "0";
        if (!z) {
            ComponentRunningTimer componentRunningTimer = dataItemRunning.getComponentRunningTimer();
            if (componentRunningTimer != null) {
                obj2 = componentRunningTimer.getComponentValue(i2);
            }
        }
        hashMap.put(CameraStat.PARAM_TIMER, obj2);
        String str3 = "0";
        ComponentConfigFlash componentFlash = dataItemConfig.getComponentFlash();
        if (componentFlash != null) {
            str3 = componentFlash.getComponentValue(i2);
            if (z && !"2".equals(str3)) {
                str3 = "0";
            }
        }
        if (str != null) {
            hashMap.put(CameraStat.PARAM_FLASH_MODE, str);
        } else {
            hashMap.put(CameraStat.PARAM_FLASH_MODE, flashModeToName(str3));
        }
        hashMap.put(CameraStat.PARAM_FILTER, z ? "none" : filterIdToName(EffectController.getInstance().getEffectForSaving(false)));
        if (z2) {
            hashMap.put(CameraStat.PARAM_GENDER_AGE, CameraSettings.showGenderAge() ? "on" : "off");
            hashMap.put(CameraStat.PARAM_MAGIC_MIRROR, CameraSettings.isMagicMirrorOn() ? "on" : "off");
            CameraStat.recordCalculateEvent(CameraStat.CATEGORY_CAMERA, CameraStat.KEY_FRONT_CAMERA_INFO, (long) i, hashMap);
            return;
        }
        str3 = CameraStat.PARAM_TILTSHIFT;
        Object componentValue = (z || !CameraSettings.isTiltShiftOn()) ? "off" : dataItemRunning.getComponentRunningTiltValue().getComponentValue(i2);
        hashMap.put(str3, componentValue);
        str3 = CameraStat.PARAM_GRADIENTER;
        componentValue = (z || !CameraSettings.isGradienterOn()) ? "off" : "on";
        hashMap.put(str3, componentValue);
        str3 = CameraStat.PARAM_HHT;
        componentValue = (z || mutexModeManager == null || !mutexModeManager.isHandNight()) ? "off" : "on";
        hashMap.put(str3, componentValue);
        obj2 = "off";
        if (!(z || mutexModeManager == null)) {
            z2 = mutexModeManager.isHdr();
            ComponentConfigHdr componentHdr = dataItemConfig.getComponentHdr();
            if (componentHdr != null && "auto".equals(componentHdr.getComponentValue(i2))) {
                obj2 = z2 ? AUTO_ON : AUTO_OFF;
            } else if (z2) {
                obj2 = "on";
            }
        }
        hashMap.put(CameraStat.PARAM_HDR, obj2);
        str3 = CameraStat.PARAM_SUPER_RESOLUTION;
        Object obj3 = (z || mutexModeManager == null || !mutexModeManager.isSuperResolution()) ? "off" : "on";
        hashMap.put(str3, obj3);
        hashMap.put(CameraStat.PARAM_ZOOM, getDualZoomName(i2));
        CameraStat.recordCalculateEvent(CameraStat.CATEGORY_CAMERA, CameraStat.KEY_BACK_CAMERA_INFO, (long) i, hashMap);
    }

    public static void trackPictureTaken(int i, boolean z, int i2, boolean z2, boolean z3, String str) {
        Map hashMap = new HashMap();
        hashMap.put(CameraStat.PARAM_CAMERA_ID, z2 ? CameraStat.VALUE_FRONT_CAMERA : CameraStat.VALUE_BACK_CAMERA);
        hashMap.put(CameraStat.PARAM_PICTURE_RATIO, 165 == i2 ? "1x1" : CameraSettings.getPictureSizeRatioString("4x3"));
        hashMap.put(CameraStat.PARAM_QUALITY, CameraSettings.getJpegQuality(z));
        hashMap.put(CameraStat.PARAM_TIME_WATERMARK, CameraSettings.isTimeWaterMarkOpen() ? "on" : "off");
        hashMap.put(CameraStat.PARAM_DUAL_WATERMARK, CameraSettings.isDualCameraWaterMarkOpen() ? "on" : "off");
        String str2 = CameraStat.PARAM_LOCATION;
        Object obj = z3 ? CameraStat.LOCATION_WITH : CameraSettings.isRecordLocation() ? CameraStat.LOCATION_WITHOUT : CameraStat.LOCATION_CLOSED;
        hashMap.put(str2, obj);
        if (str != null) {
            hashMap.put(CameraStat.PARAM_AI_SCENE_DETECTED, str);
        }
        if (i2 == 171 && !z2) {
            hashMap.put(CameraStat.PARAM_LIGHTING, String.valueOf(CameraSettings.getPortraitLightingPattern()));
        }
        CameraStat.recordCalculateEvent(CameraStat.CATEGORY_CAMERA, CameraStat.KEY_PICTURE_TAKEN, (long) i, hashMap);
        if (z) {
            if (CameraSettings.isPressDownCapture() && i > 1) {
                i--;
            }
            Map hashMap2 = new HashMap();
            hashMap2.put("张数", burstShotNumToName(i));
            CameraStat.recordCalculateEvent(CameraStat.CATEGORY_CAMERA, CameraStat.KEY_PICTURE_TAKEN_BURST, (long) i, hashMap2);
            CameraStat.recordCountEvent(CameraStat.CATEGORY_CAMERA, CameraStat.KEY_BURST_SHOT_TIMES, hashMap2);
        }
    }

    public static void trackGotoSettings(int i) {
        Map hashMap = new HashMap();
        hashMap.put("模式", modeIdToName(i));
        CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_GOTO_SETTINGS, hashMap);
    }

    public static void trackGotoGallery(int i) {
        Map hashMap = new HashMap();
        hashMap.put("模式", modeIdToName(i));
        CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_GOTO_GALLERY, hashMap);
    }

    public static void trackVideoSnapshot(boolean z) {
        Map hashMap = new HashMap();
        hashMap.put(CameraStat.PARAM_CAMERA_ID, z ? CameraStat.VALUE_FRONT_CAMERA : CameraStat.VALUE_BACK_CAMERA);
        CameraStat.recordCountEvent(CameraStat.CATEGORY_CAMERA, CameraStat.KEY_VIDEO_SNAPSHOT, hashMap);
    }

    public static void trackPauseVideoRecording(boolean z) {
        Map hashMap = new HashMap();
        hashMap.put(CameraStat.PARAM_CAMERA_ID, z ? CameraStat.VALUE_FRONT_CAMERA : CameraStat.VALUE_BACK_CAMERA);
        CameraStat.recordCountEvent(CameraStat.CATEGORY_CAMERA, CameraStat.KEY_VIDEO_PAUSE_RECORDING, hashMap);
    }

    public static void trackVideoRecorded(boolean z, String str, int i, int i2, int i3, int i4, BeautyValues beautyValues, long j) {
        Map hashMap = new HashMap();
        hashMap.put(CameraStat.PARAM_CAMERA_ID, z ? CameraStat.VALUE_FRONT_CAMERA : CameraStat.VALUE_BACK_CAMERA);
        hashMap.put("模式", str);
        String str2 = CameraStat.PARAM_QUALITY;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("");
        stringBuilder.append(i);
        hashMap.put(str2, videoQualityToName(stringBuilder.toString()));
        hashMap.put(CameraStat.PARAM_FLASH_MODE, i2 == 2 ? "torch" : "off");
        hashMap.put(CameraStat.PARAM_VIDEO_FPS, String.valueOf(i3));
        if (beautyValues != null) {
            hashMap.put(CameraStat.PARAM_BEAUTY_LEVEL, String.valueOf(CameraSettings.intelligentValueToBeautyLevel(beautyValues.mBeautyLevel)));
        }
        hashMap.put(CameraStat.PARAM_VIDEO_TIME, String.valueOf(j));
        CameraStat.recordCountEvent(CameraStat.CATEGORY_CAMERA, CameraStat.KEY_VIDEO_TAKEN, hashMap);
        if (i4 > 0 && CameraSettings.VIDEO_SPEED_FAST.equals(str)) {
            Map hashMap2 = new HashMap();
            hashMap2.put("间隔", timeLapseIntervalToName(i4));
            CameraStat.recordCountEvent(CameraStat.CATEGORY_CAMERA, CameraStat.KEY_VIDEO_TIME_LAPSE_INTERVAL, hashMap2);
        }
    }

    public static void trackNewSlowMotionVideoRecorded(String str, int i, int i2, int i3, long j) {
        Map hashMap = new HashMap();
        hashMap.put(CameraStat.PARAM_CAMERA_ID, CameraStat.VALUE_BACK_CAMERA);
        hashMap.put("模式", str);
        hashMap.put(CameraStat.PARAM_QUALITY, slowMotionQualityIdToName(String.valueOf(i)));
        hashMap.put(CameraStat.PARAM_FLASH_MODE, i2 == 2 ? "torch" : "off");
        hashMap.put(CameraStat.PARAM_VIDEO_FPS, String.valueOf(i3));
        hashMap.put(CameraStat.PARAM_VIDEO_TIME, String.valueOf(j));
        CameraStat.recordCountEvent(CameraStat.CATEGORY_CAMERA, CameraStat.KEY_VIDEO_TAKEN, hashMap);
    }

    public static void trackEvAdjusted() {
        Map hashMap = new HashMap(2);
        hashMap.put(CameraStat.PARAM_CAMERA_ID, CameraSettings.isFrontCamera() ? CameraStat.VALUE_FRONT_CAMERA : CameraStat.VALUE_BACK_CAMERA);
        hashMap.put("模式", modeIdToName(DataRepository.dataItemGlobal().getCurrentMode()));
        CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_EV_ADJUSTED, hashMap);
    }

    public static void trackPocketModeEnter(String str) {
        track(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_POCKET_MODE_ENTER, CameraStat.PARAM_COMMON_MODE, str);
    }

    public static void trackPocketModeExit(String str) {
        track(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_POCKET_MODE_KEYGUARD_EXIT, CameraStat.PARAM_COMMON_MODE, str);
    }

    public static void trackPocketModeSensorDelay() {
        CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_POCKET_MODE_SENSOR_DELAY);
    }

    public static void trackDualZoomChanged(int i, String str) {
        if (!CameraStat.isCounterEventDisabled()) {
            Map hashMap = new HashMap();
            hashMap.put("模式", modeIdToName(i));
            hashMap.put(CameraStat.PARAM_ZOOM, str);
            CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_DUAL_ZOOM_CHANGED, hashMap);
        }
    }

    public static void trackFilterChanged(int i, int i2, boolean z) {
        if (!CameraStat.isCounterEventDisabled()) {
            Map hashMap = new HashMap();
            hashMap.put("模式", modeIdToName(i));
            hashMap.put(CameraStat.PARAM_FILTER, filterIdToName(i2));
            hashMap.put(CameraStat.PARAM_COMMON_MODE, z ? CameraStat.SWITCH_MODE_CLICK : CameraStat.SWITCH_MODE_SLIDE);
            CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_FILTER_CHANGED, hashMap);
        }
    }

    public static void trackFlashChanged(int i, String str) {
        if (!CameraStat.isCounterEventDisabled()) {
            Map hashMap = new HashMap();
            hashMap.put("模式", modeIdToName(i));
            hashMap.put(CameraStat.PARAM_FLASH_MODE, flashModeToName(str));
            CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_FLASH_CHANGED, hashMap);
        }
    }

    public static void trackHdrChanged(int i, String str) {
        if (!CameraStat.isCounterEventDisabled()) {
            Map hashMap = new HashMap();
            hashMap.put("模式", modeIdToName(i));
            hashMap.put(CameraStat.PARAM_HDR, str);
            CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_HDR_CHANGED, hashMap);
        }
    }

    public static void trackConfigChange(String str, String str2, boolean z, boolean z2, boolean z3) {
        if (!CameraStat.isCounterEventDisabled()) {
            Map hashMap = new HashMap();
            if (z2) {
                hashMap.put("模式", modeIdToName(DataRepository.dataItemGlobal().getCurrentMode()));
            }
            if (z3) {
                hashMap.put(CameraStat.PARAM_CAMERA_ID, CameraSettings.isFrontCamera() ? CameraStat.VALUE_FRONT_CAMERA : CameraStat.VALUE_BACK_CAMERA);
            }
            hashMap.put(str2, z ? "on" : "off");
            CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, str, hashMap);
        }
    }

    public static void trackBeautySwitchChanged(int i, String str) {
        if (!CameraStat.isCounterEventDisabled()) {
            Map hashMap = new HashMap();
            hashMap.put("模式", modeIdToName(i));
            hashMap.put(CameraStat.PARAM_CAMERA_ID, CameraSettings.isFrontCamera() ? CameraStat.VALUE_FRONT_CAMERA : CameraStat.VALUE_BACK_CAMERA);
            hashMap.put(CameraStat.PARAM_BEAUTY_LEVEL, String.valueOf(CameraSettings.intelligentValueToBeautyLevel(str)));
            CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_BEAUTY_SWITCH_CHANGED, hashMap);
        }
    }

    public static void trackDualWaterMarkChanged(boolean z) {
        CameraStat.recordStringPropertyEvent(CameraStat.CATEGORY_SETTINGS, "pref_dualcamera_watermark", z ? "on" : "off");
    }

    public static void trackVideoModeChanged(String str) {
        if (!CameraStat.isCounterEventDisabled()) {
            Map hashMap = new HashMap();
            hashMap.put("模式", str);
            CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_VIDEO_MODE_CHANGED, hashMap);
        }
    }

    public static void trackTimerChanged(String str) {
        if (!CameraStat.isCounterEventDisabled()) {
            Map hashMap = new HashMap();
            hashMap.put("模式", modeIdToName(DataRepository.dataItemGlobal().getCurrentMode()));
            hashMap.put(CameraStat.PARAM_CAMERA_ID, CameraSettings.isFrontCamera() ? CameraStat.VALUE_FRONT_CAMERA : CameraStat.VALUE_BACK_CAMERA);
            hashMap.put(CameraStat.PARAM_TIMER, str);
            CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_TIMER_CHANGED, hashMap);
        }
    }

    public static void trackTiltShiftChanged(String str) {
        if (!CameraStat.isCounterEventDisabled()) {
            Map hashMap = new HashMap();
            hashMap.put("模式", modeIdToName(DataRepository.dataItemGlobal().getCurrentMode()));
            hashMap.put(CameraStat.PARAM_TILTSHIFT, str);
            CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_TILTSHIFT_CHANGED, hashMap);
        }
    }

    public static void trackAISceneChanged(int i, int i2, Resources resources) {
        if (!CameraStat.isCounterEventDisabled()) {
            Object obj = "未知";
            TypedArray obtainTypedArray = resources.obtainTypedArray(R.array.ai_scene_names);
            if (i2 >= 0 && i2 < obtainTypedArray.length()) {
                obj = obtainTypedArray.getString(i2);
            }
            obtainTypedArray.recycle();
            Map hashMap = new HashMap();
            hashMap.put("模式", modeIdToName(i));
            hashMap.put(CameraStat.PARAM_AI_SCENE_DETECTED, obj);
            CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_AI_SCENE_CHANGED, hashMap);
        }
    }

    public static void trackLightingChanged(int i, String str) {
        if (!CameraStat.isCounterEventDisabled()) {
            Map hashMap = new HashMap();
            hashMap.put("模式", modeIdToName(i));
            hashMap.put(CameraStat.PARAM_LIGHTING, str);
            CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_LIGHTING_CHANGED, hashMap);
        }
    }

    public static void trackFocusPositionChanged(int i) {
        if (!CameraStat.isCounterEventDisabled()) {
            Map hashMap = new HashMap();
            hashMap.put(CameraStat.PARAM_FOCUS_POSITION, focusPositionToName(i));
            CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_MANUAL_FOCUS_POSITION_CHANGED, hashMap);
        }
    }

    public static void trackDirectionChanged(int i) {
        if (!CameraStat.isCounterEventDisabled()) {
            Map hashMap = new HashMap();
            hashMap.put(CameraStat.PARAM_PANORAMA_DIRECTION, 3 == i ? CameraStat.PANORAMA_DIRECTION_L2R : CameraStat.PANORAMA_DIRECTION_R2L);
            CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_PANORAMA_DIRECTION_CHANGED, hashMap);
        }
    }

    public static void trackAwbChanged(String str) {
        if (!CameraStat.isCounterEventDisabled()) {
            Map hashMap = new HashMap();
            hashMap.put(CameraStat.PARAM_AWB, autoWhiteBalanceToName(str));
            CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_MANUAL_AWB_CHANGED, hashMap);
        }
    }

    public static void trackExposureTimeChanged(String str) {
        if (!CameraStat.isCounterEventDisabled()) {
            Map hashMap = new HashMap();
            hashMap.put(CameraStat.PARAM_ET, exposureTimeToName(str));
            CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_MANUAL_EXPOSURE_TIME_CHANGED, hashMap);
        }
    }

    public static void trackIsoChanged(String str) {
        if (!CameraStat.isCounterEventDisabled()) {
            Map hashMap = new HashMap();
            hashMap.put(CameraStat.PARAM_ISO, isoToName(str));
            CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_MANUAL_ISO_CHANGED, hashMap);
        }
    }

    public static void trackLensChanged(String str) {
        if (!CameraStat.isCounterEventDisabled()) {
            Map hashMap = new HashMap();
            hashMap.put(CameraStat.PARAM_LENS, str);
            CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_MANUAL_LENS_CHANGED, hashMap);
        }
    }

    public static void trackPictureTakenInPanorama(int i) {
        Map hashMap = new HashMap();
        hashMap.put(CameraStat.PARAM_PANORAMA_DIRECTION, 3 == CameraSettings.getPanoramaMoveDirection() ? CameraStat.PANORAMA_DIRECTION_L2R : CameraStat.PANORAMA_DIRECTION_R2L);
        CameraStat.recordCalculateEvent(CameraStat.CATEGORY_CAMERA, CameraStat.KEY_PICTURE_TAKEN_PANORAMA, (long) i, hashMap);
    }

    public static void trackPictureTakenInManual(int i, String str, String str2, String str3, int i2) {
        Map hashMap = new HashMap();
        hashMap.put(CameraStat.PARAM_AWB, autoWhiteBalanceToName(str));
        hashMap.put(CameraStat.PARAM_FOCUS_POSITION, focusPositionToName(CameraSettings.getFocusPosition()));
        hashMap.put(CameraStat.PARAM_ET, exposureTimeToName(str2));
        hashMap.put(CameraStat.PARAM_ISO, isoToName(str3));
        hashMap.put(CameraStat.PARAM_LENS, CameraSettings.getCameraZoomMode(i2));
        hashMap.put(CameraStat.PARAM_FOCUS_PEAK, EffectController.getInstance().isNeedDrawPeaking() ? "on" : "off");
        hashMap.put(CameraStat.PARAM_ZOOM, zoomRatioToName(CameraSettings.readZoom()));
        CameraStat.recordCalculateEvent(CameraStat.CATEGORY_CAMERA, CameraStat.KEY_PICTURE_TAKEN_MANUAL, (long) i, hashMap);
    }

    public static void trackBeautyInfo(int i, String str, BeautyValues beautyValues) {
        Map hashMap = new HashMap();
        hashMap.put(CameraStat.PARAM_CAMERA_ID, str);
        if (b.hL()) {
            for (Type type : BeautyParameters.getInstance().getAdjustableTypes()) {
                String str2 = (String) sBeautyTypeToName.get(type.ordinal());
                if (str2 != null) {
                    hashMap.put(str2, faceBeautyRatioToName(beautyValues.get(type)));
                }
            }
        } else {
            hashMap.put(CameraStat.PARAM_BEAUTY_SLIM_FACE, faceBeautyRatioToName(beautyValues.mBeautySlimFace));
            hashMap.put(CameraStat.PARAM_BEAUTY_ENLARGE_EYE, faceBeautyRatioToName(beautyValues.mBeautyEnlargeEye));
            hashMap.put(CameraStat.PARAM_BEAUTY_SKIN_COLOR, faceBeautyRatioToName(beautyValues.mBeautySkinColor));
            hashMap.put(CameraStat.PARAM_BEAUTY_SKIN_SMOOTH, faceBeautyRatioToName(beautyValues.mBeautySkinSmooth));
        }
        if (b.hA()) {
            Object obj;
            str = CameraStat.PARAM_BEAUTY_LEVEL;
            if (CameraSettings.isAdvancedBeautyOn()) {
                obj = "advanced";
            } else {
                obj = String.valueOf(CameraSettings.intelligentValueToBeautyLevel(beautyValues.mBeautyLevel));
            }
            hashMap.put(str, obj);
            CameraStat.recordCalculateEvent(CameraStat.CATEGORY_CAMERA, CameraStat.KEY_PICTURE_TAKEN_BEAUTY_LEGACY, (long) i, hashMap);
            return;
        }
        hashMap.put(CameraStat.PARAM_BEAUTY_LEVEL, String.valueOf(CameraSettings.intelligentValueToBeautyLevel(beautyValues.mBeautyLevel)));
        CameraStat.recordCalculateEvent(CameraStat.CATEGORY_CAMERA, CameraStat.KEY_PICTURE_TAKEN_BEAUTY, (long) i, hashMap);
    }

    public static void trackVoiceControl(Intent intent) {
        if (intent != null) {
            boolean isUseFrontCamera;
            Map hashMap = new HashMap();
            Object obj = null;
            try {
                isUseFrontCamera = CameraIntentManager.getInstance(intent).isUseFrontCamera();
            } catch (Exception e) {
                isUseFrontCamera = false;
            }
            if (isUseFrontCamera) {
                obj = 1;
            }
            int cameraModeId = CameraIntentManager.getInstance(intent).getCameraModeId();
            hashMap.put(CameraStat.PARAM_CAMERA_ID, obj == null ? CameraStat.VALUE_BACK_CAMERA : CameraStat.VALUE_FRONT_CAMERA);
            hashMap.put("模式", modeIdToName(cameraModeId));
            CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_CALL_CAMERA_FROM_VOICE_CONTROL, hashMap);
        }
    }

    public static void trackSnapInfo(boolean z) {
        Map hashMap = new HashMap();
        hashMap.put("mode", z ? "video" : "photo");
        CameraStat.recordCountEvent(CameraStat.CATEGORY_CAMERA, CameraStat.KEY_SNAP_CAMERA, hashMap);
    }

    public static void trackPreferenceChange(String str, Object obj) {
        if (str != null) {
            String valueOf = obj instanceof Boolean ? ((Boolean) obj).booleanValue() ? "on" : "off" : String.valueOf(obj);
            Object obj2 = -1;
            switch (str.hashCode()) {
                case -1871644511:
                    if (str.equals("pref_camera_picturesize_key")) {
                        obj2 = 3;
                        break;
                    }
                    break;
                case -885525953:
                    if (str.equals(CameraSettings.KEY_VIDEO_QUALITY)) {
                        obj2 = null;
                        break;
                    }
                    break;
                case -633328171:
                    if (str.equals(CameraSettings.KEY_VIDEO_NEW_SLOW_MOTION)) {
                        obj2 = 10;
                        break;
                    }
                    break;
                case -302378757:
                    if (str.equals(CameraSettings.KEY_QC_SATURATION)) {
                        obj2 = 7;
                        break;
                    }
                    break;
                case -33912691:
                    if (str.equals(CameraSettings.KEY_ANTIBANDING)) {
                        obj2 = 9;
                        break;
                    }
                    break;
                case 549001748:
                    if (str.equals(CameraSettings.KEY_AUTOEXPOSURE)) {
                        obj2 = 5;
                        break;
                    }
                    break;
                case 865415668:
                    if (str.equals(CameraSettings.KEY_VIDEO_HIGH_FRAME_RATE)) {
                        obj2 = 4;
                        break;
                    }
                    break;
                case 936502456:
                    if (str.equals(CameraSettings.KEY_QC_SHARPNESS)) {
                        obj2 = 8;
                        break;
                    }
                    break;
                case 966436379:
                    if (str.equals(CameraSettings.KEY_VIDEO_TIME_LAPSE_FRAME_INTERVAL)) {
                        obj2 = 1;
                        break;
                    }
                    break;
                case 1907727979:
                    if (str.equals(CameraSettings.KEY_QC_CONTRAST)) {
                        obj2 = 6;
                        break;
                    }
                    break;
                case 1934228025:
                    if (str.equals(CameraSettings.KEY_JPEG_QUALITY)) {
                        obj2 = 2;
                        break;
                    }
                    break;
            }
            switch (obj2) {
                case null:
                    str = addCameraSuffix(str);
                    valueOf = videoQualityToName(valueOf);
                    break;
                case 1:
                    try {
                        valueOf = timeLapseIntervalToName(Integer.parseInt(valueOf));
                        break;
                    } catch (NumberFormatException e) {
                        String str2 = TAG;
                        StringBuilder stringBuilder = new StringBuilder();
                        stringBuilder.append("invalid interval ");
                        stringBuilder.append(valueOf);
                        Log.e(str2, stringBuilder.toString());
                        break;
                    }
                case 2:
                    str = addCameraSuffix(str);
                    break;
                case 3:
                    str = addCameraSuffix(str);
                    break;
                case 4:
                    str = addCameraSuffix(str);
                    break;
                case 5:
                    valueOf = autoExposureToName(valueOf);
                    break;
                case 6:
                    valueOf = contrastToName(valueOf);
                    break;
                case 7:
                    valueOf = saturationToName(valueOf);
                    break;
                case 8:
                    valueOf = sharpnessToName(valueOf);
                    break;
                case 9:
                    valueOf = antiBandingToName(valueOf);
                    break;
                case 10:
                    valueOf = slowMotionQualityIdToName(valueOf);
                    break;
            }
            CameraStat.recordStringPropertyEvent(CameraStat.CATEGORY_SETTINGS, str, valueOf);
        }
    }

    public static void trackLiveRecordingParams(boolean z, String str, boolean z2, String str2, boolean z3, String str3, String str4, boolean z4, float f, float f2, float f3, int i, boolean z5) {
        if (!CameraStat.isCounterEventDisabled()) {
            Map hashMap = new HashMap();
            hashMap.put(CameraStat.PARAM_LIVE_MUSIC_ON, z ? "on" : "off");
            if (z) {
                hashMap.put(CameraStat.PARAM_LIVE_MUSIC_NAME, str);
            }
            hashMap.put(CameraStat.PARAM_LIVE_FILTER_SEGMENT_ON, z2 ? "on" : "off");
            if (z2) {
                hashMap.put(CameraStat.PARAM_LIVE_FILTER_NAME, str2);
            }
            hashMap.put(CameraStat.PARAM_LIVE_STICKER_SEGMENT_ON, z3 ? "on" : "off");
            if (z3) {
                hashMap.put(CameraStat.PARAM_LIVE_STICKER_NAME, str3);
            }
            hashMap.put(CameraStat.PARAM_LIVE_SPEED_LEVEL, str4);
            hashMap.put(CameraStat.PARAM_LIVE_BEAUTY_SEGMENT_ON, z4 ? "on" : "off");
            hashMap.put(CameraStat.PARAM_LIVE_SHRINK_FACE_RATIO, Float.toString(f));
            hashMap.put(CameraStat.PARAM_LIVE_ENLARGE_EYE_RATIO, Float.toString(f2));
            hashMap.put(CameraStat.PARAM_LIVE_SMOOTH_RATIO, Float.toString(f3));
            hashMap.put(CameraStat.PARAM_CAMERA_ID, cameraIdToName(z5));
            String str5 = CameraStat.PARAM_QUALITY;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("");
            stringBuilder.append(i);
            hashMap.put(str5, videoQualityToName(stringBuilder.toString()));
            CameraStat.recordCountEvent(CameraStat.CATEGORY_CAMERA, CameraStat.KEY_LIVE_VIDEO, hashMap);
        }
    }

    public static void trackLiveVideoParams(int i, float f, boolean z, boolean z2, boolean z3) {
        if (!CameraStat.isCounterEventDisabled()) {
            Map hashMap = new HashMap();
            hashMap.put(CameraStat.PARAM_LIVE_FILTER_ON, z ? "on" : "off");
            hashMap.put(CameraStat.PARAM_LIVE_STICKER_ON, z2 ? "on" : "off");
            hashMap.put(CameraStat.PARAM_LIVE_BEAUTY_ON, z3 ? "on" : "off");
            hashMap.put(CameraStat.PARAM_LIVE_RECORD_SEGMENTS, Integer.toString(i));
            hashMap.put(CameraStat.PARAM_LIVE_RECORD_TIME, Integer.toString((int) f));
            CameraStat.recordCountEvent(CameraStat.CATEGORY_CAMERA, CameraStat.KEY_LIVE_VIDEO, hashMap);
        }
    }

    public static void trackLiveMusicClickCount() {
        if (!CameraStat.isCounterEventDisabled()) {
            CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.PARAM_LIVE_MUSIC_ICON_CLICK);
        }
    }

    public static void trackLiveClick(String str) {
        if (!CameraStat.isCounterEventDisabled()) {
            CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, str);
        }
    }
}
