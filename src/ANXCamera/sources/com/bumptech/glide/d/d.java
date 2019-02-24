package com.bumptech.glide.d;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.util.ArrayMap;
import com.bumptech.glide.util.h;
import java.util.List;
import java.util.concurrent.atomic.AtomicReference;

/* compiled from: ModelToResourceClassCache */
public class d {
    private final AtomicReference<h> mQ = new AtomicReference();
    private final ArrayMap<h, List<Class<?>>> mR = new ArrayMap();

    @Nullable
    public List<Class<?>> g(@NonNull Class<?> cls, @NonNull Class<?> cls2) {
        List<Class<?>> list;
        Object obj = (h) this.mQ.getAndSet(null);
        if (obj == null) {
            obj = new h(cls, cls2);
        } else {
            obj.j(cls, cls2);
        }
        synchronized (this.mR) {
            list = (List) this.mR.get(obj);
        }
        this.mQ.set(obj);
        return list;
    }

    public void a(@NonNull Class<?> cls, @NonNull Class<?> cls2, @NonNull List<Class<?>> list) {
        synchronized (this.mR) {
            this.mR.put(new h(cls, cls2), list);
        }
    }

    public void clear() {
        synchronized (this.mR) {
            this.mR.clear();
        }
    }
}
