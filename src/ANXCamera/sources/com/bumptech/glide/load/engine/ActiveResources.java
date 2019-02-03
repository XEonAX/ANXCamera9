package com.bumptech.glide.load.engine;

import android.os.Handler;
import android.os.Handler.Callback;
import android.os.Looper;
import android.os.Message;
import android.os.Process;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.VisibleForTesting;
import com.bumptech.glide.load.c;
import com.bumptech.glide.util.i;
import com.bumptech.glide.util.k;
import java.lang.ref.ReferenceQueue;
import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

final class ActiveResources {
    private static final int dN = 1;
    private final boolean T;
    private final Handler U = new Handler(Looper.getMainLooper(), new Callback() {
        public boolean handleMessage(Message message) {
            if (message.what != 1) {
                return false;
            }
            ActiveResources.this.a((ResourceWeakReference) message.obj);
            return true;
        }
    });
    @VisibleForTesting
    final Map<c, ResourceWeakReference> activeEngineResources = new HashMap();
    private a dO;
    @Nullable
    private ReferenceQueue<k<?>> dP;
    @Nullable
    private Thread dQ;
    private volatile boolean dR;
    @Nullable
    private volatile DequeuedResourceCallback dS;

    @VisibleForTesting
    interface DequeuedResourceCallback {
        void al();
    }

    @VisibleForTesting
    static final class ResourceWeakReference extends WeakReference<k<?>> {
        final boolean dU;
        @Nullable
        p<?> dV;
        final c key;

        ResourceWeakReference(@NonNull c cVar, @NonNull k<?> kVar, @NonNull ReferenceQueue<? super k<?>> referenceQueue, boolean z) {
            super(kVar, referenceQueue);
            this.key = (c) i.checkNotNull(cVar);
            p pVar = (kVar.aY() && z) ? (p) i.checkNotNull(kVar.aX()) : null;
            this.dV = pVar;
            this.dU = kVar.aY();
        }

        void reset() {
            this.dV = null;
            clear();
        }
    }

    ActiveResources(boolean z) {
        this.T = z;
    }

    void a(a aVar) {
        this.dO = aVar;
    }

    void a(c cVar, k<?> kVar) {
        ResourceWeakReference resourceWeakReference = (ResourceWeakReference) this.activeEngineResources.put(cVar, new ResourceWeakReference(cVar, kVar, aj(), this.T));
        if (resourceWeakReference != null) {
            resourceWeakReference.reset();
        }
    }

    void a(c cVar) {
        ResourceWeakReference resourceWeakReference = (ResourceWeakReference) this.activeEngineResources.remove(cVar);
        if (resourceWeakReference != null) {
            resourceWeakReference.reset();
        }
    }

    @Nullable
    k<?> b(c cVar) {
        ResourceWeakReference resourceWeakReference = (ResourceWeakReference) this.activeEngineResources.get(cVar);
        if (resourceWeakReference == null) {
            return null;
        }
        k<?> kVar = (k) resourceWeakReference.get();
        if (kVar == null) {
            a(resourceWeakReference);
        }
        return kVar;
    }

    void a(@NonNull ResourceWeakReference resourceWeakReference) {
        k.eF();
        this.activeEngineResources.remove(resourceWeakReference.key);
        if (resourceWeakReference.dU && resourceWeakReference.dV != null) {
            k kVar = new k(resourceWeakReference.dV, true, false);
            kVar.a(resourceWeakReference.key, this.dO);
            this.dO.b(resourceWeakReference.key, kVar);
        }
    }

    private ReferenceQueue<k<?>> aj() {
        if (this.dP == null) {
            this.dP = new ReferenceQueue();
            this.dQ = new Thread(new Runnable() {
                public void run() {
                    Process.setThreadPriority(10);
                    ActiveResources.this.ak();
                }
            }, "glide-active-resources");
            this.dQ.start();
        }
        return this.dP;
    }

    void ak() {
        while (!this.dR) {
            try {
                this.U.obtainMessage(1, (ResourceWeakReference) this.dP.remove()).sendToTarget();
                DequeuedResourceCallback dequeuedResourceCallback = this.dS;
                if (dequeuedResourceCallback != null) {
                    dequeuedResourceCallback.al();
                }
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        }
    }

    @VisibleForTesting
    void setDequeuedResourceCallback(DequeuedResourceCallback dequeuedResourceCallback) {
        this.dS = dequeuedResourceCallback;
    }

    @VisibleForTesting
    void shutdown() {
        this.dR = true;
        if (this.dQ != null) {
            this.dQ.interrupt();
            try {
                this.dQ.join(TimeUnit.SECONDS.toMillis(5));
                if (this.dQ.isAlive()) {
                    throw new RuntimeException("Failed to join in time");
                }
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        }
    }
}
