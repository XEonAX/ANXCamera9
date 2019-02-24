package com.bumptech.glide.load.engine;

import android.support.annotation.NonNull;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.c;
import com.bumptech.glide.load.model.m;
import java.io.File;
import java.util.List;

/* compiled from: DataCacheGenerator */
class a implements com.bumptech.glide.load.a.d.a<Object>, d {
    private final List<c> dW;
    private final e<?> dX;
    private final com.bumptech.glide.load.engine.d.a dY;
    private int dZ;
    private c ea;
    private List<m<File, ?>> eb;
    private int ec;
    private volatile com.bumptech.glide.load.model.m.a<?> ed;
    private File ee;

    a(e<?> eVar, com.bumptech.glide.load.engine.d.a aVar) {
        this(eVar.aA(), eVar, aVar);
    }

    a(List<c> list, e<?> eVar, com.bumptech.glide.load.engine.d.a aVar) {
        this.dZ = -1;
        this.dW = list;
        this.dX = eVar;
        this.dY = aVar;
    }

    public boolean am() {
        while (true) {
            boolean z = false;
            if (this.eb == null || !an()) {
                this.dZ++;
                if (this.dZ >= this.dW.size()) {
                    return false;
                }
                c cVar = (c) this.dW.get(this.dZ);
                this.ee = this.dX.aq().e(new b(cVar, this.dX.au()));
                if (this.ee != null) {
                    this.ea = cVar;
                    this.eb = this.dX.g(this.ee);
                    this.ec = 0;
                }
            } else {
                this.ed = null;
                while (!z && an()) {
                    List list = this.eb;
                    int i = this.ec;
                    this.ec = i + 1;
                    this.ed = ((m) list.get(i)).b(this.ee, this.dX.getWidth(), this.dX.getHeight(), this.dX.at());
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
        com.bumptech.glide.load.model.m.a aVar = this.ed;
        if (aVar != null) {
            aVar.jp.cancel();
        }
    }

    public void i(Object obj) {
        this.dY.a(this.ea, obj, this.ed.jp, DataSource.DATA_DISK_CACHE, this.ea);
    }

    public void b(@NonNull Exception exception) {
        this.dY.a(this.ea, exception, this.ed.jp, DataSource.DATA_DISK_CACHE);
    }
}
