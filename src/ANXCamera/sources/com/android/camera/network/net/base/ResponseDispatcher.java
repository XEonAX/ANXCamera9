package com.android.camera.network.net.base;

import android.os.Handler;
import android.os.Looper;

public class ResponseDispatcher {
    private Handler mHandler = null;
    private ResponseListener mOnResponseListener;

    public ResponseListener getResponseListener() {
        return this.mOnResponseListener;
    }

    public ResponseDispatcher(ResponseListener responseListener) {
        this.mOnResponseListener = responseListener;
        this.mHandler = new Handler(Looper.getMainLooper());
    }

    public void onResponse(final Object... objArr) {
        if (this.mOnResponseListener == null) {
            return;
        }
        if (this.mOnResponseListener instanceof ResponseHandler) {
            this.mHandler.post(new Runnable() {
                public void run() {
                    try {
                        ResponseDispatcher.this.mOnResponseListener.onResponse(objArr);
                    } catch (Exception e) {
                        ResponseDispatcher.this.onResponseError(ErrorCode.DATA_BIND_ERROR, null, null);
                    }
                }
            });
            return;
        }
        try {
            this.mOnResponseListener.onResponse(objArr);
        } catch (Exception e) {
            onResponseError(ErrorCode.DATA_BIND_ERROR, null, null);
        }
    }

    public void onResponseError(final ErrorCode errorCode, final String str, final Object obj) {
        if (this.mOnResponseListener == null) {
            return;
        }
        if (this.mOnResponseListener instanceof ResponseHandler) {
            this.mHandler.post(new Runnable() {
                public void run() {
                    ResponseDispatcher.this.mOnResponseListener.onResponseError(errorCode, str, obj);
                }
            });
        } else {
            this.mOnResponseListener.onResponseError(errorCode, str, obj);
        }
    }

    public void post(Runnable runnable) {
        if (this.mHandler != null) {
            this.mHandler.post(runnable);
        }
    }
}
