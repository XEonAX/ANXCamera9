package com.android.camera.network.net.base;

import com.android.volley.VolleyError;

public class RequestError extends VolleyError {
    private ErrorCode mErrorCode;
    private Object mResponseData;

    public RequestError(ErrorCode errorCode, String str, Object obj) {
        super(str);
        this.mErrorCode = errorCode;
        this.mResponseData = obj;
    }

    public ErrorCode getErrorCode() {
        return this.mErrorCode;
    }

    public Object getResponseData() {
        return this.mResponseData;
    }

    public Throwable getCause() {
        if (this.mResponseData instanceof Throwable) {
            return (Throwable) this.mResponseData;
        }
        return super.getCause();
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(super.toString());
        stringBuilder.append(" code : ");
        stringBuilder.append(this.mErrorCode);
        return stringBuilder.toString();
    }
}
