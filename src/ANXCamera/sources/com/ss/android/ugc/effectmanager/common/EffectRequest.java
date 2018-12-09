package com.ss.android.ugc.effectmanager.common;

import com.ss.android.vesdk.runtime.cloudconfig.HttpRequest;
import java.util.HashMap;
import java.util.Map;

public class EffectRequest {
    public static final String DEFAULT_PARAMS_ENCODING = "UTF-8";
    protected boolean isCancel = false;
    private Map<String, Object> mBodyParams = new HashMap();
    private String mContentType = HttpRequest.CONTENT_TYPE_FORM;
    private Map<String, String> mHeaders = new HashMap();
    String mHttpMethod = "GET";
    private String mUrl = "";

    public String getContentType() {
        return this.mContentType;
    }

    public void setContentType(String str) {
        this.mContentType = str;
    }

    public EffectRequest(String str, String str2) {
        this.mHttpMethod = str;
        this.mUrl = str2;
    }

    public String getUrl() {
        return this.mUrl;
    }

    protected String getParamsEncoding() {
        return "UTF-8";
    }

    public String getBodyContentType() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("application/x-www-form-urlencoded; charset=");
        stringBuilder.append(getParamsEncoding());
        return stringBuilder.toString();
    }

    public String getHttpMethod() {
        return this.mHttpMethod;
    }

    public Map<String, String> getHeaders() {
        return this.mHeaders;
    }

    public Map<String, Object> getParams() {
        return this.mBodyParams;
    }

    public void setHeaders(Map<String, String> map) {
        this.mHeaders = map;
    }

    public void setBodyParams(Map<String, Object> map) {
        this.mBodyParams = map;
    }

    public void cancel() {
        this.isCancel = true;
    }

    public boolean isCanceled() {
        return this.isCancel;
    }
}
