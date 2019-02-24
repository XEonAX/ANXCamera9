package com.bumptech.glide.load.engine;

import android.os.Build.VERSION;
import android.support.annotation.NonNull;
import android.support.v4.util.Pools.Pool;
import android.util.Log;
import com.bumptech.glide.Priority;
import com.bumptech.glide.Registry.NoResultEncoderAvailableException;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.EncodeStrategy;
import com.bumptech.glide.load.f;
import com.bumptech.glide.load.h;
import com.bumptech.glide.load.i;
import com.bumptech.glide.load.resource.bitmap.n;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

class DecodeJob<R> implements com.bumptech.glide.load.engine.d.a, com.bumptech.glide.util.a.a.c, Comparable<DecodeJob<?>>, Runnable {
    private static final String TAG = "DecodeJob";
    private Object aL;
    private volatile boolean dq;
    private Stage eA;
    private RunReason eB;
    private long eC;
    private boolean eD;
    private Thread eE;
    private com.bumptech.glide.load.c eF;
    private com.bumptech.glide.load.c eG;
    private Object eH;
    private DataSource eI;
    private com.bumptech.glide.load.a.d<?> eJ;
    private volatile d eK;
    private volatile boolean eL;
    private com.bumptech.glide.load.c ef;
    private f eh;
    private final d ek;
    private Priority eo;
    private g ep;
    private final e<R> es = new e();
    private final List<Throwable> et = new ArrayList();
    private final com.bumptech.glide.util.a.c eu = com.bumptech.glide.util.a.c.eM();
    private final Pool<DecodeJob<?>> ev;
    private final c<?> ew = new c();
    private final e ex = new e();
    private i ey;
    private a<R> ez;
    private int height;
    private int order;
    private com.bumptech.glide.e q;
    private int width;

    private enum RunReason {
        INITIALIZE,
        SWITCH_TO_SOURCE_SERVICE,
        DECODE_DATA
    }

    private enum Stage {
        INITIALIZE,
        RESOURCE_CACHE,
        DATA_CACHE,
        SOURCE,
        ENCODE,
        FINISHED
    }

    interface a<R> {
        void a(GlideException glideException);

        void b(DecodeJob<?> decodeJob);

        void c(p<R> pVar, DataSource dataSource);
    }

    private final class b<Z> implements a<Z> {
        private final DataSource dataSource;

        b(DataSource dataSource) {
            this.dataSource = dataSource;
        }

        @NonNull
        public p<Z> c(@NonNull p<Z> pVar) {
            return DecodeJob.this.a(this.dataSource, (p) pVar);
        }
    }

    private static class c<Z> {
        private h<Z> eQ;
        private o<Z> eR;
        private com.bumptech.glide.load.c key;

        c() {
        }

        <X> void a(com.bumptech.glide.load.c cVar, h<X> hVar, o<X> oVar) {
            this.key = cVar;
            this.eQ = hVar;
            this.eR = oVar;
        }

        void a(d dVar, f fVar) {
            com.bumptech.glide.util.a.b.beginSection("DecodeJob.encode");
            try {
                dVar.aq().a(this.key, new c(this.eQ, this.eR, fVar));
            } finally {
                this.eR.unlock();
                com.bumptech.glide.util.a.b.endSection();
            }
        }

        boolean aL() {
            return this.eR != null;
        }

        void clear() {
            this.key = null;
            this.eQ = null;
            this.eR = null;
        }
    }

    interface d {
        com.bumptech.glide.load.engine.a.a aq();
    }

    private static class e {
        private boolean eS;
        private boolean eT;
        private boolean eU;

        e() {
        }

        synchronized boolean c(boolean z) {
            this.eS = true;
            return d(z);
        }

        synchronized boolean aM() {
            this.eT = true;
            return d(false);
        }

        synchronized boolean aN() {
            this.eU = true;
            return d(false);
        }

        synchronized void reset() {
            this.eT = false;
            this.eS = false;
            this.eU = false;
        }

        private boolean d(boolean z) {
            return (this.eU || z || this.eT) && this.eS;
        }
    }

    DecodeJob(d dVar, Pool<DecodeJob<?>> pool) {
        this.ek = dVar;
        this.ev = pool;
    }

    DecodeJob<R> a(com.bumptech.glide.e eVar, Object obj, i iVar, com.bumptech.glide.load.c cVar, int i, int i2, Class<?> cls, Class<R> cls2, Priority priority, g gVar, Map<Class<?>, i<?>> map, boolean z, boolean z2, boolean z3, f fVar, a<R> aVar, int i3) {
        this.es.a(eVar, obj, cVar, i, i2, gVar, cls, cls2, priority, fVar, map, z, z2, this.ek);
        this.q = eVar;
        this.ef = cVar;
        this.eo = priority;
        this.ey = iVar;
        this.width = i;
        this.height = i2;
        this.ep = gVar;
        this.eD = z3;
        this.eh = fVar;
        this.ez = aVar;
        this.order = i3;
        this.eB = RunReason.INITIALIZE;
        this.aL = obj;
        return this;
    }

    boolean aB() {
        Stage a = a(Stage.INITIALIZE);
        return a == Stage.RESOURCE_CACHE || a == Stage.DATA_CACHE;
    }

    void release(boolean z) {
        if (this.ex.c(z)) {
            aE();
        }
    }

    private void aC() {
        if (this.ex.aM()) {
            aE();
        }
    }

    private void aD() {
        if (this.ex.aN()) {
            aE();
        }
    }

    private void aE() {
        this.ex.reset();
        this.ew.clear();
        this.es.clear();
        this.eL = false;
        this.q = null;
        this.ef = null;
        this.eh = null;
        this.eo = null;
        this.ey = null;
        this.ez = null;
        this.eA = null;
        this.eK = null;
        this.eE = null;
        this.eF = null;
        this.eH = null;
        this.eI = null;
        this.eJ = null;
        this.eC = 0;
        this.dq = false;
        this.aL = null;
        this.et.clear();
        this.ev.release(this);
    }

    /* renamed from: a */
    public int compareTo(@NonNull DecodeJob<?> decodeJob) {
        int priority = getPriority() - decodeJob.getPriority();
        if (priority == 0) {
            return this.order - decodeJob.order;
        }
        return priority;
    }

    private int getPriority() {
        return this.eo.ordinal();
    }

    public void cancel() {
        this.dq = true;
        d dVar = this.eK;
        if (dVar != null) {
            dVar.cancel();
        }
    }

    /* JADX WARNING: Missing block: B:11:0x001c, code:
            if (r0 != null) goto L_0x001e;
     */
    /* JADX WARNING: Missing block: B:12:0x001e, code:
            r0.cleanup();
     */
    /* JADX WARNING: Missing block: B:13:0x0021, code:
            com.bumptech.glide.util.a.b.endSection();
     */
    /* JADX WARNING: Missing block: B:25:0x0065, code:
            if (r0 != null) goto L_0x001e;
     */
    /* JADX WARNING: Missing block: B:26:0x0068, code:
            return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void run() {
        com.bumptech.glide.util.a.b.b("DecodeJob#run(model=%s)", this.aL);
        com.bumptech.glide.load.a.d dVar = this.eJ;
        try {
            if (this.dq) {
                notifyFailed();
                if (dVar != null) {
                    dVar.cleanup();
                }
                com.bumptech.glide.util.a.b.endSection();
                return;
            }
            aF();
        } catch (Throwable th) {
            if (dVar != null) {
                dVar.cleanup();
            }
            com.bumptech.glide.util.a.b.endSection();
        }
    }

    private void aF() {
        switch (this.eB) {
            case INITIALIZE:
                this.eA = a(Stage.INITIALIZE);
                this.eK = aG();
                aH();
                return;
            case SWITCH_TO_SOURCE_SERVICE:
                aH();
                return;
            case DECODE_DATA:
                aJ();
                return;
            default:
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("Unrecognized run reason: ");
                stringBuilder.append(this.eB);
                throw new IllegalStateException(stringBuilder.toString());
        }
    }

    private d aG() {
        switch (this.eA) {
            case RESOURCE_CACHE:
                return new q(this.es, this);
            case DATA_CACHE:
                return new a(this.es, this);
            case SOURCE:
                return new t(this.es, this);
            case FINISHED:
                return null;
            default:
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("Unrecognized stage: ");
                stringBuilder.append(this.eA);
                throw new IllegalStateException(stringBuilder.toString());
        }
    }

    private void aH() {
        this.eE = Thread.currentThread();
        this.eC = com.bumptech.glide.util.e.eE();
        boolean z = false;
        while (!this.dq && this.eK != null) {
            z = this.eK.am();
            if (z) {
                break;
            }
            this.eA = a(this.eA);
            this.eK = aG();
            if (this.eA == Stage.SOURCE) {
                ap();
                return;
            }
        }
        if ((this.eA == Stage.FINISHED || this.dq) && !r0) {
            notifyFailed();
        }
    }

    private void notifyFailed() {
        aI();
        this.ez.a(new GlideException("Failed to load resource", new ArrayList(this.et)));
        aD();
    }

    private void a(p<R> pVar, DataSource dataSource) {
        aI();
        this.ez.c(pVar, dataSource);
    }

    private void aI() {
        this.eu.eN();
        if (this.eL) {
            throw new IllegalStateException("Already notified");
        }
        this.eL = true;
    }

    private Stage a(Stage stage) {
        switch (stage) {
            case RESOURCE_CACHE:
                return this.ep.aP() ? Stage.DATA_CACHE : a(Stage.DATA_CACHE);
            case DATA_CACHE:
                return this.eD ? Stage.FINISHED : Stage.SOURCE;
            case SOURCE:
            case FINISHED:
                return Stage.FINISHED;
            case INITIALIZE:
                return this.ep.aO() ? Stage.RESOURCE_CACHE : a(Stage.RESOURCE_CACHE);
            default:
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("Unrecognized stage: ");
                stringBuilder.append(stage);
                throw new IllegalArgumentException(stringBuilder.toString());
        }
    }

    public void ap() {
        this.eB = RunReason.SWITCH_TO_SOURCE_SERVICE;
        this.ez.b(this);
    }

    public void a(com.bumptech.glide.load.c cVar, Object obj, com.bumptech.glide.load.a.d<?> dVar, DataSource dataSource, com.bumptech.glide.load.c cVar2) {
        this.eF = cVar;
        this.eH = obj;
        this.eJ = dVar;
        this.eI = dataSource;
        this.eG = cVar2;
        if (Thread.currentThread() != this.eE) {
            this.eB = RunReason.DECODE_DATA;
            this.ez.b(this);
            return;
        }
        com.bumptech.glide.util.a.b.beginSection("DecodeJob.decodeFromRetrievedData");
        try {
            aJ();
        } finally {
            com.bumptech.glide.util.a.b.endSection();
        }
    }

    public void a(com.bumptech.glide.load.c cVar, Exception exception, com.bumptech.glide.load.a.d<?> dVar, DataSource dataSource) {
        dVar.cleanup();
        GlideException glideException = new GlideException("Fetching data failed", (Throwable) exception);
        glideException.a(cVar, dataSource, dVar.ad());
        this.et.add(glideException);
        if (Thread.currentThread() != this.eE) {
            this.eB = RunReason.SWITCH_TO_SOURCE_SERVICE;
            this.ez.b(this);
            return;
        }
        aH();
    }

    private void aJ() {
        if (Log.isLoggable(TAG, 2)) {
            long j = this.eC;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("data: ");
            stringBuilder.append(this.eH);
            stringBuilder.append(", cache key: ");
            stringBuilder.append(this.eF);
            stringBuilder.append(", fetcher: ");
            stringBuilder.append(this.eJ);
            a("Retrieved data", j, stringBuilder.toString());
        }
        p pVar = null;
        try {
            pVar = a(this.eJ, this.eH, this.eI);
        } catch (GlideException e) {
            e.a(this.eG, this.eI);
            this.et.add(e);
        }
        if (pVar != null) {
            b(pVar, this.eI);
        } else {
            aH();
        }
    }

    private void b(p<R> pVar, DataSource dataSource) {
        p pVar2;
        if (pVar2 instanceof l) {
            ((l) pVar2).initialize();
        }
        o oVar = null;
        if (this.ew.aL()) {
            pVar2 = o.f(pVar2);
            oVar = pVar2;
        }
        a(pVar2, dataSource);
        this.eA = Stage.ENCODE;
        try {
            if (this.ew.aL()) {
                this.ew.a(this.ek, this.eh);
            }
            if (oVar != null) {
                oVar.unlock();
            }
            aC();
        } catch (Throwable th) {
            if (oVar != null) {
                oVar.unlock();
            }
        }
    }

    private <Data> p<R> a(com.bumptech.glide.load.a.d<?> dVar, Data data, DataSource dataSource) throws GlideException {
        if (data == null) {
            dVar.cleanup();
            return null;
        }
        try {
            long eE = com.bumptech.glide.util.e.eE();
            p<R> a = a((Object) data, dataSource);
            if (Log.isLoggable(TAG, 2)) {
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("Decoded result ");
                stringBuilder.append(a);
                b(stringBuilder.toString(), eE);
            }
            dVar.cleanup();
            return a;
        } catch (Throwable th) {
            dVar.cleanup();
        }
    }

    private <Data> p<R> a(Data data, DataSource dataSource) throws GlideException {
        return a((Object) data, dataSource, this.es.d(data.getClass()));
    }

    @NonNull
    private f a(DataSource dataSource) {
        f fVar = this.eh;
        if (VERSION.SDK_INT < 26 || fVar.a(n.kH) != null) {
            return fVar;
        }
        if (dataSource == DataSource.RESOURCE_DISK_CACHE || this.es.ay()) {
            fVar = new f();
            fVar.a(this.eh);
            fVar.a(n.kH, Boolean.valueOf(true));
        }
        return fVar;
    }

    private <Data, ResourceType> p<R> a(Data data, DataSource dataSource, n<Data, ResourceType, R> nVar) throws GlideException {
        f a = a(dataSource);
        com.bumptech.glide.load.a.e c = this.q.l().c(data);
        try {
            p<R> a2 = nVar.a(c, a, this.width, this.height, new b(dataSource));
            return a2;
        } finally {
            c.cleanup();
        }
    }

    private void b(String str, long j) {
        a(str, j, null);
    }

    private void a(String str, long j, String str2) {
        String str3 = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(str);
        stringBuilder.append(" in ");
        stringBuilder.append(com.bumptech.glide.util.e.e(j));
        stringBuilder.append(", load key: ");
        stringBuilder.append(this.ey);
        if (str2 != null) {
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append(", ");
            stringBuilder2.append(str2);
            str = stringBuilder2.toString();
        } else {
            str = "";
        }
        stringBuilder.append(str);
        stringBuilder.append(", thread: ");
        stringBuilder.append(Thread.currentThread().getName());
        Log.v(str3, stringBuilder.toString());
    }

    @NonNull
    public com.bumptech.glide.util.a.c aK() {
        return this.eu;
    }

    @NonNull
    <Z> p<Z> a(DataSource dataSource, @NonNull p<Z> pVar) {
        i iVar;
        p transform;
        EncodeStrategy b;
        Class cls = pVar.get().getClass();
        h hVar = null;
        if (dataSource != DataSource.RESOURCE_DISK_CACHE) {
            i e = this.es.e(cls);
            iVar = e;
            transform = e.transform(this.q, pVar, this.width, this.height);
        } else {
            transform = pVar;
            iVar = null;
        }
        if (!pVar.equals(transform)) {
            pVar.recycle();
        }
        if (this.es.a(transform)) {
            hVar = this.es.b(transform);
            b = hVar.b(this.eh);
        } else {
            b = EncodeStrategy.NONE;
        }
        h hVar2 = hVar;
        if (!this.ep.a(this.es.c(this.eF) ^ 1, dataSource, b)) {
            return transform;
        }
        if (hVar2 != null) {
            com.bumptech.glide.load.c bVar;
            switch (b) {
                case SOURCE:
                    bVar = new b(this.eF, this.ef);
                    break;
                case TRANSFORMED:
                    com.bumptech.glide.load.c rVar = new r(this.es.f(), this.eF, this.ef, this.width, this.height, iVar, cls, this.eh);
                    break;
                default:
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("Unknown strategy: ");
                    stringBuilder.append(b);
                    throw new IllegalArgumentException(stringBuilder.toString());
            }
            p<Z> f = o.f(transform);
            this.ew.a(bVar, hVar2, f);
            return f;
        }
        throw new NoResultEncoderAvailableException(transform.get().getClass());
    }
}
