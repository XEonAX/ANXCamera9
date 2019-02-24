package com.android.volley;

import android.util.Log;
import java.util.Locale;

/* renamed from: com.android.volley.VolleyLog */
public class C0032VolleyLog {
    public static boolean DEBUG = Log.isLoggable(TAG, 2);
    public static String TAG = "Volley";

    public static void setTag(String tag) {
        C0032VolleyLog.d("Changing log tag to %s", tag);
        TAG = tag;
        DEBUG = Log.isLoggable(TAG, 2);
    }

    public static void v(String format, Object... args) {
        if (DEBUG) {
            Log.v(TAG, C0032VolleyLog.buildMessage(format, args));
        }
    }

    public static void d(String format, Object... args) {
        Log.d(TAG, C0032VolleyLog.buildMessage(format, args));
    }

    public static void e(String format, Object... args) {
        Log.e(TAG, C0032VolleyLog.buildMessage(format, args));
    }

    public static void e(Throwable tr, String format, Object... args) {
        Log.e(TAG, C0032VolleyLog.buildMessage(format, args), tr);
    }

    public static void wtf(String format, Object... args) {
        Log.wtf(TAG, C0032VolleyLog.buildMessage(format, args));
    }

    public static void wtf(Throwable tr, String format, Object... args) {
        Log.wtf(TAG, C0032VolleyLog.buildMessage(format, args), tr);
    }

    private static String buildMessage(String format, Object... args) {
        String msg = args == null ? format : String.format(Locale.US, format, args);
        StackTraceElement[] trace = new Throwable().fillInStackTrace().getStackTrace();
        String caller = "<unknown>";
        for (int i = 2; i < trace.length; i++) {
            if (!trace[i].getClass().equals(C0032VolleyLog.class)) {
                String callingClass = trace[i].getClassName();
                callingClass = callingClass.substring(callingClass.lastIndexOf(46) + 1);
                callingClass = callingClass.substring(callingClass.lastIndexOf(36) + 1);
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append(callingClass);
                stringBuilder.append(".");
                stringBuilder.append(trace[i].getMethodName());
                caller = stringBuilder.toString();
                break;
            }
        }
        return String.format(Locale.US, "[%d] %s: %s", new Object[]{Long.valueOf(Thread.currentThread().getId()), caller, msg});
    }
}
