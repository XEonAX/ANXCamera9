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
    private static final String nU = "Glide";
    private static final boolean nW = Log.isLoggable(TAG, 2);
    private Class<R> aI;
    private f aJ;
    @Nullable
    private Object aL;
    private e<R> aM;
    private Context context;
    private p<R> dV;
    private Priority eo;
    private final com.bumptech.glide.util.a.c eu;
    private Engine h;
    private int height;
    private Drawable nK;
    private int nM;
    private int nN;
    private Drawable nP;
    private boolean nV;
    @Nullable
    private e<R> nX;
    private d nY;
    private n<R> nZ;
    private g<? super R> oa;
    private b ob;
    private Status oc;
    private Drawable od;
    private e q;
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
        this.tag = nW ? String.valueOf(super.hashCode()) : null;
        this.eu = com.bumptech.glide.util.a.c.eM();
    }

    private void b(Context context, e eVar, Object obj, Class<R> cls, f fVar, int i, int i2, Priority priority, n<R> nVar, e<R> eVar2, e<R> eVar3, d dVar, Engine engine, g<? super R> gVar) {
        this.context = context;
        this.q = eVar;
        this.aL = obj;
        this.aI = cls;
        this.aJ = fVar;
        this.nN = i;
        this.nM = i2;
        this.eo = priority;
        this.nZ = nVar;
        this.nX = eVar2;
        this.aM = eVar3;
        this.nY = dVar;
        this.h = engine;
        this.oa = gVar;
        this.oc = Status.PENDING;
    }

    @NonNull
    public com.bumptech.glide.util.a.c aK() {
        return this.eu;
    }

    public void recycle() {
        ec();
        this.context = null;
        this.q = null;
        this.aL = null;
        this.aI = null;
        this.aJ = null;
        this.nN = -1;
        this.nM = -1;
        this.nZ = null;
        this.aM = null;
        this.nX = null;
        this.nY = null;
        this.oa = null;
        this.ob = null;
        this.od = null;
        this.nK = null;
        this.nP = null;
        this.width = -1;
        this.height = -1;
        gh.release(this);
    }

    public void begin() {
        ec();
        this.eu.eN();
        this.startTime = com.bumptech.glide.util.e.eE();
        if (this.aL == null) {
            if (k.p(this.nN, this.nM)) {
                this.width = this.nN;
                this.height = this.nM;
            }
            a(new GlideException("Received null model"), dS() == null ? 5 : 3);
        } else if (this.oc == Status.RUNNING) {
            throw new IllegalArgumentException("Cannot restart a running request");
        } else if (this.oc == Status.COMPLETE) {
            c(this.dV, DataSource.MEMORY_CACHE);
        } else {
            this.oc = Status.WAITING_FOR_SIZE;
            if (k.p(this.nN, this.nM)) {
                m(this.nN, this.nM);
            } else {
                this.nZ.a(this);
            }
            if ((this.oc == Status.RUNNING || this.oc == Status.WAITING_FOR_SIZE) && eh()) {
                this.nZ.e(dQ());
            }
            if (nW) {
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("finished run method in ");
                stringBuilder.append(com.bumptech.glide.util.e.e(this.startTime));
                u(stringBuilder.toString());
            }
        }
    }

    void cancel() {
        ec();
        this.eu.eN();
        this.nZ.b(this);
        this.oc = Status.CANCELLED;
        if (this.ob != null) {
            this.ob.cancel();
            this.ob = null;
        }
    }

    private void ec() {
        if (this.nV) {
            throw new IllegalStateException("You can't start or clear loads in RequestListener or Target callbacks. If you're trying to start a fallback request when a load fails, use RequestBuilder#error(RequestBuilder). Otherwise consider posting your into() or clear() calls to the main thread using a Handler instead.");
        }
    }

    public void clear() {
        k.eF();
        ec();
        this.eu.eN();
        if (this.oc != Status.CLEARED) {
            cancel();
            if (this.dV != null) {
                m(this.dV);
            }
            if (eg()) {
                this.nZ.d(dQ());
            }
            this.oc = Status.CLEARED;
        }
    }

    public boolean isPaused() {
        return this.oc == Status.PAUSED;
    }

    public void pause() {
        clear();
        this.oc = Status.PAUSED;
    }

    private void m(p<?> pVar) {
        this.h.d((p) pVar);
        this.dV = null;
    }

    public boolean isRunning() {
        return this.oc == Status.RUNNING || this.oc == Status.WAITING_FOR_SIZE;
    }

    public boolean isComplete() {
        return this.oc == Status.COMPLETE;
    }

    public boolean dd() {
        return isComplete();
    }

    public boolean isCancelled() {
        return this.oc == Status.CANCELLED || this.oc == Status.CLEARED;
    }

    public boolean isFailed() {
        return this.oc == Status.FAILED;
    }

    private Drawable ed() {
        if (this.od == null) {
            this.od = this.aJ.dN();
            if (this.od == null && this.aJ.dO() > 0) {
                this.od = P(this.aJ.dO());
            }
        }
        return this.od;
    }

    private Drawable dQ() {
        if (this.nK == null) {
            this.nK = this.aJ.dQ();
            if (this.nK == null && this.aJ.dP() > 0) {
                this.nK = P(this.aJ.dP());
            }
        }
        return this.nK;
    }

    private Drawable dS() {
        if (this.nP == null) {
            this.nP = this.aJ.dS();
            if (this.nP == null && this.aJ.dR() > 0) {
                this.nP = P(this.aJ.dR());
            }
        }
        return this.nP;
    }

    private Drawable P(@DrawableRes int i) {
        return com.bumptech.glide.load.resource.b.a.a(this.q, i, this.aJ.getTheme() != null ? this.aJ.getTheme() : this.context.getTheme());
    }

    private void ee() {
        if (eh()) {
            Drawable drawable = null;
            if (this.aL == null) {
                drawable = dS();
            }
            if (drawable == null) {
                drawable = ed();
            }
            if (drawable == null) {
                drawable = dQ();
            }
            this.nZ.f(drawable);
        }
    }

    public void m(int i, int i2) {
        StringBuilder stringBuilder;
        this.eu.eN();
        if (nW) {
            stringBuilder = new StringBuilder();
            stringBuilder.append("Got onSizeReady in ");
            stringBuilder.append(com.bumptech.glide.util.e.e(this.startTime));
            u(stringBuilder.toString());
        }
        if (this.oc == Status.WAITING_FOR_SIZE) {
            this.oc = Status.RUNNING;
            float dY = this.aJ.dY();
            this.width = a(i, dY);
            this.height = a(i2, dY);
            if (nW) {
                stringBuilder = new StringBuilder();
                stringBuilder.append("finished setup for calling load in ");
                stringBuilder.append(com.bumptech.glide.util.e.e(this.startTime));
                u(stringBuilder.toString());
            }
            b a = this.h.a(this.q, this.aL, this.aJ.au(), this.width, this.height, this.aJ.aZ(), this.aI, this.eo, this.aJ.ar(), this.aJ.dL(), this.aJ.dM(), this.aJ.ay(), this.aJ.at(), this.aJ.dT(), this.aJ.dZ(), this.aJ.ea(), this.aJ.eb(), this);
            this.ob = a;
            if (this.oc != Status.RUNNING) {
                this.ob = null;
            }
            if (nW) {
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
        return this.nY == null || this.nY.d(this);
    }

    private boolean eg() {
        return this.nY == null || this.nY.f(this);
    }

    private boolean eh() {
        return this.nY == null || this.nY.e(this);
    }

    private boolean ei() {
        return this.nY == null || !this.nY.dh();
    }

    private void ej() {
        if (this.nY != null) {
            this.nY.h(this);
        }
    }

    private void ek() {
        if (this.nY != null) {
            this.nY.i(this);
        }
    }

    public void c(p<?> pVar, DataSource dataSource) {
        this.eu.eN();
        this.ob = null;
        if (pVar == null) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Expected to receive a Resource<R> with an object of ");
            stringBuilder.append(this.aI);
            stringBuilder.append(" inside, but instead got null.");
            a(new GlideException(stringBuilder.toString()));
            return;
        }
        Object obj = pVar.get();
        if (obj == null || !this.aI.isAssignableFrom(obj.getClass())) {
            m(pVar);
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("Expected to receive an object of ");
            stringBuilder2.append(this.aI);
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
            this.oc = Status.COMPLETE;
        }
    }

    /* JADX WARNING: Missing block: B:8:0x007f, code:
            if (r7.aM.a(r9, r7.aL, r7.nZ, r10, r6) == false) goto L_0x0081;
     */
    /* JADX WARNING: Missing block: B:12:0x0092, code:
            if (r7.nX.a(r9, r7.aL, r7.nZ, r10, r6) == false) goto L_0x0094;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void a(p<R> pVar, R r, DataSource dataSource) {
        boolean ei = ei();
        this.oc = Status.COMPLETE;
        this.dV = pVar;
        if (this.q.getLogLevel() <= 3) {
            String str = nU;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Finished loading ");
            stringBuilder.append(r.getClass().getSimpleName());
            stringBuilder.append(" from ");
            stringBuilder.append(dataSource);
            stringBuilder.append(" for ");
            stringBuilder.append(this.aL);
            stringBuilder.append(" with size [");
            stringBuilder.append(this.width);
            stringBuilder.append("x");
            stringBuilder.append(this.height);
            stringBuilder.append("] in ");
            stringBuilder.append(com.bumptech.glide.util.e.e(this.startTime));
            stringBuilder.append(" ms");
            Log.d(str, stringBuilder.toString());
        }
        this.nV = true;
        try {
            if (this.aM != null) {
            }
            if (this.nX != null) {
            }
            this.nZ.a(r, this.oa.a(dataSource, ei));
            this.nV = false;
            ej();
        } catch (Throwable th) {
            this.nV = false;
        }
    }

    public void a(GlideException glideException) {
        a(glideException, 5);
    }

    private void a(GlideException glideException, int i) {
        this.eu.eN();
        int logLevel = this.q.getLogLevel();
        if (logLevel <= i) {
            String str = nU;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Load failed for ");
            stringBuilder.append(this.aL);
            stringBuilder.append(" with size [");
            stringBuilder.append(this.width);
            stringBuilder.append("x");
            stringBuilder.append(this.height);
            stringBuilder.append("]");
            Log.w(str, stringBuilder.toString(), glideException);
            if (logLevel <= 4) {
                glideException.j(nU);
            }
        }
        this.ob = null;
        this.oc = Status.FAILED;
        this.nV = true;
        try {
            if ((this.aM == null || !this.aM.a(glideException, this.aL, this.nZ, ei())) && (this.nX == null || !this.nX.a(glideException, this.aL, this.nZ, ei()))) {
                ee();
            }
            this.nV = false;
            ek();
        } catch (Throwable th) {
            this.nV = false;
        }
    }

    public boolean c(c cVar) {
        boolean z = false;
        if (!(cVar instanceof SingleRequest)) {
            return false;
        }
        SingleRequest singleRequest = (SingleRequest) cVar;
        if (this.nN == singleRequest.nN && this.nM == singleRequest.nM && k.c(this.aL, singleRequest.aL) && this.aI.equals(singleRequest.aI) && this.aJ.equals(singleRequest.aJ) && this.eo == singleRequest.eo && (this.aM == null ? singleRequest.aM != null : singleRequest.aM == null)) {
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
