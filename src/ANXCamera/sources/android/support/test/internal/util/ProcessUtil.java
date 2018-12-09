package android.support.test.internal.util;

import android.app.ActivityManager;
import android.app.ActivityManager.RunningAppProcessInfo;
import android.content.Context;
import android.os.Process;
import android.support.annotation.VisibleForTesting;
import android.text.TextUtils;
import android.util.Log;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public final class ProcessUtil {
    private static final List<Integer> RETRY_WAIT_INTERVALS = Collections.unmodifiableList(Arrays.asList(new Integer[]{Integer.valueOf(8), Integer.valueOf(8), Integer.valueOf(16), Integer.valueOf(32), Integer.valueOf(64), Integer.valueOf(128), Integer.valueOf(256)}));
    private static final String TAG = "ProcessUtil";
    private static String processName;

    public static String getCurrentProcessName(Context context) {
        if (!TextUtils.isEmpty(processName)) {
            return processName;
        }
        try {
            processName = getCurrentProcessNameUsingActivityManager(context);
            if (processName.isEmpty()) {
                Log.w(TAG, "Could not figure out process name using ActivityManager, falling back to use /proc. Note that processName fetched from /proc may be truncated!");
                processName = getCurrentProcessNameUsingProc();
                if (processName.isEmpty()) {
                    Log.w(TAG, "Could not figure out process name /proc either");
                }
            }
            return processName;
        } catch (SecurityException e) {
            Log.i(TAG, "Could not read process name from ActivityManager (isolatedProcess?)");
            return "";
        }
    }

    @VisibleForTesting
    static String getCurrentProcessNameUsingActivityManager(Context context) {
        int myPid = Process.myPid();
        ActivityManager activityManager = (ActivityManager) context.getSystemService("activity");
        if (activityManager != null) {
            Iterable runningAppProcesses = activityManager.getRunningAppProcesses();
            if (runningAppProcesses == null) {
                int i = 0;
                while (runningAppProcesses == null && i < RETRY_WAIT_INTERVALS.size()) {
                    try {
                        Log.i(TAG, "Waiting for running app processes...");
                        int i2 = i + 1;
                        Thread.sleep((long) ((Integer) RETRY_WAIT_INTERVALS.get(i)).intValue());
                        runningAppProcesses = activityManager.getRunningAppProcesses();
                        i = i2;
                    } catch (Throwable e) {
                        Log.w(TAG, "Interrupted while waiting for running app processes", e);
                        return "";
                    }
                }
            }
            for (RunningAppProcessInfo runningAppProcessInfo : emptyIfNull(runningAppProcesses)) {
                if (runningAppProcessInfo.pid == myPid) {
                    return runningAppProcessInfo.processName;
                }
            }
            Log.w(TAG, "Couldn't get running processes from ActivityManager!");
        } else {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder(89);
            stringBuilder.append("ActivityManager#getRunningAppProcesses did not return an entry matching pid = ");
            stringBuilder.append(myPid);
            Log.w(str, stringBuilder.toString());
        }
        return "";
    }

    private static <E> Iterable<E> emptyIfNull(Iterable<E> iterable) {
        return iterable == null ? Collections.emptyList() : iterable;
    }

    /* JADX WARNING: Removed duplicated region for block: B:24:0x0055 A:{SYNTHETIC, Splitter: B:24:0x0055} */
    @android.support.annotation.VisibleForTesting
    static java.lang.String getCurrentProcessNameUsingProc() {
        /*
        r0 = "";
        r1 = 0;
        r2 = new java.io.BufferedReader;	 Catch:{ IOException -> 0x0035 }
        r3 = new java.io.FileReader;	 Catch:{ IOException -> 0x0035 }
        r4 = "/proc/self/cmdline";
        r3.<init>(r4);	 Catch:{ IOException -> 0x0035 }
        r2.<init>(r3);	 Catch:{ IOException -> 0x0035 }
        r1 = r2.readLine();	 Catch:{ IOException -> 0x002e, all -> 0x002b }
        r1 = r1.trim();	 Catch:{ IOException -> 0x002e, all -> 0x002b }
        r2.close();	 Catch:{ Exception -> 0x001d }
        goto L_0x0028;
    L_0x001d:
        r0 = move-exception;
        r2 = "ProcessUtil";
        r3 = r0.getMessage();
        android.util.Log.w(r2, r3, r0);
        goto L_0x0029;
    L_0x0029:
        r0 = r1;
        goto L_0x0051;
    L_0x002b:
        r0 = move-exception;
        r1 = r2;
        goto L_0x0052;
    L_0x002e:
        r1 = move-exception;
        r5 = r2;
        r2 = r1;
        r1 = r5;
        goto L_0x0036;
    L_0x0033:
        r0 = move-exception;
        goto L_0x0052;
    L_0x0035:
        r2 = move-exception;
    L_0x0036:
        r3 = "ProcessUtil";
        r4 = r2.getMessage();	 Catch:{ all -> 0x0033 }
        android.util.Log.e(r3, r4, r2);	 Catch:{ all -> 0x0033 }
        if (r1 == 0) goto L_0x0050;
    L_0x0041:
        r1.close();	 Catch:{ Exception -> 0x0045 }
        goto L_0x0050;
    L_0x0045:
        r1 = move-exception;
        r2 = "ProcessUtil";
        r3 = r1.getMessage();
        android.util.Log.w(r2, r3, r1);
        goto L_0x0051;
    L_0x0051:
        return r0;
        if (r1 == 0) goto L_0x0064;
    L_0x0055:
        r1.close();	 Catch:{ Exception -> 0x0059 }
        goto L_0x0064;
    L_0x0059:
        r1 = move-exception;
        r2 = r1.getMessage();
        r3 = "ProcessUtil";
        android.util.Log.w(r3, r2, r1);
    L_0x0064:
        throw r0;
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.test.internal.util.ProcessUtil.getCurrentProcessNameUsingProc():java.lang.String");
    }

    @VisibleForTesting
    static void resetProcessName() {
        processName = "";
    }
}
