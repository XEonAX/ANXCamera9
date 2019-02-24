package com.android.volley.toolbox;

import com.android.volley.C0015NetworkResponse;
import com.android.volley.C0017ParseError;
import com.android.volley.C0027Response;
import com.android.volley.Response.C0025ErrorListener;
import com.android.volley.Response.C0026Listener;
import org.json.JSONObject;

/* renamed from: com.android.volley.toolbox.JsonObjectRequest */
public class C0060JsonObjectRequest extends C0058JsonRequest<JSONObject> {
    public C0060JsonObjectRequest(int method, String url, JSONObject jsonRequest, C0026Listener<JSONObject> listener, C0025ErrorListener errorListener) {
        super(method, url, jsonRequest == null ? null : jsonRequest.toString(), listener, errorListener);
    }

    public C0060JsonObjectRequest(String url, JSONObject jsonRequest, C0026Listener<JSONObject> listener, C0025ErrorListener errorListener) {
        this(jsonRequest == null ? 0 : 1, url, jsonRequest, listener, errorListener);
    }

    protected C0027Response<JSONObject> parseNetworkResponse(C0015NetworkResponse response) {
        try {
            return C0027Response.success(new JSONObject(new String(response.data, C0045HttpHeaderParser.parseCharset(response.headers))), C0045HttpHeaderParser.parseCacheHeaders(response));
        } catch (Throwable e) {
            return C0027Response.error(new C0017ParseError(e));
        } catch (Throwable e2) {
            return C0027Response.error(new C0017ParseError(e2));
        }
    }
}
