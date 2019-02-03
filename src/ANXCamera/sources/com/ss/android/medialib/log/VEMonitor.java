package com.ss.android.medialib.log;

import android.text.TextUtils;
import android.util.Log;
import com.ss.android.medialib.common.LogUtil;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;

public class VEMonitor {
    public static int MONITOR_ACTION_CANCEL = 0;
    private static final String TAG = "VEMonitor";
    private static IMonitor sMonitor;

    public static void report(int i) {
        VEMonitorInvoker.nativeMonitorPerf(i);
    }

    public static void register(IMonitor iMonitor) {
        VEMonitorInvoker.nativeInit();
        sMonitor = iMonitor;
    }

    public static void clear() {
        VEMonitorInvoker.nativeReset();
    }

    public static void perfLong(String str, long j) {
        if (TextUtils.isEmpty(str)) {
            Log.w(TAG, "perfLong: key is null");
        } else {
            VEMonitorInvoker.nativePerfLong(str, j);
        }
    }

    public static void perfRational(String str, float f, float f2) {
        if (TextUtils.isEmpty(str)) {
            Log.w(TAG, "perfLong: key is null");
        } else {
            VEMonitorInvoker.nativePerfRational(str, f, f2);
        }
    }

    public static Map<String, String> getMap() {
        return VEMonitorInvoker.nativeGetMap();
    }

    public static boolean monitorVELog(String str, String str2, long j) {
        Map hashMap = new HashMap();
        hashMap.put(str2, Long.valueOf(j));
        return monitorVELog(str, str2, hashMap);
    }

    public static boolean monitorVELog(String str, String str2, float f) {
        Map hashMap = new HashMap();
        hashMap.put(str2, Float.valueOf(f));
        return monitorVELog(str, str2, hashMap);
    }

    public static boolean monitorVELog(String str, String str2, String str3) {
        Map hashMap = new HashMap();
        hashMap.put(str2, str3);
        return monitorVELog(str, str2, hashMap);
    }

    public static boolean monitorVELog(String str, String str2, Map map) {
        return monitorVELog(sMonitor, str, str2, map);
    }

    public static void monitorVELogJson(String str, String str2, String str3) {
        JSONException e;
        if (sMonitor == null) {
            LogUtil.d(TAG, "No monitor callback, return");
            return;
        }
        JSONObject jSONObject;
        try {
            jSONObject = new JSONObject(str3);
            try {
                jSONObject.put("service", str2);
            } catch (JSONException e2) {
                e = e2;
            }
        } catch (JSONException e3) {
            e = e3;
            jSONObject = null;
            e.printStackTrace();
            sMonitor.monitorLog(str, jSONObject);
        }
        sMonitor.monitorLog(str, jSONObject);
    }

    private static boolean monitorVELog(IMonitor iMonitor, String str, String str2, Map map) {
        if (iMonitor == null) {
            LogUtil.d(TAG, "No monitor callback, return");
            return false;
        }
        JSONObject jSONObject = new JSONObject();
        try {
            for (String str3 : map.keySet()) {
                int type = VEMonitorKeys.getType(str3);
                if (type == VEMonitorKeys.TYPE_INT) {
                    try {
                        jSONObject.put(str3, Integer.parseInt((String) map.get(str3)));
                    } catch (Exception e) {
                        String str4 = TAG;
                        StringBuilder stringBuilder = new StringBuilder();
                        stringBuilder.append("Parse int error:");
                        stringBuilder.append(map.get(str3));
                        LogUtil.d(str4, stringBuilder.toString());
                    }
                } else if (type == VEMonitorKeys.TYPE_DOUBLE) {
                    try {
                        jSONObject.put(str3, (double) Float.parseFloat((String) map.get(str3)));
                    } catch (Exception e2) {
                        LogUtil.d(TAG, "Parse float error");
                    }
                } else {
                    jSONObject.put(str3, map.get(str3));
                }
                if (!TextUtils.isEmpty(str2)) {
                    jSONObject.put("service", str2);
                }
            }
            if (iMonitor != null) {
                iMonitor.monitorLog(str, jSONObject);
            }
            return true;
        } catch (JSONException e3) {
            LogUtil.d(TAG, "No monitor callback, skip");
            return false;
        }
    }
}
