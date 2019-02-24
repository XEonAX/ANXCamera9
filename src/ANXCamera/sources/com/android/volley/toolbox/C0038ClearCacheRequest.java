package com.android.volley.toolbox;

import android.os.Handler;
import android.os.Looper;
import com.android.volley.C0003Cache;
import com.android.volley.C0015NetworkResponse;
import com.android.volley.C0021Request;
import com.android.volley.C0027Response;
import com.android.volley.Request.C0020Priority;

/* renamed from: com.android.volley.toolbox.ClearCacheRequest */
public class C0038ClearCacheRequest extends C0021Request<Object> {
    private final C0003Cache mCache;
    private final Runnable mCallback;

    public C0038ClearCacheRequest(C0003Cache cache, Runnable callback) {
        super(0, null, null);
        this.mCache = cache;
        this.mCallback = callback;
    }

    public boolean isCanceled() {
        this.mCache.clear();
        if (this.mCallback != null) {
            new Handler(Looper.getMainLooper()).postAtFrontOfQueue(this.mCallback);
        }
        return true;
    }

    public C0020Priority getPriority() {
        return C0020Priority.IMMEDIATE;
    }

    protected C0027Response<Object> parseNetworkResponse(C0015NetworkResponse response) {
        return null;
    }

    protected void deliverResponse(Object response) {
    }
}
