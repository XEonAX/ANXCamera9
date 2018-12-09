package okhttp3;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.annotation.Nullable;
import okhttp3.internal.Util;
import okhttp3.internal.http.HttpDate;

public final class Cookie {
    private static final Pattern DAY_OF_MONTH_PATTERN = Pattern.compile("(\\d{1,2})[^\\d]*");
    private static final Pattern MONTH_PATTERN = Pattern.compile("(?i)(jan|feb|mar|apr|may|jun|jul|aug|sep|oct|nov|dec).*");
    private static final Pattern TIME_PATTERN = Pattern.compile("(\\d{1,2}):(\\d{1,2}):(\\d{1,2})[^\\d]*");
    private static final Pattern YEAR_PATTERN = Pattern.compile("(\\d{2,4})[^\\d]*");
    private final String domain;
    private final long expiresAt;
    private final boolean hostOnly;
    private final boolean httpOnly;
    private final String name;
    private final String path;
    private final boolean persistent;
    private final boolean secure;
    private final String value;

    public static final class Builder {
        String domain;
        long expiresAt = HttpDate.MAX_DATE;
        boolean hostOnly;
        boolean httpOnly;
        String name;
        String path = "/";
        boolean persistent;
        boolean secure;
        String value;

        public Builder name(String str) {
            if (str == null) {
                throw new NullPointerException("name == null");
            } else if (str.trim().equals(str)) {
                this.name = str;
                return this;
            } else {
                throw new IllegalArgumentException("name is not trimmed");
            }
        }

        public Builder value(String str) {
            if (str == null) {
                throw new NullPointerException("value == null");
            } else if (str.trim().equals(str)) {
                this.value = str;
                return this;
            } else {
                throw new IllegalArgumentException("value is not trimmed");
            }
        }

        public Builder expiresAt(long j) {
            if (j <= 0) {
                j = Long.MIN_VALUE;
            }
            if (j > HttpDate.MAX_DATE) {
                j = HttpDate.MAX_DATE;
            }
            this.expiresAt = j;
            this.persistent = true;
            return this;
        }

        public Builder domain(String str) {
            return domain(str, false);
        }

        public Builder hostOnlyDomain(String str) {
            return domain(str, true);
        }

        private Builder domain(String str, boolean z) {
            if (str != null) {
                String canonicalizeHost = Util.canonicalizeHost(str);
                if (canonicalizeHost != null) {
                    this.domain = canonicalizeHost;
                    this.hostOnly = z;
                    return this;
                }
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("unexpected domain: ");
                stringBuilder.append(str);
                throw new IllegalArgumentException(stringBuilder.toString());
            }
            throw new NullPointerException("domain == null");
        }

        public Builder path(String str) {
            if (str.startsWith("/")) {
                this.path = str;
                return this;
            }
            throw new IllegalArgumentException("path must start with '/'");
        }

        public Builder secure() {
            this.secure = true;
            return this;
        }

        public Builder httpOnly() {
            this.httpOnly = true;
            return this;
        }

        public Cookie build() {
            return new Cookie(this);
        }
    }

    private Cookie(String str, String str2, long j, String str3, String str4, boolean z, boolean z2, boolean z3, boolean z4) {
        this.name = str;
        this.value = str2;
        this.expiresAt = j;
        this.domain = str3;
        this.path = str4;
        this.secure = z;
        this.httpOnly = z2;
        this.hostOnly = z3;
        this.persistent = z4;
    }

    Cookie(Builder builder) {
        if (builder.name == null) {
            throw new NullPointerException("builder.name == null");
        } else if (builder.value == null) {
            throw new NullPointerException("builder.value == null");
        } else if (builder.domain != null) {
            this.name = builder.name;
            this.value = builder.value;
            this.expiresAt = builder.expiresAt;
            this.domain = builder.domain;
            this.path = builder.path;
            this.secure = builder.secure;
            this.httpOnly = builder.httpOnly;
            this.persistent = builder.persistent;
            this.hostOnly = builder.hostOnly;
        } else {
            throw new NullPointerException("builder.domain == null");
        }
    }

    public String name() {
        return this.name;
    }

    public String value() {
        return this.value;
    }

    public boolean persistent() {
        return this.persistent;
    }

    public long expiresAt() {
        return this.expiresAt;
    }

    public boolean hostOnly() {
        return this.hostOnly;
    }

    public String domain() {
        return this.domain;
    }

    public String path() {
        return this.path;
    }

    public boolean httpOnly() {
        return this.httpOnly;
    }

    public boolean secure() {
        return this.secure;
    }

    public boolean matches(HttpUrl httpUrl) {
        boolean equals;
        if (this.hostOnly) {
            equals = httpUrl.host().equals(this.domain);
        } else {
            equals = domainMatch(httpUrl.host(), this.domain);
        }
        if (!equals || !pathMatch(httpUrl, this.path)) {
            return false;
        }
        if (!this.secure || httpUrl.isHttps()) {
            return true;
        }
        return false;
    }

    private static boolean domainMatch(String str, String str2) {
        if (str.equals(str2)) {
            return true;
        }
        if (str.endsWith(str2) && str.charAt((str.length() - str2.length()) - 1) == '.' && !Util.verifyAsIpAddress(str)) {
            return true;
        }
        return false;
    }

    private static boolean pathMatch(HttpUrl httpUrl, String str) {
        String encodedPath = httpUrl.encodedPath();
        if (encodedPath.equals(str)) {
            return true;
        }
        if (encodedPath.startsWith(str) && (str.endsWith("/") || encodedPath.charAt(str.length()) == '/')) {
            return true;
        }
        return false;
    }

    @Nullable
    public static Cookie parse(HttpUrl httpUrl, String str) {
        return parse(System.currentTimeMillis(), httpUrl, str);
    }

    /* JADX WARNING: Removed duplicated region for block: B:63:0x0116  */
    /* JADX WARNING: Removed duplicated region for block: B:62:0x0112  */
    /* JADX WARNING: Removed duplicated region for block: B:81:0x0156  */
    /* JADX WARNING: Removed duplicated region for block: B:80:0x0151  */
    @javax.annotation.Nullable
    static okhttp3.Cookie parse(long r27, okhttp3.HttpUrl r29, java.lang.String r30) {
        /*
        r3 = r30;
        r4 = r30.length();
        r5 = 59;
        r6 = 0;
        r0 = okhttp3.internal.Util.delimiterOffset(r3, r6, r4, r5);
        r7 = 61;
        r8 = okhttp3.internal.Util.delimiterOffset(r3, r6, r0, r7);
        r9 = 0;
        if (r8 != r0) goto L_0x0017;
    L_0x0016:
        return r9;
    L_0x0017:
        r11 = okhttp3.internal.Util.trimSubstring(r3, r6, r8);
        r10 = r11.isEmpty();
        if (r10 != 0) goto L_0x016a;
    L_0x0021:
        r10 = okhttp3.internal.Util.indexOfControlOrNonAscii(r11);
        r12 = -1;
        if (r10 == r12) goto L_0x002a;
    L_0x0028:
        goto L_0x016a;
    L_0x002a:
        r10 = 1;
        r8 = r8 + r10;
        r8 = okhttp3.internal.Util.trimSubstring(r3, r8, r0);
        r13 = okhttp3.internal.Util.indexOfControlOrNonAscii(r8);
        if (r13 == r12) goto L_0x0037;
    L_0x0036:
        return r9;
        r0 = r0 + r10;
        r12 = -1;
        r14 = 253402300799999; // 0xe677d21fdbff float:-1.71647681E11 double:1.251973714024093E-309;
        r18 = r6;
        r19 = r18;
        r24 = r19;
        r21 = r9;
        r20 = r10;
        r16 = r12;
        r22 = r14;
        r10 = r21;
    L_0x0057:
        if (r0 >= r4) goto L_0x00dd;
    L_0x0059:
        r9 = okhttp3.internal.Util.delimiterOffset(r3, r0, r4, r5);
        r5 = okhttp3.internal.Util.delimiterOffset(r3, r0, r9, r7);
        r0 = okhttp3.internal.Util.trimSubstring(r3, r0, r5);
        if (r5 >= r9) goto L_0x006e;
    L_0x0067:
        r5 = r5 + 1;
        r5 = okhttp3.internal.Util.trimSubstring(r3, r5, r9);
        goto L_0x0070;
    L_0x006e:
        r5 = "";
    L_0x0070:
        r7 = "expires";
        r7 = r0.equalsIgnoreCase(r7);
        if (r7 == 0) goto L_0x0089;
    L_0x0078:
        r0 = r5.length();	 Catch:{ IllegalArgumentException -> 0x0087 }
        r25 = parseExpires(r5, r6, r0);	 Catch:{ IllegalArgumentException -> 0x0087 }
        r22 = r25;
    L_0x0084:
        r24 = 1;
        goto L_0x00d3;
    L_0x0087:
        r0 = move-exception;
        goto L_0x00d3;
    L_0x0089:
        r7 = "max-age";
        r7 = r0.equalsIgnoreCase(r7);
        if (r7 == 0) goto L_0x009c;
    L_0x0091:
        r25 = parseMaxAge(r5);	 Catch:{ NumberFormatException -> 0x009a }
        r16 = r25;
        goto L_0x0084;
    L_0x009a:
        r0 = move-exception;
        goto L_0x00d3;
    L_0x009c:
        r7 = "domain";
        r7 = r0.equalsIgnoreCase(r7);
        if (r7 == 0) goto L_0x00b0;
    L_0x00a4:
        r0 = parseDomain(r5);	 Catch:{ IllegalArgumentException -> 0x00ae }
        r10 = r0;
        r20 = r6;
        goto L_0x00d3;
    L_0x00ae:
        r0 = move-exception;
        goto L_0x00d3;
    L_0x00b0:
        r7 = "path";
        r7 = r0.equalsIgnoreCase(r7);
        if (r7 == 0) goto L_0x00bc;
        r21 = r5;
        goto L_0x00d3;
    L_0x00bc:
        r5 = "secure";
        r5 = r0.equalsIgnoreCase(r5);
        if (r5 == 0) goto L_0x00c8;
        r18 = 1;
        goto L_0x00d3;
    L_0x00c8:
        r5 = "httponly";
        r0 = r0.equalsIgnoreCase(r5);
        if (r0 == 0) goto L_0x00d3;
        r19 = 1;
    L_0x00d3:
        r0 = r9 + 1;
        r5 = 59;
        r7 = 61;
        r9 = 0;
        goto L_0x0057;
    L_0x00dd:
        r3 = -9223372036854775808;
        r0 = (r16 > r3 ? 1 : (r16 == r3 ? 0 : -1));
        if (r0 != 0) goto L_0x00e6;
    L_0x00e4:
        r13 = r3;
        goto L_0x010c;
    L_0x00e6:
        r0 = (r16 > r12 ? 1 : (r16 == r12 ? 0 : -1));
        if (r0 == 0) goto L_0x010a;
    L_0x00ea:
        r3 = 9223372036854775; // 0x20c49ba5e353f7 float:-3.943512E-16 double:4.663754807431093E-308;
        r0 = (r16 > r3 ? 1 : (r16 == r3 ? 0 : -1));
        if (r0 > 0) goto L_0x00f8;
    L_0x00f3:
        r3 = 1000; // 0x3e8 float:1.401E-42 double:4.94E-321;
        r16 = r16 * r3;
        goto L_0x00fd;
    L_0x00f8:
        r16 = 9223372036854775807; // 0x7fffffffffffffff float:NaN double:NaN;
    L_0x00fd:
        r3 = r27 + r16;
        r0 = (r3 > r27 ? 1 : (r3 == r27 ? 0 : -1));
        if (r0 < 0) goto L_0x0107;
    L_0x0103:
        r0 = (r3 > r14 ? 1 : (r3 == r14 ? 0 : -1));
        if (r0 <= 0) goto L_0x00e4;
        r13 = r14;
        goto L_0x010c;
    L_0x010a:
        r13 = r22;
    L_0x010c:
        r0 = r29.host();
        if (r10 != 0) goto L_0x0116;
        r15 = r0;
        r1 = 0;
        goto L_0x0120;
    L_0x0116:
        r1 = domainMatch(r0, r10);
        if (r1 != 0) goto L_0x011e;
    L_0x011c:
        r1 = 0;
        return r1;
    L_0x011e:
        r1 = 0;
        r15 = r10;
    L_0x0120:
        r0 = r0.length();
        r2 = r15.length();
        if (r0 == r2) goto L_0x0135;
    L_0x012a:
        r0 = okhttp3.internal.publicsuffix.PublicSuffixDatabase.get();
        r0 = r0.getEffectiveTldPlusOne(r15);
        if (r0 != 0) goto L_0x0135;
    L_0x0134:
        return r1;
    L_0x0135:
        r9 = r21;
        if (r9 == 0) goto L_0x0145;
    L_0x0139:
        r0 = "/";
        r0 = r9.startsWith(r0);
        if (r0 != 0) goto L_0x0142;
    L_0x0141:
        goto L_0x0145;
    L_0x0142:
        r16 = r9;
        goto L_0x015a;
    L_0x0145:
        r0 = r29.encodedPath();
        r1 = 47;
        r1 = r0.lastIndexOf(r1);
        if (r1 == 0) goto L_0x0156;
    L_0x0151:
        r0 = r0.substring(r6, r1);
        goto L_0x0158;
    L_0x0156:
        r0 = "/";
    L_0x0158:
        r16 = r0;
    L_0x015a:
        r0 = new okhttp3.Cookie;
        r10 = r0;
        r12 = r8;
        r17 = r18;
        r18 = r19;
        r19 = r20;
        r20 = r24;
        r10.<init>(r11, r12, r13, r15, r16, r17, r18, r19, r20);
        return r0;
    L_0x016a:
        r1 = 0;
        return r1;
        */
        throw new UnsupportedOperationException("Method not decompiled: okhttp3.Cookie.parse(long, okhttp3.HttpUrl, java.lang.String):okhttp3.Cookie");
    }

    private static long parseExpires(String str, int i, int i2) {
        i = dateCharacterOffset(str, i, i2, false);
        Matcher matcher = TIME_PATTERN.matcher(str);
        int i3 = -1;
        int i4 = i3;
        int i5 = i4;
        int i6 = i5;
        int i7 = i6;
        int i8 = i7;
        while (i < i2) {
            int dateCharacterOffset = dateCharacterOffset(str, i + 1, i2, true);
            matcher.region(i, dateCharacterOffset);
            if (i3 == -1 && matcher.usePattern(TIME_PATTERN).matches()) {
                i = Integer.parseInt(matcher.group(1));
                i3 = Integer.parseInt(matcher.group(2));
                i8 = Integer.parseInt(matcher.group(3));
                i7 = i3;
                i3 = i;
            } else if (i5 == -1 && matcher.usePattern(DAY_OF_MONTH_PATTERN).matches()) {
                i5 = Integer.parseInt(matcher.group(1));
            } else if (i6 == -1 && matcher.usePattern(MONTH_PATTERN).matches()) {
                i6 = MONTH_PATTERN.pattern().indexOf(matcher.group(1).toLowerCase(Locale.US)) / 4;
            } else if (i4 == -1 && matcher.usePattern(YEAR_PATTERN).matches()) {
                i4 = Integer.parseInt(matcher.group(1));
            }
            i = dateCharacterOffset(str, dateCharacterOffset + 1, i2, false);
        }
        if (i4 >= 70 && i4 <= 99) {
            i4 += 1900;
        }
        if (i4 >= 0 && i4 <= 69) {
            i4 += 2000;
        }
        if (i4 < 1601) {
            throw new IllegalArgumentException();
        } else if (i6 == -1) {
            throw new IllegalArgumentException();
        } else if (i5 < 1 || i5 > 31) {
            throw new IllegalArgumentException();
        } else if (i3 < 0 || i3 > 23) {
            throw new IllegalArgumentException();
        } else if (i7 < 0 || i7 > 59) {
            throw new IllegalArgumentException();
        } else if (i8 < 0 || i8 > 59) {
            throw new IllegalArgumentException();
        } else {
            Calendar gregorianCalendar = new GregorianCalendar(Util.UTC);
            gregorianCalendar.setLenient(false);
            gregorianCalendar.set(1, i4);
            gregorianCalendar.set(2, i6 - 1);
            gregorianCalendar.set(5, i5);
            gregorianCalendar.set(11, i3);
            gregorianCalendar.set(12, i7);
            gregorianCalendar.set(13, i8);
            gregorianCalendar.set(14, 0);
            return gregorianCalendar.getTimeInMillis();
        }
    }

    private static int dateCharacterOffset(String str, int i, int i2, boolean z) {
        while (i < i2) {
            int i3;
            char charAt = str.charAt(i);
            if ((charAt >= ' ' || charAt == 9) && charAt < 127 && ((charAt < '0' || charAt > '9') && ((charAt < 'a' || charAt > 'z') && ((charAt < 'A' || charAt > 'Z') && charAt != ':')))) {
                i3 = 0;
            } else {
                i3 = 1;
            }
            if (i3 == (z ^ 1)) {
                return i;
            }
            i++;
        }
        return i2;
    }

    private static long parseMaxAge(String str) {
        long j = Long.MIN_VALUE;
        try {
            long parseLong = Long.parseLong(str);
            if (parseLong > 0) {
                j = parseLong;
            }
            return j;
        } catch (NumberFormatException e) {
            if (str.matches("-?\\d+")) {
                if (!str.startsWith("-")) {
                    j = Long.MAX_VALUE;
                }
                return j;
            }
            throw e;
        }
    }

    private static String parseDomain(String str) {
        if (str.endsWith(".")) {
            throw new IllegalArgumentException();
        }
        if (str.startsWith(".")) {
            str = str.substring(1);
        }
        str = Util.canonicalizeHost(str);
        if (str != null) {
            return str;
        }
        throw new IllegalArgumentException();
    }

    public static List<Cookie> parseAll(HttpUrl httpUrl, Headers headers) {
        List values = headers.values("Set-Cookie");
        int size = values.size();
        List list = null;
        for (int i = 0; i < size; i++) {
            Cookie parse = parse(httpUrl, (String) values.get(i));
            if (parse != null) {
                if (list == null) {
                    list = new ArrayList();
                }
                list.add(parse);
            }
        }
        if (list != null) {
            return Collections.unmodifiableList(list);
        }
        return Collections.emptyList();
    }

    public String toString() {
        return toString(false);
    }

    String toString(boolean z) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(this.name);
        stringBuilder.append('=');
        stringBuilder.append(this.value);
        if (this.persistent) {
            if (this.expiresAt == Long.MIN_VALUE) {
                stringBuilder.append("; max-age=0");
            } else {
                stringBuilder.append("; expires=");
                stringBuilder.append(HttpDate.format(new Date(this.expiresAt)));
            }
        }
        if (!this.hostOnly) {
            stringBuilder.append("; domain=");
            if (z) {
                stringBuilder.append(".");
            }
            stringBuilder.append(this.domain);
        }
        stringBuilder.append("; path=");
        stringBuilder.append(this.path);
        if (this.secure) {
            stringBuilder.append("; secure");
        }
        if (this.httpOnly) {
            stringBuilder.append("; httponly");
        }
        return stringBuilder.toString();
    }

    public boolean equals(@Nullable Object obj) {
        boolean z = false;
        if (!(obj instanceof Cookie)) {
            return false;
        }
        Cookie cookie = (Cookie) obj;
        if (cookie.name.equals(this.name) && cookie.value.equals(this.value) && cookie.domain.equals(this.domain) && cookie.path.equals(this.path) && cookie.expiresAt == this.expiresAt && cookie.secure == this.secure && cookie.httpOnly == this.httpOnly && cookie.persistent == this.persistent && cookie.hostOnly == this.hostOnly) {
            z = true;
        }
        return z;
    }

    public int hashCode() {
        return (31 * (((((((((((((((527 + this.name.hashCode()) * 31) + this.value.hashCode()) * 31) + this.domain.hashCode()) * 31) + this.path.hashCode()) * 31) + ((int) (this.expiresAt ^ (this.expiresAt >>> 32)))) * 31) + (this.secure ^ 1)) * 31) + (this.httpOnly ^ 1)) * 31) + (this.persistent ^ 1))) + (this.hostOnly ^ 1);
    }
}
