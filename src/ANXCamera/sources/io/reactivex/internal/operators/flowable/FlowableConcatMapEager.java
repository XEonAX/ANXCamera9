package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.exceptions.MissingBackpressureException;
import io.reactivex.functions.Function;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.fuseable.SimpleQueue;
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
        /* Code decompiled incorrectly, please refer to instructions dump. */
        public void drain() {
            if (getAndIncrement() == 0) {
                InnerQueuedSubscriber innerQueuedSubscriber = this.current;
                Subscriber subscriber = this.actual;
                ErrorMode errorMode = this.errorMode;
                int i = 1;
                while (true) {
                    InnerQueuedSubscriber innerQueuedSubscriber2;
                    Throwable terminate;
                    long j;
                    int i2;
                    Object obj;
                    long j2 = this.requested.get();
                    if (innerQueuedSubscriber != null) {
                        innerQueuedSubscriber2 = innerQueuedSubscriber;
                    } else if (errorMode == ErrorMode.END || ((Throwable) this.errors.get()) == null) {
                        innerQueuedSubscriber2 = (InnerQueuedSubscriber) this.subscribers.poll();
                        if (this.done && innerQueuedSubscriber2 == null) {
                            terminate = this.errors.terminate();
                            if (terminate != null) {
                                subscriber.onError(terminate);
                            } else {
                                subscriber.onComplete();
                            }
                            return;
                        } else if (innerQueuedSubscriber2 != null) {
                            this.current = innerQueuedSubscriber2;
                        }
                    } else {
                        cancelAll();
                        subscriber.onError(this.errors.terminate());
                        return;
                    }
                    if (innerQueuedSubscriber2 != null) {
                        SimpleQueue queue = innerQueuedSubscriber2.queue();
                        if (queue != null) {
                            int i3;
                            boolean isDone;
                            j = 0;
                            while (true) {
                                i3 = (j > j2 ? 1 : (j == j2 ? 0 : -1));
                                i2 = i;
                                if (i3 == 0) {
                                    break;
                                } else if (this.cancelled) {
                                    cancelAll();
                                    return;
                                } else if (errorMode != ErrorMode.IMMEDIATE || ((Throwable) this.errors.get()) == null) {
                                    isDone = innerQueuedSubscriber2.isDone();
                                    try {
                                        Object poll = queue.poll();
                                        Object obj2 = poll == null ? 1 : null;
                                        if (isDone && obj2 != null) {
                                            this.current = null;
                                            this.s.request(1);
                                            innerQueuedSubscriber2 = null;
                                            obj = 1;
                                            break;
                                        } else if (obj2 != null) {
                                            break;
                                        } else {
                                            subscriber.onNext(poll);
                                            j++;
                                            innerQueuedSubscriber2.requestOne();
                                            i = i2;
                                        }
                                    } catch (Throwable terminate2) {
                                        Throwable th = terminate2;
                                        Exceptions.throwIfFatal(th);
                                        this.current = null;
                                        innerQueuedSubscriber2.cancel();
                                        cancelAll();
                                        subscriber.onError(th);
                                        return;
                                    }
                                } else {
                                    this.current = null;
                                    innerQueuedSubscriber2.cancel();
                                    cancelAll();
                                    subscriber.onError(this.errors.terminate());
                                    return;
                                }
                            }
                            obj = null;
                            if (i3 == 0) {
                                if (this.cancelled) {
                                    cancelAll();
                                    return;
                                } else if (errorMode != ErrorMode.IMMEDIATE || ((Throwable) this.errors.get()) == null) {
                                    isDone = innerQueuedSubscriber2.isDone();
                                    boolean isEmpty = queue.isEmpty();
                                    if (isDone && isEmpty) {
                                        this.current = null;
                                        this.s.request(1);
                                        innerQueuedSubscriber = null;
                                        obj = 1;
                                        if (!(j == 0 || j2 == Long.MAX_VALUE)) {
                                            this.requested.addAndGet(-j);
                                        }
                                        if (obj != null) {
                                            i = i2;
                                        } else {
                                            i = addAndGet(-i2);
                                            if (i == 0) {
                                                return;
                                            }
                                        }
                                    }
                                } else {
                                    this.current = null;
                                    innerQueuedSubscriber2.cancel();
                                    cancelAll();
                                    subscriber.onError(this.errors.terminate());
                                    return;
                                }
                            }
                            innerQueuedSubscriber = innerQueuedSubscriber2;
                            this.requested.addAndGet(-j);
                            if (obj != null) {
                            }
                        }
                    }
                    i2 = i;
                    innerQueuedSubscriber = innerQueuedSubscriber2;
                    j = 0;
                    obj = null;
                    this.requested.addAndGet(-j);
                    if (obj != null) {
                    }
                }
            }
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
