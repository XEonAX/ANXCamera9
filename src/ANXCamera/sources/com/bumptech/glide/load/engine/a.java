package com.bumptech.glide.load.engine;

import android.support.annotation.NonNull;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.c;
import com.bumptech.glide.load.model.m;
import java.io.File;
import java.util.List;

/* compiled from: DataCacheGenerator */
class a implements com.bumptech.glide.load.a.d.a<Object>, d {
    private final List<c> dV;
    private final e<?> dW;
    private final com.bumptech.glide.load.engine.d.a dX;
    private int dY;
    private c dZ;
    private List<m<File, ?>> ea;
    private int eb;
    private volatile com.bumptech.glide.load.model.m.a<?> ec;
    private File ed;

    a(e<?> eVar, com.bumptech.glide.load.engine.d.a aVar) {
        this(eVar.aA(), eVar, aVar);
    }

    a(List<c> list, e<?> eVar, com.bumptech.glide.load.engine.d.a aVar) {
        this.dY = -1;
        this.dV = list;
        this.dW = eVar;
        this.dX = aVar;
    }

    public boolean am() {
        while (true) {
            boolean z = false;
            if (this.ea == null || !an()) {
                this.dY++;
                if (this.dY >= this.dV.size()) {
                    return false;
                }
                c cVar = (c) this.dV.get(this.dY);
                this.ed = this.dW.aq().e(new b(cVar, this.dW.au()));
                if (this.ed != null) {
                    this.dZ = cVar;
                    this.ea = this.dW.g(this.ed);
                    this.eb = 0;
                }
            } else {
                this.ec = null;
                while (!z && an()) {
                    List list = this.ea;
                    int i = this.eb;
                    this.eb = i + 1;
                    this.ec = ((m) list.get(i)).b(this.ed, this.dW.getWidth(), this.dW.getHeight(), this.dW.at());
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
        com.bumptech.glide.load.model.m.a aVar = this.ec;
        if (aVar != null) {
            aVar.jp.cancel();
        }
    }

    public void i(Object obj) {
        this.dX.a(this.dZ, obj, this.ec.jp, DataSource.DATA_DISK_CACHE, this.dZ);
    }

    public void b(@NonNull Exception exception) {
        this.dX.a(this.dZ, exception, this.ec.jp, DataSource.DATA_DISK_CACHE);
    }
}
