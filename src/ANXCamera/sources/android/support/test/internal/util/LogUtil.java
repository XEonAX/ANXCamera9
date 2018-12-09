package android.support.test.internal.util;

import android.support.test.InstrumentationRegistry;
import android.util.Log;

public final class LogUtil {

    interface Supplier<T> {
        T get();
    }

    static final /* synthetic */ String lambda$logDebug$0$LogUtil(String str) {
        return str;
    }

    public static void logDebug(String str, String str2, Object... objArr) {
        logDebug(str, new LogUtil$$Lambda$0(str2), objArr);
    }

    private static void logDebug(String str, Supplier<String> supplier, Object... objArr) {
        if (isLoggable(str, 3)) {
            Log.d(str, String.format((String) supplier.get(), objArr));
        }
    }

    public static void logDebugWithProcess(String str, String str2, Object... objArr) {
        logDebug(str, new LogUtil$$Lambda$1(str2), objArr);
    }

    static final /* synthetic */ String lambda$logDebugWithProcess$1$LogUtil(String str) {
        String currentProcessName = ProcessUtil.getCurrentProcessName(InstrumentationRegistry.getTargetContext());
        StringBuilder stringBuilder = new StringBuilder((4 + String.valueOf(str).length()) + String.valueOf(currentProcessName).length());
        stringBuilder.append(str);
        stringBuilder.append(" in ");
        stringBuilder.append(currentProcessName);
        return stringBuilder.toString();
    }

    private static boolean isLoggable(String str, int i) {
        if (str.length() > 23) {
            str = str.substring(0, 22);
        }
        return Log.isLoggable(str, i);
    }
}
