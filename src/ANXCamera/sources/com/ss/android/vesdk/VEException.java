package com.ss.android.vesdk;

public class VEException extends RuntimeException {
    private String msgDes;
    private int ret;

    public VEException(int i, String str) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("VESDK exception ret: ");
        stringBuilder.append(i);
        stringBuilder.append("msg: ");
        stringBuilder.append(str);
        super(stringBuilder.toString());
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
