package com.bumptech.glide.d;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.bumptech.glide.load.h;
import java.util.ArrayList;
import java.util.List;

/* compiled from: ResourceEncoderRegistry */
public class f {
    private final List<a<?>> mL = new ArrayList();

    /* compiled from: ResourceEncoderRegistry */
    private static final class a<T> {
        final h<T> eQ;
        private final Class<T> ej;

        a(@NonNull Class<T> cls, @NonNull h<T> hVar) {
            this.ej = cls;
            this.eQ = hVar;
        }

        boolean l(@NonNull Class<?> cls) {
            return this.ej.isAssignableFrom(cls);
        }
    }

    public synchronized <Z> void d(@NonNull Class<Z> cls, @NonNull h<Z> hVar) {
        this.mL.add(new a(cls, hVar));
    }

    public synchronized <Z> void e(@NonNull Class<Z> cls, @NonNull h<Z> hVar) {
        this.mL.add(0, new a(cls, hVar));
    }

    @Nullable
    public synchronized <Z> h<Z> n(@NonNull Class<Z> cls) {
        int size = this.mL.size();
        for (int i = 0; i < size; i++) {
            a aVar = (a) this.mL.get(i);
            if (aVar.l(cls)) {
                return aVar.eQ;
            }
        }
        return null;
    }
}
