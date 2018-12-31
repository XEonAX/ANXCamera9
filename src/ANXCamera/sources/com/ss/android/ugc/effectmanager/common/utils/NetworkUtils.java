package com.ss.android.ugc.effectmanager.common.utils;

import android.text.TextUtils;
import java.net.URI;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.regex.Pattern;

public class NetworkUtils {
    public static String filterUrl(String str, String str2) {
        Pattern compile = Pattern.compile(".*(?=://)");
        Pattern compile2 = Pattern.compile("(?<=://)([^/]*)");
        URI create = URI.create(str);
        return compile2.matcher(compile.matcher(str2).replaceFirst(create.getScheme())).replaceFirst(create.getHost());
    }

    public static <T> String toJson(List<T> list) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("[");
        if (list == null || list.isEmpty()) {
            stringBuilder.append("]");
            return stringBuilder.toString();
        }
        for (Object next : list) {
            stringBuilder.append("\"");
            stringBuilder.append(next.toString());
            stringBuilder.append("\"");
            stringBuilder.append(",");
        }
        stringBuilder.deleteCharAt(stringBuilder.length() - 1);
        stringBuilder.append("]");
        return stringBuilder.toString();
    }

    public static String encodeParameters(Map<String, String> map, String str) {
        StringBuilder stringBuilder = new StringBuilder();
        try {
            for (Entry entry : map.entrySet()) {
                stringBuilder.append(URLEncoder.encode((String) entry.getKey(), str));
                stringBuilder.append('=');
                stringBuilder.append(URLEncoder.encode((String) entry.getValue(), str));
                stringBuilder.append('&');
            }
            return stringBuilder.toString();
        } catch (Throwable e) {
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("Encoding not supported: ");
            stringBuilder2.append(str);
            throw new RuntimeException(stringBuilder2.toString(), e);
        }
    }

    public static String buildRequestUrl(Map<String, String> map, String str) {
        StringBuilder stringBuilder = new StringBuilder(str);
        stringBuilder.append("?");
        if (map.size() > 0) {
            for (Entry entry : map.entrySet()) {
                String str2 = (String) entry.getKey();
                str = (String) entry.getValue();
                if (!(TextUtils.isEmpty(str2) || TextUtils.isEmpty(str))) {
                    stringBuilder.append("&");
                    stringBuilder.append(str2);
                    stringBuilder.append("=");
                    stringBuilder.append(str);
                }
            }
        }
        return new String(stringBuilder);
    }
}
