package com.android.volley;

import android.os.Handler;
import android.os.Looper;
import com.android.volley.RequestQueue.C0022RequestFilter;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.Map;
import java.util.Queue;
import java.util.Set;
import java.util.concurrent.PriorityBlockingQueue;
import java.util.concurrent.atomic.AtomicInteger;

/* renamed from: com.android.volley.RequestQueue */
public class C0024RequestQueue {
    private static final int DEFAULT_NETWORK_THREAD_POOL_SIZE = 4;
    private final C0003Cache mCache;
    private C0005CacheDispatcher mCacheDispatcher;
    private final PriorityBlockingQueue<C0021Request<?>> mCacheQueue;
    private final Set<C0021Request<?>> mCurrentRequests;
    private final C0010ResponseDelivery mDelivery;
    private C0013NetworkDispatcher[] mDispatchers;
    private final C0012Network mNetwork;
    private final PriorityBlockingQueue<C0021Request<?>> mNetworkQueue;
    private AtomicInteger mSequenceGenerator;
    private final Map<String, Queue<C0021Request<?>>> mWaitingRequests;

    public C0024RequestQueue(C0003Cache cache, C0012Network network, int threadPoolSize, C0010ResponseDelivery delivery) {
        this.mSequenceGenerator = new AtomicInteger();
        this.mWaitingRequests = new HashMap();
        this.mCurrentRequests = new HashSet();
        this.mCacheQueue = new PriorityBlockingQueue();
        this.mNetworkQueue = new PriorityBlockingQueue();
        this.mCache = cache;
        this.mNetwork = network;
        this.mDispatchers = new C0013NetworkDispatcher[threadPoolSize];
        this.mDelivery = delivery;
    }

    public C0024RequestQueue(C0003Cache cache, C0012Network network, int threadPoolSize) {
        this(cache, network, threadPoolSize, new C0011ExecutorDelivery(new Handler(Looper.getMainLooper())));
    }

    public C0024RequestQueue(C0003Cache cache, C0012Network network) {
        this(cache, network, 4);
    }

    public void start() {
        stop();
        this.mCacheDispatcher = new C0005CacheDispatcher(this.mCacheQueue, this.mNetworkQueue, this.mCache, this.mDelivery);
        this.mCacheDispatcher.start();
        for (int i = 0; i < this.mDispatchers.length; i++) {
            C0013NetworkDispatcher networkDispatcher = new C0013NetworkDispatcher(this.mNetworkQueue, this.mNetwork, this.mCache, this.mDelivery);
            this.mDispatchers[i] = networkDispatcher;
            networkDispatcher.start();
        }
    }

    public void stop() {
        if (this.mCacheDispatcher != null) {
            this.mCacheDispatcher.quit();
        }
        for (int i = 0; i < this.mDispatchers.length; i++) {
            if (this.mDispatchers[i] != null) {
                this.mDispatchers[i].quit();
            }
        }
    }

    public int getSequenceNumber() {
        return this.mSequenceGenerator.incrementAndGet();
    }

    public C0003Cache getCache() {
        return this.mCache;
    }

    public void cancelAll(C0022RequestFilter filter) {
        synchronized (this.mCurrentRequests) {
            for (C0021Request<?> request : this.mCurrentRequests) {
                if (filter.apply(request)) {
                    request.cancel();
                }
            }
        }
    }

    public void cancelAll(Object tag) {
        if (tag != null) {
            cancelAll(/* anonymous class already generated */);
            return;
        }
        throw new IllegalArgumentException("Cannot cancelAll with a null tag");
    }

    public <T> C0021Request<T> add(C0021Request<T> request) {
        request.setRequestQueue(this);
        synchronized (this.mCurrentRequests) {
            this.mCurrentRequests.add(request);
        }
        request.setSequence(getSequenceNumber());
        request.addMarker("add-to-queue");
        if (request.shouldCache()) {
            synchronized (this.mWaitingRequests) {
                String cacheKey = request.getCacheKey();
                if (this.mWaitingRequests.containsKey(cacheKey)) {
                    Queue<C0021Request<?>> stagedRequests = (Queue) this.mWaitingRequests.get(cacheKey);
                    if (stagedRequests == null) {
                        stagedRequests = new LinkedList();
                    }
                    stagedRequests.add(request);
                    this.mWaitingRequests.put(cacheKey, stagedRequests);
                    if (C0032VolleyLog.DEBUG) {
                        C0032VolleyLog.v("Request for cacheKey=%s is in flight, putting on hold.", cacheKey);
                    }
                } else {
                    this.mWaitingRequests.put(cacheKey, null);
                    this.mCacheQueue.add(request);
                }
            }
            return request;
        }
        this.mNetworkQueue.add(request);
        return request;
    }

    void finish(C0021Request<?> request) {
        synchronized (this.mCurrentRequests) {
            this.mCurrentRequests.remove(request);
        }
        if (request.shouldCache()) {
            synchronized (this.mWaitingRequests) {
                Queue<C0021Request<?>> waitingRequests = (Queue) this.mWaitingRequests.remove(request.getCacheKey());
                if (waitingRequests != null) {
                    if (C0032VolleyLog.DEBUG) {
                        C0032VolleyLog.v("Releasing %d waiting requests for cacheKey=%s.", Integer.valueOf(waitingRequests.size()), cacheKey);
                    }
                    this.mCacheQueue.addAll(waitingRequests);
                }
            }
        }
    }
}
