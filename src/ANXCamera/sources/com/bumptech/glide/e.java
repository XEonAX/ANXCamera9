package com.bumptech.glide;

import android.content.Context;
import android.content.ContextWrapper;
import android.os.Handler;
import android.os.Looper;
import android.support.annotation.NonNull;
import android.support.annotation.VisibleForTesting;
import android.widget.ImageView;
import com.bumptech.glide.load.engine.Engine;
import com.bumptech.glide.load.engine.bitmap_recycle.b;
import com.bumptech.glide.request.f;
import com.bumptech.glide.request.target.ViewTarget;
import com.bumptech.glide.request.target.i;
import java.util.Map;
import java.util.Map.Entry;

/* compiled from: GlideContext */
public class e extends ContextWrapper {
    @VisibleForTesting
    static final j<?, ?> DEFAULT_TRANSITION_OPTIONS = new b();
    private final Map<Class<?>, j<?, ?>> F;
    private final f L;
    private final Handler U = new Handler(Looper.getMainLooper());
    private final i V;
    private final Engine h;
    private final int logLevel;
    private final Registry r;
    private final b v;

    public e(@NonNull Context context, @NonNull b bVar, @NonNull Registry registry, @NonNull i iVar, @NonNull f fVar, @NonNull Map<Class<?>, j<?, ?>> map, @NonNull Engine engine, int i) {
        super(context.getApplicationContext());
        this.v = bVar;
        this.r = registry;
        this.V = iVar;
        this.L = fVar;
        this.F = map;
        this.h = engine;
        this.logLevel = i;
    }

    public f m() {
        return this.L;
    }

    @NonNull
    public <T> j<?, T> a(@NonNull Class<T> cls) {
        j<?, T> jVar = (j) this.F.get(cls);
        if (jVar == null) {
            for (Entry entry : this.F.entrySet()) {
                if (((Class) entry.getKey()).isAssignableFrom(cls)) {
                    jVar = (j) entry.getValue();
                }
            }
        }
        if (jVar == null) {
            return DEFAULT_TRANSITION_OPTIONS;
        }
        return jVar;
    }

    @NonNull
    public <X> ViewTarget<ImageView, X> a(@NonNull ImageView imageView, @NonNull Class<X> cls) {
        return this.V.b(imageView, cls);
    }

    @NonNull
    public Handler n() {
        return this.U;
    }

    @NonNull
    public Engine o() {
        return this.h;
    }

    @NonNull
    public Registry l() {
        return this.r;
    }

    public int getLogLevel() {
        return this.logLevel;
    }

    @NonNull
    public b f() {
        return this.v;
    }
}
