package com.bumptech.glide.load.engine.b;

import android.os.Process;
import android.os.StrictMode;
import android.os.StrictMode.ThreadPolicy.Builder;
import android.support.annotation.NonNull;
import android.support.annotation.VisibleForTesting;
import android.util.Log;
import java.util.Collection;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Future;
import java.util.concurrent.PriorityBlockingQueue;
import java.util.concurrent.SynchronousQueue;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

/* compiled from: GlideExecutor */
public final class a implements ExecutorService {
    private static final String TAG = "GlideExecutor";
    private static final String hQ = "source";
    private static final String hR = "disk-cache";
    private static final int hS = 1;
    private static final String hT = "source-unlimited";
    private static final String hU = "animation";
    private static final long hV = TimeUnit.SECONDS.toMillis(10);
    private static final int hW = 4;
    private static volatile int hX;
    private final ExecutorService hY;

    /* compiled from: GlideExecutor */
    private static final class a implements ThreadFactory {
        private static final int hZ = 9;
        final b ia;
        final boolean ib;
        private int ic;
        private final String name;

        a(String str, b bVar, boolean z) {
            this.name = str;
            this.ia = bVar;
            this.ib = z;
        }

        public synchronized Thread newThread(@NonNull Runnable runnable) {
            Thread anonymousClass1;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("glide-");
            stringBuilder.append(this.name);
            stringBuilder.append("-thread-");
            stringBuilder.append(this.ic);
            anonymousClass1 = new Thread(runnable, stringBuilder.toString()) {
                public void run() {
                    Process.setThreadPriority(9);
                    if (a.this.ib) {
                        StrictMode.setThreadPolicy(new Builder().detectNetwork().penaltyDeath().build());
                    }
                    try {
                        super.run();
                    } catch (Throwable th) {
                        a.this.ia.a(th);
                    }
                }
            };
            this.ic++;
            return anonymousClass1;
        }
    }

    /* compiled from: GlideExecutor */
    public interface b {
        /* renamed from: if */
        public static final b f0if = new b() {
            public void a(Throwable th) {
            }
        };
        public static final b ig = new b() {
            public void a(Throwable th) {
                if (th != null && Log.isLoggable(a.TAG, 6)) {
                    Log.e(a.TAG, "Request threw uncaught throwable", th);
                }
            }
        };
        public static final b ii = new b() {
            public void a(Throwable th) {
                if (th != null) {
                    throw new RuntimeException("Request threw uncaught throwable", th);
                }
            }
        };
        public static final b ij = ig;

        void a(Throwable th);
    }

    public static a bH() {
        return a(1, hR, b.ij);
    }

    public static a a(b bVar) {
        return a(1, hR, bVar);
    }

    public static a a(int i, String str, b bVar) {
        return new a(new ThreadPoolExecutor(i, i, 0, TimeUnit.MILLISECONDS, new PriorityBlockingQueue(), new a(str, bVar, true)));
    }

    public static a bI() {
        return b(bL(), hQ, b.ij);
    }

    public static a b(b bVar) {
        return b(bL(), hQ, bVar);
    }

    public static a b(int i, String str, b bVar) {
        return new a(new ThreadPoolExecutor(i, i, 0, TimeUnit.MILLISECONDS, new PriorityBlockingQueue(), new a(str, bVar, false)));
    }

    public static a bJ() {
        return new a(new ThreadPoolExecutor(0, Integer.MAX_VALUE, hV, TimeUnit.MILLISECONDS, new SynchronousQueue(), new a(hT, b.ij, false)));
    }

    public static a bK() {
        return a(bL() >= 4 ? 2 : 1, b.ij);
    }

    public static a a(int i, b bVar) {
        return new a(new ThreadPoolExecutor(0, i, hV, TimeUnit.MILLISECONDS, new PriorityBlockingQueue(), new a(hU, bVar, true)));
    }

    @VisibleForTesting
    a(ExecutorService executorService) {
        this.hY = executorService;
    }

    public void execute(@NonNull Runnable runnable) {
        this.hY.execute(runnable);
    }

    @NonNull
    public Future<?> submit(@NonNull Runnable runnable) {
        return this.hY.submit(runnable);
    }

    @NonNull
    public <T> List<Future<T>> invokeAll(@NonNull Collection<? extends Callable<T>> collection) throws InterruptedException {
        return this.hY.invokeAll(collection);
    }

    @NonNull
    public <T> List<Future<T>> invokeAll(@NonNull Collection<? extends Callable<T>> collection, long j, @NonNull TimeUnit timeUnit) throws InterruptedException {
        return this.hY.invokeAll(collection, j, timeUnit);
    }

    @NonNull
    public <T> T invokeAny(@NonNull Collection<? extends Callable<T>> collection) throws InterruptedException, ExecutionException {
        return this.hY.invokeAny(collection);
    }

    public <T> T invokeAny(@NonNull Collection<? extends Callable<T>> collection, long j, @NonNull TimeUnit timeUnit) throws InterruptedException, ExecutionException, TimeoutException {
        return this.hY.invokeAny(collection, j, timeUnit);
    }

    @NonNull
    public <T> Future<T> submit(@NonNull Runnable runnable, T t) {
        return this.hY.submit(runnable, t);
    }

    public <T> Future<T> submit(@NonNull Callable<T> callable) {
        return this.hY.submit(callable);
    }

    public void shutdown() {
        this.hY.shutdown();
    }

    @NonNull
    public List<Runnable> shutdownNow() {
        return this.hY.shutdownNow();
    }

    public boolean isShutdown() {
        return this.hY.isShutdown();
    }

    public boolean isTerminated() {
        return this.hY.isTerminated();
    }

    public boolean awaitTermination(long j, @NonNull TimeUnit timeUnit) throws InterruptedException {
        return this.hY.awaitTermination(j, timeUnit);
    }

    public String toString() {
        return this.hY.toString();
    }

    public static int bL() {
        if (hX == 0) {
            hX = Math.min(4, b.availableProcessors());
        }
        return hX;
    }
}
