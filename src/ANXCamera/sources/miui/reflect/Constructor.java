package miui.reflect;

import com.miui.internal.os.Native;

public class Constructor {
    private long mPtr = 0;

    private Constructor() {
    }

    public static Constructor of(Class<?> cls, String str) throws NoSuchMethodException {
        return Native.getConstructor((Class) cls, str);
    }

    public static Constructor of(Class<?> cls, Class<?>... clsArr) throws NoSuchMethodException {
        return Native.getConstructor((Class) cls, ReflectUtils.getSignature(clsArr, Void.TYPE));
    }

    public static Constructor of(String str, String str2) throws NoSuchMethodException, NoSuchClassException {
        return Native.getConstructor(str, str2);
    }

    public static Constructor of(java.lang.reflect.Constructor<?> constructor) {
        return Native.getConstructor(constructor);
    }

    public java.lang.reflect.Constructor<?> toRefelect() {
        return Native.getReflectConstructor(this);
    }

    public Object newInstance(Object... objArr) throws IllegalArgumentException {
        return Native.newInstance(this, objArr);
    }
}
