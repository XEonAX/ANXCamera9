package com.miui.internal.os;

import miui.reflect.Constructor;
import miui.reflect.Field;
import miui.reflect.Method;
import miui.reflect.ReflectUtils;

public class Native {
    public static native void addPropertyChangeCallbackNative(Class<?> cls);

    public static native boolean chmod(String str, int i, int i2);

    public static native boolean chown(String str, int i, int i2, int i3);

    public static native boolean getBooleanFieldValue(Field field, Object obj);

    public static native boolean getBooleanPropertyNative(String str, boolean z);

    public static native byte getByteFieldValue(Field field, Object obj);

    public static native char getCharFieldValue(Field field, Object obj);

    public static native Constructor getConstructor(Class<?> cls, String str);

    private static native Constructor getConstructor(Class<?> cls, String str, String str2, java.lang.reflect.Constructor<?> constructor);

    public static native Constructor getConstructor(String str, String str2);

    public static native double getDoubleFieldValue(Field field, Object obj);

    public static native Field getField(Class<?> cls, String str, String str2);

    private static native Field getField(Class<?> cls, String str, String str2, String str3, boolean z, java.lang.reflect.Field field);

    public static native Field getField(String str, String str2, String str3);

    public static native float getFloatFieldValue(Field field, Object obj);

    public static native int getIntFieldValue(Field field, Object obj);

    public static native int getIntPropertyNative(String str, int i);

    public static native long getLongFieldValue(Field field, Object obj);

    public static native long getLongPropertyNative(String str, long j);

    public static native Method getMethod(Class<?> cls, String str, String str2);

    private static native Method getMethod(Class<?> cls, String str, String str2, String str3, boolean z, java.lang.reflect.Method method);

    public static native Method getMethod(String str, String str2, String str3);

    public static native Object getObjectFieldValue(Field field, Object obj);

    public static native String getPropertyNative(String str);

    public static native java.lang.reflect.Constructor<?> getReflectConstructor(Constructor constructor);

    public static native java.lang.reflect.Field getReflectField(Field field);

    public static native java.lang.reflect.Method getReflectMethod(Method method);

    public static native short getShortFieldValue(Field field, Object obj);

    public static native void invoke(Method method, Class<?> cls, Object obj, Object[] objArr);

    public static native boolean invokeBoolean(Method method, Class<?> cls, Object obj, Object[] objArr);

    public static native byte invokeByte(Method method, Class<?> cls, Object obj, Object[] objArr);

    public static native char invokeChar(Method method, Class<?> cls, Object obj, Object[] objArr);

    public static native double invokeDouble(Method method, Class<?> cls, Object obj, Object[] objArr);

    public static native float invokeFloat(Method method, Class<?> cls, Object obj, Object[] objArr);

    public static native int invokeInt(Method method, Class<?> cls, Object obj, Object[] objArr);

    public static native long invokeLong(Method method, Class<?> cls, Object obj, Object[] objArr);

    public static native Object invokeObject(Method method, Class<?> cls, Object obj, Object[] objArr);

    public static native short invokeShort(Method method, Class<?> cls, Object obj, Object[] objArr);

    public static native Object newInstance(Constructor constructor, Object[] objArr);

    public static native boolean rm(String str, int i);

    public static native void setFieldValue(Field field, Object obj, byte b);

    public static native void setFieldValue(Field field, Object obj, char c);

    public static native void setFieldValue(Field field, Object obj, double d);

    public static native void setFieldValue(Field field, Object obj, float f);

    public static native void setFieldValue(Field field, Object obj, int i);

    public static native void setFieldValue(Field field, Object obj, long j);

    public static native void setFieldValue(Field field, Object obj, Object obj2);

    public static native void setFieldValue(Field field, Object obj, short s);

    public static native void setFieldValue(Field field, Object obj, boolean z);

    public static native void setPropertyNative(String str, String str2);

    public static native int umask(int i);

    static {
        System.loadLibrary("miuinative");
    }

    private Native() {
    }

    public static Method getMethod(java.lang.reflect.Method method) {
        return getMethod(method.getDeclaringClass(), method.getDeclaringClass().getName(), method.getName(), ReflectUtils.getSignature(method.getParameterTypes(), method.getReturnType()), (method.getModifiers() & 8) != 0, method);
    }

    public static Constructor getConstructor(java.lang.reflect.Constructor<?> constructor) {
        return getConstructor(constructor.getDeclaringClass(), constructor.getDeclaringClass().getName(), ReflectUtils.getSignature(constructor.getParameterTypes(), Void.TYPE), constructor);
    }

    public static Field getField(java.lang.reflect.Field field) {
        return getField(field.getDeclaringClass(), field.getDeclaringClass().getName(), field.getName(), ReflectUtils.getSignature(field.getType()), (field.getModifiers() & 8) != 0, field);
    }
}
