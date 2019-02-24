package com.android.volley.toolbox;

import com.android.volley.C0015NetworkResponse;
import com.android.volley.C0021Request;
import com.android.volley.C0027Response;
import com.android.volley.C0032VolleyLog;
import com.android.volley.Response.C0025ErrorListener;
import com.android.volley.Response.C0026Listener;
import java.io.UnsupportedEncodingException;

/* renamed from: com.android.volley.toolbox.JsonRequest */
public abstract class C0058JsonRequest<T> extends C0021Request<T> {
    private static final String PROTOCOL_CHARSET = "utf-8";
    private static final String PROTOCOL_CONTENT_TYPE = String.format("application/json; charset=%s", new Object[]{"utf-8"});
    private final C0026Listener<T> mListener;
    private final String mRequestBody;

    protected abstract C0027Response<T> parseNetworkResponse(C0015NetworkResponse c0015NetworkResponse);

    public C0058JsonRequest(String url, String requestBody, C0026Listener<T> listener, C0025ErrorListener errorListener) {
        this(-1, url, requestBody, listener, errorListener);
    }

    public C0058JsonRequest(int method, String url, String requestBody, C0026Listener<T> listener, C0025ErrorListener errorListener) {
        super(method, url, errorListener);
        this.mListener = listener;
        this.mRequestBody = requestBody;
    }

    protected void deliverResponse(T response) {
        this.mListener.onResponse(response);
    }

    public String getPostBodyContentType() {
        return getBodyContentType();
    }

    public byte[] getPostBody() {
        return getBody();
    }

    public String getBodyContentType() {
        return PROTOCOL_CONTENT_TYPE;
    }

    public byte[] getBody() {
        byte[] bArr = null;
        try {
            if (this.mRequestBody != null) {
                bArr = this.mRequestBody.getBytes("utf-8");
            }
            return bArr;
        } catch (UnsupportedEncodingException e) {
            C0032VolleyLog.wtf("Unsupported Encoding while trying to get the bytes of %s using %s", this.mRequestBody, "utf-8");
            return null;
        }
    }
}
