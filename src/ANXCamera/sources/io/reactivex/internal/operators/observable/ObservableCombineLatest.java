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
import io.reactivex.internal.util.AtomicThrowable;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;

public final class ObservableCombineLatest<T, R> extends Observable<R> {
    final int bufferSize;
    final Function<? super Object[], ? extends R> combiner;
    final boolean delayError;
    final ObservableSource<? extends T>[] sources;
    final Iterable<? extends ObservableSource<? extends T>> sourcesIterable;

    static final class CombinerObserver<T, R> extends AtomicReference<Disposable> implements Observer<T> {
        private static final long serialVersionUID = -4823716997131257941L;
        final int index;
        final LatestCoordinator<T, R> parent;

        CombinerObserver(LatestCoordinator<T, R> latestCoordinator, int i) {
            this.parent = latestCoordinator;
            this.index = i;
        }

        public void onSubscribe(Disposable disposable) {
            DisposableHelper.setOnce(this, disposable);
        }

        public void onNext(T t) {
            this.parent.innerNext(this.index, t);
        }

        public void onError(Throwable th) {
            this.parent.innerError(this.index, th);
        }

        public void onComplete() {
            this.parent.innerComplete(this.index);
        }

        public void dispose() {
            DisposableHelper.dispose(this);
        }
    }

    static final class LatestCoordinator<T, R> extends AtomicInteger implements Disposable {
        private static final long serialVersionUID = 8567835998786448817L;
        int active;
        final Observer<? super R> actual;
        volatile boolean cancelled;
        final Function<? super Object[], ? extends R> combiner;
        int complete;
        final boolean delayError;
        volatile boolean done;
        final AtomicThrowable errors = new AtomicThrowable();
        Object[] latest;
        final CombinerObserver<T, R>[] observers;
        final SpscLinkedArrayQueue<Object[]> queue;

        LatestCoordinator(Observer<? super R> observer, Function<? super Object[], ? extends R> function, int i, int i2, boolean z) {
            this.actual = observer;
            this.combiner = function;
            this.delayError = z;
            this.latest = new Object[i];
            CombinerObserver[] combinerObserverArr = new CombinerObserver[i];
            for (int i3 = 0; i3 < i; i3++) {
                combinerObserverArr[i3] = new CombinerObserver(this, i3);
            }
            this.observers = combinerObserverArr;
            this.queue = new SpscLinkedArrayQueue(i2);
        }

        public void subscribe(ObservableSource<? extends T>[] observableSourceArr) {
            CombinerObserver[] combinerObserverArr = this.observers;
            int length = combinerObserverArr.length;
            this.actual.onSubscribe(this);
            for (int i = 0; i < length && !this.done && !this.cancelled; i++) {
                observableSourceArr[i].subscribe(combinerObserverArr[i]);
            }
        }

        public void dispose() {
            if (!this.cancelled) {
                this.cancelled = true;
                cancelSources();
                if (getAndIncrement() == 0) {
                    clear(this.queue);
                }
            }
        }

        public boolean isDisposed() {
            return this.cancelled;
        }

        void cancelSources() {
            for (CombinerObserver dispose : this.observers) {
                dispose.dispose();
            }
        }

        void clear(SpscLinkedArrayQueue<?> spscLinkedArrayQueue) {
            synchronized (this) {
                this.latest = null;
            }
            spscLinkedArrayQueue.clear();
        }

        void drain() {
            if (getAndIncrement() == 0) {
                SpscLinkedArrayQueue spscLinkedArrayQueue = this.queue;
                Observer observer = this.actual;
                boolean z = this.delayError;
                int i = 1;
                while (!this.cancelled) {
                    if (z || this.errors.get() == null) {
                        Object obj;
                        boolean z2 = this.done;
                        Object[] objArr = (Object[]) spscLinkedArrayQueue.poll();
                        if (objArr == null) {
                            obj = 1;
                        } else {
                            obj = null;
                        }
                        if (z2 && obj != null) {
                            clear(spscLinkedArrayQueue);
                            Throwable terminate = this.errors.terminate();
                            if (terminate == null) {
                                observer.onComplete();
                            } else {
                                observer.onError(terminate);
                            }
                            return;
                        } else if (obj != null) {
                            i = addAndGet(-i);
                            if (i == 0) {
                                return;
                            }
                        } else {
                            try {
                                observer.onNext(ObjectHelper.requireNonNull(this.combiner.apply(objArr), "The combiner returned a null value"));
                            } catch (Throwable th) {
                                Exceptions.throwIfFatal(th);
                                this.errors.addThrowable(th);
                                cancelSources();
                                clear(spscLinkedArrayQueue);
                                observer.onError(this.errors.terminate());
                                return;
                            }
                        }
                    }
                    cancelSources();
                    clear(spscLinkedArrayQueue);
                    observer.onError(this.errors.terminate());
                    return;
                }
                clear(spscLinkedArrayQueue);
            }
        }

        /* JADX WARNING: Missing block: B:15:0x0025, code:
            if (r4 == null) goto L_0x002a;
     */
        /* JADX WARNING: Missing block: B:16:0x0027, code:
            drain();
     */
        /* JADX WARNING: Missing block: B:17:0x002a, code:
            return;
     */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        void innerNext(int i, T t) {
            synchronized (this) {
                Object obj = this.latest;
                if (obj == null) {
                    return;
                }
                Object obj2 = obj[i];
                int i2 = this.active;
                if (obj2 == null) {
                    i2++;
                    this.active = i2;
                }
                obj[i] = t;
                Object obj3;
                if (i2 == obj.length) {
                    this.queue.offer(obj.clone());
                    obj3 = 1;
                } else {
                    obj3 = null;
                }
            }
        }

        /* JADX WARNING: Missing block: B:16:0x0024, code:
            if (r1 == r4.length) goto L_0x0026;
     */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        void innerError(int i, Throwable th) {
            if (this.errors.addThrowable(th)) {
                boolean z;
                if (this.delayError) {
                    synchronized (this) {
                        Object[] objArr = this.latest;
                        if (objArr == null) {
                            return;
                        }
                        if (objArr[i] == null) {
                            z = true;
                        } else {
                            z = false;
                        }
                        if (!z) {
                            int i2 = this.complete + 1;
                            this.complete = i2;
                        }
                        this.done = true;
                    }
                } else {
                    z = true;
                }
                if (z) {
                    cancelSources();
                }
                drain();
            } else {
                RxJavaPlugins.onError(th);
            }
        }

        /* JADX WARNING: Missing block: B:13:0x0018, code:
            if (r2 == r0.length) goto L_0x001a;
     */
        /* JADX WARNING: Missing block: B:16:0x001d, code:
            if (r4 == false) goto L_0x0022;
     */
        /* JADX WARNING: Missing block: B:17:0x001f, code:
            cancelSources();
     */
        /* JADX WARNING: Missing block: B:18:0x0022, code:
            drain();
     */
        /* JADX WARNING: Missing block: B:19:0x0025, code:
            return;
     */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        void innerComplete(int i) {
            synchronized (this) {
                Object[] objArr = this.latest;
                if (objArr == null) {
                    return;
                }
                boolean z;
                if (objArr[i] == null) {
                    z = true;
                } else {
                    z = false;
                }
                if (!z) {
                    int i2 = this.complete + 1;
                    this.complete = i2;
                }
                this.done = true;
            }
        }
    }

    public ObservableCombineLatest(ObservableSource<? extends T>[] observableSourceArr, Iterable<? extends ObservableSource<? extends T>> iterable, Function<? super Object[], ? extends R> function, int i, boolean z) {
        this.sources = observableSourceArr;
        this.sourcesIterable = iterable;
        this.combiner = function;
        this.bufferSize = i;
        this.delayError = z;
    }

    public void subscribeActual(Observer<? super R> observer) {
        int i;
        ObservableSource[] observableSourceArr = this.sources;
        if (observableSourceArr == null) {
            Object obj = new Observable[8];
            Object obj2 = obj;
            int i2 = 0;
            for (ObservableSource observableSource : this.sourcesIterable) {
                if (i2 == obj2.length) {
                    Object obj3 = new ObservableSource[((i2 >> 2) + i2)];
                    System.arraycopy(obj2, 0, obj3, 0, i2);
                    obj2 = obj3;
                }
                i = i2 + 1;
                obj2[i2] = observableSource;
                i2 = i;
            }
            i = i2;
            observableSourceArr = obj2;
        } else {
            i = observableSourceArr.length;
        }
        if (i == 0) {
            EmptyDisposable.complete((Observer) observer);
            return;
        }
        new LatestCoordinator(observer, this.combiner, i, this.bufferSize, this.delayError).subscribe(observableSourceArr);
    }
}
