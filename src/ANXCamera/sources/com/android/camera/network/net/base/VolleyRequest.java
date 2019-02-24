package com.android.camera.network.net.base;

import android.os.Looper;
import com.android.camera.constant.DurationConstant;
import com.android.camera.network.net.HttpManager;
import com.android.camera.network.threadpool.ThreadManager;
import com.android.volley.DefaultRetryPolicy;
import com.android.volley.Request;
import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
import com.android.volley.VolleyError;
import java.util.concurrent.CountDownLatch;

public abstract class VolleyRequest<T, E> extends BaseRequest<E> implements ErrorListener, Listener<T> {
    private Request<T> mRequest;
    private CountDownLatch mSyncExecuteLock = null;

    protected abstract Request<T> createVolleyRequest(Listener<T> listener, ErrorListener errorListener);

    protected abstract void handleResponse(T t);

    public void execute() {
        this.mRequest = createVolleyRequest(this, this);
        if (this.mRequest != null) {
            this.mRequest.setRetryPolicy(new DefaultRetryPolicy(DurationConstant.DURATION_VIDEO_RECORDING_CIRCLE, 1, 1.0f));
            this.mRequest.setShouldCache(isUseCache());
            Object tag = getTag();
            if (this.mRequest.getTag() == null && tag != null) {
                this.mRequest.setTag(tag);
            }
            HttpManager.getInstance().addToRequestQueue(this.mRequest);
        }
    }

    public Object[] executeSync() throws RequestError {
        if (Looper.myLooper() == Looper.getMainLooper() || Looper.myLooper() == ThreadManager.getRequestThreadLooper()) {
            throw new RuntimeException("executeSync could not call on main thread or request thread.");
        }
        this.mSyncExecuteLock = new CountDownLatch(1);
        execute();
        try {
            this.mSyncExecuteLock.await();
        } catch (InterruptedException e) {
        }
        if (this.mRequestError == null) {
            return this.mResponse;
        }
        throw this.mRequestError;
    }

    private void releaseSyncExecuteLock() {
        if (this.mSyncExecuteLock != null) {
            this.mSyncExecuteLock.countDown();
            this.mSyncExecuteLock = null;
        }
    }

    public final void cancel() {
        releaseSyncExecuteLock();
        setOnResponseListener(null);
        if (this.mRequest != null) {
            this.mRequest.cancel();
        }
    }

    public final void onResponse(T t) {
        handleResponse(t);
        releaseSyncExecuteLock();
        if (this.mRequest instanceof Cacheable) {
            Cacheable cacheable = (Cacheable) this.mRequest;
            if (this.mCacheExpires > 0 && !cacheable.isFromCache()) {
                HttpManager.getInstance().putToCache(this.mRequest.getCacheKey(), cacheable.getData(), this.mCacheExpires, this.mCacheSoftTtl);
            }
        }
    }

    public final void onErrorResponse(VolleyError volleyError) {
        Throwable volleyError2;
        ErrorCode errorCode = ErrorCode.NET_ERROR;
        if (volleyError2 instanceof RequestError) {
            errorCode = ((RequestError) volleyError2).getErrorCode();
        }
        Throwable cause = volleyError2.getCause();
        if (cause != null) {
            volleyError2 = cause;
        }
        handleError(errorCode, volleyError2.getMessage(), volleyError2);
        releaseSyncExecuteLock();
    }

    protected final void handleError(ErrorCode errorCode, String str, Object obj) {
        this.mCacheExpires = -1;
        onRequestError(errorCode, str, obj);
    }
}
