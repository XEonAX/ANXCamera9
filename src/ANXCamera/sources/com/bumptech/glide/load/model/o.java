package com.bumptech.glide.load.model;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.util.Pools.Pool;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* compiled from: ModelLoaderRegistry */
public class o {
    private final q jq;
    private final a jr;

    /* compiled from: ModelLoaderRegistry */
    private static class a {
        private final Map<Class<?>, a<?>> js = new HashMap();

        /* compiled from: ModelLoaderRegistry */
        private static class a<Model> {
            final List<m<Model, ?>> jt;

            public a(List<m<Model, ?>> list) {
                this.jt = list;
            }
        }

        a() {
        }

        public void clear() {
            this.js.clear();
        }

        public <Model> void a(Class<Model> cls, List<m<Model, ?>> list) {
            if (((a) this.js.put(cls, new a(list))) != null) {
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("Already cached loaders for model: ");
                stringBuilder.append(cls);
                throw new IllegalStateException(stringBuilder.toString());
            }
        }

        @Nullable
        public <Model> List<m<Model, ?>> j(Class<Model> cls) {
            a aVar = (a) this.js.get(cls);
            return aVar == null ? null : aVar.jt;
        }
    }

    public o(@NonNull Pool<List<Throwable>> pool) {
        this(new q(pool));
    }

    private o(@NonNull q qVar) {
        this.jr = new a();
        this.jq = qVar;
    }

    public synchronized <Model, Data> void d(@NonNull Class<Model> cls, @NonNull Class<Data> cls2, @NonNull n<? extends Model, ? extends Data> nVar) {
        this.jq.d(cls, cls2, nVar);
        this.jr.clear();
    }

    public synchronized <Model, Data> void e(@NonNull Class<Model> cls, @NonNull Class<Data> cls2, @NonNull n<? extends Model, ? extends Data> nVar) {
        this.jq.e(cls, cls2, nVar);
        this.jr.clear();
    }

    public synchronized <Model, Data> void a(@NonNull Class<Model> cls, @NonNull Class<Data> cls2) {
        c(this.jq.c(cls, cls2));
        this.jr.clear();
    }

    public synchronized <Model, Data> void f(@NonNull Class<Model> cls, @NonNull Class<Data> cls2, @NonNull n<? extends Model, ? extends Data> nVar) {
        c(this.jq.g(cls, cls2, nVar));
        this.jr.clear();
    }

    private <Model, Data> void c(@NonNull List<n<? extends Model, ? extends Data>> list) {
        for (n bR : list) {
            bR.bR();
        }
    }

    @NonNull
    public synchronized <A> List<m<A, ?>> d(@NonNull A a) {
        List<m<A, ?>> arrayList;
        List i = i(q(a));
        int size = i.size();
        arrayList = new ArrayList(size);
        for (int i2 = 0; i2 < size; i2++) {
            m mVar = (m) i.get(i2);
            if (mVar.o(a)) {
                arrayList.add(mVar);
            }
        }
        return arrayList;
    }

    public synchronized <Model, Data> m<Model, Data> b(@NonNull Class<Model> cls, @NonNull Class<Data> cls2) {
        return this.jq.b(cls, cls2);
    }

    @NonNull
    public synchronized List<Class<?>> h(@NonNull Class<?> cls) {
        return this.jq.h(cls);
    }

    @NonNull
    private <A> List<m<A, ?>> i(@NonNull Class<A> cls) {
        List<m<A, ?>> j = this.jr.j(cls);
        if (j != null) {
            return j;
        }
        j = Collections.unmodifiableList(this.jq.k(cls));
        this.jr.a(cls, j);
        return j;
    }

    @NonNull
    private static <A> Class<A> q(@NonNull A a) {
        return a.getClass();
    }
}
