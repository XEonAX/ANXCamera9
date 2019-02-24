package io.reactivex.internal.util;

import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.atomic.AtomicLong;

public final class BackpressureHelper {
    private BackpressureHelper() {
        throw new IllegalStateException("No instances!");
    }

    public static long addCap(long j, long j2) {
        j += j2;
        if (j < 0) {
            return Long.MAX_VALUE;
        }
        return j;
    }

    public static long multiplyCap(long j, long j2) {
        long j3 = j * j2;
        if (((j | j2) >>> 31) == 0 || j3 / j == j2) {
            return j3;
        }
        return Long.MAX_VALUE;
    }

    public static long add(AtomicLong atomicLong, long j) {
        while (true) {
            long j2 = atomicLong.get();
            if (j2 == Long.MAX_VALUE) {
                return Long.MAX_VALUE;
            }
            if (atomicLong.compareAndSet(j2, addCap(j2, j))) {
                return j2;
            }
        }
    }

    public static long addCancel(AtomicLong atomicLong, long j) {
        while (true) {
            long j2 = atomicLong.get();
            if (j2 == Long.MIN_VALUE) {
                return Long.MIN_VALUE;
            }
            if (j2 == Long.MAX_VALUE) {
                return Long.MAX_VALUE;
            }
            if (atomicLong.compareAndSet(j2, addCap(j2, j))) {
                return j2;
            }
        }
    }

    public static long produced(AtomicLong atomicLong, long j) {
        while (true) {
            long j2 = atomicLong.get();
            if (j2 == Long.MAX_VALUE) {
                return Long.MAX_VALUE;
            }
            long j3 = j2 - j;
            if (j3 < 0) {
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("More produced than requested: ");
                stringBuilder.append(j3);
                RxJavaPlugins.onError(new IllegalStateException(stringBuilder.toString()));
                j3 = 0;
            }
            if (atomicLong.compareAndSet(j2, j3)) {
                return j3;
            }
        }
    }

    public static long producedCancel(AtomicLong atomicLong, long j) {
        while (true) {
            long j2 = atomicLong.get();
            if (j2 == Long.MIN_VALUE) {
                return Long.MIN_VALUE;
            }
            if (j2 == Long.MAX_VALUE) {
                return Long.MAX_VALUE;
            }
            long j3 = j2 - j;
            if (j3 < 0) {
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("More produced than requested: ");
                stringBuilder.append(j3);
                RxJavaPlugins.onError(new IllegalStateException(stringBuilder.toString()));
                j3 = 0;
            }
            if (atomicLong.compareAndSet(j2, j3)) {
                return j3;
            }
        }
    }
}
