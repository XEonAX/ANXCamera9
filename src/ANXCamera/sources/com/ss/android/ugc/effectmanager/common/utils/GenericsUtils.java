package com.ss.android.ugc.effectmanager.common.utils;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;

public class GenericsUtils {
    public static Class getSuperClassGenricType(Class cls) {
        return getSuperClassGenricType(cls, 0);
    }

    public static Class getSuperClassGenricType(Class cls, int i) throws IndexOutOfBoundsException {
        Type genericSuperclass = cls.getGenericSuperclass();
        if (!(genericSuperclass instanceof ParameterizedType)) {
            return Object.class;
        }
        Type[] actualTypeArguments = ((ParameterizedType) genericSuperclass).getActualTypeArguments();
        if (i >= actualTypeArguments.length || i < 0) {
            return Object.class;
        }
        if (actualTypeArguments[i] instanceof Class) {
            return (Class) actualTypeArguments[i];
        }
        return Object.class;
    }
}
