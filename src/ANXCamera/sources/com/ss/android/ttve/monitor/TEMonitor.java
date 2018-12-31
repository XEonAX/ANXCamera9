package com.ss.android.ttve.monitor;

import android.text.TextUtils;
import android.util.Log;
import com.ss.android.ttve.common.TELogUtil;
import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;

public class TEMonitor {
    public static int MONITOR_ACTION_CANCEL = 0;
    public static int MONITOR_ACTION_COMPILE = 1;
    private static final String TAG = "TEMonitor";
    private static WeakReference<IMonitor> sMonitor;

    public static void init() {
    }

    public static void report(int i) {
        TEMonitorInvoker.nativeMonitorPerf(i);
    }

    public static void register(IMonitor iMonitor) {
        TEMonitorInvoker.nativeInit();
        sMonitor = new WeakReference(iMonitor);
    }

    public static void clear() {
    }

    public static void setUserId(String str) {
        MonitorUtils.setUserId(str);
    }

    public static void setDeviceId(String str) {
        MonitorUtils.setDeviceId(str);
    }

    public static void setAppVersion(String str) {
        MonitorUtils.setAppVersion(str);
    }

    public static String getUserId() {
        return MonitorUtils.getUserId();
    }

    public static String getDeviceId() {
        return MonitorUtils.getDeviceId();
    }

    public static String getAppVersion() {
        return MonitorUtils.getAppVersion();
    }

    public static void setSDKMonitorEnable(boolean z) {
        MonitorUtils.setEnable(z);
    }

    public static void perfLong(String str, long j) {
        if (TextUtils.isEmpty(str)) {
            TELogUtil.w(TAG, "perfLong: key is null");
        } else {
            TEMonitorInvoker.nativePerfLong(str, j);
        }
    }

    public static void perfDouble(String str, double d) {
        if (TextUtils.isEmpty(str)) {
            TELogUtil.w(TAG, "perfDouble: key is null");
        } else {
            TEMonitorInvoker.nativePerfDouble(str, d);
        }
    }

    public static void perfRational(String str, float f, float f2) {
        if (TextUtils.isEmpty(str)) {
            TELogUtil.w(TAG, "perfLong: key is null");
        } else {
            TEMonitorInvoker.nativePerfRational(str, f, f2);
        }
    }

    public static boolean monitorTELog(String str, String str2, long j) {
        Map hashMap = new HashMap();
        hashMap.put(str2, Long.valueOf(j));
        return monitorTELog(str, str2, hashMap);
    }

    public static boolean monitorTELog(String str, String str2, float f) {
        Map hashMap = new HashMap();
        hashMap.put(str2, Float.valueOf(f));
        return monitorTELog(str, str2, hashMap);
    }

    public static boolean monitorTELog(String str, String str2, String str3) {
        Map hashMap = new HashMap();
        hashMap.put(str2, str3);
        return monitorTELog(str, str2, hashMap);
    }

    public static boolean monitorTELog(String str, String str2, Map map) {
        return monitorTELog(sMonitor, str, str2, map);
    }

    private static boolean monitorTELog(WeakReference<IMonitor> weakReference, String str, String str2, Map map) {
        if (weakReference != null) {
            return true;
        }
        TELogUtil.d(TAG, "No monitor callback, return");
        return false;
    }

    private static void monitorVELog(JSONObject jSONObject) {
        try {
            putAll(TEMonitorInvoker.nativeGetMap(), jSONObject);
        } catch (JSONException e) {
            TELogUtil.e(TAG, "merge monitor logs error");
            e.printStackTrace();
        }
        getIsComplete(jSONObject);
        reportMonitor(sMonitor, "sdk_video_edit_compose", jSONObject);
    }

    private static int getIsComplete(JSONObject jSONObject) {
        return 0;
    }

    private static void reportMonitor(WeakReference<IMonitor> weakReference, String str, JSONObject jSONObject) {
        MonitorUtils.monitorStatusRate("sdk_video_edit_compose", getIsComplete(jSONObject), jSONObject);
        if (weakReference != null && weakReference.get() != null) {
            try {
                ((IMonitor) weakReference.get()).monitorLog(str, jSONObject);
            } catch (Throwable e) {
                Log.e(TAG, "Something happened when monitor log", e);
            }
        }
    }

    private static void putAll(Map map, JSONObject jSONObject) throws JSONException {
        for (String str : map.keySet()) {
            int type = TEMonitorKeys.getType(str);
            if (type == TEMonitorKeys.TYPE_INT) {
                try {
                    jSONObject.put(str, Integer.parseInt((String) map.get(str)));
                } catch (Exception e) {
                    String str2 = TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("Parse int error:");
                    stringBuilder.append(map.get(str));
                    TELogUtil.d(str2, stringBuilder.toString());
                }
            } else if (type == TEMonitorKeys.TYPE_DOUBLE) {
                try {
                    jSONObject.put(str, (double) Float.parseFloat((String) map.get(str)));
                } catch (Exception e2) {
                    TELogUtil.d(TAG, "Parse float error");
                }
            } else {
                jSONObject.put(str, map.get(str));
            }
        }
    }
}
