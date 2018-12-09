package com.bumptech.glide.load.engine.a;

import android.annotation.SuppressLint;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.bumptech.glide.load.c;
import com.bumptech.glide.load.engine.a.j.a;
import com.bumptech.glide.load.engine.p;
import com.bumptech.glide.util.f;

/* compiled from: LruResourceCache */
public class i extends f<c, p<?>> implements j {
    private a hw;

    @Nullable
    public /* synthetic */ p b(@NonNull c cVar, @Nullable p pVar) {
        return (p) super.put(cVar, pVar);
    }

    @Nullable
    public /* synthetic */ p g(@NonNull c cVar) {
        return (p) super.remove(cVar);
    }

    public i(long j) {
        super(j);
    }

    public void a(@NonNull a aVar) {
        this.hw = aVar;
    }

    protected void a(@NonNull c cVar, @Nullable p<?> pVar) {
        if (this.hw != null && pVar != null) {
            this.hw.e(pVar);
        }
    }

    /* renamed from: i */
    protected int n(@Nullable p<?> pVar) {
        if (pVar == null) {
            return super.n(null);
        }
        return pVar.getSize();
    }

    @SuppressLint({"InlinedApi"})
    public void trimMemory(int i) {
        if (i >= 40) {
            i();
        } else if (i >= 20 || i == 15) {
            a(getMaxSize() / 2);
        }
    }
}
