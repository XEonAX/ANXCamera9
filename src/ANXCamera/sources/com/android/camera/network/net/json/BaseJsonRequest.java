package com.android.camera.network.net.json;

import com.android.camera.network.net.base.ErrorCode;
import com.android.camera.network.net.base.VolleyRequest;
import com.android.volley.Request;
import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import org.json.JSONObject;

public abstract class BaseJsonRequest<T> extends VolleyRequest<JSONObject, T> {
    private Map<String, String> mHeaders;
    private int mMethod = 1;
    private String mUrl = null;

    public BaseJsonRequest(int i, String str) {
        this.mMethod = i;
        this.mUrl = str;
    }

    public final void setUrl(String str) {
        this.mUrl = str;
    }

    public final String getUrl() {
        return this.mUrl;
    }

    public final void addHeader(String str, String str2) {
        if (this.mHeaders == null) {
            this.mHeaders = new HashMap();
        }
        this.mHeaders.put(str, str2);
    }

    protected void onRequestSuccess(T t) throws Exception {
        deliverResponse(t);
    }

    public void onRequestError(ErrorCode errorCode, String str, Object obj) {
        deliverError(errorCode, str, obj);
    }

    protected final Request<JSONObject> createVolleyRequest(Listener<JSONObject> listener, ErrorListener errorListener) {
        String str = this.mUrl;
        String appendUrlParams = appendUrlParams();
        if (this.mMethod == 0) {
            str = appendUrlParams;
        }
        Request jsonObjectRequest = new JsonObjectRequest(this.mMethod, str, listener, errorListener);
        if (this.mParams != null) {
            jsonObjectRequest.setParams(this.mParams);
        }
        if (this.mHeaders != null) {
            jsonObjectRequest.setHeaders(this.mHeaders);
        }
        jsonObjectRequest.setCacheKey(getCacheKey());
        return jsonObjectRequest;
    }

    public String getCacheKey() {
        return appendUrlParams();
    }

    private String appendUrlParams() {
        if (this.mUrl == null || this.mParams == null || this.mParams.isEmpty()) {
            return this.mUrl;
        }
        StringBuilder stringBuilder = new StringBuilder(this.mUrl);
        if (this.mUrl.indexOf(63) > 0) {
            if (!(this.mUrl.endsWith("?") || this.mUrl.endsWith("&"))) {
                stringBuilder.append("&");
            }
            stringBuilder.append(encodeParameters(this.mParams, "UTF-8"));
            return stringBuilder.toString();
        }
        stringBuilder.append("?");
        stringBuilder.append(encodeParameters(this.mParams, "UTF-8"));
        return stringBuilder.toString();
    }

    private String encodeParameters(Map<String, String> map, String str) {
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
}
