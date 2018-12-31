package io.reactivex.internal.operators.observable;

import io.reactivex.Observable;
import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Function;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.disposables.EmptyDisposable;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.queue.SpscLinkedArrayQueue;
import java.util.Arrays;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;

public final class ObservableZip<T, R> extends Observable<R> {
    final int bufferSize;
    final boolean delayError;
    final ObservableSource<? extends T>[] sources;
    final Iterable<? extends ObservableSource<? extends T>> sourcesIterable;
    final Function<? super Object[], ? extends R> zipper;

    static final class ZipCoordinator<T, R> extends AtomicInteger implements Disposable {
        private static final long serialVersionUID = 2983708048395377667L;
        final Observer<? super R> actual;
        volatile boolean cancelled;
        final boolean delayError;
        final ZipObserver<T, R>[] observers;
        final T[] row;
        final Function<? super Object[], ? extends R> zipper;

        ZipCoordinator(Observer<? super R> observer, Function<? super Object[], ? extends R> function, int i, boolean z) {
            this.actual = observer;
            this.zipper = function;
            this.observers = new ZipObserver[i];
            this.row = new Object[i];
            this.delayError = z;
        }

        public void subscribe(ObservableSource<? extends T>[] observableSourceArr, int i) {
            ZipObserver[] zipObserverArr = this.observers;
            int length = zipObserverArr.length;
            int i2 = 0;
            for (int i3 = 0; i3 < length; i3++) {
                zipObserverArr[i3] = new ZipObserver(this, i);
            }
            lazySet(0);
            this.actual.onSubscribe(this);
            while (i2 < length && !this.cancelled) {
                observableSourceArr[i2].subscribe(zipObserverArr[i2]);
                i2++;
            }
        }

        public void dispose() {
            if (!this.cancelled) {
                this.cancelled = true;
                cancelSources();
                if (getAndIncrement() == 0) {
                    clear();
                }
            }
        }

        public boolean isDisposed() {
            return this.cancelled;
        }

        void cancel() {
            clear();
            cancelSources();
        }

        void cancelSources() {
            for (ZipObserver dispose : this.observers) {
                dispose.dispose();
            }
        }

        void clear() {
            for (ZipObserver zipObserver : this.observers) {
                zipObserver.queue.clear();
            }
        }

        public void drain() {
            if (getAndIncrement() == 0) {
                ZipObserver[] zipObserverArr = this.observers;
                Observer observer = this.actual;
                Object obj = this.row;
                boolean z = this.delayError;
                int i = 1;
                while (true) {
                    int length = zipObserverArr.length;
                    int i2 = 0;
                    int i3 = i2;
                    int i4 = i3;
                    while (i2 < length) {
                        ZipObserver zipObserver = zipObserverArr[i2];
                        if (obj[i3] == null) {
                            boolean z2 = zipObserver.done;
                            Object poll = zipObserver.queue.poll();
                            boolean z3 = poll == null;
                            if (!checkTerminated(z2, z3, observer, z, zipObserver)) {
                                if (z3) {
                                    i4++;
                                } else {
                                    obj[i3] = poll;
                                }
                            } else {
                                return;
                            }
                        } else if (zipObserver.done && !z) {
                            Throwable th = zipObserver.error;
                            if (th != null) {
                                cancel();
                                observer.onError(th);
                                return;
                            }
                        }
                        i3++;
                        i2++;
                    }
                    if (i4 != 0) {
                        i = addAndGet(-i);
                        if (i == 0) {
                            return;
                        }
                    } else {
                        try {
                            observer.onNext(ObjectHelper.requireNonNull(this.zipper.apply(obj.clone()), "The zipper returned a null value"));
                            Arrays.fill(obj, null);
                        } catch (Throwable th2) {
                            Exceptions.throwIfFatal(th2);
                            cancel();
                            observer.onError(th2);
                            return;
                        }
                    }
                }
            }
        }

        boolean checkTerminated(boolean z, boolean z2, Observer<? super R> observer, boolean z3, ZipObserver<?, ?> zipObserver) {
            if (this.cancelled) {
                cancel();
                return true;
            }
            if (z) {
                Throwable th;
                if (!z3) {
                    th = zipObserver.error;
                    if (th != null) {
                        cancel();
                        observer.onError(th);
                        return true;
                    } else if (z2) {
                        cancel();
                        observer.onComplete();
                        return true;
                    }
                } else if (z2) {
                    th = zipObserver.error;
                    cancel();
                    if (th != null) {
                        observer.onError(th);
                    } else {
                        observer.onComplete();
                    }
                    return true;
                }
            }
            return false;
        }
    }

    static final class ZipObserver<T, R> implements Observer<T> {
        volatile boolean done;
        Throwable error;
        final ZipCoordinator<T, R> parent;
        final SpscLinkedArrayQueue<T> queue;
        final AtomicReference<Disposable> s = new AtomicReference();

        ZipObserver(ZipCoordinator<T, R> zipCoordinator, int i) {
            this.parent = zipCoordinator;
            this.queue = new SpscLinkedArrayQueue(i);
        }

        public void onSubscribe(Disposable disposable) {
            DisposableHelper.setOnce(this.s, disposable);
        }

        public void onNext(T t) {
            this.queue.offer(t);
            this.parent.drain();
        }

        public void onError(Throwable th) {
            this.error = th;
            this.done = true;
            this.parent.drain();
        }

        public void onComplete() {
            this.done = true;
            this.parent.drain();
        }

        public void dispose() {
            DisposableHelper.dispose(this.s);
        }
    }

    public ObservableZip(ObservableSource<? extends T>[] observableSourceArr, Iterable<? extends ObservableSource<? extends T>> iterable, Function<? super Object[], ? extends R> function, int i, boolean z) {
        this.sources = observableSourceArr;
        this.sourcesIterable = iterable;
        this.zipper = function;
        this.bufferSize = i;
        this.delayError = z;
    }

    public void subscribeActual(Observer<? super R> observer) {
        ObservableSource[] observableSourceArr;
        int i;
        ObservableSource[] observableSourceArr2 = this.sources;
        if (observableSourceArr2 == null) {
            Object obj = new Observable[8];
            observableSourceArr = obj;
            i = 0;
            for (ObservableSource observableSource : this.sourcesIterable) {
                if (i == observableSourceArr.length) {
                    Object obj2 = new ObservableSource[((i >> 2) + i)];
                    System.arraycopy(observableSourceArr, 0, obj2, 0, i);
                    observableSourceArr = obj2;
                }
                int i2 = i + 1;
                observableSourceArr[i] = observableSource;
                i = i2;
            }
        } else {
            observableSourceArr = observableSourceArr2;
            i = observableSourceArr2.length;
        }
        if (i == 0) {
            EmptyDisposable.complete((Observer) observer);
        } else {
            new ZipCoordinator(observer, this.zipper, i, this.delayError).subscribe(observableSourceArr, this.bufferSize);
        }
    }
}
