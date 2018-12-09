package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.annotations.NonNull;
import io.reactivex.annotations.Nullable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Function;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.queue.SpscLinkedArrayQueue;
import io.reactivex.internal.subscriptions.BasicIntQueueSubscription;
import io.reactivex.internal.subscriptions.EmptySubscription;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.BackpressureHelper;
import io.reactivex.internal.util.ExceptionHelper;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.Iterator;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;
import org.reactivestreams.Publisher;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;

public final class FlowableCombineLatest<T, R> extends Flowable<R> {
    @Nullable
    final Publisher<? extends T>[] array;
    final int bufferSize;
    final Function<? super Object[], ? extends R> combiner;
    final boolean delayErrors;
    @Nullable
    final Iterable<? extends Publisher<? extends T>> iterable;

    static final class CombineLatestCoordinator<T, R> extends BasicIntQueueSubscription<R> {
        private static final long serialVersionUID = -5082275438355852221L;
        final Subscriber<? super R> actual;
        volatile boolean cancelled;
        final Function<? super Object[], ? extends R> combiner;
        int completedSources;
        final boolean delayErrors;
        volatile boolean done;
        final AtomicReference<Throwable> error;
        final Object[] latest;
        int nonEmptySources;
        boolean outputFused;
        final SpscLinkedArrayQueue<Object> queue;
        final AtomicLong requested;
        final CombineLatestInnerSubscriber<T>[] subscribers;

        CombineLatestCoordinator(Subscriber<? super R> subscriber, Function<? super Object[], ? extends R> function, int i, int i2, boolean z) {
            this.actual = subscriber;
            this.combiner = function;
            CombineLatestInnerSubscriber[] combineLatestInnerSubscriberArr = new CombineLatestInnerSubscriber[i];
            for (int i3 = 0; i3 < i; i3++) {
                combineLatestInnerSubscriberArr[i3] = new CombineLatestInnerSubscriber(this, i3, i2);
            }
            this.subscribers = combineLatestInnerSubscriberArr;
            this.latest = new Object[i];
            this.queue = new SpscLinkedArrayQueue(i2);
            this.requested = new AtomicLong();
            this.error = new AtomicReference();
            this.delayErrors = z;
        }

        public void request(long j) {
            if (SubscriptionHelper.validate(j)) {
                BackpressureHelper.add(this.requested, j);
                drain();
            }
        }

        public void cancel() {
            this.cancelled = true;
            cancelAll();
        }

        void subscribe(Publisher<? extends T>[] publisherArr, int i) {
            CombineLatestInnerSubscriber[] combineLatestInnerSubscriberArr = this.subscribers;
            for (int i2 = 0; i2 < i && !this.done && !this.cancelled; i2++) {
                publisherArr[i2].subscribe(combineLatestInnerSubscriberArr[i2]);
            }
        }

        void innerValue(int i, T t) {
            Object obj;
            synchronized (this) {
                Object obj2 = this.latest;
                int i2 = this.nonEmptySources;
                if (obj2[i] == null) {
                    i2++;
                    this.nonEmptySources = i2;
                }
                obj2[i] = t;
                if (obj2.length == i2) {
                    this.queue.offer(this.subscribers[i], obj2.clone());
                    obj = null;
                } else {
                    obj = 1;
                }
            }
            if (obj != null) {
                this.subscribers[i].requestOne();
            } else {
                drain();
            }
        }

        /* JADX WARNING: Missing block: B:12:0x0018, code:
            drain();
     */
        /* JADX WARNING: Missing block: B:13:0x001b, code:
            return;
     */
        void innerComplete(int r3) {
            /*
            r2 = this;
            monitor-enter(r2);
            r0 = r2.latest;	 Catch:{ all -> 0x001c }
            r3 = r0[r3];	 Catch:{ all -> 0x001c }
            r1 = 1;
            if (r3 == 0) goto L_0x0015;
        L_0x0008:
            r3 = r2.completedSources;	 Catch:{ all -> 0x001c }
            r3 = r3 + r1;
            r0 = r0.length;	 Catch:{ all -> 0x001c }
            if (r3 != r0) goto L_0x0011;
        L_0x000e:
            r2.done = r1;	 Catch:{ all -> 0x001c }
            goto L_0x0017;
        L_0x0011:
            r2.completedSources = r3;	 Catch:{ all -> 0x001c }
            monitor-exit(r2);	 Catch:{ all -> 0x001c }
            return;
        L_0x0015:
            r2.done = r1;	 Catch:{ all -> 0x001c }
        L_0x0017:
            monitor-exit(r2);	 Catch:{ all -> 0x001c }
            r2.drain();
            return;
        L_0x001c:
            r3 = move-exception;
            monitor-exit(r2);	 Catch:{ all -> 0x001c }
            throw r3;
            */
            throw new UnsupportedOperationException("Method not decompiled: io.reactivex.internal.operators.flowable.FlowableCombineLatest.CombineLatestCoordinator.innerComplete(int):void");
        }

        void innerError(int i, Throwable th) {
            if (!ExceptionHelper.addThrowable(this.error, th)) {
                RxJavaPlugins.onError(th);
            } else if (this.delayErrors) {
                innerComplete(i);
            } else {
                cancelAll();
                this.done = true;
                drain();
            }
        }

        void drainOutput() {
            Subscriber subscriber = this.actual;
            SpscLinkedArrayQueue spscLinkedArrayQueue = this.queue;
            int i = 1;
            while (!this.cancelled) {
                Throwable th = (Throwable) this.error.get();
                if (th != null) {
                    spscLinkedArrayQueue.clear();
                    subscriber.onError(th);
                    return;
                }
                boolean z = this.done;
                boolean isEmpty = spscLinkedArrayQueue.isEmpty();
                if (!isEmpty) {
                    subscriber.onNext(null);
                }
                if (z && isEmpty) {
                    subscriber.onComplete();
                    return;
                }
                i = addAndGet(-i);
                if (i == 0) {
                    return;
                }
            }
            spscLinkedArrayQueue.clear();
        }

        void drainAsync() {
            Subscriber subscriber = this.actual;
            SpscLinkedArrayQueue spscLinkedArrayQueue = this.queue;
            int i = 1;
            while (true) {
                int i2;
                long j = this.requested.get();
                long j2 = 0;
                while (true) {
                    i2 = (j2 > j ? 1 : (j2 == j ? 0 : -1));
                    if (i2 == 0) {
                        break;
                    }
                    boolean z;
                    boolean z2 = this.done;
                    Object poll = spscLinkedArrayQueue.poll();
                    if (poll == null) {
                        z = true;
                    } else {
                        z = false;
                    }
                    if (!checkTerminated(z2, z, subscriber, spscLinkedArrayQueue)) {
                        if (z) {
                            break;
                        }
                        try {
                            subscriber.onNext(ObjectHelper.requireNonNull(this.combiner.apply((Object[]) spscLinkedArrayQueue.poll()), "The combiner returned a null value"));
                            ((CombineLatestInnerSubscriber) poll).requestOne();
                            j2++;
                        } catch (Throwable th) {
                            Exceptions.throwIfFatal(th);
                            cancelAll();
                            ExceptionHelper.addThrowable(this.error, th);
                            subscriber.onError(ExceptionHelper.terminate(this.error));
                            return;
                        }
                    }
                    return;
                }
                if (i2 != 0 || !checkTerminated(this.done, spscLinkedArrayQueue.isEmpty(), subscriber, spscLinkedArrayQueue)) {
                    if (!(j2 == 0 || j == Long.MAX_VALUE)) {
                        this.requested.addAndGet(-j2);
                    }
                    i = addAndGet(-i);
                    if (i == 0) {
                        return;
                    }
                } else {
                    return;
                }
            }
        }

        void drain() {
            if (getAndIncrement() == 0) {
                if (this.outputFused) {
                    drainOutput();
                } else {
                    drainAsync();
                }
            }
        }

        boolean checkTerminated(boolean z, boolean z2, Subscriber<?> subscriber, SpscLinkedArrayQueue<?> spscLinkedArrayQueue) {
            if (this.cancelled) {
                cancelAll();
                spscLinkedArrayQueue.clear();
                return true;
            }
            if (z) {
                Throwable terminate;
                if (!this.delayErrors) {
                    terminate = ExceptionHelper.terminate(this.error);
                    if (terminate != null && terminate != ExceptionHelper.TERMINATED) {
                        cancelAll();
                        spscLinkedArrayQueue.clear();
                        subscriber.onError(terminate);
                        return true;
                    } else if (z2) {
                        cancelAll();
                        subscriber.onComplete();
                        return true;
                    }
                } else if (z2) {
                    cancelAll();
                    terminate = ExceptionHelper.terminate(this.error);
                    if (terminate == null || terminate == ExceptionHelper.TERMINATED) {
                        subscriber.onComplete();
                    } else {
                        subscriber.onError(terminate);
                    }
                    return true;
                }
            }
            return false;
        }

        void cancelAll() {
            for (CombineLatestInnerSubscriber cancel : this.subscribers) {
                cancel.cancel();
            }
        }

        public int requestFusion(int i) {
            boolean z = false;
            if ((i & 4) != 0) {
                return 0;
            }
            i &= 2;
            if (i != 0) {
                z = true;
            }
            this.outputFused = z;
            return i;
        }

        @Nullable
        public R poll() throws Exception {
            Object poll = this.queue.poll();
            if (poll == null) {
                return null;
            }
            R requireNonNull = ObjectHelper.requireNonNull(this.combiner.apply((Object[]) this.queue.poll()), "The combiner returned a null value");
            ((CombineLatestInnerSubscriber) poll).requestOne();
            return requireNonNull;
        }

        public void clear() {
            this.queue.clear();
        }

        public boolean isEmpty() {
            return this.queue.isEmpty();
        }
    }

    static final class CombineLatestInnerSubscriber<T> extends AtomicReference<Subscription> implements FlowableSubscriber<T> {
        private static final long serialVersionUID = -8730235182291002949L;
        final int index;
        final int limit;
        final CombineLatestCoordinator<T, ?> parent;
        final int prefetch;
        int produced;

        CombineLatestInnerSubscriber(CombineLatestCoordinator<T, ?> combineLatestCoordinator, int i, int i2) {
            this.parent = combineLatestCoordinator;
            this.index = i;
            this.prefetch = i2;
            this.limit = i2 - (i2 >> 2);
        }

        public void onSubscribe(Subscription subscription) {
            if (SubscriptionHelper.setOnce(this, subscription)) {
                subscription.request((long) this.prefetch);
            }
        }

        public void onNext(T t) {
            this.parent.innerValue(this.index, t);
        }

        public void onError(Throwable th) {
            this.parent.innerError(this.index, th);
        }

        public void onComplete() {
            this.parent.innerComplete(this.index);
        }

        public void cancel() {
            SubscriptionHelper.cancel(this);
        }

        public void requestOne() {
            int i = this.produced + 1;
            if (i == this.limit) {
                this.produced = 0;
                ((Subscription) get()).request((long) i);
                return;
            }
            this.produced = i;
        }
    }

    final class SingletonArrayFunc implements Function<T, R> {
        SingletonArrayFunc() {
        }

        public R apply(T t) throws Exception {
            return FlowableCombineLatest.this.combiner.apply(new Object[]{t});
        }
    }

    public FlowableCombineLatest(@NonNull Publisher<? extends T>[] publisherArr, @NonNull Function<? super Object[], ? extends R> function, int i, boolean z) {
        this.array = publisherArr;
        this.iterable = null;
        this.combiner = function;
        this.bufferSize = i;
        this.delayErrors = z;
    }

    public FlowableCombineLatest(@NonNull Iterable<? extends Publisher<? extends T>> iterable, @NonNull Function<? super Object[], ? extends R> function, int i, boolean z) {
        this.array = null;
        this.iterable = iterable;
        this.combiner = function;
        this.bufferSize = i;
        this.delayErrors = z;
    }

    public void subscribeActual(Subscriber<? super R> subscriber) {
        int i;
        Publisher[] publisherArr = this.array;
        if (publisherArr == null) {
            publisherArr = new Publisher[8];
            try {
                Iterator it = (Iterator) ObjectHelper.requireNonNull(this.iterable.iterator(), "The iterator returned is null");
                i = 0;
                while (it.hasNext()) {
                    try {
                        try {
                            Publisher publisher = (Publisher) ObjectHelper.requireNonNull(it.next(), "The publisher returned by the iterator is null");
                            if (i == publisherArr.length) {
                                Object obj = new Publisher[((i >> 2) + i)];
                                System.arraycopy(publisherArr, 0, obj, 0, i);
                                publisherArr = obj;
                            }
                            int i2 = i + 1;
                            publisherArr[i] = publisher;
                            i = i2;
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
            } catch (Throwable th22) {
                Exceptions.throwIfFatal(th22);
                EmptySubscription.error(th22, subscriber);
                return;
            }
        }
        i = publisherArr.length;
        if (i == 0) {
            EmptySubscription.complete(subscriber);
        } else if (i == 1) {
            publisherArr[0].subscribe(new MapSubscriber(subscriber, new SingletonArrayFunc()));
        } else {
            CombineLatestCoordinator combineLatestCoordinator = new CombineLatestCoordinator(subscriber, this.combiner, i, this.bufferSize, this.delayErrors);
            subscriber.onSubscribe(combineLatestCoordinator);
            combineLatestCoordinator.subscribe(publisherArr, i);
        }
    }
}
