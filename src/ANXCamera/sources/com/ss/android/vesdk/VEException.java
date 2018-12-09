package com.ss.android.vesdk;

public class VEException extends RuntimeException {
    private String msgDes;
    private int ret;

    public VEException(int i, String str) {
        this.ret = i;
        this.msgDes = str;
    }

    public int getRetCd() {
        return this.ret;
    }

    public String getMsgDes() {
        return this.msgDes;
    }
}
