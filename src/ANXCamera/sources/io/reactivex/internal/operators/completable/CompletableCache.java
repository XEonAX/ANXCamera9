package io.reactivex.internal.operators.completable;

import io.reactivex.Completable;
import io.reactivex.CompletableObserver;
import io.reactivex.CompletableSource;
import io.reactivex.annotations.Experimental;
import io.reactivex.disposables.Disposable;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;

@Experimental
public final class CompletableCache extends Completable implements CompletableObserver {
    static final InnerCompletableCache[] EMPTY = new InnerCompletableCache[0];
    static final InnerCompletableCache[] TERMINATED = new InnerCompletableCache[0];
    Throwable error;
    final AtomicReference<InnerCompletableCache[]> observers = new AtomicReference(EMPTY);
    final AtomicBoolean once = new AtomicBoolean();
    final CompletableSource source;

    final class InnerCompletableCache extends AtomicBoolean implements Disposable {
        private static final long serialVersionUID = 8943152917179642732L;
        final CompletableObserver actual;

        InnerCompletableCache(CompletableObserver completableObserver) {
            this.actual = completableObserver;
        }

        public boolean isDisposed() {
            return get();
        }

        public void dispose() {
            if (compareAndSet(false, true)) {
                CompletableCache.this.remove(this);
            }
        }
    }

    public CompletableCache(CompletableSource completableSource) {
        this.source = completableSource;
    }

    protected void subscribeActual(CompletableObserver completableObserver) {
        InnerCompletableCache innerCompletableCache = new InnerCompletableCache(completableObserver);
        completableObserver.onSubscribe(innerCompletableCache);
        if (add(innerCompletableCache)) {
            if (innerCompletableCache.isDisposed()) {
                remove(innerCompletableCache);
            }
            if (this.once.compareAndSet(false, true)) {
                this.source.subscribe(this);
                return;
            }
            return;
        }
        Throwable th = this.error;
        if (th != null) {
            completableObserver.onError(th);
        } else {
            completableObserver.onComplete();
        }
    }

    public void onSubscribe(Disposable disposable) {
    }

    public void onError(Throwable th) {
        this.error = th;
        for (InnerCompletableCache innerCompletableCache : (InnerCompletableCache[]) this.observers.getAndSet(TERMINATED)) {
            if (!innerCompletableCache.get()) {
                innerCompletableCache.actual.onError(th);
            }
        }
    }

    public void onComplete() {
        for (InnerCompletableCache innerCompletableCache : (InnerCompletableCache[]) this.observers.getAndSet(TERMINATED)) {
            if (!innerCompletableCache.get()) {
                innerCompletableCache.actual.onComplete();
            }
        }
    }

    boolean add(InnerCompletableCache innerCompletableCache) {
        while (true) {
            InnerCompletableCache[] innerCompletableCacheArr = (InnerCompletableCache[]) this.observers.get();
            if (innerCompletableCacheArr == TERMINATED) {
                return false;
            }
            int length = innerCompletableCacheArr.length;
            Object obj = new InnerCompletableCache[(length + 1)];
            System.arraycopy(innerCompletableCacheArr, 0, obj, 0, length);
            obj[length] = innerCompletableCache;
            if (this.observers.compareAndSet(innerCompletableCacheArr, obj)) {
                return true;
            }
        }
    }

    void remove(InnerCompletableCache innerCompletableCache) {
        while (true) {
            InnerCompletableCache[] innerCompletableCacheArr = (InnerCompletableCache[]) this.observers.get();
            int length = innerCompletableCacheArr.length;
            if (length != 0) {
                int i = -1;
                for (int i2 = 0; i2 < length; i2++) {
                    if (innerCompletableCacheArr[i2] == innerCompletableCache) {
                        i = i2;
                        break;
                    }
                }
                if (i >= 0) {
                    Object obj;
                    if (length == 1) {
                        obj = EMPTY;
                    } else {
                        Object obj2 = new InnerCompletableCache[(length - 1)];
                        System.arraycopy(innerCompletableCacheArr, 0, obj2, 0, i);
                        System.arraycopy(innerCompletableCacheArr, i + 1, obj2, i, (length - i) - 1);
                        obj = obj2;
                    }
                    if (this.observers.compareAndSet(innerCompletableCacheArr, obj)) {
                        return;
                    }
                } else {
                    return;
                }
            }
            return;
        }
    }
}
