package com.android.camera.network.net.base;

import android.text.TextUtils;
import java.util.HashMap;
import java.util.Map;

public abstract class BaseRequest<T> implements ResponseErrorHandler {
    private static ResponseErrorHandler mAppResponseErrorHandler;
    protected long mCacheExpires = -1;
    protected long mCacheSoftTtl = -1;
    private ResponseDispatcher mListenerDispatcher = null;
    protected Map<String, String> mParams;
    protected RequestError mRequestError;
    protected Object[] mResponse;
    private Object mTag = null;
    private boolean mUseCache = false;

    public abstract void cancel();

    public abstract void execute();

    public abstract Object[] executeSync() throws RequestError;

    public abstract void onRequestError(ErrorCode errorCode, String str, Object obj);

    protected abstract void onRequestSuccess(T t) throws Exception;

    public static void setAppResponseErrorHandler(ResponseErrorHandler responseErrorHandler) {
        mAppResponseErrorHandler = responseErrorHandler;
    }

    public final BaseRequest<T> setOnResponseListener(ResponseListener responseListener) {
        this.mListenerDispatcher = new ResponseDispatcher(responseListener);
        return this;
    }

    protected void deliverResponse(Object... objArr) {
        this.mResponse = objArr;
        if (this.mListenerDispatcher != null) {
            this.mListenerDispatcher.onResponse(objArr);
        }
    }

    protected void deliverError(ErrorCode errorCode, String str, Object obj) {
        this.mRequestError = new RequestError(errorCode, str, obj);
        if (this.mListenerDispatcher != null) {
            this.mListenerDispatcher.onResponseError(errorCode, str, obj);
        }
        if (mAppResponseErrorHandler != null) {
            mAppResponseErrorHandler.onRequestError(errorCode, str, obj);
        }
    }

    public final BaseRequest<T> addParam(String str, String str2) {
        if (TextUtils.isEmpty(str)) {
            return this;
        }
        Object str22;
        if (this.mParams == null) {
            this.mParams = new HashMap();
        }
        if (str22 == null) {
            str22 = "";
        }
        this.mParams.put(str, str22);
        return this;
    }

    public final BaseRequest<T> setUseCache(boolean z) {
        this.mUseCache = z;
        return this;
    }

    protected final boolean isUseCache() {
        return this.mUseCache;
    }

    public final BaseRequest<T> setCacheExpires(long j) {
        this.mCacheExpires = j;
        return this;
    }

    public final BaseRequest<T> setCacheSoftTtl(long j) {
        this.mCacheSoftTtl = j;
        return this;
    }

    public final <T> T simpleExecuteSync() throws RequestError {
        Object[] executeSync = executeSync();
        if (executeSync == null || executeSync.length <= 0) {
            return null;
        }
        return executeSync[0];
    }

    public final void execute(ResponseListener responseListener) {
        setOnResponseListener(responseListener);
        execute();
    }

    public Object[] getResponse() {
        return this.mResponse;
    }

    public RequestError getRequestError() {
        return this.mRequestError;
    }

    public BaseRequest<T> setTag(Object obj) {
        this.mTag = obj;
        return this;
    }

    public Object getTag() {
        return this.mTag;
    }
}
