package miui.os;

import com.miui.internal.os.Native;
import java.util.ArrayList;

public class SystemProperties {
    private static final ArrayList<Runnable> Ej = new ArrayList();
    public static final int PROP_NAME_MAX = 31;
    public static final int PROP_VALUE_MAX = 91;

    protected SystemProperties() throws InstantiationException {
        throw new InstantiationException("Cannot instantiate utility class");
    }

    public static String get(String str) {
        if (str.length() <= 31) {
            return Native.getPropertyNative(str);
        }
        throw new IllegalArgumentException("key.length > 31");
    }

    public static String get(String str, String str2) {
        if (str.length() <= 31) {
            str = Native.getPropertyNative(str);
            if (str == null || str.length() == 0) {
                return str2;
            }
            return str;
        }
        throw new IllegalArgumentException("key.length > 31");
    }

    public static int getInt(String str, int i) {
        if (str.length() <= 31) {
            return Native.getIntPropertyNative(str, i);
        }
        throw new IllegalArgumentException("key.length > 31");
    }

    public static long getLong(String str, long j) {
        if (str.length() <= 31) {
            return Native.getLongPropertyNative(str, j);
        }
        throw new IllegalArgumentException("key.length > 31");
    }

    public static boolean getBoolean(String str, boolean z) {
        if (str.length() <= 31) {
            return Native.getBooleanPropertyNative(str, z);
        }
        throw new IllegalArgumentException("key.length > 31");
    }

    public static void set(String str, String str2) {
        if (str.length() > 31) {
            throw new IllegalArgumentException("key.length > 31");
        } else if (str2 == null || str2.length() <= 91) {
            Native.setPropertyNative(str, str2);
        } else {
            throw new IllegalArgumentException("val.length > 91");
        }
    }

    public static void set(String str, int i) {
        set(str, Integer.toString(i));
    }

    public static void set(String str, long j) {
        set(str, Long.toString(j));
    }

    public static void set(String str, boolean z) {
        set(str, Boolean.toString(z));
    }

    public static void addChangeCallback(Runnable runnable) {
        synchronized (Ej) {
            if (Ej.size() == 0) {
                Native.addPropertyChangeCallbackNative(SystemProperties.class);
            }
            Ej.add(runnable);
        }
    }

    public static void removeChangeCallback(Runnable runnable) {
        synchronized (Ej) {
            Ej.remove(runnable);
        }
    }

    protected static void callChangeCallbacks() {
        synchronized (Ej) {
            if (Ej.size() == 0) {
                return;
            }
            ArrayList arrayList = new ArrayList(Ej);
            for (int i = 0; i < Ej.size(); i++) {
                ((Runnable) arrayList.get(i)).run();
            }
        }
    }
}
