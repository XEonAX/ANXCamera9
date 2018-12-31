package io.reactivex.internal.operators.maybe;

import io.reactivex.Maybe;
import io.reactivex.MaybeObserver;
import io.reactivex.MaybeSource;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Function;
import io.reactivex.internal.disposables.EmptyDisposable;
import io.reactivex.internal.functions.ObjectHelper;
import java.util.Arrays;

public final class MaybeZipIterable<T, R> extends Maybe<R> {
    final Iterable<? extends MaybeSource<? extends T>> sources;
    final Function<? super Object[], ? extends R> zipper;

    final class SingletonArrayFunc implements Function<T, R> {
        SingletonArrayFunc() {
        }

        public R apply(T t) throws Exception {
            return ObjectHelper.requireNonNull(MaybeZipIterable.this.zipper.apply(new Object[]{t}), "The zipper returned a null value");
        }
    }

    public MaybeZipIterable(Iterable<? extends MaybeSource<? extends T>> iterable, Function<? super Object[], ? extends R> function) {
        this.sources = iterable;
        this.zipper = function;
    }

    protected void subscribeActual(MaybeObserver<? super R> maybeObserver) {
        MaybeSource[] maybeSourceArr = new MaybeSource[8];
        try {
            int i = 0;
            Object[] objArr = maybeSourceArr;
            int i2 = 0;
            for (MaybeSource maybeSource : this.sources) {
                if (maybeSource == null) {
                    EmptyDisposable.error(new NullPointerException("One of the sources is null"), (MaybeObserver) maybeObserver);
                    return;
                }
                if (i2 == objArr.length) {
                    objArr = (MaybeSource[]) Arrays.copyOf(objArr, (i2 >> 2) + i2);
                }
                int i3 = i2 + 1;
                objArr[i2] = maybeSource;
                i2 = i3;
            }
            if (i2 == 0) {
                EmptyDisposable.complete((MaybeObserver) maybeObserver);
            } else if (i2 == 1) {
                objArr[0].subscribe(new MapMaybeObserver(maybeObserver, new SingletonArrayFunc()));
            } else {
                ZipCoordinator zipCoordinator = new ZipCoordinator(maybeObserver, i2, this.zipper);
                maybeObserver.onSubscribe(zipCoordinator);
                while (i < i2 && !zipCoordinator.isDisposed()) {
                    objArr[i].subscribe(zipCoordinator.observers[i]);
                    i++;
                }
            }
        } catch (Throwable th) {
            Exceptions.throwIfFatal(th);
            EmptyDisposable.error(th, (MaybeObserver) maybeObserver);
        }
    }
}
