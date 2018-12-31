package com.ss.android.ugc.effectmanager.common.utils;

import android.util.Log;

public class LogUtils {
    private static boolean isDebug = false;

    public static void debug() {
        isDebug = true;
    }

    public static void d(String str, String str2) {
        if (isDebug) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("djjowfy:  ");
            stringBuilder.append(str);
            Log.d(stringBuilder.toString(), str2);
        }
    }

    public static void e(String str, String str2) {
        if (isDebug) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("djjowfy:  ");
            stringBuilder.append(str);
            Log.e(stringBuilder.toString(), str2);
        }
    }
}
