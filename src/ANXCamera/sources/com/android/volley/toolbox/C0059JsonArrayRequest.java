package com.android.volley.toolbox;

import com.android.volley.C0015NetworkResponse;
import com.android.volley.C0017ParseError;
import com.android.volley.C0027Response;
import com.android.volley.Response.C0025ErrorListener;
import com.android.volley.Response.C0026Listener;
import org.json.JSONArray;

/* renamed from: com.android.volley.toolbox.JsonArrayRequest */
public class C0059JsonArrayRequest extends C0058JsonRequest<JSONArray> {
    public C0059JsonArrayRequest(String url, C0026Listener<JSONArray> listener, C0025ErrorListener errorListener) {
        super(0, url, null, listener, errorListener);
    }

    protected C0027Response<JSONArray> parseNetworkResponse(C0015NetworkResponse response) {
        try {
            return C0027Response.success(new JSONArray(new String(response.data, C0045HttpHeaderParser.parseCharset(response.headers))), C0045HttpHeaderParser.parseCacheHeaders(response));
        } catch (Throwable e) {
            return C0027Response.error(new C0017ParseError(e));
        } catch (Throwable e2) {
            return C0027Response.error(new C0017ParseError(e2));
        }
    }
}
