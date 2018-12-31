package com.bumptech.glide.load.engine;

import android.support.annotation.NonNull;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.a.d.a;
import com.bumptech.glide.load.c;
import com.bumptech.glide.load.model.m;
import java.io.File;
import java.util.List;

/* compiled from: ResourceCacheGenerator */
class q implements a<Object>, d {
    private final e<?> dW;
    private final d.a dX;
    private int dY;
    private c dZ;
    private List<m<File, ?>> ea;
    private int eb;
    private volatile m.a<?> ec;
    private File ed;
    private int gj = -1;
    private r gk;

    q(e<?> eVar, d.a aVar) {
        this.dW = eVar;
        this.dX = aVar;
    }

    public boolean am() {
        List aA = this.dW.aA();
        boolean z = false;
        if (aA.isEmpty()) {
            return false;
        }
        List ax = this.dW.ax();
        if (ax.isEmpty() && File.class.equals(this.dW.av())) {
            return false;
        }
        while (true) {
            if (this.ea == null || !an()) {
                this.gj++;
                if (this.gj >= ax.size()) {
                    this.dY++;
                    if (this.dY >= aA.size()) {
                        return false;
                    }
                    this.gj = 0;
                }
                c cVar = (c) aA.get(this.dY);
                Class cls = (Class) ax.get(this.gj);
                c cVar2 = cVar;
                this.gk = new r(this.dW.f(), cVar2, this.dW.au(), this.dW.getWidth(), this.dW.getHeight(), this.dW.e(cls), cls, this.dW.at());
                this.ed = this.dW.aq().e(this.gk);
                if (this.ed != null) {
                    this.dZ = cVar;
                    this.ea = this.dW.g(this.ed);
                    this.eb = 0;
                }
            } else {
                this.ec = null;
                while (!z && an()) {
                    aA = this.ea;
                    int i = this.eb;
                    this.eb = i + 1;
                    this.ec = ((m) aA.get(i)).b(this.ed, this.dW.getWidth(), this.dW.getHeight(), this.dW.at());
                    if (this.ec != null && this.dW.c(this.ec.jp.ad())) {
                        this.ec.jp.a(this.dW.as(), this);
                        z = true;
                    }
                }
                return z;
            }
        }
    }

    private boolean an() {
        return this.eb < this.ea.size();
    }

    public void cancel() {
        m.a aVar = this.ec;
        if (aVar != null) {
            aVar.jp.cancel();
        }
    }

    public void i(Object obj) {
        this.dX.a(this.dZ, obj, this.ec.jp, DataSource.RESOURCE_DISK_CACHE, this.gk);
    }

    public void b(@NonNull Exception exception) {
        this.dX.a(this.gk, exception, this.ec.jp, DataSource.RESOURCE_DISK_CACHE);
    }
}
