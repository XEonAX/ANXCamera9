package com.ss.android.vesdk.runtime.cloudconfig;

import android.content.Context;
import android.content.SharedPreferences.Editor;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.support.annotation.RestrictTo;
import android.support.annotation.RestrictTo.Scope;
import android.text.TextUtils;
import android.util.Log;
import com.google.android.apps.photos.api.PhotosOemApi;
import com.ss.android.ttve.monitor.MonitorUtils;
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
    public static final String BASE_URL = "https://effect.snssdk.com/devicehub/getSettings?";
    public static final String BASE_URL_TEST = "http://10.1.10.91:6789/devicehub/getSettings?";
    public static final int DISABLE = 2;
    public static final int ENABLE = 1;
    public static final String KEY_F_IMPORT_VIDEO_HW_BITRATE = "import_video_hw_bitrate";
    public static final String KEY_F_RECORD_VIDEO_HW_BITRATE = "record_video_hw_bitrate";
    public static final String KEY_F_SYNTHETIC_VIDEO_HW_BITRATE = "synthetic_video_hw_bitrate";
    public static final String KEY_I_IMPORT_ENCODE_MODE = "import_encode_mode";
    public static final String KEY_I_IMPORT_SHORTER_PIXELS = "import_shorter_pixels";
    public static final String KEY_I_IMPORT_VIDEO_SW_CRF = "import_video_sw_crf";
    public static final String KEY_I_RECORD_CAMERA_TYPE = "record_camera_type";
    public static final String KEY_I_RECORD_ENCODE_MODE = "record_encode_mode";
    public static final String KEY_I_RECORD_RESOLUTION_HEIGHT = "record_resolution_height";
    public static final String KEY_I_RECORD_RESOLUTION_WIDTH = "record_resolution_width";
    public static final String KEY_I_RECORD_VIDEO_SW_CRF = "record_video_sw_crf";
    public static final String KEY_I_SYNTHETIC_ENCODE_MODE = "synthetic_encode_mode";
    public static final String KEY_I_SYNTHETIC_VIDEO_SW_CRF = "synthetic_video_sw_crf";
    public static final String KEY_I_SYNTHETIC_VIDEO_SW_GOP = "synthetic_video_sw_gop";
    public static final String KEY_I_SYNTHETIC_VIDEO_SW_MAXRATE = "synthetic_video_sw_maxrate";
    public static final String KEY_I_SYNTHETIC_VIDEO_SW_PRESET = "synthetic_video_sw_preset";
    public static final String KEY_I_USE_OPENSL = "use_opensl";
    private static final String TAG = "PerfConfig";
    public static final int UNDEFINED = 0;
    public static final List<Config> sConfigList = new ArrayList(20);
    private static final String sConfigs = "ShortVideoConfig";
    private static final String sPerfConfigPrefix = "PerfConfig_";
    public static VECloudConfig sVECloudConfig;

    private static class ConfigAsyncTask extends AsyncTask<Void, Void, Void> {
        private ConfigAsyncTask() {
        }

        protected Void doInBackground(Void... voidArr) {
            try {
                Context context = VERuntime.getInstance().getContext();
                Map toMap = DeviceInfoDetector.toMap();
                toMap.put(MonitorUtils.KEY_PACKAGE_NAME, context.getPackageName());
                toMap.put("model", Build.MODEL);
                toMap.put("os_version", VERSION.RELEASE);
                toMap.put("local", Locale.getDefault().getCountry());
                toMap.put("platform", "android");
                String body = HttpRequest.get(PerformanceConfig.BASE_URL, toMap, true).body();
                String str = PerformanceConfig.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("cloud config result = ");
                stringBuilder.append(body);
                Log.d(str, stringBuilder.toString());
                try {
                    JSONObject jSONObject = new JSONObject(body);
                    if (jSONObject.getInt("code") == 0) {
                        JSONObject jSONObject2 = jSONObject.getJSONObject(PhotosOemApi.PATH_SPECIAL_TYPE_DATA);
                        toMap = new HashMap();
                        for (Config config : PerformanceConfig.sConfigList) {
                            if (jSONObject2.has(config.key)) {
                                if (config.type == 0 || config.type == 1) {
                                    toMap.put(config.key, PerformanceConfig.doubtingFilter(config, jSONObject2, true));
                                } else {
                                    throw new IllegalStateException("Not supported");
                                }
                            }
                        }
                        PerformanceConfig.setPerformanceConfig(VERuntime.getInstance().getContext(), toMap);
                    } else {
                        StringBuilder stringBuilder2 = new StringBuilder();
                        stringBuilder2.append("Return code is ");
                        stringBuilder2.append(jSONObject.getInt("code"));
                        Log.e(PerformanceConfig.TAG, "Config return code not 0.", new IllegalStateException(stringBuilder2.toString()));
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
        sConfigList.add(new Config(KEY_I_USE_OPENSL, 0, Integer.valueOf(0)));
        sConfigList.add(new Config(KEY_I_RECORD_CAMERA_TYPE, 0, Integer.valueOf(1)));
        sConfigList.add(new Config(KEY_I_RECORD_VIDEO_SW_CRF, 0, Integer.valueOf(15)));
        sConfigList.add(new Config(KEY_F_RECORD_VIDEO_HW_BITRATE, 0, Integer.valueOf(4096)));
        sConfigList.add(new Config(KEY_I_RECORD_ENCODE_MODE, 0, Integer.valueOf(0)));
        sConfigList.add(new Config(KEY_I_RECORD_RESOLUTION_WIDTH, 0, Integer.valueOf(576)));
        sConfigList.add(new Config(KEY_I_RECORD_RESOLUTION_HEIGHT, 0, Integer.valueOf(1024)));
        sConfigList.add(new Config(KEY_I_IMPORT_ENCODE_MODE, 0, Integer.valueOf(0)));
        sConfigList.add(new Config(KEY_I_IMPORT_SHORTER_PIXELS, 0, Integer.valueOf(576)));
        sConfigList.add(new Config(KEY_I_IMPORT_VIDEO_SW_CRF, 0, Integer.valueOf(15)));
        sConfigList.add(new Config(KEY_F_IMPORT_VIDEO_HW_BITRATE, 0, Integer.valueOf(4096)));
        sConfigList.add(new Config(KEY_I_SYNTHETIC_ENCODE_MODE, 0, Integer.valueOf(0)));
        sConfigList.add(new Config(KEY_I_SYNTHETIC_VIDEO_SW_CRF, 0, Integer.valueOf(15)));
        sConfigList.add(new Config(KEY_F_SYNTHETIC_VIDEO_HW_BITRATE, 0, Integer.valueOf(4096)));
        sConfigList.add(new Config(KEY_I_SYNTHETIC_VIDEO_SW_MAXRATE, 0, Integer.valueOf(5000000)));
        sConfigList.add(new Config(KEY_I_SYNTHETIC_VIDEO_SW_PRESET, 0, Integer.valueOf(0)));
        sConfigList.add(new Config(KEY_I_SYNTHETIC_VIDEO_SW_GOP, 0, Integer.valueOf(35)));
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
        Bundle bundle = new Bundle();
        for (Config config : sConfigList) {
            if (config.type == 0) {
                bundle.putInt(config.key, getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue()));
            } else if (config.type == 1) {
                bundle.putFloat(config.key, getFloatConfig(map, config.key, ((Float) config.defaultValue).floatValue()));
            } else {
                throw new IllegalStateException("Not support");
            }
        }
        sVECloudConfig = new VECloudConfig();
        for (Config config2 : sConfigList) {
            if (KEY_I_RECORD_CAMERA_TYPE.equals(config2.key)) {
                sVECloudConfig.mRecordCameraType = getIntConfig(map, config2.key, ((Integer) config2.defaultValue).intValue());
            } else if (KEY_I_RECORD_VIDEO_SW_CRF.equals(config2.key)) {
                sVECloudConfig.mRecordSWEncodeCRF = getIntConfig(map, config2.key, ((Integer) config2.defaultValue).intValue());
            } else if (KEY_F_RECORD_VIDEO_HW_BITRATE.equals(config2.key)) {
                sVECloudConfig.mRecordHWEncodeBPS = getIntConfig(map, config2.key, ((Integer) config2.defaultValue).intValue());
            } else if (KEY_I_RECORD_ENCODE_MODE.equals(config2.key)) {
                sVECloudConfig.mRecordEncodeMode = getIntConfig(map, config2.key, ((Integer) config2.defaultValue).intValue());
            } else if (KEY_I_RECORD_RESOLUTION_WIDTH.equals(config2.key)) {
                sVECloudConfig.mRecordResolutionWidth = getIntConfig(map, config2.key, ((Integer) config2.defaultValue).intValue());
            } else if (KEY_I_RECORD_RESOLUTION_HEIGHT.equals(config2.key)) {
                sVECloudConfig.mRecordResolutionHeight = getIntConfig(map, config2.key, ((Integer) config2.defaultValue).intValue());
            } else if (KEY_I_IMPORT_ENCODE_MODE.equals(config2.key)) {
                sVECloudConfig.mImportEncodeMode = getIntConfig(map, config2.key, ((Integer) config2.defaultValue).intValue());
            } else if (KEY_I_IMPORT_SHORTER_PIXELS.equals(config2.key)) {
                sVECloudConfig.mImportShortEdgeValue = getIntConfig(map, config2.key, ((Integer) config2.defaultValue).intValue());
            } else if (KEY_I_IMPORT_VIDEO_SW_CRF.equals(config2.key)) {
                sVECloudConfig.mImportSWEncodeCRF = getIntConfig(map, config2.key, ((Integer) config2.defaultValue).intValue());
            } else if (KEY_F_IMPORT_VIDEO_HW_BITRATE.equals(config2.key)) {
                sVECloudConfig.mImportHWEncodeBPS = getIntConfig(map, config2.key, ((Integer) config2.defaultValue).intValue());
            } else if (KEY_I_SYNTHETIC_ENCODE_MODE.equals(config2.key)) {
                sVECloudConfig.mCompileEncodeMode = getIntConfig(map, config2.key, ((Integer) config2.defaultValue).intValue());
            } else if (KEY_I_SYNTHETIC_VIDEO_SW_CRF.equals(config2.key)) {
                sVECloudConfig.mCompileEncodeSWCRF = getIntConfig(map, config2.key, ((Integer) config2.defaultValue).intValue());
            } else if (KEY_F_SYNTHETIC_VIDEO_HW_BITRATE.equals(config2.key)) {
                sVECloudConfig.mCompileEncodeHWBPS = getIntConfig(map, config2.key, ((Integer) config2.defaultValue).intValue());
            } else if (KEY_I_SYNTHETIC_VIDEO_SW_MAXRATE.equals(config2.key)) {
                sVECloudConfig.mCompileEncodeSWCRFMax = getIntConfig(map, config2.key, ((Integer) config2.defaultValue).intValue());
            } else if (KEY_I_SYNTHETIC_VIDEO_SW_PRESET.equals(config2.key)) {
                sVECloudConfig.mCompileEncodeSWCRFPreset = getIntConfig(map, config2.key, ((Integer) config2.defaultValue).intValue());
            } else if (KEY_I_SYNTHETIC_VIDEO_SW_GOP.equals(config2.key)) {
                sVECloudConfig.mCompileEncodeGOP = getIntConfig(map, config2.key, ((Integer) config2.defaultValue).intValue());
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

    /* JADX WARNING: Missing block: B:163:0x01e4, code:
            r0 = null;
     */
    /* JADX WARNING: Missing block: B:164:0x01e5, code:
            r6 = r10;
            r10 = -1;
     */
    /* JADX WARNING: Missing block: B:176:0x0200, code:
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
                double d = -1.0d;
                Object obj = null;
                int i;
                try {
                    Object obj2;
                    switch (str.hashCode()) {
                        case -2004732869:
                            if (str.equals(KEY_F_SYNTHETIC_VIDEO_HW_BITRATE)) {
                                obj2 = 13;
                                break;
                            }
                        case -1815767918:
                            if (str.equals(KEY_I_IMPORT_ENCODE_MODE)) {
                                obj2 = 7;
                                break;
                            }
                        case -1694569666:
                            if (str.equals(KEY_I_RECORD_ENCODE_MODE)) {
                                obj2 = 4;
                                break;
                            }
                        case -1587999781:
                            if (str.equals(KEY_I_USE_OPENSL)) {
                                obj2 = null;
                                break;
                            }
                        case -1558016730:
                            if (str.equals(KEY_I_RECORD_CAMERA_TYPE)) {
                                obj2 = 1;
                                break;
                            }
                        case -1376521253:
                            if (str.equals(KEY_F_IMPORT_VIDEO_HW_BITRATE)) {
                                obj2 = 10;
                                break;
                            }
                        case -1303806036:
                            if (str.equals(KEY_I_RECORD_RESOLUTION_HEIGHT)) {
                                obj2 = 6;
                                break;
                            }
                        case -1236656006:
                            if (str.equals(KEY_I_SYNTHETIC_VIDEO_SW_CRF)) {
                                obj2 = 12;
                                break;
                            }
                        case -1236652245:
                            if (str.equals(KEY_I_SYNTHETIC_VIDEO_SW_GOP)) {
                                obj2 = 16;
                                break;
                            }
                        case -1136469343:
                            if (str.equals(KEY_I_RECORD_RESOLUTION_WIDTH)) {
                                obj2 = 5;
                                break;
                            }
                        case -457298194:
                            if (str.equals(KEY_I_RECORD_VIDEO_SW_CRF)) {
                                obj2 = 2;
                                break;
                            }
                        case 80523290:
                            if (str.equals(KEY_I_IMPORT_VIDEO_SW_CRF)) {
                                obj2 = 9;
                                break;
                            }
                        case 681699503:
                            if (str.equals(KEY_F_RECORD_VIDEO_HW_BITRATE)) {
                                obj2 = 3;
                                break;
                            }
                        case 1051236402:
                            if (str.equals(KEY_I_SYNTHETIC_ENCODE_MODE)) {
                                obj2 = 11;
                                break;
                            }
                        case 1075852647:
                            if (str.equals(KEY_I_SYNTHETIC_VIDEO_SW_MAXRATE)) {
                                obj2 = 14;
                                break;
                            }
                        case 1382653276:
                            if (str.equals(KEY_I_SYNTHETIC_VIDEO_SW_PRESET)) {
                                obj2 = 15;
                                break;
                            }
                        case 1399891293:
                            if (str.equals(KEY_I_IMPORT_SHORTER_PIXELS)) {
                                obj2 = 8;
                                break;
                            }
                        default:
                            obj2 = -1;
                            break;
                    }
                    double d2;
                    switch (obj2) {
                        case null:
                            i = jSONObject2.getInt(str);
                            if (i == 0 || i == 1) {
                                valueOf = String.valueOf(i);
                                break;
                            }
                        case 1:
                            i = jSONObject2.getInt(str);
                            if (i >= 1) {
                                valueOf = String.valueOf(i);
                                break;
                            }
                            break;
                        case 2:
                            i = jSONObject2.getInt(str);
                            if (i >= 1 && i <= 50) {
                                valueOf = String.valueOf(i);
                                break;
                            }
                        case 3:
                            d2 = jSONObject2.getDouble(str);
                            if (d2 > 0.0d) {
                                valueOf = String.valueOf(d2);
                                break;
                            }
                            break;
                        case 4:
                            i = jSONObject2.getInt(str);
                            if (i == 0 || i == 1) {
                                valueOf = String.valueOf(i);
                                break;
                            }
                        case 5:
                            i = jSONObject2.getInt(str);
                            if (i % 16 == 0 && i >= 160 && i <= 2560) {
                                valueOf = String.valueOf(i);
                                break;
                            }
                        case 6:
                            i = jSONObject2.getInt(str);
                            if (i % 16 == 0 && i >= 160 && i <= 2560) {
                                valueOf = String.valueOf(i);
                                break;
                            }
                        case 7:
                            i = jSONObject2.getInt(str);
                            if (i == 0 || i == 1) {
                                valueOf = String.valueOf(i);
                                break;
                            }
                        case 8:
                            i = jSONObject2.getInt(str);
                            if (i % 16 == 0 && i >= 160 && i <= 2560) {
                                valueOf = String.valueOf(i);
                                break;
                            }
                        case 9:
                            i = jSONObject2.getInt(str);
                            if (i >= 1 && i <= 50) {
                                valueOf = String.valueOf(i);
                                break;
                            }
                        case 10:
                            d2 = jSONObject2.getDouble(str);
                            if (d2 > 0.0d) {
                                valueOf = String.valueOf(d2);
                                break;
                            }
                            break;
                        case 11:
                            i = jSONObject2.getInt(str);
                            if (i == 0 || i == 1) {
                                valueOf = String.valueOf(i);
                                break;
                            }
                        case 12:
                            i = jSONObject2.getInt(str);
                            if (i >= 1 && i <= 50) {
                                valueOf = String.valueOf(i);
                                break;
                            }
                        case 13:
                            d2 = jSONObject2.getDouble(str);
                            if (d2 > 0.0d) {
                                try {
                                    valueOf = String.valueOf(d2);
                                    break;
                                } catch (JSONException e2) {
                                    e = e2;
                                    d = d2;
                                    break;
                                }
                            }
                            break;
                        case 14:
                            i = jSONObject2.getInt(str);
                            if (i >= 100000 && i <= 10000000) {
                                valueOf = String.valueOf(i);
                                break;
                            }
                        case 15:
                            i = jSONObject2.getInt(str);
                            if (i >= 0 && i <= 9) {
                                valueOf = String.valueOf(i);
                                break;
                            }
                        case 16:
                            i = jSONObject2.getInt(str);
                            if (i >= 0 && i <= 1000) {
                                try {
                                    valueOf = String.valueOf(i);
                                    break;
                                } catch (JSONException e3) {
                                    e = e3;
                                    break;
                                }
                            }
                        default:
                            throw new IllegalStateException("Shouldn't reach here. Unmatched config.key case");
                    }
                } catch (JSONException e4) {
                    e = e4;
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
                            stringBuilder2.append(d);
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
                return config.toString();
            }
            return null;
        }
        throw new IllegalArgumentException("fetchedConfigs == null");
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
