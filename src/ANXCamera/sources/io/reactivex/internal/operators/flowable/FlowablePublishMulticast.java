package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.exceptions.MissingBackpressureException;
import io.reactivex.functions.Function;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.fuseable.QueueSubscription;
import io.reactivex.internal.fuseable.SimpleQueue;
import io.reactivex.internal.subscriptions.EmptySubscription;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.BackpressureHelper;
import io.reactivex.internal.util.QueueDrainHelper;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;
import org.reactivestreams.Publisher;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;

public final class FlowablePublishMulticast<T, R> extends AbstractFlowableWithUpstream<T, R> {
    final boolean delayError;
    final int prefetch;
    final Function<? super Flowable<T>, ? extends Publisher<? extends R>> selector;

    static final class MulticastProcessor<T> extends Flowable<T> implements FlowableSubscriber<T>, Disposable {
        static final MulticastSubscription[] EMPTY = new MulticastSubscription[0];
        static final MulticastSubscription[] TERMINATED = new MulticastSubscription[0];
        int consumed;
        final boolean delayError;
        volatile boolean done;
        Throwable error;
        final int limit;
        final int prefetch;
        volatile SimpleQueue<T> queue;
        final AtomicReference<Subscription> s = new AtomicReference();
        int sourceMode;
        final AtomicReference<MulticastSubscription<T>[]> subscribers = new AtomicReference(EMPTY);
        final AtomicInteger wip = new AtomicInteger();

        MulticastProcessor(int i, boolean z) {
            this.prefetch = i;
            this.limit = i - (i >> 2);
            this.delayError = z;
        }

        public void onSubscribe(Subscription subscription) {
            if (SubscriptionHelper.setOnce(this.s, subscription)) {
                if (subscription instanceof QueueSubscription) {
                    QueueSubscription queueSubscription = (QueueSubscription) subscription;
                    int requestFusion = queueSubscription.requestFusion(3);
                    if (requestFusion == 1) {
                        this.sourceMode = requestFusion;
                        this.queue = queueSubscription;
                        this.done = true;
                        drain();
                        return;
                    } else if (requestFusion == 2) {
                        this.sourceMode = requestFusion;
                        this.queue = queueSubscription;
                        QueueDrainHelper.request(subscription, this.prefetch);
                        return;
                    }
                }
                this.queue = QueueDrainHelper.createQueue(this.prefetch);
                QueueDrainHelper.request(subscription, this.prefetch);
            }
        }

        public void dispose() {
            SubscriptionHelper.cancel(this.s);
            if (this.wip.getAndIncrement() == 0) {
                SimpleQueue simpleQueue = this.queue;
                if (simpleQueue != null) {
                    simpleQueue.clear();
                }
            }
        }

        public boolean isDisposed() {
            return SubscriptionHelper.isCancelled((Subscription) this.s.get());
        }

        public void onNext(T t) {
            if (!this.done) {
                if (this.sourceMode != 0 || this.queue.offer(t)) {
                    drain();
                    return;
                }
                ((Subscription) this.s.get()).cancel();
                onError(new MissingBackpressureException());
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
            if (!this.done) {
                this.done = true;
                drain();
            }
        }

        boolean add(MulticastSubscription<T> multicastSubscription) {
            while (true) {
                MulticastSubscription[] multicastSubscriptionArr = (MulticastSubscription[]) this.subscribers.get();
                if (multicastSubscriptionArr == TERMINATED) {
                    return false;
                }
                int length = multicastSubscriptionArr.length;
                Object obj = new MulticastSubscription[(length + 1)];
                System.arraycopy(multicastSubscriptionArr, 0, obj, 0, length);
                obj[length] = multicastSubscription;
                if (this.subscribers.compareAndSet(multicastSubscriptionArr, obj)) {
                    return true;
                }
            }
        }

        void remove(MulticastSubscription<T> multicastSubscription) {
            while (true) {
                MulticastSubscription[] multicastSubscriptionArr = (MulticastSubscription[]) this.subscribers.get();
                if (multicastSubscriptionArr != TERMINATED && multicastSubscriptionArr != EMPTY) {
                    int length = multicastSubscriptionArr.length;
                    int i = -1;
                    for (int i2 = 0; i2 < length; i2++) {
                        if (multicastSubscriptionArr[i2] == multicastSubscription) {
                            i = i2;
                            break;
                        }
                    }
                    if (i >= 0) {
                        Object obj;
                        if (length == 1) {
                            obj = EMPTY;
                        } else {
                            Object obj2 = new MulticastSubscription[(length - 1)];
                            System.arraycopy(multicastSubscriptionArr, 0, obj2, 0, i);
                            System.arraycopy(multicastSubscriptionArr, i + 1, obj2, i, (length - i) - 1);
                            obj = obj2;
                        }
                        if (this.subscribers.compareAndSet(multicastSubscriptionArr, obj)) {
                            return;
                        }
                    } else {
                        return;
                    }
                }
            }
        }

        protected void subscribeActual(Subscriber<? super T> subscriber) {
            MulticastSubscription multicastSubscription = new MulticastSubscription(subscriber, this);
            subscriber.onSubscribe(multicastSubscription);
            if (!add(multicastSubscription)) {
                Throwable th = this.error;
                if (th != null) {
                    subscriber.onError(th);
                } else {
                    subscriber.onComplete();
                }
            } else if (multicastSubscription.isCancelled()) {
                remove(multicastSubscription);
            } else {
                drain();
            }
        }

        void drain() {
            if (this.wip.getAndIncrement() == 0) {
                SimpleQueue simpleQueue = this.queue;
                int i = this.consumed;
                int i2 = this.limit;
                Object obj = this.sourceMode != 1 ? 1 : null;
                int i3 = i;
                i = 1;
                while (true) {
                    MulticastSubscription[] multicastSubscriptionArr = (MulticastSubscription[]) this.subscribers.get();
                    int length = multicastSubscriptionArr.length;
                    if (!(simpleQueue == null || length == 0)) {
                        long j;
                        boolean z;
                        Throwable th;
                        Throwable th2;
                        int length2;
                        int length3 = multicastSubscriptionArr.length;
                        long j2 = Long.MAX_VALUE;
                        length = 0;
                        while (true) {
                            j = Long.MIN_VALUE;
                            if (length >= length3) {
                                break;
                            }
                            long j3 = multicastSubscriptionArr[length].get();
                            if (j3 != Long.MIN_VALUE && j2 > j3) {
                                j2 = j3;
                            }
                            length++;
                        }
                        long j4 = 0;
                        while (true) {
                            length3 = (j4 > j2 ? 1 : (j4 == j2 ? 0 : -1));
                            if (length3 == 0) {
                                break;
                            } else if (isDisposed()) {
                                simpleQueue.clear();
                                return;
                            } else {
                                z = this.done;
                                if (z && !this.delayError) {
                                    th = this.error;
                                    if (th != null) {
                                        errorAll(th);
                                        return;
                                    }
                                }
                                try {
                                    Object poll = simpleQueue.poll();
                                    Object obj2 = poll == null ? 1 : null;
                                    if (z && obj2 != null) {
                                        th2 = this.error;
                                        if (th2 != null) {
                                            errorAll(th2);
                                        } else {
                                            completeAll();
                                        }
                                        return;
                                    } else if (obj2 != null) {
                                        break;
                                    } else {
                                        length2 = multicastSubscriptionArr.length;
                                        length3 = 0;
                                        while (length3 < length2) {
                                            MulticastSubscription multicastSubscription = multicastSubscriptionArr[length3];
                                            if (multicastSubscription.get() != Long.MIN_VALUE) {
                                                multicastSubscription.actual.onNext(poll);
                                            }
                                            length3++;
                                            j = Long.MIN_VALUE;
                                        }
                                        long j5 = j;
                                        j4++;
                                        if (obj != null) {
                                            length2 = i3 + 1;
                                            if (length2 == i2) {
                                                ((Subscription) this.s.get()).request((long) i2);
                                                i3 = 0;
                                            } else {
                                                i3 = length2;
                                            }
                                        }
                                        j = j5;
                                    }
                                } catch (Throwable th22) {
                                    Throwable th3 = th22;
                                    Exceptions.throwIfFatal(th3);
                                    SubscriptionHelper.cancel(this.s);
                                    errorAll(th3);
                                    return;
                                }
                            }
                        }
                        if (length3 == 0) {
                            if (isDisposed()) {
                                simpleQueue.clear();
                                return;
                            }
                            z = this.done;
                            if (z && !this.delayError) {
                                th = this.error;
                                if (th != null) {
                                    errorAll(th);
                                    return;
                                }
                            }
                            if (z && simpleQueue.isEmpty()) {
                                th22 = this.error;
                                if (th22 != null) {
                                    errorAll(th22);
                                } else {
                                    completeAll();
                                }
                                return;
                            }
                        }
                        for (AtomicLong produced : multicastSubscriptionArr) {
                            BackpressureHelper.produced(produced, j4);
                        }
                    }
                    this.consumed = i3;
                    i = this.wip.addAndGet(-i);
                    if (i != 0) {
                        if (simpleQueue == null) {
                            simpleQueue = this.queue;
                        }
                    } else {
                        return;
                    }
                }
            }
        }

        void errorAll(Throwable th) {
            for (MulticastSubscription multicastSubscription : (MulticastSubscription[]) this.subscribers.getAndSet(TERMINATED)) {
                if (multicastSubscription.get() != Long.MIN_VALUE) {
                    multicastSubscription.actual.onError(th);
                }
            }
        }

        void completeAll() {
            for (MulticastSubscription multicastSubscription : (MulticastSubscription[]) this.subscribers.getAndSet(TERMINATED)) {
                if (multicastSubscription.get() != Long.MIN_VALUE) {
                    multicastSubscription.actual.onComplete();
                }
            }
        }
    }

    static final class MulticastSubscription<T> extends AtomicLong implements Subscription {
        private static final long serialVersionUID = 8664815189257569791L;
        final Subscriber<? super T> actual;
        final MulticastProcessor<T> parent;

        MulticastSubscription(Subscriber<? super T> subscriber, MulticastProcessor<T> multicastProcessor) {
            this.actual = subscriber;
            this.parent = multicastProcessor;
        }

        public void request(long j) {
            if (SubscriptionHelper.validate(j)) {
                BackpressureHelper.addCancel(this, j);
                this.parent.drain();
            }
        }

        public void cancel() {
            if (getAndSet(Long.MIN_VALUE) != Long.MIN_VALUE) {
                this.parent.remove(this);
                this.parent.drain();
            }
        }

        public boolean isCancelled() {
            return get() == Long.MIN_VALUE;
        }
    }

    static final class OutputCanceller<R> implements FlowableSubscriber<R>, Subscription {
        final Subscriber<? super R> actual;
        final MulticastProcessor<?> processor;
        Subscription s;

        OutputCanceller(Subscriber<? super R> subscriber, MulticastProcessor<?> multicastProcessor) {
            this.actual = subscriber;
            this.processor = multicastProcessor;
        }

        public void onSubscribe(Subscription subscription) {
            if (SubscriptionHelper.validate(this.s, subscription)) {
                this.s = subscription;
                this.actual.onSubscribe(this);
            }
        }

        public void onNext(R r) {
            this.actual.onNext(r);
        }

        public void onError(Throwable th) {
            this.actual.onError(th);
            this.processor.dispose();
        }

        public void onComplete() {
            this.actual.onComplete();
            this.processor.dispose();
        }

        public void request(long j) {
            this.s.request(j);
        }

        public void cancel() {
            this.s.cancel();
            this.processor.dispose();
        }
    }

    public FlowablePublishMulticast(Flowable<T> flowable, Function<? super Flowable<T>, ? extends Publisher<? extends R>> function, int i, boolean z) {
        super(flowable);
        this.selector = function;
        this.prefetch = i;
        this.delayError = z;
    }

    protected void subscribeActual(Subscriber<? super R> subscriber) {
        FlowableSubscriber multicastProcessor = new MulticastProcessor(this.prefetch, this.delayError);
        try {
            ((Publisher) ObjectHelper.requireNonNull(this.selector.apply(multicastProcessor), "selector returned a null Publisher")).subscribe(new OutputCanceller(subscriber, multicastProcessor));
            this.source.subscribe(multicastProcessor);
        } catch (Throwable th) {
            Exceptions.throwIfFatal(th);
            EmptySubscription.error(th, subscriber);
        }
    }
}
