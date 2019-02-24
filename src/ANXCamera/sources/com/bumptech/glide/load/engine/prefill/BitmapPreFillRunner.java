package com.bumptech.glide.load.engine.prefill;

import android.graphics.Bitmap;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.support.annotation.NonNull;
import android.support.annotation.VisibleForTesting;
import android.util.Log;
import com.bumptech.glide.load.c;
import com.bumptech.glide.load.engine.a.j;
import com.bumptech.glide.load.engine.bitmap_recycle.d;
import com.bumptech.glide.load.resource.bitmap.f;
import com.bumptech.glide.util.k;
import java.security.MessageDigest;
import java.util.HashSet;
import java.util.Set;
import java.util.concurrent.TimeUnit;

final class BitmapPreFillRunner implements Runnable {
    static final long INITIAL_BACKOFF_MS = 40;
    static final long MAX_DURATION_MS = 32;
    @VisibleForTesting
    static final String TAG = "PreFillRunner";
    private static final Clock io = new Clock();
    static final int ip = 4;
    static final long iq = TimeUnit.SECONDS.toMillis(1);
    private boolean dq;
    private final Handler handler;
    private final d i;
    private final b ir;
    private final Clock iu;
    private final Set<c> iv;
    private long iz;
    private final j k;

    @VisibleForTesting
    static class Clock {
        Clock() {
        }

        long now() {
            return SystemClock.currentThreadTimeMillis();
        }
    }

    private static final class a implements c {
        a() {
        }

        public void updateDiskCacheKey(@NonNull MessageDigest messageDigest) {
            throw new UnsupportedOperationException();
        }
    }

    public BitmapPreFillRunner(d dVar, j jVar, b bVar) {
        this(dVar, jVar, bVar, io, new Handler(Looper.getMainLooper()));
    }

    @VisibleForTesting
    BitmapPreFillRunner(d dVar, j jVar, b bVar, Clock clock, Handler handler) {
        this.iv = new HashSet();
        this.iz = INITIAL_BACKOFF_MS;
        this.i = dVar;
        this.k = jVar;
        this.ir = bVar;
        this.iu = clock;
        this.handler = handler;
    }

    public void cancel() {
        this.dq = true;
    }

    @VisibleForTesting
    boolean allocate() {
        long now = this.iu.now();
        while (!this.ir.isEmpty() && !b(now)) {
            Bitmap createBitmap;
            c bP = this.ir.bP();
            if (this.iv.contains(bP)) {
                createBitmap = Bitmap.createBitmap(bP.getWidth(), bP.getHeight(), bP.getConfig());
            } else {
                this.iv.add(bP);
                createBitmap = this.i.g(bP.getWidth(), bP.getHeight(), bP.getConfig());
            }
            int p = k.p(createBitmap);
            if (bN() >= ((long) p)) {
                this.k.b(new a(), f.a(createBitmap, this.i));
            } else {
                this.i.d(createBitmap);
            }
            if (Log.isLoggable(TAG, 3)) {
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("allocated [");
                stringBuilder.append(bP.getWidth());
                stringBuilder.append("x");
                stringBuilder.append(bP.getHeight());
                stringBuilder.append("] ");
                stringBuilder.append(bP.getConfig());
                stringBuilder.append(" size: ");
                stringBuilder.append(p);
                Log.d(str, stringBuilder.toString());
            }
        }
        return (this.dq || this.ir.isEmpty()) ? false : true;
    }

    private boolean b(long j) {
        return this.iu.now() - j >= 32;
    }

    private long bN() {
        return this.k.getMaxSize() - this.k.bz();
    }

    public void run() {
        if (allocate()) {
            this.handler.postDelayed(this, bO());
        }
    }

    private long bO() {
        long j = this.iz;
        this.iz = Math.min(this.iz * 4, iq);
        return j;
    }
}
