package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.exceptions.MissingBackpressureException;
import io.reactivex.flowables.ConnectableFlowable;
import io.reactivex.functions.Consumer;
import io.reactivex.internal.fuseable.HasUpstreamPublisher;
import io.reactivex.internal.fuseable.QueueSubscription;
import io.reactivex.internal.fuseable.SimpleQueue;
import io.reactivex.internal.queue.SpscArrayQueue;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.BackpressureHelper;
import io.reactivex.internal.util.ExceptionHelper;
import io.reactivex.internal.util.NotificationLite;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;
import org.reactivestreams.Publisher;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;

public final class FlowablePublish<T> extends ConnectableFlowable<T> implements HasUpstreamPublisher<T> {
    static final long CANCELLED = Long.MIN_VALUE;
    final int bufferSize;
    final AtomicReference<PublishSubscriber<T>> current;
    final Publisher<T> onSubscribe;
    final Flowable<T> source;

    static final class FlowablePublisher<T> implements Publisher<T> {
        private final int bufferSize;
        private final AtomicReference<PublishSubscriber<T>> curr;

        FlowablePublisher(AtomicReference<PublishSubscriber<T>> atomicReference, int i) {
            this.curr = atomicReference;
            this.bufferSize = i;
        }

        public void subscribe(Subscriber<? super T> subscriber) {
            PublishSubscriber publishSubscriber;
            InnerSubscriber innerSubscriber = new InnerSubscriber(subscriber);
            subscriber.onSubscribe(innerSubscriber);
            while (true) {
                publishSubscriber = (PublishSubscriber) this.curr.get();
                if (publishSubscriber == null || publishSubscriber.isDisposed()) {
                    PublishSubscriber publishSubscriber2 = new PublishSubscriber(this.curr, this.bufferSize);
                    if (this.curr.compareAndSet(publishSubscriber, publishSubscriber2)) {
                        publishSubscriber = publishSubscriber2;
                    }
                }
                if (publishSubscriber.add(innerSubscriber)) {
                    break;
                }
            }
            if (innerSubscriber.get() == FlowablePublish.CANCELLED) {
                publishSubscriber.remove(innerSubscriber);
            } else {
                innerSubscriber.parent = publishSubscriber;
            }
            publishSubscriber.dispatch();
        }
    }

    static final class InnerSubscriber<T> extends AtomicLong implements Subscription {
        private static final long serialVersionUID = -4453897557930727610L;
        final Subscriber<? super T> child;
        volatile PublishSubscriber<T> parent;

        InnerSubscriber(Subscriber<? super T> subscriber) {
            this.child = subscriber;
        }

        public void request(long j) {
            if (SubscriptionHelper.validate(j)) {
                BackpressureHelper.addCancel(this, j);
                PublishSubscriber publishSubscriber = this.parent;
                if (publishSubscriber != null) {
                    publishSubscriber.dispatch();
                }
            }
        }

        public long produced(long j) {
            return BackpressureHelper.producedCancel(this, j);
        }

        public void cancel() {
            if (get() != FlowablePublish.CANCELLED && getAndSet(FlowablePublish.CANCELLED) != FlowablePublish.CANCELLED) {
                PublishSubscriber publishSubscriber = this.parent;
                if (publishSubscriber != null) {
                    publishSubscriber.remove(this);
                    publishSubscriber.dispatch();
                }
            }
        }
    }

    static final class PublishSubscriber<T> extends AtomicInteger implements FlowableSubscriber<T>, Disposable {
        static final InnerSubscriber[] EMPTY = new InnerSubscriber[0];
        static final InnerSubscriber[] TERMINATED = new InnerSubscriber[0];
        private static final long serialVersionUID = -202316842419149694L;
        final int bufferSize;
        final AtomicReference<PublishSubscriber<T>> current;
        volatile SimpleQueue<T> queue;
        final AtomicReference<Subscription> s = new AtomicReference();
        final AtomicBoolean shouldConnect;
        int sourceMode;
        final AtomicReference<InnerSubscriber[]> subscribers = new AtomicReference(EMPTY);
        volatile Object terminalEvent;

        PublishSubscriber(AtomicReference<PublishSubscriber<T>> atomicReference, int i) {
            this.current = atomicReference;
            this.shouldConnect = new AtomicBoolean();
            this.bufferSize = i;
        }

        public void dispose() {
            if (this.subscribers.get() != TERMINATED && ((InnerSubscriber[]) this.subscribers.getAndSet(TERMINATED)) != TERMINATED) {
                this.current.compareAndSet(this, null);
                SubscriptionHelper.cancel(this.s);
            }
        }

        public boolean isDisposed() {
            return this.subscribers.get() == TERMINATED;
        }

        public void onSubscribe(Subscription subscription) {
            if (SubscriptionHelper.setOnce(this.s, subscription)) {
                if (subscription instanceof QueueSubscription) {
                    QueueSubscription queueSubscription = (QueueSubscription) subscription;
                    int requestFusion = queueSubscription.requestFusion(3);
                    if (requestFusion == 1) {
                        this.sourceMode = requestFusion;
                        this.queue = queueSubscription;
                        this.terminalEvent = NotificationLite.complete();
                        dispatch();
                        return;
                    } else if (requestFusion == 2) {
                        this.sourceMode = requestFusion;
                        this.queue = queueSubscription;
                        subscription.request((long) this.bufferSize);
                        return;
                    }
                }
                this.queue = new SpscArrayQueue(this.bufferSize);
                subscription.request((long) this.bufferSize);
            }
        }

        public void onNext(T t) {
            if (this.sourceMode != 0 || this.queue.offer(t)) {
                dispatch();
            } else {
                onError(new MissingBackpressureException("Prefetch queue is full?!"));
            }
        }

        public void onError(Throwable th) {
            if (this.terminalEvent == null) {
                this.terminalEvent = NotificationLite.error(th);
                dispatch();
                return;
            }
            RxJavaPlugins.onError(th);
        }

        public void onComplete() {
            if (this.terminalEvent == null) {
                this.terminalEvent = NotificationLite.complete();
                dispatch();
            }
        }

        boolean add(InnerSubscriber<T> innerSubscriber) {
            while (true) {
                InnerSubscriber[] innerSubscriberArr = (InnerSubscriber[]) this.subscribers.get();
                if (innerSubscriberArr == TERMINATED) {
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

        void remove(InnerSubscriber<T> innerSubscriber) {
            while (true) {
                InnerSubscriber[] innerSubscriberArr = (InnerSubscriber[]) this.subscribers.get();
                int length = innerSubscriberArr.length;
                if (length == 0) {
                    break;
                }
                int i = -1;
                for (int i2 = 0; i2 < length; i2++) {
                    if (innerSubscriberArr[i2].equals(innerSubscriber)) {
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
                        break;
                    }
                } else {
                    return;
                }
            }
        }

        boolean checkTerminated(Object obj, boolean z) {
            int i = 0;
            if (obj != null) {
                if (!NotificationLite.isComplete(obj)) {
                    Throwable error = NotificationLite.getError(obj);
                    this.current.compareAndSet(this, null);
                    InnerSubscriber[] innerSubscriberArr = (InnerSubscriber[]) this.subscribers.getAndSet(TERMINATED);
                    if (innerSubscriberArr.length != 0) {
                        int length = innerSubscriberArr.length;
                        while (i < length) {
                            innerSubscriberArr[i].child.onError(error);
                            i++;
                        }
                    } else {
                        RxJavaPlugins.onError(error);
                    }
                    return true;
                } else if (z) {
                    this.current.compareAndSet(this, null);
                    InnerSubscriber[] innerSubscriberArr2 = (InnerSubscriber[]) this.subscribers.getAndSet(TERMINATED);
                    int length2 = innerSubscriberArr2.length;
                    while (i < length2) {
                        innerSubscriberArr2[i].child.onComplete();
                        i++;
                    }
                    return true;
                }
            }
            return false;
        }

        /* JADX WARNING: Missing block: B:71:0x011a, code:
            if (r15 == false) goto L_0x011d;
     */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        void dispatch() {
            if (getAndIncrement() == 0) {
                boolean z = true;
                int i = 1;
                while (true) {
                    Object obj = this.terminalEvent;
                    SimpleQueue simpleQueue = this.queue;
                    boolean z2 = (simpleQueue == null || simpleQueue.isEmpty()) ? z : false;
                    if (!checkTerminated(obj, z2)) {
                        boolean z3;
                        int i2;
                        if (z2) {
                            z3 = z;
                            i2 = i;
                        } else {
                            boolean z4;
                            InnerSubscriber[] innerSubscriberArr = (InnerSubscriber[]) this.subscribers.get();
                            int length = innerSubscriberArr.length;
                            int length2 = innerSubscriberArr.length;
                            long j = Long.MAX_VALUE;
                            int i3 = 0;
                            int i4 = 0;
                            while (i3 < length2) {
                                z4 = z2;
                                long j2 = innerSubscriberArr[i3].get();
                                if (j2 >= 0) {
                                    j = Math.min(j, j2);
                                } else if (j2 == FlowablePublish.CANCELLED) {
                                    i4++;
                                }
                                i3++;
                                z2 = z4;
                            }
                            z4 = z2;
                            if (length == i4) {
                                Object poll;
                                obj = this.terminalEvent;
                                try {
                                    poll = simpleQueue.poll();
                                } catch (Throwable th) {
                                    Throwable th2 = th;
                                    Exceptions.throwIfFatal(th2);
                                    ((Subscription) this.s.get()).cancel();
                                    obj = NotificationLite.error(th2);
                                    this.terminalEvent = obj;
                                    poll = null;
                                }
                                if (!checkTerminated(obj, poll == null ? z : false)) {
                                    if (this.sourceMode != z) {
                                        ((Subscription) this.s.get()).request(1);
                                    }
                                    z3 = z;
                                    i2 = i;
                                } else {
                                    return;
                                }
                            }
                            long j3;
                            i4 = 0;
                            while (true) {
                                i2 = i;
                                j3 = (long) i4;
                                boolean z5;
                                if (j3 >= j) {
                                    z5 = z4;
                                    break;
                                }
                                Object poll2;
                                obj = this.terminalEvent;
                                try {
                                    poll2 = simpleQueue.poll();
                                } catch (Throwable th3) {
                                    Throwable th4 = th3;
                                    Exceptions.throwIfFatal(th4);
                                    ((Subscription) this.s.get()).cancel();
                                    obj = NotificationLite.error(th4);
                                    this.terminalEvent = obj;
                                    poll2 = null;
                                }
                                z5 = poll2 == null;
                                if (!checkTerminated(obj, z5)) {
                                    if (z5) {
                                        break;
                                    }
                                    obj = NotificationLite.getValue(poll2);
                                    for (InnerSubscriber innerSubscriber : innerSubscriberArr) {
                                        if (innerSubscriber.get() > 0) {
                                            innerSubscriber.child.onNext(obj);
                                            innerSubscriber.produced(1);
                                        }
                                    }
                                    i4++;
                                    z4 = z5;
                                    i = i2;
                                } else {
                                    return;
                                }
                            }
                            if (i4 > 0) {
                                z3 = true;
                                if (this.sourceMode != 1) {
                                    ((Subscription) this.s.get()).request(j3);
                                }
                            } else {
                                z3 = true;
                            }
                            if (j != 0) {
                            }
                            z = z3;
                            i = i2;
                        }
                        i = addAndGet(-i2);
                        if (i != 0) {
                            z = z3;
                        } else {
                            return;
                        }
                    }
                    return;
                }
            }
        }
    }

    public static <T> ConnectableFlowable<T> create(Flowable<T> flowable, int i) {
        AtomicReference atomicReference = new AtomicReference();
        return RxJavaPlugins.onAssembly(new FlowablePublish(new FlowablePublisher(atomicReference, i), flowable, atomicReference, i));
    }

    private FlowablePublish(Publisher<T> publisher, Flowable<T> flowable, AtomicReference<PublishSubscriber<T>> atomicReference, int i) {
        this.onSubscribe = publisher;
        this.source = flowable;
        this.current = atomicReference;
        this.bufferSize = i;
    }

    public Publisher<T> source() {
        return this.source;
    }

    protected void subscribeActual(Subscriber<? super T> subscriber) {
        this.onSubscribe.subscribe(subscriber);
    }

    public void connect(Consumer<? super Disposable> consumer) {
        FlowableSubscriber flowableSubscriber;
        while (true) {
            flowableSubscriber = (PublishSubscriber) this.current.get();
            if (flowableSubscriber != null && !flowableSubscriber.isDisposed()) {
                break;
            }
            PublishSubscriber publishSubscriber = new PublishSubscriber(this.current, this.bufferSize);
            if (this.current.compareAndSet(flowableSubscriber, publishSubscriber)) {
                flowableSubscriber = publishSubscriber;
                break;
            }
        }
        boolean z = true;
        if (flowableSubscriber.shouldConnect.get() || !flowableSubscriber.shouldConnect.compareAndSet(false, true)) {
            z = false;
        }
        try {
            consumer.accept(flowableSubscriber);
            if (z) {
                this.source.subscribe(flowableSubscriber);
            }
        } catch (Throwable th) {
            Exceptions.throwIfFatal(th);
            RuntimeException wrapOrThrow = ExceptionHelper.wrapOrThrow(th);
        }
    }
}
