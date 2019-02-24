package com.bumptech.glide;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.support.annotation.CheckResult;
import android.support.annotation.DrawableRes;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.RawRes;
import android.widget.ImageView;
import android.widget.ImageView.ScaleType;
import com.bumptech.glide.e.a;
import com.bumptech.glide.load.engine.g;
import com.bumptech.glide.request.RequestFutureTarget;
import com.bumptech.glide.request.SingleRequest;
import com.bumptech.glide.request.b;
import com.bumptech.glide.request.c;
import com.bumptech.glide.request.d;
import com.bumptech.glide.request.e;
import com.bumptech.glide.request.f;
import com.bumptech.glide.request.target.ViewTarget;
import com.bumptech.glide.request.target.n;
import com.bumptech.glide.util.i;
import com.bumptech.glide.util.k;
import java.io.File;
import java.net.URL;

/* compiled from: RequestBuilder */
public class h<TranscodeType> implements g<h<TranscodeType>>, Cloneable {
    protected static final f aH = new f().b(g.fm).c(Priority.LOW).k(true);
    private final f L;
    private final i Z;
    private final Class<TranscodeType> aI;
    @NonNull
    protected f aJ;
    @NonNull
    private j<?, ? super TranscodeType> aK;
    @Nullable
    private Object aL;
    @Nullable
    private e<TranscodeType> aM;
    @Nullable
    private h<TranscodeType> aN;
    @Nullable
    private h<TranscodeType> aO;
    @Nullable
    private Float aP;
    private boolean aQ;
    private boolean aR;
    private boolean aS;
    private final c c;
    private final Context context;
    private final e q;

    /* compiled from: RequestBuilder */
    /* renamed from: com.bumptech.glide.h$2 */
    static /* synthetic */ class AnonymousClass2 {
        static final /* synthetic */ int[] aV = new int[ScaleType.values().length];

        static {
            aW = new int[Priority.values().length];
            try {
                aW[Priority.LOW.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                aW[Priority.NORMAL.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                aW[Priority.HIGH.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                aW[Priority.IMMEDIATE.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                aV[ScaleType.CENTER_CROP.ordinal()] = 1;
            } catch (NoSuchFieldError e5) {
            }
            try {
                aV[ScaleType.CENTER_INSIDE.ordinal()] = 2;
            } catch (NoSuchFieldError e6) {
            }
            try {
                aV[ScaleType.FIT_CENTER.ordinal()] = 3;
            } catch (NoSuchFieldError e7) {
            }
            try {
                aV[ScaleType.FIT_START.ordinal()] = 4;
            } catch (NoSuchFieldError e8) {
            }
            try {
                aV[ScaleType.FIT_END.ordinal()] = 5;
            } catch (NoSuchFieldError e9) {
            }
            try {
                aV[ScaleType.FIT_XY.ordinal()] = 6;
            } catch (NoSuchFieldError e10) {
            }
            try {
                aV[ScaleType.CENTER.ordinal()] = 7;
            } catch (NoSuchFieldError e11) {
            }
            try {
                aV[ScaleType.MATRIX.ordinal()] = 8;
            } catch (NoSuchFieldError e12) {
            }
        }
    }

    protected h(c cVar, i iVar, Class<TranscodeType> cls, Context context) {
        this.aQ = true;
        this.c = cVar;
        this.Z = iVar;
        this.aI = cls;
        this.L = iVar.m();
        this.context = context;
        this.aK = iVar.a((Class) cls);
        this.aJ = this.L;
        this.q = cVar.h();
    }

    protected h(Class<TranscodeType> cls, h<?> hVar) {
        this(hVar.c, hVar.Z, cls, hVar.context);
        this.aL = hVar.aL;
        this.aR = hVar.aR;
        this.aJ = hVar.aJ;
    }

    @CheckResult
    @NonNull
    public h<TranscodeType> b(@NonNull f fVar) {
        i.checkNotNull(fVar);
        this.aJ = r().g(fVar);
        return this;
    }

    @NonNull
    protected f r() {
        return this.L == this.aJ ? this.aJ.clone() : this.aJ;
    }

    @CheckResult
    @NonNull
    public h<TranscodeType> a(@NonNull j<?, ? super TranscodeType> jVar) {
        this.aK = (j) i.checkNotNull(jVar);
        this.aQ = false;
        return this;
    }

    @CheckResult
    @NonNull
    public h<TranscodeType> a(@Nullable e<TranscodeType> eVar) {
        this.aM = eVar;
        return this;
    }

    @NonNull
    public h<TranscodeType> a(@Nullable h<TranscodeType> hVar) {
        this.aO = hVar;
        return this;
    }

    @CheckResult
    @NonNull
    public h<TranscodeType> b(@Nullable h<TranscodeType> hVar) {
        this.aN = hVar;
        return this;
    }

    @CheckResult
    @NonNull
    public h<TranscodeType> a(@Nullable h<TranscodeType>... hVarArr) {
        h hVar = null;
        if (hVarArr == null || hVarArr.length == 0) {
            return b((h) null);
        }
        for (int length = hVarArr.length - 1; length >= 0; length--) {
            h hVar2 = hVarArr[length];
            if (hVar2 != null) {
                if (hVar == null) {
                    hVar = hVar2;
                } else {
                    hVar = hVar2.b(hVar);
                }
            }
        }
        return b(hVar);
    }

    @CheckResult
    @NonNull
    public h<TranscodeType> a(float f) {
        if (f < 0.0f || f > 1.0f) {
            throw new IllegalArgumentException("sizeMultiplier must be between 0 and 1");
        }
        this.aP = Float.valueOf(f);
        return this;
    }

    @CheckResult
    @NonNull
    /* renamed from: e */
    public h<TranscodeType> load(@Nullable Object obj) {
        return f(obj);
    }

    @NonNull
    private h<TranscodeType> f(@Nullable Object obj) {
        this.aL = obj;
        this.aR = true;
        return this;
    }

    @CheckResult
    @NonNull
    /* renamed from: b */
    public h<TranscodeType> a(@Nullable Bitmap bitmap) {
        return f(bitmap).b(f.a(g.fl));
    }

    @CheckResult
    @NonNull
    /* renamed from: b */
    public h<TranscodeType> a(@Nullable Drawable drawable) {
        return f(drawable).b(f.a(g.fl));
    }

    @CheckResult
    @NonNull
    /* renamed from: b */
    public h<TranscodeType> a(@Nullable String str) {
        return f(str);
    }

    @CheckResult
    @NonNull
    /* renamed from: b */
    public h<TranscodeType> a(@Nullable Uri uri) {
        return f(uri);
    }

    @CheckResult
    @NonNull
    /* renamed from: b */
    public h<TranscodeType> a(@Nullable File file) {
        return f(file);
    }

    @CheckResult
    @NonNull
    /* renamed from: b */
    public h<TranscodeType> a(@Nullable @RawRes @DrawableRes Integer num) {
        return f(num).b(f.j(a.m(this.context)));
    }

    @Deprecated
    @CheckResult
    /* renamed from: b */
    public h<TranscodeType> a(@Nullable URL url) {
        return f(url);
    }

    @CheckResult
    @NonNull
    /* renamed from: b */
    public h<TranscodeType> a(@Nullable byte[] bArr) {
        h<TranscodeType> f = f(bArr);
        if (!f.aJ.dJ()) {
            f = f.b(f.a(g.fl));
        }
        if (f.aJ.dK()) {
            return f;
        }
        return f.b(f.g(true));
    }

    @CheckResult
    /* renamed from: s */
    public h<TranscodeType> clone() {
        try {
            h<TranscodeType> hVar = (h) super.clone();
            hVar.aJ = hVar.aJ.clone();
            hVar.aK = hVar.aK.clone();
            return hVar;
        } catch (Throwable e) {
            throw new RuntimeException(e);
        }
    }

    @NonNull
    public <Y extends n<TranscodeType>> Y b(@NonNull Y y) {
        return a((n) y, null);
    }

    @NonNull
    <Y extends n<TranscodeType>> Y a(@NonNull Y y, @Nullable e<TranscodeType> eVar) {
        return a(y, eVar, r());
    }

    private <Y extends n<TranscodeType>> Y a(@NonNull Y y, @Nullable e<TranscodeType> eVar, @NonNull f fVar) {
        k.eF();
        i.checkNotNull(y);
        if (this.aR) {
            fVar = fVar.dG();
            c b = b(y, eVar, fVar);
            c dj = y.dj();
            if (!b.c(dj) || a(fVar, dj)) {
                this.Z.d((n) y);
                y.j(b);
                this.Z.a(y, b);
                return y;
            }
            b.recycle();
            if (!((c) i.checkNotNull(dj)).isRunning()) {
                dj.begin();
            }
            return y;
        }
        throw new IllegalArgumentException("You must call #load() before calling #into()");
    }

    private boolean a(f fVar, c cVar) {
        return !fVar.dT() && cVar.isComplete();
    }

    @NonNull
    public ViewTarget<ImageView, TranscodeType> a(@NonNull ImageView imageView) {
        k.eF();
        i.checkNotNull(imageView);
        f fVar = this.aJ;
        if (!(fVar.dt() || !fVar.ds() || imageView.getScaleType() == null)) {
            switch (AnonymousClass2.aV[imageView.getScaleType().ordinal()]) {
                case 1:
                    fVar = fVar.clone().dv();
                    break;
                case 2:
                    fVar = fVar.clone().dz();
                    break;
                case 3:
                case 4:
                case 5:
                    fVar = fVar.clone().dx();
                    break;
                case 6:
                    fVar = fVar.clone().dz();
                    break;
            }
        }
        return (ViewTarget) a(this.q.a(imageView, this.aI), null, fVar);
    }

    @Deprecated
    public b<TranscodeType> c(int i, int i2) {
        return d(i, i2);
    }

    @NonNull
    public b<TranscodeType> t() {
        return d(Integer.MIN_VALUE, Integer.MIN_VALUE);
    }

    @NonNull
    public b<TranscodeType> d(int i, int i2) {
        final n requestFutureTarget = new RequestFutureTarget(this.q.n(), i, i2);
        if (k.eI()) {
            this.q.n().post(new Runnable() {
                public void run() {
                    if (!requestFutureTarget.isCancelled()) {
                        h.this.a(requestFutureTarget, requestFutureTarget);
                    }
                }
            });
        } else {
            a(requestFutureTarget, (e) requestFutureTarget);
        }
        return requestFutureTarget;
    }

    @NonNull
    public n<TranscodeType> e(int i, int i2) {
        return b(com.bumptech.glide.request.target.k.b(this.Z, i, i2));
    }

    @NonNull
    public n<TranscodeType> u() {
        return e(Integer.MIN_VALUE, Integer.MIN_VALUE);
    }

    @Deprecated
    @CheckResult
    public <Y extends n<File>> Y c(@NonNull Y y) {
        return v().b((n) y);
    }

    @Deprecated
    @CheckResult
    public b<File> f(int i, int i2) {
        return v().d(i, i2);
    }

    @CheckResult
    @NonNull
    protected h<File> v() {
        return new h(File.class, this).b(aH);
    }

    @NonNull
    private Priority a(@NonNull Priority priority) {
        switch (priority) {
            case LOW:
                return Priority.NORMAL;
            case NORMAL:
                return Priority.HIGH;
            case HIGH:
            case IMMEDIATE:
                return Priority.IMMEDIATE;
            default:
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("unknown priority: ");
                stringBuilder.append(this.aJ.as());
                throw new IllegalArgumentException(stringBuilder.toString());
        }
    }

    private c b(n<TranscodeType> nVar, @Nullable e<TranscodeType> eVar, f fVar) {
        return a((n) nVar, (e) eVar, null, this.aK, fVar.as(), fVar.dV(), fVar.dX(), fVar);
    }

    private c a(n<TranscodeType> nVar, @Nullable e<TranscodeType> eVar, @Nullable d dVar, j<?, ? super TranscodeType> jVar, Priority priority, int i, int i2, f fVar) {
        d aVar;
        c cVar;
        if (this.aO != null) {
            aVar = new com.bumptech.glide.request.a(dVar);
            cVar = aVar;
        } else {
            cVar = null;
            aVar = dVar;
        }
        c b = b(nVar, eVar, aVar, jVar, priority, i, i2, fVar);
        if (cVar == null) {
            return b;
        }
        int dV = this.aO.aJ.dV();
        int dX = this.aO.aJ.dX();
        if (k.p(i, i2) && !this.aO.aJ.dW()) {
            dV = fVar.dV();
            dX = fVar.dX();
        }
        int i3 = dV;
        int i4 = dX;
        n nVar2 = nVar;
        e eVar2 = eVar;
        d dVar2 = cVar;
        cVar.a(b, this.aO.a(nVar2, eVar2, dVar2, this.aO.aK, this.aO.aJ.as(), i3, i4, this.aO.aJ));
        return cVar;
    }

    private c b(n<TranscodeType> nVar, e<TranscodeType> eVar, @Nullable d dVar, j<?, ? super TranscodeType> jVar, Priority priority, int i, int i2, f fVar) {
        d dVar2 = dVar;
        Priority priority2 = priority;
        if (this.aN != null) {
            if (this.aS) {
                throw new IllegalStateException("You cannot use a request as both the main request and a thumbnail, consider using clone() on the request(s) passed to thumbnail()");
            }
            j jVar2 = this.aN.aQ ? jVar : this.aN.aK;
            Priority as = this.aN.aJ.dU() ? this.aN.aJ.as() : a(priority2);
            int dV = this.aN.aJ.dV();
            int dX = this.aN.aJ.dX();
            if (k.p(i, i2) && !this.aN.aJ.dW()) {
                dV = fVar.dV();
                dX = fVar.dX();
            }
            int i3 = dV;
            int i4 = dX;
            d hVar = new com.bumptech.glide.request.h(dVar2);
            c a = a((n) nVar, (e) eVar, fVar, hVar, (j) jVar, priority2, i, i2);
            this.aS = true;
            d dVar3 = hVar;
            c a2 = this.aN.a((n) nVar, (e) eVar, hVar, jVar2, as, i3, i4, this.aN.aJ);
            this.aS = false;
            dVar3.a(a, a2);
            return dVar3;
        } else if (this.aP == null) {
            return a((n) nVar, (e) eVar, fVar, dVar2, (j) jVar, priority2, i, i2);
        } else {
            c hVar2 = new com.bumptech.glide.request.h(dVar2);
            e eVar2 = eVar;
            dVar2 = hVar2;
            j jVar3 = jVar;
            int i5 = i;
            int i6 = i2;
            hVar2.a(a((n) nVar, eVar2, fVar, dVar2, jVar3, priority2, i5, i6), a((n) nVar, eVar2, fVar.clone().h(this.aP.floatValue()), dVar2, jVar3, a(priority2), i5, i6));
            return hVar2;
        }
    }

    private c a(n<TranscodeType> nVar, e<TranscodeType> eVar, f fVar, d dVar, j<?, ? super TranscodeType> jVar, Priority priority, int i, int i2) {
        Context context = this.context;
        e eVar2 = this.q;
        Object obj = this.aL;
        Class cls = this.aI;
        return SingleRequest.a(context, eVar2, obj, cls, fVar, i, i2, priority, nVar, eVar, this.aM, dVar, this.q.o(), jVar.I());
    }
}
