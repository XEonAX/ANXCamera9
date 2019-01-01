package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.Scheduler;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.flowables.ConnectableFlowable;
import io.reactivex.functions.Consumer;
import io.reactivex.functions.Function;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.fuseable.HasUpstreamPublisher;
import io.reactivex.internal.subscribers.SubscriberResourceWrapper;
import io.reactivex.internal.subscriptions.EmptySubscription;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.BackpressureHelper;
import io.reactivex.internal.util.ExceptionHelper;
import io.reactivex.internal.util.NotificationLite;
import io.reactivex.plugins.RxJavaPlugins;
import io.reactivex.schedulers.Timed;
import java.util.ArrayList;
import java.util.Collection;
import java.util.concurrent.Callable;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;
import org.reactivestreams.Publisher;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;

public final class FlowableReplay<T> extends ConnectableFlowable<T> implements Disposable, HasUpstreamPublisher<T> {
    static final Callable DEFAULT_UNBOUNDED_FACTORY = new DefaultUnboundedFactory();
    final Callable<? extends ReplayBuffer<T>> bufferFactory;
    final AtomicReference<ReplaySubscriber<T>> current;
    final Publisher<T> onSubscribe;
    final Flowable<T> source;

    interface ReplayBuffer<T> {
        void complete();

        void error(Throwable th);

        void next(T t);

        void replay(InnerSubscription<T> innerSubscription);
    }

    static class BoundedReplayBuffer<T> extends AtomicReference<Node> implements ReplayBuffer<T> {
        private static final long serialVersionUID = 2346567790059478686L;
        long index;
        int size;
        Node tail;

        BoundedReplayBuffer() {
            Node node = new Node(null, 0);
            this.tail = node;
            set(node);
        }

        final void addLast(Node node) {
            this.tail.set(node);
            this.tail = node;
            this.size++;
        }

        final void removeFirst() {
            Node node = (Node) ((Node) get()).get();
            if (node != null) {
                this.size--;
                setFirst(node);
                return;
            }
            throw new IllegalStateException("Empty list!");
        }

        final void removeSome(int i) {
            Node node = (Node) get();
            while (i > 0) {
                node = (Node) node.get();
                i--;
                this.size--;
            }
            setFirst(node);
        }

        final void setFirst(Node node) {
            set(node);
        }

        public final void next(T t) {
            Object enterTransform = enterTransform(NotificationLite.next(t));
            long j = this.index + 1;
            this.index = j;
            addLast(new Node(enterTransform, j));
            truncate();
        }

        public final void error(Throwable th) {
            Object enterTransform = enterTransform(NotificationLite.error(th));
            long j = this.index + 1;
            this.index = j;
            addLast(new Node(enterTransform, j));
            truncateFinal();
        }

        public final void complete() {
            Object enterTransform = enterTransform(NotificationLite.complete());
            long j = this.index + 1;
            this.index = j;
            addLast(new Node(enterTransform, j));
            truncateFinal();
        }

        /* JADX WARNING: Missing block: B:10:0x0011, code:
            if (r14.isDisposed() == false) goto L_0x0014;
     */
        /* JADX WARNING: Missing block: B:11:0x0013, code:
            return;
     */
        /* JADX WARNING: Missing block: B:12:0x0014, code:
            r2 = r14.get();
     */
        /* JADX WARNING: Missing block: B:13:0x0020, code:
            if (r2 != Long.MAX_VALUE) goto L_0x0024;
     */
        /* JADX WARNING: Missing block: B:14:0x0022, code:
            r0 = true;
     */
        /* JADX WARNING: Missing block: B:15:0x0024, code:
            r0 = false;
     */
        /* JADX WARNING: Missing block: B:16:0x0026, code:
            r5 = (io.reactivex.internal.operators.flowable.FlowableReplay.Node) r14.index();
     */
        /* JADX WARNING: Missing block: B:17:0x002e, code:
            if (r5 != null) goto L_0x003d;
     */
        /* JADX WARNING: Missing block: B:18:0x0030, code:
            r5 = getHead();
            r14.index = r5;
            io.reactivex.internal.util.BackpressureHelper.add(r14.totalRequested, r5.index);
     */
        /* JADX WARNING: Missing block: B:19:0x003d, code:
            r8 = 0;
     */
        /* JADX WARNING: Missing block: B:21:0x0040, code:
            if (r2 == 0) goto L_0x0087;
     */
        /* JADX WARNING: Missing block: B:22:0x0042, code:
            r10 = (io.reactivex.internal.operators.flowable.FlowableReplay.Node) r5.get();
     */
        /* JADX WARNING: Missing block: B:23:0x0048, code:
            if (r10 == null) goto L_0x0087;
     */
        /* JADX WARNING: Missing block: B:24:0x004a, code:
            r5 = leaveTransform(r10.value);
     */
        /* JADX WARNING: Missing block: B:27:0x0057, code:
            if (io.reactivex.internal.util.NotificationLite.accept(r5, r14.child) == false) goto L_0x005c;
     */
        /* JADX WARNING: Missing block: B:28:0x0059, code:
            r14.index = null;
     */
        /* JADX WARNING: Missing block: B:29:0x005b, code:
            return;
     */
        /* JADX WARNING: Missing block: B:30:0x005c, code:
            r8 = r8 + 1;
            r2 = r2 - 1;
     */
        /* JADX WARNING: Missing block: B:31:0x0066, code:
            if (r14.isDisposed() == false) goto L_0x0069;
     */
        /* JADX WARNING: Missing block: B:32:0x0068, code:
            return;
     */
        /* JADX WARNING: Missing block: B:33:0x0069, code:
            r5 = r10;
     */
        /* JADX WARNING: Missing block: B:34:0x006c, code:
            r0 = move-exception;
     */
        /* JADX WARNING: Missing block: B:35:0x006d, code:
            io.reactivex.exceptions.Exceptions.throwIfFatal(r0);
            r14.index = null;
            r14.dispose();
     */
        /* JADX WARNING: Missing block: B:39:0x0081, code:
            r14.child.onError(r0);
     */
        /* JADX WARNING: Missing block: B:40:0x0086, code:
            return;
     */
        /* JADX WARNING: Missing block: B:42:0x0089, code:
            if (r8 == 0) goto L_0x0092;
     */
        /* JADX WARNING: Missing block: B:43:0x008b, code:
            r14.index = r5;
     */
        /* JADX WARNING: Missing block: B:44:0x008d, code:
            if (r0 != false) goto L_0x0092;
     */
        /* JADX WARNING: Missing block: B:45:0x008f, code:
            r14.produced(r8);
     */
        /* JADX WARNING: Missing block: B:46:0x0092, code:
            monitor-enter(r14);
     */
        /* JADX WARNING: Missing block: B:49:0x0095, code:
            if (r14.missed != false) goto L_0x009b;
     */
        /* JADX WARNING: Missing block: B:50:0x0097, code:
            r14.emitting = false;
     */
        /* JADX WARNING: Missing block: B:51:0x0099, code:
            monitor-exit(r14);
     */
        /* JADX WARNING: Missing block: B:52:0x009a, code:
            return;
     */
        /* JADX WARNING: Missing block: B:53:0x009b, code:
            r14.missed = false;
     */
        /* JADX WARNING: Missing block: B:54:0x009d, code:
            monitor-exit(r14);
     */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        public final void replay(InnerSubscription<T> innerSubscription) {
            synchronized (innerSubscription) {
                if (innerSubscription.emitting) {
                    innerSubscription.missed = true;
                    return;
                }
                innerSubscription.emitting = true;
            }
        }

        Object enterTransform(Object obj) {
            return obj;
        }

        Object leaveTransform(Object obj) {
            return obj;
        }

        void truncate() {
        }

        void truncateFinal() {
        }

        final void collect(Collection<? super T> collection) {
            Node head = getHead();
            while (true) {
                head = (Node) head.get();
                if (head != null) {
                    Object leaveTransform = leaveTransform(head.value);
                    if (!NotificationLite.isComplete(leaveTransform) && !NotificationLite.isError(leaveTransform)) {
                        collection.add(NotificationLite.getValue(leaveTransform));
                    } else {
                        return;
                    }
                }
                return;
            }
        }

        boolean hasError() {
            return this.tail.value != null && NotificationLite.isError(leaveTransform(this.tail.value));
        }

        boolean hasCompleted() {
            return this.tail.value != null && NotificationLite.isComplete(leaveTransform(this.tail.value));
        }

        Node getHead() {
            return (Node) get();
        }
    }

    static final class ConnectableFlowableReplay<T> extends ConnectableFlowable<T> {
        private final ConnectableFlowable<T> co;
        private final Flowable<T> observable;

        ConnectableFlowableReplay(ConnectableFlowable<T> connectableFlowable, Flowable<T> flowable) {
            this.co = connectableFlowable;
            this.observable = flowable;
        }

        public void connect(Consumer<? super Disposable> consumer) {
            this.co.connect(consumer);
        }

        protected void subscribeActual(Subscriber<? super T> subscriber) {
            this.observable.subscribe((Subscriber) subscriber);
        }
    }

    static final class DefaultUnboundedFactory implements Callable<Object> {
        DefaultUnboundedFactory() {
        }

        public Object call() {
            return new UnboundedReplayBuffer(16);
        }
    }

    static final class InnerSubscription<T> extends AtomicLong implements Disposable, Subscription {
        static final long CANCELLED = Long.MIN_VALUE;
        private static final long serialVersionUID = -4453897557930727610L;
        final Subscriber<? super T> child;
        boolean emitting;
        Object index;
        boolean missed;
        final ReplaySubscriber<T> parent;
        final AtomicLong totalRequested = new AtomicLong();

        InnerSubscription(ReplaySubscriber<T> replaySubscriber, Subscriber<? super T> subscriber) {
            this.parent = replaySubscriber;
            this.child = subscriber;
        }

        public void request(long j) {
            if (SubscriptionHelper.validate(j)) {
                while (true) {
                    long j2 = get();
                    if (j2 != CANCELLED) {
                        if (j2 >= 0 && j == 0) {
                            return;
                        }
                        if (compareAndSet(j2, BackpressureHelper.addCap(j2, j))) {
                            BackpressureHelper.add(this.totalRequested, j);
                            this.parent.manageRequests();
                            this.parent.buffer.replay(this);
                            return;
                        }
                    } else {
                        return;
                    }
                }
            }
        }

        public long produced(long j) {
            return BackpressureHelper.producedCancel(this, j);
        }

        public boolean isDisposed() {
            return get() == CANCELLED;
        }

        public void cancel() {
            dispose();
        }

        public void dispose() {
            if (getAndSet(CANCELLED) != CANCELLED) {
                this.parent.remove(this);
                this.parent.manageRequests();
            }
        }

        <U> U index() {
            return this.index;
        }
    }

    static final class MultiCastPublisher<R, U> implements Publisher<R> {
        private final Callable<? extends ConnectableFlowable<U>> connectableFactory;
        private final Function<? super Flowable<U>, ? extends Publisher<R>> selector;

        final class DisposableConsumer implements Consumer<Disposable> {
            private final SubscriberResourceWrapper<R> srw;

            DisposableConsumer(SubscriberResourceWrapper<R> subscriberResourceWrapper) {
                this.srw = subscriberResourceWrapper;
            }

            public void accept(Disposable disposable) {
                this.srw.setResource(disposable);
            }
        }

        MultiCastPublisher(Callable<? extends ConnectableFlowable<U>> callable, Function<? super Flowable<U>, ? extends Publisher<R>> function) {
            this.connectableFactory = callable;
            this.selector = function;
        }

        public void subscribe(Subscriber<? super R> subscriber) {
            try {
                ConnectableFlowable connectableFlowable = (ConnectableFlowable) ObjectHelper.requireNonNull(this.connectableFactory.call(), "The connectableFactory returned null");
                try {
                    Publisher publisher = (Publisher) ObjectHelper.requireNonNull(this.selector.apply(connectableFlowable), "The selector returned a null Publisher");
                    Object subscriberResourceWrapper = new SubscriberResourceWrapper(subscriber);
                    publisher.subscribe(subscriberResourceWrapper);
                    connectableFlowable.connect(new DisposableConsumer(subscriberResourceWrapper));
                } catch (Throwable th) {
                    Exceptions.throwIfFatal(th);
                    EmptySubscription.error(th, subscriber);
                }
            } catch (Throwable th2) {
                Exceptions.throwIfFatal(th2);
                EmptySubscription.error(th2, subscriber);
            }
        }
    }

    static final class Node extends AtomicReference<Node> {
        private static final long serialVersionUID = 245354315435971818L;
        final long index;
        final Object value;

        Node(Object obj, long j) {
            this.value = obj;
            this.index = j;
        }
    }

    static final class ReplayBufferTask<T> implements Callable<ReplayBuffer<T>> {
        private final int bufferSize;

        ReplayBufferTask(int i) {
            this.bufferSize = i;
        }

        public ReplayBuffer<T> call() {
            return new SizeBoundReplayBuffer(this.bufferSize);
        }
    }

    static final class ReplayPublisher<T> implements Publisher<T> {
        private final Callable<? extends ReplayBuffer<T>> bufferFactory;
        private final AtomicReference<ReplaySubscriber<T>> curr;

        ReplayPublisher(AtomicReference<ReplaySubscriber<T>> atomicReference, Callable<? extends ReplayBuffer<T>> callable) {
            this.curr = atomicReference;
            this.bufferFactory = callable;
        }

        public void subscribe(Subscriber<? super T> subscriber) {
            ReplaySubscriber replaySubscriber;
            while (true) {
                replaySubscriber = (ReplaySubscriber) this.curr.get();
                if (replaySubscriber != null) {
                    break;
                }
                try {
                    ReplaySubscriber replaySubscriber2 = new ReplaySubscriber((ReplayBuffer) this.bufferFactory.call());
                    if (this.curr.compareAndSet(null, replaySubscriber2)) {
                        replaySubscriber = replaySubscriber2;
                        break;
                    }
                } catch (Throwable th) {
                    Exceptions.throwIfFatal(th);
                    RuntimeException wrapOrThrow = ExceptionHelper.wrapOrThrow(th);
                }
            }
            InnerSubscription innerSubscription = new InnerSubscription(replaySubscriber, subscriber);
            subscriber.onSubscribe(innerSubscription);
            replaySubscriber.add(innerSubscription);
            if (innerSubscription.isDisposed()) {
                replaySubscriber.remove(innerSubscription);
                return;
            }
            replaySubscriber.manageRequests();
            replaySubscriber.buffer.replay(innerSubscription);
        }
    }

    static final class ReplaySubscriber<T> extends AtomicReference<Subscription> implements FlowableSubscriber<T>, Disposable {
        static final InnerSubscription[] EMPTY = new InnerSubscription[0];
        static final InnerSubscription[] TERMINATED = new InnerSubscription[0];
        private static final long serialVersionUID = 7224554242710036740L;
        final ReplayBuffer<T> buffer;
        boolean done;
        final AtomicInteger management = new AtomicInteger();
        long maxChildRequested;
        long maxUpstreamRequested;
        final AtomicBoolean shouldConnect = new AtomicBoolean();
        final AtomicReference<InnerSubscription<T>[]> subscribers = new AtomicReference(EMPTY);

        ReplaySubscriber(ReplayBuffer<T> replayBuffer) {
            this.buffer = replayBuffer;
        }

        public boolean isDisposed() {
            return this.subscribers.get() == TERMINATED;
        }

        public void dispose() {
            this.subscribers.set(TERMINATED);
            SubscriptionHelper.cancel(this);
        }

        boolean add(InnerSubscription<T> innerSubscription) {
            if (innerSubscription != null) {
                while (true) {
                    InnerSubscription[] innerSubscriptionArr = (InnerSubscription[]) this.subscribers.get();
                    if (innerSubscriptionArr == TERMINATED) {
                        return false;
                    }
                    int length = innerSubscriptionArr.length;
                    Object obj = new InnerSubscription[(length + 1)];
                    System.arraycopy(innerSubscriptionArr, 0, obj, 0, length);
                    obj[length] = innerSubscription;
                    if (this.subscribers.compareAndSet(innerSubscriptionArr, obj)) {
                        return true;
                    }
                }
            } else {
                throw new NullPointerException();
            }
        }

        void remove(InnerSubscription<T> innerSubscription) {
            while (true) {
                InnerSubscription[] innerSubscriptionArr = (InnerSubscription[]) this.subscribers.get();
                int length = innerSubscriptionArr.length;
                if (length != 0) {
                    int i = -1;
                    for (int i2 = 0; i2 < length; i2++) {
                        if (innerSubscriptionArr[i2].equals(innerSubscription)) {
                            i = i2;
                            break;
                        }
                    }
                    if (i >= 0) {
                        Object obj;
                        if (length == 1) {
                            obj = EMPTY;
                        } else {
                            Object obj2 = new InnerSubscription[(length - 1)];
                            System.arraycopy(innerSubscriptionArr, 0, obj2, 0, i);
                            System.arraycopy(innerSubscriptionArr, i + 1, obj2, i, (length - i) - 1);
                            obj = obj2;
                        }
                        if (this.subscribers.compareAndSet(innerSubscriptionArr, obj)) {
                            return;
                        }
                    } else {
                        return;
                    }
                }
                return;
            }
        }

        public void onSubscribe(Subscription subscription) {
            if (SubscriptionHelper.setOnce(this, subscription)) {
                manageRequests();
                for (InnerSubscription replay : (InnerSubscription[]) this.subscribers.get()) {
                    this.buffer.replay(replay);
                }
            }
        }

        public void onNext(T t) {
            if (!this.done) {
                this.buffer.next(t);
                for (InnerSubscription replay : (InnerSubscription[]) this.subscribers.get()) {
                    this.buffer.replay(replay);
                }
            }
        }

        public void onError(Throwable th) {
            if (this.done) {
                RxJavaPlugins.onError(th);
                return;
            }
            this.done = true;
            this.buffer.error(th);
            for (InnerSubscription replay : (InnerSubscription[]) this.subscribers.getAndSet(TERMINATED)) {
                this.buffer.replay(replay);
            }
        }

        public void onComplete() {
            if (!this.done) {
                this.done = true;
                this.buffer.complete();
                for (InnerSubscription replay : (InnerSubscription[]) this.subscribers.getAndSet(TERMINATED)) {
                    this.buffer.replay(replay);
                }
            }
        }

        void manageRequests() {
            if (this.management.getAndIncrement() == 0) {
                int i = 1;
                while (!isDisposed()) {
                    InnerSubscription[] innerSubscriptionArr = (InnerSubscription[]) this.subscribers.get();
                    long j = this.maxChildRequested;
                    long j2 = j;
                    for (InnerSubscription innerSubscription : innerSubscriptionArr) {
                        j2 = Math.max(j2, innerSubscription.totalRequested.get());
                    }
                    long j3 = this.maxUpstreamRequested;
                    Subscription subscription = (Subscription) get();
                    j = j2 - j;
                    if (j != 0) {
                        this.maxChildRequested = j2;
                        if (subscription == null) {
                            j3 += j;
                            if (j3 < 0) {
                                j3 = Long.MAX_VALUE;
                            }
                            this.maxUpstreamRequested = j3;
                        } else if (j3 != 0) {
                            this.maxUpstreamRequested = 0;
                            subscription.request(j3 + j);
                        } else {
                            subscription.request(j);
                        }
                    } else if (!(j3 == 0 || subscription == null)) {
                        this.maxUpstreamRequested = 0;
                        subscription.request(j3);
                    }
                    i = this.management.addAndGet(-i);
                    if (i == 0) {
                        return;
                    }
                }
            }
        }
    }

    static final class ScheduledReplayBufferTask<T> implements Callable<ReplayBuffer<T>> {
        private final int bufferSize;
        private final long maxAge;
        private final Scheduler scheduler;
        private final TimeUnit unit;

        ScheduledReplayBufferTask(int i, long j, TimeUnit timeUnit, Scheduler scheduler) {
            this.bufferSize = i;
            this.maxAge = j;
            this.unit = timeUnit;
            this.scheduler = scheduler;
        }

        public ReplayBuffer<T> call() {
            return new SizeAndTimeBoundReplayBuffer(this.bufferSize, this.maxAge, this.unit, this.scheduler);
        }
    }

    static final class SizeAndTimeBoundReplayBuffer<T> extends BoundedReplayBuffer<T> {
        private static final long serialVersionUID = 3457957419649567404L;
        final int limit;
        final long maxAge;
        final Scheduler scheduler;
        final TimeUnit unit;

        SizeAndTimeBoundReplayBuffer(int i, long j, TimeUnit timeUnit, Scheduler scheduler) {
            this.scheduler = scheduler;
            this.limit = i;
            this.maxAge = j;
            this.unit = timeUnit;
        }

        Object enterTransform(Object obj) {
            return new Timed(obj, this.scheduler.now(this.unit), this.unit);
        }

        Object leaveTransform(Object obj) {
            return ((Timed) obj).value();
        }

        void truncate() {
            long now = this.scheduler.now(this.unit) - this.maxAge;
            Node node = (Node) get();
            Node node2 = (Node) node.get();
            int i = 0;
            while (true) {
                Node node3 = node2;
                node2 = node;
                node = node3;
                if (node != null) {
                    if (this.size <= this.limit) {
                        if (((Timed) node.value).time() > now) {
                            break;
                        }
                        i++;
                        this.size--;
                        node2 = (Node) node.get();
                    } else {
                        i++;
                        this.size--;
                        node2 = (Node) node.get();
                    }
                } else {
                    break;
                }
            }
            if (i != 0) {
                setFirst(node2);
            }
        }

        /* JADX WARNING: Removed duplicated region for block: B:14:? A:{SYNTHETIC, RETURN} */
        /* JADX WARNING: Removed duplicated region for block: B:9:0x0040  */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        void truncateFinal() {
            long now = this.scheduler.now(this.unit) - this.maxAge;
            Node node = (Node) get();
            Node node2 = (Node) node.get();
            int i = 0;
            while (true) {
                Node node3 = node2;
                node2 = node;
                node = node3;
                if (node != null && this.size > 1 && ((Timed) node.value).time() <= now) {
                    i++;
                    this.size--;
                    node2 = (Node) node.get();
                } else if (i == 0) {
                    setFirst(node2);
                    return;
                } else {
                    return;
                }
            }
            if (i == 0) {
            }
        }

        Node getHead() {
            Node node;
            long now = this.scheduler.now(this.unit) - this.maxAge;
            Node node2 = (Node) get();
            Object obj = node2.get();
            while (true) {
                Node node3 = (Node) obj;
                node = node2;
                node2 = node3;
                if (node2 != null) {
                    Timed timed = (Timed) node2.value;
                    if (NotificationLite.isComplete(timed.value()) || NotificationLite.isError(timed.value()) || timed.time() > now) {
                        break;
                    }
                    obj = node2.get();
                } else {
                    break;
                }
            }
            return node;
        }
    }

    static final class SizeBoundReplayBuffer<T> extends BoundedReplayBuffer<T> {
        private static final long serialVersionUID = -5898283885385201806L;
        final int limit;

        SizeBoundReplayBuffer(int i) {
            this.limit = i;
        }

        void truncate() {
            if (this.size > this.limit) {
                removeFirst();
            }
        }
    }

    static final class UnboundedReplayBuffer<T> extends ArrayList<Object> implements ReplayBuffer<T> {
        private static final long serialVersionUID = 7063189396499112664L;
        volatile int size;

        UnboundedReplayBuffer(int i) {
            super(i);
        }

        public void next(T t) {
            add(NotificationLite.next(t));
            this.size++;
        }

        public void error(Throwable th) {
            add(NotificationLite.error(th));
            this.size++;
        }

        public void complete() {
            add(NotificationLite.complete());
            this.size++;
        }

        /* JADX WARNING: Missing block: B:9:0x000d, code:
            r0 = r15.child;
     */
        /* JADX WARNING: Missing block: B:11:0x0013, code:
            if (r15.isDisposed() == false) goto L_0x0016;
     */
        /* JADX WARNING: Missing block: B:12:0x0015, code:
            return;
     */
        /* JADX WARNING: Missing block: B:13:0x0016, code:
            r1 = r14.size;
            r2 = (java.lang.Integer) r15.index();
     */
        /* JADX WARNING: Missing block: B:14:0x001f, code:
            if (r2 == null) goto L_0x0026;
     */
        /* JADX WARNING: Missing block: B:15:0x0021, code:
            r2 = r2.intValue();
     */
        /* JADX WARNING: Missing block: B:16:0x0026, code:
            r2 = 0;
     */
        /* JADX WARNING: Missing block: B:17:0x0027, code:
            r4 = r15.get();
            r8 = r4;
            r10 = 0;
     */
        /* JADX WARNING: Missing block: B:19:0x0033, code:
            if (r8 == 0) goto L_0x0068;
     */
        /* JADX WARNING: Missing block: B:20:0x0035, code:
            if (r2 >= r1) goto L_0x0068;
     */
        /* JADX WARNING: Missing block: B:21:0x0037, code:
            r12 = get(r2);
     */
        /* JADX WARNING: Missing block: B:24:0x003f, code:
            if (io.reactivex.internal.util.NotificationLite.accept(r12, r0) == false) goto L_0x0042;
     */
        /* JADX WARNING: Missing block: B:25:0x0041, code:
            return;
     */
        /* JADX WARNING: Missing block: B:27:0x0047, code:
            if (r15.isDisposed() == false) goto L_0x004a;
     */
        /* JADX WARNING: Missing block: B:28:0x0049, code:
            return;
     */
        /* JADX WARNING: Missing block: B:29:0x004a, code:
            r2 = r2 + 1;
            r8 = r8 - 1;
            r10 = r10 + 1;
     */
        /* JADX WARNING: Missing block: B:30:0x0051, code:
            r1 = move-exception;
     */
        /* JADX WARNING: Missing block: B:31:0x0052, code:
            io.reactivex.exceptions.Exceptions.throwIfFatal(r1);
            r15.dispose();
     */
        /* JADX WARNING: Missing block: B:35:0x0064, code:
            r0.onError(r1);
     */
        /* JADX WARNING: Missing block: B:36:0x0067, code:
            return;
     */
        /* JADX WARNING: Missing block: B:38:0x006a, code:
            if (r10 == 0) goto L_0x007e;
     */
        /* JADX WARNING: Missing block: B:39:0x006c, code:
            r15.index = java.lang.Integer.valueOf(r2);
     */
        /* JADX WARNING: Missing block: B:40:0x0079, code:
            if (r4 == Long.MAX_VALUE) goto L_0x007e;
     */
        /* JADX WARNING: Missing block: B:41:0x007b, code:
            r15.produced(r10);
     */
        /* JADX WARNING: Missing block: B:42:0x007e, code:
            monitor-enter(r15);
     */
        /* JADX WARNING: Missing block: B:45:0x0081, code:
            if (r15.missed != false) goto L_0x0087;
     */
        /* JADX WARNING: Missing block: B:46:0x0083, code:
            r15.emitting = false;
     */
        /* JADX WARNING: Missing block: B:47:0x0085, code:
            monitor-exit(r15);
     */
        /* JADX WARNING: Missing block: B:48:0x0086, code:
            return;
     */
        /* JADX WARNING: Missing block: B:49:0x0087, code:
            r15.missed = false;
     */
        /* JADX WARNING: Missing block: B:50:0x0089, code:
            monitor-exit(r15);
     */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        public void replay(InnerSubscription<T> innerSubscription) {
            synchronized (innerSubscription) {
                if (innerSubscription.emitting) {
                    innerSubscription.missed = true;
                    return;
                }
                innerSubscription.emitting = true;
            }
        }
    }

    public static <U, R> Flowable<R> multicastSelector(Callable<? extends ConnectableFlowable<U>> callable, Function<? super Flowable<U>, ? extends Publisher<R>> function) {
        return Flowable.unsafeCreate(new MultiCastPublisher(callable, function));
    }

    public static <T> ConnectableFlowable<T> observeOn(ConnectableFlowable<T> connectableFlowable, Scheduler scheduler) {
        return RxJavaPlugins.onAssembly(new ConnectableFlowableReplay(connectableFlowable, connectableFlowable.observeOn(scheduler)));
    }

    public static <T> ConnectableFlowable<T> createFrom(Flowable<? extends T> flowable) {
        return create((Flowable) flowable, DEFAULT_UNBOUNDED_FACTORY);
    }

    public static <T> ConnectableFlowable<T> create(Flowable<T> flowable, int i) {
        if (i == Integer.MAX_VALUE) {
            return createFrom(flowable);
        }
        return create((Flowable) flowable, new ReplayBufferTask(i));
    }

    public static <T> ConnectableFlowable<T> create(Flowable<T> flowable, long j, TimeUnit timeUnit, Scheduler scheduler) {
        return create(flowable, j, timeUnit, scheduler, Integer.MAX_VALUE);
    }

    public static <T> ConnectableFlowable<T> create(Flowable<T> flowable, long j, TimeUnit timeUnit, Scheduler scheduler, int i) {
        return create((Flowable) flowable, new ScheduledReplayBufferTask(i, j, timeUnit, scheduler));
    }

    static <T> ConnectableFlowable<T> create(Flowable<T> flowable, Callable<? extends ReplayBuffer<T>> callable) {
        AtomicReference atomicReference = new AtomicReference();
        return RxJavaPlugins.onAssembly(new FlowableReplay(new ReplayPublisher(atomicReference, callable), flowable, atomicReference, callable));
    }

    private FlowableReplay(Publisher<T> publisher, Flowable<T> flowable, AtomicReference<ReplaySubscriber<T>> atomicReference, Callable<? extends ReplayBuffer<T>> callable) {
        this.onSubscribe = publisher;
        this.source = flowable;
        this.current = atomicReference;
        this.bufferFactory = callable;
    }

    public Publisher<T> source() {
        return this.source;
    }

    protected void subscribeActual(Subscriber<? super T> subscriber) {
        this.onSubscribe.subscribe(subscriber);
    }

    public void dispose() {
        this.current.lazySet(null);
    }

    public boolean isDisposed() {
        Disposable disposable = (Disposable) this.current.get();
        return disposable == null || disposable.isDisposed();
    }

    public void connect(Consumer<? super Disposable> consumer) {
        FlowableSubscriber flowableSubscriber;
        RuntimeException wrapOrThrow;
        while (true) {
            flowableSubscriber = (ReplaySubscriber) this.current.get();
            if (flowableSubscriber != null && !flowableSubscriber.isDisposed()) {
                break;
            }
            try {
                ReplaySubscriber replaySubscriber = new ReplaySubscriber((ReplayBuffer) this.bufferFactory.call());
                if (this.current.compareAndSet(flowableSubscriber, replaySubscriber)) {
                    flowableSubscriber = replaySubscriber;
                    break;
                }
            } catch (Throwable th) {
                Exceptions.throwIfFatal(th);
                wrapOrThrow = ExceptionHelper.wrapOrThrow(th);
            }
        }
        boolean z = !flowableSubscriber.shouldConnect.get() && flowableSubscriber.shouldConnect.compareAndSet(false, true);
        try {
            consumer.accept(flowableSubscriber);
            if (z) {
                this.source.subscribe(flowableSubscriber);
            }
        } catch (Throwable th2) {
            if (z) {
                flowableSubscriber.shouldConnect.compareAndSet(true, false);
            }
            Exceptions.throwIfFatal(th2);
            wrapOrThrow = ExceptionHelper.wrapOrThrow(th2);
        }
    }
}
