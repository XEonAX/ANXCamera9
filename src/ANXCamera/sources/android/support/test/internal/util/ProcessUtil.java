package android.support.test.internal.util;

import android.app.ActivityManager;
import android.app.ActivityManager.RunningAppProcessInfo;
import android.content.Context;
import android.os.Process;
import android.support.annotation.VisibleForTesting;
import android.text.TextUtils;
import android.util.Log;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
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
    /* Code decompiled incorrectly, please refer to instructions dump. */
    @VisibleForTesting
    static String getCurrentProcessNameUsingProc() {
        Throwable e;
        Throwable e2;
        String str = "";
        BufferedReader bufferedReader = null;
        try {
            BufferedReader bufferedReader2 = new BufferedReader(new FileReader("/proc/self/cmdline"));
            try {
                String trim = bufferedReader2.readLine().trim();
                try {
                    bufferedReader2.close();
                } catch (Throwable e3) {
                    Log.w(TAG, e3.getMessage(), e3);
                }
                return trim;
            } catch (Throwable e4) {
                BufferedReader bufferedReader3 = bufferedReader2;
                e2 = e4;
                bufferedReader = bufferedReader3;
            } catch (Throwable th) {
                e3 = th;
                bufferedReader = bufferedReader2;
                if (bufferedReader != null) {
                }
                throw e3;
            }
        } catch (IOException e5) {
            e2 = e5;
            try {
                Log.e(TAG, e2.getMessage(), e2);
                if (bufferedReader == null) {
                    return str;
                }
                try {
                    bufferedReader.close();
                    return str;
                } catch (Throwable e42) {
                    Log.w(TAG, e42.getMessage(), e42);
                    return str;
                }
            } catch (Throwable th2) {
                e3 = th2;
                if (bufferedReader != null) {
                    try {
                        bufferedReader.close();
                    } catch (Throwable e422) {
                        Log.w(TAG, e422.getMessage(), e422);
                    }
                }
                throw e3;
            }
        }
    }

    @VisibleForTesting
    static void resetProcessName() {
        processName = "";
    }
}
