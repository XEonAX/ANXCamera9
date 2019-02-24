package com.ss.android.ttve.monitor;

import android.text.TextUtils;
import android.util.Log;
import com.ss.android.medialib.log.IMonitor;
import com.ss.android.medialib.log.VEMonitor;
import com.ss.android.medialib.log.VEMonitorKeys;
import com.ss.android.ttve.common.TELogUtil;
import com.ss.android.vesdk.runtime.VERuntime;
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
        MonitorUtils.init(VERuntime.getInstance().getContext(), null, null, null);
        TEMonitorInvoker.nativeInit();
        VEMonitor.register(new IMonitor() {
            public void monitorLog(String str, JSONObject jSONObject) {
                TEMonitor.monitorVELog(jSONObject);
            }
        });
    }

    public static void report(int i) {
        TEMonitorInvoker.nativeMonitorPerf(i);
    }

    public static void register(IMonitor iMonitor) {
        sMonitor = new WeakReference(iMonitor);
    }

    public static void clear() {
        TEMonitorInvoker.nativeReset();
        VEMonitor.clear();
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

    public static void perfString(String str, String str2) {
        if (TextUtils.isEmpty(str)) {
            TELogUtil.w(TAG, "perfString: key is null");
            return;
        }
        if (str2 == null) {
            str2 = "";
        }
        TEMonitorInvoker.nativePerfString(str, str2);
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
        if (weakReference == null) {
            TELogUtil.d(TAG, "No monitor callback, return");
            return false;
        }
        map.putAll(VEMonitor.getMap());
        JSONObject jSONObject = new JSONObject();
        try {
            putAll(map, jSONObject);
            if (!TextUtils.isEmpty(str2)) {
                jSONObject.put("service", str2);
            }
            reportMonitor(weakReference, str, jSONObject);
            return true;
        } catch (JSONException e) {
            TELogUtil.d(TAG, "No monitor callback, skip");
            return false;
        }
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
        try {
            if (jSONObject.has("completed")) {
                return jSONObject.getInt("completed");
            }
            return 0;
        } catch (JSONException e) {
            TELogUtil.e(TAG, "get complete filed error!");
            e.printStackTrace();
            return 0;
        }
    }

    private static void reportMonitor(WeakReference<IMonitor> weakReference, String str, JSONObject jSONObject) {
        int isComplete;
        String str2 = "sdk_video_edit_compose";
        if (jSONObject != null) {
            isComplete = getIsComplete(jSONObject);
            try {
                if (jSONObject.has("service")) {
                    str2 = jSONObject.getString("service");
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }
        } else {
            isComplete = 0;
        }
        MonitorUtils.monitorStatusRate(str2, isComplete, jSONObject);
        if (weakReference != null && weakReference.get() != null) {
            try {
                ((IMonitor) weakReference.get()).monitorLog(str, jSONObject);
            } catch (Throwable e2) {
                Log.e(TAG, "Something happened when monitor log", e2);
            }
        }
    }

    private static void putAll(Map map, JSONObject jSONObject) throws JSONException {
        for (String str : map.keySet()) {
            int type;
            if (str.startsWith("iesve_")) {
                type = VEMonitorKeys.getType(str);
            } else {
                type = TEMonitorKeys.getType(str);
            }
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
