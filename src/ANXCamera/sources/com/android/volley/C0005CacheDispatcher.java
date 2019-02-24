package com.android.volley;

import android.os.Process;
import com.android.volley.Cache.C0002Entry;
import java.util.concurrent.BlockingQueue;

/* renamed from: com.android.volley.CacheDispatcher */
public class C0005CacheDispatcher extends Thread {
    private static final boolean DEBUG = C0032VolleyLog.DEBUG;
    private final C0003Cache mCache;
    private final BlockingQueue<C0021Request<?>> mCacheQueue;
    private final C0010ResponseDelivery mDelivery;
    private final BlockingQueue<C0021Request<?>> mNetworkQueue;
    private volatile boolean mQuit;

    public C0005CacheDispatcher(BlockingQueue<C0021Request<?>> cacheQueue, BlockingQueue<C0021Request<?>> networkQueue, C0003Cache cache, C0010ResponseDelivery delivery) {
        this.mCacheQueue = cacheQueue;
        this.mNetworkQueue = networkQueue;
        this.mCache = cache;
        this.mDelivery = delivery;
    }

    public void quit() {
        this.mQuit = true;
        interrupt();
    }

    public void run() {
        if (DEBUG) {
            C0032VolleyLog.v("start new dispatcher", new Object[0]);
        }
        Process.setThreadPriority(10);
        this.mCache.initialize();
        while (true) {
            try {
                C0021Request<?> request = (C0021Request) this.mCacheQueue.take();
                request.addMarker("cache-queue-take");
                if (request.isCanceled()) {
                    request.finish("cache-discard-canceled");
                } else {
                    C0002Entry entry = this.mCache.get(request.getCacheKey());
                    if (entry == null) {
                        request.addMarker("cache-miss");
                        this.mNetworkQueue.put(request);
                    } else if (entry.isExpired()) {
                        request.addMarker("cache-hit-expired");
                        request.setCacheEntry(entry);
                        this.mNetworkQueue.put(request);
                    } else {
                        request.addMarker("cache-hit");
                        C0027Response<?> response = request.parseNetworkResponse(new C0015NetworkResponse(entry.data, entry.responseHeaders));
                        request.addMarker("cache-hit-parsed");
                        if (entry.refreshNeeded()) {
                            request.addMarker("cache-hit-refresh-needed");
                            request.setCacheEntry(entry);
                            response.intermediate = true;
                            this.mDelivery.postResponse(request, response, /* anonymous class already generated */);
                        } else {
                            this.mDelivery.postResponse(request, response);
                        }
                    }
                }
            } catch (InterruptedException e) {
                if (this.mQuit) {
                    return;
                }
            }
        }
    }
}
