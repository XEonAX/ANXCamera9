package com.bumptech.glide.util;

import android.annotation.TargetApi;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.os.Build.VERSION;
import android.os.Looper;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.bumptech.glide.load.model.l;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Queue;

/* compiled from: Util */
public final class k {
    private static final int pt = 31;
    private static final int pu = 17;
    private static final char[] pv = "0123456789abcdef".toCharArray();
    private static final char[] pw = new char[64];

    /* compiled from: Util */
    /* renamed from: com.bumptech.glide.util.k$1 */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] hb = new int[Config.values().length];

        static {
            try {
                hb[Config.ALPHA_8.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                hb[Config.RGB_565.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                hb[Config.ARGB_4444.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                hb[Config.RGBA_F16.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                hb[Config.ARGB_8888.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
        }
    }

    private k() {
    }

    @NonNull
    public static String j(@NonNull byte[] bArr) {
        String a;
        synchronized (pw) {
            a = a(bArr, pw);
        }
        return a;
    }

    @NonNull
    private static String a(@NonNull byte[] bArr, @NonNull char[] cArr) {
        for (int i = 0; i < bArr.length; i++) {
            int i2 = bArr[i] & 255;
            int i3 = i * 2;
            cArr[i3] = pv[i2 >>> 4];
            cArr[i3 + 1] = pv[i2 & 15];
        }
        return new String(cArr);
    }

    @Deprecated
    public static int f(@NonNull Bitmap bitmap) {
        return p(bitmap);
    }

    @TargetApi(19)
    public static int p(@NonNull Bitmap bitmap) {
        if (bitmap.isRecycled()) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Cannot obtain size for recycled Bitmap: ");
            stringBuilder.append(bitmap);
            stringBuilder.append("[");
            stringBuilder.append(bitmap.getWidth());
            stringBuilder.append("x");
            stringBuilder.append(bitmap.getHeight());
            stringBuilder.append("] ");
            stringBuilder.append(bitmap.getConfig());
            throw new IllegalStateException(stringBuilder.toString());
        }
        if (VERSION.SDK_INT >= 19) {
            try {
                return bitmap.getAllocationByteCount();
            } catch (NullPointerException e) {
            }
        }
        return bitmap.getHeight() * bitmap.getRowBytes();
    }

    public static int i(int i, int i2, @Nullable Config config) {
        return (i * i2) * f(config);
    }

    private static int f(@Nullable Config config) {
        if (config == null) {
            config = Config.ARGB_8888;
        }
        switch (AnonymousClass1.hb[config.ordinal()]) {
            case 1:
                return 1;
            case 2:
            case 3:
                return 2;
            case 4:
                return 8;
            default:
                return 4;
        }
    }

    public static boolean p(int i, int i2) {
        return T(i) && T(i2);
    }

    private static boolean T(int i) {
        return i > 0 || i == Integer.MIN_VALUE;
    }

    public static void eF() {
        if (!eH()) {
            throw new IllegalArgumentException("You must call this method on the main thread");
        }
    }

    public static void eG() {
        if (!eI()) {
            throw new IllegalArgumentException("You must call this method on a background thread");
        }
    }

    public static boolean eH() {
        return Looper.myLooper() == Looper.getMainLooper();
    }

    public static boolean eI() {
        return eH() ^ 1;
    }

    @NonNull
    public static <T> Queue<T> U(int i) {
        return new ArrayDeque(i);
    }

    @NonNull
    public static <T> List<T> c(@NonNull Collection<T> collection) {
        List<T> arrayList = new ArrayList(collection.size());
        for (Object next : collection) {
            if (next != null) {
                arrayList.add(next);
            }
        }
        return arrayList;
    }

    public static boolean b(@Nullable Object obj, @Nullable Object obj2) {
        if (obj == null) {
            return obj2 == null;
        } else {
            return obj.equals(obj2);
        }
    }

    public static boolean c(@Nullable Object obj, @Nullable Object obj2) {
        if (obj == null) {
            return obj2 == null;
        } else if (obj instanceof l) {
            return ((l) obj).p(obj2);
        } else {
            return obj.equals(obj2);
        }
    }

    public static int hashCode(int i) {
        return q(i, 17);
    }

    public static int q(int i, int i2) {
        return (i2 * 31) + i;
    }

    public static int hashCode(float f) {
        return a(f, 17);
    }

    public static int a(float f, int i) {
        return q(Float.floatToIntBits(f), i);
    }

    public static int a(@Nullable Object obj, int i) {
        return q(obj == null ? 0 : obj.hashCode(), i);
    }

    public static int a(boolean z, int i) {
        return q(z, i);
    }

    public static int hashCode(boolean z) {
        return a(z, 17);
    }
}
