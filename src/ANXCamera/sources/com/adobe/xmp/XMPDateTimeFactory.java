package com.adobe.xmp;

import com.adobe.xmp.impl.XMPDateTimeImpl;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.TimeZone;

public final class XMPDateTimeFactory {
    private static final TimeZone UTC = TimeZone.getTimeZone("UTC");

    private XMPDateTimeFactory() {
    }

    public static XMPDateTime createFromCalendar(Calendar calendar) {
        return new XMPDateTimeImpl(calendar);
    }

    public static XMPDateTime create(int i, int i2, int i3, int i4, int i5, int i6, int i7) {
        XMPDateTime xMPDateTimeImpl = new XMPDateTimeImpl();
        xMPDateTimeImpl.setYear(i);
        xMPDateTimeImpl.setMonth(i2);
        xMPDateTimeImpl.setDay(i3);
        xMPDateTimeImpl.setHour(i4);
        xMPDateTimeImpl.setMinute(i5);
        xMPDateTimeImpl.setSecond(i6);
        xMPDateTimeImpl.setNanoSecond(i7);
        return xMPDateTimeImpl;
    }

    public static XMPDateTime createFromISO8601(String str) throws XMPException {
        return new XMPDateTimeImpl(str);
    }

    public static XMPDateTime getCurrentDateTime() {
        return new XMPDateTimeImpl(new GregorianCalendar());
    }

    public static XMPDateTime setLocalTimeZone(XMPDateTime xMPDateTime) {
        Calendar calendar = xMPDateTime.getCalendar();
        calendar.setTimeZone(TimeZone.getDefault());
        return new XMPDateTimeImpl(calendar);
    }

    public static XMPDateTime convertToUTCTime(XMPDateTime xMPDateTime) {
        long timeInMillis = xMPDateTime.getCalendar().getTimeInMillis();
        Calendar gregorianCalendar = new GregorianCalendar(UTC);
        gregorianCalendar.setGregorianChange(new Date(Long.MIN_VALUE));
        gregorianCalendar.setTimeInMillis(timeInMillis);
        return new XMPDateTimeImpl(gregorianCalendar);
    }

    public static XMPDateTime convertToLocalTime(XMPDateTime xMPDateTime) {
        long timeInMillis = xMPDateTime.getCalendar().getTimeInMillis();
        Calendar gregorianCalendar = new GregorianCalendar();
        gregorianCalendar.setTimeInMillis(timeInMillis);
        return new XMPDateTimeImpl(gregorianCalendar);
    }
}
