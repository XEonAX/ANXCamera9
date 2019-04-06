package com.arcsoft.avatar.d;

import android.util.Log;

/* compiled from: LOG */
public class g {
    public static boolean DEBUG = true;
    public static final String TAG = "Avatar_Jar";

    private g() {
    }

    public static void d(String str, String str2) {
        if (DEBUG) {
            Log.d(str, str2);
        }
    }

    public static void e(String str, String str2) {
        if (DEBUG) {
            Log.e(str, str2);
        }
    }

    public static void j(String str) {
        if (DEBUG) {
            Log.d(TAG, str);
        }
    }

    public static void v(String str, String str2) {
        if (DEBUG) {
            Log.v(str, str2);
        }
    }
}
