package com.android.volley;

import java.util.Collections;
import java.util.Map;

/* renamed from: com.android.volley.NetworkResponse */
public class C0015NetworkResponse {
    public final byte[] data;
    public final Map<String, String> headers;
    public final boolean notModified;
    public final int statusCode;

    public C0015NetworkResponse(int statusCode, byte[] data, Map<String, String> headers, boolean notModified) {
        this.statusCode = statusCode;
        this.data = data;
        this.headers = headers;
        this.notModified = notModified;
    }

    public C0015NetworkResponse(byte[] data) {
        this(200, data, Collections.emptyMap(), false);
    }

    public C0015NetworkResponse(byte[] data, Map<String, String> headers) {
        this(200, data, headers, false);
    }
}
