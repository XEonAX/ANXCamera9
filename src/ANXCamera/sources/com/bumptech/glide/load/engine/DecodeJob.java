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
    private Object aK;
    private volatile boolean dp;
    private RunReason eA;
    private long eB;
    private boolean eC;
    private Thread eD;
    private com.bumptech.glide.load.c eE;
    private com.bumptech.glide.load.c eF;
    private Object eG;
    private DataSource eH;
    private com.bumptech.glide.load.a.d<?> eI;
    private volatile d eJ;
    private volatile boolean eK;
    private com.bumptech.glide.load.c ee;
    private f eg;
    private final d ej;
    private Priority en;
    private g eo;
    private final e<R> er = new e();
    private final List<Throwable> es = new ArrayList();
    private final com.bumptech.glide.util.a.c et = com.bumptech.glide.util.a.c.eM();
    private final Pool<DecodeJob<?>> eu;
    private final c<?> ev = new c();
    private final e ew = new e();
    private i ex;
    private a<R> ey;
    private Stage ez;
    private int height;
    private com.bumptech.glide.e o;
    private int order;
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
        private h<Z> eP;
        private o<Z> eQ;
        private com.bumptech.glide.load.c key;

        c() {
        }

        <X> void a(com.bumptech.glide.load.c cVar, h<X> hVar, o<X> oVar) {
            this.key = cVar;
            this.eP = hVar;
            this.eQ = oVar;
        }

        void a(d dVar, f fVar) {
            com.bumptech.glide.util.a.b.beginSection("DecodeJob.encode");
            try {
                dVar.aq().a(this.key, new c(this.eP, this.eQ, fVar));
            } finally {
                this.eQ.unlock();
                com.bumptech.glide.util.a.b.endSection();
            }
        }

        boolean aL() {
            return this.eQ != null;
        }

        void clear() {
            this.key = null;
            this.eP = null;
            this.eQ = null;
        }
    }

    interface d {
        com.bumptech.glide.load.engine.a.a aq();
    }

    private static class e {
        private boolean eR;
        private boolean eS;
        private boolean eT;

        e() {
        }

        synchronized boolean c(boolean z) {
            this.eR = true;
            return d(z);
        }

        synchronized boolean aM() {
            this.eS = true;
            return d(false);
        }

        synchronized boolean aN() {
            this.eT = true;
            return d(false);
        }

        synchronized void reset() {
            this.eS = false;
            this.eR = false;
            this.eT = false;
        }

        private boolean d(boolean z) {
            return (this.eT || z || this.eS) && this.eR;
        }
    }

    DecodeJob(d dVar, Pool<DecodeJob<?>> pool) {
        this.ej = dVar;
        this.eu = pool;
    }

    DecodeJob<R> a(com.bumptech.glide.e eVar, Object obj, i iVar, com.bumptech.glide.load.c cVar, int i, int i2, Class<?> cls, Class<R> cls2, Priority priority, g gVar, Map<Class<?>, i<?>> map, boolean z, boolean z2, boolean z3, f fVar, a<R> aVar, int i3) {
        this.er.a(eVar, obj, cVar, i, i2, gVar, cls, cls2, priority, fVar, map, z, z2, this.ej);
        this.o = eVar;
        this.ee = cVar;
        this.en = priority;
        this.ex = iVar;
        this.width = i;
        this.height = i2;
        this.eo = gVar;
        this.eC = z3;
        this.eg = fVar;
        this.ey = aVar;
        this.order = i3;
        this.eA = RunReason.INITIALIZE;
        this.aK = obj;
        return this;
    }

    boolean aB() {
        Stage a = a(Stage.INITIALIZE);
        return a == Stage.RESOURCE_CACHE || a == Stage.DATA_CACHE;
    }

    void release(boolean z) {
        if (this.ew.c(z)) {
            aE();
        }
    }

    private void aC() {
        if (this.ew.aM()) {
            aE();
        }
    }

    private void aD() {
        if (this.ew.aN()) {
            aE();
        }
    }

    private void aE() {
        this.ew.reset();
        this.ev.clear();
        this.er.clear();
        this.eK = false;
        this.o = null;
        this.ee = null;
        this.eg = null;
        this.en = null;
        this.ex = null;
        this.ey = null;
        this.ez = null;
        this.eJ = null;
        this.eD = null;
        this.eE = null;
        this.eG = null;
        this.eH = null;
        this.eI = null;
        this.eB = 0;
        this.dp = false;
        this.aK = null;
        this.es.clear();
        this.eu.release(this);
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
        return this.en.ordinal();
    }

    public void cancel() {
        this.dp = true;
        d dVar = this.eJ;
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
    public void run() {
        /*
        r5 = this;
        r0 = "DecodeJob#run(model=%s)";
        r1 = r5.aK;
        com.bumptech.glide.util.a.b.b(r0, r1);
        r0 = r5.eI;
        r1 = r5.dp;	 Catch:{ Throwable -> 0x0027 }
        if (r1 == 0) goto L_0x0019;
    L_0x000d:
        r5.notifyFailed();	 Catch:{ Throwable -> 0x0027 }
        if (r0 == 0) goto L_0x0015;
    L_0x0012:
        r0.cleanup();
    L_0x0015:
        com.bumptech.glide.util.a.b.endSection();
        return;
    L_0x0019:
        r5.aF();	 Catch:{ Throwable -> 0x0027 }
        if (r0 == 0) goto L_0x0021;
    L_0x001e:
        r0.cleanup();
    L_0x0021:
        com.bumptech.glide.util.a.b.endSection();
        goto L_0x0068;
    L_0x0025:
        r1 = move-exception;
        goto L_0x006a;
    L_0x0027:
        r1 = move-exception;
        r2 = "DecodeJob";
        r3 = 3;
        r2 = android.util.Log.isLoggable(r2, r3);	 Catch:{ all -> 0x0025 }
        if (r2 == 0) goto L_0x0053;
    L_0x0031:
        r2 = "DecodeJob";
        r3 = new java.lang.StringBuilder;	 Catch:{ all -> 0x0025 }
        r3.<init>();	 Catch:{ all -> 0x0025 }
        r4 = "DecodeJob threw unexpectedly, isCancelled: ";
        r3.append(r4);	 Catch:{ all -> 0x0025 }
        r4 = r5.dp;	 Catch:{ all -> 0x0025 }
        r3.append(r4);	 Catch:{ all -> 0x0025 }
        r4 = ", stage: ";
        r3.append(r4);	 Catch:{ all -> 0x0025 }
        r4 = r5.ez;	 Catch:{ all -> 0x0025 }
        r3.append(r4);	 Catch:{ all -> 0x0025 }
        r3 = r3.toString();	 Catch:{ all -> 0x0025 }
        android.util.Log.d(r2, r3, r1);	 Catch:{ all -> 0x0025 }
    L_0x0053:
        r2 = r5.ez;	 Catch:{ all -> 0x0025 }
        r3 = com.bumptech.glide.load.engine.DecodeJob.Stage.ENCODE;	 Catch:{ all -> 0x0025 }
        if (r2 == r3) goto L_0x0061;
    L_0x0059:
        r2 = r5.es;	 Catch:{ all -> 0x0025 }
        r2.add(r1);	 Catch:{ all -> 0x0025 }
        r5.notifyFailed();	 Catch:{ all -> 0x0025 }
    L_0x0061:
        r2 = r5.dp;	 Catch:{ all -> 0x0025 }
        if (r2 == 0) goto L_0x0069;
    L_0x0065:
        if (r0 == 0) goto L_0x0021;
    L_0x0067:
        goto L_0x001e;
    L_0x0068:
        return;
    L_0x0069:
        throw r1;	 Catch:{ all -> 0x0025 }
    L_0x006a:
        if (r0 == 0) goto L_0x006f;
    L_0x006c:
        r0.cleanup();
    L_0x006f:
        com.bumptech.glide.util.a.b.endSection();
        throw r1;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.bumptech.glide.load.engine.DecodeJob.run():void");
    }

    private void aF() {
        switch (this.eA) {
            case INITIALIZE:
                this.ez = a(Stage.INITIALIZE);
                this.eJ = aG();
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
                stringBuilder.append(this.eA);
                throw new IllegalStateException(stringBuilder.toString());
        }
    }

    private d aG() {
        switch (this.ez) {
            case RESOURCE_CACHE:
                return new q(this.er, this);
            case DATA_CACHE:
                return new a(this.er, this);
            case SOURCE:
                return new t(this.er, this);
            case FINISHED:
                return null;
            default:
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("Unrecognized stage: ");
                stringBuilder.append(this.ez);
                throw new IllegalStateException(stringBuilder.toString());
        }
    }

    private void aH() {
        this.eD = Thread.currentThread();
        this.eB = com.bumptech.glide.util.e.eE();
        boolean z = false;
        while (!this.dp && this.eJ != null) {
            z = this.eJ.am();
            if (z) {
                break;
            }
            this.ez = a(this.ez);
            this.eJ = aG();
            if (this.ez == Stage.SOURCE) {
                ap();
                return;
            }
        }
        if ((this.ez == Stage.FINISHED || this.dp) && !r0) {
            notifyFailed();
        }
    }

    private void notifyFailed() {
        aI();
        this.ey.a(new GlideException("Failed to load resource", new ArrayList(this.es)));
        aD();
    }

    private void a(p<R> pVar, DataSource dataSource) {
        aI();
        this.ey.c(pVar, dataSource);
    }

    private void aI() {
        this.et.eN();
        if (this.eK) {
            throw new IllegalStateException("Already notified");
        }
        this.eK = true;
    }

    private Stage a(Stage stage) {
        switch (stage) {
            case RESOURCE_CACHE:
                return this.eo.aP() ? Stage.DATA_CACHE : a(Stage.DATA_CACHE);
            case DATA_CACHE:
                return this.eC ? Stage.FINISHED : Stage.SOURCE;
            case SOURCE:
            case FINISHED:
                return Stage.FINISHED;
            case INITIALIZE:
                return this.eo.aO() ? Stage.RESOURCE_CACHE : a(Stage.RESOURCE_CACHE);
            default:
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("Unrecognized stage: ");
                stringBuilder.append(stage);
                throw new IllegalArgumentException(stringBuilder.toString());
        }
    }

    public void ap() {
        this.eA = RunReason.SWITCH_TO_SOURCE_SERVICE;
        this.ey.b(this);
    }

    public void a(com.bumptech.glide.load.c cVar, Object obj, com.bumptech.glide.load.a.d<?> dVar, DataSource dataSource, com.bumptech.glide.load.c cVar2) {
        this.eE = cVar;
        this.eG = obj;
        this.eI = dVar;
        this.eH = dataSource;
        this.eF = cVar2;
        if (Thread.currentThread() != this.eD) {
            this.eA = RunReason.DECODE_DATA;
            this.ey.b(this);
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
        this.es.add(glideException);
        if (Thread.currentThread() != this.eD) {
            this.eA = RunReason.SWITCH_TO_SOURCE_SERVICE;
            this.ey.b(this);
            return;
        }
        aH();
    }

    private void aJ() {
        if (Log.isLoggable(TAG, 2)) {
            long j = this.eB;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("data: ");
            stringBuilder.append(this.eG);
            stringBuilder.append(", cache key: ");
            stringBuilder.append(this.eE);
            stringBuilder.append(", fetcher: ");
            stringBuilder.append(this.eI);
            a("Retrieved data", j, stringBuilder.toString());
        }
        p pVar = null;
        try {
            pVar = a(this.eI, this.eG, this.eH);
        } catch (GlideException e) {
            e.a(this.eF, this.eH);
            this.es.add(e);
        }
        if (pVar != null) {
            b(pVar, this.eH);
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
        if (this.ev.aL()) {
            pVar2 = o.f(pVar2);
            oVar = pVar2;
        }
        a(pVar2, dataSource);
        this.ez = Stage.ENCODE;
        try {
            if (this.ev.aL()) {
                this.ev.a(this.ej, this.eg);
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
        return a((Object) data, dataSource, this.er.d(data.getClass()));
    }

    @NonNull
    private f a(DataSource dataSource) {
        f fVar = this.eg;
        if (VERSION.SDK_INT < 26 || fVar.a(n.kH) != null) {
            return fVar;
        }
        if (dataSource == DataSource.RESOURCE_DISK_CACHE || this.er.ay()) {
            fVar = new f();
            fVar.a(this.eg);
            fVar.a(n.kH, Boolean.valueOf(true));
        }
        return fVar;
    }

    private <Data, ResourceType> p<R> a(Data data, DataSource dataSource, n<Data, ResourceType, R> nVar) throws GlideException {
        f a = a(dataSource);
        com.bumptech.glide.load.a.e c = this.o.l().c(data);
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
        stringBuilder.append(this.ex);
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
        return this.et;
    }

    @NonNull
    <Z> p<Z> a(DataSource dataSource, @NonNull p<Z> pVar) {
        i iVar;
        p transform;
        EncodeStrategy b;
        Class cls = pVar.get().getClass();
        h hVar = null;
        if (dataSource != DataSource.RESOURCE_DISK_CACHE) {
            i e = this.er.e(cls);
            iVar = e;
            transform = e.transform(this.o, pVar, this.width, this.height);
        } else {
            transform = pVar;
            iVar = null;
        }
        if (!pVar.equals(transform)) {
            pVar.recycle();
        }
        if (this.er.a(transform)) {
            hVar = this.er.b(transform);
            b = hVar.b(this.eg);
        } else {
            b = EncodeStrategy.NONE;
        }
        h hVar2 = hVar;
        if (!this.eo.a(this.er.c(this.eE) ^ 1, dataSource, b)) {
            return transform;
        }
        if (hVar2 != null) {
            com.bumptech.glide.load.c bVar;
            switch (b) {
                case SOURCE:
                    bVar = new b(this.eE, this.ee);
                    break;
                case TRANSFORMED:
                    com.bumptech.glide.load.c rVar = new r(this.er.f(), this.eE, this.ee, this.width, this.height, iVar, cls, this.eg);
                    break;
                default:
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("Unknown strategy: ");
                    stringBuilder.append(b);
                    throw new IllegalArgumentException(stringBuilder.toString());
            }
            p<Z> f = o.f(transform);
            this.ev.a(bVar, hVar2, f);
            return f;
        }
        throw new NoResultEncoderAvailableException(transform.get().getClass());
    }
}
