package io.reactivex.internal.operators.maybe;

import io.reactivex.Maybe;
import io.reactivex.MaybeObserver;
import io.reactivex.disposables.Disposable;
import io.reactivex.disposables.Disposables;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.Callable;

public final class MaybeFromCallable<T> extends Maybe<T> implements Callable<T> {
    final Callable<? extends T> callable;

    public MaybeFromCallable(Callable<? extends T> callable) {
        this.callable = callable;
    }

    protected void subscribeActual(MaybeObserver<? super T> maybeObserver) {
        Disposable empty = Disposables.empty();
        maybeObserver.onSubscribe(empty);
        if (!empty.isDisposed()) {
            try {
                Object call = this.callable.call();
                if (!empty.isDisposed()) {
                    if (call == null) {
                        maybeObserver.onComplete();
                    } else {
                        maybeObserver.onSuccess(call);
                    }
                }
            } catch (Throwable th) {
                Exceptions.throwIfFatal(th);
                if (empty.isDisposed()) {
                    RxJavaPlugins.onError(th);
                } else {
                    maybeObserver.onError(th);
                }
            }
        }
    }

    public T call() throws Exception {
        return this.callable.call();
    }
}
