package io.reactivex.internal.operators.parallel;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.exceptions.MissingBackpressureException;
import io.reactivex.internal.fuseable.SimplePlainQueue;
import io.reactivex.internal.fuseable.SimpleQueue;
import io.reactivex.internal.queue.SpscArrayQueue;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.AtomicThrowable;
import io.reactivex.internal.util.BackpressureHelper;
import io.reactivex.parallel.ParallelFlowable;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;

public final class ParallelJoin<T> extends Flowable<T> {
    final boolean delayErrors;
    final int prefetch;
    final ParallelFlowable<? extends T> source;

    static final class JoinInnerSubscriber<T> extends AtomicReference<Subscription> implements FlowableSubscriber<T> {
        private static final long serialVersionUID = 8410034718427740355L;
        final int limit;
        final JoinSubscriptionBase<T> parent;
        final int prefetch;
        long produced;
        volatile SimplePlainQueue<T> queue;

        JoinInnerSubscriber(JoinSubscriptionBase<T> joinSubscriptionBase, int i) {
            this.parent = joinSubscriptionBase;
            this.prefetch = i;
            this.limit = i - (i >> 2);
        }

        public void onSubscribe(Subscription subscription) {
            if (SubscriptionHelper.setOnce(this, subscription)) {
                subscription.request((long) this.prefetch);
            }
        }

        public void onNext(T t) {
            this.parent.onNext(this, t);
        }

        public void onError(Throwable th) {
            this.parent.onError(th);
        }

        public void onComplete() {
            this.parent.onComplete();
        }

        public void requestOne() {
            long j = this.produced + 1;
            if (j == ((long) this.limit)) {
                this.produced = 0;
                ((Subscription) get()).request(j);
                return;
            }
            this.produced = j;
        }

        public void request(long j) {
            long j2 = this.produced + j;
            if (j2 >= ((long) this.limit)) {
                this.produced = 0;
                ((Subscription) get()).request(j2);
                return;
            }
            this.produced = j2;
        }

        public boolean cancel() {
            return SubscriptionHelper.cancel(this);
        }

        SimplePlainQueue<T> getQueue() {
            SimplePlainQueue<T> simplePlainQueue = this.queue;
            if (simplePlainQueue != null) {
                return simplePlainQueue;
            }
            simplePlainQueue = new SpscArrayQueue(this.prefetch);
            this.queue = simplePlainQueue;
            return simplePlainQueue;
        }
    }

    static abstract class JoinSubscriptionBase<T> extends AtomicInteger implements Subscription {
        private static final long serialVersionUID = 3100232009247827843L;
        final Subscriber<? super T> actual;
        volatile boolean cancelled;
        final AtomicInteger done = new AtomicInteger();
        final AtomicThrowable errors = new AtomicThrowable();
        final AtomicLong requested = new AtomicLong();
        final JoinInnerSubscriber<T>[] subscribers;

        abstract void drain();

        abstract void onComplete();

        abstract void onError(Throwable th);

        abstract void onNext(JoinInnerSubscriber<T> joinInnerSubscriber, T t);

        JoinSubscriptionBase(Subscriber<? super T> subscriber, int i, int i2) {
            this.actual = subscriber;
            JoinInnerSubscriber[] joinInnerSubscriberArr = new JoinInnerSubscriber[i];
            for (int i3 = 0; i3 < i; i3++) {
                joinInnerSubscriberArr[i3] = new JoinInnerSubscriber(this, i2);
            }
            this.subscribers = joinInnerSubscriberArr;
            this.done.lazySet(i);
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
                cancelAll();
                if (getAndIncrement() == 0) {
                    cleanup();
                }
            }
        }

        void cancelAll() {
            for (JoinInnerSubscriber cancel : this.subscribers) {
                cancel.cancel();
            }
        }

        void cleanup() {
            for (JoinInnerSubscriber joinInnerSubscriber : this.subscribers) {
                joinInnerSubscriber.queue = null;
            }
        }
    }

    static final class JoinSubscription<T> extends JoinSubscriptionBase<T> {
        private static final long serialVersionUID = 6312374661811000451L;

        JoinSubscription(Subscriber<? super T> subscriber, int i, int i2) {
            super(subscriber, i, i2);
        }

        public void onNext(JoinInnerSubscriber<T> joinInnerSubscriber, T t) {
            if (get() == 0 && compareAndSet(0, 1)) {
                if (this.requested.get() != 0) {
                    this.actual.onNext(t);
                    if (this.requested.get() != Long.MAX_VALUE) {
                        this.requested.decrementAndGet();
                    }
                    joinInnerSubscriber.request(1);
                } else if (!joinInnerSubscriber.getQueue().offer(t)) {
                    cancelAll();
                    Throwable missingBackpressureException = new MissingBackpressureException("Queue full?!");
                    if (this.errors.compareAndSet(null, missingBackpressureException)) {
                        this.actual.onError(missingBackpressureException);
                    } else {
                        RxJavaPlugins.onError(missingBackpressureException);
                    }
                    return;
                }
                if (decrementAndGet() == 0) {
                    return;
                }
            } else if (!joinInnerSubscriber.getQueue().offer(t)) {
                cancelAll();
                onError(new MissingBackpressureException("Queue full?!"));
                return;
            } else if (getAndIncrement() != 0) {
                return;
            }
            drainLoop();
        }

        public void onError(Throwable th) {
            if (this.errors.compareAndSet(null, th)) {
                cancelAll();
                drain();
            } else if (th != this.errors.get()) {
                RxJavaPlugins.onError(th);
            }
        }

        public void onComplete() {
            this.done.decrementAndGet();
            drain();
        }

        void drain() {
            if (getAndIncrement() == 0) {
                drainLoop();
            }
        }

        void drainLoop() {
            JoinInnerSubscriber[] joinInnerSubscriberArr = this.subscribers;
            Subscriber subscriber = this.actual;
            int i = 1;
            while (true) {
                long j;
                long j2 = this.requested.get();
                long j3 = 0;
                while (j3 != j2) {
                    if (this.cancelled) {
                        cleanup();
                        return;
                    }
                    Throwable th = (Throwable) this.errors.get();
                    if (th != null) {
                        cleanup();
                        subscriber.onError(th);
                        return;
                    }
                    Object obj = this.done.get() == 0 ? 1 : null;
                    long j4 = j3;
                    Object obj2 = 1;
                    for (JoinInnerSubscriber joinInnerSubscriber : joinInnerSubscriberArr) {
                        SimplePlainQueue simplePlainQueue = joinInnerSubscriber.queue;
                        if (simplePlainQueue != null) {
                            Object poll = simplePlainQueue.poll();
                            if (poll != null) {
                                subscriber.onNext(poll);
                                joinInnerSubscriber.requestOne();
                                j = j4 + 1;
                                if (j == j2) {
                                    break;
                                }
                                j4 = j;
                                obj2 = null;
                            } else {
                                continue;
                            }
                        }
                    }
                    if (obj != null && obj2 != null) {
                        subscriber.onComplete();
                        return;
                    } else if (obj2 != null) {
                        j = j4;
                        break;
                    } else {
                        j3 = j4;
                    }
                }
                j = j3;
                if (j == j2) {
                    if (this.cancelled) {
                        cleanup();
                        return;
                    }
                    Throwable th2 = (Throwable) this.errors.get();
                    if (th2 != null) {
                        cleanup();
                        subscriber.onError(th2);
                        return;
                    }
                    Object obj3;
                    Object obj4 = this.done.get() == 0 ? 1 : null;
                    for (JoinInnerSubscriber joinInnerSubscriber2 : joinInnerSubscriberArr) {
                        SimpleQueue simpleQueue = joinInnerSubscriber2.queue;
                        if (simpleQueue != null && !simpleQueue.isEmpty()) {
                            obj3 = null;
                            break;
                        }
                    }
                    obj3 = 1;
                    if (!(obj4 == null || obj3 == null)) {
                        subscriber.onComplete();
                        return;
                    }
                }
                if (!(j == 0 || j2 == Long.MAX_VALUE)) {
                    this.requested.addAndGet(-j);
                }
                int i2 = get();
                if (i2 == i) {
                    i2 = addAndGet(-i);
                    if (i2 == 0) {
                        return;
                    }
                }
                i = i2;
            }
        }
    }

    static final class JoinSubscriptionDelayError<T> extends JoinSubscriptionBase<T> {
        private static final long serialVersionUID = -5737965195918321883L;

        JoinSubscriptionDelayError(Subscriber<? super T> subscriber, int i, int i2) {
            super(subscriber, i, i2);
        }

        void onNext(JoinInnerSubscriber<T> joinInnerSubscriber, T t) {
            if (get() == 0 && compareAndSet(0, 1)) {
                if (this.requested.get() != 0) {
                    this.actual.onNext(t);
                    if (this.requested.get() != Long.MAX_VALUE) {
                        this.requested.decrementAndGet();
                    }
                    joinInnerSubscriber.request(1);
                } else if (!joinInnerSubscriber.getQueue().offer(t)) {
                    joinInnerSubscriber.cancel();
                    this.errors.addThrowable(new MissingBackpressureException("Queue full?!"));
                    this.done.decrementAndGet();
                    drainLoop();
                    return;
                }
                if (decrementAndGet() == 0) {
                    return;
                }
            }
            if (!joinInnerSubscriber.getQueue().offer(t) && joinInnerSubscriber.cancel()) {
                this.errors.addThrowable(new MissingBackpressureException("Queue full?!"));
                this.done.decrementAndGet();
            }
            if (getAndIncrement() != 0) {
                return;
            }
            drainLoop();
        }

        void onError(Throwable th) {
            this.errors.addThrowable(th);
            this.done.decrementAndGet();
            drain();
        }

        void onComplete() {
            this.done.decrementAndGet();
            drain();
        }

        void drain() {
            if (getAndIncrement() == 0) {
                drainLoop();
            }
        }

        void drainLoop() {
            JoinInnerSubscriber[] joinInnerSubscriberArr = this.subscribers;
            Subscriber subscriber = this.actual;
            int i = 1;
            while (true) {
                long j;
                long j2 = this.requested.get();
                long j3 = 0;
                while (j3 != j2) {
                    if (this.cancelled) {
                        cleanup();
                        return;
                    }
                    Object obj = this.done.get() == 0 ? 1 : null;
                    long j4 = j3;
                    Object obj2 = 1;
                    for (JoinInnerSubscriber joinInnerSubscriber : joinInnerSubscriberArr) {
                        SimplePlainQueue simplePlainQueue = joinInnerSubscriber.queue;
                        if (simplePlainQueue != null) {
                            Object poll = simplePlainQueue.poll();
                            if (poll != null) {
                                subscriber.onNext(poll);
                                joinInnerSubscriber.requestOne();
                                j = j4 + 1;
                                if (j == j2) {
                                    break;
                                }
                                j4 = j;
                                obj2 = null;
                            } else {
                                continue;
                            }
                        }
                    }
                    if (obj != null && obj2 != null) {
                        if (((Throwable) this.errors.get()) != null) {
                            subscriber.onError(this.errors.terminate());
                        } else {
                            subscriber.onComplete();
                        }
                        return;
                    } else if (obj2 != null) {
                        j = j4;
                        break;
                    } else {
                        j3 = j4;
                    }
                }
                j = j3;
                if (j == j2) {
                    if (this.cancelled) {
                        cleanup();
                        return;
                    }
                    Object obj3;
                    Object obj4 = this.done.get() == 0 ? 1 : null;
                    for (JoinInnerSubscriber joinInnerSubscriber2 : joinInnerSubscriberArr) {
                        SimpleQueue simpleQueue = joinInnerSubscriber2.queue;
                        if (simpleQueue != null && !simpleQueue.isEmpty()) {
                            obj3 = null;
                            break;
                        }
                    }
                    obj3 = 1;
                    if (!(obj4 == null || obj3 == null)) {
                        if (((Throwable) this.errors.get()) != null) {
                            subscriber.onError(this.errors.terminate());
                        } else {
                            subscriber.onComplete();
                        }
                        return;
                    }
                }
                if (!(j == 0 || j2 == Long.MAX_VALUE)) {
                    this.requested.addAndGet(-j);
                }
                int i2 = get();
                if (i2 == i) {
                    i2 = addAndGet(-i);
                    if (i2 == 0) {
                        return;
                    }
                }
                i = i2;
            }
        }
    }

    public ParallelJoin(ParallelFlowable<? extends T> parallelFlowable, int i, boolean z) {
        this.source = parallelFlowable;
        this.prefetch = i;
        this.delayErrors = z;
    }

    protected void subscribeActual(Subscriber<? super T> subscriber) {
        Object joinSubscriptionDelayError;
        if (this.delayErrors) {
            joinSubscriptionDelayError = new JoinSubscriptionDelayError(subscriber, this.source.parallelism(), this.prefetch);
        } else {
            joinSubscriptionDelayError = new JoinSubscription(subscriber, this.source.parallelism(), this.prefetch);
        }
        subscriber.onSubscribe(joinSubscriptionDelayError);
        this.source.subscribe(joinSubscriptionDelayError.subscribers);
    }
}
