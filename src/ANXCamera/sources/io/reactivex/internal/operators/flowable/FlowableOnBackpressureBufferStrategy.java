package io.reactivex.internal.operators.flowable;

import io.reactivex.BackpressureOverflowStrategy;
import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.exceptions.MissingBackpressureException;
import io.reactivex.functions.Action;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.BackpressureHelper;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.ArrayDeque;
import java.util.Deque;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;

public final class FlowableOnBackpressureBufferStrategy<T> extends AbstractFlowableWithUpstream<T, T> {
    final long bufferSize;
    final Action onOverflow;
    final BackpressureOverflowStrategy strategy;

    static final class OnBackpressureBufferStrategySubscriber<T> extends AtomicInteger implements FlowableSubscriber<T>, Subscription {
        private static final long serialVersionUID = 3240706908776709697L;
        final Subscriber<? super T> actual;
        final long bufferSize;
        volatile boolean cancelled;
        final Deque<T> deque = new ArrayDeque();
        volatile boolean done;
        Throwable error;
        final Action onOverflow;
        final AtomicLong requested = new AtomicLong();
        Subscription s;
        final BackpressureOverflowStrategy strategy;

        OnBackpressureBufferStrategySubscriber(Subscriber<? super T> subscriber, Action action, BackpressureOverflowStrategy backpressureOverflowStrategy, long j) {
            this.actual = subscriber;
            this.onOverflow = action;
            this.strategy = backpressureOverflowStrategy;
            this.bufferSize = j;
        }

        public void onSubscribe(Subscription subscription) {
            if (SubscriptionHelper.validate(this.s, subscription)) {
                this.s = subscription;
                this.actual.onSubscribe(this);
                subscription.request(Long.MAX_VALUE);
            }
        }

        public void onNext(T t) {
            if (!this.done) {
                Object obj;
                Object obj2;
                Deque deque = this.deque;
                synchronized (deque) {
                    obj = null;
                    obj2 = 1;
                    if (((long) deque.size()) == this.bufferSize) {
                        switch (this.strategy) {
                            case DROP_LATEST:
                                deque.pollLast();
                                deque.offer(t);
                                break;
                            case DROP_OLDEST:
                                deque.poll();
                                deque.offer(t);
                                break;
                        }
                        obj2 = null;
                        obj = 1;
                    } else {
                        deque.offer(t);
                        obj2 = null;
                    }
                }
                if (obj != null) {
                    if (this.onOverflow != null) {
                        try {
                            this.onOverflow.run();
                        } catch (Throwable th) {
                            Exceptions.throwIfFatal(th);
                            this.s.cancel();
                            onError(th);
                        }
                    }
                } else if (obj2 != null) {
                    this.s.cancel();
                    onError(new MissingBackpressureException());
                } else {
                    drain();
                }
            }
        }

        public void onError(Throwable th) {
            if (this.done) {
                RxJavaPlugins.onError(th);
                return;
            }
            this.error = th;
            this.done = true;
            drain();
        }

        public void onComplete() {
            this.done = true;
            drain();
        }

        public void request(long j) {
            if (SubscriptionHelper.validate(j)) {
                BackpressureHelper.add(this.requested, j);
                drain();
            }
        }

        public void cancel() {
            this.cancelled = true;
            this.s.cancel();
            if (getAndIncrement() == 0) {
                clear(this.deque);
            }
        }

        void clear(Deque<T> deque) {
            synchronized (deque) {
                deque.clear();
            }
        }

        void drain() {
            if (getAndIncrement() == 0) {
                Deque deque = this.deque;
                Subscriber subscriber = this.actual;
                int i = 1;
                while (true) {
                    int i2;
                    long j = this.requested.get();
                    long j2 = 0;
                    while (true) {
                        i2 = (j2 > j ? 1 : (j2 == j ? 0 : -1));
                        if (i2 == 0) {
                            break;
                        } else if (this.cancelled) {
                            clear(deque);
                            return;
                        } else {
                            Object poll;
                            Object obj;
                            boolean z = this.done;
                            synchronized (deque) {
                                poll = deque.poll();
                            }
                            if (poll == null) {
                                obj = 1;
                            } else {
                                obj = null;
                            }
                            if (z) {
                                Throwable th = this.error;
                                if (th != null) {
                                    clear(deque);
                                    subscriber.onError(th);
                                    return;
                                } else if (obj != null) {
                                    subscriber.onComplete();
                                    return;
                                }
                            }
                            if (obj != null) {
                                break;
                            }
                            subscriber.onNext(poll);
                            j2++;
                        }
                    }
                    if (i2 == 0) {
                        if (this.cancelled) {
                            clear(deque);
                            return;
                        }
                        boolean isEmpty;
                        boolean z2 = this.done;
                        synchronized (deque) {
                            isEmpty = deque.isEmpty();
                        }
                        if (z2) {
                            Throwable th2 = this.error;
                            if (th2 != null) {
                                clear(deque);
                                subscriber.onError(th2);
                                return;
                            } else if (isEmpty) {
                                subscriber.onComplete();
                                return;
                            }
                        }
                    }
                    if (j2 != 0) {
                        BackpressureHelper.produced(this.requested, j2);
                    }
                    i = addAndGet(-i);
                    if (i == 0) {
                        return;
                    }
                }
                while (true) {
                }
            }
        }
    }

    public FlowableOnBackpressureBufferStrategy(Flowable<T> flowable, long j, Action action, BackpressureOverflowStrategy backpressureOverflowStrategy) {
        super(flowable);
        this.bufferSize = j;
        this.onOverflow = action;
        this.strategy = backpressureOverflowStrategy;
    }

    protected void subscribeActual(Subscriber<? super T> subscriber) {
        this.source.subscribe(new OnBackpressureBufferStrategySubscriber(subscriber, this.onOverflow, this.strategy, this.bufferSize));
    }
}
