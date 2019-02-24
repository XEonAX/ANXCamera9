package com.android.camera.network.net.base;

public interface ResponseErrorHandler {
    void onRequestError(ErrorCode errorCode, String str, Object obj);
}
