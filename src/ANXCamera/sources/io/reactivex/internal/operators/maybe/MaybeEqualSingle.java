package io.reactivex.internal.operators.maybe;

import io.reactivex.MaybeObserver;
import io.reactivex.MaybeSource;
import io.reactivex.Single;
import io.reactivex.SingleObserver;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.BiPredicate;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;

public final class MaybeEqualSingle<T> extends Single<Boolean> {
    final BiPredicate<? super T, ? super T> isEqual;
    final MaybeSource<? extends T> source1;
    final MaybeSource<? extends T> source2;

    static final class EqualCoordinator<T> extends AtomicInteger implements Disposable {
        final SingleObserver<? super Boolean> actual;
        final BiPredicate<? super T, ? super T> isEqual;
        final EqualObserver<T> observer1 = new EqualObserver(this);
        final EqualObserver<T> observer2 = new EqualObserver(this);

        EqualCoordinator(SingleObserver<? super Boolean> singleObserver, BiPredicate<? super T, ? super T> biPredicate) {
            super(2);
            this.actual = singleObserver;
            this.isEqual = biPredicate;
        }

        void subscribe(MaybeSource<? extends T> maybeSource, MaybeSource<? extends T> maybeSource2) {
            maybeSource.subscribe(this.observer1);
            maybeSource2.subscribe(this.observer2);
        }

        public void dispose() {
            this.observer1.dispose();
            this.observer2.dispose();
        }

        public boolean isDisposed() {
            return DisposableHelper.isDisposed((Disposable) this.observer1.get());
        }

        void done() {
            if (decrementAndGet() == 0) {
                Object obj = this.observer1.value;
                Object obj2 = this.observer2.value;
                if (obj == null || obj2 == null) {
                    SingleObserver singleObserver = this.actual;
                    boolean z = obj == null && obj2 == null;
                    singleObserver.onSuccess(Boolean.valueOf(z));
                } else {
                    try {
                        this.actual.onSuccess(Boolean.valueOf(this.isEqual.test(obj, obj2)));
                    } catch (Throwable th) {
                        Exceptions.throwIfFatal(th);
                        this.actual.onError(th);
                    }
                }
            }
        }

        void error(EqualObserver<T> equalObserver, Throwable th) {
            if (getAndSet(0) > 0) {
                if (equalObserver == this.observer1) {
                    this.observer2.dispose();
                } else {
                    this.observer1.dispose();
                }
                this.actual.onError(th);
                return;
            }
            RxJavaPlugins.onError(th);
        }
    }

    static final class EqualObserver<T> extends AtomicReference<Disposable> implements MaybeObserver<T> {
        private static final long serialVersionUID = -3031974433025990931L;
        final EqualCoordinator<T> parent;
        Object value;

        EqualObserver(EqualCoordinator<T> equalCoordinator) {
            this.parent = equalCoordinator;
        }

        public void dispose() {
            DisposableHelper.dispose(this);
        }

        public void onSubscribe(Disposable disposable) {
            DisposableHelper.setOnce(this, disposable);
        }

        public void onSuccess(T t) {
            this.value = t;
            this.parent.done();
        }

        public void onError(Throwable th) {
            this.parent.error(this, th);
        }

        public void onComplete() {
            this.parent.done();
        }
    }

    public MaybeEqualSingle(MaybeSource<? extends T> maybeSource, MaybeSource<? extends T> maybeSource2, BiPredicate<? super T, ? super T> biPredicate) {
        this.source1 = maybeSource;
        this.source2 = maybeSource2;
        this.isEqual = biPredicate;
    }

    protected void subscribeActual(SingleObserver<? super Boolean> singleObserver) {
        Object equalCoordinator = new EqualCoordinator(singleObserver, this.isEqual);
        singleObserver.onSubscribe(equalCoordinator);
        equalCoordinator.subscribe(this.source1, this.source2);
    }
}
