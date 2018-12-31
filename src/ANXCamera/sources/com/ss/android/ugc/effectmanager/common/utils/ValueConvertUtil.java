package com.ss.android.ugc.effectmanager.common.utils;

public class ValueConvertUtil {
    public static long ConvertStringToLong(String str, long j) {
        try {
            return Long.valueOf(str).longValue();
        } catch (NumberFormatException e) {
            e.printStackTrace();
            return j;
        }
    }
}
