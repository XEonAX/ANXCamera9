package io.reactivex.internal.operators.observable;

import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Function;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.queue.SpscLinkedArrayQueue;
import io.reactivex.internal.util.AtomicThrowable;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;

public final class ObservableSwitchMap<T, R> extends AbstractObservableWithUpstream<T, R> {
    final int bufferSize;
    final boolean delayErrors;
    final Function<? super T, ? extends ObservableSource<? extends R>> mapper;

    static final class SwitchMapInnerObserver<T, R> extends AtomicReference<Disposable> implements Observer<R> {
        private static final long serialVersionUID = 3837284832786408377L;
        volatile boolean done;
        final long index;
        final SwitchMapObserver<T, R> parent;
        final SpscLinkedArrayQueue<R> queue;

        SwitchMapInnerObserver(SwitchMapObserver<T, R> switchMapObserver, long j, int i) {
            this.parent = switchMapObserver;
            this.index = j;
            this.queue = new SpscLinkedArrayQueue(i);
        }

        public void onSubscribe(Disposable disposable) {
            DisposableHelper.setOnce(this, disposable);
        }

        public void onNext(R r) {
            if (this.index == this.parent.unique) {
                this.queue.offer(r);
                this.parent.drain();
            }
        }

        public void onError(Throwable th) {
            this.parent.innerError(this, th);
        }

        public void onComplete() {
            if (this.index == this.parent.unique) {
                this.done = true;
                this.parent.drain();
            }
        }

        public void cancel() {
            DisposableHelper.dispose(this);
        }
    }

    static final class SwitchMapObserver<T, R> extends AtomicInteger implements Observer<T>, Disposable {
        static final SwitchMapInnerObserver<Object, Object> CANCELLED = new SwitchMapInnerObserver(null, -1, 1);
        private static final long serialVersionUID = -3491074160481096299L;
        final AtomicReference<SwitchMapInnerObserver<T, R>> active = new AtomicReference();
        final Observer<? super R> actual;
        final int bufferSize;
        volatile boolean cancelled;
        final boolean delayErrors;
        volatile boolean done;
        final AtomicThrowable errors;
        final Function<? super T, ? extends ObservableSource<? extends R>> mapper;
        Disposable s;
        volatile long unique;

        static {
            CANCELLED.cancel();
        }

        SwitchMapObserver(Observer<? super R> observer, Function<? super T, ? extends ObservableSource<? extends R>> function, int i, boolean z) {
            this.actual = observer;
            this.mapper = function;
            this.bufferSize = i;
            this.delayErrors = z;
            this.errors = new AtomicThrowable();
        }

        public void onSubscribe(Disposable disposable) {
            if (DisposableHelper.validate(this.s, disposable)) {
                this.s = disposable;
                this.actual.onSubscribe(this);
            }
        }

        public void onNext(T t) {
            long j = this.unique + 1;
            this.unique = j;
            SwitchMapInnerObserver switchMapInnerObserver = (SwitchMapInnerObserver) this.active.get();
            if (switchMapInnerObserver != null) {
                switchMapInnerObserver.cancel();
            }
            try {
                ObservableSource observableSource = (ObservableSource) ObjectHelper.requireNonNull(this.mapper.apply(t), "The ObservableSource returned is null");
                Observer switchMapInnerObserver2 = new SwitchMapInnerObserver(this, j, this.bufferSize);
                SwitchMapInnerObserver switchMapInnerObserver3;
                do {
                    switchMapInnerObserver3 = (SwitchMapInnerObserver) this.active.get();
                    if (switchMapInnerObserver3 == CANCELLED) {
                        break;
                    }
                } while (!this.active.compareAndSet(switchMapInnerObserver3, switchMapInnerObserver2));
                observableSource.subscribe(switchMapInnerObserver2);
            } catch (Throwable th) {
                Exceptions.throwIfFatal(th);
                this.s.dispose();
                onError(th);
            }
        }

        public void onError(Throwable th) {
            if (this.done || !this.errors.addThrowable(th)) {
                if (!this.delayErrors) {
                    disposeInner();
                }
                RxJavaPlugins.onError(th);
                return;
            }
            this.done = true;
            drain();
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
                this.s.dispose();
                disposeInner();
            }
        }

        public boolean isDisposed() {
            return this.cancelled;
        }

        void disposeInner() {
            if (((SwitchMapInnerObserver) this.active.get()) != CANCELLED) {
                SwitchMapInnerObserver switchMapInnerObserver = (SwitchMapInnerObserver) this.active.getAndSet(CANCELLED);
                if (switchMapInnerObserver != CANCELLED && switchMapInnerObserver != null) {
                    switchMapInnerObserver.cancel();
                }
            }
        }

        /* JADX WARNING: Removed duplicated region for block: B:63:0x00d8  */
        void drain() {
            /*
            r10 = this;
            r0 = r10.getAndIncrement();
            if (r0 == 0) goto L_0x0007;
        L_0x0006:
            return;
        L_0x0007:
            r0 = r10.actual;
            r1 = 1;
            r2 = r1;
        L_0x000c:
            r3 = r10.cancelled;
            if (r3 == 0) goto L_0x0011;
        L_0x0010:
            return;
        L_0x0011:
            r3 = r10.done;
            r4 = 0;
            if (r3 == 0) goto L_0x0054;
        L_0x0016:
            r3 = r10.active;
            r3 = r3.get();
            if (r3 != 0) goto L_0x0020;
        L_0x001e:
            r3 = r1;
            goto L_0x0022;
            r3 = r4;
        L_0x0022:
            r5 = r10.delayErrors;
            if (r5 == 0) goto L_0x003a;
        L_0x0026:
            if (r3 == 0) goto L_0x0054;
        L_0x0028:
            r1 = r10.errors;
            r1 = r1.get();
            r1 = (java.lang.Throwable) r1;
            if (r1 == 0) goto L_0x0036;
        L_0x0032:
            r0.onError(r1);
            goto L_0x0039;
        L_0x0036:
            r0.onComplete();
        L_0x0039:
            return;
        L_0x003a:
            r5 = r10.errors;
            r5 = r5.get();
            r5 = (java.lang.Throwable) r5;
            if (r5 == 0) goto L_0x004e;
        L_0x0044:
            r1 = r10.errors;
            r1 = r1.terminate();
            r0.onError(r1);
            return;
        L_0x004e:
            if (r3 == 0) goto L_0x0054;
        L_0x0050:
            r0.onComplete();
            return;
        L_0x0054:
            r3 = r10.active;
            r3 = r3.get();
            r3 = (io.reactivex.internal.operators.observable.ObservableSwitchMap.SwitchMapInnerObserver) r3;
            if (r3 == 0) goto L_0x00de;
        L_0x005e:
            r5 = r3.queue;
            r6 = r3.done;
            r7 = 0;
            if (r6 == 0) goto L_0x0092;
        L_0x0065:
            r6 = r5.isEmpty();
            r8 = r10.delayErrors;
            if (r8 == 0) goto L_0x0075;
        L_0x006d:
            if (r6 == 0) goto L_0x0092;
        L_0x006f:
            r4 = r10.active;
            r4.compareAndSet(r3, r7);
            goto L_0x000c;
        L_0x0075:
            r8 = r10.errors;
            r8 = r8.get();
            r8 = (java.lang.Throwable) r8;
            if (r8 == 0) goto L_0x0089;
        L_0x007f:
            r1 = r10.errors;
            r1 = r1.terminate();
            r0.onError(r1);
            return;
        L_0x0089:
            if (r6 == 0) goto L_0x0092;
        L_0x008b:
            r4 = r10.active;
            r4.compareAndSet(r3, r7);
            goto L_0x000c;
        L_0x0093:
            r6 = r10.cancelled;
            if (r6 == 0) goto L_0x0098;
        L_0x0097:
            return;
        L_0x0098:
            r6 = r10.active;
            r6 = r6.get();
            if (r3 == r6) goto L_0x00a4;
        L_0x00a2:
            r4 = r1;
            goto L_0x00d6;
        L_0x00a4:
            r6 = r10.delayErrors;
            if (r6 != 0) goto L_0x00bc;
        L_0x00a8:
            r6 = r10.errors;
            r6 = r6.get();
            r6 = (java.lang.Throwable) r6;
            if (r6 == 0) goto L_0x00bc;
        L_0x00b2:
            r1 = r10.errors;
            r1 = r1.terminate();
            r0.onError(r1);
            return;
        L_0x00bc:
            r6 = r3.done;
            r8 = r5.poll();
            if (r8 != 0) goto L_0x00c6;
        L_0x00c4:
            r9 = r1;
            goto L_0x00c8;
            r9 = r4;
        L_0x00c8:
            if (r6 == 0) goto L_0x00d3;
        L_0x00ca:
            if (r9 == 0) goto L_0x00d3;
        L_0x00cc:
            r4 = r10.active;
            r4.compareAndSet(r3, r7);
            goto L_0x00a2;
        L_0x00d3:
            if (r9 == 0) goto L_0x00da;
        L_0x00d6:
            if (r4 == 0) goto L_0x00de;
        L_0x00d8:
            goto L_0x000c;
        L_0x00da:
            r0.onNext(r8);
            goto L_0x0093;
        L_0x00de:
            r2 = -r2;
            r2 = r10.addAndGet(r2);
            if (r2 != 0) goto L_0x00e7;
            return;
        L_0x00e7:
            goto L_0x000c;
            */
            throw new UnsupportedOperationException("Method not decompiled: io.reactivex.internal.operators.observable.ObservableSwitchMap.SwitchMapObserver.drain():void");
        }

        void innerError(SwitchMapInnerObserver<T, R> switchMapInnerObserver, Throwable th) {
            if (switchMapInnerObserver.index == this.unique && this.errors.addThrowable(th)) {
                if (!this.delayErrors) {
                    this.s.dispose();
                }
                switchMapInnerObserver.done = true;
                drain();
                return;
            }
            RxJavaPlugins.onError(th);
        }
    }

    public ObservableSwitchMap(ObservableSource<T> observableSource, Function<? super T, ? extends ObservableSource<? extends R>> function, int i, boolean z) {
        super(observableSource);
        this.mapper = function;
        this.bufferSize = i;
        this.delayErrors = z;
    }

    public void subscribeActual(Observer<? super R> observer) {
        if (!ObservableScalarXMap.tryScalarXMapSubscribe(this.source, observer, this.mapper)) {
            this.source.subscribe(new SwitchMapObserver(observer, this.mapper, this.bufferSize, this.delayErrors));
        }
    }
}
