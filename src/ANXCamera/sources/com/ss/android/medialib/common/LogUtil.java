package com.ss.android.medialib.common;

import android.util.Log;

public class LogUtil {
    private static String APPNAME = "VESDK-";
    private static byte DEBUG_LEVEL = (byte) 15;
    public static byte DEBUG_LEVEL_D = (byte) 15;
    public static byte DEBUG_LEVEL_E = (byte) 1;
    public static byte DEBUG_LEVEL_I = (byte) 7;
    public static byte DEBUG_LEVEL_N = (byte) 0;
    public static byte DEBUG_LEVEL_V = (byte) 31;
    public static byte DEBUG_LEVEL_W = (byte) 3;
    private static byte LOGD = (byte) 8;
    private static byte LOGE = (byte) 1;
    private static byte LOGI = (byte) 4;
    private static byte LOGV = (byte) 16;
    private static byte LOGW = (byte) 2;

    public static void setUp(String str, byte b) {
        if (str != null && str.length() > 0) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(str);
            stringBuilder.append("-");
            APPNAME = stringBuilder.toString();
        }
        DEBUG_LEVEL = b;
    }

    public static void i(String str, String str2) {
        if ((LOGI & DEBUG_LEVEL) != 0) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(APPNAME);
            stringBuilder.append(str);
            Log.i(stringBuilder.toString(), str2);
        }
    }

    public static void d(String str, String str2) {
        if ((LOGD & DEBUG_LEVEL) != 0) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(APPNAME);
            stringBuilder.append(str);
            Log.d(stringBuilder.toString(), str2);
        }
    }

    public static void w(String str, String str2) {
        if ((LOGW & DEBUG_LEVEL) != 0) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(APPNAME);
            stringBuilder.append(str);
            Log.w(stringBuilder.toString(), str2);
        }
    }

    public static void w(String str, String str2, Throwable th) {
        if ((LOGW & DEBUG_LEVEL) != 0) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(APPNAME);
            stringBuilder.append(str);
            Log.w(stringBuilder.toString(), str2, th);
        }
    }

    public static void e(String str, String str2) {
        if ((LOGE & DEBUG_LEVEL) != 0) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(APPNAME);
            stringBuilder.append(str);
            Log.e(stringBuilder.toString(), str2);
        }
    }

    public static void v(String str, String str2) {
        if ((LOGV & DEBUG_LEVEL) != 0) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(APPNAME);
            stringBuilder.append(str);
            Log.v(stringBuilder.toString(), str2);
        }
    }

    public static void v(Class<?> cls, String str) {
        if ((LOGV & DEBUG_LEVEL) != 0) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(APPNAME);
            stringBuilder.append(cls.getSimpleName());
            Log.v(stringBuilder.toString(), str);
        }
    }

    public static void d(Class<?> cls, String str) {
        if ((LOGD & DEBUG_LEVEL) != 0) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(APPNAME);
            stringBuilder.append(cls.getSimpleName());
            Log.d(stringBuilder.toString(), str);
        }
    }

    public static void w(Class<?> cls, String str) {
        if ((LOGW & DEBUG_LEVEL) != 0) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(APPNAME);
            stringBuilder.append(cls.getSimpleName());
            Log.w(stringBuilder.toString(), str);
        }
    }

    public static void w(Class<?> cls, String str, Throwable th) {
        if ((LOGW & DEBUG_LEVEL) != 0) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(APPNAME);
            stringBuilder.append(cls.getSimpleName());
            Log.w(stringBuilder.toString(), str, th);
        }
    }

    public static void e(Class<?> cls, String str) {
        if ((LOGE & DEBUG_LEVEL) != 0) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(APPNAME);
            stringBuilder.append(cls.getSimpleName());
            Log.e(stringBuilder.toString(), str);
        }
    }

    public static void e(Class<?> cls, String str, Throwable th) {
        if ((LOGE & DEBUG_LEVEL) != 0) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(APPNAME);
            stringBuilder.append(cls.getSimpleName());
            Log.e(stringBuilder.toString(), str, th);
        }
    }
}
