package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.annotations.Nullable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.exceptions.MissingBackpressureException;
import io.reactivex.functions.Function;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.fuseable.QueueSubscription;
import io.reactivex.internal.fuseable.SimpleQueue;
import io.reactivex.internal.queue.SpscArrayQueue;
import io.reactivex.internal.subscriptions.BasicIntQueueSubscription;
import io.reactivex.internal.subscriptions.EmptySubscription;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.BackpressureHelper;
import io.reactivex.internal.util.ExceptionHelper;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.Iterator;
import java.util.concurrent.Callable;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;

public final class FlowableFlattenIterable<T, R> extends AbstractFlowableWithUpstream<T, R> {
    final Function<? super T, ? extends Iterable<? extends R>> mapper;
    final int prefetch;

    static final class FlattenIterableSubscriber<T, R> extends BasicIntQueueSubscription<R> implements FlowableSubscriber<T> {
        private static final long serialVersionUID = -3096000382929934955L;
        final Subscriber<? super R> actual;
        volatile boolean cancelled;
        int consumed;
        Iterator<? extends R> current;
        volatile boolean done;
        final AtomicReference<Throwable> error = new AtomicReference();
        int fusionMode;
        final int limit;
        final Function<? super T, ? extends Iterable<? extends R>> mapper;
        final int prefetch;
        SimpleQueue<T> queue;
        final AtomicLong requested = new AtomicLong();
        Subscription s;

        FlattenIterableSubscriber(Subscriber<? super R> subscriber, Function<? super T, ? extends Iterable<? extends R>> function, int i) {
            this.actual = subscriber;
            this.mapper = function;
            this.prefetch = i;
            this.limit = i - (i >> 2);
        }

        public void onSubscribe(Subscription subscription) {
            if (SubscriptionHelper.validate(this.s, subscription)) {
                this.s = subscription;
                if (subscription instanceof QueueSubscription) {
                    QueueSubscription queueSubscription = (QueueSubscription) subscription;
                    int requestFusion = queueSubscription.requestFusion(3);
                    if (requestFusion == 1) {
                        this.fusionMode = requestFusion;
                        this.queue = queueSubscription;
                        this.done = true;
                        this.actual.onSubscribe(this);
                        return;
                    } else if (requestFusion == 2) {
                        this.fusionMode = requestFusion;
                        this.queue = queueSubscription;
                        this.actual.onSubscribe(this);
                        subscription.request((long) this.prefetch);
                        return;
                    }
                }
                this.queue = new SpscArrayQueue(this.prefetch);
                this.actual.onSubscribe(this);
                subscription.request((long) this.prefetch);
            }
        }

        public void onNext(T t) {
            if (!this.done) {
                if (this.fusionMode != 0 || this.queue.offer(t)) {
                    drain();
                } else {
                    onError(new MissingBackpressureException("Queue is full?!"));
                }
            }
        }

        public void onError(Throwable th) {
            if (this.done || !ExceptionHelper.addThrowable(this.error, th)) {
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

        public void request(long j) {
            if (SubscriptionHelper.validate(j)) {
                BackpressureHelper.add(this.requested, j);
                drain();
            }
        }

        public void cancel() {
            if (!this.cancelled) {
                this.cancelled = true;
                this.s.cancel();
                if (getAndIncrement() == 0) {
                    this.queue.clear();
                }
            }
        }

        /* JADX WARNING: Missing block: B:69:0x012e, code:
            if (r6 == null) goto L_0x013a;
     */
        void drain() {
            /*
            r18 = this;
            r1 = r18;
            r0 = r18.getAndIncrement();
            if (r0 == 0) goto L_0x0009;
        L_0x0008:
            return;
        L_0x0009:
            r2 = r1.actual;
            r3 = r1.queue;
            r0 = r1.fusionMode;
            r4 = 0;
            r5 = 1;
            if (r0 == r5) goto L_0x0015;
        L_0x0013:
            r0 = r5;
            goto L_0x0017;
            r0 = r4;
        L_0x0017:
            r6 = r1.current;
            r7 = 0;
            r8 = r5;
        L_0x001b:
            if (r6 != 0) goto L_0x0086;
        L_0x001d:
            r9 = r1.done;
            r10 = r3.poll();	 Catch:{ Throwable -> 0x0068 }
            if (r10 != 0) goto L_0x0028;
        L_0x0026:
            r11 = r5;
            goto L_0x002a;
            r11 = r4;
        L_0x002a:
            r9 = r1.checkTerminated(r9, r11, r2, r3);
            if (r9 == 0) goto L_0x0031;
        L_0x0030:
            return;
        L_0x0031:
            if (r10 == 0) goto L_0x0086;
        L_0x0033:
            r6 = r1.mapper;	 Catch:{ Throwable -> 0x0050 }
            r6 = r6.apply(r10);	 Catch:{ Throwable -> 0x0050 }
            r6 = (java.lang.Iterable) r6;	 Catch:{ Throwable -> 0x0050 }
            r6 = r6.iterator();	 Catch:{ Throwable -> 0x0050 }
            r9 = r6.hasNext();	 Catch:{ Throwable -> 0x0050 }
            if (r9 != 0) goto L_0x004d;
            r1.consumedOne(r0);
            r6 = r7;
            goto L_0x001b;
        L_0x004d:
            r1.current = r6;
            goto L_0x0086;
        L_0x0050:
            r0 = move-exception;
            io.reactivex.exceptions.Exceptions.throwIfFatal(r0);
            r3 = r1.s;
            r3.cancel();
            r3 = r1.error;
            io.reactivex.internal.util.ExceptionHelper.addThrowable(r3, r0);
            r0 = r1.error;
            r0 = io.reactivex.internal.util.ExceptionHelper.terminate(r0);
            r2.onError(r0);
            return;
        L_0x0068:
            r0 = move-exception;
            r4 = r0;
            io.reactivex.exceptions.Exceptions.throwIfFatal(r4);
            r0 = r1.s;
            r0.cancel();
            r0 = r1.error;
            io.reactivex.internal.util.ExceptionHelper.addThrowable(r0, r4);
            r0 = r1.error;
            r0 = io.reactivex.internal.util.ExceptionHelper.terminate(r0);
            r1.current = r7;
            r3.clear();
            r2.onError(r0);
            return;
        L_0x0086:
            if (r6 == 0) goto L_0x0131;
        L_0x0088:
            r9 = r1.requested;
            r9 = r9.get();
            r11 = 0;
            r13 = r11;
        L_0x0092:
            r15 = (r13 > r9 ? 1 : (r13 == r9 ? 0 : -1));
            if (r15 == 0) goto L_0x0102;
        L_0x0096:
            r15 = r1.done;
            r15 = r1.checkTerminated(r15, r4, r2, r3);
            if (r15 == 0) goto L_0x009f;
        L_0x009e:
            return;
        L_0x009f:
            r15 = r6.next();	 Catch:{ Throwable -> 0x00e8 }
            r5 = "The iterator returned a null value";
            r5 = io.reactivex.internal.functions.ObjectHelper.requireNonNull(r15, r5);	 Catch:{ Throwable -> 0x00e8 }
            r2.onNext(r5);
            r5 = r1.done;
            r5 = r1.checkTerminated(r5, r4, r2, r3);
            if (r5 == 0) goto L_0x00b6;
        L_0x00b5:
            return;
        L_0x00b6:
            r16 = 1;
            r13 = r13 + r16;
            r5 = r6.hasNext();	 Catch:{ Throwable -> 0x00cd }
            if (r5 != 0) goto L_0x00ca;
        L_0x00c1:
            r1.consumedOne(r0);
            r1.current = r7;
            r6 = r7;
            goto L_0x0102;
            r5 = 1;
            goto L_0x0092;
        L_0x00cd:
            r0 = move-exception;
            r3 = r0;
            io.reactivex.exceptions.Exceptions.throwIfFatal(r3);
            r1.current = r7;
            r0 = r1.s;
            r0.cancel();
            r0 = r1.error;
            io.reactivex.internal.util.ExceptionHelper.addThrowable(r0, r3);
            r0 = r1.error;
            r0 = io.reactivex.internal.util.ExceptionHelper.terminate(r0);
            r2.onError(r0);
            return;
        L_0x00e8:
            r0 = move-exception;
            io.reactivex.exceptions.Exceptions.throwIfFatal(r0);
            r1.current = r7;
            r3 = r1.s;
            r3.cancel();
            r3 = r1.error;
            io.reactivex.internal.util.ExceptionHelper.addThrowable(r3, r0);
            r0 = r1.error;
            r0 = io.reactivex.internal.util.ExceptionHelper.terminate(r0);
            r2.onError(r0);
            return;
        L_0x0102:
            r5 = (r13 > r9 ? 1 : (r13 == r9 ? 0 : -1));
            if (r5 != 0) goto L_0x011b;
        L_0x0106:
            r5 = r1.done;
            r15 = r3.isEmpty();
            if (r15 == 0) goto L_0x0112;
        L_0x010e:
            if (r6 != 0) goto L_0x0112;
        L_0x0110:
            r15 = 1;
            goto L_0x0114;
            r15 = r4;
        L_0x0114:
            r5 = r1.checkTerminated(r5, r15, r2, r3);
            if (r5 == 0) goto L_0x011b;
        L_0x011a:
            return;
        L_0x011b:
            r5 = (r13 > r11 ? 1 : (r13 == r11 ? 0 : -1));
            if (r5 == 0) goto L_0x012e;
        L_0x011f:
            r11 = 9223372036854775807; // 0x7fffffffffffffff float:NaN double:NaN;
            r5 = (r9 > r11 ? 1 : (r9 == r11 ? 0 : -1));
            if (r5 == 0) goto L_0x012e;
        L_0x0128:
            r5 = r1.requested;
            r9 = -r13;
            r5.addAndGet(r9);
        L_0x012e:
            if (r6 != 0) goto L_0x0131;
        L_0x0130:
            goto L_0x013a;
        L_0x0131:
            r5 = -r8;
            r8 = r1.addAndGet(r5);
            if (r8 != 0) goto L_0x013a;
            return;
        L_0x013a:
            r5 = 1;
            goto L_0x001b;
            */
            throw new UnsupportedOperationException("Method not decompiled: io.reactivex.internal.operators.flowable.FlowableFlattenIterable.FlattenIterableSubscriber.drain():void");
        }

        void consumedOne(boolean z) {
            if (z) {
                int i = this.consumed + 1;
                if (i == this.limit) {
                    this.consumed = 0;
                    this.s.request((long) i);
                    return;
                }
                this.consumed = i;
            }
        }

        boolean checkTerminated(boolean z, boolean z2, Subscriber<?> subscriber, SimpleQueue<?> simpleQueue) {
            if (this.cancelled) {
                this.current = null;
                simpleQueue.clear();
                return true;
            }
            if (z) {
                if (((Throwable) this.error.get()) != null) {
                    Throwable terminate = ExceptionHelper.terminate(this.error);
                    this.current = null;
                    simpleQueue.clear();
                    subscriber.onError(terminate);
                    return true;
                } else if (z2) {
                    subscriber.onComplete();
                    return true;
                }
            }
            return false;
        }

        public void clear() {
            this.current = null;
            this.queue.clear();
        }

        public boolean isEmpty() {
            Iterator it = this.current;
            if (it == null) {
                return this.queue.isEmpty();
            }
            return it.hasNext() ^ 1;
        }

        @Nullable
        public R poll() throws Exception {
            Iterator it = this.current;
            while (it == null) {
                Object poll = this.queue.poll();
                if (poll != null) {
                    it = ((Iterable) this.mapper.apply(poll)).iterator();
                    if (it.hasNext()) {
                        this.current = it;
                        break;
                    }
                    it = null;
                } else {
                    return null;
                }
            }
            R requireNonNull = ObjectHelper.requireNonNull(it.next(), "The iterator returned a null value");
            if (!it.hasNext()) {
                this.current = null;
            }
            return requireNonNull;
        }

        public int requestFusion(int i) {
            if ((i & 1) == 0 || this.fusionMode != 1) {
                return 0;
            }
            return 1;
        }
    }

    public FlowableFlattenIterable(Flowable<T> flowable, Function<? super T, ? extends Iterable<? extends R>> function, int i) {
        super(flowable);
        this.mapper = function;
        this.prefetch = i;
    }

    public void subscribeActual(Subscriber<? super R> subscriber) {
        if (this.source instanceof Callable) {
            try {
                Object call = ((Callable) this.source).call();
                if (call == null) {
                    EmptySubscription.complete(subscriber);
                    return;
                }
                try {
                    FlowableFromIterable.subscribe(subscriber, ((Iterable) this.mapper.apply(call)).iterator());
                    return;
                } catch (Throwable th) {
                    Exceptions.throwIfFatal(th);
                    EmptySubscription.error(th, subscriber);
                    return;
                }
            } catch (Throwable th2) {
                Exceptions.throwIfFatal(th2);
                EmptySubscription.error(th2, subscriber);
                return;
            }
        }
        this.source.subscribe(new FlattenIterableSubscriber(subscriber, this.mapper, this.prefetch));
    }
}
