package com.android.volley;

import android.os.Process;
import android.support.annotation.VisibleForTesting;
import com.android.volley.Cache.Entry;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.BlockingQueue;

public class CacheDispatcher extends Thread {
    private static final boolean DEBUG = VolleyLog.DEBUG;
    private final Cache mCache;
    private final BlockingQueue<Request<?>> mCacheQueue;
    private final ResponseDelivery mDelivery;
    private final BlockingQueue<Request<?>> mNetworkQueue;
    private volatile boolean mQuit = false;
    private final WaitingRequestManager mWaitingRequestManager;

    private static class WaitingRequestManager implements NetworkRequestCompleteListener {
        private final CacheDispatcher mCacheDispatcher;
        private final Map<String, List<Request<?>>> mWaitingRequests = new HashMap();

        WaitingRequestManager(CacheDispatcher cacheDispatcher) {
            this.mCacheDispatcher = cacheDispatcher;
        }

        public void onResponseReceived(Request<?> request, Response<?> response) {
            if (response.cacheEntry == null || response.cacheEntry.isExpired()) {
                onNoUsableResponseReceived(request);
                return;
            }
            List<Request> list;
            String cacheKey = request.getCacheKey();
            synchronized (this) {
                list = (List) this.mWaitingRequests.remove(cacheKey);
            }
            if (list != null) {
                if (VolleyLog.DEBUG) {
                    VolleyLog.v("Releasing %d waiting requests for cacheKey=%s.", Integer.valueOf(list.size()), cacheKey);
                }
                for (Request postResponse : list) {
                    this.mCacheDispatcher.mDelivery.postResponse(postResponse, response);
                }
            }
        }

        public synchronized void onNoUsableResponseReceived(Request<?> request) {
            String cacheKey = request.getCacheKey();
            List list = (List) this.mWaitingRequests.remove(cacheKey);
            if (!(list == null || list.isEmpty())) {
                if (VolleyLog.DEBUG) {
                    VolleyLog.v("%d waiting requests for cacheKey=%s; resend to network", Integer.valueOf(list.size()), cacheKey);
                }
                Request request2 = (Request) list.remove(0);
                this.mWaitingRequests.put(cacheKey, list);
                request2.setNetworkRequestCompleteListener(this);
                try {
                    this.mCacheDispatcher.mNetworkQueue.put(request2);
                } catch (InterruptedException e) {
                    VolleyLog.e("Couldn't add request to queue. %s", e.toString());
                    Thread.currentThread().interrupt();
                    this.mCacheDispatcher.quit();
                }
            }
            return;
        }

        /* JADX WARNING: Missing block: B:11:0x0039, code:
            return true;
     */
        /* JADX WARNING: Missing block: B:17:0x0051, code:
            return false;
     */
        private synchronized boolean maybeAddToWaitingRequests(com.android.volley.Request<?> r6) {
            /*
            r5 = this;
            monitor-enter(r5);
            r0 = r6.getCacheKey();	 Catch:{ all -> 0x0052 }
            r1 = r5.mWaitingRequests;	 Catch:{ all -> 0x0052 }
            r1 = r1.containsKey(r0);	 Catch:{ all -> 0x0052 }
            r2 = 0;
            r3 = 1;
            if (r1 == 0) goto L_0x003a;
        L_0x000f:
            r1 = r5.mWaitingRequests;	 Catch:{ all -> 0x0052 }
            r1 = r1.get(r0);	 Catch:{ all -> 0x0052 }
            r1 = (java.util.List) r1;	 Catch:{ all -> 0x0052 }
            if (r1 != 0) goto L_0x001e;
        L_0x0019:
            r1 = new java.util.ArrayList;	 Catch:{ all -> 0x0052 }
            r1.<init>();	 Catch:{ all -> 0x0052 }
        L_0x001e:
            r4 = "waiting-for-response";
            r6.addMarker(r4);	 Catch:{ all -> 0x0052 }
            r1.add(r6);	 Catch:{ all -> 0x0052 }
            r6 = r5.mWaitingRequests;	 Catch:{ all -> 0x0052 }
            r6.put(r0, r1);	 Catch:{ all -> 0x0052 }
            r6 = com.android.volley.VolleyLog.DEBUG;	 Catch:{ all -> 0x0052 }
            if (r6 == 0) goto L_0x0038;
        L_0x002f:
            r6 = "Request for cacheKey=%s is in flight, putting on hold.";
            r1 = new java.lang.Object[r3];	 Catch:{ all -> 0x0052 }
            r1[r2] = r0;	 Catch:{ all -> 0x0052 }
            com.android.volley.VolleyLog.d(r6, r1);	 Catch:{ all -> 0x0052 }
        L_0x0038:
            monitor-exit(r5);
            return r3;
        L_0x003a:
            r1 = r5.mWaitingRequests;	 Catch:{ all -> 0x0052 }
            r4 = 0;
            r1.put(r0, r4);	 Catch:{ all -> 0x0052 }
            r6.setNetworkRequestCompleteListener(r5);	 Catch:{ all -> 0x0052 }
            r6 = com.android.volley.VolleyLog.DEBUG;	 Catch:{ all -> 0x0052 }
            if (r6 == 0) goto L_0x0050;
        L_0x0047:
            r6 = "new request, sending to network %s";
            r1 = new java.lang.Object[r3];	 Catch:{ all -> 0x0052 }
            r1[r2] = r0;	 Catch:{ all -> 0x0052 }
            com.android.volley.VolleyLog.d(r6, r1);	 Catch:{ all -> 0x0052 }
        L_0x0050:
            monitor-exit(r5);
            return r2;
        L_0x0052:
            r6 = move-exception;
            monitor-exit(r5);
            throw r6;
            */
            throw new UnsupportedOperationException("Method not decompiled: com.android.volley.CacheDispatcher.WaitingRequestManager.maybeAddToWaitingRequests(com.android.volley.Request):boolean");
        }
    }

    public CacheDispatcher(BlockingQueue<Request<?>> blockingQueue, BlockingQueue<Request<?>> blockingQueue2, Cache cache, ResponseDelivery responseDelivery) {
        this.mCacheQueue = blockingQueue;
        this.mNetworkQueue = blockingQueue2;
        this.mCache = cache;
        this.mDelivery = responseDelivery;
        this.mWaitingRequestManager = new WaitingRequestManager(this);
    }

    public void quit() {
        this.mQuit = true;
        interrupt();
    }

    public void run() {
        if (DEBUG) {
            VolleyLog.v("start new dispatcher", new Object[0]);
        }
        Process.setThreadPriority(10);
        this.mCache.initialize();
        while (true) {
            try {
                processRequest();
            } catch (InterruptedException e) {
                if (this.mQuit) {
                    Thread.currentThread().interrupt();
                    return;
                }
                VolleyLog.e("Ignoring spurious interrupt of CacheDispatcher thread; use quit() to terminate it", new Object[0]);
            }
        }
    }

    private void processRequest() throws InterruptedException {
        processRequest((Request) this.mCacheQueue.take());
    }

    @VisibleForTesting
    void processRequest(final Request<?> request) throws InterruptedException {
        request.addMarker("cache-queue-take");
        if (request.isCanceled()) {
            request.finish("cache-discard-canceled");
            return;
        }
        Entry entry = this.mCache.get(request.getCacheKey());
        if (entry == null) {
            request.addMarker("cache-miss");
            if (!this.mWaitingRequestManager.maybeAddToWaitingRequests(request)) {
                this.mNetworkQueue.put(request);
            }
        } else if (entry.isExpired()) {
            request.addMarker("cache-hit-expired");
            request.setCacheEntry(entry);
            if (!this.mWaitingRequestManager.maybeAddToWaitingRequests(request)) {
                this.mNetworkQueue.put(request);
            }
        } else {
            request.addMarker("cache-hit");
            Response parseNetworkResponse = request.parseNetworkResponse(new NetworkResponse(entry.data, entry.responseHeaders));
            request.addMarker("cache-hit-parsed");
            if (entry.refreshNeeded()) {
                request.addMarker("cache-hit-refresh-needed");
                request.setCacheEntry(entry);
                parseNetworkResponse.intermediate = true;
                if (this.mWaitingRequestManager.maybeAddToWaitingRequests(request)) {
                    this.mDelivery.postResponse(request, parseNetworkResponse);
                } else {
                    this.mDelivery.postResponse(request, parseNetworkResponse, new Runnable() {
                        public void run() {
                            try {
                                CacheDispatcher.this.mNetworkQueue.put(request);
                            } catch (InterruptedException e) {
                                Thread.currentThread().interrupt();
                            }
                        }
                    });
                }
            } else {
                this.mDelivery.postResponse(request, parseNetworkResponse);
            }
        }
    }
}
