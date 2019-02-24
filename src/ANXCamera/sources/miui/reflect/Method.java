package miui.reflect;

import com.miui.internal.os.Native;

public class Method {
    private long mPtr = 0;

    private Method() {
    }

    public static Method of(Class<?> cls, String str, String str2) throws NoSuchMethodException {
        return Native.getMethod((Class) cls, str, str2);
    }

    public static Method of(Class<?> cls, String str, Class<?> cls2, Class<?>... clsArr) {
        return Native.getMethod((Class) cls, str, ReflectUtils.getSignature(clsArr, cls2));
    }

    public static Method of(String str, String str2, String str3) throws NoSuchClassException, NoSuchMethodException {
        return Native.getMethod(str, str2, str3);
    }

    public static Method of(java.lang.reflect.Method method) {
        return Native.getMethod(method);
    }

    public java.lang.reflect.Method toReflect() {
        return Native.getReflectMethod(this);
    }

    public void invoke(Class<?> cls, Object obj, Object... objArr) throws IllegalArgumentException {
        Native.invoke(this, cls, obj, objArr);
    }

    public boolean invokeBoolean(Class<?> cls, Object obj, Object... objArr) throws IllegalArgumentException {
        return Native.invokeBoolean(this, cls, obj, objArr);
    }

    public byte invokeByte(Class<?> cls, Object obj, Object... objArr) throws IllegalArgumentException {
        return Native.invokeByte(this, cls, obj, objArr);
    }

    public char invokeChar(Class<?> cls, Object obj, Object... objArr) throws IllegalArgumentException {
        return Native.invokeChar(this, cls, obj, objArr);
    }

    public short invokeShort(Class<?> cls, Object obj, Object... objArr) throws IllegalArgumentException {
        return Native.invokeShort(this, cls, obj, objArr);
    }

    public int invokeInt(Class<?> cls, Object obj, Object... objArr) throws IllegalArgumentException {
        return Native.invokeInt(this, cls, obj, objArr);
    }

    public long invokeLong(Class<?> cls, Object obj, Object... objArr) throws IllegalArgumentException {
        return Native.invokeLong(this, cls, obj, objArr);
    }

    public float invokeFloat(Class<?> cls, Object obj, Object... objArr) throws IllegalArgumentException {
        return Native.invokeFloat(this, cls, obj, objArr);
    }

    public double invokeDouble(Class<?> cls, Object obj, Object... objArr) throws IllegalArgumentException {
        return Native.invokeDouble(this, cls, obj, objArr);
    }

    public Object invokeObject(Class<?> cls, Object obj, Object... objArr) throws IllegalArgumentException {
        return Native.invokeObject(this, cls, obj, objArr);
    }
}
