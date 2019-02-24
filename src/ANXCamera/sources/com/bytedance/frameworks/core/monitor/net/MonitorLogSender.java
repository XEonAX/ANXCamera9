package com.bytedance.frameworks.core.monitor.net;

import android.text.TextUtils;
import com.bytedance.frameworks.core.monitor.MonitorCommonConstants;
import java.util.concurrent.ConcurrentHashMap;

public class MonitorLogSender {
    private static ConcurrentHashMap<String, ISendLog> mapAidSendLog = new ConcurrentHashMap();
    private static ConcurrentHashMap<String, ILogSendImpl> mapTypeLogSendImpl = new ConcurrentHashMap();

    public static void setISendLog(ISendLog iSendLog) {
        setISendLog(MonitorCommonConstants.DEFAULT_AID, iSendLog);
    }

    public static void setISendLog(String str, ISendLog iSendLog) {
        mapAidSendLog.put(str, iSendLog);
    }

    public static ISendLog getISendLog(String str) {
        return (ISendLog) mapAidSendLog.get(str);
    }

    public static void setImpl(String str, String str2, ILogSendImpl iLogSendImpl) {
        if (!TextUtils.isEmpty(str) && !TextUtils.isEmpty(str2) && iLogSendImpl != null) {
            ConcurrentHashMap concurrentHashMap = mapTypeLogSendImpl;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(str);
            stringBuilder.append(str2);
            concurrentHashMap.put(stringBuilder.toString(), iLogSendImpl);
        }
    }

    public static void setImpl(String str, ILogSendImpl iLogSendImpl) {
        setImpl(MonitorCommonConstants.DEFAULT_AID, str, iLogSendImpl);
    }

    public static boolean send(String str, String str2, String str3) {
        if (TextUtils.isEmpty(str) || TextUtils.isEmpty(str2) || TextUtils.isEmpty(str3)) {
            return false;
        }
        ConcurrentHashMap concurrentHashMap = mapTypeLogSendImpl;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(str);
        stringBuilder.append(str2);
        ILogSendImpl iLogSendImpl = (ILogSendImpl) concurrentHashMap.get(stringBuilder.toString());
        if (iLogSendImpl.logStopCollectSwitch()) {
            return false;
        }
        return iLogSendImpl.send(str3);
    }

    public static boolean send(String str, String str2) {
        return send(MonitorCommonConstants.DEFAULT_AID, str, str2);
    }

    public static boolean send(String str) {
        return send(MonitorCommonConstants.DEFAULT_AID, "monitor", str);
    }
}
