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
    private com.bumptech.glide.manager.d A;
    private final Map<Class<?>, j<?, ?>> E = new ArrayMap();
    private a F;
    private a H;
    private com.bumptech.glide.load.engine.a.a.a I;
    private l J;
    private f K = new f();
    @Nullable
    private com.bumptech.glide.manager.l.a L;
    private a Q;
    private boolean S;
    private Engine h;
    private com.bumptech.glide.load.engine.bitmap_recycle.d i;
    private j k;
    private int logLevel = 4;
    private b r;

    @NonNull
    public d a(@Nullable com.bumptech.glide.load.engine.bitmap_recycle.d dVar) {
        this.i = dVar;
        return this;
    }

    @NonNull
    public d a(@Nullable b bVar) {
        this.r = bVar;
        return this;
    }

    @NonNull
    public d a(@Nullable j jVar) {
        this.k = jVar;
        return this;
    }

    @NonNull
    public d a(@Nullable com.bumptech.glide.load.engine.a.a.a aVar) {
        this.I = aVar;
        return this;
    }

    @Deprecated
    public d a(@Nullable a aVar) {
        return b(aVar);
    }

    @NonNull
    public d b(@Nullable a aVar) {
        this.F = aVar;
        return this;
    }

    @NonNull
    public d c(@Nullable a aVar) {
        this.H = aVar;
        return this;
    }

    @NonNull
    public d d(@Nullable a aVar) {
        this.Q = aVar;
        return this;
    }

    @NonNull
    public d a(@Nullable f fVar) {
        this.K = fVar;
        return this;
    }

    @NonNull
    public <T> d a(@NonNull Class<T> cls, @Nullable j<?, T> jVar) {
        this.E.put(cls, jVar);
        return this;
    }

    @NonNull
    public d a(@NonNull l.a aVar) {
        return a(aVar.bD());
    }

    @NonNull
    public d a(@Nullable l lVar) {
        this.J = lVar;
        return this;
    }

    @NonNull
    public d a(@Nullable com.bumptech.glide.manager.d dVar) {
        this.A = dVar;
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
        this.S = z;
        return this;
    }

    void a(@Nullable com.bumptech.glide.manager.l.a aVar) {
        this.L = aVar;
    }

    d a(Engine engine) {
        this.h = engine;
        return this;
    }

    @NonNull
    c g(@NonNull Context context) {
        if (this.F == null) {
            this.F = a.bI();
        }
        if (this.H == null) {
            this.H = a.bH();
        }
        if (this.Q == null) {
            this.Q = a.bK();
        }
        if (this.J == null) {
            this.J = new l.a(context).bD();
        }
        if (this.A == null) {
            this.A = new com.bumptech.glide.manager.f();
        }
        if (this.i == null) {
            int bB = this.J.bB();
            if (bB > 0) {
                this.i = new com.bumptech.glide.load.engine.bitmap_recycle.j((long) bB);
            } else {
                this.i = new e();
            }
        }
        if (this.r == null) {
            this.r = new i(this.J.bC());
        }
        if (this.k == null) {
            this.k = new com.bumptech.glide.load.engine.a.i((long) this.J.bA());
        }
        if (this.I == null) {
            this.I = new h(context);
        }
        if (this.h == null) {
            this.h = new Engine(this.k, this.I, this.H, this.F, a.bJ(), a.bK(), this.S);
        }
        return new c(context, this.h, this.k, this.i, this.r, new com.bumptech.glide.manager.l(this.L), this.A, this.logLevel, this.K.dF(), this.E);
    }
}
