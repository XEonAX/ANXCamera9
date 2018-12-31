package com.bumptech.glide.load.engine.a;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.bumptech.glide.load.c;
import com.bumptech.glide.load.engine.a.j.a;
import com.bumptech.glide.load.engine.p;

/* compiled from: MemoryCacheAdapter */
public class k implements j {
    private a hw;

    public long bz() {
        return 0;
    }

    public long getMaxSize() {
        return 0;
    }

    public void b(float f) {
    }

    @Nullable
    public p<?> g(@NonNull c cVar) {
        return null;
    }

    @Nullable
    public p<?> b(@NonNull c cVar, @Nullable p<?> pVar) {
        if (pVar != null) {
            this.hw.e(pVar);
        }
        return null;
    }

    public void a(@NonNull a aVar) {
        this.hw = aVar;
    }

    public void i() {
    }

    public void trimMemory(int i) {
    }
}
