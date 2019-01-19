package com.ss.android.vesdk.runtime.cloudconfig;

import android.content.Context;
import android.content.SharedPreferences.Editor;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Build.VERSION;
import android.support.annotation.RestrictTo;
import android.support.annotation.RestrictTo.Scope;
import android.text.TextUtils;
import android.util.Log;
import com.ss.android.vesdk.runtime.VERuntime;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import org.json.JSONException;
import org.json.JSONObject;

public class PerformanceConfig {
    public static final String BASE_URL_CHINA = "https://effect.snssdk.com/devicehub/getSettings?";
    public static final String BASE_URL_SINGAPORE = "https://sg-effect.byteoversea.com/devicehub/getSetting?";
    public static final String BASE_URL_TEST = "https://effect.snssdk.com/devicehub/getSettings/?";
    public static final String BASE_URL_US = "https://va-effect.byteoversea.com/devicehub/getSettings?";
    public static final int DISABLE = 2;
    public static final int ENABLE = 1;
    public static final String KEY_I_EARPHONE_ECHO_AAUDIO = "earphone_echo_aaudio";
    public static final String KEY_I_EARPHONE_ECHO_HUAWEI = "earphone_echo_huawei";
    public static final String KEY_I_EARPHONE_ECHO_NORMAL = "earphone_echo_normal";
    public static final String KEY_I_IMPORT_ENCODE_MODE = "import_encode_mode";
    public static final String KEY_I_IMPORT_HW_BITRATE_MODE = "import_hw_bitrate_mode";
    public static final String KEY_I_IMPORT_HW_PROFILE = "import_hw_profile";
    public static final String KEY_I_IMPORT_SHORTER_PIXELS = "import_shorter_pixels";
    public static final String KEY_I_IMPORT_SW_BITRATE_MODE = "import_sw_bitrate_mode";
    public static final String KEY_I_IMPORT_VIDEO_HW_BITRATE = "import_video_hw_bitrate";
    public static final String KEY_I_IMPORT_VIDEO_SW_CRF = "import_video_sw_crf";
    public static final String KEY_I_IMPORT_VIDEO_SW_GOP = "import_video_sw_gop";
    public static final String KEY_I_IMPORT_VIDEO_SW_MAXRATE = "import_video_sw_maxrate";
    public static final String KEY_I_IMPORT_VIDEO_SW_PRESET = "import_video_sw_preset";
    public static final String KEY_I_IMPORT_VIDEO_SW_QP = "import_video_sw_qp";
    public static final String KEY_I_RECORD_CAMERA_COMPAT_LEVEL = "record_camera_compat_level";
    public static final String KEY_I_RECORD_CAMERA_TYPE = "record_camera_type";
    public static final String KEY_I_RECORD_ENCODE_MODE = "record_encode_mode";
    public static final String KEY_I_RECORD_HW_BITRATE_MODE = "record_hw_bitrate_mode";
    public static final String KEY_I_RECORD_HW_PROFILE = "record_hw_profile";
    public static final String KEY_I_RECORD_RESOLUTION_HEIGHT = "record_resolution_height";
    public static final String KEY_I_RECORD_RESOLUTION_WIDTH = "record_resolution_width";
    public static final String KEY_I_RECORD_SW_BITRATE_MODE = "record_sw_bitrate_mode";
    public static final String KEY_I_RECORD_VIDEO_HW_BITRATE = "record_video_hw_bitrate";
    public static final String KEY_I_RECORD_VIDEO_SW_CRF = "record_video_sw_crf";
    public static final String KEY_I_RECORD_VIDEO_SW_GOP = "record_video_sw_gop";
    public static final String KEY_I_RECORD_VIDEO_SW_MAXRATE = "record_video_sw_maxrate";
    public static final String KEY_I_RECORD_VIDEO_SW_PRESET = "record_video_sw_preset";
    public static final String KEY_I_RECORD_VIDEO_SW_QP = "record_video_sw_qp";
    public static final String KEY_I_SYNTHETIC_ENCODE_MODE = "synthetic_encode_mode";
    public static final String KEY_I_SYNTHETIC_HW_BITRATE_MODE = "synthetic_hw_bitrate_mode";
    public static final String KEY_I_SYNTHETIC_HW_PROFILE = "synthetic_hw_profile";
    public static final String KEY_I_SYNTHETIC_SW_BITRATE_MODE = "synthetic_sw_bitrate_mode";
    public static final String KEY_I_SYNTHETIC_VIDEO_HW_BITRATE = "synthetic_video_hw_bitrate";
    public static final String KEY_I_SYNTHETIC_VIDEO_SW_CRF = "synthetic_video_sw_crf";
    public static final String KEY_I_SYNTHETIC_VIDEO_SW_GOP = "synthetic_video_sw_gop";
    public static final String KEY_I_SYNTHETIC_VIDEO_SW_MAXRATE = "synthetic_video_sw_maxrate";
    public static final String KEY_I_SYNTHETIC_VIDEO_SW_PRESET = "synthetic_video_sw_preset";
    public static final String KEY_I_SYNTHETIC_VIDEO_SW_QP = "synthetic_video_sw_qp";
    private static final String TAG = "PerfConfig";
    public static final int UNDEFINED = 0;
    public static final List<Config> sConfigList = new ArrayList(20);
    private static final String sConfigs = "ShortVideoConfig";
    private static final String sPerfConfigPrefix = "PerfConfig_";
    public static final VECloudConfig sVECloudConfig = new VECloudConfig();

    private static class ConfigAsyncTask extends AsyncTask<Void, Void, Void> {
        private ConfigAsyncTask() {
        }

        protected Void doInBackground(Void... voidArr) {
            try {
                Context context = VERuntime.getInstance().getContext();
                Map toMap = DeviceInfoDetector.toMap();
                toMap.put("package_name", context.getPackageName());
                toMap.put("model", Build.MODEL);
                toMap.put("os_version", VERSION.RELEASE);
                toMap.put("local", Locale.getDefault().getCountry());
                toMap.put("platform", "android");
                String body = HttpRequest.get(PerformanceConfig.BASE_URL_CHINA, toMap, true).body();
                String str = PerformanceConfig.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("cloud config result = ");
                stringBuilder.append(body);
                Log.d(str, stringBuilder.toString());
                try {
                    JSONObject jSONObject = new JSONObject(body);
                    if (jSONObject.getInt("code") == 0) {
                        JSONObject jSONObject2 = jSONObject.getJSONObject("data");
                        toMap = new HashMap();
                        for (Config config : PerformanceConfig.sConfigList) {
                            if (jSONObject2.has(config.key)) {
                                toMap.put(config.key, PerformanceConfig.doubtingFilter(config, jSONObject2, true));
                            } else {
                                String str2 = PerformanceConfig.TAG;
                                StringBuilder stringBuilder2 = new StringBuilder();
                                stringBuilder2.append("Configuration field not available for this config:");
                                stringBuilder2.append(config.key);
                                Log.e(str2, stringBuilder2.toString());
                            }
                        }
                        PerformanceConfig.setPerformanceConfig(VERuntime.getInstance().getContext(), toMap);
                    } else {
                        StringBuilder stringBuilder3 = new StringBuilder();
                        stringBuilder3.append("Return code is ");
                        stringBuilder3.append(jSONObject.getInt("code"));
                        Log.e(PerformanceConfig.TAG, "Config return code not 0.", new IllegalStateException(stringBuilder3.toString()));
                    }
                } catch (Throwable e) {
                    Log.e(PerformanceConfig.TAG, "Parse json result failed! ", e);
                    e.printStackTrace();
                }
            } catch (Throwable e2) {
                Log.e(PerformanceConfig.TAG, "Fetch config failed! ", e2);
            }
            return null;
        }

        protected void onPostExecute(Void voidR) {
        }
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface ConfigKey {
    }

    static {
        sConfigList.add(new Config(KEY_I_RECORD_CAMERA_TYPE, 0, Integer.valueOf(1)));
        sConfigList.add(new Config(KEY_I_RECORD_VIDEO_SW_CRF, 0, Integer.valueOf(15)));
        sConfigList.add(new Config(KEY_I_RECORD_VIDEO_HW_BITRATE, 0, Integer.valueOf(4194304)));
        sConfigList.add(new Config(KEY_I_RECORD_ENCODE_MODE, 0, Integer.valueOf(0)));
        sConfigList.add(new Config(KEY_I_RECORD_RESOLUTION_WIDTH, 0, Integer.valueOf(576)));
        sConfigList.add(new Config(KEY_I_RECORD_RESOLUTION_HEIGHT, 0, Integer.valueOf(1024)));
        sConfigList.add(new Config(KEY_I_RECORD_CAMERA_COMPAT_LEVEL, 0, Integer.valueOf(1)));
        sConfigList.add(new Config(KEY_I_RECORD_VIDEO_SW_MAXRATE, 0, Integer.valueOf(5000000)));
        sConfigList.add(new Config(KEY_I_RECORD_VIDEO_SW_PRESET, 0, Integer.valueOf(0)));
        sConfigList.add(new Config(KEY_I_RECORD_VIDEO_SW_GOP, 0, Integer.valueOf(35)));
        sConfigList.add(new Config(KEY_I_RECORD_VIDEO_SW_QP, 0, Integer.valueOf(2)));
        sConfigList.add(new Config(KEY_I_RECORD_SW_BITRATE_MODE, 0, Integer.valueOf(0)));
        sConfigList.add(new Config(KEY_I_RECORD_HW_BITRATE_MODE, 0, Integer.valueOf(0)));
        sConfigList.add(new Config(KEY_I_RECORD_HW_PROFILE, 0, Integer.valueOf(0)));
        sConfigList.add(new Config(KEY_I_IMPORT_ENCODE_MODE, 0, Integer.valueOf(0)));
        sConfigList.add(new Config(KEY_I_IMPORT_SHORTER_PIXELS, 0, Integer.valueOf(576)));
        sConfigList.add(new Config(KEY_I_IMPORT_VIDEO_SW_CRF, 0, Integer.valueOf(15)));
        sConfigList.add(new Config(KEY_I_IMPORT_VIDEO_HW_BITRATE, 0, Integer.valueOf(4194304)));
        sConfigList.add(new Config(KEY_I_IMPORT_VIDEO_SW_MAXRATE, 0, Integer.valueOf(5000000)));
        sConfigList.add(new Config(KEY_I_IMPORT_VIDEO_SW_PRESET, 0, Integer.valueOf(0)));
        sConfigList.add(new Config(KEY_I_IMPORT_VIDEO_SW_GOP, 0, Integer.valueOf(35)));
        sConfigList.add(new Config(KEY_I_IMPORT_VIDEO_SW_QP, 0, Integer.valueOf(2)));
        sConfigList.add(new Config(KEY_I_IMPORT_SW_BITRATE_MODE, 0, Integer.valueOf(0)));
        sConfigList.add(new Config(KEY_I_IMPORT_HW_BITRATE_MODE, 0, Integer.valueOf(0)));
        sConfigList.add(new Config(KEY_I_IMPORT_HW_PROFILE, 0, Integer.valueOf(0)));
        sConfigList.add(new Config(KEY_I_SYNTHETIC_ENCODE_MODE, 0, Integer.valueOf(0)));
        sConfigList.add(new Config(KEY_I_SYNTHETIC_VIDEO_SW_CRF, 0, Integer.valueOf(15)));
        sConfigList.add(new Config(KEY_I_SYNTHETIC_VIDEO_HW_BITRATE, 0, Integer.valueOf(4194304)));
        sConfigList.add(new Config(KEY_I_SYNTHETIC_VIDEO_SW_MAXRATE, 0, Integer.valueOf(5000000)));
        sConfigList.add(new Config(KEY_I_SYNTHETIC_VIDEO_SW_PRESET, 0, Integer.valueOf(0)));
        sConfigList.add(new Config(KEY_I_SYNTHETIC_VIDEO_SW_GOP, 0, Integer.valueOf(35)));
        sConfigList.add(new Config(KEY_I_SYNTHETIC_VIDEO_SW_QP, 0, Integer.valueOf(2)));
        sConfigList.add(new Config(KEY_I_SYNTHETIC_SW_BITRATE_MODE, 0, Integer.valueOf(0)));
        sConfigList.add(new Config(KEY_I_SYNTHETIC_HW_BITRATE_MODE, 0, Integer.valueOf(0)));
        sConfigList.add(new Config(KEY_I_SYNTHETIC_HW_PROFILE, 0, Integer.valueOf(0)));
        sConfigList.add(new Config(KEY_I_EARPHONE_ECHO_NORMAL, 0, Integer.valueOf(1)));
        sConfigList.add(new Config(KEY_I_EARPHONE_ECHO_AAUDIO, 0, Integer.valueOf(1)));
        sConfigList.add(new Config(KEY_I_EARPHONE_ECHO_HUAWEI, 0, Integer.valueOf(1)));
    }

    @RestrictTo({Scope.LIBRARY})
    public static void restoreFromCache() {
        if (VERuntime.getInstance().getContext() != null) {
            setConfigsFromMap(getPerformanceConfig(VERuntime.getInstance().getContext()));
            return;
        }
        throw new IllegalStateException("Must call VideoSdkCore.init() before.");
    }

    @RestrictTo({Scope.LIBRARY})
    public static void updateConfig(Map<String, String> map) {
        setConfigsFromMap(map);
        setPerformanceConfig(VERuntime.getInstance().getContext(), map);
    }

    private static void setConfigsFromMap(Map<String, String> map) {
        for (Config config : sConfigList) {
            String str = config.key;
            Object obj = -1;
            switch (str.hashCode()) {
                case -2004732869:
                    if (str.equals(KEY_I_SYNTHETIC_VIDEO_HW_BITRATE)) {
                        obj = 27;
                        break;
                    }
                    break;
                case -2003520120:
                    if (str.equals(KEY_I_EARPHONE_ECHO_AAUDIO)) {
                        obj = 36;
                        break;
                    }
                    break;
                case -1815767918:
                    if (str.equals(KEY_I_IMPORT_ENCODE_MODE)) {
                        obj = 14;
                        break;
                    }
                    break;
                case -1785223334:
                    if (str.equals(KEY_I_EARPHONE_ECHO_HUAWEI)) {
                        obj = 37;
                        break;
                    }
                    break;
                case -1694569666:
                    if (str.equals(KEY_I_RECORD_ENCODE_MODE)) {
                        obj = 3;
                        break;
                    }
                    break;
                case -1668300853:
                    if (str.equals(KEY_I_IMPORT_HW_BITRATE_MODE)) {
                        obj = 23;
                        break;
                    }
                    break;
                case -1645123140:
                    if (str.equals(KEY_I_IMPORT_VIDEO_SW_PRESET)) {
                        obj = 19;
                        break;
                    }
                    break;
                case -1618492838:
                    if (str.equals(KEY_I_EARPHONE_ECHO_NORMAL)) {
                        obj = 35;
                        break;
                    }
                    break;
                case -1558016730:
                    if (str.equals(KEY_I_RECORD_CAMERA_TYPE)) {
                        obj = null;
                        break;
                    }
                    break;
                case -1376521253:
                    if (str.equals(KEY_I_IMPORT_VIDEO_HW_BITRATE)) {
                        obj = 17;
                        break;
                    }
                    break;
                case -1303806036:
                    if (str.equals(KEY_I_RECORD_RESOLUTION_HEIGHT)) {
                        obj = 5;
                        break;
                    }
                    break;
                case -1248494809:
                    if (str.equals(KEY_I_RECORD_HW_PROFILE)) {
                        obj = 13;
                        break;
                    }
                    break;
                case -1236656006:
                    if (str.equals(KEY_I_SYNTHETIC_VIDEO_SW_CRF)) {
                        obj = 26;
                        break;
                    }
                    break;
                case -1236652245:
                    if (str.equals(KEY_I_SYNTHETIC_VIDEO_SW_GOP)) {
                        obj = 30;
                        break;
                    }
                    break;
                case -1136469343:
                    if (str.equals(KEY_I_RECORD_RESOLUTION_WIDTH)) {
                        obj = 4;
                        break;
                    }
                    break;
                case -532682277:
                    if (str.equals(KEY_I_RECORD_VIDEO_SW_MAXRATE)) {
                        obj = 7;
                        break;
                    }
                    break;
                case -457298194:
                    if (str.equals(KEY_I_RECORD_VIDEO_SW_CRF)) {
                        obj = 1;
                        break;
                    }
                    break;
                case -457294433:
                    if (str.equals(KEY_I_RECORD_VIDEO_SW_GOP)) {
                        obj = 9;
                        break;
                    }
                    break;
                case -144025773:
                    if (str.equals(KEY_I_IMPORT_HW_PROFILE)) {
                        obj = 24;
                        break;
                    }
                    break;
                case 18051394:
                    if (str.equals(KEY_I_RECORD_SW_BITRATE_MODE)) {
                        obj = 11;
                        break;
                    }
                    break;
                case 80523290:
                    if (str.equals(KEY_I_IMPORT_VIDEO_SW_CRF)) {
                        obj = 16;
                        break;
                    }
                    break;
                case 80527051:
                    if (str.equals(KEY_I_IMPORT_VIDEO_SW_GOP)) {
                        obj = 20;
                        break;
                    }
                    break;
                case 514297628:
                    if (str.equals(KEY_I_SYNTHETIC_VIDEO_SW_QP)) {
                        obj = 31;
                        break;
                    }
                    break;
                case 614850679:
                    if (str.equals(KEY_I_RECORD_HW_BITRATE_MODE)) {
                        obj = 12;
                        break;
                    }
                    break;
                case 638028392:
                    if (str.equals(KEY_I_RECORD_VIDEO_SW_PRESET)) {
                        obj = 8;
                        break;
                    }
                    break;
                case 681699503:
                    if (str.equals(KEY_I_RECORD_VIDEO_HW_BITRATE)) {
                        obj = 2;
                        break;
                    }
                    break;
                case 762676278:
                    if (str.equals(KEY_I_SYNTHETIC_SW_BITRATE_MODE)) {
                        obj = 32;
                        break;
                    }
                    break;
                case 1051236402:
                    if (str.equals(KEY_I_SYNTHETIC_ENCODE_MODE)) {
                        obj = 25;
                        break;
                    }
                    break;
                case 1068128883:
                    if (str.equals(KEY_I_RECORD_CAMERA_COMPAT_LEVEL)) {
                        obj = 6;
                        break;
                    }
                    break;
                case 1075852647:
                    if (str.equals(KEY_I_SYNTHETIC_VIDEO_SW_MAXRATE)) {
                        obj = 28;
                        break;
                    }
                    break;
                case 1359475563:
                    if (str.equals(KEY_I_SYNTHETIC_HW_BITRATE_MODE)) {
                        obj = 33;
                        break;
                    }
                    break;
                case 1382653276:
                    if (str.equals(KEY_I_SYNTHETIC_VIDEO_SW_PRESET)) {
                        obj = 29;
                        break;
                    }
                    break;
                case 1399891293:
                    if (str.equals(KEY_I_IMPORT_SHORTER_PIXELS)) {
                        obj = 15;
                        break;
                    }
                    break;
                case 1704064263:
                    if (str.equals(KEY_I_IMPORT_VIDEO_SW_MAXRATE)) {
                        obj = 18;
                        break;
                    }
                    break;
                case 1749573555:
                    if (str.equals(KEY_I_SYNTHETIC_HW_PROFILE)) {
                        obj = 34;
                        break;
                    }
                    break;
                case 1942260604:
                    if (str.equals(KEY_I_IMPORT_VIDEO_SW_QP)) {
                        obj = 21;
                        break;
                    }
                    break;
                case 2029867158:
                    if (str.equals(KEY_I_IMPORT_SW_BITRATE_MODE)) {
                        obj = 22;
                        break;
                    }
                    break;
                case 2063458856:
                    if (str.equals(KEY_I_RECORD_VIDEO_SW_QP)) {
                        obj = 10;
                        break;
                    }
                    break;
            }
            switch (obj) {
                case null:
                    sVECloudConfig.mRecordCameraType = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 1:
                    sVECloudConfig.mRecordSWEncodeCRF = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 2:
                    sVECloudConfig.mRecordHWEncodeBPS = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 3:
                    sVECloudConfig.mRecordEncodeMode = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 4:
                    sVECloudConfig.mRecordResolutionWidth = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 5:
                    sVECloudConfig.mRecordResolutionHeight = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 6:
                    sVECloudConfig.mRecordCameraCompatLevel = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 7:
                    sVECloudConfig.mRecordVideoSWMaxrate = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 8:
                    sVECloudConfig.mRecordVideoSWPreset = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 9:
                    sVECloudConfig.mRecordVideoSWGop = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 10:
                    sVECloudConfig.mRecordVideoSWQP = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 11:
                    sVECloudConfig.mRecordSWBitrateMode = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 12:
                    sVECloudConfig.mRecordHwBitrateMode = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 13:
                    sVECloudConfig.mRecordHwProfile = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 14:
                    sVECloudConfig.mImportEncodeMode = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 15:
                    sVECloudConfig.mImportShortEdgeValue = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 16:
                    sVECloudConfig.mImportSWEncodeCRF = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 17:
                    sVECloudConfig.mImportHWEncodeBPS = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 18:
                    sVECloudConfig.mImportVideoSWMaxrate = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 19:
                    sVECloudConfig.mImportVideoSWPreset = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 20:
                    sVECloudConfig.mImportVideoSWGop = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 21:
                    sVECloudConfig.mImportVideoSWQP = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 22:
                    sVECloudConfig.mImportSWBitrateMode = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 23:
                    sVECloudConfig.mImportHwBitrateMode = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 24:
                    sVECloudConfig.mImportHwProfile = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 25:
                    sVECloudConfig.mCompileEncodeMode = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 26:
                    sVECloudConfig.mCompileEncodeSWCRF = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 27:
                    sVECloudConfig.mCompileEncodeHWBPS = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 28:
                    sVECloudConfig.mCompileEncodeSWMaxrate = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 29:
                    sVECloudConfig.mCompileEncodeSWCRFPreset = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 30:
                    sVECloudConfig.mCompileEncodeSWGOP = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 31:
                    sVECloudConfig.mCompileVideoSWQP = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 32:
                    sVECloudConfig.mCompileSWBitrateMode = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 33:
                    sVECloudConfig.mCompileHwBitrateMode = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 34:
                    sVECloudConfig.mCompileHwProfile = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 35:
                    sVECloudConfig.mEarphoneEchoNormal = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 36:
                    sVECloudConfig.mEarphoneEchoAAudio = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 37:
                    sVECloudConfig.mEarphoneEchoHuawei = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                default:
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("Unexpected Config.key = ");
                    stringBuilder.append(config.key);
                    throw new IllegalStateException(stringBuilder.toString());
            }
        }
    }

    private static int getIntConfig(Map<String, String> map, String str, int i) {
        if (map == null) {
            return 0;
        }
        String str2 = (String) map.get(str);
        try {
            if (!TextUtils.isEmpty(str2)) {
                return Integer.parseInt(str2);
            }
        } catch (Throwable e) {
            Log.e(TAG, "getIntConfig: error", e);
        }
        return i;
    }

    private static float getFloatConfig(Map<String, String> map, String str, float f) {
        if (map == null) {
            return 0.0f;
        }
        String str2 = (String) map.get(str);
        try {
            if (!TextUtils.isEmpty(str2)) {
                return Float.parseFloat(str2);
            }
        } catch (Throwable e) {
            Log.e(TAG, "getIntConfig: error", e);
        }
        return f;
    }

    public static void fetch() {
        new ConfigAsyncTask().execute(new Void[0]);
    }

    private static int getDefaultInt(String str) {
        for (Config config : sConfigList) {
            if (config.key.equals(str)) {
                return ((Integer) config.defaultValue).intValue();
            }
        }
        return -1;
    }

    private static float getDefaultFloat(String str) {
        for (Config config : sConfigList) {
            if (config.key.equals(str)) {
                return ((Float) config.defaultValue).floatValue();
            }
        }
        return -1.0f;
    }

    /* JADX WARNING: Missing block: B:241:0x0304, code:
            r0 = null;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static String doubtingFilter(Config config, JSONObject jSONObject, boolean z) {
        String valueOf;
        Throwable e;
        Config config2 = config;
        JSONObject jSONObject2 = jSONObject;
        if (jSONObject2 != null) {
            String str = config2.key;
            String str2 = null;
            if (jSONObject2.has(str)) {
                Object obj = null;
                int i;
                try {
                    Object obj2;
                    switch (str.hashCode()) {
                        case -2004732869:
                            if (str.equals(KEY_I_SYNTHETIC_VIDEO_HW_BITRATE)) {
                                obj2 = 6;
                                break;
                            }
                        case -2003520120:
                            if (str.equals(KEY_I_EARPHONE_ECHO_AAUDIO)) {
                                obj2 = 36;
                                break;
                            }
                        case -1815767918:
                            if (str.equals(KEY_I_IMPORT_ENCODE_MODE)) {
                                obj2 = 8;
                                break;
                            }
                        case -1785223334:
                            if (str.equals(KEY_I_EARPHONE_ECHO_HUAWEI)) {
                                obj2 = 37;
                                break;
                            }
                        case -1694569666:
                            if (str.equals(KEY_I_RECORD_ENCODE_MODE)) {
                                obj2 = 7;
                                break;
                            }
                        case -1668300853:
                            if (str.equals(KEY_I_IMPORT_HW_BITRATE_MODE)) {
                                obj2 = 22;
                                break;
                            }
                        case -1645123140:
                            if (str.equals(KEY_I_IMPORT_VIDEO_SW_PRESET)) {
                                obj2 = 18;
                                break;
                            }
                        case -1618492838:
                            if (str.equals(KEY_I_EARPHONE_ECHO_NORMAL)) {
                                obj2 = 35;
                                break;
                            }
                        case -1558016730:
                            if (str.equals(KEY_I_RECORD_CAMERA_TYPE)) {
                                obj2 = null;
                                break;
                            }
                        case -1376521253:
                            if (str.equals(KEY_I_IMPORT_VIDEO_HW_BITRATE)) {
                                obj2 = 5;
                                break;
                            }
                        case -1303806036:
                            if (str.equals(KEY_I_RECORD_RESOLUTION_HEIGHT)) {
                                obj2 = 11;
                                break;
                            }
                        case -1248494809:
                            if (str.equals(KEY_I_RECORD_HW_PROFILE)) {
                                obj2 = 23;
                                break;
                            }
                        case -1236656006:
                            if (str.equals(KEY_I_SYNTHETIC_VIDEO_SW_CRF)) {
                                obj2 = 3;
                                break;
                            }
                        case -1236652245:
                            if (str.equals(KEY_I_SYNTHETIC_VIDEO_SW_GOP)) {
                                obj2 = 28;
                                break;
                            }
                        case -1136469343:
                            if (str.equals(KEY_I_RECORD_RESOLUTION_WIDTH)) {
                                obj2 = 10;
                                break;
                            }
                        case -532682277:
                            if (str.equals(KEY_I_RECORD_VIDEO_SW_MAXRATE)) {
                                obj2 = 13;
                                break;
                            }
                        case -457298194:
                            if (str.equals(KEY_I_RECORD_VIDEO_SW_CRF)) {
                                obj2 = 1;
                                break;
                            }
                        case -457294433:
                            if (str.equals(KEY_I_RECORD_VIDEO_SW_GOP)) {
                                obj2 = 26;
                                break;
                            }
                        case -144025773:
                            if (str.equals(KEY_I_IMPORT_HW_PROFILE)) {
                                obj2 = 24;
                                break;
                            }
                        case 18051394:
                            if (str.equals(KEY_I_RECORD_SW_BITRATE_MODE)) {
                                obj2 = 32;
                                break;
                            }
                        case 80523290:
                            if (str.equals(KEY_I_IMPORT_VIDEO_SW_CRF)) {
                                obj2 = 2;
                                break;
                            }
                        case 80527051:
                            if (str.equals(KEY_I_IMPORT_VIDEO_SW_GOP)) {
                                obj2 = 27;
                                break;
                            }
                        case 514297628:
                            if (str.equals(KEY_I_SYNTHETIC_VIDEO_SW_QP)) {
                                obj2 = 31;
                                break;
                            }
                        case 614850679:
                            if (str.equals(KEY_I_RECORD_HW_BITRATE_MODE)) {
                                obj2 = 20;
                                break;
                            }
                        case 638028392:
                            if (str.equals(KEY_I_RECORD_VIDEO_SW_PRESET)) {
                                obj2 = 17;
                                break;
                            }
                        case 681699503:
                            if (str.equals(KEY_I_RECORD_VIDEO_HW_BITRATE)) {
                                obj2 = 4;
                                break;
                            }
                        case 762676278:
                            if (str.equals(KEY_I_SYNTHETIC_SW_BITRATE_MODE)) {
                                obj2 = 34;
                                break;
                            }
                        case 1051236402:
                            if (str.equals(KEY_I_SYNTHETIC_ENCODE_MODE)) {
                                obj2 = 9;
                                break;
                            }
                        case 1068128883:
                            if (str.equals(KEY_I_RECORD_CAMERA_COMPAT_LEVEL)) {
                                obj2 = 19;
                                break;
                            }
                        case 1075852647:
                            if (str.equals(KEY_I_SYNTHETIC_VIDEO_SW_MAXRATE)) {
                                obj2 = 15;
                                break;
                            }
                        case 1359475563:
                            if (str.equals(KEY_I_SYNTHETIC_HW_BITRATE_MODE)) {
                                obj2 = 21;
                                break;
                            }
                        case 1382653276:
                            if (str.equals(KEY_I_SYNTHETIC_VIDEO_SW_PRESET)) {
                                obj2 = 16;
                                break;
                            }
                        case 1399891293:
                            if (str.equals(KEY_I_IMPORT_SHORTER_PIXELS)) {
                                obj2 = 12;
                                break;
                            }
                        case 1704064263:
                            if (str.equals(KEY_I_IMPORT_VIDEO_SW_MAXRATE)) {
                                obj2 = 14;
                                break;
                            }
                        case 1749573555:
                            if (str.equals(KEY_I_SYNTHETIC_HW_PROFILE)) {
                                obj2 = 25;
                                break;
                            }
                        case 1942260604:
                            if (str.equals(KEY_I_IMPORT_VIDEO_SW_QP)) {
                                obj2 = 30;
                                break;
                            }
                        case 2029867158:
                            if (str.equals(KEY_I_IMPORT_SW_BITRATE_MODE)) {
                                obj2 = 33;
                                break;
                            }
                        case 2063458856:
                            if (str.equals(KEY_I_RECORD_VIDEO_SW_QP)) {
                                obj2 = 29;
                                break;
                            }
                        default:
                            obj2 = -1;
                            break;
                    }
                    switch (obj2) {
                        case null:
                            i = jSONObject2.getInt(str);
                            if (i >= 1) {
                                valueOf = String.valueOf(i);
                                break;
                            }
                            break;
                        case 1:
                        case 2:
                        case 3:
                            i = jSONObject2.getInt(str);
                            if (i >= 1 && i <= 50) {
                                valueOf = String.valueOf(i);
                                break;
                            }
                        case 4:
                        case 5:
                        case 6:
                            i = jSONObject2.getInt(str);
                            if (i > 0) {
                                valueOf = String.valueOf(i);
                                break;
                            }
                            break;
                        case 7:
                        case 8:
                        case 9:
                            i = jSONObject2.getInt(str);
                            if (i == 0 || i == 1) {
                                valueOf = String.valueOf(i);
                                break;
                            }
                        case 10:
                            i = jSONObject2.getInt(str);
                            if (i % 16 == 0 && i >= 160 && i <= 5120) {
                                valueOf = String.valueOf(i);
                                break;
                            }
                        case 11:
                            i = jSONObject2.getInt(str);
                            if (i % 16 == 0 && i >= 160 && i <= 5120) {
                                valueOf = String.valueOf(i);
                                break;
                            }
                        case 12:
                            i = jSONObject2.getInt(str);
                            if (i % 16 == 0 && i >= 160 && i <= 5120) {
                                valueOf = String.valueOf(i);
                                break;
                            }
                        case 13:
                        case 14:
                        case 15:
                            i = jSONObject2.getInt(str);
                            if (i >= 100000 && i <= 10000000) {
                                valueOf = String.valueOf(i);
                                break;
                            }
                        case 16:
                        case 17:
                        case 18:
                            i = jSONObject2.getInt(str);
                            if (i >= 0 && i <= 9) {
                                valueOf = String.valueOf(i);
                                break;
                            }
                        case 19:
                            i = jSONObject2.getInt(str);
                            if (i >= 0) {
                                valueOf = String.valueOf(i);
                                break;
                            }
                            break;
                        case 20:
                        case 21:
                        case 22:
                            i = jSONObject2.getInt(str);
                            if (i >= 0) {
                                valueOf = String.valueOf(i);
                                break;
                            }
                            break;
                        case 23:
                        case 24:
                        case 25:
                            i = jSONObject2.getInt(str);
                            if (i >= 0) {
                                valueOf = String.valueOf(i);
                                break;
                            }
                            break;
                        case 26:
                        case 27:
                        case 28:
                            i = jSONObject2.getInt(str);
                            if (i >= 1) {
                                valueOf = String.valueOf(i);
                                break;
                            }
                            break;
                        case 29:
                        case 30:
                        case 31:
                            i = jSONObject2.getInt(str);
                            if (i >= 1 && i <= 50) {
                                valueOf = String.valueOf(i);
                                break;
                            }
                        case 32:
                        case 33:
                        case 34:
                            i = jSONObject2.getInt(str);
                            if (i >= 0 && i <= 2) {
                                valueOf = String.valueOf(i);
                                break;
                            }
                        case 35:
                            i = jSONObject2.getInt(str);
                            if (i == 0 || i == 1) {
                                valueOf = String.valueOf(i);
                                break;
                            }
                        case 36:
                            i = jSONObject2.getInt(str);
                            if (i == 0 || i == 1) {
                                valueOf = String.valueOf(i);
                                break;
                            }
                        case 37:
                            i = jSONObject2.getInt(str);
                            if (i == 0 || i == 1) {
                                try {
                                    valueOf = String.valueOf(i);
                                    break;
                                } catch (JSONException e2) {
                                    e = e2;
                                    break;
                                }
                            }
                        default:
                            throw new IllegalStateException("Shouldn't reach here. Unmatched config.key case");
                    }
                } catch (JSONException e3) {
                    e = e3;
                    i = -1;
                    Log.e(TAG, "Parse json result failed! ", e);
                    e.printStackTrace();
                    valueOf = null;
                    obj = 1;
                    if (obj == null && valueOf == null) {
                        if (config2.type == 0) {
                            StringBuilder stringBuilder = new StringBuilder();
                            stringBuilder.append("Checked config did not pass: key = ");
                            stringBuilder.append(config2.key);
                            stringBuilder.append(" value = ");
                            stringBuilder.append(i);
                            Log.e("doubtingFilter report: ", stringBuilder.toString());
                        } else if (config2.type == 1) {
                            StringBuilder stringBuilder2 = new StringBuilder();
                            stringBuilder2.append("Checked config did not pass: key = ");
                            stringBuilder2.append(config2.key);
                            stringBuilder2.append(" value = ");
                            stringBuilder2.append(-1.0d);
                            Log.e("doubtingFilter report: ", stringBuilder2.toString());
                        }
                    }
                    if (valueOf == null) {
                        if (z) {
                            str2 = config2.defaultValue.toString();
                        }
                        return str2;
                    }
                    StringBuilder stringBuilder3 = new StringBuilder();
                    stringBuilder3.append(str);
                    stringBuilder3.append(" == ");
                    stringBuilder3.append(valueOf);
                    Log.d("doubtingFilter report: ", stringBuilder3.toString());
                    return valueOf;
                }
            }
            valueOf = TAG;
            StringBuilder stringBuilder4 = new StringBuilder();
            stringBuilder4.append("fetched config do not contain config.key = ");
            stringBuilder4.append(str);
            Log.e(valueOf, stringBuilder4.toString());
            if (z) {
                return config2.defaultValue.toString();
            }
            return null;
        }
        throw new IllegalArgumentException("fetchedRawConfigs == null");
    }

    public static void setPerformanceConfig(Context context, Map<String, String> map) {
        if (map != null) {
            Set<Entry> entrySet = map.entrySet();
            Editor edit = context.getSharedPreferences(sConfigs, 0).edit();
            for (Entry entry : entrySet) {
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append(sPerfConfigPrefix);
                stringBuilder.append((String) entry.getKey());
                edit.putString(stringBuilder.toString(), (String) entry.getValue());
            }
            edit.apply();
        }
    }

    public static Map<String, String> getPerformanceConfig(Context context) {
        Map<String, String> hashMap = new HashMap();
        for (Entry entry : context.getSharedPreferences(sConfigs, 0).getAll().entrySet()) {
            if (((String) entry.getKey()).startsWith(sPerfConfigPrefix)) {
                hashMap.put(((String) entry.getKey()).substring(sPerfConfigPrefix.length()), (String) entry.getValue());
            }
        }
        return hashMap;
    }
}
