package com.bumptech.glide.load.engine;

import android.os.Handler;
import android.os.Handler.Callback;
import android.os.Looper;
import android.os.Message;
import android.support.annotation.NonNull;
import android.support.annotation.VisibleForTesting;
import android.support.v4.util.Pools.Pool;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.request.g;
import com.bumptech.glide.util.a.a.c;
import com.bumptech.glide.util.k;
import java.util.ArrayList;
import java.util.List;

class EngineJob<R> implements a<R>, c {
    private static final EngineResourceFactory fI = new EngineResourceFactory();
    private static final Handler fJ = new Handler(Looper.getMainLooper(), new a());
    private static final int fK = 1;
    private static final int fL = 2;
    private static final int fM = 3;
    private final com.bumptech.glide.load.engine.b.a F;
    private final com.bumptech.glide.load.engine.b.a H;
    private final com.bumptech.glide.load.engine.b.a Q;
    private boolean dT;
    private p<?> dU;
    private DataSource dataSource;
    private volatile boolean dp;
    private boolean eC;
    private final com.bumptech.glide.util.a.c et;
    private final Pool<EngineJob<?>> eu;
    private final com.bumptech.glide.load.engine.b.a fB;
    private final h fC;
    private final List<g> fN;
    private final EngineResourceFactory fO;
    private boolean fP;
    private boolean fQ;
    private boolean fR;
    private GlideException fS;
    private boolean fT;
    private List<g> fU;
    private k<?> fV;
    private DecodeJob<R> fW;
    private com.bumptech.glide.load.c key;

    @VisibleForTesting
    static class EngineResourceFactory {
        EngineResourceFactory() {
        }

        public <R> k<R> a(p<R> pVar, boolean z) {
            return new k(pVar, z, true);
        }
    }

    private static class a implements Callback {
        a() {
        }

        public boolean handleMessage(Message message) {
            EngineJob engineJob = (EngineJob) message.obj;
            switch (message.what) {
                case 1:
                    engineJob.aU();
                    break;
                case 2:
                    engineJob.aW();
                    break;
                case 3:
                    engineJob.aV();
                    break;
                default:
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("Unrecognized message: ");
                    stringBuilder.append(message.what);
                    throw new IllegalStateException(stringBuilder.toString());
            }
            return true;
        }
    }

    EngineJob(com.bumptech.glide.load.engine.b.a aVar, com.bumptech.glide.load.engine.b.a aVar2, com.bumptech.glide.load.engine.b.a aVar3, com.bumptech.glide.load.engine.b.a aVar4, h hVar, Pool<EngineJob<?>> pool) {
        this(aVar, aVar2, aVar3, aVar4, hVar, pool, fI);
    }

    @VisibleForTesting
    EngineJob(com.bumptech.glide.load.engine.b.a aVar, com.bumptech.glide.load.engine.b.a aVar2, com.bumptech.glide.load.engine.b.a aVar3, com.bumptech.glide.load.engine.b.a aVar4, h hVar, Pool<EngineJob<?>> pool, EngineResourceFactory engineResourceFactory) {
        this.fN = new ArrayList(2);
        this.et = com.bumptech.glide.util.a.c.eM();
        this.H = aVar;
        this.F = aVar2;
        this.fB = aVar3;
        this.Q = aVar4;
        this.fC = hVar;
        this.eu = pool;
        this.fO = engineResourceFactory;
    }

    @VisibleForTesting
    EngineJob<R> init(com.bumptech.glide.load.c cVar, boolean z, boolean z2, boolean z3, boolean z4) {
        this.key = cVar;
        this.dT = z;
        this.fP = z2;
        this.fQ = z3;
        this.eC = z4;
        return this;
    }

    public void c(DecodeJob<R> decodeJob) {
        com.bumptech.glide.load.engine.b.a aVar;
        this.fW = decodeJob;
        if (decodeJob.aB()) {
            aVar = this.H;
        } else {
            aVar = aT();
        }
        aVar.execute(decodeJob);
    }

    void a(g gVar) {
        k.eF();
        this.et.eN();
        if (this.fR) {
            gVar.c(this.fV, this.dataSource);
        } else if (this.fT) {
            gVar.a(this.fS);
        } else {
            this.fN.add(gVar);
        }
    }

    void b(g gVar) {
        k.eF();
        this.et.eN();
        if (this.fR || this.fT) {
            c(gVar);
            return;
        }
        this.fN.remove(gVar);
        if (this.fN.isEmpty()) {
            cancel();
        }
    }

    boolean aS() {
        return this.eC;
    }

    private com.bumptech.glide.load.engine.b.a aT() {
        if (this.fP) {
            return this.fB;
        }
        return this.fQ ? this.Q : this.F;
    }

    private void c(g gVar) {
        if (this.fU == null) {
            this.fU = new ArrayList(2);
        }
        if (!this.fU.contains(gVar)) {
            this.fU.add(gVar);
        }
    }

    private boolean d(g gVar) {
        return this.fU != null && this.fU.contains(gVar);
    }

    void cancel() {
        if (!this.fT && !this.fR && !this.dp) {
            this.dp = true;
            this.fW.cancel();
            this.fC.a(this, this.key);
        }
    }

    boolean isCancelled() {
        return this.dp;
    }

    void aU() {
        this.et.eN();
        if (this.dp) {
            this.dU.recycle();
            release(false);
        } else if (this.fN.isEmpty()) {
            throw new IllegalStateException("Received a resource without any callbacks to notify");
        } else if (this.fR) {
            throw new IllegalStateException("Already have resource");
        } else {
            this.fV = this.fO.a(this.dU, this.dT);
            this.fR = true;
            this.fV.acquire();
            this.fC.a(this, this.key, this.fV);
            int size = this.fN.size();
            for (int i = 0; i < size; i++) {
                g gVar = (g) this.fN.get(i);
                if (!d(gVar)) {
                    this.fV.acquire();
                    gVar.c(this.fV, this.dataSource);
                }
            }
            this.fV.release();
            release(false);
        }
    }

    void aV() {
        this.et.eN();
        if (this.dp) {
            this.fC.a(this, this.key);
            release(false);
            return;
        }
        throw new IllegalStateException("Not cancelled");
    }

    private void release(boolean z) {
        k.eF();
        this.fN.clear();
        this.key = null;
        this.fV = null;
        this.dU = null;
        if (this.fU != null) {
            this.fU.clear();
        }
        this.fT = false;
        this.dp = false;
        this.fR = false;
        this.fW.release(z);
        this.fW = null;
        this.fS = null;
        this.dataSource = null;
        this.eu.release(this);
    }

    public void c(p<R> pVar, DataSource dataSource) {
        this.dU = pVar;
        this.dataSource = dataSource;
        fJ.obtainMessage(1, this).sendToTarget();
    }

    public void a(GlideException glideException) {
        this.fS = glideException;
        fJ.obtainMessage(2, this).sendToTarget();
    }

    public void b(DecodeJob<?> decodeJob) {
        aT().execute(decodeJob);
    }

    void aW() {
        this.et.eN();
        if (this.dp) {
            release(false);
        } else if (this.fN.isEmpty()) {
            throw new IllegalStateException("Received an exception without any callbacks to notify");
        } else if (this.fT) {
            throw new IllegalStateException("Already failed once");
        } else {
            this.fT = true;
            this.fC.a(this, this.key, null);
            for (g gVar : this.fN) {
                if (!d(gVar)) {
                    gVar.a(this.fS);
                }
            }
            release(false);
        }
    }

    @NonNull
    public com.bumptech.glide.util.a.c aK() {
        return this.et;
    }
}
