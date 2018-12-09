package com.android.camera.log;

import android.content.ComponentName;
import android.content.Intent;
import android.os.Bundle;
import android.os.SystemProperties;
import com.android.camera.Util;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

public class Log {
    public static final int ASSERT = 7;
    private static final String CAMERA_LOGTAG_PREFIX = "CAM_";
    public static final String CONTINUAL = "CONTINUAL_";
    public static final int DEBUG = 3;
    private static final int DEFAULT = -1;
    public static final String EFFECT_TAG = "EFFECT_";
    public static final int ERROR = 6;
    public static final String GESTURE_TAG = "GESTURE_";
    public static final int INFO = 4;
    private static final int MAX_TAG_LEN = (23 - CAMERA_LOGTAG_PREFIX.length());
    public static final String SETTING_TAG = "SETTING_";
    public static final String SWITCH_TAG = "SWITCH_";
    private static final String TAG_DUMP_CAMERA_INTENT = "DUMP_CAMERA_INTENT";
    public static final String UI_THREAD_TAG = "UI_";
    public static final int VERBOSE = 2;
    public static final String VIEW_TAG = "VIEW_";
    public static final int WARN = 5;
    private static int sDebugPriority;

    @Retention(RetentionPolicy.SOURCE)
    public @interface DebugPriority {
    }

    static {
        int i = 2;
        sDebugPriority = 2;
        try {
            int overrideLevel = getOverrideLevel();
            if (overrideLevel != 0) {
                sDebugPriority = overrideLevel;
                return;
            }
            if (!Util.isDebugOsBuild()) {
                i = Integer.MAX_VALUE;
            }
            sDebugPriority = i;
        } catch (IllegalArgumentException e) {
            System.out.println(e.getMessage());
        }
    }

    private static String tagFormat(String str) {
        int length = str.length() - MAX_TAG_LEN;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(CAMERA_LOGTAG_PREFIX);
        if (length > 0) {
            str = str.substring(0, MAX_TAG_LEN);
        }
        stringBuilder.append(str);
        return stringBuilder.toString();
    }

    public static int c(String str, String str2) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(CONTINUAL);
        stringBuilder.append(str);
        str = tagFormat(stringBuilder.toString());
        if (shouldLogForDebug("CAM_CONTINUAL_", 2)) {
            return android.util.Log.v(str, str2);
        }
        return -1;
    }

    public static int v(String str, String str2) {
        str = tagFormat(str);
        if (isLoggable(str, 2)) {
            return android.util.Log.v(str, str2);
        }
        return -1;
    }

    public static int v(String str, String str2, Throwable th) {
        str = tagFormat(str);
        if (isLoggable(str, 2)) {
            return android.util.Log.v(str, str2, th);
        }
        return -1;
    }

    public static int d(String str, String str2) {
        str = tagFormat(str);
        if (isLoggable(str, 3)) {
            return android.util.Log.d(str, str2);
        }
        return -1;
    }

    public static int d(String str, String str2, Throwable th) {
        str = tagFormat(str);
        if (isLoggable(str, 3)) {
            return android.util.Log.d(str, str2, th);
        }
        return -1;
    }

    public static int i(String str, String str2) {
        str = tagFormat(str);
        if (isLoggable(str, 4)) {
            return android.util.Log.i(str, str2);
        }
        return -1;
    }

    public static int i(String str, String str2, Throwable th) {
        str = tagFormat(str);
        if (isLoggable(str, 4)) {
            return android.util.Log.i(str, str2, th);
        }
        return -1;
    }

    public static int w(String str, String str2) {
        str = tagFormat(str);
        if (isLoggable(str, 5)) {
            return android.util.Log.w(str, str2);
        }
        return -1;
    }

    public static int w(String str, String str2, Throwable th) {
        str = tagFormat(str);
        if (isLoggable(str, 5)) {
            return android.util.Log.w(str, str2, th);
        }
        return -1;
    }

    public static int w(String str, Throwable th) {
        str = tagFormat(str);
        if (isLoggable(str, 5)) {
            return android.util.Log.w(str, th);
        }
        return -1;
    }

    public static int e(String str, String str2) {
        str = tagFormat(str);
        if (isLoggable(str, 6)) {
            return android.util.Log.e(str, str2);
        }
        return -1;
    }

    public static int e(String str, String str2, Throwable th) {
        str = tagFormat(str);
        if (isLoggable(str, 6)) {
            return android.util.Log.e(str, str2, th);
        }
        return -1;
    }

    public static int getOverrideLevel() {
        return SystemProperties.getInt("camera.debug.log_level", 2);
    }

    private static boolean isLoggable(String str, int i) {
        return sDebugPriority <= i || shouldLog(str, i);
    }

    private static boolean shouldLogForDebug(String str, int i) {
        return android.util.Log.isLoggable(str, i);
    }

    private static boolean shouldLog(String str, int i) {
        return android.util.Log.isLoggable(CAMERA_LOGTAG_PREFIX, i) || android.util.Log.isLoggable(str, i);
    }

    public static void dumpIntent(String str, Intent intent) {
        if (!android.util.Log.isLoggable(TAG_DUMP_CAMERA_INTENT, 3)) {
            android.util.Log.v(str, "dumpIntent is not enable on this device.");
        } else if (intent == null) {
            android.util.Log.v(str, "intent is null.");
        } else {
            android.util.Log.v(str, "=================================================================");
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Intent[@");
            stringBuilder.append(Integer.toHexString(intent.hashCode()));
            stringBuilder.append("] content:");
            android.util.Log.v(str, stringBuilder.toString());
            stringBuilder = new StringBuilder();
            stringBuilder.append("Action   : ");
            stringBuilder.append(intent.getAction());
            android.util.Log.v(str, stringBuilder.toString());
            stringBuilder = new StringBuilder();
            stringBuilder.append("Category : ");
            stringBuilder.append(intent.getCategories());
            android.util.Log.v(str, stringBuilder.toString());
            stringBuilder = new StringBuilder();
            stringBuilder.append("Data     : ");
            stringBuilder.append(intent.getDataString());
            android.util.Log.v(str, stringBuilder.toString());
            dumpComponentName(str, intent.getComponent());
            Bundle extras = intent.getExtras();
            stringBuilder = new StringBuilder();
            stringBuilder.append("HasExtras: ");
            stringBuilder.append(hasExtras(extras));
            android.util.Log.v(str, stringBuilder.toString());
            dumpExtras(str, extras);
            android.util.Log.v(str, "=================================================================");
        }
    }

    private static void dumpComponentName(String str, ComponentName componentName) {
        if (componentName != null) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Component: ");
            stringBuilder.append(componentName.getPackageName());
            stringBuilder.append("/");
            stringBuilder.append(componentName.getClassName());
            android.util.Log.v(str, stringBuilder.toString());
            return;
        }
        android.util.Log.v(str, "Component: null");
    }

    private static void dumpExtras(String str, Bundle bundle) {
        if (bundle != null) {
            for (String str2 : bundle.keySet()) {
                Object obj = bundle.get(str2);
                if (obj instanceof Bundle) {
                    dumpExtras(str, (Bundle) obj);
                } else {
                    try {
                        StringBuilder stringBuilder = new StringBuilder();
                        stringBuilder.append("Extra[");
                        stringBuilder.append(str2);
                        stringBuilder.append("] :");
                        stringBuilder.append(String.valueOf(bundle.get(str2)));
                        android.util.Log.v(str, stringBuilder.toString());
                    } catch (Throwable e) {
                        StringBuilder stringBuilder2 = new StringBuilder();
                        stringBuilder2.append("Extra contains unknown class instance for [");
                        stringBuilder2.append(str2);
                        stringBuilder2.append("]: ");
                        android.util.Log.w(str, stringBuilder2.toString(), e);
                    }
                }
            }
        }
    }

    /* JADX WARNING: Missing block: B:4:0x0007, code:
            if (r3.isEmpty() == false) goto L_0x0014;
     */
    private static boolean hasExtras(android.os.Bundle r3) {
        /*
        r0 = 1;
        if (r3 == 0) goto L_0x0013;
    L_0x0003:
        r3 = r3.isEmpty();	 Catch:{ BadParcelableException -> 0x000a }
        if (r3 != 0) goto L_0x0013;
    L_0x0009:
        goto L_0x0014;
    L_0x000a:
        r3 = move-exception;
        r1 = "IntentLogger";
        r2 = "Extra contains unknown class instance: ";
        android.util.Log.w(r1, r2, r3);
        return r0;
    L_0x0013:
        r0 = 0;
    L_0x0014:
        return r0;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.log.Log.hasExtras(android.os.Bundle):boolean");
    }
}
