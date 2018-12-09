package io.reactivex.internal.operators.observable;

import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Function;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.fuseable.QueueDisposable;
import io.reactivex.internal.fuseable.SimplePlainQueue;
import io.reactivex.internal.fuseable.SimpleQueue;
import io.reactivex.internal.queue.SpscArrayQueue;
import io.reactivex.internal.queue.SpscLinkedArrayQueue;
import io.reactivex.internal.util.AtomicThrowable;
import io.reactivex.internal.util.ExceptionHelper;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.ArrayDeque;
import java.util.Queue;
import java.util.concurrent.Callable;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;

public final class ObservableFlatMap<T, U> extends AbstractObservableWithUpstream<T, U> {
    final int bufferSize;
    final boolean delayErrors;
    final Function<? super T, ? extends ObservableSource<? extends U>> mapper;
    final int maxConcurrency;

    static final class InnerObserver<T, U> extends AtomicReference<Disposable> implements Observer<U> {
        private static final long serialVersionUID = -4606175640614850599L;
        volatile boolean done;
        int fusionMode;
        final long id;
        final MergeObserver<T, U> parent;
        volatile SimpleQueue<U> queue;

        InnerObserver(MergeObserver<T, U> mergeObserver, long j) {
            this.id = j;
            this.parent = mergeObserver;
        }

        public void onSubscribe(Disposable disposable) {
            if (DisposableHelper.setOnce(this, disposable) && (disposable instanceof QueueDisposable)) {
                QueueDisposable queueDisposable = (QueueDisposable) disposable;
                int requestFusion = queueDisposable.requestFusion(7);
                if (requestFusion == 1) {
                    this.fusionMode = requestFusion;
                    this.queue = queueDisposable;
                    this.done = true;
                    this.parent.drain();
                } else if (requestFusion == 2) {
                    this.fusionMode = requestFusion;
                    this.queue = queueDisposable;
                }
            }
        }

        public void onNext(U u) {
            if (this.fusionMode == 0) {
                this.parent.tryEmit(u, this);
            } else {
                this.parent.drain();
            }
        }

        public void onError(Throwable th) {
            if (this.parent.errors.addThrowable(th)) {
                if (!this.parent.delayErrors) {
                    this.parent.disposeAll();
                }
                this.done = true;
                this.parent.drain();
                return;
            }
            RxJavaPlugins.onError(th);
        }

        public void onComplete() {
            this.done = true;
            this.parent.drain();
        }

        public void dispose() {
            DisposableHelper.dispose(this);
        }
    }

    static final class MergeObserver<T, U> extends AtomicInteger implements Observer<T>, Disposable {
        static final InnerObserver<?, ?>[] CANCELLED = new InnerObserver[0];
        static final InnerObserver<?, ?>[] EMPTY = new InnerObserver[0];
        private static final long serialVersionUID = -2117620485640801370L;
        final Observer<? super U> actual;
        final int bufferSize;
        volatile boolean cancelled;
        final boolean delayErrors;
        volatile boolean done;
        final AtomicThrowable errors = new AtomicThrowable();
        long lastId;
        int lastIndex;
        final Function<? super T, ? extends ObservableSource<? extends U>> mapper;
        final int maxConcurrency;
        final AtomicReference<InnerObserver<?, ?>[]> observers;
        volatile SimplePlainQueue<U> queue;
        Disposable s;
        Queue<ObservableSource<? extends U>> sources;
        long uniqueId;
        int wip;

        MergeObserver(Observer<? super U> observer, Function<? super T, ? extends ObservableSource<? extends U>> function, boolean z, int i, int i2) {
            this.actual = observer;
            this.mapper = function;
            this.delayErrors = z;
            this.maxConcurrency = i;
            this.bufferSize = i2;
            if (i != Integer.MAX_VALUE) {
                this.sources = new ArrayDeque(i);
            }
            this.observers = new AtomicReference(EMPTY);
        }

        public void onSubscribe(Disposable disposable) {
            if (DisposableHelper.validate(this.s, disposable)) {
                this.s = disposable;
                this.actual.onSubscribe(this);
            }
        }

        public void onNext(T t) {
            if (!this.done) {
                try {
                    ObservableSource observableSource = (ObservableSource) ObjectHelper.requireNonNull(this.mapper.apply(t), "The mapper returned a null ObservableSource");
                    if (this.maxConcurrency != Integer.MAX_VALUE) {
                        synchronized (this) {
                            if (this.wip == this.maxConcurrency) {
                                this.sources.offer(observableSource);
                                return;
                            }
                            this.wip++;
                        }
                    }
                    subscribeInner(observableSource);
                } catch (Throwable th) {
                    Exceptions.throwIfFatal(th);
                    this.s.dispose();
                    onError(th);
                }
            }
        }

        void subscribeInner(ObservableSource<? extends U> observableSource) {
            ObservableSource observableSource2;
            while (observableSource2 instanceof Callable) {
                tryEmitScalar((Callable) observableSource2);
                if (this.maxConcurrency != Integer.MAX_VALUE) {
                    synchronized (this) {
                        observableSource2 = (ObservableSource) this.sources.poll();
                        if (observableSource2 == null) {
                            this.wip--;
                            return;
                        }
                    }
                }
                return;
            }
            long j = this.uniqueId;
            this.uniqueId = 1 + j;
            Observer innerObserver = new InnerObserver(this, j);
            if (addInner(innerObserver)) {
                observableSource2.subscribe(innerObserver);
            }
        }

        boolean addInner(InnerObserver<T, U> innerObserver) {
            while (true) {
                InnerObserver[] innerObserverArr = (InnerObserver[]) this.observers.get();
                if (innerObserverArr == CANCELLED) {
                    innerObserver.dispose();
                    return false;
                }
                int length = innerObserverArr.length;
                Object obj = new InnerObserver[(length + 1)];
                System.arraycopy(innerObserverArr, 0, obj, 0, length);
                obj[length] = innerObserver;
                if (this.observers.compareAndSet(innerObserverArr, obj)) {
                    return true;
                }
            }
        }

        void removeInner(InnerObserver<T, U> innerObserver) {
            while (true) {
                InnerObserver[] innerObserverArr = (InnerObserver[]) this.observers.get();
                int length = innerObserverArr.length;
                if (length != 0) {
                    int i = -1;
                    for (int i2 = 0; i2 < length; i2++) {
                        if (innerObserverArr[i2] == innerObserver) {
                            i = i2;
                            break;
                        }
                    }
                    if (i >= 0) {
                        Object obj;
                        if (length == 1) {
                            obj = EMPTY;
                        } else {
                            Object obj2 = new InnerObserver[(length - 1)];
                            System.arraycopy(innerObserverArr, 0, obj2, 0, i);
                            System.arraycopy(innerObserverArr, i + 1, obj2, i, (length - i) - 1);
                            obj = obj2;
                        }
                        if (this.observers.compareAndSet(innerObserverArr, obj)) {
                            return;
                        }
                    } else {
                        return;
                    }
                }
                return;
            }
        }

        void tryEmitScalar(Callable<? extends U> callable) {
            try {
                Object call = callable.call();
                if (call != null) {
                    if (get() == 0 && compareAndSet(0, 1)) {
                        this.actual.onNext(call);
                        if (decrementAndGet() == 0) {
                            return;
                        }
                    }
                    SimplePlainQueue simplePlainQueue = this.queue;
                    if (simplePlainQueue == null) {
                        if (this.maxConcurrency == Integer.MAX_VALUE) {
                            simplePlainQueue = new SpscLinkedArrayQueue(this.bufferSize);
                        } else {
                            simplePlainQueue = new SpscArrayQueue(this.maxConcurrency);
                        }
                        this.queue = simplePlainQueue;
                    }
                    if (!simplePlainQueue.offer(call)) {
                        onError(new IllegalStateException("Scalar queue full?!"));
                        return;
                    } else if (getAndIncrement() != 0) {
                        return;
                    }
                    drainLoop();
                }
            } catch (Throwable th) {
                Exceptions.throwIfFatal(th);
                this.errors.addThrowable(th);
                drain();
            }
        }

        void tryEmit(U u, InnerObserver<T, U> innerObserver) {
            if (get() == 0 && compareAndSet(0, 1)) {
                this.actual.onNext(u);
                if (decrementAndGet() == 0) {
                    return;
                }
            }
            SimpleQueue simpleQueue = innerObserver.queue;
            if (simpleQueue == null) {
                simpleQueue = new SpscLinkedArrayQueue(this.bufferSize);
                innerObserver.queue = simpleQueue;
            }
            simpleQueue.offer(u);
            if (getAndIncrement() != 0) {
                return;
            }
            drainLoop();
        }

        public void onError(Throwable th) {
            if (this.done) {
                RxJavaPlugins.onError(th);
                return;
            }
            if (this.errors.addThrowable(th)) {
                this.done = true;
                drain();
            } else {
                RxJavaPlugins.onError(th);
            }
        }

        public void onComplete() {
            if (!this.done) {
                this.done = true;
                drain();
            }
        }

        public void dispose() {
            if (!this.cancelled) {
                this.cancelled = true;
                if (disposeAll()) {
                    Throwable terminate = this.errors.terminate();
                    if (terminate != null && terminate != ExceptionHelper.TERMINATED) {
                        RxJavaPlugins.onError(terminate);
                    }
                }
            }
        }

        public boolean isDisposed() {
            return this.cancelled;
        }

        void drain() {
            if (getAndIncrement() == 0) {
                drainLoop();
            }
        }

        /* JADX WARNING: Missing block: B:57:0x00ab, code:
            if (r11 != null) goto L_0x00cf;
     */
        void drainLoop() {
            /*
            r12 = this;
            r0 = r12.actual;
            r1 = 1;
            r2 = r1;
        L_0x0005:
            r3 = r12.checkTerminate();
            if (r3 == 0) goto L_0x000c;
        L_0x000b:
            return;
        L_0x000c:
            r3 = r12.queue;
            if (r3 == 0) goto L_0x0026;
        L_0x0010:
            r4 = r12.checkTerminate();
            if (r4 == 0) goto L_0x0017;
        L_0x0016:
            return;
        L_0x0017:
            r4 = r3.poll();
            if (r4 != 0) goto L_0x0022;
            if (r4 != 0) goto L_0x0021;
        L_0x0020:
            goto L_0x0026;
        L_0x0021:
            goto L_0x0010;
        L_0x0022:
            r0.onNext(r4);
            goto L_0x0010;
        L_0x0026:
            r3 = r12.done;
            r4 = r12.queue;
            r5 = r12.observers;
            r5 = r5.get();
            r5 = (io.reactivex.internal.operators.observable.ObservableFlatMap.InnerObserver[]) r5;
            r6 = r5.length;
            if (r3 == 0) goto L_0x0053;
        L_0x0035:
            if (r4 == 0) goto L_0x003d;
        L_0x0037:
            r3 = r4.isEmpty();
            if (r3 == 0) goto L_0x0053;
        L_0x003d:
            if (r6 != 0) goto L_0x0053;
        L_0x003f:
            r1 = r12.errors;
            r1 = r1.terminate();
            r2 = io.reactivex.internal.util.ExceptionHelper.TERMINATED;
            if (r1 == r2) goto L_0x0052;
        L_0x0049:
            if (r1 != 0) goto L_0x004f;
        L_0x004b:
            r0.onComplete();
            goto L_0x0052;
        L_0x004f:
            r0.onError(r1);
        L_0x0052:
            return;
            r3 = 0;
            if (r6 == 0) goto L_0x0100;
        L_0x0057:
            r7 = r12.lastId;
            r4 = r12.lastIndex;
            if (r6 <= r4) goto L_0x0065;
        L_0x005d:
            r9 = r5[r4];
            r9 = r9.id;
            r9 = (r9 > r7 ? 1 : (r9 == r7 ? 0 : -1));
            if (r9 == 0) goto L_0x0089;
        L_0x0065:
            if (r6 > r4) goto L_0x0069;
            r4 = r3;
        L_0x0069:
            r9 = r4;
            r4 = r3;
        L_0x006b:
            if (r4 >= r6) goto L_0x007f;
        L_0x006d:
            r10 = r5[r9];
            r10 = r10.id;
            r10 = (r10 > r7 ? 1 : (r10 == r7 ? 0 : -1));
            if (r10 != 0) goto L_0x0076;
        L_0x0075:
            goto L_0x007f;
        L_0x0076:
            r9 = r9 + 1;
            if (r9 != r6) goto L_0x007c;
            r9 = r3;
        L_0x007c:
            r4 = r4 + 1;
            goto L_0x006b;
            r12.lastIndex = r9;
            r4 = r5[r9];
            r7 = r4.id;
            r12.lastId = r7;
            r4 = r9;
        L_0x0089:
            r8 = r3;
            r7 = r4;
            r4 = r8;
        L_0x008c:
            if (r4 >= r6) goto L_0x00f7;
        L_0x008e:
            r9 = r12.checkTerminate();
            if (r9 == 0) goto L_0x0095;
        L_0x0094:
            return;
        L_0x0095:
            r9 = r5[r7];
        L_0x0097:
            r10 = r12.checkTerminate();
            if (r10 == 0) goto L_0x009e;
        L_0x009d:
            return;
        L_0x009e:
            r10 = r9.queue;
            if (r10 != 0) goto L_0x00a3;
        L_0x00a2:
            goto L_0x00ae;
        L_0x00a3:
            r11 = r10.poll();	 Catch:{ Throwable -> 0x00da }
            if (r11 != 0) goto L_0x00d0;
            if (r11 != 0) goto L_0x00cf;
        L_0x00ae:
            r10 = r9.done;
            r11 = r9.queue;
            if (r10 == 0) goto L_0x00c8;
        L_0x00b4:
            if (r11 == 0) goto L_0x00bc;
        L_0x00b6:
            r10 = r11.isEmpty();
            if (r10 == 0) goto L_0x00c8;
        L_0x00bc:
            r12.removeInner(r9);
            r8 = r12.checkTerminate();
            if (r8 == 0) goto L_0x00c6;
        L_0x00c5:
            return;
            r8 = r1;
        L_0x00c8:
            r7 = r7 + 1;
            if (r7 != r6) goto L_0x00f5;
            r7 = r3;
            goto L_0x00f5;
        L_0x00cf:
            goto L_0x0097;
        L_0x00d0:
            r0.onNext(r11);
            r11 = r12.checkTerminate();
            if (r11 == 0) goto L_0x00a3;
        L_0x00d9:
            return;
        L_0x00da:
            r8 = move-exception;
            io.reactivex.exceptions.Exceptions.throwIfFatal(r8);
            r9.dispose();
            r10 = r12.errors;
            r10.addThrowable(r8);
            r8 = r12.checkTerminate();
            if (r8 == 0) goto L_0x00ed;
        L_0x00ec:
            return;
        L_0x00ed:
            r12.removeInner(r9);
            r4 = r4 + 1;
            r8 = r1;
        L_0x00f5:
            r4 = r4 + r1;
            goto L_0x008c;
        L_0x00f7:
            r12.lastIndex = r7;
            r3 = r5[r7];
            r3 = r3.id;
            r12.lastId = r3;
            r3 = r8;
        L_0x0100:
            if (r3 == 0) goto L_0x0125;
        L_0x0102:
            r3 = r12.maxConcurrency;
            r4 = 2147483647; // 0x7fffffff float:NaN double:1.060997895E-314;
            if (r3 == r4) goto L_0x0005;
        L_0x0109:
            monitor-enter(r12);
            r3 = r12.sources;	 Catch:{ all -> 0x0122 }
            r3 = r3.poll();	 Catch:{ all -> 0x0122 }
            r3 = (io.reactivex.ObservableSource) r3;	 Catch:{ all -> 0x0122 }
            if (r3 != 0) goto L_0x011c;
        L_0x0114:
            r3 = r12.wip;	 Catch:{ all -> 0x0122 }
            r3 = r3 - r1;
            r12.wip = r3;	 Catch:{ all -> 0x0122 }
            monitor-exit(r12);	 Catch:{ all -> 0x0122 }
            goto L_0x0005;
        L_0x011c:
            monitor-exit(r12);	 Catch:{ all -> 0x0122 }
            r12.subscribeInner(r3);
            goto L_0x0005;
        L_0x0122:
            r0 = move-exception;
            monitor-exit(r12);	 Catch:{ all -> 0x0122 }
            throw r0;
        L_0x0125:
            r2 = -r2;
            r2 = r12.addAndGet(r2);
            if (r2 != 0) goto L_0x012e;
            return;
        L_0x012e:
            goto L_0x0005;
            */
            throw new UnsupportedOperationException("Method not decompiled: io.reactivex.internal.operators.observable.ObservableFlatMap.MergeObserver.drainLoop():void");
        }

        boolean checkTerminate() {
            if (this.cancelled) {
                return true;
            }
            Throwable th = (Throwable) this.errors.get();
            if (this.delayErrors || th == null) {
                return false;
            }
            disposeAll();
            th = this.errors.terminate();
            if (th != ExceptionHelper.TERMINATED) {
                this.actual.onError(th);
            }
            return true;
        }

        boolean disposeAll() {
            this.s.dispose();
            int i = 0;
            if (((InnerObserver[]) this.observers.get()) != CANCELLED) {
                InnerObserver[] innerObserverArr = (InnerObserver[]) this.observers.getAndSet(CANCELLED);
                if (innerObserverArr != CANCELLED) {
                    int length = innerObserverArr.length;
                    while (i < length) {
                        innerObserverArr[i].dispose();
                        i++;
                    }
                    return true;
                }
            }
            return false;
        }
    }

    public ObservableFlatMap(ObservableSource<T> observableSource, Function<? super T, ? extends ObservableSource<? extends U>> function, boolean z, int i, int i2) {
        super(observableSource);
        this.mapper = function;
        this.delayErrors = z;
        this.maxConcurrency = i;
        this.bufferSize = i2;
    }

    public void subscribeActual(Observer<? super U> observer) {
        if (!ObservableScalarXMap.tryScalarXMapSubscribe(this.source, observer, this.mapper)) {
            this.source.subscribe(new MergeObserver(observer, this.mapper, this.delayErrors, this.maxConcurrency, this.bufferSize));
        }
    }
}
