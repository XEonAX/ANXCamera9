package bytedance.framwork.core.sdkmonitor;

import android.content.Context;
import android.support.annotation.NonNull;
import android.text.TextUtils;
import bytedance.framwork.core.sdkmonitor.SDKMonitor.IGetCommonParams;
import java.util.concurrent.ConcurrentHashMap;
import org.json.JSONObject;

public class SDKMonitorUtils {
    private static ConcurrentHashMap<String, SDKMonitor> sAidToMonitorCommon = new ConcurrentHashMap();

    public static synchronized void init(@NonNull Context context, @NonNull String str, @NonNull JSONObject jSONObject, IGetCommonParams iGetCommonParams) {
        synchronized (SDKMonitorUtils.class) {
            if (TextUtils.isEmpty(str)) {
                throw new IllegalArgumentException("param 'aid' is not allowed to assigned empty string");
            } else if (jSONObject == null) {
                throw new IllegalArgumentException("param 'headerInfo' is not allowed to be null");
            } else if (sAidToMonitorCommon.get(str) != null) {
            } else {
                sAidToMonitorCommon.put(str, new SDKMonitor(context, str, jSONObject, iGetCommonParams));
            }
        }
    }

    public static SDKMonitor getInstance(@NonNull String str) {
        if (TextUtils.isEmpty(str)) {
            throw new IllegalArgumentException("param 'aid' is not allowed to assigned empty string");
        } else if (sAidToMonitorCommon.get(str) != null) {
            return (SDKMonitor) sAidToMonitorCommon.get(str);
        } else {
            SDKMonitor sDKMonitor;
            synchronized (SDKMonitor.class) {
                if (sAidToMonitorCommon.get(str) != null) {
                    sDKMonitor = (SDKMonitor) sAidToMonitorCommon.get(str);
                } else {
                    throw new RuntimeException("please call init method before this");
                }
            }
            return sDKMonitor;
        }
    }
}
