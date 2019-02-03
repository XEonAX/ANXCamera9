package com.bumptech.glide.load.engine;

import android.support.annotation.NonNull;
import android.util.Log;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.a.d;
import com.bumptech.glide.load.a.d.a;
import com.bumptech.glide.load.c;
import com.bumptech.glide.load.engine.a.a.b;
import com.bumptech.glide.load.model.m;
import com.bumptech.glide.util.e;
import java.util.Collections;
import java.util.List;

/* compiled from: SourceGenerator */
class t implements a<Object>, d.a, d {
    private static final String TAG = "SourceGenerator";
    private final e<?> dX;
    private final d.a dY;
    private volatile m.a<?> ed;
    private int gq;
    private a gr;
    private Object gs;
    private b gt;

    t(e<?> eVar, d.a aVar) {
        this.dX = eVar;
        this.dY = aVar;
    }

    public boolean am() {
        if (this.gs != null) {
            Object obj = this.gs;
            this.gs = null;
            k(obj);
        }
        if (this.gr != null && this.gr.am()) {
            return true;
        }
        this.gr = null;
        this.ed = null;
        boolean z = false;
        while (!z && an()) {
            List az = this.dX.az();
            int i = this.gq;
            this.gq = i + 1;
            this.ed = (m.a) az.get(i);
            if (this.ed != null && (this.dX.ar().b(this.ed.jp.ae()) || this.dX.c(this.ed.jp.ad()))) {
                this.ed.jp.a(this.dX.as(), this);
                z = true;
            }
        }
        return z;
    }

    private boolean an() {
        return this.gq < this.dX.az().size();
    }

    private void k(Object obj) {
        long eE = e.eE();
        try {
            com.bumptech.glide.load.a b = this.dX.b(obj);
            b cVar = new c(b, obj, this.dX.at());
            this.gt = new b(this.ed.ea, this.dX.au());
            this.dX.aq().a(this.gt, cVar);
            if (Log.isLoggable(TAG, 2)) {
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("Finished encoding source to cache, key: ");
                stringBuilder.append(this.gt);
                stringBuilder.append(", data: ");
                stringBuilder.append(obj);
                stringBuilder.append(", encoder: ");
                stringBuilder.append(b);
                stringBuilder.append(", duration: ");
                stringBuilder.append(e.e(eE));
                Log.v(str, stringBuilder.toString());
            }
            this.ed.jp.cleanup();
            this.gr = new a(Collections.singletonList(this.ed.ea), this.dX, this);
        } catch (Throwable th) {
            this.ed.jp.cleanup();
        }
    }

    public void cancel() {
        m.a aVar = this.ed;
        if (aVar != null) {
            aVar.jp.cancel();
        }
    }

    public void i(Object obj) {
        g ar = this.dX.ar();
        if (obj == null || !ar.b(this.ed.jp.ae())) {
            this.dY.a(this.ed.ea, obj, this.ed.jp, this.ed.jp.ae(), this.gt);
            return;
        }
        this.gs = obj;
        this.dY.ap();
    }

    public void b(@NonNull Exception exception) {
        this.dY.a(this.gt, exception, this.ed.jp, this.ed.jp.ae());
    }

    public void ap() {
        throw new UnsupportedOperationException();
    }

    public void a(c cVar, Object obj, d<?> dVar, DataSource dataSource, c cVar2) {
        this.dY.a(cVar, obj, dVar, this.ed.jp.ae(), cVar);
    }

    public void a(c cVar, Exception exception, d<?> dVar, DataSource dataSource) {
        this.dY.a(cVar, exception, dVar, this.ed.jp.ae());
    }
}
