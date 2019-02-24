package com.bumptech.glide.load.a;

import android.support.annotation.NonNull;
import com.bumptech.glide.util.i;
import java.util.HashMap;
import java.util.Map;

/* compiled from: DataRewinderRegistry */
public class f {
    private static final com.bumptech.glide.load.a.e.a<?> de = new com.bumptech.glide.load.a.e.a<Object>() {
        @NonNull
        public e<Object> j(@NonNull Object obj) {
            return new a(obj);
        }

        @NonNull
        public Class<Object> ad() {
            throw new UnsupportedOperationException("Not implemented");
        }
    };
    private final Map<Class<?>, com.bumptech.glide.load.a.e.a<?>> dd = new HashMap();

    /* compiled from: DataRewinderRegistry */
    private static final class a implements e<Object> {
        private final Object data;

        a(@NonNull Object obj) {
            this.data = obj;
        }

        @NonNull
        public Object ag() {
            return this.data;
        }

        public void cleanup() {
        }
    }

    public synchronized void b(@NonNull com.bumptech.glide.load.a.e.a<?> aVar) {
        this.dd.put(aVar.ad(), aVar);
    }

    @NonNull
    public synchronized <T> e<T> j(@NonNull T t) {
        com.bumptech.glide.load.a.e.a aVar;
        i.checkNotNull(t);
        aVar = (com.bumptech.glide.load.a.e.a) this.dd.get(t.getClass());
        if (aVar == null) {
            for (com.bumptech.glide.load.a.e.a aVar2 : this.dd.values()) {
                if (aVar2.ad().isAssignableFrom(t.getClass())) {
                    aVar = aVar2;
                    break;
                }
            }
        }
        if (aVar == null) {
            aVar = de;
        }
        return aVar.j(t);
    }
}
