package org.greenrobot.greendao;

import android.util.Log;

public class DaoLog {
    public static final int ASSERT = 7;
    public static final int DEBUG = 3;
    public static final int ERROR = 6;
    public static final int INFO = 4;
    private static final String TAG = "greenDAO";
    public static final int VERBOSE = 2;
    public static final int WARN = 5;

    public static boolean isLoggable(int i) {
        return Log.isLoggable(TAG, i);
    }

    public static String getStackTraceString(Throwable th) {
        return Log.getStackTraceString(th);
    }

    public static int println(int i, String str) {
        return Log.println(i, TAG, str);
    }

    public static int v(String str) {
        return Log.v(TAG, str);
    }

    public static int v(String str, Throwable th) {
        return Log.v(TAG, str, th);
    }

    public static int d(String str) {
        return Log.d(TAG, str);
    }

    public static int d(String str, Throwable th) {
        return Log.d(TAG, str, th);
    }

    public static int i(String str) {
        return Log.i(TAG, str);
    }

    public static int i(String str, Throwable th) {
        return Log.i(TAG, str, th);
    }

    public static int w(String str) {
        return Log.w(TAG, str);
    }

    public static int w(String str, Throwable th) {
        return Log.w(TAG, str, th);
    }

    public static int w(Throwable th) {
        return Log.w(TAG, th);
    }

    public static int e(String str) {
        return Log.w(TAG, str);
    }

    public static int e(String str, Throwable th) {
        return Log.e(TAG, str, th);
    }
}
