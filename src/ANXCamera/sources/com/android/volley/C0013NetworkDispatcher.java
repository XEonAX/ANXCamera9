package com.android.volley;

import android.annotation.TargetApi;
import android.net.TrafficStats;
import android.os.Build.VERSION;
import android.os.Process;
import java.util.concurrent.BlockingQueue;

/* renamed from: com.android.volley.NetworkDispatcher */
public class C0013NetworkDispatcher extends Thread {
    private final C0003Cache mCache;
    private final C0010ResponseDelivery mDelivery;
    private final C0012Network mNetwork;
    private final BlockingQueue<C0021Request<?>> mQueue;
    private volatile boolean mQuit;

    public C0013NetworkDispatcher(BlockingQueue<C0021Request<?>> queue, C0012Network network, C0003Cache cache, C0010ResponseDelivery delivery) {
        this.mQueue = queue;
        this.mNetwork = network;
        this.mCache = cache;
        this.mDelivery = delivery;
    }

    public void quit() {
        this.mQuit = true;
        interrupt();
    }

    @TargetApi(14)
    private void addTrafficStatsTag(C0021Request<?> request) {
        if (VERSION.SDK_INT >= 14) {
            TrafficStats.setThreadStatsTag(request.getTrafficStatsTag());
        }
    }

    public void run() {
        Process.setThreadPriority(10);
        while (true) {
            try {
                C0021Request<?> request = (C0021Request) this.mQueue.take();
                try {
                    request.addMarker("network-queue-take");
                    if (request.isCanceled()) {
                        request.finish("network-discard-cancelled");
                    } else {
                        addTrafficStatsTag(request);
                        C0015NetworkResponse networkResponse = this.mNetwork.performRequest(request);
                        request.addMarker("network-http-complete");
                        if (networkResponse.notModified && request.hasHadResponseDelivered()) {
                            request.finish("not-modified");
                        } else {
                            C0027Response<?> response = request.parseNetworkResponse(networkResponse);
                            request.addMarker("network-parse-complete");
                            if (request.shouldCache() && response.cacheEntry != null) {
                                this.mCache.put(request.getCacheKey(), response.cacheEntry);
                                request.addMarker("network-cache-written");
                            }
                            request.markDelivered();
                            this.mDelivery.postResponse(request, response);
                        }
                    }
                } catch (C0000VolleyError volleyError) {
                    parseAndDeliverNetworkError(request, volleyError);
                } catch (Throwable e) {
                    C0032VolleyLog.e(e, "Unhandled exception %s", e.toString());
                    this.mDelivery.postError(request, new C0000VolleyError(e));
                }
            } catch (InterruptedException e2) {
                if (this.mQuit) {
                    return;
                }
            }
        }
    }

    private void parseAndDeliverNetworkError(C0021Request<?> request, C0000VolleyError error) {
        this.mDelivery.postError(request, request.parseNetworkError(error));
    }
}
