package com.bytedance.frameworks.core.monitor.util;

import java.util.Calendar;
import java.util.Date;

public class TimeUtils {
    public static long getYesterdayStart() {
        Date date = new Date();
        Calendar instance = Calendar.getInstance();
        instance.setTime(date);
        instance.add(5, -1);
        instance.set(11, 0);
        instance.set(12, 0);
        instance.set(13, 0);
        return instance.getTimeInMillis() / 1000;
    }

    public static long getYesterdayEnd() {
        Date date = new Date();
        Calendar instance = Calendar.getInstance();
        instance.setTime(date);
        instance.add(5, -1);
        instance.set(11, 23);
        instance.set(12, 59);
        instance.set(13, 59);
        return instance.getTimeInMillis() / 1000;
    }

    public static long getNDayAgoStart(int i) {
        Date date = new Date();
        Calendar instance = Calendar.getInstance();
        instance.setTime(date);
        instance.add(5, -i);
        instance.set(11, 23);
        instance.set(12, 59);
        instance.set(13, 59);
        return instance.getTimeInMillis() / 1000;
    }
}
