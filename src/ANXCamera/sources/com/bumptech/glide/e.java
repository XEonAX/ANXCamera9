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
    private final Map<Class<?>, j<?, ?>> E;
    private final f K;
    private final Handler T = new Handler(Looper.getMainLooper());
    private final i U;
    private final Engine h;
    private final int logLevel;
    private final Registry q;
    private final b r;

    public e(@NonNull Context context, @NonNull b bVar, @NonNull Registry registry, @NonNull i iVar, @NonNull f fVar, @NonNull Map<Class<?>, j<?, ?>> map, @NonNull Engine engine, int i) {
        super(context.getApplicationContext());
        this.r = bVar;
        this.q = registry;
        this.U = iVar;
        this.K = fVar;
        this.E = map;
        this.h = engine;
        this.logLevel = i;
    }

    public f m() {
        return this.K;
    }

    @NonNull
    public <T> j<?, T> a(@NonNull Class<T> cls) {
        j<?, T> jVar = (j) this.E.get(cls);
        if (jVar == null) {
            for (Entry entry : this.E.entrySet()) {
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
        return this.U.b(imageView, cls);
    }

    @NonNull
    public Handler n() {
        return this.T;
    }

    @NonNull
    public Engine o() {
        return this.h;
    }

    @NonNull
    public Registry l() {
        return this.q;
    }

    public int getLogLevel() {
        return this.logLevel;
    }

    @NonNull
    public b f() {
        return this.r;
    }
}
