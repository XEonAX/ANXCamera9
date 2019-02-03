package com.ss.android.ttve.monitor;

import android.support.annotation.Keep;
import com.ss.android.ttve.nativePort.TENativeLibsLoader;
import java.util.HashMap;
import java.util.Map;

@Keep
public class TEMonitorInvoker {
    public static native Map<String, String> nativeGetMap();

    public static native void nativeInit();

    public static native void nativeMonitorPerf(int i);

    public static native void nativePerfDouble(String str, double d);

    public static native void nativePerfLong(String str, long j);

    public static native void nativePerfRational(String str, float f, float f2);

    public static native void nativePerfString(String str, String str2);

    public static native void nativeReset();

    static {
        TENativeLibsLoader.loadLibrary();
    }

    public static void onNativeCallback_onMonitorLogInt(String str, String str2, long j) {
        TEMonitor.monitorTELog(str, str2, j);
    }

    public static void onNativeCallback_onMonitorLogFloat(String str, String str2, float f) {
        TEMonitor.monitorTELog(str, str2, f);
    }

    public static void onNativeCallback_onMonitorLogMap(String str, String str2, HashMap hashMap) {
        TEMonitor.monitorTELog(str, str2, (Map) hashMap);
    }
}
