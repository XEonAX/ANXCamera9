package com.bumptech.glide.util.a;

import android.support.annotation.NonNull;
import android.support.v4.util.Pools.Pool;
import android.support.v4.util.Pools.SimplePool;
import android.support.v4.util.Pools.SynchronizedPool;
import android.util.Log;
import java.util.ArrayList;
import java.util.List;

/* compiled from: FactoryPools */
public final class a {
    private static final int DEFAULT_POOL_SIZE = 20;
    private static final String TAG = "FactoryPools";
    private static final d<Object> px = new d<Object>() {
        public void reset(@NonNull Object obj) {
        }
    };

    /* compiled from: FactoryPools */
    public interface c {
        @NonNull
        c aK();
    }

    /* compiled from: FactoryPools */
    public interface a<T> {
        T create();
    }

    /* compiled from: FactoryPools */
    public interface d<T> {
        void reset(@NonNull T t);
    }

    /* compiled from: FactoryPools */
    private static final class b<T> implements Pool<T> {
        private final Pool<T> eu;
        private final a<T> py;
        private final d<T> pz;

        b(@NonNull Pool<T> pool, @NonNull a<T> aVar, @NonNull d<T> dVar) {
            this.eu = pool;
            this.py = aVar;
            this.pz = dVar;
        }

        public T acquire() {
            T acquire = this.eu.acquire();
            if (acquire == null) {
                acquire = this.py.create();
                if (Log.isLoggable(a.TAG, 2)) {
                    String str = a.TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("Created new ");
                    stringBuilder.append(acquire.getClass());
                    Log.v(str, stringBuilder.toString());
                }
            }
            if (acquire instanceof c) {
                ((c) acquire).aK().m(false);
            }
            return acquire;
        }

        public boolean release(@NonNull T t) {
            if (t instanceof c) {
                ((c) t).aK().m(true);
            }
            this.pz.reset(t);
            return this.eu.release(t);
        }
    }

    private a() {
    }

    @NonNull
    public static <T extends c> Pool<T> a(int i, @NonNull a<T> aVar) {
        return a(new SimplePool(i), (a) aVar);
    }

    @NonNull
    public static <T extends c> Pool<T> b(int i, @NonNull a<T> aVar) {
        return a(new SynchronizedPool(i), (a) aVar);
    }

    @NonNull
    public static <T> Pool<List<T>> eJ() {
        return V(20);
    }

    @NonNull
    public static <T> Pool<List<T>> V(int i) {
        return a(new SynchronizedPool(i), new a<List<T>>() {
            @NonNull
            /* renamed from: eL */
            public List<T> create() {
                return new ArrayList();
            }
        }, new d<List<T>>() {
            /* renamed from: e */
            public void reset(@NonNull List<T> list) {
                list.clear();
            }
        });
    }

    @NonNull
    private static <T extends c> Pool<T> a(@NonNull Pool<T> pool, @NonNull a<T> aVar) {
        return a(pool, aVar, eK());
    }

    @NonNull
    private static <T> Pool<T> a(@NonNull Pool<T> pool, @NonNull a<T> aVar, @NonNull d<T> dVar) {
        return new b(pool, aVar, dVar);
    }

    @NonNull
    private static <T> d<T> eK() {
        return px;
    }
}
