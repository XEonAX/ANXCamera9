package com.android.camera.network.net.json;

import com.android.camera.network.net.base.Cacheable;
import com.android.volley.C0001AuthFailureError;
import com.android.volley.C0015NetworkResponse;
import com.android.volley.C0017ParseError;
import com.android.volley.C0021Request;
import com.android.volley.C0027Response;
import com.android.volley.Response.C0025ErrorListener;
import com.android.volley.Response.C0026Listener;
import com.android.volley.toolbox.C0045HttpHeaderParser;
import com.ss.android.vesdk.runtime.cloudconfig.HttpRequest;
import java.util.Map;
import org.json.JSONObject;

public class JsonObjectRequest extends C0021Request<JSONObject> implements Cacheable {
    private String mCacheKey = null;
    private volatile byte[] mData = null;
    private Map<String, String> mHeaders = null;
    private volatile boolean mIsFromCache = false;
    private C0026Listener<JSONObject> mListener;
    private Map<String, String> mParams = null;

    public JsonObjectRequest(int i, String str, C0026Listener<JSONObject> c0026Listener, C0025ErrorListener c0025ErrorListener) {
        super(i, str, c0025ErrorListener);
        this.mListener = c0026Listener;
    }

    public void setParams(Map<String, String> map) {
        this.mParams = map;
    }

    public Map<String, String> getParams() throws C0001AuthFailureError {
        return this.mParams != null ? this.mParams : super.getParams();
    }

    public void setHeaders(Map<String, String> map) {
        this.mHeaders = map;
    }

    public Map<String, String> getHeaders() throws C0001AuthFailureError {
        return this.mHeaders != null ? this.mHeaders : super.getHeaders();
    }

    protected void deliverResponse(JSONObject jSONObject) {
        if (this.mListener != null) {
            this.mListener.onResponse(jSONObject);
        }
    }

    protected C0027Response<JSONObject> parseNetworkResponse(C0015NetworkResponse c0015NetworkResponse) {
        try {
            this.mIsFromCache = c0015NetworkResponse.headers.containsKey(Cacheable.HEADER_FROM_CACHE);
            this.mData = c0015NetworkResponse.data;
            return C0027Response.success(new JSONObject(new String(c0015NetworkResponse.data, parseCharset(c0015NetworkResponse.headers, "utf-8"))), C0045HttpHeaderParser.parseCacheHeaders(c0015NetworkResponse));
        } catch (Throwable e) {
            return C0027Response.error(new C0017ParseError(e));
        } catch (Throwable e2) {
            return C0027Response.error(new C0017ParseError(e2));
        }
    }

    public static String parseCharset(Map<String, String> map, String str) {
        String str2 = (String) map.get("Content-Type");
        if (str2 != null) {
            String[] split = str2.split(";");
            for (int i = 1; i < split.length; i++) {
                String[] split2 = split[i].trim().split("=");
                if (split2.length == 2 && split2[0].equals(HttpRequest.PARAM_CHARSET)) {
                    return split2[1];
                }
            }
        }
        return str;
    }

    public String getCacheKey() {
        return this.mCacheKey == null ? super.getCacheKey() : this.mCacheKey;
    }

    public byte[] getData() {
        return this.mData;
    }

    public boolean isFromCache() {
        return this.mIsFromCache;
    }

    public void setCacheKey(String str) {
        this.mCacheKey = str;
    }
}
