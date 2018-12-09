package io.reactivex.internal.operators.single;

import io.reactivex.Single;
import io.reactivex.SingleObserver;
import io.reactivex.SingleSource;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Function;
import io.reactivex.internal.disposables.EmptyDisposable;
import io.reactivex.internal.functions.ObjectHelper;
import java.util.Arrays;
import java.util.NoSuchElementException;

public final class SingleZipIterable<T, R> extends Single<R> {
    final Iterable<? extends SingleSource<? extends T>> sources;
    final Function<? super Object[], ? extends R> zipper;

    final class SingletonArrayFunc implements Function<T, R> {
        SingletonArrayFunc() {
        }

        public R apply(T t) throws Exception {
            return ObjectHelper.requireNonNull(SingleZipIterable.this.zipper.apply(new Object[]{t}), "The zipper returned a null value");
        }
    }

    public SingleZipIterable(Iterable<? extends SingleSource<? extends T>> iterable, Function<? super Object[], ? extends R> function) {
        this.sources = iterable;
        this.zipper = function;
    }

    protected void subscribeActual(SingleObserver<? super R> singleObserver) {
        SingleSource[] singleSourceArr = new SingleSource[8];
        try {
            int i = 0;
            Object[] objArr = singleSourceArr;
            int i2 = 0;
            for (SingleSource singleSource : this.sources) {
                if (singleSource == null) {
                    EmptyDisposable.error(new NullPointerException("One of the sources is null"), (SingleObserver) singleObserver);
                    return;
                }
                if (i2 == objArr.length) {
                    objArr = (SingleSource[]) Arrays.copyOf(objArr, (i2 >> 2) + i2);
                }
                int i3 = i2 + 1;
                objArr[i2] = singleSource;
                i2 = i3;
            }
            if (i2 == 0) {
                EmptyDisposable.error(new NoSuchElementException(), (SingleObserver) singleObserver);
            } else if (i2 == 1) {
                objArr[0].subscribe(new MapSingleObserver(singleObserver, new SingletonArrayFunc()));
            } else {
                ZipCoordinator zipCoordinator = new ZipCoordinator(singleObserver, i2, this.zipper);
                singleObserver.onSubscribe(zipCoordinator);
                while (i < i2 && !zipCoordinator.isDisposed()) {
                    objArr[i].subscribe(zipCoordinator.observers[i]);
                    i++;
                }
            }
        } catch (Throwable th) {
            Exceptions.throwIfFatal(th);
            EmptyDisposable.error(th, (SingleObserver) singleObserver);
        }
    }
}
