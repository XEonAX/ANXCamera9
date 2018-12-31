package com.android.camera.network.net.base;

public abstract class SimpleResponseListener<T> implements ResponseListener {
    public abstract void onResponse(T t);

    public final void onResponse(Object... objArr) {
        if (objArr == null || objArr.length <= 0) {
            onResponse(null);
        } else {
            onResponse(objArr[0]);
        }
    }

    public void onResponseError(ErrorCode errorCode, String str, Object obj) {
    }
}
