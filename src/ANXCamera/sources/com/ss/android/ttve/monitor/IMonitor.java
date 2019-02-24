package com.ss.android.ttve.monitor;

import android.support.annotation.Keep;
import org.json.JSONObject;

@Keep
public interface IMonitor {
    void monitorLog(String str, JSONObject jSONObject);
}
