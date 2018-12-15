package miui.reflect;

import com.miui.internal.os.Native;

public class Field {
    public static final String BOOLEAN_SIGNATURE_PRIMITIVE = "Z";
    public static final String BYTE_SIGNATURE_PRIMITIVE = "B";
    public static final String CHAR_SIGNATURE_PRIMITIVE = "C";
    public static final String DOUBLE_SIGNATURE_PRIMITIVE = "D";
    public static final String FLOAT_SIGNATURE_PRIMITIVE = "F";
    public static final String INT_SIGNATURE_PRIMITIVE = "I";
    public static final String LONG_SIGNATURE_PRIMITIVE = "J";
    public static final String SHORT_SIGNATURE_PRIMITIVE = "S";
    public static final String VOID_SIGNATURE_PRIMITIVE = "V";
    private long mPtr = 0;

    private Field() {
    }

    public static Field of(Class<?> cls, String str, String str2) throws NoSuchFieldException {
        return Native.getField((Class) cls, str, str2);
    }

    public static Field of(Class<?> cls, String str, Class<?> cls2) throws NoSuchFieldException {
        return Native.getField((Class) cls, str, ReflectUtils.getSignature((Class) cls2));
    }

    public static Field of(String str, String str2, String str3) throws NoSuchFieldException, NoSuchClassException {
        return Native.getField(str, str2, str3);
    }

    public static Field of(java.lang.reflect.Field field) {
        return Native.getField(field);
    }

    public java.lang.reflect.Field toReflect() {
        return Native.getReflectField(this);
    }

    public void set(Object obj, boolean z) throws IllegalArgumentException {
        Native.setFieldValue(this, obj, z);
    }

    public void set(Object obj, byte b) throws IllegalArgumentException {
        Native.setFieldValue(this, obj, b);
    }

    public void set(Object obj, char c) throws IllegalArgumentException {
        Native.setFieldValue(this, obj, c);
    }

    public void set(Object obj, short s) throws IllegalArgumentException {
        Native.setFieldValue(this, obj, s);
    }

    public void set(Object obj, int i) throws IllegalArgumentException {
        Native.setFieldValue(this, obj, i);
    }

    public void set(Object obj, long j) throws IllegalArgumentException {
        Native.setFieldValue(this, obj, j);
    }

    public void set(Object obj, float f) throws IllegalArgumentException {
        Native.setFieldValue(this, obj, f);
    }

    public void set(Object obj, double d) throws IllegalArgumentException {
        Native.setFieldValue(this, obj, d);
    }

    public void set(Object obj, Object obj2) throws IllegalArgumentException {
        Native.setFieldValue(this, obj, obj2);
    }

    public boolean getBoolean(Object obj) throws IllegalArgumentException {
        return Native.getBooleanFieldValue(this, obj);
    }

    public byte getByte(Object obj) throws IllegalArgumentException {
        return Native.getByteFieldValue(this, obj);
    }

    public char getChar(Object obj) throws IllegalArgumentException {
        return Native.getCharFieldValue(this, obj);
    }

    public short getShort(Object obj) throws IllegalArgumentException {
        return Native.getShortFieldValue(this, obj);
    }

    public int getInt(Object obj) throws IllegalArgumentException {
        return Native.getIntFieldValue(this, obj);
    }

    public long getLong(Object obj) throws IllegalArgumentException {
        return Native.getLongFieldValue(this, obj);
    }

    public float getFloat(Object obj) throws IllegalArgumentException {
        return Native.getFloatFieldValue(this, obj);
    }

    public double getDouble(Object obj) throws IllegalArgumentException {
        return Native.getDoubleFieldValue(this, obj);
    }

    public Object get(Object obj) throws IllegalArgumentException {
        return Native.getObjectFieldValue(this, obj);
    }
}
