package com.android.camera.log;

import android.os.Looper;
import com.ss.android.ttve.common.TEDefine;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Objects;

public class LogUtil {
    private static final ThreadLocal<Boolean> sIsMainThread = new ThreadLocal<Boolean>() {
        protected Boolean initialValue() {
            return Boolean.valueOf(Looper.getMainLooper().getThread() == Thread.currentThread());
        }
    };

    public static String addTags(Object obj, String str) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(hashCodeTag(obj));
        stringBuilder.append(mainThreadTag());
        stringBuilder.append(" ");
        stringBuilder.append(str);
        return stringBuilder.toString();
    }

    public static String addTags(Object obj, String str, String str2) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(hashCodeTag(obj));
        stringBuilder.append(mainThreadTag());
        stringBuilder.append(formatTags(str2));
        stringBuilder.append(" ");
        stringBuilder.append(str);
        return stringBuilder.toString();
    }

    private static String formatTags(String str) {
        List<String> asList = Arrays.asList(str.split("[\\x00-\\x1F\\x28-\\x29\\x2C\\x2F\\x3B-\\x3F\\x5B-\\x5D\\x7B-\\x7D]"));
        Collections.sort(asList);
        StringBuilder stringBuilder = new StringBuilder();
        for (String trim : asList) {
            String trim2 = trim2.trim();
            if (trim2.length() > 0) {
                stringBuilder.append("[");
                stringBuilder.append(trim2);
                stringBuilder.append("]");
            }
        }
        return stringBuilder.toString();
    }

    private static String hashCodeTag(Object obj) {
        String str;
        if (obj == null) {
            str = TEDefine.FACE_BEAUTY_NULL;
        } else {
            str = Integer.toHexString(Objects.hashCode(obj));
        }
        Object[] objArr = new Object[1];
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("@");
        stringBuilder.append(str);
        objArr[0] = stringBuilder.toString();
        return String.format("[%-9s]", objArr);
    }

    private static String mainThreadTag() {
        return isMainThread() ? "[ui]" : "";
    }

    public static boolean isMainThread() {
        return ((Boolean) sIsMainThread.get()).booleanValue();
    }
}
