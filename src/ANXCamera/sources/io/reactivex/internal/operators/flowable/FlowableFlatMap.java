package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.exceptions.MissingBackpressureException;
import io.reactivex.functions.Function;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.fuseable.QueueSubscription;
import io.reactivex.internal.fuseable.SimplePlainQueue;
import io.reactivex.internal.fuseable.SimpleQueue;
import io.reactivex.internal.queue.SpscArrayQueue;
import io.reactivex.internal.queue.SpscLinkedArrayQueue;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.AtomicThrowable;
import io.reactivex.internal.util.BackpressureHelper;
import io.reactivex.internal.util.ExceptionHelper;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.Callable;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;
import org.reactivestreams.Publisher;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;

public final class FlowableFlatMap<T, U> extends AbstractFlowableWithUpstream<T, U> {
    final int bufferSize;
    final boolean delayErrors;
    final Function<? super T, ? extends Publisher<? extends U>> mapper;
    final int maxConcurrency;

    static final class InnerSubscriber<T, U> extends AtomicReference<Subscription> implements FlowableSubscriber<U>, Disposable {
        private static final long serialVersionUID = -4606175640614850599L;
        final int bufferSize;
        volatile boolean done;
        int fusionMode;
        final long id;
        final int limit = (this.bufferSize >> 2);
        final MergeSubscriber<T, U> parent;
        long produced;
        volatile SimpleQueue<U> queue;

        InnerSubscriber(MergeSubscriber<T, U> mergeSubscriber, long j) {
            this.id = j;
            this.parent = mergeSubscriber;
            this.bufferSize = mergeSubscriber.bufferSize;
        }

        public void onSubscribe(Subscription subscription) {
            if (SubscriptionHelper.setOnce(this, subscription)) {
                if (subscription instanceof QueueSubscription) {
                    QueueSubscription queueSubscription = (QueueSubscription) subscription;
                    int requestFusion = queueSubscription.requestFusion(7);
                    if (requestFusion == 1) {
                        this.fusionMode = requestFusion;
                        this.queue = queueSubscription;
                        this.done = true;
                        this.parent.drain();
                        return;
                    } else if (requestFusion == 2) {
                        this.fusionMode = requestFusion;
                        this.queue = queueSubscription;
                    }
                }
                subscription.request((long) this.bufferSize);
            }
        }

        public void onNext(U u) {
            if (this.fusionMode != 2) {
                this.parent.tryEmit(u, this);
            } else {
                this.parent.drain();
            }
        }

        public void onError(Throwable th) {
            lazySet(SubscriptionHelper.CANCELLED);
            this.parent.innerError(this, th);
        }

        public void onComplete() {
            this.done = true;
            this.parent.drain();
        }

        void requestMore(long j) {
            if (this.fusionMode != 1) {
                long j2 = this.produced + j;
                if (j2 >= ((long) this.limit)) {
                    this.produced = 0;
                    ((Subscription) get()).request(j2);
                    return;
                }
                this.produced = j2;
            }
        }

        public void dispose() {
            SubscriptionHelper.cancel(this);
        }

        public boolean isDisposed() {
            return get() == SubscriptionHelper.CANCELLED;
        }
    }

    static final class MergeSubscriber<T, U> extends AtomicInteger implements FlowableSubscriber<T>, Subscription {
        static final InnerSubscriber<?, ?>[] CANCELLED = new InnerSubscriber[0];
        static final InnerSubscriber<?, ?>[] EMPTY = new InnerSubscriber[0];
        private static final long serialVersionUID = -2117620485640801370L;
        final Subscriber<? super U> actual;
        final int bufferSize;
        volatile boolean cancelled;
        final boolean delayErrors;
        volatile boolean done;
        final AtomicThrowable errs = new AtomicThrowable();
        long lastId;
        int lastIndex;
        final Function<? super T, ? extends Publisher<? extends U>> mapper;
        final int maxConcurrency;
        volatile SimplePlainQueue<U> queue;
        final AtomicLong requested = new AtomicLong();
        int scalarEmitted;
        final int scalarLimit;
        final AtomicReference<InnerSubscriber<?, ?>[]> subscribers = new AtomicReference();
        long uniqueId;
        Subscription upstream;

        MergeSubscriber(Subscriber<? super U> subscriber, Function<? super T, ? extends Publisher<? extends U>> function, boolean z, int i, int i2) {
            this.actual = subscriber;
            this.mapper = function;
            this.delayErrors = z;
            this.maxConcurrency = i;
            this.bufferSize = i2;
            this.scalarLimit = Math.max(1, i >> 1);
            this.subscribers.lazySet(EMPTY);
        }

        public void onSubscribe(Subscription subscription) {
            if (SubscriptionHelper.validate(this.upstream, subscription)) {
                this.upstream = subscription;
                this.actual.onSubscribe(this);
                if (!this.cancelled) {
                    if (this.maxConcurrency == Integer.MAX_VALUE) {
                        subscription.request(Long.MAX_VALUE);
                    } else {
                        subscription.request((long) this.maxConcurrency);
                    }
                }
            }
        }

        public void onNext(T t) {
            if (!this.done) {
                try {
                    Publisher publisher = (Publisher) ObjectHelper.requireNonNull(this.mapper.apply(t), "The mapper returned a null Publisher");
                    if (publisher instanceof Callable) {
                        try {
                            Object call = ((Callable) publisher).call();
                            if (call != null) {
                                tryEmitScalar(call);
                            } else if (!(this.maxConcurrency == Integer.MAX_VALUE || this.cancelled)) {
                                int i = this.scalarEmitted + 1;
                                this.scalarEmitted = i;
                                if (i == this.scalarLimit) {
                                    this.scalarEmitted = 0;
                                    this.upstream.request((long) this.scalarLimit);
                                }
                            }
                        } catch (Throwable th) {
                            Exceptions.throwIfFatal(th);
                            this.errs.addThrowable(th);
                            drain();
                            return;
                        }
                    }
                    long j = this.uniqueId;
                    this.uniqueId = 1 + j;
                    Subscriber innerSubscriber = new InnerSubscriber(this, j);
                    if (addInner(innerSubscriber)) {
                        publisher.subscribe(innerSubscriber);
                    }
                } catch (Throwable th2) {
                    Exceptions.throwIfFatal(th2);
                    this.upstream.cancel();
                    onError(th2);
                }
            }
        }

        boolean addInner(InnerSubscriber<T, U> innerSubscriber) {
            while (true) {
                InnerSubscriber[] innerSubscriberArr = (InnerSubscriber[]) this.subscribers.get();
                if (innerSubscriberArr == CANCELLED) {
                    innerSubscriber.dispose();
                    return false;
                }
                int length = innerSubscriberArr.length;
                Object obj = new InnerSubscriber[(length + 1)];
                System.arraycopy(innerSubscriberArr, 0, obj, 0, length);
                obj[length] = innerSubscriber;
                if (this.subscribers.compareAndSet(innerSubscriberArr, obj)) {
                    return true;
                }
            }
        }

        void removeInner(InnerSubscriber<T, U> innerSubscriber) {
            while (true) {
                InnerSubscriber[] innerSubscriberArr = (InnerSubscriber[]) this.subscribers.get();
                if (innerSubscriberArr != CANCELLED && innerSubscriberArr != EMPTY) {
                    int length = innerSubscriberArr.length;
                    int i = -1;
                    for (int i2 = 0; i2 < length; i2++) {
                        if (innerSubscriberArr[i2] == innerSubscriber) {
                            i = i2;
                            break;
                        }
                    }
                    if (i >= 0) {
                        Object obj;
                        if (length == 1) {
                            obj = EMPTY;
                        } else {
                            Object obj2 = new InnerSubscriber[(length - 1)];
                            System.arraycopy(innerSubscriberArr, 0, obj2, 0, i);
                            System.arraycopy(innerSubscriberArr, i + 1, obj2, i, (length - i) - 1);
                            obj = obj2;
                        }
                        if (this.subscribers.compareAndSet(innerSubscriberArr, obj)) {
                            return;
                        }
                    } else {
                        return;
                    }
                }
            }
        }

        SimpleQueue<U> getMainQueue() {
            SimpleQueue<U> simpleQueue = this.queue;
            if (simpleQueue == null) {
                if (this.maxConcurrency == Integer.MAX_VALUE) {
                    simpleQueue = new SpscLinkedArrayQueue(this.bufferSize);
                } else {
                    simpleQueue = new SpscArrayQueue(this.maxConcurrency);
                }
                this.queue = simpleQueue;
            }
            return simpleQueue;
        }

        void tryEmitScalar(U u) {
            if (get() == 0 && compareAndSet(0, 1)) {
                long j = this.requested.get();
                SimpleQueue simpleQueue = this.queue;
                if (j == 0 || !(simpleQueue == null || simpleQueue.isEmpty())) {
                    if (simpleQueue == null) {
                        simpleQueue = getMainQueue();
                    }
                    if (!simpleQueue.offer(u)) {
                        onError(new IllegalStateException("Scalar queue full?!"));
                        return;
                    }
                }
                this.actual.onNext(u);
                if (j != Long.MAX_VALUE) {
                    this.requested.decrementAndGet();
                }
                if (!(this.maxConcurrency == Integer.MAX_VALUE || this.cancelled)) {
                    int i = this.scalarEmitted + 1;
                    this.scalarEmitted = i;
                    if (i == this.scalarLimit) {
                        this.scalarEmitted = 0;
                        this.upstream.request((long) this.scalarLimit);
                    }
                }
                if (decrementAndGet() == 0) {
                    return;
                }
            } else if (!getMainQueue().offer(u)) {
                onError(new IllegalStateException("Scalar queue full?!"));
                return;
            } else if (getAndIncrement() != 0) {
                return;
            }
            drainLoop();
        }

        SimpleQueue<U> getInnerQueue(InnerSubscriber<T, U> innerSubscriber) {
            SimpleQueue<U> simpleQueue = innerSubscriber.queue;
            if (simpleQueue != null) {
                return simpleQueue;
            }
            simpleQueue = new SpscArrayQueue(this.bufferSize);
            innerSubscriber.queue = simpleQueue;
            return simpleQueue;
        }

        void tryEmit(U u, InnerSubscriber<T, U> innerSubscriber) {
            if (get() == 0 && compareAndSet(0, 1)) {
                long j = this.requested.get();
                SimpleQueue simpleQueue = innerSubscriber.queue;
                if (j == 0 || !(simpleQueue == null || simpleQueue.isEmpty())) {
                    if (simpleQueue == null) {
                        simpleQueue = getInnerQueue(innerSubscriber);
                    }
                    if (!simpleQueue.offer(u)) {
                        onError(new MissingBackpressureException("Inner queue full?!"));
                        return;
                    }
                }
                this.actual.onNext(u);
                if (j != Long.MAX_VALUE) {
                    this.requested.decrementAndGet();
                }
                innerSubscriber.requestMore(1);
                if (decrementAndGet() == 0) {
                    return;
                }
            }
            SimpleQueue simpleQueue2 = innerSubscriber.queue;
            if (simpleQueue2 == null) {
                simpleQueue2 = new SpscArrayQueue(this.bufferSize);
                innerSubscriber.queue = simpleQueue2;
            }
            if (!simpleQueue2.offer(u)) {
                onError(new MissingBackpressureException("Inner queue full?!"));
                return;
            } else if (getAndIncrement() != 0) {
                return;
            }
            drainLoop();
        }

        public void onError(Throwable th) {
            if (this.done) {
                RxJavaPlugins.onError(th);
                return;
            }
            if (this.errs.addThrowable(th)) {
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

        public void request(long j) {
            if (SubscriptionHelper.validate(j)) {
                BackpressureHelper.add(this.requested, j);
                drain();
            }
        }

        public void cancel() {
            if (!this.cancelled) {
                this.cancelled = true;
                this.upstream.cancel();
                disposeAll();
                if (getAndIncrement() == 0) {
                    SimpleQueue simpleQueue = this.queue;
                    if (simpleQueue != null) {
                        simpleQueue.clear();
                    }
                }
            }
        }

        void drain() {
            if (getAndIncrement() == 0) {
                drainLoop();
            }
        }

        void drainLoop() {
            int i;
            Subscriber subscriber = this.actual;
            int i2 = 1;
            while (!checkTerminate()) {
                long j;
                Object poll;
                SimplePlainQueue simplePlainQueue = this.queue;
                long j2 = this.requested.get();
                Object obj = j2 == Long.MAX_VALUE ? 1 : null;
                long j3 = 0;
                if (simplePlainQueue != null) {
                    j = 0;
                    while (true) {
                        long j4 = 0;
                        Object obj2 = null;
                        while (j2 != 0) {
                            poll = simplePlainQueue.poll();
                            if (!checkTerminate()) {
                                if (poll == null) {
                                    obj2 = poll;
                                    break;
                                }
                                subscriber.onNext(poll);
                                j++;
                                j4++;
                                j2--;
                                obj2 = poll;
                            } else {
                                return;
                            }
                        }
                        if (j4 != 0) {
                            if (obj != null) {
                                j2 = Long.MAX_VALUE;
                            } else {
                                j2 = this.requested.addAndGet(-j4);
                            }
                        }
                        if (j2 == 0 || r18 == null) {
                            break;
                        }
                    }
                } else {
                    j = 0;
                }
                boolean z = this.done;
                SimplePlainQueue simplePlainQueue2 = this.queue;
                InnerSubscriber[] innerSubscriberArr = (InnerSubscriber[]) this.subscribers.get();
                int length = innerSubscriberArr.length;
                Throwable terminate;
                if (z && ((simplePlainQueue2 == null || simplePlainQueue2.isEmpty()) && length == 0)) {
                    terminate = this.errs.terminate();
                    if (terminate != ExceptionHelper.TERMINATED) {
                        if (terminate == null) {
                            subscriber.onComplete();
                        } else {
                            subscriber.onError(terminate);
                        }
                    }
                    return;
                }
                int i3;
                long j5;
                Object obj3;
                if (length != 0) {
                    int i4;
                    i3 = i2;
                    j5 = this.lastId;
                    int i5 = this.lastIndex;
                    if (length <= i5 || innerSubscriberArr[i5].id != j5) {
                        if (length <= i5) {
                            i5 = 0;
                        }
                        i4 = i5;
                        for (i5 = 0; i5 < length && innerSubscriberArr[i4].id != j5; i5++) {
                            i4++;
                            if (i4 == length) {
                                i4 = 0;
                            }
                        }
                        this.lastIndex = i4;
                        this.lastId = innerSubscriberArr[i4].id;
                        i5 = i4;
                    }
                    i2 = i5;
                    Object obj4 = null;
                    int i6 = 0;
                    while (i6 < length) {
                        if (!checkTerminate()) {
                            InnerSubscriber innerSubscriber = innerSubscriberArr[i2];
                            Object obj5 = null;
                            while (!checkTerminate()) {
                                SimpleQueue simpleQueue = innerSubscriber.queue;
                                if (simpleQueue == null) {
                                    i = length;
                                } else {
                                    i = length;
                                    Object obj6 = obj5;
                                    long j6 = j3;
                                    while (j2 != j3) {
                                        try {
                                            obj6 = simpleQueue.poll();
                                            if (obj6 == null) {
                                                break;
                                            }
                                            subscriber.onNext(obj6);
                                            if (!checkTerminate()) {
                                                j2--;
                                                j6++;
                                            } else {
                                                return;
                                            }
                                        } catch (Throwable terminate2) {
                                            Throwable th = terminate2;
                                            Exceptions.throwIfFatal(th);
                                            innerSubscriber.dispose();
                                            this.errs.addThrowable(th);
                                            if (!this.delayErrors) {
                                                this.upstream.cancel();
                                            }
                                            if (!checkTerminate()) {
                                                removeInner(innerSubscriber);
                                                i6++;
                                                i4 = i;
                                                obj4 = 1;
                                            } else {
                                                return;
                                            }
                                        }
                                    }
                                    if (j6 != j3) {
                                        if (obj == null) {
                                            j2 = this.requested.addAndGet(-j6);
                                        } else {
                                            j2 = Long.MAX_VALUE;
                                        }
                                        innerSubscriber.requestMore(j6);
                                    }
                                    if (!(j2 == 0 || obj6 == null)) {
                                        obj5 = obj6;
                                        length = i;
                                        j3 = 0;
                                    }
                                }
                                boolean z2 = innerSubscriber.done;
                                SimpleQueue simpleQueue2 = innerSubscriber.queue;
                                if (z2 && (simpleQueue2 == null || simpleQueue2.isEmpty())) {
                                    removeInner(innerSubscriber);
                                    if (!checkTerminate()) {
                                        j++;
                                        obj4 = 1;
                                    } else {
                                        return;
                                    }
                                }
                                if (j2 == 0) {
                                    poll = obj4;
                                    break;
                                }
                                i2++;
                                i4 = i;
                                if (i2 == i4) {
                                    i2 = 0;
                                }
                                i6++;
                                length = i4;
                                j3 = 0;
                            }
                            return;
                        }
                        return;
                    }
                    poll = obj4;
                    this.lastIndex = i2;
                    this.lastId = innerSubscriberArr[i2].id;
                    obj3 = poll;
                    j5 = j;
                } else {
                    i3 = i2;
                    j5 = j;
                    obj3 = null;
                }
                if (!(j5 == 0 || this.cancelled)) {
                    this.upstream.request(j5);
                }
                if (obj3 != null) {
                    i2 = i3;
                } else {
                    i2 = addAndGet(-i3);
                    if (i2 == 0) {
                        return;
                    }
                }
            }
        }

        boolean checkTerminate() {
            if (this.cancelled) {
                clearScalarQueue();
                return true;
            } else if (this.delayErrors || this.errs.get() == null) {
                return false;
            } else {
                clearScalarQueue();
                Throwable terminate = this.errs.terminate();
                if (terminate != ExceptionHelper.TERMINATED) {
                    this.actual.onError(terminate);
                }
                return true;
            }
        }

        void clearScalarQueue() {
            SimpleQueue simpleQueue = this.queue;
            if (simpleQueue != null) {
                simpleQueue.clear();
            }
        }

        void disposeAll() {
            if (((InnerSubscriber[]) this.subscribers.get()) != CANCELLED) {
                InnerSubscriber[] innerSubscriberArr = (InnerSubscriber[]) this.subscribers.getAndSet(CANCELLED);
                if (innerSubscriberArr != CANCELLED) {
                    for (InnerSubscriber dispose : innerSubscriberArr) {
                        dispose.dispose();
                    }
                    Throwable terminate = this.errs.terminate();
                    if (terminate != null && terminate != ExceptionHelper.TERMINATED) {
                        RxJavaPlugins.onError(terminate);
                    }
                }
            }
        }

        void innerError(InnerSubscriber<T, U> innerSubscriber, Throwable th) {
            if (this.errs.addThrowable(th)) {
                innerSubscriber.done = true;
                if (!this.delayErrors) {
                    this.upstream.cancel();
                    for (InnerSubscriber dispose : (InnerSubscriber[]) this.subscribers.getAndSet(CANCELLED)) {
                        dispose.dispose();
                    }
                }
                drain();
                return;
            }
            RxJavaPlugins.onError(th);
        }
    }

    public FlowableFlatMap(Flowable<T> flowable, Function<? super T, ? extends Publisher<? extends U>> function, boolean z, int i, int i2) {
        super(flowable);
        this.mapper = function;
        this.delayErrors = z;
        this.maxConcurrency = i;
        this.bufferSize = i2;
    }

    protected void subscribeActual(Subscriber<? super U> subscriber) {
        if (!FlowableScalarXMap.tryScalarXMapSubscribe(this.source, subscriber, this.mapper)) {
            this.source.subscribe(subscribe(subscriber, this.mapper, this.delayErrors, this.maxConcurrency, this.bufferSize));
        }
    }

    public static <T, U> FlowableSubscriber<T> subscribe(Subscriber<? super U> subscriber, Function<? super T, ? extends Publisher<? extends U>> function, boolean z, int i, int i2) {
        return new MergeSubscriber(subscriber, function, z, i, i2);
    }
}
