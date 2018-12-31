package com.bumptech.glide.load.engine;

import android.support.annotation.NonNull;
import android.support.v4.util.Pools.Pool;
import com.bumptech.glide.util.a.a;
import com.bumptech.glide.util.a.a.c;
import com.bumptech.glide.util.i;

/* compiled from: LockedResource */
final class o<Z> implements p<Z>, c {
    private static final Pool<o<?>> gh = a.b(20, new a.a<o<?>>() {
        /* renamed from: bc */
        public o<?> create() {
            return new o();
        }
    });
    private final com.bumptech.glide.util.a.c et = com.bumptech.glide.util.a.c.eM();
    private boolean fZ;
    private p<Z> gi;
    private boolean isLocked;

    @NonNull
    static <Z> o<Z> f(p<Z> pVar) {
        o<Z> oVar = (o) i.checkNotNull((o) gh.acquire());
        oVar.g(pVar);
        return oVar;
    }

    o() {
    }

    private void g(p<Z> pVar) {
        this.fZ = false;
        this.isLocked = true;
        this.gi = pVar;
    }

    private void release() {
        this.gi = null;
        gh.release(this);
    }

    synchronized void unlock() {
        this.et.eN();
        if (this.isLocked) {
            this.isLocked = false;
            if (this.fZ) {
                recycle();
            }
        } else {
            throw new IllegalStateException("Already unlocked");
        }
    }

    @NonNull
    public Class<Z> aZ() {
        return this.gi.aZ();
    }

    @NonNull
    public Z get() {
        return this.gi.get();
    }

    public int getSize() {
        return this.gi.getSize();
    }

    public synchronized void recycle() {
        this.et.eN();
        this.fZ = true;
        if (!this.isLocked) {
            this.gi.recycle();
            release();
        }
    }

    @NonNull
    public com.bumptech.glide.util.a.c aK() {
        return this.et;
    }
}
