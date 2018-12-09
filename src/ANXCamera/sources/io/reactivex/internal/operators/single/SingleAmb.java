package io.reactivex.internal.operators.single;

import io.reactivex.Single;
import io.reactivex.SingleObserver;
import io.reactivex.SingleSource;
import io.reactivex.disposables.CompositeDisposable;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.internal.disposables.EmptyDisposable;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.atomic.AtomicBoolean;

public final class SingleAmb<T> extends Single<T> {
    private final SingleSource<? extends T>[] sources;
    private final Iterable<? extends SingleSource<? extends T>> sourcesIterable;

    static final class AmbSingleObserver<T> extends AtomicBoolean implements SingleObserver<T> {
        private static final long serialVersionUID = -1944085461036028108L;
        final SingleObserver<? super T> s;
        final CompositeDisposable set;

        AmbSingleObserver(SingleObserver<? super T> singleObserver, CompositeDisposable compositeDisposable) {
            this.s = singleObserver;
            this.set = compositeDisposable;
        }

        public void onSubscribe(Disposable disposable) {
            this.set.add(disposable);
        }

        public void onSuccess(T t) {
            if (compareAndSet(false, true)) {
                this.set.dispose();
                this.s.onSuccess(t);
            }
        }

        public void onError(Throwable th) {
            if (compareAndSet(false, true)) {
                this.set.dispose();
                this.s.onError(th);
                return;
            }
            RxJavaPlugins.onError(th);
        }
    }

    public SingleAmb(SingleSource<? extends T>[] singleSourceArr, Iterable<? extends SingleSource<? extends T>> iterable) {
        this.sources = singleSourceArr;
        this.sourcesIterable = iterable;
    }

    protected void subscribeActual(SingleObserver<? super T> singleObserver) {
        int i;
        int i2;
        Throwable th;
        Object obj = this.sources;
        if (obj == null) {
            obj = new SingleSource[8];
            try {
                i = 0;
                for (SingleSource singleSource : this.sourcesIterable) {
                    if (singleSource == null) {
                        EmptyDisposable.error(new NullPointerException("One of the sources is null"), (SingleObserver) singleObserver);
                        return;
                    }
                    if (i == obj.length) {
                        Object obj2 = new SingleSource[((i >> 2) + i)];
                        System.arraycopy(obj, 0, obj2, 0, i);
                        obj = obj2;
                    }
                    i2 = i + 1;
                    obj[i] = singleSource;
                    i = i2;
                }
            } catch (Throwable th2) {
                Exceptions.throwIfFatal(th2);
                EmptyDisposable.error(th2, (SingleObserver) singleObserver);
                return;
            }
        }
        i = obj.length;
        Object compositeDisposable = new CompositeDisposable();
        Object ambSingleObserver = new AmbSingleObserver(singleObserver, compositeDisposable);
        singleObserver.onSubscribe(compositeDisposable);
        i2 = 0;
        while (i2 < i) {
            SingleSource singleSource2 = obj[i2];
            if (!ambSingleObserver.get()) {
                if (singleSource2 == null) {
                    compositeDisposable.dispose();
                    th2 = new NullPointerException("One of the sources is null");
                    if (ambSingleObserver.compareAndSet(false, true)) {
                        singleObserver.onError(th2);
                    } else {
                        RxJavaPlugins.onError(th2);
                    }
                    return;
                }
                singleSource2.subscribe(ambSingleObserver);
                i2++;
            } else {
                return;
            }
        }
    }
}
