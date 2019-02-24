package org.jcodec.containers.mp4;

import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

public class TimeUtil {
    public static final long MOV_TIME_OFFSET;

    static {
        Calendar instance = Calendar.getInstance(TimeZone.getTimeZone("GMT"));
        instance.set(1904, 0, 1, 0, 0, 0);
        instance.set(14, 0);
        MOV_TIME_OFFSET = instance.getTimeInMillis();
    }

    public static Date macTimeToDate(int i) {
        return new Date(fromMovTime(i));
    }

    public static long fromMovTime(int i) {
        return (((long) i) * 1000) + MOV_TIME_OFFSET;
    }

    public static int toMovTime(long j) {
        return (int) ((j - MOV_TIME_OFFSET) / 1000);
    }
}
