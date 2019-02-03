package com.bytedance.frameworks.core.monitor.config;

import com.bytedance.frameworks.core.monitor.MonitorCommonConstants;
import java.util.List;
import org.json.JSONObject;

public class DefaultMonitorConfigure implements IMonitorConfigure {
    public int reportInterval() {
        return 120;
    }

    public int reportCount() {
        return 100;
    }

    public List<String> reportUrl(String str) {
        return null;
    }

    public JSONObject reportJsonHeaderInfo() {
        return null;
    }

    public int reportFailRepeatCount() {
        return 4;
    }

    public int reportFailRepeatBaseTime() {
        return 15;
    }

    public long stopMoreChannelInterval() {
        return MonitorCommonConstants.STOP_MORE_CHANNEL_INTERVAL;
    }

    public boolean getRemoveSwitch() {
        return false;
    }

    public boolean isLogSendSwitch() {
        return true;
    }

    public List<String> getReportTypeList() {
        return null;
    }

    public List<String> getUploadTypeByReportType(String str) {
        return null;
    }

    public String getReportTypeByUploadType(String str) {
        return null;
    }

    public long getMonitorLogMaxSaveCount() {
        return 40000;
    }
}
