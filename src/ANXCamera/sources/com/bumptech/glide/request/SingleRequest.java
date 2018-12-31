package com.bumptech.glide.request;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.support.annotation.DrawableRes;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.util.Pools.Pool;
import android.util.Log;
import com.bumptech.glide.Priority;
import com.bumptech.glide.e;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.engine.Engine;
import com.bumptech.glide.load.engine.Engine.b;
import com.bumptech.glide.load.engine.GlideException;
import com.bumptech.glide.load.engine.p;
import com.bumptech.glide.request.a.g;
import com.bumptech.glide.request.target.m;
import com.bumptech.glide.request.target.n;
import com.bumptech.glide.util.a.a;
import com.bumptech.glide.util.a.a.c;
import com.bumptech.glide.util.k;

public final class SingleRequest<R> implements c, g, m, c {
    private static final String TAG = "Request";
    private static final Pool<SingleRequest<?>> gh = a.a(150, new a.a<SingleRequest<?>>() {
        /* renamed from: el */
        public SingleRequest<?> create() {
            return new SingleRequest();
        }
    });
    private static final String nV = "Glide";
    private static final boolean nX = Log.isLoggable(TAG, 2);
    private Class<R> aH;
    private f aI;
    @Nullable
    private Object aK;
    private e<R> aL;
    private Context context;
    private p<R> dU;
    private Priority en;
    private final com.bumptech.glide.util.a.c et;
    private Engine h;
    private int height;
    private Drawable nL;
    private int nN;
    private int nO;
    private Drawable nQ;
    private boolean nW;
    @Nullable
    private e<R> nY;
    private d nZ;
    private e o;
    private n<R> oa;
    private g<? super R> ob;
    private b oc;
    private Status od;
    private Drawable oe;
    private long startTime;
    @Nullable
    private final String tag;
    private int width;

    private enum Status {
        PENDING,
        RUNNING,
        WAITING_FOR_SIZE,
        COMPLETE,
        FAILED,
        CANCELLED,
        CLEARED,
        PAUSED
    }

    public static <R> SingleRequest<R> a(Context context, e eVar, Object obj, Class<R> cls, f fVar, int i, int i2, Priority priority, n<R> nVar, e<R> eVar2, e<R> eVar3, d dVar, Engine engine, g<? super R> gVar) {
        SingleRequest<R> singleRequest = (SingleRequest) gh.acquire();
        if (singleRequest == null) {
            singleRequest = new SingleRequest();
        }
        singleRequest.b(context, eVar, obj, cls, fVar, i, i2, priority, nVar, eVar2, eVar3, dVar, engine, gVar);
        return singleRequest;
    }

    SingleRequest() {
        this.tag = nX ? String.valueOf(super.hashCode()) : null;
        this.et = com.bumptech.glide.util.a.c.eM();
    }

    private void b(Context context, e eVar, Object obj, Class<R> cls, f fVar, int i, int i2, Priority priority, n<R> nVar, e<R> eVar2, e<R> eVar3, d dVar, Engine engine, g<? super R> gVar) {
        this.context = context;
        this.o = eVar;
        this.aK = obj;
        this.aH = cls;
        this.aI = fVar;
        this.nO = i;
        this.nN = i2;
        this.en = priority;
        this.oa = nVar;
        this.nY = eVar2;
        this.aL = eVar3;
        this.nZ = dVar;
        this.h = engine;
        this.ob = gVar;
        this.od = Status.PENDING;
    }

    @NonNull
    public com.bumptech.glide.util.a.c aK() {
        return this.et;
    }

    public void recycle() {
        ec();
        this.context = null;
        this.o = null;
        this.aK = null;
        this.aH = null;
        this.aI = null;
        this.nO = -1;
        this.nN = -1;
        this.oa = null;
        this.aL = null;
        this.nY = null;
        this.nZ = null;
        this.ob = null;
        this.oc = null;
        this.oe = null;
        this.nL = null;
        this.nQ = null;
        this.width = -1;
        this.height = -1;
        gh.release(this);
    }

    public void begin() {
        ec();
        this.et.eN();
        this.startTime = com.bumptech.glide.util.e.eE();
        if (this.aK == null) {
            if (k.p(this.nO, this.nN)) {
                this.width = this.nO;
                this.height = this.nN;
            }
            a(new GlideException("Received null model"), dS() == null ? 5 : 3);
        } else if (this.od == Status.RUNNING) {
            throw new IllegalArgumentException("Cannot restart a running request");
        } else if (this.od == Status.COMPLETE) {
            c(this.dU, DataSource.MEMORY_CACHE);
        } else {
            this.od = Status.WAITING_FOR_SIZE;
            if (k.p(this.nO, this.nN)) {
                m(this.nO, this.nN);
            } else {
                this.oa.a(this);
            }
            if ((this.od == Status.RUNNING || this.od == Status.WAITING_FOR_SIZE) && eh()) {
                this.oa.e(dQ());
            }
            if (nX) {
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("finished run method in ");
                stringBuilder.append(com.bumptech.glide.util.e.e(this.startTime));
                u(stringBuilder.toString());
            }
        }
    }

    void cancel() {
        ec();
        this.et.eN();
        this.oa.b(this);
        this.od = Status.CANCELLED;
        if (this.oc != null) {
            this.oc.cancel();
            this.oc = null;
        }
    }

    private void ec() {
        if (this.nW) {
            throw new IllegalStateException("You can't start or clear loads in RequestListener or Target callbacks. If you're trying to start a fallback request when a load fails, use RequestBuilder#error(RequestBuilder). Otherwise consider posting your into() or clear() calls to the main thread using a Handler instead.");
        }
    }

    public void clear() {
        k.eF();
        ec();
        this.et.eN();
        if (this.od != Status.CLEARED) {
            cancel();
            if (this.dU != null) {
                m(this.dU);
            }
            if (eg()) {
                this.oa.d(dQ());
            }
            this.od = Status.CLEARED;
        }
    }

    public boolean isPaused() {
        return this.od == Status.PAUSED;
    }

    public void pause() {
        clear();
        this.od = Status.PAUSED;
    }

    private void m(p<?> pVar) {
        this.h.d((p) pVar);
        this.dU = null;
    }

    public boolean isRunning() {
        return this.od == Status.RUNNING || this.od == Status.WAITING_FOR_SIZE;
    }

    public boolean isComplete() {
        return this.od == Status.COMPLETE;
    }

    public boolean dd() {
        return isComplete();
    }

    public boolean isCancelled() {
        return this.od == Status.CANCELLED || this.od == Status.CLEARED;
    }

    public boolean isFailed() {
        return this.od == Status.FAILED;
    }

    private Drawable ed() {
        if (this.oe == null) {
            this.oe = this.aI.dN();
            if (this.oe == null && this.aI.dO() > 0) {
                this.oe = P(this.aI.dO());
            }
        }
        return this.oe;
    }

    private Drawable dQ() {
        if (this.nL == null) {
            this.nL = this.aI.dQ();
            if (this.nL == null && this.aI.dP() > 0) {
                this.nL = P(this.aI.dP());
            }
        }
        return this.nL;
    }

    private Drawable dS() {
        if (this.nQ == null) {
            this.nQ = this.aI.dS();
            if (this.nQ == null && this.aI.dR() > 0) {
                this.nQ = P(this.aI.dR());
            }
        }
        return this.nQ;
    }

    private Drawable P(@DrawableRes int i) {
        return com.bumptech.glide.load.resource.b.a.a(this.o, i, this.aI.getTheme() != null ? this.aI.getTheme() : this.context.getTheme());
    }

    private void ee() {
        if (eh()) {
            Drawable drawable = null;
            if (this.aK == null) {
                drawable = dS();
            }
            if (drawable == null) {
                drawable = ed();
            }
            if (drawable == null) {
                drawable = dQ();
            }
            this.oa.f(drawable);
        }
    }

    public void m(int i, int i2) {
        StringBuilder stringBuilder;
        this.et.eN();
        if (nX) {
            stringBuilder = new StringBuilder();
            stringBuilder.append("Got onSizeReady in ");
            stringBuilder.append(com.bumptech.glide.util.e.e(this.startTime));
            u(stringBuilder.toString());
        }
        if (this.od == Status.WAITING_FOR_SIZE) {
            this.od = Status.RUNNING;
            float dY = this.aI.dY();
            this.width = a(i, dY);
            this.height = a(i2, dY);
            if (nX) {
                stringBuilder = new StringBuilder();
                stringBuilder.append("finished setup for calling load in ");
                stringBuilder.append(com.bumptech.glide.util.e.e(this.startTime));
                u(stringBuilder.toString());
            }
            b a = this.h.a(this.o, this.aK, this.aI.au(), this.width, this.height, this.aI.aZ(), this.aH, this.en, this.aI.ar(), this.aI.dL(), this.aI.dM(), this.aI.ay(), this.aI.at(), this.aI.dT(), this.aI.dZ(), this.aI.ea(), this.aI.eb(), this);
            this.oc = a;
            if (this.od != Status.RUNNING) {
                this.oc = null;
            }
            if (nX) {
                stringBuilder = new StringBuilder();
                stringBuilder.append("finished onSizeReady in ");
                stringBuilder.append(com.bumptech.glide.util.e.e(this.startTime));
                u(stringBuilder.toString());
            }
        }
    }

    private static int a(int i, float f) {
        return i == Integer.MIN_VALUE ? i : Math.round(f * ((float) i));
    }

    private boolean ef() {
        return this.nZ == null || this.nZ.d(this);
    }

    private boolean eg() {
        return this.nZ == null || this.nZ.f(this);
    }

    private boolean eh() {
        return this.nZ == null || this.nZ.e(this);
    }

    private boolean ei() {
        return this.nZ == null || !this.nZ.dh();
    }

    private void ej() {
        if (this.nZ != null) {
            this.nZ.h(this);
        }
    }

    private void ek() {
        if (this.nZ != null) {
            this.nZ.i(this);
        }
    }

    public void c(p<?> pVar, DataSource dataSource) {
        this.et.eN();
        this.oc = null;
        if (pVar == null) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Expected to receive a Resource<R> with an object of ");
            stringBuilder.append(this.aH);
            stringBuilder.append(" inside, but instead got null.");
            a(new GlideException(stringBuilder.toString()));
            return;
        }
        Object obj = pVar.get();
        if (obj == null || !this.aH.isAssignableFrom(obj.getClass())) {
            m(pVar);
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("Expected to receive an object of ");
            stringBuilder2.append(this.aH);
            stringBuilder2.append(" but instead got ");
            stringBuilder2.append(obj != null ? obj.getClass() : "");
            stringBuilder2.append("{");
            stringBuilder2.append(obj);
            stringBuilder2.append("} inside Resource{");
            stringBuilder2.append(pVar);
            stringBuilder2.append("}.");
            stringBuilder2.append(obj != null ? "" : " To indicate failure return a null Resource object, rather than a Resource object containing null data.");
            a(new GlideException(stringBuilder2.toString()));
        } else if (ef()) {
            a(pVar, obj, dataSource);
        } else {
            m(pVar);
            this.od = Status.COMPLETE;
        }
    }

    /* JADX WARNING: Missing block: B:8:0x007f, code:
            if (r7.aL.a(r9, r7.aK, r7.oa, r10, r6) == false) goto L_0x0081;
     */
    /* JADX WARNING: Missing block: B:12:0x0092, code:
            if (r7.nY.a(r9, r7.aK, r7.oa, r10, r6) == false) goto L_0x0094;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void a(p<R> pVar, R r, DataSource dataSource) {
        boolean ei = ei();
        this.od = Status.COMPLETE;
        this.dU = pVar;
        if (this.o.getLogLevel() <= 3) {
            String str = nV;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Finished loading ");
            stringBuilder.append(r.getClass().getSimpleName());
            stringBuilder.append(" from ");
            stringBuilder.append(dataSource);
            stringBuilder.append(" for ");
            stringBuilder.append(this.aK);
            stringBuilder.append(" with size [");
            stringBuilder.append(this.width);
            stringBuilder.append("x");
            stringBuilder.append(this.height);
            stringBuilder.append("] in ");
            stringBuilder.append(com.bumptech.glide.util.e.e(this.startTime));
            stringBuilder.append(" ms");
            Log.d(str, stringBuilder.toString());
        }
        this.nW = true;
        try {
            if (this.aL != null) {
            }
            if (this.nY != null) {
            }
            this.oa.a(r, this.ob.a(dataSource, ei));
            this.nW = false;
            ej();
        } catch (Throwable th) {
            this.nW = false;
        }
    }

    public void a(GlideException glideException) {
        a(glideException, 5);
    }

    private void a(GlideException glideException, int i) {
        this.et.eN();
        int logLevel = this.o.getLogLevel();
        if (logLevel <= i) {
            String str = nV;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Load failed for ");
            stringBuilder.append(this.aK);
            stringBuilder.append(" with size [");
            stringBuilder.append(this.width);
            stringBuilder.append("x");
            stringBuilder.append(this.height);
            stringBuilder.append("]");
            Log.w(str, stringBuilder.toString(), glideException);
            if (logLevel <= 4) {
                glideException.j(nV);
            }
        }
        this.oc = null;
        this.od = Status.FAILED;
        this.nW = true;
        try {
            if ((this.aL == null || !this.aL.a(glideException, this.aK, this.oa, ei())) && (this.nY == null || !this.nY.a(glideException, this.aK, this.oa, ei()))) {
                ee();
            }
            this.nW = false;
            ek();
        } catch (Throwable th) {
            this.nW = false;
        }
    }

    public boolean c(c cVar) {
        boolean z = false;
        if (!(cVar instanceof SingleRequest)) {
            return false;
        }
        SingleRequest singleRequest = (SingleRequest) cVar;
        if (this.nO == singleRequest.nO && this.nN == singleRequest.nN && k.c(this.aK, singleRequest.aK) && this.aH.equals(singleRequest.aH) && this.aI.equals(singleRequest.aI) && this.en == singleRequest.en && (this.aL == null ? singleRequest.aL != null : singleRequest.aL == null)) {
            z = true;
        }
        return z;
    }

    private void u(String str) {
        String str2 = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(str);
        stringBuilder.append(" this: ");
        stringBuilder.append(this.tag);
        Log.v(str2, stringBuilder.toString());
    }
}
