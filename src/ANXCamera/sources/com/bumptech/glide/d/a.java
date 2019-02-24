package com.bumptech.glide.d;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.util.ArrayList;
import java.util.List;

/* compiled from: EncoderRegistry */
public class a {
    private final List<a<?>> mL = new ArrayList();

    /* compiled from: EncoderRegistry */
    private static final class a<T> {
        private final Class<T> dataClass;
        final com.bumptech.glide.load.a<T> eg;

        a(@NonNull Class<T> cls, @NonNull com.bumptech.glide.load.a<T> aVar) {
            this.dataClass = cls;
            this.eg = aVar;
        }

        boolean l(@NonNull Class<?> cls) {
            return this.dataClass.isAssignableFrom(cls);
        }
    }

    @Nullable
    public synchronized <T> com.bumptech.glide.load.a<T> m(@NonNull Class<T> cls) {
        for (a aVar : this.mL) {
            if (aVar.l(cls)) {
                return aVar.eg;
            }
        }
        return null;
    }

    public synchronized <T> void d(@NonNull Class<T> cls, @NonNull com.bumptech.glide.load.a<T> aVar) {
        this.mL.add(new a(cls, aVar));
    }

    public synchronized <T> void e(@NonNull Class<T> cls, @NonNull com.bumptech.glide.load.a<T> aVar) {
        this.mL.add(0, new a(cls, aVar));
    }
}
