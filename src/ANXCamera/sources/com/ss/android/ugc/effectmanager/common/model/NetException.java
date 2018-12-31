package com.ss.android.ugc.effectmanager.common.model;

public class NetException extends Exception {
    private Integer status_code;

    public NetException(Integer num, String str) {
        super(str);
        this.status_code = num;
    }

    public Integer getStatus_code() {
        return this.status_code;
    }

    public void setStatus_code(Integer num) {
        this.status_code = num;
    }
}
