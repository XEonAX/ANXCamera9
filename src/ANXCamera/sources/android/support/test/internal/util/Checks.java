package android.support.test.internal.util;

import android.os.Looper;

public final class Checks {
    private Checks() {
    }

    public static <T> T checkNotNull(T t) {
        if (t != null) {
            return t;
        }
        throw new NullPointerException();
    }

    public static <T> T checkNotNull(T t, Object obj) {
        if (t != null) {
            return t;
        }
        throw new NullPointerException(String.valueOf(obj));
    }

    public static <T> T checkNotNull(T t, String str, Object... objArr) {
        if (t != null) {
            return t;
        }
        throw new NullPointerException(format(str, objArr));
    }

    public static void checkArgument(boolean z) {
        if (!z) {
            throw new IllegalArgumentException();
        }
    }

    public static void checkArgument(boolean z, Object obj) {
        if (!z) {
            throw new IllegalArgumentException(String.valueOf(obj));
        }
    }

    public static void checkArgument(boolean z, String str, Object... objArr) {
        if (!z) {
            throw new IllegalArgumentException(format(str, objArr));
        }
    }

    public static void checkState(boolean z) {
        if (!z) {
            throw new IllegalStateException();
        }
    }

    public static void checkState(boolean z, Object obj) {
        if (!z) {
            throw new IllegalStateException(String.valueOf(obj));
        }
    }

    public static void checkState(boolean z, String str, Object... objArr) {
        if (!z) {
            throw new IllegalStateException(format(str, objArr));
        }
    }

    public static void checkMainThread() {
        checkState(Thread.currentThread().equals(Looper.getMainLooper().getThread()), "Method cannot be called off the main application thread (on: %s)", Thread.currentThread().getName());
    }

    public static void checkNotMainThread() {
        checkState(Thread.currentThread().equals(Looper.getMainLooper().getThread()) ^ true, "Method cannot be called on the main application thread (on: %s)", Thread.currentThread().getName());
    }

    private static String format(String str, Object... objArr) {
        str = String.valueOf(str);
        StringBuilder stringBuilder = new StringBuilder(str.length() + (16 * objArr.length));
        int i = 0;
        int i2 = 0;
        while (i < objArr.length) {
            int indexOf = str.indexOf("%s", i2);
            if (indexOf == -1) {
                break;
            }
            stringBuilder.append(str.substring(i2, indexOf));
            i2 = i + 1;
            stringBuilder.append(objArr[i]);
            int i3 = i2;
            i2 = indexOf + 2;
            i = i3;
        }
        stringBuilder.append(str.substring(i2));
        if (i < objArr.length) {
            stringBuilder.append(" [");
            int i4 = i + 1;
            stringBuilder.append(objArr[i]);
            while (i4 < objArr.length) {
                stringBuilder.append(", ");
                i = i4 + 1;
                stringBuilder.append(objArr[i4]);
                i4 = i;
            }
            stringBuilder.append(']');
        }
        return stringBuilder.toString();
    }
}
