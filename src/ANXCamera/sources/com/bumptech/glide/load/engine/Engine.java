package com.bumptech.glide.load.engine;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.VisibleForTesting;
import android.support.v4.util.Pools.Pool;
import android.util.Log;
import com.bumptech.glide.Priority;
import com.bumptech.glide.e;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.c;
import com.bumptech.glide.load.engine.a.j;
import com.bumptech.glide.load.f;
import com.bumptech.glide.load.i;
import com.bumptech.glide.request.g;
import com.bumptech.glide.util.k;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.TimeUnit;

public class Engine implements com.bumptech.glide.load.engine.a.j.a, h, a {
    private static final String TAG = "Engine";
    private static final int fp = 150;
    private static final boolean fq = Log.isLoggable(TAG, 2);
    private final m fr;
    private final j fs;
    private final j ft;
    private final EngineJobFactory fu;
    private final s fv;
    private final a fw;
    private final DecodeJobFactory fx;
    private final ActiveResources fy;

    @VisibleForTesting
    static class DecodeJobFactory {
        final d ek;
        final Pool<DecodeJob<?>> ev = com.bumptech.glide.util.a.a.a(150, new com.bumptech.glide.util.a.a.a<DecodeJob<?>>() {
            /* renamed from: aQ */
            public DecodeJob<?> create() {
                return new DecodeJob(DecodeJobFactory.this.ek, DecodeJobFactory.this.ev);
            }
        });
        private int fz;

        DecodeJobFactory(d dVar) {
            this.ek = dVar;
        }

        <R> DecodeJob<R> a(e eVar, Object obj, i iVar, c cVar, int i, int i2, Class<?> cls, Class<R> cls2, Priority priority, g gVar, Map<Class<?>, i<?>> map, boolean z, boolean z2, boolean z3, f fVar, a<R> aVar) {
            DecodeJob decodeJob = (DecodeJob) com.bumptech.glide.util.i.checkNotNull((DecodeJob) this.ev.acquire());
            int i3 = this.fz;
            this.fz = i3 + 1;
            return decodeJob.a(eVar, obj, iVar, cVar, i, i2, cls, cls2, priority, gVar, map, z, z2, z3, fVar, aVar, i3);
        }
    }

    @VisibleForTesting
    static class EngineJobFactory {
        final com.bumptech.glide.load.engine.b.a H;
        final com.bumptech.glide.load.engine.b.a I;
        final com.bumptech.glide.load.engine.b.a S;
        final Pool<EngineJob<?>> ev = com.bumptech.glide.util.a.a.a(150, new com.bumptech.glide.util.a.a.a<EngineJob<?>>() {
            /* renamed from: aR */
            public EngineJob<?> create() {
                return new EngineJob(EngineJobFactory.this.I, EngineJobFactory.this.H, EngineJobFactory.this.fB, EngineJobFactory.this.S, EngineJobFactory.this.fC, EngineJobFactory.this.ev);
            }
        });
        final com.bumptech.glide.load.engine.b.a fB;
        final h fC;

        EngineJobFactory(com.bumptech.glide.load.engine.b.a aVar, com.bumptech.glide.load.engine.b.a aVar2, com.bumptech.glide.load.engine.b.a aVar3, com.bumptech.glide.load.engine.b.a aVar4, h hVar) {
            this.I = aVar;
            this.H = aVar2;
            this.fB = aVar3;
            this.S = aVar4;
            this.fC = hVar;
        }

        @VisibleForTesting
        void shutdown() {
            a(this.I);
            a(this.H);
            a(this.fB);
            a(this.S);
        }

        <R> EngineJob<R> a(c cVar, boolean z, boolean z2, boolean z3, boolean z4) {
            return ((EngineJob) com.bumptech.glide.util.i.checkNotNull((EngineJob) this.ev.acquire())).init(cVar, z, z2, z3, z4);
        }

        private static void a(ExecutorService executorService) {
            executorService.shutdown();
            try {
                if (!executorService.awaitTermination(5, TimeUnit.SECONDS)) {
                    executorService.shutdownNow();
                    if (!executorService.awaitTermination(5, TimeUnit.SECONDS)) {
                        throw new RuntimeException("Failed to shutdown");
                    }
                }
            } catch (Throwable e) {
                throw new RuntimeException(e);
            }
        }
    }

    private static class a implements d {
        private final com.bumptech.glide.load.engine.a.a.a fE;
        private volatile com.bumptech.glide.load.engine.a.a fF;

        a(com.bumptech.glide.load.engine.a.a.a aVar) {
            this.fE = aVar;
        }

        @VisibleForTesting
        synchronized void clearDiskCacheIfCreated() {
            if (this.fF != null) {
                this.fF.clear();
            }
        }

        public com.bumptech.glide.load.engine.a.a aq() {
            if (this.fF == null) {
                synchronized (this) {
                    if (this.fF == null) {
                        this.fF = this.fE.bt();
                    }
                    if (this.fF == null) {
                        this.fF = new com.bumptech.glide.load.engine.a.b();
                    }
                }
            }
            return this.fF;
        }
    }

    public static class b {
        private final EngineJob<?> fG;
        private final g fH;

        b(g gVar, EngineJob<?> engineJob) {
            this.fH = gVar;
            this.fG = engineJob;
        }

        public void cancel() {
            this.fG.b(this.fH);
        }
    }

    public Engine(j jVar, com.bumptech.glide.load.engine.a.a.a aVar, com.bumptech.glide.load.engine.b.a aVar2, com.bumptech.glide.load.engine.b.a aVar3, com.bumptech.glide.load.engine.b.a aVar4, com.bumptech.glide.load.engine.b.a aVar5, boolean z) {
        this(jVar, aVar, aVar2, aVar3, aVar4, aVar5, null, null, null, null, null, null, z);
    }

    @VisibleForTesting
    Engine(j jVar, com.bumptech.glide.load.engine.a.a.a aVar, com.bumptech.glide.load.engine.b.a aVar2, com.bumptech.glide.load.engine.b.a aVar3, com.bumptech.glide.load.engine.b.a aVar4, com.bumptech.glide.load.engine.b.a aVar5, m mVar, j jVar2, ActiveResources activeResources, EngineJobFactory engineJobFactory, DecodeJobFactory decodeJobFactory, s sVar, boolean z) {
        ActiveResources activeResources2;
        j jVar3;
        m mVar2;
        EngineJobFactory engineJobFactory2;
        DecodeJobFactory decodeJobFactory2;
        s sVar2;
        j jVar4 = jVar;
        this.ft = jVar4;
        this.fw = new a(aVar);
        if (activeResources == null) {
            activeResources2 = new ActiveResources(z);
        } else {
            activeResources2 = activeResources;
        }
        this.fy = activeResources2;
        activeResources2.a(this);
        if (jVar2 == null) {
            jVar3 = new j();
        } else {
            jVar3 = jVar2;
        }
        this.fs = jVar3;
        if (mVar == null) {
            mVar2 = new m();
        } else {
            mVar2 = mVar;
        }
        this.fr = mVar2;
        if (engineJobFactory == null) {
            engineJobFactory2 = new EngineJobFactory(aVar2, aVar3, aVar4, aVar5, this);
        } else {
            engineJobFactory2 = engineJobFactory;
        }
        this.fu = engineJobFactory2;
        if (decodeJobFactory == null) {
            decodeJobFactory2 = new DecodeJobFactory(this.fw);
        } else {
            decodeJobFactory2 = decodeJobFactory;
        }
        this.fx = decodeJobFactory2;
        if (sVar == null) {
            sVar2 = new s();
        } else {
            sVar2 = sVar;
        }
        this.fv = sVar2;
        jVar4.a(this);
    }

    public <R> b a(e eVar, Object obj, c cVar, int i, int i2, Class<?> cls, Class<R> cls2, Priority priority, g gVar, Map<Class<?>, i<?>> map, boolean z, boolean z2, f fVar, boolean z3, boolean z4, boolean z5, boolean z6, g gVar2) {
        boolean z7 = z3;
        g gVar3 = gVar2;
        k.eF();
        long eE = fq ? com.bumptech.glide.util.e.eE() : 0;
        c a = this.fs.a(obj, cVar, i, i2, map, cls, cls2, fVar);
        p a2 = a(a, z7);
        if (a2 != null) {
            gVar3.c(a2, DataSource.MEMORY_CACHE);
            if (fq) {
                a("Loaded resource from active resources", eE, a);
            }
            return null;
        }
        a2 = b(a, z7);
        if (a2 != null) {
            gVar3.c(a2, DataSource.MEMORY_CACHE);
            if (fq) {
                a("Loaded resource from cache", eE, a);
            }
            return null;
        }
        boolean z8 = z6;
        EngineJob c = this.fr.c(a, z8);
        if (c != null) {
            c.a(gVar3);
            if (fq) {
                a("Added to existing load", eE, a);
            }
            return new b(gVar3, c);
        }
        c = this.fu.a(a, z7, z4, z5, z8);
        DecodeJob a3 = this.fx.a(eVar, obj, a, cVar, i, i2, cls, cls2, priority, gVar, map, z, z2, z6, fVar, c);
        this.fr.a(a, c);
        c.a(gVar3);
        c.c(a3);
        if (fq) {
            a("Started new load", eE, a);
        }
        return new b(gVar3, c);
    }

    private static void a(String str, long j, c cVar) {
        String str2 = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(str);
        stringBuilder.append(" in ");
        stringBuilder.append(com.bumptech.glide.util.e.e(j));
        stringBuilder.append("ms, key: ");
        stringBuilder.append(cVar);
        Log.v(str2, stringBuilder.toString());
    }

    @Nullable
    private k<?> a(c cVar, boolean z) {
        if (!z) {
            return null;
        }
        k<?> b = this.fy.b(cVar);
        if (b != null) {
            b.acquire();
        }
        return b;
    }

    private k<?> b(c cVar, boolean z) {
        if (!z) {
            return null;
        }
        k<?> d = d(cVar);
        if (d != null) {
            d.acquire();
            this.fy.a(cVar, d);
        }
        return d;
    }

    private k<?> d(c cVar) {
        p g = this.ft.g(cVar);
        if (g == null) {
            return null;
        }
        if (g instanceof k) {
            return (k) g;
        }
        return new k(g, true, true);
    }

    public void d(p<?> pVar) {
        k.eF();
        if (pVar instanceof k) {
            ((k) pVar).release();
            return;
        }
        throw new IllegalArgumentException("Cannot release anything but an EngineResource");
    }

    public void a(EngineJob<?> engineJob, c cVar, k<?> kVar) {
        k.eF();
        if (kVar != null) {
            kVar.a(cVar, this);
            if (kVar.aY()) {
                this.fy.a(cVar, kVar);
            }
        }
        this.fr.b(cVar, engineJob);
    }

    public void a(EngineJob<?> engineJob, c cVar) {
        k.eF();
        this.fr.b(cVar, engineJob);
    }

    public void e(@NonNull p<?> pVar) {
        k.eF();
        this.fv.h(pVar);
    }

    public void b(c cVar, k<?> kVar) {
        k.eF();
        this.fy.a(cVar);
        if (kVar.aY()) {
            this.ft.b(cVar, kVar);
        } else {
            this.fv.h(kVar);
        }
    }

    public void j() {
        this.fw.aq().clear();
    }

    @VisibleForTesting
    public void shutdown() {
        this.fu.shutdown();
        this.fw.clearDiskCacheIfCreated();
        this.fy.shutdown();
    }
}
