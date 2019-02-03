package com.ss.android.medialib.log;

import android.support.annotation.Keep;
import com.ss.android.medialib.NativePort.NativeLibsLoader;
import java.util.HashMap;
import java.util.Map;

@Keep
public class VEMonitorInvoker {
    public static native Map<String, String> nativeGetMap();

    public static native void nativeInit();

    public static native void nativeMonitorPerf(int i);

    public static native void nativePerfLong(String str, long j);

    public static native void nativePerfRational(String str, float f, float f2);

    public static native void nativeReset();

    static {
        NativeLibsLoader.loadLibrary();
    }

    public static void onNativeCallback_onMonitorLogInt(String str, String str2, long j) {
        VEMonitor.monitorVELog(str, str2, j);
    }

    public static void onNativeCallback_onMonitorLogFloat(String str, String str2, float f) {
        VEMonitor.monitorVELog(str, str2, f);
    }

    public static void onNativeCallback_onMonitorLogMap(String str, String str2, HashMap hashMap) {
        VEMonitor.monitorVELog(str, str2, (Map) hashMap);
    }

    public static void onNativeCallback_onMonitorLogJson(String str, String str2, String str3) {
        VEMonitor.monitorVELogJson(str, str2, str3);
    }
}
