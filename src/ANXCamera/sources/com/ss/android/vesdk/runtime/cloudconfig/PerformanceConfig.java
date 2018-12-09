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
import com.android.camera.ui.drawable.PanoramaArrowAnimateDrawable;
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
            return PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO;
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
    public static java.lang.String doubtingFilter(com.ss.android.vesdk.runtime.cloudconfig.Config r17, org.json.JSONObject r18, boolean r19) {
        /*
        r1 = r17;
        r0 = r18;
        if (r0 == 0) goto L_0x0297;
    L_0x0006:
        r3 = r1.key;
        r4 = r0.has(r3);
        r5 = 0;
        if (r4 != 0) goto L_0x002d;
    L_0x000f:
        r0 = "PerfConfig";
        r4 = new java.lang.StringBuilder;
        r4.<init>();
        r6 = "fetched config do not contain config.key = ";
        r4.append(r6);
        r4.append(r3);
        r3 = r4.toString();
        android.util.Log.e(r0, r3);
        if (r19 == 0) goto L_0x002c;
    L_0x0027:
        r0 = r17.toString();
        return r0;
    L_0x002c:
        return r5;
        r6 = -4616189618054758400; // 0xbff0000000000000 float:0.0 double:-1.0;
        r4 = -1;
        r8 = 0;
        r9 = 1;
        r10 = r3.hashCode();	 Catch:{ JSONException -> 0x0215 }
        r11 = 9;
        switch(r10) {
            case -2004732869: goto L_0x00ef;
            case -1815767918: goto L_0x00e5;
            case -1694569666: goto L_0x00db;
            case -1587999781: goto L_0x00d1;
            case -1558016730: goto L_0x00c7;
            case -1376521253: goto L_0x00bc;
            case -1303806036: goto L_0x00b2;
            case -1236656006: goto L_0x00a7;
            case -1236652245: goto L_0x009c;
            case -1136469343: goto L_0x0091;
            case -457298194: goto L_0x0086;
            case 80523290: goto L_0x007b;
            case 681699503: goto L_0x0070;
            case 1051236402: goto L_0x0064;
            case 1075852647: goto L_0x0058;
            case 1382653276: goto L_0x004c;
            case 1399891293: goto L_0x0040;
            default: goto L_0x003e;
        };	 Catch:{ JSONException -> 0x0215 }
    L_0x003e:
        goto L_0x00fa;
    L_0x0040:
        r10 = "import_shorter_pixels";
        r10 = r3.equals(r10);	 Catch:{ JSONException -> 0x0215 }
        if (r10 == 0) goto L_0x00fa;
    L_0x0048:
        r10 = 8;
        goto L_0x00fb;
    L_0x004c:
        r10 = "synthetic_video_sw_preset";
        r10 = r3.equals(r10);	 Catch:{ JSONException -> 0x0215 }
        if (r10 == 0) goto L_0x00fa;
    L_0x0054:
        r10 = 15;
        goto L_0x00fb;
    L_0x0058:
        r10 = "synthetic_video_sw_maxrate";
        r10 = r3.equals(r10);	 Catch:{ JSONException -> 0x0215 }
        if (r10 == 0) goto L_0x00fa;
    L_0x0060:
        r10 = 14;
        goto L_0x00fb;
    L_0x0064:
        r10 = "synthetic_encode_mode";
        r10 = r3.equals(r10);	 Catch:{ JSONException -> 0x0215 }
        if (r10 == 0) goto L_0x00fa;
    L_0x006c:
        r10 = 11;
        goto L_0x00fb;
    L_0x0070:
        r10 = "record_video_hw_bitrate";
        r10 = r3.equals(r10);	 Catch:{ JSONException -> 0x0215 }
        if (r10 == 0) goto L_0x00fa;
    L_0x0078:
        r10 = 3;
        goto L_0x00fb;
    L_0x007b:
        r10 = "import_video_sw_crf";
        r10 = r3.equals(r10);	 Catch:{ JSONException -> 0x0215 }
        if (r10 == 0) goto L_0x00fa;
    L_0x0083:
        r10 = r11;
        goto L_0x00fb;
    L_0x0086:
        r10 = "record_video_sw_crf";
        r10 = r3.equals(r10);	 Catch:{ JSONException -> 0x0215 }
        if (r10 == 0) goto L_0x00fa;
    L_0x008e:
        r10 = 2;
        goto L_0x00fb;
    L_0x0091:
        r10 = "record_resolution_width";
        r10 = r3.equals(r10);	 Catch:{ JSONException -> 0x0215 }
        if (r10 == 0) goto L_0x00fa;
    L_0x0099:
        r10 = 5;
        goto L_0x00fb;
    L_0x009c:
        r10 = "synthetic_video_sw_gop";
        r10 = r3.equals(r10);	 Catch:{ JSONException -> 0x0215 }
        if (r10 == 0) goto L_0x00fa;
    L_0x00a4:
        r10 = 16;
        goto L_0x00fb;
    L_0x00a7:
        r10 = "synthetic_video_sw_crf";
        r10 = r3.equals(r10);	 Catch:{ JSONException -> 0x0215 }
        if (r10 == 0) goto L_0x00fa;
    L_0x00af:
        r10 = 12;
        goto L_0x00fb;
    L_0x00b2:
        r10 = "record_resolution_height";
        r10 = r3.equals(r10);	 Catch:{ JSONException -> 0x0215 }
        if (r10 == 0) goto L_0x00fa;
    L_0x00ba:
        r10 = 6;
        goto L_0x00fb;
    L_0x00bc:
        r10 = "import_video_hw_bitrate";
        r10 = r3.equals(r10);	 Catch:{ JSONException -> 0x0215 }
        if (r10 == 0) goto L_0x00fa;
    L_0x00c4:
        r10 = 10;
        goto L_0x00fb;
    L_0x00c7:
        r10 = "record_camera_type";
        r10 = r3.equals(r10);	 Catch:{ JSONException -> 0x0215 }
        if (r10 == 0) goto L_0x00fa;
    L_0x00cf:
        r10 = r9;
        goto L_0x00fb;
    L_0x00d1:
        r10 = "use_opensl";
        r10 = r3.equals(r10);	 Catch:{ JSONException -> 0x0215 }
        if (r10 == 0) goto L_0x00fa;
    L_0x00d9:
        r10 = r8;
        goto L_0x00fb;
    L_0x00db:
        r10 = "record_encode_mode";
        r10 = r3.equals(r10);	 Catch:{ JSONException -> 0x0215 }
        if (r10 == 0) goto L_0x00fa;
    L_0x00e3:
        r10 = 4;
        goto L_0x00fb;
    L_0x00e5:
        r10 = "import_encode_mode";
        r10 = r3.equals(r10);	 Catch:{ JSONException -> 0x0215 }
        if (r10 == 0) goto L_0x00fa;
    L_0x00ed:
        r10 = 7;
        goto L_0x00fb;
    L_0x00ef:
        r10 = "synthetic_video_hw_bitrate";
        r10 = r3.equals(r10);	 Catch:{ JSONException -> 0x0215 }
        if (r10 == 0) goto L_0x00fa;
    L_0x00f7:
        r10 = 13;
        goto L_0x00fb;
    L_0x00fa:
        r10 = r4;
    L_0x00fb:
        r12 = 2560; // 0xa00 float:3.587E-42 double:1.265E-320;
        r13 = 160; // 0xa0 float:2.24E-43 double:7.9E-322;
        r14 = 50;
        r15 = 0;
        switch(r10) {
            case 0: goto L_0x0202;
            case 1: goto L_0x01f5;
            case 2: goto L_0x01e8;
            case 3: goto L_0x01d4;
            case 4: goto L_0x01c7;
            case 5: goto L_0x01b4;
            case 6: goto L_0x01a2;
            case 7: goto L_0x0194;
            case 8: goto L_0x0182;
            case 9: goto L_0x0174;
            case 10: goto L_0x0166;
            case 11: goto L_0x0158;
            case 12: goto L_0x014a;
            case 13: goto L_0x013c;
            case 14: goto L_0x0128;
            case 15: goto L_0x011a;
            case 16: goto L_0x010a;
            default: goto L_0x0106;
        };	 Catch:{ JSONException -> 0x0215 }
    L_0x0106:
        r0 = new java.lang.IllegalStateException;	 Catch:{ JSONException -> 0x0215 }
        goto L_0x020f;
    L_0x010a:
        r10 = r0.getInt(r3);	 Catch:{ JSONException -> 0x0215 }
        if (r10 < 0) goto L_0x0200;
    L_0x0110:
        r0 = 1000; // 0x3e8 float:1.401E-42 double:4.94E-321;
        if (r10 > r0) goto L_0x0200;
    L_0x0114:
        r0 = java.lang.String.valueOf(r10);	 Catch:{ JSONException -> 0x01c5 }
        goto L_0x020e;
    L_0x011a:
        r10 = r0.getInt(r3);	 Catch:{ JSONException -> 0x0215 }
        if (r10 < 0) goto L_0x0200;
    L_0x0120:
        if (r10 > r11) goto L_0x0200;
    L_0x0122:
        r0 = java.lang.String.valueOf(r10);	 Catch:{ JSONException -> 0x01c5 }
        goto L_0x020e;
    L_0x0128:
        r10 = r0.getInt(r3);	 Catch:{ JSONException -> 0x0215 }
        r0 = 100000; // 0x186a0 float:1.4013E-40 double:4.94066E-319;
        if (r10 < r0) goto L_0x0200;
    L_0x0131:
        r0 = 10000000; // 0x989680 float:1.4012985E-38 double:4.9406565E-317;
        if (r10 > r0) goto L_0x0200;
    L_0x0136:
        r0 = java.lang.String.valueOf(r10);	 Catch:{ JSONException -> 0x01c5 }
        goto L_0x020e;
    L_0x013c:
        r10 = r0.getDouble(r3);	 Catch:{ JSONException -> 0x0215 }
        r0 = (r10 > r15 ? 1 : (r10 == r15 ? 0 : -1));
        if (r0 <= 0) goto L_0x01e4;
    L_0x0144:
        r0 = java.lang.String.valueOf(r10);	 Catch:{ JSONException -> 0x01e1 }
        goto L_0x01e5;
    L_0x014a:
        r10 = r0.getInt(r3);	 Catch:{ JSONException -> 0x0215 }
        if (r10 < r9) goto L_0x0200;
    L_0x0150:
        if (r10 > r14) goto L_0x0200;
    L_0x0152:
        r0 = java.lang.String.valueOf(r10);	 Catch:{ JSONException -> 0x01c5 }
        goto L_0x020e;
    L_0x0158:
        r10 = r0.getInt(r3);	 Catch:{ JSONException -> 0x0215 }
        if (r10 == 0) goto L_0x0160;
    L_0x015e:
        if (r10 != r9) goto L_0x0200;
    L_0x0160:
        r0 = java.lang.String.valueOf(r10);	 Catch:{ JSONException -> 0x01c5 }
        goto L_0x020e;
    L_0x0166:
        r10 = r0.getDouble(r3);	 Catch:{ JSONException -> 0x0215 }
        r0 = (r10 > r15 ? 1 : (r10 == r15 ? 0 : -1));
        if (r0 <= 0) goto L_0x01e4;
    L_0x016e:
        r0 = java.lang.String.valueOf(r10);	 Catch:{ JSONException -> 0x01e1 }
        goto L_0x01e5;
    L_0x0174:
        r10 = r0.getInt(r3);	 Catch:{ JSONException -> 0x0215 }
        if (r10 < r9) goto L_0x0200;
    L_0x017a:
        if (r10 > r14) goto L_0x0200;
    L_0x017c:
        r0 = java.lang.String.valueOf(r10);	 Catch:{ JSONException -> 0x01c5 }
        goto L_0x020e;
    L_0x0182:
        r10 = r0.getInt(r3);	 Catch:{ JSONException -> 0x0215 }
        r0 = r10 % 16;
        if (r0 != 0) goto L_0x0200;
    L_0x018a:
        if (r10 < r13) goto L_0x0200;
    L_0x018c:
        if (r10 > r12) goto L_0x0200;
    L_0x018e:
        r0 = java.lang.String.valueOf(r10);	 Catch:{ JSONException -> 0x01c5 }
        goto L_0x020e;
    L_0x0194:
        r10 = r0.getInt(r3);	 Catch:{ JSONException -> 0x0215 }
        if (r10 == 0) goto L_0x019c;
    L_0x019a:
        if (r10 != r9) goto L_0x0200;
    L_0x019c:
        r0 = java.lang.String.valueOf(r10);	 Catch:{ JSONException -> 0x01c5 }
        goto L_0x020e;
    L_0x01a2:
        r10 = r0.getInt(r3);	 Catch:{ JSONException -> 0x0215 }
        r0 = r10 % 16;
        if (r0 != 0) goto L_0x0200;
    L_0x01aa:
        if (r10 < r13) goto L_0x0200;
    L_0x01ac:
        if (r10 > r12) goto L_0x0200;
    L_0x01ae:
        r0 = java.lang.String.valueOf(r10);	 Catch:{ JSONException -> 0x01c5 }
        goto L_0x020e;
    L_0x01b4:
        r10 = r0.getInt(r3);	 Catch:{ JSONException -> 0x0215 }
        r0 = r10 % 16;
        if (r0 != 0) goto L_0x0200;
    L_0x01bc:
        if (r10 < r13) goto L_0x0200;
    L_0x01be:
        if (r10 > r12) goto L_0x0200;
    L_0x01c0:
        r0 = java.lang.String.valueOf(r10);	 Catch:{ JSONException -> 0x01c5 }
        goto L_0x020e;
    L_0x01c5:
        r0 = move-exception;
        goto L_0x0217;
    L_0x01c7:
        r10 = r0.getInt(r3);	 Catch:{ JSONException -> 0x0215 }
        if (r10 == 0) goto L_0x01cf;
    L_0x01cd:
        if (r10 != r9) goto L_0x0200;
    L_0x01cf:
        r0 = java.lang.String.valueOf(r10);	 Catch:{ JSONException -> 0x01c5 }
        goto L_0x020e;
    L_0x01d4:
        r10 = r0.getDouble(r3);	 Catch:{ JSONException -> 0x0215 }
        r0 = (r10 > r15 ? 1 : (r10 == r15 ? 0 : -1));
        if (r0 <= 0) goto L_0x01e4;
    L_0x01dc:
        r0 = java.lang.String.valueOf(r10);	 Catch:{ JSONException -> 0x01e1 }
        goto L_0x01e5;
    L_0x01e1:
        r0 = move-exception;
        r6 = r10;
        goto L_0x0216;
    L_0x01e4:
        r0 = r5;
    L_0x01e5:
        r6 = r10;
        r10 = r4;
        goto L_0x020e;
    L_0x01e8:
        r10 = r0.getInt(r3);	 Catch:{ JSONException -> 0x0215 }
        if (r10 < r9) goto L_0x0200;
    L_0x01ee:
        if (r10 > r14) goto L_0x0200;
    L_0x01f0:
        r0 = java.lang.String.valueOf(r10);	 Catch:{ JSONException -> 0x01c5 }
        goto L_0x020e;
    L_0x01f5:
        r10 = r0.getInt(r3);	 Catch:{ JSONException -> 0x0215 }
        if (r10 < r9) goto L_0x0200;
    L_0x01fb:
        r0 = java.lang.String.valueOf(r10);	 Catch:{ JSONException -> 0x01c5 }
        goto L_0x020e;
    L_0x0200:
        r0 = r5;
        goto L_0x020e;
    L_0x0202:
        r10 = r0.getInt(r3);	 Catch:{ JSONException -> 0x0215 }
        if (r10 == 0) goto L_0x020a;
    L_0x0208:
        if (r10 != r9) goto L_0x0200;
    L_0x020a:
        r0 = java.lang.String.valueOf(r10);	 Catch:{ JSONException -> 0x01c5 }
    L_0x020e:
        goto L_0x0224;
    L_0x020f:
        r8 = "Shouldn't reach here. Unmatched config.key case";
        r0.<init>(r8);	 Catch:{ JSONException -> 0x0215 }
        throw r0;	 Catch:{ JSONException -> 0x0215 }
    L_0x0215:
        r0 = move-exception;
    L_0x0216:
        r10 = r4;
    L_0x0217:
        r4 = "PerfConfig";
        r8 = "Parse json result failed! ";
        android.util.Log.e(r4, r8, r0);
        r0.printStackTrace();
        r0 = r5;
        r8 = r9;
    L_0x0224:
        if (r8 != 0) goto L_0x0271;
    L_0x0226:
        if (r0 != 0) goto L_0x0271;
    L_0x0228:
        r4 = r1.type;
        if (r4 != 0) goto L_0x024d;
    L_0x022c:
        r4 = "doubtingFilter report: ";
        r6 = new java.lang.StringBuilder;
        r6.<init>();
        r7 = "Checked config did not pass: key = ";
        r6.append(r7);
        r7 = r1.key;
        r6.append(r7);
        r7 = " value = ";
        r6.append(r7);
        r6.append(r10);
        r6 = r6.toString();
        android.util.Log.e(r4, r6);
        goto L_0x0271;
    L_0x024d:
        r4 = r1.type;
        if (r4 != r9) goto L_0x0271;
    L_0x0251:
        r4 = "doubtingFilter report: ";
        r8 = new java.lang.StringBuilder;
        r8.<init>();
        r9 = "Checked config did not pass: key = ";
        r8.append(r9);
        r9 = r1.key;
        r8.append(r9);
        r9 = " value = ";
        r8.append(r9);
        r8.append(r6);
        r6 = r8.toString();
        android.util.Log.e(r4, r6);
    L_0x0271:
        if (r0 != 0) goto L_0x027d;
    L_0x0273:
        if (r19 == 0) goto L_0x027c;
    L_0x0275:
        r0 = r1.defaultValue;
        r5 = r0.toString();
    L_0x027c:
        return r5;
    L_0x027d:
        r1 = "doubtingFilter report: ";
        r2 = new java.lang.StringBuilder;
        r2.<init>();
        r2.append(r3);
        r3 = " == ";
        r2.append(r3);
        r2.append(r0);
        r2 = r2.toString();
        android.util.Log.d(r1, r2);
        return r0;
    L_0x0297:
        r0 = new java.lang.IllegalArgumentException;
        r1 = "fetchedConfigs == null";
        r0.<init>(r1);
        throw r0;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.ss.android.vesdk.runtime.cloudconfig.PerformanceConfig.doubtingFilter(com.ss.android.vesdk.runtime.cloudconfig.Config, org.json.JSONObject, boolean):java.lang.String");
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
