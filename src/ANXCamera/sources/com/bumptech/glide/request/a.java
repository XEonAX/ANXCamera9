package com.bumptech.glide.request;

import android.support.annotation.Nullable;

/* compiled from: ErrorRequestCoordinator */
public final class a implements c, d {
    @Nullable
    private final d mU;
    private c mV;
    private c mW;

    public a(@Nullable d dVar) {
        this.mU = dVar;
    }

    public void a(c cVar, c cVar2) {
        this.mV = cVar;
        this.mW = cVar2;
    }

    public void begin() {
        if (!this.mV.isRunning()) {
            this.mV.begin();
        }
    }

    public void pause() {
        if (!this.mV.isFailed()) {
            this.mV.pause();
        }
        if (this.mW.isRunning()) {
            this.mW.pause();
        }
    }

    public void clear() {
        this.mV.clear();
        if (this.mW.isRunning()) {
            this.mW.clear();
        }
    }

    public boolean isPaused() {
        return (this.mV.isFailed() ? this.mW : this.mV).isPaused();
    }

    public boolean isRunning() {
        return (this.mV.isFailed() ? this.mW : this.mV).isRunning();
    }

    public boolean isComplete() {
        return (this.mV.isFailed() ? this.mW : this.mV).isComplete();
    }

    public boolean dd() {
        return (this.mV.isFailed() ? this.mW : this.mV).dd();
    }

    public boolean isCancelled() {
        return (this.mV.isFailed() ? this.mW : this.mV).isCancelled();
    }

    public boolean isFailed() {
        return this.mV.isFailed() && this.mW.isFailed();
    }

    public void recycle() {
        this.mV.recycle();
        this.mW.recycle();
    }

    public boolean c(c cVar) {
        boolean z = false;
        if (!(cVar instanceof a)) {
            return false;
        }
        a aVar = (a) cVar;
        if (this.mV.c(aVar.mV) && this.mW.c(aVar.mW)) {
            z = true;
        }
        return z;
    }

    public boolean d(c cVar) {
        return de() && g(cVar);
    }

    private boolean de() {
        return this.mU == null || this.mU.d(this);
    }

    public boolean e(c cVar) {
        return dg() && g(cVar);
    }

    public boolean f(c cVar) {
        return df() && g(cVar);
    }

    private boolean df() {
        return this.mU == null || this.mU.f(this);
    }

    private boolean dg() {
        return this.mU == null || this.mU.e(this);
    }

    private boolean g(c cVar) {
        return cVar.equals(this.mV) || (this.mV.isFailed() && cVar.equals(this.mW));
    }

    public boolean dh() {
        return di() || dd();
    }

    private boolean di() {
        return this.mU != null && this.mU.dh();
    }

    public void h(c cVar) {
        if (this.mU != null) {
            this.mU.h(this);
        }
    }

    public void i(c cVar) {
        if (cVar.equals(this.mW)) {
            if (this.mU != null) {
                this.mU.i(this);
            }
            return;
        }
        if (!this.mW.isRunning()) {
            this.mW.begin();
        }
    }
}
