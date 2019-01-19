package com.bumptech.glide.request.a;

import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.request.a.j.a;

/* compiled from: ViewPropertyAnimationFactory */
public class i<R> implements g<R> {
    private final a oZ;
    private j<R> pa;

    public i(a aVar) {
        this.oZ = aVar;
    }

    public f<R> a(DataSource dataSource, boolean z) {
        if (dataSource == DataSource.MEMORY_CACHE || !z) {
            return e.eA();
        }
        if (this.pa == null) {
            this.pa = new j(this.oZ);
        }
        return this.pa;
    }
}
