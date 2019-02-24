package com.android.volley.toolbox;

import com.android.volley.C0015NetworkResponse;
import com.android.volley.Cache.C0002Entry;
import com.ss.android.vesdk.runtime.cloudconfig.HttpRequest;
import java.util.Map;
import org.apache.http.impl.cookie.DateParseException;
import org.apache.http.impl.cookie.DateUtils;

/* renamed from: com.android.volley.toolbox.HttpHeaderParser */
public class C0045HttpHeaderParser {
    /* JADX WARNING: Missing block: B:26:0x0081, code:
            return false;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static C0002Entry parseCacheHeaders(C0015NetworkResponse response) {
        boolean hasCacheControl;
        long serverExpires;
        C0015NetworkResponse c0015NetworkResponse = response;
        long now = System.currentTimeMillis();
        Map<String, String> headers = c0015NetworkResponse.headers;
        long serverDate = 0;
        long softExpire = 0;
        long maxAge = 0;
        String headerValue = (String) headers.get("Date");
        if (headerValue != null) {
            serverDate = C0045HttpHeaderParser.parseDateAsEpoch(headerValue);
        }
        headerValue = (String) headers.get(HttpRequest.HEADER_CACHE_CONTROL);
        if (headerValue != null) {
            hasCacheControl = true;
            serverExpires = 0;
            long serverExpires2 = headerValue.split(",");
            int i = 0;
            while (true) {
                int i2 = i;
                if (i2 >= serverExpires2.length) {
                    break;
                }
                String[] tokens = serverExpires2;
                serverExpires2 = serverExpires2[i2].trim();
                if (!serverExpires2.equals("no-cache") && !serverExpires2.equals("no-store")) {
                    if (serverExpires2.startsWith("max-age=")) {
                        try {
                            maxAge = Long.parseLong(serverExpires2.substring(8));
                        } catch (Exception e) {
                        }
                    } else if (serverExpires2.equals("must-revalidate") || serverExpires2.equals("proxy-revalidate")) {
                        maxAge = 0;
                    }
                    i = i2 + 1;
                    serverExpires2 = tokens;
                }
            }
        } else {
            serverExpires = 0;
            hasCacheControl = false;
        }
        String headerValue2 = (String) headers.get(HttpRequest.HEADER_EXPIRES);
        if (headerValue2 != null) {
            serverExpires = C0045HttpHeaderParser.parseDateAsEpoch(headerValue2);
        }
        String serverEtag = (String) headers.get(HttpRequest.HEADER_ETAG);
        if (hasCacheControl) {
            softExpire = now + (1000 * maxAge);
        } else if (serverDate > 0 && serverExpires >= serverDate) {
            softExpire = now + (serverExpires - serverDate);
        }
        C0002Entry entry = new C0002Entry();
        entry.data = c0015NetworkResponse.data;
        entry.etag = serverEtag;
        entry.softTtl = softExpire;
        entry.ttl = entry.softTtl;
        entry.serverDate = serverDate;
        entry.responseHeaders = headers;
        return entry;
    }

    public static long parseDateAsEpoch(String dateStr) {
        try {
            return DateUtils.parseDate(dateStr).getTime();
        } catch (DateParseException e) {
            return 0;
        }
    }

    public static String parseCharset(Map<String, String> headers) {
        String contentType = (String) headers.get("Content-Type");
        if (contentType != null) {
            String[] params = contentType.split(";");
            for (int i = 1; i < params.length; i++) {
                String[] pair = params[i].trim().split("=");
                if (pair.length == 2 && pair[0].equals(HttpRequest.PARAM_CHARSET)) {
                    return pair[1];
                }
            }
        }
        return "ISO-8859-1";
    }
}
