package miui.util;

import android.util.Log;
import com.ss.android.ttve.common.TEDefine;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.HashMap;
import org.apache.miui.commons.lang3.ClassUtils;
import org.apache.miui.commons.lang3.reflect.MemberUtils;

public class ReflectionUtils {
    public static final ClassLoader BOOTCLASSLOADER = ClassLoader.getSystemClassLoader();
    private static final String TAG = "ReflectionUtils";
    private static final HashMap<String, Constructor<?>> constructorCache = new HashMap();
    private static final HashMap<String, Field> fieldCache = new HashMap();
    private static final HashMap<String, Method> methodCache = new HashMap();

    public static Class<?> findClass(String className, ClassLoader classLoader) throws ClassNotFoundException {
        if (classLoader == null) {
            classLoader = BOOTCLASSLOADER;
        }
        return ClassUtils.getClass(classLoader, className, false);
    }

    public static Class<?> tryFindClass(String className, ClassLoader classLoader) {
        try {
            return findClass(className, classLoader);
        } catch (ClassNotFoundException ex) {
            Log.w(TAG, "", ex);
            return null;
        }
    }

    public static Field findField(Class<?> clazz, String fieldName) throws NoSuchFieldException {
        StringBuilder sb = new StringBuilder(clazz.getName());
        sb.append('#');
        sb.append(fieldName);
        String fullFieldName = sb.toString();
        synchronized (fieldCache) {
            if (fieldCache.containsKey(fullFieldName)) {
                Field field = (Field) fieldCache.get(fullFieldName);
                if (field != null) {
                    return field;
                }
                throw new NoSuchFieldException(fullFieldName);
            }
            try {
                Field field2 = findFieldRecursiveImpl(clazz, fieldName);
                field2.setAccessible(true);
                synchronized (fieldCache) {
                    fieldCache.put(fullFieldName, field2);
                }
                return field2;
            } catch (NoSuchFieldException e) {
                NoSuchFieldException e2 = e;
                synchronized (fieldCache) {
                    fieldCache.put(fullFieldName, null);
                    throw e2;
                }
            }
        }
    }

    public static Field tryFindField(Class<?> clazz, String fieldName) {
        try {
            return findField(clazz, fieldName);
        } catch (NoSuchFieldException ex) {
            Log.w(TAG, "", ex);
            return null;
        }
    }

    private static Field findFieldRecursiveImpl(Class<?> clazz, String fieldName) throws NoSuchFieldException {
        try {
            return clazz.getDeclaredField(fieldName);
        } catch (NoSuchFieldException e) {
            while (true) {
                clazz = clazz.getSuperclass();
                if (clazz == null || clazz.equals(Object.class)) {
                    throw e;
                }
                try {
                    return clazz.getDeclaredField(fieldName);
                } catch (NoSuchFieldException e2) {
                }
            }
            throw e;
        }
    }

    public static Method findMethodExact(Class<?> clazz, String methodName, Object... parameterTypes) throws ClassNotFoundException, NoSuchMethodException {
        Class[] parameterClasses = null;
        int i = parameterTypes.length - 1;
        while (i >= 0) {
            Object type = parameterTypes[i];
            if (type != null) {
                if (parameterClasses == null) {
                    parameterClasses = new Class[(i + 1)];
                }
                if (type instanceof Class) {
                    parameterClasses[i] = (Class) type;
                } else if (type instanceof String) {
                    parameterClasses[i] = findClass((String) type, clazz.getClassLoader());
                } else {
                    throw new IllegalArgumentException("parameter type must either be specified as Class or String", null);
                }
                i--;
            } else {
                throw new NullPointerException("parameter type must not be null");
            }
        }
        if (parameterClasses == null) {
            parameterClasses = new Class[0];
        }
        return findMethodExact((Class) clazz, methodName, parameterClasses);
    }

    public static Method tryFindMethodExact(Class<?> clazz, String methodName, Object... parameterTypes) {
        try {
            return findMethodExact((Class) clazz, methodName, parameterTypes);
        } catch (ClassNotFoundException ex) {
            Log.w(TAG, "", ex);
            return null;
        } catch (NoSuchMethodException ex2) {
            Log.w(TAG, "", ex2);
            return null;
        }
    }

    public static Method findMethodExact(Class<?> clazz, String methodName, Class<?>... parameterTypes) throws NoSuchMethodException {
        StringBuilder sb = new StringBuilder(clazz.getName());
        sb.append('#');
        sb.append(methodName);
        sb.append(getParametersString(parameterTypes));
        sb.append("#exact");
        String fullMethodName = sb.toString();
        synchronized (methodCache) {
            if (methodCache.containsKey(fullMethodName)) {
                Method method = (Method) methodCache.get(fullMethodName);
                if (method != null) {
                    return method;
                }
                throw new NoSuchMethodException(fullMethodName);
            }
            try {
                Method method2 = clazz.getDeclaredMethod(methodName, parameterTypes);
                method2.setAccessible(true);
                synchronized (methodCache) {
                    methodCache.put(fullMethodName, method2);
                }
                return method2;
            } catch (NoSuchMethodException e) {
                NoSuchMethodException e2 = e;
                synchronized (methodCache) {
                    methodCache.put(fullMethodName, null);
                    throw e2;
                }
            }
        }
    }

    public static Method tryFindMethodExact(Class<?> clazz, String methodName, Class<?>... parameterTypes) {
        try {
            return findMethodExact((Class) clazz, methodName, (Class[]) parameterTypes);
        } catch (NoSuchMethodException ex) {
            Log.w(TAG, "", ex);
            return null;
        }
    }

    public static Method findMethodBestMatch(Class<?> clazz, String methodName, Class<?>... parameterTypes) throws NoSuchMethodException {
        StringBuilder sb = new StringBuilder(clazz.getName());
        sb.append('#');
        sb.append(methodName);
        sb.append(getParametersString(parameterTypes));
        sb.append("#bestmatch");
        String fullMethodName = sb.toString();
        synchronized (methodCache) {
            if (methodCache.containsKey(fullMethodName)) {
                Method method = (Method) methodCache.get(fullMethodName);
                if (method != null) {
                    return method;
                }
                throw new NoSuchMethodException(fullMethodName);
            }
            try {
                Method method2 = findMethodExact((Class) clazz, methodName, (Class[]) parameterTypes);
                synchronized (methodCache) {
                    methodCache.put(fullMethodName, method2);
                }
                return method2;
            } catch (NoSuchMethodException e) {
                Method bestMatch = null;
                for (Method method3 : clazz.getDeclaredMethods()) {
                    if (method3.getName().equals(methodName) && ClassUtils.isAssignable(parameterTypes, method3.getParameterTypes(), true) && (bestMatch == null || MemberUtils.compareParameterTypes(method3.getParameterTypes(), bestMatch.getParameterTypes(), parameterTypes) < 0)) {
                        bestMatch = method3;
                    }
                }
                if (bestMatch != null) {
                    bestMatch.setAccessible(true);
                    synchronized (methodCache) {
                        methodCache.put(fullMethodName, bestMatch);
                        return bestMatch;
                    }
                }
                NoSuchMethodException e2 = new NoSuchMethodException(fullMethodName);
                synchronized (methodCache) {
                    methodCache.put(fullMethodName, null);
                    throw e2;
                }
            }
        }
    }

    public static Method tryFindMethodBestMatch(Class<?> clazz, String methodName, Class<?>... parameterTypes) {
        try {
            return findMethodBestMatch((Class) clazz, methodName, (Class[]) parameterTypes);
        } catch (NoSuchMethodException ex) {
            Log.w(TAG, "", ex);
            return null;
        }
    }

    public static Method findMethodBestMatch(Class<?> clazz, String methodName, Object... args) throws NoSuchMethodException {
        return findMethodBestMatch((Class) clazz, methodName, getParameterTypes(args));
    }

    public static Method tryFindMethodBestMatch(Class<?> clazz, String methodName, Object... args) {
        try {
            return findMethodBestMatch((Class) clazz, methodName, args);
        } catch (NoSuchMethodException ex) {
            Log.w(TAG, "", ex);
            return null;
        }
    }

    public static Class<?>[] getParameterTypes(Object... args) {
        Class<?>[] clazzes = new Class[args.length];
        for (int i = 0; i < args.length; i++) {
            clazzes[i] = args[i] != null ? args[i].getClass() : null;
        }
        return clazzes;
    }

    public static Class<?>[] getClassesAsArray(Class<?>... clazzes) {
        return clazzes;
    }

    private static String getParametersString(Class<?>... clazzes) {
        StringBuilder sb = new StringBuilder("(");
        boolean first = true;
        for (Class<?> clazz : clazzes) {
            if (first) {
                first = false;
            } else {
                sb.append(",");
            }
            if (clazz != null) {
                sb.append(clazz.getCanonicalName());
            } else {
                sb.append(TEDefine.FACE_BEAUTY_NULL);
            }
        }
        sb.append(")");
        return sb.toString();
    }

    public static Constructor<?> findConstructorExact(Class<?> clazz, Class<?>... parameterTypes) throws NoSuchMethodException {
        StringBuilder sb = new StringBuilder(clazz.getName());
        sb.append(getParametersString(parameterTypes));
        sb.append("#exact");
        String fullConstructorName = sb.toString();
        synchronized (constructorCache) {
            if (constructorCache.containsKey(fullConstructorName)) {
                Constructor<?> constructor = (Constructor) constructorCache.get(fullConstructorName);
                if (constructor != null) {
                    return constructor;
                }
                throw new NoSuchMethodException(fullConstructorName);
            }
            try {
                Constructor<?> constructor2 = clazz.getDeclaredConstructor(parameterTypes);
                constructor2.setAccessible(true);
                synchronized (constructorCache) {
                    constructorCache.put(fullConstructorName, constructor2);
                }
                return constructor2;
            } catch (NoSuchMethodException e) {
                NoSuchMethodException e2 = e;
                synchronized (constructorCache) {
                    constructorCache.put(fullConstructorName, null);
                    throw e2;
                }
            }
        }
    }

    public static Constructor<?> tryFindConstructorExact(Class<?> clazz, Class<?>... parameterTypes) {
        try {
            return findConstructorExact(clazz, parameterTypes);
        } catch (NoSuchMethodException ex) {
            Log.w(TAG, "", ex);
            return null;
        }
    }

    public static Constructor<?> findConstructorBestMatch(Class<?> clazz, Class<?>... parameterTypes) throws NoSuchMethodException {
        StringBuilder sb = new StringBuilder(clazz.getName());
        sb.append(getParametersString(parameterTypes));
        sb.append("#bestmatch");
        String fullConstructorName = sb.toString();
        synchronized (constructorCache) {
            if (constructorCache.containsKey(fullConstructorName)) {
                Constructor<?> constructor = (Constructor) constructorCache.get(fullConstructorName);
                if (constructor != null) {
                    return constructor;
                }
                throw new NoSuchMethodException(fullConstructorName);
            }
            try {
                Constructor<?> constructor2 = findConstructorExact(clazz, parameterTypes);
                synchronized (constructorCache) {
                    constructorCache.put(fullConstructorName, constructor2);
                }
                return constructor2;
            } catch (NoSuchMethodException e) {
                Constructor<?> bestMatch = null;
                for (Constructor<?> constructor3 : clazz.getDeclaredConstructors()) {
                    if (ClassUtils.isAssignable(parameterTypes, constructor3.getParameterTypes(), true) && (bestMatch == null || MemberUtils.compareParameterTypes(constructor3.getParameterTypes(), bestMatch.getParameterTypes(), parameterTypes) < 0)) {
                        bestMatch = constructor3;
                    }
                }
                if (bestMatch != null) {
                    bestMatch.setAccessible(true);
                    synchronized (constructorCache) {
                        constructorCache.put(fullConstructorName, bestMatch);
                        return bestMatch;
                    }
                }
                NoSuchMethodException e2 = new NoSuchMethodException(fullConstructorName);
                synchronized (constructorCache) {
                    constructorCache.put(fullConstructorName, null);
                    throw e2;
                }
            }
        }
    }

    public static Constructor<?> tryFindConstructorBestMatch(Class<?> clazz, Class<?>... parameterTypes) {
        try {
            return findConstructorBestMatch((Class) clazz, (Class[]) parameterTypes);
        } catch (NoSuchMethodException ex) {
            Log.w(TAG, "", ex);
            return null;
        }
    }

    public static Constructor<?> findConstructorBestMatch(Class<?> clazz, Object... args) throws NoSuchMethodException {
        return findConstructorBestMatch((Class) clazz, getParameterTypes(args));
    }

    public static Constructor<?> tryFindConstructorBestMatch(Class<?> clazz, Object... args) {
        try {
            return findConstructorBestMatch((Class) clazz, args);
        } catch (NoSuchMethodException ex) {
            Log.w(TAG, "", ex);
            return null;
        }
    }

    public static void setObjectField(Object obj, String fieldName, Object value) throws NoSuchFieldException, IllegalAccessException, IllegalArgumentException {
        findField(obj.getClass(), fieldName).set(obj, value);
    }

    public static void trySetObjectField(Object obj, String fieldName, Object value) {
        try {
            setObjectField(obj, fieldName, value);
        } catch (NoSuchFieldException ex) {
            Log.w(TAG, "", ex);
        } catch (IllegalAccessException ex2) {
            Log.w(TAG, "", ex2);
        } catch (IllegalArgumentException ex3) {
            Log.w(TAG, "", ex3);
        }
    }

    public static <T> T getObjectField(Object obj, String fieldName, Class<T> fieldClazz) throws NoSuchFieldException, IllegalAccessException, IllegalArgumentException {
        return checkFieldValue(findField(obj.getClass(), fieldName).get(obj), fieldClazz);
    }

    public static <T> ObjectReference<T> tryGetObjectField(Object obj, String fieldName, Class<T> fieldClazz) {
        try {
            return new ObjectReference(getObjectField(obj, fieldName, fieldClazz));
        } catch (NoSuchFieldException ex) {
            Log.w(TAG, "", ex);
            return null;
        } catch (IllegalAccessException ex2) {
            Log.w(TAG, "", ex2);
            return null;
        } catch (IllegalArgumentException ex3) {
            Log.w(TAG, "", ex3);
            return null;
        }
    }

    public static <T> T getSurroundingThis(Object obj, Class<T> surroundingClazz) throws NoSuchFieldException, IllegalAccessException, IllegalArgumentException {
        return getObjectField(obj, "this$0", surroundingClazz);
    }

    public static <T> ObjectReference<T> tryGetSurroundingThis(Object obj, Class<T> surroundingClazz) {
        try {
            return new ObjectReference(getSurroundingThis(obj, surroundingClazz));
        } catch (NoSuchFieldException ex) {
            Log.w(TAG, "", ex);
            return null;
        } catch (IllegalAccessException ex2) {
            Log.w(TAG, "", ex2);
            return null;
        } catch (IllegalArgumentException ex3) {
            Log.w(TAG, "", ex3);
            return null;
        }
    }

    public static void setStaticObjectField(Class<?> clazz, String fieldName, Object value) throws NoSuchFieldException, IllegalAccessException, IllegalArgumentException {
        try {
            findField(clazz, fieldName).set(null, value);
        } catch (NullPointerException ex) {
            Log.w(TAG, "", ex);
            throw new IllegalArgumentException(ex);
        }
    }

    public static void trySetStaticObjectField(Class<?> clazz, String fieldName, Object value) {
        try {
            setStaticObjectField(clazz, fieldName, value);
        } catch (NoSuchFieldException ex) {
            Log.w(TAG, "", ex);
        } catch (IllegalAccessException ex2) {
            Log.w(TAG, "", ex2);
        } catch (IllegalArgumentException ex3) {
            Log.w(TAG, "", ex3);
        }
    }

    public static <T> T getStaticObjectField(Class<?> clazz, String fieldName, Class<T> fieldClazz) throws NoSuchFieldException, IllegalAccessException, IllegalArgumentException {
        try {
            return checkFieldValue(findField(clazz, fieldName).get(null), fieldClazz);
        } catch (NullPointerException ex) {
            Log.w(TAG, "", ex);
            throw new IllegalArgumentException(ex);
        }
    }

    public static <T> ObjectReference<T> tryGetStaticObjectField(Class<?> clazz, String fieldName, Class<T> fieldClazz) {
        try {
            return new ObjectReference(getStaticObjectField(clazz, fieldName, fieldClazz));
        } catch (NoSuchFieldException ex) {
            Log.w(TAG, "", ex);
            return null;
        } catch (IllegalAccessException ex2) {
            Log.w(TAG, "", ex2);
            return null;
        } catch (IllegalArgumentException ex3) {
            Log.w(TAG, "", ex3);
            return null;
        }
    }

    private static Object checkFieldValue(Object value, Class<?> fieldClazz) throws IllegalArgumentException {
        if (fieldClazz == Void.class) {
            throw new IllegalArgumentException("fieldClazz");
        } else if (value == null) {
            return null;
        } else {
            if (fieldClazz == null || ClassUtils.isAssignable(value.getClass(), fieldClazz, true)) {
                return value;
            }
            throw new IllegalArgumentException("fieldClazz");
        }
    }

    public static <T> T callMethod(Object obj, String methodName, Class<T> returnValueClazz, Object... args) throws NoSuchMethodException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        return checkMethodReturnValue(findMethodBestMatch(obj.getClass(), methodName, args).invoke(obj, args), returnValueClazz);
    }

    public static <T> ObjectReference<T> tryCallMethod(Object obj, String methodName, Class<T> returnValueClazz, Object... args) {
        try {
            return new ObjectReference(callMethod(obj, methodName, returnValueClazz, args));
        } catch (NoSuchMethodException ex) {
            Log.w(TAG, "", ex);
            return null;
        } catch (IllegalAccessException ex2) {
            Log.w(TAG, "", ex2);
            return null;
        } catch (IllegalArgumentException ex3) {
            Log.w(TAG, "", ex3);
            return null;
        } catch (InvocationTargetException ex4) {
            Log.w(TAG, "", ex4);
            return null;
        }
    }

    public static <T> T callStaticMethod(Class<?> clazz, String methodName, Class<T> returnValueClazz, Object... args) throws NoSuchMethodException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        try {
            return checkMethodReturnValue(findMethodBestMatch((Class) clazz, methodName, args).invoke(null, args), returnValueClazz);
        } catch (NullPointerException ex) {
            Log.w(TAG, "", ex);
            throw new IllegalArgumentException(ex);
        }
    }

    public static <T> ObjectReference<T> tryCallStaticMethod(Class<?> clazz, String methodName, Class<T> returnValueClazz, Object... args) {
        try {
            return new ObjectReference(callStaticMethod(clazz, methodName, returnValueClazz, args));
        } catch (NoSuchMethodException ex) {
            Log.w(TAG, "", ex);
            return null;
        } catch (IllegalAccessException ex2) {
            Log.w(TAG, "", ex2);
            return null;
        } catch (IllegalArgumentException ex3) {
            Log.w(TAG, "", ex3);
            return null;
        } catch (InvocationTargetException ex4) {
            Log.w(TAG, "", ex4);
            return null;
        }
    }

    private static Object checkMethodReturnValue(Object returnedValue, Class<?> returnValueClazz) throws IllegalArgumentException {
        if (returnedValue == null) {
            return null;
        }
        if (returnValueClazz == null) {
            return returnedValue;
        }
        if (returnValueClazz == Void.class) {
            return null;
        }
        if (ClassUtils.isAssignable(returnedValue.getClass(), returnValueClazz, true)) {
            return returnedValue;
        }
        throw new IllegalArgumentException("returnValueClazz");
    }

    public static Object newInstance(Class<?> clazz, Object... args) throws NoSuchMethodException, InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        return findConstructorBestMatch((Class) clazz, args).newInstance(args);
    }

    public static Object tryNewInstance(Class<?> clazz, Object... args) {
        try {
            return newInstance(clazz, args);
        } catch (NoSuchMethodException ex) {
            Log.w(TAG, "", ex);
            return null;
        } catch (InstantiationException ex2) {
            Log.w(TAG, "", ex2);
            return null;
        } catch (IllegalAccessException ex3) {
            Log.w(TAG, "", ex3);
            return null;
        } catch (IllegalArgumentException ex4) {
            Log.w(TAG, "", ex4);
            return null;
        } catch (InvocationTargetException ex5) {
            Log.w(TAG, "", ex5);
            return null;
        }
    }
}
