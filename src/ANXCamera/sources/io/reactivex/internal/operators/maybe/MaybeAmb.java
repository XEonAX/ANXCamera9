package io.reactivex.internal.operators.maybe;

import io.reactivex.Maybe;
import io.reactivex.MaybeObserver;
import io.reactivex.MaybeSource;
import io.reactivex.disposables.CompositeDisposable;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.internal.disposables.EmptyDisposable;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.atomic.AtomicBoolean;

public final class MaybeAmb<T> extends Maybe<T> {
    private final MaybeSource<? extends T>[] sources;
    private final Iterable<? extends MaybeSource<? extends T>> sourcesIterable;

    static final class AmbMaybeObserver<T> extends AtomicBoolean implements MaybeObserver<T>, Disposable {
        private static final long serialVersionUID = -7044685185359438206L;
        final MaybeObserver<? super T> actual;
        final CompositeDisposable set = new CompositeDisposable();

        AmbMaybeObserver(MaybeObserver<? super T> maybeObserver) {
            this.actual = maybeObserver;
        }

        public void dispose() {
            if (compareAndSet(false, true)) {
                this.set.dispose();
            }
        }

        public boolean isDisposed() {
            return get();
        }

        public void onSubscribe(Disposable disposable) {
            this.set.add(disposable);
        }

        public void onSuccess(T t) {
            if (compareAndSet(false, true)) {
                this.set.dispose();
                this.actual.onSuccess(t);
            }
        }

        public void onError(Throwable th) {
            if (compareAndSet(false, true)) {
                this.set.dispose();
                this.actual.onError(th);
                return;
            }
            RxJavaPlugins.onError(th);
        }

        public void onComplete() {
            if (compareAndSet(false, true)) {
                this.set.dispose();
                this.actual.onComplete();
            }
        }
    }

    public MaybeAmb(MaybeSource<? extends T>[] maybeSourceArr, Iterable<? extends MaybeSource<? extends T>> iterable) {
        this.sources = maybeSourceArr;
        this.sourcesIterable = iterable;
    }

    protected void subscribeActual(MaybeObserver<? super T> maybeObserver) {
        int i;
        MaybeSource maybeSource;
        Object obj = this.sources;
        int i2 = 0;
        if (obj == null) {
            obj = new MaybeSource[8];
            try {
                i = 0;
                for (MaybeSource maybeSource2 : this.sourcesIterable) {
                    if (maybeSource2 == null) {
                        EmptyDisposable.error(new NullPointerException("One of the sources is null"), (MaybeObserver) maybeObserver);
                        return;
                    }
                    if (i == obj.length) {
                        Object obj2 = new MaybeSource[((i >> 2) + i)];
                        System.arraycopy(obj, 0, obj2, 0, i);
                        obj = obj2;
                    }
                    int i3 = i + 1;
                    obj[i] = maybeSource2;
                    i = i3;
                }
            } catch (Throwable th) {
                Exceptions.throwIfFatal(th);
                EmptyDisposable.error(th, (MaybeObserver) maybeObserver);
                return;
            }
        }
        i = obj.length;
        Object ambMaybeObserver = new AmbMaybeObserver(maybeObserver);
        maybeObserver.onSubscribe(ambMaybeObserver);
        while (i2 < i) {
            maybeSource2 = obj[i2];
            if (!ambMaybeObserver.isDisposed()) {
                if (maybeSource2 == null) {
                    ambMaybeObserver.onError(new NullPointerException("One of the MaybeSources is null"));
                    return;
                } else {
                    maybeSource2.subscribe(ambMaybeObserver);
                    i2++;
                }
            } else {
                return;
            }
        }
        if (i == 0) {
            maybeObserver.onComplete();
        }
    }
}
