package com.android.volley.toolbox;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.os.Handler;
import android.os.Looper;
import android.widget.ImageView;
import com.android.volley.C0000VolleyError;
import com.android.volley.C0021Request;
import com.android.volley.C0024RequestQueue;
import com.android.volley.toolbox.ImageLoader.C0048ImageListener;
import com.android.volley.toolbox.ImageLoader.C00524;
import com.android.volley.toolbox.ImageLoader.C0053BatchedImageRequest;
import com.android.volley.toolbox.ImageLoader.C0054ImageCache;
import com.android.volley.toolbox.ImageLoader.C0055ImageContainer;
import java.util.HashMap;

/* renamed from: com.android.volley.toolbox.ImageLoader */
public class C0056ImageLoader {
    private int mBatchResponseDelayMs;
    private final HashMap<String, C0053BatchedImageRequest> mBatchedResponses;
    private final C0054ImageCache mCache;
    private final Handler mHandler;
    private final HashMap<String, C0053BatchedImageRequest> mInFlightRequests;
    private final C0024RequestQueue mRequestQueue;
    private Runnable mRunnable;

    public C0056ImageLoader(C0024RequestQueue queue, C0054ImageCache imageCache) {
        this.mRequestQueue = queue;
        this.mCache = imageCache;
    }

    public static C0048ImageListener getImageListener(ImageView view, int defaultImageResId, int errorImageResId) {
        return /* anonymous class already generated */;
    }

    public boolean isCached(String requestUrl, int maxWidth, int maxHeight) {
        throwIfNotOnMainThread();
        return this.mCache.getBitmap(C0056ImageLoader.getCacheKey(requestUrl, maxWidth, maxHeight)) != null;
    }

    public C0055ImageContainer get(String requestUrl, C0048ImageListener listener) {
        return get(requestUrl, listener, 0, 0);
    }

    public C0055ImageContainer get(String requestUrl, C0048ImageListener imageListener, int maxWidth, int maxHeight) {
        C0048ImageListener c0048ImageListener = imageListener;
        throwIfNotOnMainThread();
        String str = requestUrl;
        int i = maxWidth;
        int i2 = maxHeight;
        String cacheKey = C0056ImageLoader.getCacheKey(str, i, i2);
        Bitmap cachedBitmap = this.mCache.getBitmap(cacheKey);
        C0055ImageContainer container;
        if (cachedBitmap != null) {
            container = new C0055ImageContainer(cachedBitmap, str, null, null);
            c0048ImageListener.onResponse(container, true);
            return container;
        }
        container = new C0055ImageContainer(null, str, cacheKey, c0048ImageListener);
        c0048ImageListener.onResponse(container, true);
        C0053BatchedImageRequest request = (C0053BatchedImageRequest) this.mInFlightRequests.get(cacheKey);
        if (request != null) {
            request.addContainer(container);
            return container;
        }
        String cacheKey2 = cacheKey;
        C0021Request<?> c0057ImageRequest = new C0057ImageRequest(str, /* anonymous class already generated */, i, i2, Config.RGB_565, /* anonymous class already generated */);
        this.mRequestQueue.add(c0057ImageRequest);
        this.mInFlightRequests.put(cacheKey2, new C0053BatchedImageRequest(this, c0057ImageRequest, container));
        return container;
    }

    public void setBatchedResponseDelay(int newBatchedResponseDelayMs) {
        this.mBatchResponseDelayMs = newBatchedResponseDelayMs;
    }

    private void onGetImageSuccess(String cacheKey, Bitmap response) {
        this.mCache.putBitmap(cacheKey, response);
        C0053BatchedImageRequest request = (C0053BatchedImageRequest) this.mInFlightRequests.remove(cacheKey);
        if (request != null) {
            C0053BatchedImageRequest.access$202(request, response);
            batchResponse(cacheKey, request);
        }
    }

    private void onGetImageError(String cacheKey, C0000VolleyError error) {
        C0053BatchedImageRequest request = (C0053BatchedImageRequest) this.mInFlightRequests.remove(cacheKey);
        if (request != null) {
            request.setError(error);
            batchResponse(cacheKey, request);
        }
    }

    private void batchResponse(String cacheKey, C0053BatchedImageRequest request) {
        this.mBatchedResponses.put(cacheKey, request);
        if (this.mRunnable == null) {
            this.mRunnable = new C00524();
            this.mHandler.postDelayed(this.mRunnable, (long) this.mBatchResponseDelayMs);
        }
    }

    private void throwIfNotOnMainThread() {
        if (Looper.myLooper() != Looper.getMainLooper()) {
            throw new IllegalStateException("ImageLoader must be invoked from the main thread.");
        }
    }

    private static String getCacheKey(String url, int maxWidth, int maxHeight) {
        StringBuilder stringBuilder = new StringBuilder(url.length() + 12);
        stringBuilder.append("#W");
        stringBuilder.append(maxWidth);
        stringBuilder.append("#H");
        stringBuilder.append(maxHeight);
        stringBuilder.append(url);
        return stringBuilder.toString();
    }
}
