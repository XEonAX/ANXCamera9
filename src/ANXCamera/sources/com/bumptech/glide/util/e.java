package com.bumptech.glide.util;

import android.annotation.TargetApi;
import android.os.Build.VERSION;
import android.os.SystemClock;

/* compiled from: LogTime */
public final class e {
    private static final double pl;

    static {
        double d = 1.0d;
        if (VERSION.SDK_INT >= 17) {
            d = 1.0d / Math.pow(10.0d, 6.0d);
        }
        pl = d;
    }

    private e() {
    }

    @TargetApi(17)
    public static long eE() {
        if (VERSION.SDK_INT >= 17) {
            return SystemClock.elapsedRealtimeNanos();
        }
        return SystemClock.uptimeMillis();
    }

    public static double e(long j) {
        return ((double) (eE() - j)) * pl;
    }
}
