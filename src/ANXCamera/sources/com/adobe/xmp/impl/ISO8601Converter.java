package com.adobe.xmp.impl;

import com.adobe.xmp.XMPDateTime;
import com.adobe.xmp.XMPException;
import com.ss.android.ugc.effectmanager.link.model.configuration.LinkSelectorConfiguration;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.Locale;

public final class ISO8601Converter {
    private ISO8601Converter() {
    }

    public static XMPDateTime parse(String str) throws XMPException {
        return parse(str, new XMPDateTimeImpl());
    }

    /* JADX WARNING: Removed duplicated region for block: B:119:0x0211  */
    /* JADX WARNING: Removed duplicated region for block: B:118:0x0210 A:{RETURN} */
    public static com.adobe.xmp.XMPDateTime parse(java.lang.String r13, com.adobe.xmp.XMPDateTime r14) throws com.adobe.xmp.XMPException {
        /*
        com.adobe.xmp.impl.ParameterAsserts.assertNotNull(r13);
        r0 = new com.adobe.xmp.impl.ParseState;
        r0.<init>(r13);
        r13 = 0;
        r1 = r0.ch(r13);
        r2 = 84;
        r3 = 58;
        r4 = 1;
        if (r1 == r2) goto L_0x0032;
    L_0x0015:
        r1 = r0.length();
        r5 = 2;
        if (r1 < r5) goto L_0x0022;
    L_0x001c:
        r1 = r0.ch(r4);
        if (r1 == r3) goto L_0x0032;
    L_0x0022:
        r1 = r0.length();
        r6 = 3;
        if (r1 < r6) goto L_0x0030;
    L_0x0029:
        r1 = r0.ch(r5);
        if (r1 != r3) goto L_0x0030;
    L_0x002f:
        goto L_0x0032;
    L_0x0030:
        r1 = r13;
        goto L_0x0034;
        r1 = r4;
    L_0x0034:
        r5 = 45;
        r6 = 5;
        if (r1 != 0) goto L_0x00c4;
    L_0x0039:
        r7 = r0.ch(r13);
        if (r7 != r5) goto L_0x0042;
    L_0x003f:
        r0.skip();
    L_0x0042:
        r7 = "Invalid year in date string";
        r8 = 9999; // 0x270f float:1.4012E-41 double:4.94E-320;
        r7 = r0.gatherInt(r7, r8);
        r8 = r0.hasNext();
        if (r8 == 0) goto L_0x005f;
    L_0x0050:
        r8 = r0.ch();
        if (r8 != r5) goto L_0x0057;
    L_0x0056:
        goto L_0x005f;
    L_0x0057:
        r13 = new com.adobe.xmp.XMPException;
        r14 = "Invalid date string, after year";
        r13.<init>(r14, r6);
        throw r13;
    L_0x005f:
        r8 = r0.ch(r13);
        if (r8 != r5) goto L_0x0066;
    L_0x0065:
        r7 = -r7;
    L_0x0066:
        r14.setYear(r7);
        r7 = r0.hasNext();
        if (r7 != 0) goto L_0x0070;
    L_0x006f:
        return r14;
    L_0x0070:
        r0.skip();
        r7 = "Invalid month in date string";
        r8 = 12;
        r7 = r0.gatherInt(r7, r8);
        r8 = r0.hasNext();
        if (r8 == 0) goto L_0x0090;
    L_0x0081:
        r8 = r0.ch();
        if (r8 != r5) goto L_0x0088;
    L_0x0087:
        goto L_0x0090;
    L_0x0088:
        r13 = new com.adobe.xmp.XMPException;
        r14 = "Invalid date string, after month";
        r13.<init>(r14, r6);
        throw r13;
    L_0x0090:
        r14.setMonth(r7);
        r7 = r0.hasNext();
        if (r7 != 0) goto L_0x009a;
    L_0x0099:
        return r14;
    L_0x009a:
        r0.skip();
        r7 = "Invalid day in date string";
        r8 = 31;
        r7 = r0.gatherInt(r7, r8);
        r8 = r0.hasNext();
        if (r8 == 0) goto L_0x00ba;
    L_0x00ab:
        r8 = r0.ch();
        if (r8 != r2) goto L_0x00b2;
    L_0x00b1:
        goto L_0x00ba;
    L_0x00b2:
        r13 = new com.adobe.xmp.XMPException;
        r14 = "Invalid date string, after day";
        r13.<init>(r14, r6);
        throw r13;
    L_0x00ba:
        r14.setDay(r7);
        r7 = r0.hasNext();
        if (r7 != 0) goto L_0x00ca;
    L_0x00c3:
        return r14;
    L_0x00c4:
        r14.setMonth(r4);
        r14.setDay(r4);
    L_0x00ca:
        r7 = r0.ch();
        if (r7 != r2) goto L_0x00d4;
    L_0x00d0:
        r0.skip();
        goto L_0x00d6;
    L_0x00d4:
        if (r1 == 0) goto L_0x0221;
    L_0x00d6:
        r1 = "Invalid hour in date string";
        r2 = 23;
        r1 = r0.gatherInt(r1, r2);
        r7 = r0.ch();
        if (r7 != r3) goto L_0x0219;
    L_0x00e4:
        r14.setHour(r1);
        r0.skip();
        r1 = "Invalid minute in date string";
        r7 = 59;
        r1 = r0.gatherInt(r1, r7);
        r8 = r0.hasNext();
        r9 = 43;
        r10 = 90;
        if (r8 == 0) goto L_0x011d;
    L_0x00fc:
        r8 = r0.ch();
        if (r8 == r3) goto L_0x011d;
    L_0x0102:
        r8 = r0.ch();
        if (r8 == r10) goto L_0x011d;
    L_0x0108:
        r8 = r0.ch();
        if (r8 == r9) goto L_0x011d;
    L_0x010e:
        r8 = r0.ch();
        if (r8 != r5) goto L_0x0115;
    L_0x0114:
        goto L_0x011d;
    L_0x0115:
        r13 = new com.adobe.xmp.XMPException;
        r14 = "Invalid date string, after minute";
        r13.<init>(r14, r6);
        throw r13;
    L_0x011d:
        r14.setMinute(r1);
        r1 = r0.ch();
        if (r1 != r3) goto L_0x01a4;
    L_0x0126:
        r0.skip();
        r1 = "Invalid whole seconds in date string";
        r1 = r0.gatherInt(r1, r7);
        r8 = r0.hasNext();
        r11 = 46;
        if (r8 == 0) goto L_0x0158;
    L_0x0137:
        r8 = r0.ch();
        if (r8 == r11) goto L_0x0158;
    L_0x013d:
        r8 = r0.ch();
        if (r8 == r10) goto L_0x0158;
    L_0x0143:
        r8 = r0.ch();
        if (r8 == r9) goto L_0x0158;
    L_0x0149:
        r8 = r0.ch();
        if (r8 != r5) goto L_0x0150;
    L_0x014f:
        goto L_0x0158;
    L_0x0150:
        r13 = new com.adobe.xmp.XMPException;
        r14 = "Invalid date string, after whole seconds";
        r13.<init>(r14, r6);
        throw r13;
    L_0x0158:
        r14.setSecond(r1);
        r1 = r0.ch();
        if (r1 != r11) goto L_0x01a4;
    L_0x0161:
        r0.skip();
        r1 = r0.pos();
        r8 = "Invalid fractional seconds in date string";
        r11 = 999999999; // 0x3b9ac9ff float:0.004723787 double:4.940656453E-315;
        r8 = r0.gatherInt(r8, r11);
        r11 = r0.ch();
        if (r11 == r10) goto L_0x018c;
    L_0x0177:
        r11 = r0.ch();
        if (r11 == r9) goto L_0x018c;
    L_0x017d:
        r11 = r0.ch();
        if (r11 != r5) goto L_0x0184;
    L_0x0183:
        goto L_0x018c;
    L_0x0184:
        r13 = new com.adobe.xmp.XMPException;
        r14 = "Invalid date string, after fractional second";
        r13.<init>(r14, r6);
        throw r13;
    L_0x018c:
        r11 = r0.pos();
        r11 = r11 - r1;
    L_0x0191:
        r1 = 9;
        if (r11 <= r1) goto L_0x019a;
    L_0x0195:
        r8 = r8 / 10;
        r11 = r11 + -1;
        goto L_0x0191;
    L_0x019a:
        if (r11 >= r1) goto L_0x01a1;
    L_0x019c:
        r8 = r8 * 10;
        r11 = r11 + 1;
        goto L_0x019a;
    L_0x01a1:
        r14.setNanoSecond(r8);
        r1 = r0.ch();
        if (r1 != r10) goto L_0x01b1;
    L_0x01ad:
        r0.skip();
        goto L_0x01f4;
    L_0x01b1:
        r1 = r0.hasNext();
        if (r1 == 0) goto L_0x01f4;
    L_0x01b7:
        r13 = r0.ch();
        if (r13 != r9) goto L_0x01c0;
        r13 = r4;
        goto L_0x01c8;
    L_0x01c0:
        r13 = r0.ch();
        if (r13 != r5) goto L_0x01ec;
        r13 = -1;
    L_0x01c8:
        r0.skip();
        r1 = "Invalid time zone hour in date string";
        r1 = r0.gatherInt(r1, r2);
        r2 = r0.ch();
        if (r2 != r3) goto L_0x01e4;
    L_0x01d7:
        r0.skip();
        r2 = "Invalid time zone minute in date string";
        r2 = r0.gatherInt(r2, r7);
        r12 = r1;
        r1 = r13;
        r13 = r12;
        goto L_0x01f6;
    L_0x01e4:
        r13 = new com.adobe.xmp.XMPException;
        r14 = "Invalid date string, after time zone hour";
        r13.<init>(r14, r6);
        throw r13;
    L_0x01ec:
        r13 = new com.adobe.xmp.XMPException;
        r14 = "Time zone must begin with 'Z', '+', or '-'";
        r13.<init>(r14, r6);
        throw r13;
    L_0x01f4:
        r1 = r13;
        r2 = r1;
    L_0x01f6:
        r13 = r13 * 3600;
        r13 = r13 * 1000;
        r2 = r2 * 60;
        r2 = r2 * 1000;
        r13 = r13 + r2;
        r13 = r13 * r1;
        r1 = new java.util.SimpleTimeZone;
        r2 = "";
        r1.<init>(r13, r2);
        r14.setTimeZone(r1);
        r13 = r0.hasNext();
        if (r13 != 0) goto L_0x0211;
    L_0x0210:
        return r14;
    L_0x0211:
        r13 = new com.adobe.xmp.XMPException;
        r14 = "Invalid date string, extra chars at end";
        r13.<init>(r14, r6);
        throw r13;
    L_0x0219:
        r13 = new com.adobe.xmp.XMPException;
        r14 = "Invalid date string, after hour";
        r13.<init>(r14, r6);
        throw r13;
    L_0x0221:
        r13 = new com.adobe.xmp.XMPException;
        r14 = "Invalid date string, missing 'T' after date";
        r13.<init>(r14, r6);
        throw r13;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.adobe.xmp.impl.ISO8601Converter.parse(java.lang.String, com.adobe.xmp.XMPDateTime):com.adobe.xmp.XMPDateTime");
    }

    public static String render(XMPDateTime xMPDateTime) {
        StringBuffer stringBuffer = new StringBuffer();
        DecimalFormat decimalFormat = new DecimalFormat("0000", new DecimalFormatSymbols(Locale.ENGLISH));
        stringBuffer.append(decimalFormat.format((long) xMPDateTime.getYear()));
        if (xMPDateTime.getMonth() == 0) {
            return stringBuffer.toString();
        }
        decimalFormat.applyPattern("'-'00");
        stringBuffer.append(decimalFormat.format((long) xMPDateTime.getMonth()));
        if (xMPDateTime.getDay() == 0) {
            return stringBuffer.toString();
        }
        stringBuffer.append(decimalFormat.format((long) xMPDateTime.getDay()));
        if (!(xMPDateTime.getHour() == 0 && xMPDateTime.getMinute() == 0 && xMPDateTime.getSecond() == 0 && xMPDateTime.getNanoSecond() == 0 && (xMPDateTime.getTimeZone() == null || xMPDateTime.getTimeZone().getRawOffset() == 0))) {
            stringBuffer.append('T');
            decimalFormat.applyPattern("00");
            stringBuffer.append(decimalFormat.format((long) xMPDateTime.getHour()));
            stringBuffer.append(':');
            stringBuffer.append(decimalFormat.format((long) xMPDateTime.getMinute()));
            if (!(xMPDateTime.getSecond() == 0 && xMPDateTime.getNanoSecond() == 0)) {
                double second = ((double) xMPDateTime.getSecond()) + (((double) xMPDateTime.getNanoSecond()) / 1.0E9d);
                decimalFormat.applyPattern(":00.#########");
                stringBuffer.append(decimalFormat.format(second));
            }
            if (xMPDateTime.getTimeZone() != null) {
                int offset = xMPDateTime.getTimeZone().getOffset(xMPDateTime.getCalendar().getTimeInMillis());
                if (offset == 0) {
                    stringBuffer.append('Z');
                } else {
                    int i = offset / 3600000;
                    offset = Math.abs((offset % 3600000) / LinkSelectorConfiguration.MS_OF_ONE_MIN);
                    decimalFormat.applyPattern("+00;-00");
                    stringBuffer.append(decimalFormat.format((long) i));
                    decimalFormat.applyPattern(":00");
                    stringBuffer.append(decimalFormat.format((long) offset));
                }
            }
        }
        return stringBuffer.toString();
    }
}
