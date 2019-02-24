package com.bumptech.glide.load.model;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.VisibleForTesting;
import android.support.v4.util.Pools.Pool;
import com.bumptech.glide.Registry.NoModelLoaderAvailableException;
import com.bumptech.glide.load.f;
import com.bumptech.glide.util.i;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

/* compiled from: MultiModelLoaderFactory */
public class q {
    private static final c jy = new c();
    private static final m<Object, Object> jz = new a();
    private final Pool<List<Throwable>> aG;
    private final List<b<?, ?>> jA;
    private final c jB;
    private final Set<b<?, ?>> jC;

    /* compiled from: MultiModelLoaderFactory */
    private static class a implements m<Object, Object> {
        a() {
        }

        @Nullable
        public com.bumptech.glide.load.model.m.a<Object> b(@NonNull Object obj, int i, int i2, @NonNull f fVar) {
            return null;
        }

        public boolean o(@NonNull Object obj) {
            return false;
        }
    }

    /* compiled from: MultiModelLoaderFactory */
    private static class b<Model, Data> {
        final Class<Data> dataClass;
        private final Class<Model> jD;
        final n<? extends Model, ? extends Data> jE;

        public b(@NonNull Class<Model> cls, @NonNull Class<Data> cls2, @NonNull n<? extends Model, ? extends Data> nVar) {
            this.jD = cls;
            this.dataClass = cls2;
            this.jE = nVar;
        }

        public boolean d(@NonNull Class<?> cls, @NonNull Class<?> cls2) {
            return l(cls) && this.dataClass.isAssignableFrom(cls2);
        }

        public boolean l(@NonNull Class<?> cls) {
            return this.jD.isAssignableFrom(cls);
        }
    }

    /* compiled from: MultiModelLoaderFactory */
    static class c {
        c() {
        }

        @NonNull
        public <Model, Data> p<Model, Data> a(@NonNull List<m<Model, Data>> list, @NonNull Pool<List<Throwable>> pool) {
            return new p(list, pool);
        }
    }

    public q(@NonNull Pool<List<Throwable>> pool) {
        this(pool, jy);
    }

    @VisibleForTesting
    q(@NonNull Pool<List<Throwable>> pool, @NonNull c cVar) {
        this.jA = new ArrayList();
        this.jC = new HashSet();
        this.aG = pool;
        this.jB = cVar;
    }

    synchronized <Model, Data> void d(@NonNull Class<Model> cls, @NonNull Class<Data> cls2, @NonNull n<? extends Model, ? extends Data> nVar) {
        a(cls, cls2, nVar, true);
    }

    synchronized <Model, Data> void e(@NonNull Class<Model> cls, @NonNull Class<Data> cls2, @NonNull n<? extends Model, ? extends Data> nVar) {
        a(cls, cls2, nVar, false);
    }

    private <Model, Data> void a(@NonNull Class<Model> cls, @NonNull Class<Data> cls2, @NonNull n<? extends Model, ? extends Data> nVar, boolean z) {
        this.jA.add(z ? this.jA.size() : 0, new b(cls, cls2, nVar));
    }

    @NonNull
    synchronized <Model, Data> List<n<? extends Model, ? extends Data>> g(@NonNull Class<Model> cls, @NonNull Class<Data> cls2, @NonNull n<? extends Model, ? extends Data> nVar) {
        List<n<? extends Model, ? extends Data>> c;
        c = c(cls, cls2);
        d(cls, cls2, nVar);
        return c;
    }

    @NonNull
    synchronized <Model, Data> List<n<? extends Model, ? extends Data>> c(@NonNull Class<Model> cls, @NonNull Class<Data> cls2) {
        List<n<? extends Model, ? extends Data>> arrayList;
        arrayList = new ArrayList();
        Iterator it = this.jA.iterator();
        while (it.hasNext()) {
            b bVar = (b) it.next();
            if (bVar.d(cls, cls2)) {
                it.remove();
                arrayList.add(a(bVar));
            }
        }
        return arrayList;
    }

    @NonNull
    synchronized <Model> List<m<Model, ?>> k(@NonNull Class<Model> cls) {
        List<m<Model, ?>> arrayList;
        try {
            arrayList = new ArrayList();
            for (b bVar : this.jA) {
                if (!this.jC.contains(bVar)) {
                    if (bVar.l(cls)) {
                        this.jC.add(bVar);
                        arrayList.add(b(bVar));
                        this.jC.remove(bVar);
                    }
                }
            }
        } catch (Throwable th) {
            this.jC.clear();
        }
        return arrayList;
    }

    @NonNull
    synchronized List<Class<?>> h(@NonNull Class<?> cls) {
        List<Class<?>> arrayList;
        arrayList = new ArrayList();
        for (b bVar : this.jA) {
            if (!arrayList.contains(bVar.dataClass) && bVar.l(cls)) {
                arrayList.add(bVar.dataClass);
            }
        }
        return arrayList;
    }

    @NonNull
    public synchronized <Model, Data> m<Model, Data> b(@NonNull Class<Model> cls, @NonNull Class<Data> cls2) {
        try {
            List arrayList = new ArrayList();
            int i = 0;
            for (b bVar : this.jA) {
                if (this.jC.contains(bVar)) {
                    i = 1;
                } else if (bVar.d(cls, cls2)) {
                    this.jC.add(bVar);
                    arrayList.add(b(bVar));
                    this.jC.remove(bVar);
                }
            }
            if (arrayList.size() > 1) {
                return this.jB.a(arrayList, this.aG);
            } else if (arrayList.size() == 1) {
                return (m) arrayList.get(0);
            } else if (i != 0) {
                return cc();
            } else {
                throw new NoModelLoaderAvailableException(cls, cls2);
            }
        } catch (Throwable th) {
            this.jC.clear();
        }
    }

    @NonNull
    private <Model, Data> n<Model, Data> a(@NonNull b<?, ?> bVar) {
        return bVar.jE;
    }

    @NonNull
    private <Model, Data> m<Model, Data> b(@NonNull b<?, ?> bVar) {
        return (m) i.checkNotNull(bVar.jE.a(this));
    }

    @NonNull
    private static <Model, Data> m<Model, Data> cc() {
        return jz;
    }
}
