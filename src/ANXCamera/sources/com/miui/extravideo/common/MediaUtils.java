package com.miui.extravideo.common;

public class MediaUtils {
    public static long computePresentationTime(int i, int i2) {
        return (long) (132 + ((i * 1000000) / i2));
    }
}
