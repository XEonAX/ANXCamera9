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
    private static final Waiter na = new Waiter();
    private final Handler T;
    private boolean dp;
    @Nullable
    private GlideException fS;
    private final int height;
    private final boolean nb;
    private final Waiter nc;
    @Nullable
    private c nd;
    private boolean ne;
    private boolean nf;
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
        this(handler, i, i2, true, na);
    }

    RequestFutureTarget(Handler handler, int i, int i2, boolean z, Waiter waiter) {
        this.T = handler;
        this.width = i;
        this.height = i2;
        this.nb = z;
        this.nc = waiter;
    }

    /* JADX WARNING: Missing block: B:13:0x0018, code:
            return true;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized boolean cancel(boolean z) {
        if (isDone()) {
            return false;
        }
        this.dp = true;
        this.nc.r(this);
        if (z) {
            dk();
        }
    }

    public synchronized boolean isCancelled() {
        return this.dp;
    }

    public synchronized boolean isDone() {
        boolean z;
        z = this.dp || this.ne || this.nf;
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
        this.nd = cVar;
    }

    @Nullable
    public c dj() {
        return this.nd;
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
        if (this.nb && !isDone()) {
            k.eG();
        }
        if (this.dp) {
            throw new CancellationException();
        } else if (this.nf) {
            throw new ExecutionException(this.fS);
        } else if (this.ne) {
            return this.resource;
        } else {
            if (l == null) {
                this.nc.a(this, 0);
            } else if (l.longValue() > 0) {
                long currentTimeMillis = System.currentTimeMillis();
                long longValue = l.longValue() + currentTimeMillis;
                while (!isDone() && currentTimeMillis < longValue) {
                    this.nc.a(this, longValue - currentTimeMillis);
                    currentTimeMillis = System.currentTimeMillis();
                }
            }
            if (Thread.interrupted()) {
                throw new InterruptedException();
            } else if (this.nf) {
                throw new ExecutionException(this.fS);
            } else if (this.dp) {
                throw new CancellationException();
            } else if (this.ne) {
                return this.resource;
            } else {
                throw new TimeoutException();
            }
        }
    }

    public void run() {
        if (this.nd != null) {
            this.nd.clear();
            this.nd = null;
        }
    }

    private void dk() {
        this.T.post(this);
    }

    public void onStart() {
    }

    public void onStop() {
    }

    public void onDestroy() {
    }

    public synchronized boolean a(@Nullable GlideException glideException, Object obj, n<R> nVar, boolean z) {
        this.nf = true;
        this.fS = glideException;
        this.nc.r(this);
        return false;
    }

    public synchronized boolean a(R r, Object obj, n<R> nVar, DataSource dataSource, boolean z) {
        this.ne = true;
        this.resource = r;
        this.nc.r(this);
        return false;
    }
}
