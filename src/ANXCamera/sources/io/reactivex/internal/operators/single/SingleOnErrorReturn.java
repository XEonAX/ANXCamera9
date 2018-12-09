package io.reactivex.internal.operators.single;

import io.reactivex.Single;
import io.reactivex.SingleObserver;
import io.reactivex.SingleSource;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.CompositeException;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Function;

public final class SingleOnErrorReturn<T> extends Single<T> {
    final SingleSource<? extends T> source;
    final T value;
    final Function<? super Throwable, ? extends T> valueSupplier;

    final class OnErrorReturn implements SingleObserver<T> {
        private final SingleObserver<? super T> observer;

        OnErrorReturn(SingleObserver<? super T> singleObserver) {
            this.observer = singleObserver;
        }

        public void onError(Throwable th) {
            Object apply;
            Throwable th2;
            if (SingleOnErrorReturn.this.valueSupplier != null) {
                try {
                    apply = SingleOnErrorReturn.this.valueSupplier.apply(th);
                } catch (Throwable th22) {
                    Exceptions.throwIfFatal(th22);
                    this.observer.onError(new CompositeException(th, th22));
                    return;
                }
            }
            apply = SingleOnErrorReturn.this.value;
            if (apply == null) {
                th22 = new NullPointerException("Value supplied was null");
                th22.initCause(th);
                this.observer.onError(th22);
                return;
            }
            this.observer.onSuccess(apply);
        }

        public void onSubscribe(Disposable disposable) {
            this.observer.onSubscribe(disposable);
        }

        public void onSuccess(T t) {
            this.observer.onSuccess(t);
        }
    }

    public SingleOnErrorReturn(SingleSource<? extends T> singleSource, Function<? super Throwable, ? extends T> function, T t) {
        this.source = singleSource;
        this.valueSupplier = function;
        this.value = t;
    }

    protected void subscribeActual(SingleObserver<? super T> singleObserver) {
        this.source.subscribe(new OnErrorReturn(singleObserver));
    }
}
