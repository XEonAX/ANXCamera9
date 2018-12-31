package com.bumptech.glide.request;

import android.support.annotation.Nullable;
import android.support.annotation.VisibleForTesting;

/* compiled from: ThumbnailRequestCoordinator */
public class h implements c, d {
    private boolean isRunning;
    @Nullable
    private final d mV;
    private c oo;
    private c oq;

    @VisibleForTesting
    h() {
        this(null);
    }

    public h(@Nullable d dVar) {
        this.mV = dVar;
    }

    public void a(c cVar, c cVar2) {
        this.oo = cVar;
        this.oq = cVar2;
    }

    public boolean d(c cVar) {
        return de() && (cVar.equals(this.oo) || !this.oo.dd());
    }

    private boolean de() {
        return this.mV == null || this.mV.d(this);
    }

    public boolean e(c cVar) {
        return dg() && cVar.equals(this.oo) && !dh();
    }

    public boolean f(c cVar) {
        return df() && cVar.equals(this.oo);
    }

    private boolean df() {
        return this.mV == null || this.mV.f(this);
    }

    private boolean dg() {
        return this.mV == null || this.mV.e(this);
    }

    public boolean dh() {
        return di() || dd();
    }

    public void h(c cVar) {
        if (!cVar.equals(this.oq)) {
            if (this.mV != null) {
                this.mV.h(this);
            }
            if (!this.oq.isComplete()) {
                this.oq.clear();
            }
        }
    }

    public void i(c cVar) {
        if (cVar.equals(this.oo) && this.mV != null) {
            this.mV.i(this);
        }
    }

    private boolean di() {
        return this.mV != null && this.mV.dh();
    }

    public void begin() {
        this.isRunning = true;
        if (!(this.oo.isComplete() || this.oq.isRunning())) {
            this.oq.begin();
        }
        if (this.isRunning && !this.oo.isRunning()) {
            this.oo.begin();
        }
    }

    public void pause() {
        this.isRunning = false;
        this.oo.pause();
        this.oq.pause();
    }

    public void clear() {
        this.isRunning = false;
        this.oq.clear();
        this.oo.clear();
    }

    public boolean isPaused() {
        return this.oo.isPaused();
    }

    public boolean isRunning() {
        return this.oo.isRunning();
    }

    public boolean isComplete() {
        return this.oo.isComplete() || this.oq.isComplete();
    }

    public boolean dd() {
        return this.oo.dd() || this.oq.dd();
    }

    public boolean isCancelled() {
        return this.oo.isCancelled();
    }

    public boolean isFailed() {
        return this.oo.isFailed();
    }

    public void recycle() {
        this.oo.recycle();
        this.oq.recycle();
    }

    public boolean c(c cVar) {
        boolean z = false;
        if (!(cVar instanceof h)) {
            return false;
        }
        h hVar = (h) cVar;
        if (this.oo != null ? !this.oo.c(hVar.oo) : hVar.oo != null) {
            if (this.oq != null ? !this.oq.c(hVar.oq) : hVar.oq != null) {
                z = true;
            }
        }
        return z;
    }
}
