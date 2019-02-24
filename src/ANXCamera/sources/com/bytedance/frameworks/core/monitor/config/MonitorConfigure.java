package com.bytedance.frameworks.core.monitor.config;

import android.text.TextUtils;
import com.bytedance.frameworks.core.monitor.MonitorCommonConstants;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;
import org.json.JSONObject;

public class MonitorConfigure {
    private static ConcurrentHashMap<String, IMonitorConfigure> sAid2MonitorCogfigMap = new ConcurrentHashMap();
    private static IMonitorConfigure sDefCommonConfig = new DefaultMonitorConfigure();

    static {
        sAid2MonitorCogfigMap.put(MonitorCommonConstants.DEFAULT_AID, sDefCommonConfig);
    }

    public static void setCommonConfig(IMonitorConfigure iMonitorConfigure) {
        sDefCommonConfig = iMonitorConfigure;
        setCommonConfig(MonitorCommonConstants.DEFAULT_AID, iMonitorConfigure);
    }

    public static void setCommonConfig(String str, IMonitorConfigure iMonitorConfigure) {
        if (iMonitorConfigure != null) {
            sAid2MonitorCogfigMap.put(str, iMonitorConfigure);
        }
    }

    public static int getReportInterval(String str) {
        if (TextUtils.isEmpty(str) || sAid2MonitorCogfigMap.get(str) == null) {
            return sDefCommonConfig.reportInterval();
        }
        return ((IMonitorConfigure) sAid2MonitorCogfigMap.get(str)).reportInterval();
    }

    public static int getReportCount(String str) {
        if (TextUtils.isEmpty(str) || sAid2MonitorCogfigMap.get(str) == null) {
            return sDefCommonConfig.reportCount();
        }
        return ((IMonitorConfigure) sAid2MonitorCogfigMap.get(str)).reportCount();
    }

    public static List<String> getReportUrl(String str, String str2) {
        if (TextUtils.isEmpty(str) || sAid2MonitorCogfigMap.get(str) == null) {
            return sDefCommonConfig.reportUrl(str2);
        }
        return ((IMonitorConfigure) sAid2MonitorCogfigMap.get(str)).reportUrl(str2);
    }

    public static JSONObject getReportJsonHeaderInfo(String str) {
        if (TextUtils.isEmpty(str) || sAid2MonitorCogfigMap.get(str) == null) {
            return sDefCommonConfig.reportJsonHeaderInfo();
        }
        return ((IMonitorConfigure) sAid2MonitorCogfigMap.get(str)).reportJsonHeaderInfo();
    }

    public static int getReportFailRepeatCount(String str) {
        if (TextUtils.isEmpty(str) || sAid2MonitorCogfigMap.get(str) == null) {
            return sDefCommonConfig.reportFailRepeatCount();
        }
        return ((IMonitorConfigure) sAid2MonitorCogfigMap.get(str)).reportFailRepeatCount();
    }

    public static int getReportFailBaseTime(String str) {
        if (TextUtils.isEmpty(str) || sAid2MonitorCogfigMap.get(str) == null) {
            return sDefCommonConfig.reportFailRepeatBaseTime() * 1000;
        }
        return ((IMonitorConfigure) sAid2MonitorCogfigMap.get(str)).reportFailRepeatBaseTime() * 1000;
    }

    public static long getStopMoreChannelInterval(String str) {
        if (TextUtils.isEmpty(str) || sAid2MonitorCogfigMap.get(str) == null) {
            return sDefCommonConfig.stopMoreChannelInterval();
        }
        return ((IMonitorConfigure) sAid2MonitorCogfigMap.get(str)).stopMoreChannelInterval();
    }

    public static boolean getLogRemoveSwitch(String str) {
        if (TextUtils.isEmpty(str) || sAid2MonitorCogfigMap.get(str) == null) {
            return sDefCommonConfig.getRemoveSwitch();
        }
        return ((IMonitorConfigure) sAid2MonitorCogfigMap.get(str)).getRemoveSwitch();
    }

    public static List<String> getReportTypeList(String str) {
        if (TextUtils.isEmpty(str) || sAid2MonitorCogfigMap.get(str) == null) {
            return sDefCommonConfig.getReportTypeList();
        }
        return ((IMonitorConfigure) sAid2MonitorCogfigMap.get(str)).getReportTypeList();
    }

    public static List<String> getUploadTypeByReportType(String str, String str2) {
        if (TextUtils.isEmpty(str) || sAid2MonitorCogfigMap.get(str) == null) {
            return sDefCommonConfig.getUploadTypeByReportType(str2);
        }
        return ((IMonitorConfigure) sAid2MonitorCogfigMap.get(str)).getUploadTypeByReportType(str2);
    }

    public static String getReportTypeByUploadType(String str, String str2) {
        if (TextUtils.isEmpty(str) || sAid2MonitorCogfigMap.get(str) == null) {
            return sDefCommonConfig.getReportTypeByUploadType(str2);
        }
        return ((IMonitorConfigure) sAid2MonitorCogfigMap.get(str)).getReportTypeByUploadType(str2);
    }

    public static long getMaxMonitorLogSaveCount(String str) {
        if (TextUtils.isEmpty(str) || sAid2MonitorCogfigMap.get(str) == null) {
            return sDefCommonConfig.getMonitorLogMaxSaveCount();
        }
        return ((IMonitorConfigure) sAid2MonitorCogfigMap.get(str)).getMonitorLogMaxSaveCount();
    }
}
