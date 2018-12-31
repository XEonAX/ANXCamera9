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
    private static final int dM = 1;
    private final boolean S;
    private final Handler T = new Handler(Looper.getMainLooper(), new Callback() {
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
    private a dN;
    @Nullable
    private ReferenceQueue<k<?>> dO;
    @Nullable
    private Thread dP;
    private volatile boolean dQ;
    @Nullable
    private volatile DequeuedResourceCallback dR;

    @VisibleForTesting
    interface DequeuedResourceCallback {
        void al();
    }

    @VisibleForTesting
    static final class ResourceWeakReference extends WeakReference<k<?>> {
        final boolean dT;
        @Nullable
        p<?> dU;
        final c key;

        ResourceWeakReference(@NonNull c cVar, @NonNull k<?> kVar, @NonNull ReferenceQueue<? super k<?>> referenceQueue, boolean z) {
            super(kVar, referenceQueue);
            this.key = (c) i.checkNotNull(cVar);
            p pVar = (kVar.aY() && z) ? (p) i.checkNotNull(kVar.aX()) : null;
            this.dU = pVar;
            this.dT = kVar.aY();
        }

        void reset() {
            this.dU = null;
            clear();
        }
    }

    ActiveResources(boolean z) {
        this.S = z;
    }

    void a(a aVar) {
        this.dN = aVar;
    }

    void a(c cVar, k<?> kVar) {
        ResourceWeakReference resourceWeakReference = (ResourceWeakReference) this.activeEngineResources.put(cVar, new ResourceWeakReference(cVar, kVar, aj(), this.S));
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
        if (resourceWeakReference.dT && resourceWeakReference.dU != null) {
            k kVar = new k(resourceWeakReference.dU, true, false);
            kVar.a(resourceWeakReference.key, this.dN);
            this.dN.b(resourceWeakReference.key, kVar);
        }
    }

    private ReferenceQueue<k<?>> aj() {
        if (this.dO == null) {
            this.dO = new ReferenceQueue();
            this.dP = new Thread(new Runnable() {
                public void run() {
                    Process.setThreadPriority(10);
                    ActiveResources.this.ak();
                }
            }, "glide-active-resources");
            this.dP.start();
        }
        return this.dO;
    }

    void ak() {
        while (!this.dQ) {
            try {
                this.T.obtainMessage(1, (ResourceWeakReference) this.dO.remove()).sendToTarget();
                DequeuedResourceCallback dequeuedResourceCallback = this.dR;
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
        this.dR = dequeuedResourceCallback;
    }

    @VisibleForTesting
    void shutdown() {
        this.dQ = true;
        if (this.dP != null) {
            this.dP.interrupt();
            try {
                this.dP.join(TimeUnit.SECONDS.toMillis(5));
                if (this.dP.isAlive()) {
                    throw new RuntimeException("Failed to join in time");
                }
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        }
    }
}
