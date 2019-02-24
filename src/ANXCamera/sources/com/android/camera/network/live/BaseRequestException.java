package com.android.camera.network.live;

import com.android.camera.network.net.base.ErrorCode;

public class BaseRequestException extends Exception {
    private ErrorCode mErrorCode;

    public BaseRequestException(ErrorCode errorCode, String str) {
        super(str);
        this.mErrorCode = errorCode;
    }

    public BaseRequestException(ErrorCode errorCode, String str, Throwable th) {
        super(str, th);
        this.mErrorCode = errorCode;
    }

    public ErrorCode getErrorCode() {
        return this.mErrorCode;
    }
}
