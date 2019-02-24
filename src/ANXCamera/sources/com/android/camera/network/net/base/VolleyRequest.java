package com.android.camera.network.net.base;

import android.os.Looper;
import com.android.camera.constant.DurationConstant;
import com.android.camera.network.net.HttpManager;
import com.android.camera.network.threadpool.ThreadManager;
import com.android.volley.C0000VolleyError;
import com.android.volley.C0007DefaultRetryPolicy;
import com.android.volley.C0021Request;
import com.android.volley.Response.C0025ErrorListener;
import com.android.volley.Response.C0026Listener;
import java.util.concurrent.CountDownLatch;

public abstract class VolleyRequest<T, E> extends BaseRequest<E> implements C0025ErrorListener, C0026Listener<T> {
    private C0021Request<T> mRequest;
    private CountDownLatch mSyncExecuteLock = null;

    protected abstract C0021Request<T> createVolleyRequest(C0026Listener<T> c0026Listener, C0025ErrorListener c0025ErrorListener);

    protected abstract void handleResponse(T t);

    public void execute() {
        this.mRequest = createVolleyRequest(this, this);
        if (this.mRequest != null) {
            this.mRequest.setRetryPolicy(new C0007DefaultRetryPolicy(DurationConstant.DURATION_VIDEO_RECORDING_CIRCLE, 1, 1.0f));
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

    public final void onErrorResponse(C0000VolleyError c0000VolleyError) {
        Throwable c0000VolleyError2;
        ErrorCode errorCode = ErrorCode.NET_ERROR;
        if (c0000VolleyError2 instanceof RequestError) {
            errorCode = ((RequestError) c0000VolleyError2).getErrorCode();
        }
        Throwable cause = c0000VolleyError2.getCause();
        if (cause != null) {
            c0000VolleyError2 = cause;
        }
        handleError(errorCode, c0000VolleyError2.getMessage(), c0000VolleyError2);
        releaseSyncExecuteLock();
    }

    protected final void handleError(ErrorCode errorCode, String str, Object obj) {
        this.mCacheExpires = -1;
        onRequestError(errorCode, str, obj);
    }
}
