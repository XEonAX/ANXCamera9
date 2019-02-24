package com.android.camera.network.net;

import android.content.Context;
import com.android.camera.network.NetworkDependencies;
import com.android.camera.network.threadpool.ThreadManager;
import com.android.camera.sticker.FileUtils;
import com.android.volley.ExecutorDelivery;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.toolbox.BasicNetwork;
import com.android.volley.toolbox.HurlStack;

public class HttpManager {
    private static final int CACHE_DISK_USAGE_BYTES = 5242880;
    private static final int NETWORK_THREAD_POOL_SIZE = 2;
    private static HttpManager instance;
    private Context mContext;
    private GalleryCache mRequestCache;
    private RequestQueue mRequestQueue;

    public static synchronized HttpManager getInstance() {
        HttpManager httpManager;
        synchronized (HttpManager.class) {
            if (instance == null) {
                instance = new HttpManager();
            }
            httpManager = instance;
        }
        return httpManager;
    }

    public void initRequestQueue(Context context) {
        this.mContext = context;
        this.mRequestCache = new GalleryCache(NetworkDependencies.getRequestCache(context), CACHE_DISK_USAGE_BYTES);
        this.mRequestQueue = new RequestQueue(this.mRequestCache, new BasicNetwork(new HurlStack()), 2, new ExecutorDelivery(ThreadManager.getRequestThreadHandler()));
        this.mRequestQueue.start();
    }

    public void putToCache(String str, byte[] bArr, long j, long j2) {
        this.mRequestCache.put(str, bArr, j, j2);
    }

    public void putDefaultCache(String str, String str2) {
        if (!this.mRequestCache.isCacheValid(str)) {
            FileUtils.copyFileIfNeed(this.mContext, this.mRequestCache.getFileForKey(str), str2);
            this.mRequestCache.initialize();
        }
    }

    public <T> void addToRequestQueue(Request<T> request) {
        this.mRequestQueue.add(request);
    }

    public void cancelAll(String str) {
        this.mRequestQueue.cancelAll((Object) str);
    }
}
