package com.ss.android.ttve.monitor;

import android.text.TextUtils;
import com.ss.android.ttve.common.TELogUtil;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;

public class BaseMonitor {
    private static final String TAG = BaseMonitor.class.getSimpleName();
    public static IMonitor sMonitor;

    public static void register(IMonitor iMonitor) {
        sMonitor = iMonitor;
    }

    public static void unRegister() {
        sMonitor = null;
    }

    public static boolean monitorVELog(String str, String str2, long j) {
        return monitorVELog(str, str2, String.valueOf(j));
    }

    public static boolean monitorVELog(String str, String str2, float f) {
        return monitorVELog(str, str2, String.valueOf(f));
    }

    public static boolean monitorVELog(String str, String str2, String str3) {
        Map hashMap = new HashMap();
        hashMap.put(str2, str3);
        return monitorVELog(str, str2, hashMap);
    }

    public static boolean monitorVELog(String str, String str2, Map map) {
        return monitorVELog(sMonitor, str, str2, map);
    }

    public static boolean monitorVELog(IMonitor iMonitor, String str, String str2, Map map) {
        if (iMonitor == null) {
            TELogUtil.d(TAG, "No monitor callback, return");
            return false;
        }
        JSONObject jSONObject = new JSONObject();
        try {
            for (String str3 : map.keySet()) {
                jSONObject.put(str3, map.get(str3));
                if (!TextUtils.isEmpty(str2)) {
                    jSONObject.put("service", str2);
                }
            }
            if (iMonitor != null) {
                iMonitor.monitorLog(str, jSONObject);
            }
            return true;
        } catch (JSONException e) {
            TELogUtil.d(TAG, "No monitor callback, skip");
            return false;
        }
    }
}
