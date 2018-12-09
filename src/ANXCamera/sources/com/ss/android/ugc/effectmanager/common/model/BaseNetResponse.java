package com.ss.android.ugc.effectmanager.common.model;

public class BaseNetResponse {
    private String message;
    private int status_code;

    public int getStatus_code() {
        return this.status_code;
    }

    public void setStatus_code(int i) {
        this.status_code = i;
    }

    public String getMessage() {
        return this.message;
    }

    public void setMessage(String str) {
        this.message = str;
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("BaseNetResponse{status_code=");
        stringBuilder.append(this.status_code);
        stringBuilder.append(", message='");
        stringBuilder.append(this.message);
        stringBuilder.append('\'');
        stringBuilder.append('}');
        return stringBuilder.toString();
    }
}
