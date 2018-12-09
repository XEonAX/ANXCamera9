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
        void dispatch() {
            /*
            r21 = this;
            r1 = r21;
            r0 = r21.getAndIncrement();
            if (r0 == 0) goto L_0x0009;
        L_0x0008:
            return;
            r2 = 1;
            r3 = r2;
        L_0x000c:
            r0 = r1.terminalEvent;
            r4 = r1.queue;
            if (r4 == 0) goto L_0x001b;
        L_0x0012:
            r6 = r4.isEmpty();
            if (r6 == 0) goto L_0x0019;
        L_0x0018:
            goto L_0x001b;
        L_0x0019:
            r6 = 0;
            goto L_0x001d;
            r6 = r2;
        L_0x001d:
            r0 = r1.checkTerminated(r0, r6);
            if (r0 == 0) goto L_0x0024;
        L_0x0023:
            return;
        L_0x0024:
            if (r6 != 0) goto L_0x0122;
        L_0x0026:
            r0 = r1.subscribers;
            r0 = r0.get();
            r7 = r0;
            r7 = (io.reactivex.internal.operators.flowable.FlowablePublish.InnerSubscriber[]) r7;
            r0 = r7.length;
            r8 = 9223372036854775807; // 0x7fffffffffffffff float:NaN double:NaN;
            r10 = r7.length;
            r11 = r8;
            r8 = 0;
            r9 = 0;
        L_0x003a:
            r13 = 0;
            if (r8 >= r10) goto L_0x005d;
        L_0x003e:
            r15 = r7[r8];
            r16 = r6;
            r5 = r15.get();
            r13 = (r5 > r13 ? 1 : (r5 == r13 ? 0 : -1));
            if (r13 < 0) goto L_0x0050;
        L_0x004a:
            r5 = java.lang.Math.min(r11, r5);
            r11 = r5;
            goto L_0x0058;
        L_0x0050:
            r13 = -9223372036854775808;
            r5 = (r5 > r13 ? 1 : (r5 == r13 ? 0 : -1));
            if (r5 != 0) goto L_0x0058;
        L_0x0056:
            r9 = r9 + 1;
        L_0x0058:
            r8 = r8 + 1;
            r6 = r16;
            goto L_0x003a;
        L_0x005d:
            r16 = r6;
            r5 = 1;
            if (r0 != r9) goto L_0x00a2;
        L_0x0063:
            r0 = r1.terminalEvent;
            r4 = r4.poll();	 Catch:{ Throwable -> 0x006a }
            goto L_0x0082;
        L_0x006a:
            r0 = move-exception;
            r4 = r0;
            io.reactivex.exceptions.Exceptions.throwIfFatal(r4);
            r0 = r1.s;
            r0 = r0.get();
            r0 = (org.reactivestreams.Subscription) r0;
            r0.cancel();
            r0 = io.reactivex.internal.util.NotificationLite.error(r4);
            r1.terminalEvent = r0;
            r4 = 0;
        L_0x0082:
            if (r4 != 0) goto L_0x0086;
        L_0x0084:
            r4 = r2;
            goto L_0x0087;
        L_0x0086:
            r4 = 0;
        L_0x0087:
            r0 = r1.checkTerminated(r0, r4);
            if (r0 == 0) goto L_0x008e;
        L_0x008d:
            return;
        L_0x008e:
            r0 = r1.sourceMode;
            if (r0 == r2) goto L_0x009d;
        L_0x0092:
            r0 = r1.s;
            r0 = r0.get();
            r0 = (org.reactivestreams.Subscription) r0;
            r0.request(r5);
        L_0x009d:
            r4 = r2;
            r17 = r3;
            goto L_0x011d;
            r9 = 0;
        L_0x00a4:
            r17 = r3;
            r2 = (long) r9;
            r0 = (r2 > r11 ? 1 : (r2 == r11 ? 0 : -1));
            if (r0 >= 0) goto L_0x0100;
        L_0x00ab:
            r0 = r1.terminalEvent;
            r10 = r4.poll();	 Catch:{ Throwable -> 0x00b2 }
            goto L_0x00ca;
        L_0x00b2:
            r0 = move-exception;
            r10 = r0;
            io.reactivex.exceptions.Exceptions.throwIfFatal(r10);
            r0 = r1.s;
            r0 = r0.get();
            r0 = (org.reactivestreams.Subscription) r0;
            r0.cancel();
            r0 = io.reactivex.internal.util.NotificationLite.error(r10);
            r1.terminalEvent = r0;
            r10 = 0;
        L_0x00ca:
            if (r10 != 0) goto L_0x00ce;
        L_0x00cc:
            r15 = 1;
            goto L_0x00d0;
            r15 = 0;
        L_0x00d0:
            r0 = r1.checkTerminated(r0, r15);
            if (r0 == 0) goto L_0x00d7;
        L_0x00d6:
            return;
        L_0x00d7:
            if (r15 == 0) goto L_0x00da;
        L_0x00d9:
            goto L_0x0102;
        L_0x00da:
            r0 = io.reactivex.internal.util.NotificationLite.getValue(r10);
            r2 = r7.length;
            r3 = 0;
        L_0x00e0:
            if (r3 >= r2) goto L_0x00f7;
        L_0x00e2:
            r10 = r7[r3];
            r18 = r10.get();
            r16 = (r18 > r13 ? 1 : (r18 == r13 ? 0 : -1));
            if (r16 <= 0) goto L_0x00f4;
        L_0x00ec:
            r8 = r10.child;
            r8.onNext(r0);
            r10.produced(r5);
        L_0x00f4:
            r3 = r3 + 1;
            goto L_0x00e0;
        L_0x00f7:
            r9 = r9 + 1;
            r16 = r15;
            r3 = r17;
            r2 = 1;
            goto L_0x00a4;
        L_0x0100:
            r15 = r16;
        L_0x0102:
            if (r9 <= 0) goto L_0x0115;
        L_0x0104:
            r0 = r1.sourceMode;
            r4 = 1;
            if (r0 == r4) goto L_0x0116;
        L_0x0109:
            r0 = r1.s;
            r0 = r0.get();
            r0 = (org.reactivestreams.Subscription) r0;
            r0.request(r2);
            goto L_0x0116;
        L_0x0115:
            r4 = 1;
        L_0x0116:
            r0 = (r11 > r13 ? 1 : (r11 == r13 ? 0 : -1));
            if (r0 == 0) goto L_0x0125;
        L_0x011a:
            if (r15 != 0) goto L_0x0125;
        L_0x011d:
            r2 = r4;
            r3 = r17;
            goto L_0x000c;
        L_0x0122:
            r4 = r2;
            r17 = r3;
        L_0x0125:
            r2 = r17;
            r0 = -r2;
            r3 = r1.addAndGet(r0);
            if (r3 != 0) goto L_0x0130;
            return;
            r2 = r4;
            goto L_0x000c;
            */
            throw new UnsupportedOperationException("Method not decompiled: io.reactivex.internal.operators.flowable.FlowablePublish.PublishSubscriber.dispatch():void");
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
