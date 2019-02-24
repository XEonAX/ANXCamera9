package miui.reflect;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.WeakHashMap;

public class ReflectUtils {
    private static final String Fa = "this$0";
    private static Class<?>[] Fb = new Class[]{Boolean.TYPE, Byte.TYPE, Character.TYPE, Short.TYPE, Integer.TYPE, Long.TYPE, Float.TYPE, Double.TYPE, Void.TYPE};
    private static String[] Fc = new String[]{Field.BOOLEAN_SIGNATURE_PRIMITIVE, Field.BYTE_SIGNATURE_PRIMITIVE, Field.CHAR_SIGNATURE_PRIMITIVE, "S", Field.INT_SIGNATURE_PRIMITIVE, Field.LONG_SIGNATURE_PRIMITIVE, Field.FLOAT_SIGNATURE_PRIMITIVE, Field.DOUBLE_SIGNATURE_PRIMITIVE, "V"};
    private static final WeakHashMap<Object, HashMap<String, Object>> Fd = new WeakHashMap();
    public static final String OBJECT_CONSTRUCTOR = "<init>";

    protected ReflectUtils() throws InstantiationException {
        throw new InstantiationException("Cannot instantiate utility class");
    }

    public static Object getSurroundingThis(Object obj) {
        return Field.of(obj.getClass(), Fa, getSignature(obj.getClass())).get(obj);
    }

    public static String getSignature(Class<?> cls) {
        for (int i = 0; i < Fb.length; i++) {
            if (cls == Fb[i]) {
                return Fc[i];
            }
        }
        return getSignature(cls.getName());
    }

    public static String getSignature(String str) {
        for (int i = 0; i < Fb.length; i++) {
            if (Fb[i].getName().equals(str)) {
                str = Fc[i];
            }
        }
        str = str.replace(".", "/");
        if (str.startsWith("[")) {
            return str;
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("L");
        stringBuilder.append(str);
        stringBuilder.append(";");
        return stringBuilder.toString();
    }

    public static String getSignature(Class<?>[] clsArr, Class<?> cls) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append('(');
        if (clsArr != null) {
            for (Class signature : clsArr) {
                stringBuilder.append(getSignature(signature));
            }
        }
        stringBuilder.append(')');
        stringBuilder.append(getSignature((Class) cls));
        return stringBuilder.toString();
    }

    public static void updateField(Class<?> cls, Object obj, Object obj2, Object obj3) throws IllegalArgumentException {
        if (cls == null && obj == null) {
            throw new IllegalArgumentException("clazz and holder cannot be all null");
        }
        Class cls2;
        if (cls2 == null) {
            cls2 = obj.getClass();
        }
        while (cls2 != null) {
            Field[] declaredFields = cls2.getDeclaredFields();
            int length = declaredFields.length;
            int i = 0;
            while (i < length) {
                Field field = declaredFields[i];
                field.setAccessible(true);
                try {
                    if (field.get(obj) == obj2) {
                        field.set(obj, obj3);
                    }
                    i++;
                } catch (Throwable e) {
                    throw new RuntimeException(e);
                }
            }
            cls2 = cls2.getSuperclass();
        }
    }

    public static Object setAdditionalField(Object obj, String str, Object obj2) {
        if (obj == null) {
            throw new NullPointerException("object must not be null");
        } else if (str != null) {
            HashMap hashMap;
            synchronized (Fd) {
                hashMap = (HashMap) Fd.get(obj);
                if (hashMap == null) {
                    hashMap = new HashMap();
                    Fd.put(obj, hashMap);
                }
            }
            synchronized (hashMap) {
                obj = hashMap.put(str, obj2);
            }
            return obj;
        } else {
            throw new NullPointerException("fieldName must not be null");
        }
    }

    public static Object getAdditionalField(Object obj, String str) {
        if (obj == null) {
            throw new NullPointerException("object must not be null");
        } else if (str != null) {
            synchronized (Fd) {
                HashMap hashMap = (HashMap) Fd.get(obj);
                if (hashMap == null) {
                    return null;
                }
                Object obj2;
                synchronized (hashMap) {
                    obj2 = hashMap.get(str);
                }
                return obj2;
            }
        } else {
            throw new NullPointerException("fieldName must not be null");
        }
    }

    public static Object removeAdditionalField(Object obj, String str) {
        if (obj == null) {
            throw new NullPointerException("object must not be null");
        } else if (str != null) {
            synchronized (Fd) {
                HashMap hashMap = (HashMap) Fd.get(obj);
                if (hashMap == null) {
                    return null;
                }
                Object remove;
                synchronized (hashMap) {
                    remove = hashMap.remove(str);
                }
                return remove;
            }
        } else {
            throw new NullPointerException("fieldName must not be null");
        }
    }
}
