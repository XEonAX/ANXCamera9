package com.bumptech.glide;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.support.annotation.CheckResult;
import android.support.annotation.DrawableRes;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.RawRes;
import android.view.View;
import com.bumptech.glide.load.engine.g;
import com.bumptech.glide.manager.c;
import com.bumptech.glide.manager.d;
import com.bumptech.glide.manager.h;
import com.bumptech.glide.manager.m;
import com.bumptech.glide.manager.n;
import com.bumptech.glide.manager.o;
import com.bumptech.glide.request.f;
import com.bumptech.glide.request.target.ViewTarget;
import com.bumptech.glide.util.k;
import java.io.File;
import java.net.URL;

/* compiled from: RequestManager */
public class i implements g<h<Drawable>>, com.bumptech.glide.manager.i {
    private static final f aH = f.a(g.fm).c(Priority.LOW).k(true);
    private static final f aX = f.o(Bitmap.class).dF();
    private static final f aY = f.o(com.bumptech.glide.load.resource.gif.b.class).dF();
    private final Handler U;
    private f aJ;
    final h aZ;
    private final n ba;
    private final m bb;
    private final o bc;
    private final Runnable bd;
    private final c be;
    protected final c c;
    protected final Context context;

    /* compiled from: RequestManager */
    private static class a extends ViewTarget<View, Object> {
        a(@NonNull View view) {
            super(view);
        }

        public void a(@NonNull Object obj, @Nullable com.bumptech.glide.request.a.f<? super Object> fVar) {
        }
    }

    /* compiled from: RequestManager */
    private static class b implements com.bumptech.glide.manager.c.a {
        private final n ba;

        b(@NonNull n nVar) {
            this.ba = nVar;
        }

        public void b(boolean z) {
            if (z) {
                this.ba.cY();
            }
        }
    }

    public i(@NonNull c cVar, @NonNull h hVar, @NonNull m mVar, @NonNull Context context) {
        this(cVar, hVar, mVar, new n(), cVar.g(), context);
    }

    i(c cVar, h hVar, m mVar, n nVar, d dVar, Context context) {
        this.bc = new o();
        this.bd = new Runnable() {
            public void run() {
                i.this.aZ.a(i.this);
            }
        };
        this.U = new Handler(Looper.getMainLooper());
        this.c = cVar;
        this.aZ = hVar;
        this.bb = mVar;
        this.ba = nVar;
        this.context = context;
        this.be = dVar.a(context.getApplicationContext(), new b(nVar));
        if (k.eI()) {
            this.U.post(this.bd);
        } else {
            hVar.a(this);
        }
        hVar.a(this.be);
        c(cVar.h().m());
        cVar.a(this);
    }

    protected void c(@NonNull f fVar) {
        this.aJ = fVar.clone().dG();
    }

    private void d(@NonNull f fVar) {
        this.aJ = this.aJ.g(fVar);
    }

    @NonNull
    public i e(@NonNull f fVar) {
        d(fVar);
        return this;
    }

    @NonNull
    public i f(@NonNull f fVar) {
        c(fVar);
        return this;
    }

    public boolean isPaused() {
        k.eF();
        return this.ba.isPaused();
    }

    public void w() {
        k.eF();
        this.ba.w();
    }

    public void x() {
        k.eF();
        this.ba.x();
    }

    public void y() {
        k.eF();
        w();
        for (i w : this.bb.cQ()) {
            w.w();
        }
    }

    public void z() {
        k.eF();
        this.ba.z();
    }

    public void A() {
        k.eF();
        z();
        for (i z : this.bb.cQ()) {
            z.z();
        }
    }

    public void onStart() {
        z();
        this.bc.onStart();
    }

    public void onStop() {
        w();
        this.bc.onStop();
    }

    public void onDestroy() {
        this.bc.onDestroy();
        for (com.bumptech.glide.request.target.n d : this.bc.getAll()) {
            d(d);
        }
        this.bc.clear();
        this.ba.cX();
        this.aZ.b(this);
        this.aZ.b(this.be);
        this.U.removeCallbacks(this.bd);
        this.c.b(this);
    }

    @CheckResult
    @NonNull
    public h<Bitmap> B() {
        return b(Bitmap.class).b(aX);
    }

    @CheckResult
    @NonNull
    public h<com.bumptech.glide.load.resource.gif.b> C() {
        return b(com.bumptech.glide.load.resource.gif.b.class).b(aY);
    }

    @CheckResult
    @NonNull
    public h<Drawable> D() {
        return b(Drawable.class);
    }

    @CheckResult
    @NonNull
    /* renamed from: b */
    public h<Drawable> a(@Nullable Bitmap bitmap) {
        return D().a(bitmap);
    }

    @CheckResult
    @NonNull
    /* renamed from: b */
    public h<Drawable> a(@Nullable Drawable drawable) {
        return D().a(drawable);
    }

    @CheckResult
    @NonNull
    /* renamed from: b */
    public h<Drawable> a(@Nullable String str) {
        return D().a(str);
    }

    @CheckResult
    @NonNull
    /* renamed from: b */
    public h<Drawable> a(@Nullable Uri uri) {
        return D().a(uri);
    }

    @CheckResult
    @NonNull
    /* renamed from: b */
    public h<Drawable> a(@Nullable File file) {
        return D().a(file);
    }

    @CheckResult
    @NonNull
    /* renamed from: b */
    public h<Drawable> a(@Nullable @RawRes @DrawableRes Integer num) {
        return D().a(num);
    }

    @Deprecated
    @CheckResult
    /* renamed from: b */
    public h<Drawable> a(@Nullable URL url) {
        return D().a(url);
    }

    @CheckResult
    @NonNull
    /* renamed from: b */
    public h<Drawable> a(@Nullable byte[] bArr) {
        return D().a(bArr);
    }

    @CheckResult
    @NonNull
    /* renamed from: e */
    public h<Drawable> load(@Nullable Object obj) {
        return D().load(obj);
    }

    @CheckResult
    @NonNull
    public h<File> E() {
        return b(File.class).b(aH);
    }

    @CheckResult
    @NonNull
    public h<File> g(@Nullable Object obj) {
        return E().load(obj);
    }

    @CheckResult
    @NonNull
    public h<File> F() {
        return b(File.class).b(f.g(true));
    }

    @CheckResult
    @NonNull
    public <ResourceType> h<ResourceType> b(@NonNull Class<ResourceType> cls) {
        return new h(this.c, this, cls, this.context);
    }

    public void b(@NonNull View view) {
        d(new a(view));
    }

    public void d(@Nullable final com.bumptech.glide.request.target.n<?> nVar) {
        if (nVar != null) {
            if (k.eH()) {
                e((com.bumptech.glide.request.target.n) nVar);
            } else {
                this.U.post(new Runnable() {
                    public void run() {
                        i.this.d(nVar);
                    }
                });
            }
        }
    }

    private void e(@NonNull com.bumptech.glide.request.target.n<?> nVar) {
        if (!f((com.bumptech.glide.request.target.n) nVar) && !this.c.a((com.bumptech.glide.request.target.n) nVar) && nVar.dj() != null) {
            com.bumptech.glide.request.c dj = nVar.dj();
            nVar.j(null);
            dj.clear();
        }
    }

    boolean f(@NonNull com.bumptech.glide.request.target.n<?> nVar) {
        com.bumptech.glide.request.c dj = nVar.dj();
        if (dj == null) {
            return true;
        }
        if (!this.ba.b(dj)) {
            return false;
        }
        this.bc.h(nVar);
        nVar.j(null);
        return true;
    }

    void a(@NonNull com.bumptech.glide.request.target.n<?> nVar, @NonNull com.bumptech.glide.request.c cVar) {
        this.bc.g(nVar);
        this.ba.a(cVar);
    }

    f m() {
        return this.aJ;
    }

    @NonNull
    <T> j<?, T> a(Class<T> cls) {
        return this.c.h().a(cls);
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(super.toString());
        stringBuilder.append("{tracker=");
        stringBuilder.append(this.ba);
        stringBuilder.append(", treeNode=");
        stringBuilder.append(this.bb);
        stringBuilder.append("}");
        return stringBuilder.toString();
    }
}
