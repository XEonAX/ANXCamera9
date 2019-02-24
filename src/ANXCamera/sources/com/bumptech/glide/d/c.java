package com.bumptech.glide.d;

import android.support.annotation.Nullable;
import android.support.v4.util.ArrayMap;
import com.bumptech.glide.load.engine.f;
import com.bumptech.glide.load.engine.n;
import com.bumptech.glide.load.resource.d.g;
import com.bumptech.glide.util.h;
import java.util.Collections;
import java.util.concurrent.atomic.AtomicReference;

/* compiled from: LoadPathCache */
public class c {
    private static final n<?, ?, ?> mN = new n(Object.class, Object.class, Object.class, Collections.singletonList(new f(Object.class, Object.class, Object.class, Collections.emptyList(), new g(), null)), null);
    private final ArrayMap<h, n<?, ?, ?>> mO = new ArrayMap();
    private final AtomicReference<h> mP = new AtomicReference();

    public boolean a(@Nullable n<?, ?, ?> nVar) {
        return mN.equals(nVar);
    }

    @Nullable
    public <Data, TResource, Transcode> n<Data, TResource, Transcode> d(Class<Data> cls, Class<TResource> cls2, Class<Transcode> cls3) {
        n<Data, TResource, Transcode> nVar;
        h e = e(cls, cls2, cls3);
        synchronized (this.mO) {
            nVar = (n) this.mO.get(e);
        }
        this.mP.set(e);
        return nVar;
    }

    public void a(Class<?> cls, Class<?> cls2, Class<?> cls3, @Nullable n<?, ?, ?> nVar) {
        synchronized (this.mO) {
            Object nVar2;
            ArrayMap arrayMap = this.mO;
            h hVar = new h(cls, cls2, cls3);
            if (nVar2 == null) {
                nVar2 = mN;
            }
            arrayMap.put(hVar, nVar2);
        }
    }

    private h e(Class<?> cls, Class<?> cls2, Class<?> cls3) {
        h hVar = (h) this.mP.getAndSet(null);
        if (hVar == null) {
            hVar = new h();
        }
        hVar.f(cls, cls2, cls3);
        return hVar;
    }
}
