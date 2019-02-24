package com.bumptech.glide;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.util.ArrayMap;
import com.bumptech.glide.load.engine.Engine;
import com.bumptech.glide.load.engine.a.h;
import com.bumptech.glide.load.engine.a.j;
import com.bumptech.glide.load.engine.a.l;
import com.bumptech.glide.load.engine.b.a;
import com.bumptech.glide.load.engine.bitmap_recycle.b;
import com.bumptech.glide.load.engine.bitmap_recycle.e;
import com.bumptech.glide.load.engine.bitmap_recycle.i;
import com.bumptech.glide.request.f;
import java.util.Map;

/* compiled from: GlideBuilder */
public final class d {
    private com.bumptech.glide.manager.d C;
    private final Map<Class<?>, j<?, ?>> F = new ArrayMap();
    private a H;
    private a I;
    private com.bumptech.glide.load.engine.a.a.a J;
    private l K;
    private f L = new f();
    @Nullable
    private com.bumptech.glide.manager.l.a Q;
    private a S;
    private boolean T;
    private Engine h;
    private com.bumptech.glide.load.engine.bitmap_recycle.d i;
    private j k;
    private int logLevel = 4;
    private b v;

    @NonNull
    public d a(@Nullable com.bumptech.glide.load.engine.bitmap_recycle.d dVar) {
        this.i = dVar;
        return this;
    }

    @NonNull
    public d a(@Nullable b bVar) {
        this.v = bVar;
        return this;
    }

    @NonNull
    public d a(@Nullable j jVar) {
        this.k = jVar;
        return this;
    }

    @NonNull
    public d a(@Nullable com.bumptech.glide.load.engine.a.a.a aVar) {
        this.J = aVar;
        return this;
    }

    @Deprecated
    public d a(@Nullable a aVar) {
        return b(aVar);
    }

    @NonNull
    public d b(@Nullable a aVar) {
        this.H = aVar;
        return this;
    }

    @NonNull
    public d c(@Nullable a aVar) {
        this.I = aVar;
        return this;
    }

    @NonNull
    public d d(@Nullable a aVar) {
        this.S = aVar;
        return this;
    }

    @NonNull
    public d a(@Nullable f fVar) {
        this.L = fVar;
        return this;
    }

    @NonNull
    public <T> d a(@NonNull Class<T> cls, @Nullable j<?, T> jVar) {
        this.F.put(cls, jVar);
        return this;
    }

    @NonNull
    public d a(@NonNull l.a aVar) {
        return a(aVar.bD());
    }

    @NonNull
    public d a(@Nullable l lVar) {
        this.K = lVar;
        return this;
    }

    @NonNull
    public d a(@Nullable com.bumptech.glide.manager.d dVar) {
        this.C = dVar;
        return this;
    }

    @NonNull
    public d b(int i) {
        if (i < 2 || i > 6) {
            throw new IllegalArgumentException("Log level must be one of Log.VERBOSE, Log.DEBUG, Log.INFO, Log.WARN, or Log.ERROR");
        }
        this.logLevel = i;
        return this;
    }

    @NonNull
    public d a(boolean z) {
        this.T = z;
        return this;
    }

    void a(@Nullable com.bumptech.glide.manager.l.a aVar) {
        this.Q = aVar;
    }

    d a(Engine engine) {
        this.h = engine;
        return this;
    }

    @NonNull
    c g(@NonNull Context context) {
        if (this.H == null) {
            this.H = a.bI();
        }
        if (this.I == null) {
            this.I = a.bH();
        }
        if (this.S == null) {
            this.S = a.bK();
        }
        if (this.K == null) {
            this.K = new l.a(context).bD();
        }
        if (this.C == null) {
            this.C = new com.bumptech.glide.manager.f();
        }
        if (this.i == null) {
            int bB = this.K.bB();
            if (bB > 0) {
                this.i = new com.bumptech.glide.load.engine.bitmap_recycle.j((long) bB);
            } else {
                this.i = new e();
            }
        }
        if (this.v == null) {
            this.v = new i(this.K.bC());
        }
        if (this.k == null) {
            this.k = new com.bumptech.glide.load.engine.a.i((long) this.K.bA());
        }
        if (this.J == null) {
            this.J = new h(context);
        }
        if (this.h == null) {
            this.h = new Engine(this.k, this.J, this.I, this.H, a.bJ(), a.bK(), this.T);
        }
        return new c(context, this.h, this.k, this.i, this.v, new com.bumptech.glide.manager.l(this.Q), this.C, this.logLevel, this.L.dF(), this.F);
    }
}
