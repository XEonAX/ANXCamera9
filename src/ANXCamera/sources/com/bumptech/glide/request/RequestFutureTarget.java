package com.bumptech.glide.request;

import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.VisibleForTesting;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.engine.GlideException;
import com.bumptech.glide.request.a.f;
import com.bumptech.glide.request.target.m;
import com.bumptech.glide.request.target.n;
import com.bumptech.glide.util.k;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

public class RequestFutureTarget<R> implements b<R>, e<R>, Runnable {
    private static final Waiter mZ = new Waiter();
    private final Handler U;
    private boolean dq;
    @Nullable
    private GlideException fS;
    private final int height;
    private final boolean na;
    private final Waiter nb;
    @Nullable
    private c nc;
    private boolean nd;
    private boolean ne;
    @Nullable
    private R resource;
    private final int width;

    @VisibleForTesting
    static class Waiter {
        Waiter() {
        }

        void a(Object obj, long j) throws InterruptedException {
            obj.wait(j);
        }

        void r(Object obj) {
            obj.notifyAll();
        }
    }

    public RequestFutureTarget(Handler handler, int i, int i2) {
        this(handler, i, i2, true, mZ);
    }

    RequestFutureTarget(Handler handler, int i, int i2, boolean z, Waiter waiter) {
        this.U = handler;
        this.width = i;
        this.height = i2;
        this.na = z;
        this.nb = waiter;
    }

    /* JADX WARNING: Missing block: B:13:0x0018, code:
            return true;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized boolean cancel(boolean z) {
        if (isDone()) {
            return false;
        }
        this.dq = true;
        this.nb.r(this);
        if (z) {
            dk();
        }
    }

    public synchronized boolean isCancelled() {
        return this.dq;
    }

    public synchronized boolean isDone() {
        boolean z;
        z = this.dq || this.nd || this.ne;
        return z;
    }

    public R get() throws InterruptedException, ExecutionException {
        try {
            return doGet(null);
        } catch (TimeoutException e) {
            throw new AssertionError(e);
        }
    }

    public R get(long j, @NonNull TimeUnit timeUnit) throws InterruptedException, ExecutionException, TimeoutException {
        return doGet(Long.valueOf(timeUnit.toMillis(j)));
    }

    public void a(@NonNull m mVar) {
        mVar.m(this.width, this.height);
    }

    public void b(@NonNull m mVar) {
    }

    public void j(@Nullable c cVar) {
        this.nc = cVar;
    }

    @Nullable
    public c dj() {
        return this.nc;
    }

    public void d(@Nullable Drawable drawable) {
    }

    public void e(@Nullable Drawable drawable) {
    }

    public synchronized void f(@Nullable Drawable drawable) {
    }

    public synchronized void a(@NonNull R r, @Nullable f<? super R> fVar) {
    }

    private synchronized R doGet(Long l) throws ExecutionException, InterruptedException, TimeoutException {
        if (this.na && !isDone()) {
            k.eG();
        }
        if (this.dq) {
            throw new CancellationException();
        } else if (this.ne) {
            throw new ExecutionException(this.fS);
        } else if (this.nd) {
            return this.resource;
        } else {
            if (l == null) {
                this.nb.a(this, 0);
            } else if (l.longValue() > 0) {
                long currentTimeMillis = System.currentTimeMillis();
                long longValue = l.longValue() + currentTimeMillis;
                while (!isDone() && currentTimeMillis < longValue) {
                    this.nb.a(this, longValue - currentTimeMillis);
                    currentTimeMillis = System.currentTimeMillis();
                }
            }
            if (Thread.interrupted()) {
                throw new InterruptedException();
            } else if (this.ne) {
                throw new ExecutionException(this.fS);
            } else if (this.dq) {
                throw new CancellationException();
            } else if (this.nd) {
                return this.resource;
            } else {
                throw new TimeoutException();
            }
        }
    }

    public void run() {
        if (this.nc != null) {
            this.nc.clear();
            this.nc = null;
        }
    }

    private void dk() {
        this.U.post(this);
    }

    public void onStart() {
    }

    public void onStop() {
    }

    public void onDestroy() {
    }

    public synchronized boolean a(@Nullable GlideException glideException, Object obj, n<R> nVar, boolean z) {
        this.ne = true;
        this.fS = glideException;
        this.nb.r(this);
        return false;
    }

    public synchronized boolean a(R r, Object obj, n<R> nVar, DataSource dataSource, boolean z) {
        this.nd = true;
        this.resource = r;
        this.nb.r(this);
        return false;
    }
}
