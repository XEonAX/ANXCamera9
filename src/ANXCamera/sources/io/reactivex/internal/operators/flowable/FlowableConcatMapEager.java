package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.exceptions.MissingBackpressureException;
import io.reactivex.functions.Function;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.queue.SpscLinkedArrayQueue;
import io.reactivex.internal.subscribers.InnerQueuedSubscriber;
import io.reactivex.internal.subscribers.InnerQueuedSubscriberSupport;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.AtomicThrowable;
import io.reactivex.internal.util.BackpressureHelper;
import io.reactivex.internal.util.ErrorMode;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import org.reactivestreams.Publisher;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;

public final class FlowableConcatMapEager<T, R> extends AbstractFlowableWithUpstream<T, R> {
    final ErrorMode errorMode;
    final Function<? super T, ? extends Publisher<? extends R>> mapper;
    final int maxConcurrency;
    final int prefetch;

    static final class ConcatMapEagerDelayErrorSubscriber<T, R> extends AtomicInteger implements FlowableSubscriber<T>, InnerQueuedSubscriberSupport<R>, Subscription {
        private static final long serialVersionUID = -4255299542215038287L;
        final Subscriber<? super R> actual;
        volatile boolean cancelled;
        volatile InnerQueuedSubscriber<R> current;
        volatile boolean done;
        final ErrorMode errorMode;
        final AtomicThrowable errors = new AtomicThrowable();
        final Function<? super T, ? extends Publisher<? extends R>> mapper;
        final int maxConcurrency;
        final int prefetch;
        final AtomicLong requested = new AtomicLong();
        Subscription s;
        final SpscLinkedArrayQueue<InnerQueuedSubscriber<R>> subscribers;

        ConcatMapEagerDelayErrorSubscriber(Subscriber<? super R> subscriber, Function<? super T, ? extends Publisher<? extends R>> function, int i, int i2, ErrorMode errorMode) {
            this.actual = subscriber;
            this.mapper = function;
            this.maxConcurrency = i;
            this.prefetch = i2;
            this.errorMode = errorMode;
            this.subscribers = new SpscLinkedArrayQueue(Math.min(i2, i));
        }

        public void onSubscribe(Subscription subscription) {
            if (SubscriptionHelper.validate(this.s, subscription)) {
                this.s = subscription;
                this.actual.onSubscribe(this);
                subscription.request(this.maxConcurrency == Integer.MAX_VALUE ? Long.MAX_VALUE : (long) this.maxConcurrency);
            }
        }

        public void onNext(T t) {
            try {
                Publisher publisher = (Publisher) ObjectHelper.requireNonNull(this.mapper.apply(t), "The mapper returned a null Publisher");
                Object innerQueuedSubscriber = new InnerQueuedSubscriber(this, this.prefetch);
                if (!this.cancelled) {
                    this.subscribers.offer(innerQueuedSubscriber);
                    if (!this.cancelled) {
                        publisher.subscribe(innerQueuedSubscriber);
                        if (this.cancelled) {
                            innerQueuedSubscriber.cancel();
                            drainAndCancel();
                        }
                    }
                }
            } catch (Throwable th) {
                Exceptions.throwIfFatal(th);
                this.s.cancel();
                onError(th);
            }
        }

        public void onError(Throwable th) {
            if (this.errors.addThrowable(th)) {
                this.done = true;
                drain();
                return;
            }
            RxJavaPlugins.onError(th);
        }

        public void onComplete() {
            this.done = true;
            drain();
        }

        public void cancel() {
            if (!this.cancelled) {
                this.cancelled = true;
                this.s.cancel();
                drainAndCancel();
            }
        }

        void drainAndCancel() {
            if (getAndIncrement() == 0) {
                do {
                    cancelAll();
                } while (decrementAndGet() != 0);
            }
        }

        void cancelAll() {
            while (true) {
                InnerQueuedSubscriber innerQueuedSubscriber = (InnerQueuedSubscriber) this.subscribers.poll();
                if (innerQueuedSubscriber != null) {
                    innerQueuedSubscriber.cancel();
                } else {
                    return;
                }
            }
        }

        public void request(long j) {
            if (SubscriptionHelper.validate(j)) {
                BackpressureHelper.add(this.requested, j);
                drain();
            }
        }

        public void innerNext(InnerQueuedSubscriber<R> innerQueuedSubscriber, R r) {
            if (innerQueuedSubscriber.queue().offer(r)) {
                drain();
                return;
            }
            innerQueuedSubscriber.cancel();
            innerError(innerQueuedSubscriber, new MissingBackpressureException());
        }

        public void innerError(InnerQueuedSubscriber<R> innerQueuedSubscriber, Throwable th) {
            if (this.errors.addThrowable(th)) {
                innerQueuedSubscriber.setDone();
                if (this.errorMode != ErrorMode.END) {
                    this.s.cancel();
                }
                drain();
                return;
            }
            RxJavaPlugins.onError(th);
        }

        public void innerComplete(InnerQueuedSubscriber<R> innerQueuedSubscriber) {
            innerQueuedSubscriber.setDone();
            drain();
        }

        /* JADX WARNING: Removed duplicated region for block: B:79:0x013e  */
        /* JADX WARNING: Removed duplicated region for block: B:78:0x0139  */
        /* JADX WARNING: Removed duplicated region for block: B:78:0x0139  */
        /* JADX WARNING: Removed duplicated region for block: B:79:0x013e  */
        public void drain() {
            /*
            r19 = this;
            r1 = r19;
            r0 = r19.getAndIncrement();
            if (r0 == 0) goto L_0x0009;
        L_0x0008:
            return;
            r0 = r1.current;
            r2 = r1.actual;
            r3 = r1.errorMode;
            r5 = 1;
        L_0x0011:
            r6 = r1.requested;
            r6 = r6.get();
            if (r0 != 0) goto L_0x0058;
        L_0x001a:
            r0 = io.reactivex.internal.util.ErrorMode.END;
            if (r3 == r0) goto L_0x0035;
        L_0x001e:
            r0 = r1.errors;
            r0 = r0.get();
            r0 = (java.lang.Throwable) r0;
            if (r0 == 0) goto L_0x0035;
        L_0x0028:
            r19.cancelAll();
            r0 = r1.errors;
            r0 = r0.terminate();
            r2.onError(r0);
            return;
        L_0x0035:
            r0 = r1.done;
            r8 = r1.subscribers;
            r8 = r8.poll();
            r8 = (io.reactivex.internal.subscribers.InnerQueuedSubscriber) r8;
            if (r0 == 0) goto L_0x0053;
        L_0x0041:
            if (r8 != 0) goto L_0x0053;
        L_0x0043:
            r0 = r1.errors;
            r0 = r0.terminate();
            if (r0 == 0) goto L_0x004f;
        L_0x004b:
            r2.onError(r0);
            goto L_0x0052;
        L_0x004f:
            r2.onComplete();
        L_0x0052:
            return;
        L_0x0053:
            if (r8 == 0) goto L_0x0059;
        L_0x0055:
            r1.current = r8;
            goto L_0x0059;
        L_0x0058:
            r8 = r0;
        L_0x0059:
            r11 = 0;
            if (r8 == 0) goto L_0x011b;
        L_0x005c:
            r12 = r8.queue();
            if (r12 == 0) goto L_0x011b;
        L_0x0062:
            r13 = 0;
        L_0x0064:
            r15 = (r13 > r6 ? 1 : (r13 == r6 ? 0 : -1));
            r16 = r5;
            r4 = 1;
            if (r15 == 0) goto L_0x00d4;
        L_0x006c:
            r0 = r1.cancelled;
            if (r0 == 0) goto L_0x0074;
        L_0x0070:
            r19.cancelAll();
            return;
        L_0x0074:
            r0 = io.reactivex.internal.util.ErrorMode.IMMEDIATE;
            if (r3 != r0) goto L_0x0094;
        L_0x0078:
            r0 = r1.errors;
            r0 = r0.get();
            r0 = (java.lang.Throwable) r0;
            if (r0 == 0) goto L_0x0094;
        L_0x0082:
            r1.current = r11;
            r8.cancel();
            r19.cancelAll();
            r0 = r1.errors;
            r0 = r0.terminate();
            r2.onError(r0);
            return;
        L_0x0094:
            r0 = r8.isDone();
            r9 = r12.poll();	 Catch:{ Throwable -> 0x00c3 }
            if (r9 != 0) goto L_0x00a1;
        L_0x009f:
            r10 = 1;
            goto L_0x00a3;
            r10 = 0;
        L_0x00a3:
            if (r0 == 0) goto L_0x00b5;
        L_0x00a5:
            if (r10 == 0) goto L_0x00b5;
            r1.current = r11;
            r0 = r1.s;
            r0.request(r4);
            r8 = r11;
            r17 = 1;
            goto L_0x00d6;
        L_0x00b5:
            if (r10 == 0) goto L_0x00b8;
        L_0x00b7:
            goto L_0x00d4;
        L_0x00b8:
            r2.onNext(r9);
            r13 = r13 + r4;
            r8.requestOne();
            r5 = r16;
            goto L_0x0064;
        L_0x00c3:
            r0 = move-exception;
            r3 = r0;
            io.reactivex.exceptions.Exceptions.throwIfFatal(r3);
            r1.current = r11;
            r8.cancel();
            r19.cancelAll();
            r2.onError(r3);
            return;
        L_0x00d4:
            r17 = 0;
        L_0x00d6:
            if (r15 != 0) goto L_0x0119;
        L_0x00d8:
            r0 = r1.cancelled;
            if (r0 == 0) goto L_0x00e0;
        L_0x00dc:
            r19.cancelAll();
            return;
        L_0x00e0:
            r0 = io.reactivex.internal.util.ErrorMode.IMMEDIATE;
            if (r3 != r0) goto L_0x0100;
        L_0x00e4:
            r0 = r1.errors;
            r0 = r0.get();
            r0 = (java.lang.Throwable) r0;
            if (r0 == 0) goto L_0x0100;
        L_0x00ee:
            r1.current = r11;
            r8.cancel();
            r19.cancelAll();
            r0 = r1.errors;
            r0 = r0.terminate();
            r2.onError(r0);
            return;
        L_0x0100:
            r0 = r8.isDone();
            r9 = r12.isEmpty();
            if (r0 == 0) goto L_0x0119;
        L_0x010a:
            if (r9 == 0) goto L_0x0119;
            r1.current = r11;
            r0 = r1.s;
            r0.request(r4);
            r0 = r11;
            r17 = 1;
            goto L_0x0122;
        L_0x0119:
            r0 = r8;
            goto L_0x0122;
        L_0x011b:
            r16 = r5;
            r0 = r8;
            r13 = 0;
            r17 = 0;
        L_0x0122:
            r4 = 0;
            r4 = (r13 > r4 ? 1 : (r13 == r4 ? 0 : -1));
            if (r4 == 0) goto L_0x0137;
        L_0x0128:
            r4 = 9223372036854775807; // 0x7fffffffffffffff float:NaN double:NaN;
            r4 = (r6 > r4 ? 1 : (r6 == r4 ? 0 : -1));
            if (r4 == 0) goto L_0x0137;
        L_0x0131:
            r4 = r1.requested;
            r5 = -r13;
            r4.addAndGet(r5);
        L_0x0137:
            if (r17 == 0) goto L_0x013e;
            r5 = r16;
            goto L_0x0011;
        L_0x013e:
            r4 = r16;
            r4 = -r4;
            r5 = r1.addAndGet(r4);
            if (r5 != 0) goto L_0x0149;
            return;
        L_0x0149:
            goto L_0x0011;
            */
            throw new UnsupportedOperationException("Method not decompiled: io.reactivex.internal.operators.flowable.FlowableConcatMapEager.ConcatMapEagerDelayErrorSubscriber.drain():void");
        }
    }

    public FlowableConcatMapEager(Flowable<T> flowable, Function<? super T, ? extends Publisher<? extends R>> function, int i, int i2, ErrorMode errorMode) {
        super(flowable);
        this.mapper = function;
        this.maxConcurrency = i;
        this.prefetch = i2;
        this.errorMode = errorMode;
    }

    protected void subscribeActual(Subscriber<? super R> subscriber) {
        this.source.subscribe(new ConcatMapEagerDelayErrorSubscriber(subscriber, this.mapper, this.maxConcurrency, this.prefetch, this.errorMode));
    }
}
