package com.arcsoft.avatar.d;

import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/* compiled from: ArrayUtil */
public class c {
    private static final String a = c.class.getSimpleName();
    private static final double b = 1.0E-9d;

    private c() {
    }

    public static <T> String a(T[] tArr) {
        return Arrays.toString(tArr);
    }

    public static <T extends Comparable<? super T>> void a(T[] tArr) {
        Arrays.sort(tArr);
    }

    public static <T> boolean a(T t, T t2) {
        boolean z = true;
        if (t == null && t2 == null) {
            return true;
        }
        if (t == null || t2 == null) {
            return false;
        }
        double abs;
        if (t instanceof Byte) {
            if (((Byte) t).byteValue() != ((Byte) t2).byteValue()) {
                z = false;
            }
            return z;
        } else if (t instanceof Short) {
            if (((Short) t).shortValue() != ((Short) t2).shortValue()) {
                z = false;
            }
            return z;
        } else if (t instanceof Integer) {
            if (((Integer) t).intValue() != ((Integer) t2).intValue()) {
                z = false;
            }
            return z;
        } else if (t instanceof Long) {
            if (((Long) t).longValue() != ((Long) t2).longValue()) {
                z = false;
            }
            return z;
        } else if (t instanceof Float) {
            abs = (double) Math.abs(((Float) t).floatValue() - ((Float) t2).floatValue());
            if (abs <= -1.0E-9d || abs >= b) {
                z = false;
            }
            return z;
        } else if (!(t instanceof Double)) {
            return t instanceof String ? ((String) t).equals((String) t2) : t.equals(t2);
        } else {
            abs = Math.abs(((Double) t).doubleValue() - ((Double) t2).doubleValue());
            if (abs <= -1.0E-9d || abs >= b) {
                z = false;
            }
            return z;
        }
    }

    public static boolean a(int[] iArr, int i) {
        if (iArr == null || iArr.length <= 0) {
            return false;
        }
        for (int i2 : iArr) {
            if (i2 == i) {
                return true;
            }
        }
        return false;
    }

    public static <T> boolean a(T[] tArr, T t) {
        if (tArr == null || tArr.length <= 0) {
            return false;
        }
        for (Object a : tArr) {
            if (a(a, (Object) t)) {
                return true;
            }
        }
        return false;
    }

    public static <T> T[] a(T[] tArr, Class<T> cls) {
        Set hashSet = new HashSet();
        for (Object add : tArr) {
            hashSet.add(add);
        }
        return hashSet.toArray((Object[]) Array.newInstance(cls, hashSet.size()));
    }

    public static <T> T[] a(T[] tArr, T t, Class<T> cls) {
        if (!a((Object[]) tArr, (Object) t)) {
            return tArr;
        }
        int length = tArr.length;
        int i = 0;
        if (length == 1) {
            return tArr[0] == t ? (Object[]) Array.newInstance(cls, 0) : tArr;
        } else {
            int[] c = c(tArr, t);
            if (c == null || c.length <= 0) {
                return tArr;
            }
            Object[] objArr = (Object[]) Array.newInstance(cls, length - c.length);
            int i2 = 0;
            while (i < length) {
                if (!a(c, i)) {
                    objArr[i2] = tArr[i];
                    i2++;
                }
                i++;
            }
            return objArr;
        }
    }

    public static <T> T[] a(T[] tArr, T[]... tArr2) {
        int length = tArr.length;
        for (T[] length2 : tArr2) {
            length += length2.length;
        }
        Object copyOf = Arrays.copyOf(tArr, length);
        int length3 = tArr.length;
        length = length3;
        for (Object obj : tArr2) {
            System.arraycopy(obj, 0, copyOf, length, obj.length);
            length += obj.length;
        }
        return copyOf;
    }

    public static <T> int b(T[] tArr, T t) {
        int i = -1;
        if (tArr == null) {
            return -1;
        }
        int length = tArr.length;
        for (int i2 = 0; i2 < length; i2++) {
            if (a((Object) t, tArr[i2])) {
                i = i2;
                break;
            }
        }
        return i;
    }

    public static int[] b(int[] iArr) {
        if (iArr == null || iArr.length <= 1) {
            return iArr;
        }
        int length = iArr.length;
        int i = 0;
        while (i < length - 1) {
            int i2;
            int i3 = i + 1;
            int i4 = i;
            for (i2 = i3; i2 < length; i2++) {
                if (iArr[i4] > iArr[i2]) {
                    i4 = i2;
                }
            }
            if (i4 != i) {
                i2 = iArr[i];
                iArr[i] = iArr[i4];
                iArr[i4] = i2;
            }
            i = i3;
        }
        return iArr;
    }

    public static <T> int[] c(T[] tArr, T t) {
        if (!a((Object[]) tArr, (Object) t)) {
            return new int[0];
        }
        int length = tArr.length;
        Object obj = new int[length];
        int i = 0;
        int i2 = i;
        while (i < length) {
            if (a(tArr[i], (Object) t)) {
                obj[i2] = i;
                i2++;
            }
            i++;
        }
        if (i2 == 0) {
            return new int[0];
        }
        Object obj2 = new int[i2];
        System.arraycopy(obj, 0, obj2, 0, i2);
        return obj2;
    }

    public static <T> void reverse(T[] tArr) {
        if (tArr != null && tArr.length != 0 && tArr.length != 1) {
            int length = tArr.length;
            int i = length / 2;
            for (int i2 = 0; i2 < i; i2++) {
                T t = tArr[i2];
                int i3 = (length - i2) - 1;
                tArr[i2] = tArr[i3];
                tArr[i3] = t;
            }
        }
    }

    public static <T extends Comparable<? super T>> void sort(List<T> list) {
        Collections.sort(list);
    }
}
