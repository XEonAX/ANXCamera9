package com.android.volley.toolbox;

import com.android.volley.Cache.Entry;
import com.android.volley.Header;
import com.android.volley.NetworkResponse;
import com.android.volley.VolleyLog;
import com.ss.android.vesdk.runtime.cloudconfig.HttpRequest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;
import java.util.TreeMap;

public class HttpHeaderParser {
    private static final String DEFAULT_CONTENT_CHARSET = "ISO-8859-1";
    static final String HEADER_CONTENT_TYPE = "Content-Type";
    private static final String RFC1123_FORMAT = "EEE, dd MMM yyyy HH:mm:ss zzz";

    public static Entry parseCacheHeaders(NetworkResponse networkResponse) {
        long parseDateAsEpoch;
        long j;
        long j2;
        int i;
        int i2;
        long parseDateAsEpoch2;
        long parseDateAsEpoch3;
        NetworkResponse networkResponse2 = networkResponse;
        long currentTimeMillis = System.currentTimeMillis();
        Map map = networkResponse2.headers;
        String str = (String) map.get("Date");
        long j3 = 0;
        if (str != null) {
            parseDateAsEpoch = parseDateAsEpoch(str);
        } else {
            parseDateAsEpoch = 0;
        }
        str = (String) map.get(HttpRequest.HEADER_CACHE_CONTROL);
        int i3 = 0;
        if (str != null) {
            String[] split = str.split(",", 0);
            j = 0;
            j2 = j;
            i = 0;
            while (i3 < split.length) {
                str = split[i3].trim();
                if (str.equals("no-cache") || str.equals("no-store")) {
                    return null;
                }
                if (str.startsWith("max-age=")) {
                    try {
                        j = Long.parseLong(str.substring(8));
                    } catch (Exception e) {
                    }
                } else if (str.startsWith("stale-while-revalidate=")) {
                    try {
                        j2 = Long.parseLong(str.substring(23));
                    } catch (Exception e2) {
                    }
                } else if (str.equals("must-revalidate") || str.equals("proxy-revalidate")) {
                    i = 1;
                }
                i3++;
            }
            i2 = 1;
        } else {
            j = 0;
            j2 = j;
            i = 0;
            i2 = i;
        }
        str = (String) map.get(HttpRequest.HEADER_EXPIRES);
        if (str != null) {
            parseDateAsEpoch2 = parseDateAsEpoch(str);
        } else {
            parseDateAsEpoch2 = 0;
        }
        str = (String) map.get(HttpRequest.HEADER_LAST_MODIFIED);
        if (str != null) {
            parseDateAsEpoch3 = parseDateAsEpoch(str);
        } else {
            parseDateAsEpoch3 = 0;
        }
        str = (String) map.get(HttpRequest.HEADER_ETAG);
        if (i2 != 0) {
            currentTimeMillis += j * 1000;
            if (i != 0) {
                j3 = currentTimeMillis;
            } else {
                j3 = (j2 * 1000) + currentTimeMillis;
            }
            long j4 = currentTimeMillis;
            currentTimeMillis = j3;
            j3 = j4;
        } else {
            if (parseDateAsEpoch > 0 && parseDateAsEpoch2 >= parseDateAsEpoch) {
                j3 = currentTimeMillis + (parseDateAsEpoch2 - parseDateAsEpoch);
            }
            currentTimeMillis = j3;
        }
        Entry entry = new Entry();
        entry.data = networkResponse2.data;
        entry.etag = str;
        entry.softTtl = j3;
        entry.ttl = currentTimeMillis;
        entry.serverDate = parseDateAsEpoch;
        entry.lastModified = parseDateAsEpoch3;
        entry.responseHeaders = map;
        entry.allResponseHeaders = networkResponse2.allHeaders;
        return entry;
    }

    public static long parseDateAsEpoch(String str) {
        try {
            return newRfc1123Formatter().parse(str).getTime();
        } catch (Throwable e) {
            VolleyLog.e(e, "Unable to parse dateStr: %s, falling back to 0", str);
            return 0;
        }
    }

    static String formatEpochAsRfc1123(long j) {
        return newRfc1123Formatter().format(new Date(j));
    }

    private static SimpleDateFormat newRfc1123Formatter() {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(RFC1123_FORMAT, Locale.US);
        simpleDateFormat.setTimeZone(TimeZone.getTimeZone("GMT"));
        return simpleDateFormat;
    }

    public static String parseCharset(Map<String, String> map, String str) {
        String str2 = (String) map.get("Content-Type");
        if (str2 != null) {
            String[] split = str2.split(";", 0);
            for (int i = 1; i < split.length; i++) {
                String[] split2 = split[i].trim().split("=", 0);
                if (split2.length == 2 && split2[0].equals(HttpRequest.PARAM_CHARSET)) {
                    return split2[1];
                }
            }
        }
        return str;
    }

    public static String parseCharset(Map<String, String> map) {
        return parseCharset(map, "ISO-8859-1");
    }

    static Map<String, String> toHeaderMap(List<Header> list) {
        Map<String, String> treeMap = new TreeMap(String.CASE_INSENSITIVE_ORDER);
        for (Header header : list) {
            treeMap.put(header.getName(), header.getValue());
        }
        return treeMap;
    }

    static List<Header> toAllHeaderList(Map<String, String> map) {
        List<Header> arrayList = new ArrayList(map.size());
        for (Map.Entry entry : map.entrySet()) {
            arrayList.add(new Header((String) entry.getKey(), (String) entry.getValue()));
        }
        return arrayList;
    }
}
