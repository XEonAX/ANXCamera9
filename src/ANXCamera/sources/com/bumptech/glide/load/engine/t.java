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
    private final e<?> dW;
    private final d.a dX;
    private volatile m.a<?> ec;
    private int gq;
    private a gr;
    private Object gs;
    private b gt;

    t(e<?> eVar, d.a aVar) {
        this.dW = eVar;
        this.dX = aVar;
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
        this.ec = null;
        boolean z = false;
        while (!z && an()) {
            List az = this.dW.az();
            int i = this.gq;
            this.gq = i + 1;
            this.ec = (m.a) az.get(i);
            if (this.ec != null && (this.dW.ar().b(this.ec.jp.ae()) || this.dW.c(this.ec.jp.ad()))) {
                this.ec.jp.a(this.dW.as(), this);
                z = true;
            }
        }
        return z;
    }

    private boolean an() {
        return this.gq < this.dW.az().size();
    }

    private void k(Object obj) {
        long eE = e.eE();
        try {
            com.bumptech.glide.load.a b = this.dW.b(obj);
            b cVar = new c(b, obj, this.dW.at());
            this.gt = new b(this.ec.dZ, this.dW.au());
            this.dW.aq().a(this.gt, cVar);
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
            this.ec.jp.cleanup();
            this.gr = new a(Collections.singletonList(this.ec.dZ), this.dW, this);
        } catch (Throwable th) {
            this.ec.jp.cleanup();
        }
    }

    public void cancel() {
        m.a aVar = this.ec;
        if (aVar != null) {
            aVar.jp.cancel();
        }
    }

    public void i(Object obj) {
        g ar = this.dW.ar();
        if (obj == null || !ar.b(this.ec.jp.ae())) {
            this.dX.a(this.ec.dZ, obj, this.ec.jp, this.ec.jp.ae(), this.gt);
            return;
        }
        this.gs = obj;
        this.dX.ap();
    }

    public void b(@NonNull Exception exception) {
        this.dX.a(this.gt, exception, this.ec.jp, this.ec.jp.ae());
    }

    public void ap() {
        throw new UnsupportedOperationException();
    }

    public void a(c cVar, Object obj, d<?> dVar, DataSource dataSource, c cVar2) {
        this.dX.a(cVar, obj, dVar, this.ec.jp.ae(), cVar);
    }

    public void a(c cVar, Exception exception, d<?> dVar, DataSource dataSource) {
        this.dX.a(cVar, exception, dVar, this.ec.jp.ae());
    }
}
