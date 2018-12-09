package com.bumptech.glide.request;

import android.support.annotation.Nullable;

/* compiled from: ErrorRequestCoordinator */
public final class a implements c, d {
    @Nullable
    private final d mV;
    private c mW;
    private c mZ;

    public a(@Nullable d dVar) {
        this.mV = dVar;
    }

    public void a(c cVar, c cVar2) {
        this.mW = cVar;
        this.mZ = cVar2;
    }

    public void begin() {
        if (!this.mW.isRunning()) {
            this.mW.begin();
        }
    }

    public void pause() {
        if (!this.mW.isFailed()) {
            this.mW.pause();
        }
        if (this.mZ.isRunning()) {
            this.mZ.pause();
        }
    }

    public void clear() {
        this.mW.clear();
        if (this.mZ.isRunning()) {
            this.mZ.clear();
        }
    }

    public boolean isPaused() {
        return (this.mW.isFailed() ? this.mZ : this.mW).isPaused();
    }

    public boolean isRunning() {
        return (this.mW.isFailed() ? this.mZ : this.mW).isRunning();
    }

    public boolean isComplete() {
        return (this.mW.isFailed() ? this.mZ : this.mW).isComplete();
    }

    public boolean dd() {
        return (this.mW.isFailed() ? this.mZ : this.mW).dd();
    }

    public boolean isCancelled() {
        return (this.mW.isFailed() ? this.mZ : this.mW).isCancelled();
    }

    public boolean isFailed() {
        return this.mW.isFailed() && this.mZ.isFailed();
    }

    public void recycle() {
        this.mW.recycle();
        this.mZ.recycle();
    }

    public boolean c(c cVar) {
        boolean z = false;
        if (!(cVar instanceof a)) {
            return false;
        }
        a aVar = (a) cVar;
        if (this.mW.c(aVar.mW) && this.mZ.c(aVar.mZ)) {
            z = true;
        }
        return z;
    }

    public boolean d(c cVar) {
        return de() && g(cVar);
    }

    private boolean de() {
        return this.mV == null || this.mV.d(this);
    }

    public boolean e(c cVar) {
        return dg() && g(cVar);
    }

    public boolean f(c cVar) {
        return df() && g(cVar);
    }

    private boolean df() {
        return this.mV == null || this.mV.f(this);
    }

    private boolean dg() {
        return this.mV == null || this.mV.e(this);
    }

    private boolean g(c cVar) {
        return cVar.equals(this.mW) || (this.mW.isFailed() && cVar.equals(this.mZ));
    }

    public boolean dh() {
        return di() || dd();
    }

    private boolean di() {
        return this.mV != null && this.mV.dh();
    }

    public void h(c cVar) {
        if (this.mV != null) {
            this.mV.h(this);
        }
    }

    public void i(c cVar) {
        if (cVar.equals(this.mZ)) {
            if (this.mV != null) {
                this.mV.i(this);
            }
            return;
        }
        if (!this.mZ.isRunning()) {
            this.mZ.begin();
        }
    }
}
