package com.bytedance.frameworks.core.monitor.util;

import org.json.JSONArray;
import org.json.JSONObject;

public final class JsonUtil {
    public static boolean isEmpty(JSONObject jSONObject) {
        return jSONObject == null || jSONObject.length() == 0;
    }

    public static boolean isEmpty(JSONArray jSONArray) {
        return jSONArray == null || jSONArray.length() == 0;
    }

    public static boolean hasData(JSONObject jSONObject) {
        return jSONObject != null && jSONObject.length() > 0;
    }

    public static boolean hasData(JSONArray jSONArray) {
        return jSONArray != null && jSONArray.length() > 0;
    }
}
