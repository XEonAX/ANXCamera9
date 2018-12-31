package org.jcodec.platform;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Method;
import java.nio.charset.Charset;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

public class Platform {
    public static final String ISO8859_1 = "iso8859-1";
    public static final String UTF_16 = "UTF-16";
    public static final String UTF_16BE = "UTF-16BE";
    public static final String UTF_8 = "UTF-8";
    private static final Map<Class, Class> boxed2primitive = new HashMap();

    static {
        boxed2primitive.put(Void.class, Void.TYPE);
        boxed2primitive.put(Byte.class, Byte.TYPE);
        boxed2primitive.put(Short.class, Short.TYPE);
        boxed2primitive.put(Character.class, Character.TYPE);
        boxed2primitive.put(Integer.class, Integer.TYPE);
        boxed2primitive.put(Long.class, Long.TYPE);
        boxed2primitive.put(Float.class, Float.TYPE);
        boxed2primitive.put(Double.class, Double.TYPE);
    }

    public static <T> T newInstance(Class<T> cls, Object[] objArr) {
        try {
            return cls.getConstructor(classes(objArr)).newInstance(objArr);
        } catch (Throwable e) {
            throw new RuntimeException(e);
        }
    }

    private static Class[] classes(Object[] objArr) {
        Class[] clsArr = new Class[objArr.length];
        for (int i = 0; i < objArr.length; i++) {
            Class cls = objArr[i].getClass();
            if (boxed2primitive.containsKey(cls)) {
                clsArr[i] = (Class) boxed2primitive.get(cls);
            } else {
                clsArr[i] = cls;
            }
        }
        return clsArr;
    }

    public static String stringFromCharset(byte[] bArr, String str) {
        return new String(bArr, Charset.forName(str));
    }

    public static byte[] getBytesForCharset(String str, String str2) {
        return str.getBytes(Charset.forName(str2));
    }

    public static String stringFromCharset4(byte[] bArr, int i, int i2, String str) {
        return new String(bArr, i, i2, Charset.forName(str));
    }

    public static int[] copyOfRangeI(int[] iArr, int i, int i2) {
        return Arrays.copyOfRange(iArr, i, i2);
    }

    public static String arrayToString(Object[] objArr) {
        return Arrays.toString(objArr);
    }

    public static boolean deleteFile(File file) {
        return file.delete();
    }

    public static byte[] getBytes(String str) {
        try {
            return str.getBytes(ISO8859_1);
        } catch (UnsupportedEncodingException e) {
            return null;
        }
    }

    public static String stringFromBytes(byte[] bArr) {
        try {
            return new String(bArr, ISO8859_1);
        } catch (UnsupportedEncodingException e) {
            return null;
        }
    }

    public static boolean isAssignableFrom(Class cls, Class cls2) {
        if (cls == cls2 || cls.equals(cls2)) {
            return true;
        }
        return cls.isAssignableFrom(cls2);
    }

    public static <T> T invokeStaticMethod(Class<?> cls, String str, Object[] objArr) {
        try {
            for (Method method : cls.getDeclaredMethods()) {
                if (method.getName().equals(str)) {
                    return method.invoke(null, objArr);
                }
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(cls);
            stringBuilder.append(".");
            stringBuilder.append(str);
            throw new NoSuchMethodException(stringBuilder.toString());
        } catch (Throwable e) {
            throw new RuntimeException(e);
        }
    }

    public static long unsignedInt(int i) {
        return ((long) i) & 4294967295L;
    }
}
