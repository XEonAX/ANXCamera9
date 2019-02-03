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
    private final e<?> dX;
    private final d.a dY;
    private int dZ;
    private c ea;
    private List<m<File, ?>> eb;
    private int ec;
    private volatile m.a<?> ed;
    private File ee;
    private int gj = -1;
    private r gk;

    q(e<?> eVar, d.a aVar) {
        this.dX = eVar;
        this.dY = aVar;
    }

    public boolean am() {
        List aA = this.dX.aA();
        boolean z = false;
        if (aA.isEmpty()) {
            return false;
        }
        List ax = this.dX.ax();
        if (ax.isEmpty() && File.class.equals(this.dX.av())) {
            return false;
        }
        while (true) {
            if (this.eb == null || !an()) {
                this.gj++;
                if (this.gj >= ax.size()) {
                    this.dZ++;
                    if (this.dZ >= aA.size()) {
                        return false;
                    }
                    this.gj = 0;
                }
                c cVar = (c) aA.get(this.dZ);
                Class cls = (Class) ax.get(this.gj);
                c cVar2 = cVar;
                this.gk = new r(this.dX.f(), cVar2, this.dX.au(), this.dX.getWidth(), this.dX.getHeight(), this.dX.e(cls), cls, this.dX.at());
                this.ee = this.dX.aq().e(this.gk);
                if (this.ee != null) {
                    this.ea = cVar;
                    this.eb = this.dX.g(this.ee);
                    this.ec = 0;
                }
            } else {
                this.ed = null;
                while (!z && an()) {
                    aA = this.eb;
                    int i = this.ec;
                    this.ec = i + 1;
                    this.ed = ((m) aA.get(i)).b(this.ee, this.dX.getWidth(), this.dX.getHeight(), this.dX.at());
                    if (this.ed != null && this.dX.c(this.ed.jp.ad())) {
                        this.ed.jp.a(this.dX.as(), this);
                        z = true;
                    }
                }
                return z;
            }
        }
    }

    private boolean an() {
        return this.ec < this.eb.size();
    }

    public void cancel() {
        m.a aVar = this.ed;
        if (aVar != null) {
            aVar.jp.cancel();
        }
    }

    public void i(Object obj) {
        this.dY.a(this.ea, obj, this.ed.jp, DataSource.RESOURCE_DISK_CACHE, this.gk);
    }

    public void b(@NonNull Exception exception) {
        this.dY.a(this.gk, exception, this.ed.jp, DataSource.RESOURCE_DISK_CACHE);
    }
}
