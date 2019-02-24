package com.android.volley.toolbox;

import com.android.volley.C0015NetworkResponse;
import com.android.volley.C0021Request;
import com.android.volley.C0027Response;
import com.android.volley.Response.C0025ErrorListener;
import com.android.volley.Response.C0026Listener;
import java.io.UnsupportedEncodingException;

/* renamed from: com.android.volley.toolbox.StringRequest */
public class C0067StringRequest extends C0021Request<String> {
    private final C0026Listener<String> mListener;

    public C0067StringRequest(int method, String url, C0026Listener<String> listener, C0025ErrorListener errorListener) {
        super(method, url, errorListener);
        this.mListener = listener;
    }

    public C0067StringRequest(String url, C0026Listener<String> listener, C0025ErrorListener errorListener) {
        this(0, url, listener, errorListener);
    }

    protected void deliverResponse(String response) {
        this.mListener.onResponse(response);
    }

    protected C0027Response<String> parseNetworkResponse(C0015NetworkResponse response) {
        String parsed;
        try {
            parsed = new String(response.data, C0045HttpHeaderParser.parseCharset(response.headers));
        } catch (UnsupportedEncodingException e) {
            parsed = new String(response.data);
        }
        return C0027Response.success(parsed, C0045HttpHeaderParser.parseCacheHeaders(response));
    }
}
