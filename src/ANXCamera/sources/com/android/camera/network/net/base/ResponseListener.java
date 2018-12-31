package com.android.camera.network.net.base;

public interface ResponseListener {
    void onResponse(Object... objArr);

    void onResponseError(ErrorCode errorCode, String str, Object obj);
}
