package com.bytedance.frameworks.core.monitor.config;

import java.util.List;
import org.json.JSONObject;

public interface IMonitorConfigure {
    long getMonitorLogMaxSaveCount();

    boolean getRemoveSwitch();

    String getReportTypeByUploadType(String str);

    List<String> getReportTypeList();

    List<String> getUploadTypeByReportType(String str);

    boolean isLogSendSwitch();

    int reportCount();

    int reportFailRepeatBaseTime();

    int reportFailRepeatCount();

    int reportInterval();

    JSONObject reportJsonHeaderInfo();

    List<String> reportUrl(String str);

    long stopMoreChannelInterval();
}
