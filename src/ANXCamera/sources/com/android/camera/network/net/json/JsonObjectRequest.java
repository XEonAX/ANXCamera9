package com.android.camera.network.net.json;

import com.android.camera.network.net.base.Cacheable;
import com.android.volley.AuthFailureError;
import com.android.volley.NetworkResponse;
import com.android.volley.ParseError;
import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
import com.android.volley.toolbox.HttpHeaderParser;
import com.ss.android.vesdk.runtime.cloudconfig.HttpRequest;
import java.util.Map;
import org.json.JSONObject;

public class JsonObjectRequest extends Request<JSONObject> implements Cacheable {
    private String mCacheKey = null;
    private volatile byte[] mData = null;
    private Map<String, String> mHeaders = null;
    private volatile boolean mIsFromCache = false;
    private Listener<JSONObject> mListener;
    private Map<String, String> mParams = null;

    public JsonObjectRequest(int i, String str, Listener<JSONObject> listener, ErrorListener errorListener) {
        super(i, str, errorListener);
        this.mListener = listener;
    }

    public void setParams(Map<String, String> map) {
        this.mParams = map;
    }

    public Map<String, String> getParams() throws AuthFailureError {
        return this.mParams != null ? this.mParams : super.getParams();
    }

    public void setHeaders(Map<String, String> map) {
        this.mHeaders = map;
    }

    public Map<String, String> getHeaders() throws AuthFailureError {
        return this.mHeaders != null ? this.mHeaders : super.getHeaders();
    }

    protected void deliverResponse(JSONObject jSONObject) {
        if (this.mListener != null) {
            this.mListener.onResponse(jSONObject);
        }
    }

    protected Response<JSONObject> parseNetworkResponse(NetworkResponse networkResponse) {
        try {
            this.mIsFromCache = networkResponse.headers.containsKey(Cacheable.HEADER_FROM_CACHE);
            this.mData = networkResponse.data;
            return Response.success(new JSONObject(new String(networkResponse.data, parseCharset(networkResponse.headers, "utf-8"))), HttpHeaderParser.parseCacheHeaders(networkResponse));
        } catch (Throwable e) {
            return Response.error(new ParseError(e));
        } catch (Throwable e2) {
            return Response.error(new ParseError(e2));
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
