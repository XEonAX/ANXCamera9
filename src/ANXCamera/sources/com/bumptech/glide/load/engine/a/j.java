package com.bumptech.glide.load.engine.a;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.bumptech.glide.load.c;
import com.bumptech.glide.load.engine.p;

/* compiled from: MemoryCache */
public interface j {

    /* compiled from: MemoryCache */
    public interface a {
        void e(@NonNull p<?> pVar);
    }

    void a(@NonNull a aVar);

    @Nullable
    p<?> b(@NonNull c cVar, @Nullable p<?> pVar);

    void b(float f);

    long bz();

    @Nullable
    p<?> g(@NonNull c cVar);

    long getMaxSize();

    void i();

    void trimMemory(int i);
}
