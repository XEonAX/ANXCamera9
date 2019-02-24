package com.bumptech.glide.request;

import android.support.annotation.Nullable;
import android.support.annotation.VisibleForTesting;

/* compiled from: ThumbnailRequestCoordinator */
public class h implements c, d {
    private boolean isRunning;
    @Nullable
    private final d mU;
    private c on;
    private c oo;

    @VisibleForTesting
    h() {
        this(null);
    }

    public h(@Nullable d dVar) {
        this.mU = dVar;
    }

    public void a(c cVar, c cVar2) {
        this.on = cVar;
        this.oo = cVar2;
    }

    public boolean d(c cVar) {
        return de() && (cVar.equals(this.on) || !this.on.dd());
    }

    private boolean de() {
        return this.mU == null || this.mU.d(this);
    }

    public boolean e(c cVar) {
        return dg() && cVar.equals(this.on) && !dh();
    }

    public boolean f(c cVar) {
        return df() && cVar.equals(this.on);
    }

    private boolean df() {
        return this.mU == null || this.mU.f(this);
    }

    private boolean dg() {
        return this.mU == null || this.mU.e(this);
    }

    public boolean dh() {
        return di() || dd();
    }

    public void h(c cVar) {
        if (!cVar.equals(this.oo)) {
            if (this.mU != null) {
                this.mU.h(this);
            }
            if (!this.oo.isComplete()) {
                this.oo.clear();
            }
        }
    }

    public void i(c cVar) {
        if (cVar.equals(this.on) && this.mU != null) {
            this.mU.i(this);
        }
    }

    private boolean di() {
        return this.mU != null && this.mU.dh();
    }

    public void begin() {
        this.isRunning = true;
        if (!(this.on.isComplete() || this.oo.isRunning())) {
            this.oo.begin();
        }
        if (this.isRunning && !this.on.isRunning()) {
            this.on.begin();
        }
    }

    public void pause() {
        this.isRunning = false;
        this.on.pause();
        this.oo.pause();
    }

    public void clear() {
        this.isRunning = false;
        this.oo.clear();
        this.on.clear();
    }

    public boolean isPaused() {
        return this.on.isPaused();
    }

    public boolean isRunning() {
        return this.on.isRunning();
    }

    public boolean isComplete() {
        return this.on.isComplete() || this.oo.isComplete();
    }

    public boolean dd() {
        return this.on.dd() || this.oo.dd();
    }

    public boolean isCancelled() {
        return this.on.isCancelled();
    }

    public boolean isFailed() {
        return this.on.isFailed();
    }

    public void recycle() {
        this.on.recycle();
        this.oo.recycle();
    }

    public boolean c(c cVar) {
        boolean z = false;
        if (!(cVar instanceof h)) {
            return false;
        }
        h hVar = (h) cVar;
        if (this.on != null ? !this.on.c(hVar.on) : hVar.on != null) {
            if (this.oo != null ? !this.oo.c(hVar.oo) : hVar.oo != null) {
                z = true;
            }
        }
        return z;
    }
}
