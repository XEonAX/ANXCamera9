package io.reactivex.processors;

import io.reactivex.Scheduler;
import io.reactivex.annotations.CheckReturnValue;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.BackpressureHelper;
import io.reactivex.plugins.RxJavaPlugins;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;

public final class ReplayProcessor<T> extends FlowableProcessor<T> {
    static final ReplaySubscription[] EMPTY = new ReplaySubscription[0];
    private static final Object[] EMPTY_ARRAY = new Object[0];
    static final ReplaySubscription[] TERMINATED = new ReplaySubscription[0];
    final ReplayBuffer<T> buffer;
    boolean done;
    final AtomicReference<ReplaySubscription<T>[]> subscribers = new AtomicReference(EMPTY);

    static final class Node<T> extends AtomicReference<Node<T>> {
        private static final long serialVersionUID = 6404226426336033100L;
        final T value;

        Node(T t) {
            this.value = t;
        }
    }

    interface ReplayBuffer<T> {
        void complete();

        void error(Throwable th);

        Throwable getError();

        T getValue();

        T[] getValues(T[] tArr);

        boolean isDone();

        void next(T t);

        void replay(ReplaySubscription<T> replaySubscription);

        int size();
    }

    static final class ReplaySubscription<T> extends AtomicInteger implements Subscription {
        private static final long serialVersionUID = 466549804534799122L;
        final Subscriber<? super T> actual;
        volatile boolean cancelled;
        long emitted;
        Object index;
        final AtomicLong requested = new AtomicLong();
        final ReplayProcessor<T> state;

        ReplaySubscription(Subscriber<? super T> subscriber, ReplayProcessor<T> replayProcessor) {
            this.actual = subscriber;
            this.state = replayProcessor;
        }

        public void request(long j) {
            if (SubscriptionHelper.validate(j)) {
                BackpressureHelper.add(this.requested, j);
                this.state.buffer.replay(this);
            }
        }

        public void cancel() {
            if (!this.cancelled) {
                this.cancelled = true;
                this.state.remove(this);
            }
        }
    }

    static final class SizeAndTimeBoundReplayBuffer<T> implements ReplayBuffer<T> {
        volatile boolean done;
        Throwable error;
        volatile TimedNode<T> head;
        final long maxAge;
        final int maxSize;
        final Scheduler scheduler;
        int size;
        TimedNode<T> tail;
        final TimeUnit unit;

        SizeAndTimeBoundReplayBuffer(int i, long j, TimeUnit timeUnit, Scheduler scheduler) {
            this.maxSize = ObjectHelper.verifyPositive(i, "maxSize");
            this.maxAge = ObjectHelper.verifyPositive(j, "maxAge");
            this.unit = (TimeUnit) ObjectHelper.requireNonNull(timeUnit, "unit is null");
            this.scheduler = (Scheduler) ObjectHelper.requireNonNull(scheduler, "scheduler is null");
            TimedNode timedNode = new TimedNode(null, 0);
            this.tail = timedNode;
            this.head = timedNode;
        }

        void trim() {
            if (this.size > this.maxSize) {
                this.size--;
                this.head = (TimedNode) this.head.get();
            }
            long now = this.scheduler.now(this.unit) - this.maxAge;
            TimedNode timedNode = this.head;
            while (true) {
                TimedNode timedNode2 = (TimedNode) timedNode.get();
                if (timedNode2 == null) {
                    this.head = timedNode;
                    return;
                } else if (timedNode2.time > now) {
                    this.head = timedNode;
                    return;
                } else {
                    timedNode = timedNode2;
                }
            }
        }

        void trimFinal() {
            long now = this.scheduler.now(this.unit) - this.maxAge;
            TimedNode timedNode = this.head;
            while (true) {
                TimedNode timedNode2 = (TimedNode) timedNode.get();
                if (timedNode2 == null) {
                    this.head = timedNode;
                    return;
                } else if (timedNode2.time > now) {
                    this.head = timedNode;
                    return;
                } else {
                    timedNode = timedNode2;
                }
            }
        }

        public void next(T t) {
            TimedNode timedNode = new TimedNode(t, this.scheduler.now(this.unit));
            TimedNode timedNode2 = this.tail;
            this.tail = timedNode;
            this.size++;
            timedNode2.set(timedNode);
            trim();
        }

        public void error(Throwable th) {
            trimFinal();
            this.error = th;
            this.done = true;
        }

        public void complete() {
            trimFinal();
            this.done = true;
        }

        public T getValue() {
            TimedNode timedNode = this.head;
            while (true) {
                TimedNode timedNode2 = (TimedNode) timedNode.get();
                if (timedNode2 == null) {
                    break;
                }
                timedNode = timedNode2;
            }
            if (timedNode.time < this.scheduler.now(this.unit) - this.maxAge) {
                return null;
            }
            return timedNode.value;
        }

        public T[] getValues(T[] tArr) {
            TimedNode head = getHead();
            int size = size(head);
            int i = 0;
            if (size != 0) {
                if (tArr.length < size) {
                    tArr = (Object[]) Array.newInstance(tArr.getClass().getComponentType(), size);
                }
                while (i != size) {
                    head = (TimedNode) head.get();
                    tArr[i] = head.value;
                    i++;
                }
                if (tArr.length > size) {
                    tArr[size] = null;
                }
            } else if (tArr.length != 0) {
                tArr[0] = null;
            }
            return tArr;
        }

        TimedNode<T> getHead() {
            TimedNode<T> timedNode;
            TimedNode<T> timedNode2 = this.head;
            long now = this.scheduler.now(this.unit) - this.maxAge;
            Object obj = timedNode2.get();
            while (true) {
                TimedNode<T> timedNode3 = (TimedNode) obj;
                timedNode = timedNode2;
                timedNode2 = timedNode3;
                if (timedNode2 == null || timedNode2.time > now) {
                    return timedNode;
                }
                obj = timedNode2.get();
            }
            return timedNode;
        }

        public void replay(ReplaySubscription<T> replaySubscription) {
            if (replaySubscription.getAndIncrement() == 0) {
                Subscriber subscriber = replaySubscription.actual;
                TimedNode timedNode = (TimedNode) replaySubscription.index;
                if (timedNode == null) {
                    timedNode = getHead();
                }
                long j = replaySubscription.emitted;
                int i = 1;
                while (true) {
                    int i2;
                    Throwable th;
                    long j2 = replaySubscription.requested.get();
                    while (true) {
                        i2 = (j > j2 ? 1 : (j == j2 ? 0 : -1));
                        if (i2 == 0) {
                            break;
                        } else if (replaySubscription.cancelled) {
                            replaySubscription.index = null;
                            return;
                        } else {
                            boolean z;
                            boolean z2 = this.done;
                            TimedNode timedNode2 = (TimedNode) timedNode.get();
                            if (timedNode2 == null) {
                                z = true;
                            } else {
                                z = false;
                            }
                            if (z2 && z) {
                                replaySubscription.index = null;
                                replaySubscription.cancelled = true;
                                th = this.error;
                                if (th == null) {
                                    subscriber.onComplete();
                                } else {
                                    subscriber.onError(th);
                                }
                                return;
                            } else if (z) {
                                break;
                            } else {
                                subscriber.onNext(timedNode2.value);
                                j++;
                                timedNode = timedNode2;
                            }
                        }
                    }
                    if (i2 == 0) {
                        if (replaySubscription.cancelled) {
                            replaySubscription.index = null;
                            return;
                        } else if (this.done && timedNode.get() == null) {
                            replaySubscription.index = null;
                            replaySubscription.cancelled = true;
                            th = this.error;
                            if (th == null) {
                                subscriber.onComplete();
                            } else {
                                subscriber.onError(th);
                            }
                            return;
                        }
                    }
                    replaySubscription.index = timedNode;
                    replaySubscription.emitted = j;
                    i = replaySubscription.addAndGet(-i);
                    if (i == 0) {
                        return;
                    }
                }
            }
        }

        public int size() {
            return size(getHead());
        }

        int size(TimedNode<T> timedNode) {
            int i = 0;
            while (i != Integer.MAX_VALUE) {
                TimedNode timedNode2 = (TimedNode) timedNode2.get();
                if (timedNode2 == null) {
                    break;
                }
                i++;
            }
            return i;
        }

        public Throwable getError() {
            return this.error;
        }

        public boolean isDone() {
            return this.done;
        }
    }

    static final class SizeBoundReplayBuffer<T> implements ReplayBuffer<T> {
        volatile boolean done;
        Throwable error;
        volatile Node<T> head;
        final int maxSize;
        int size;
        Node<T> tail;

        SizeBoundReplayBuffer(int i) {
            this.maxSize = ObjectHelper.verifyPositive(i, "maxSize");
            Node node = new Node(null);
            this.tail = node;
            this.head = node;
        }

        void trim() {
            if (this.size > this.maxSize) {
                this.size--;
                this.head = (Node) this.head.get();
            }
        }

        public void next(T t) {
            Node node = new Node(t);
            Node node2 = this.tail;
            this.tail = node;
            this.size++;
            node2.set(node);
            trim();
        }

        public void error(Throwable th) {
            this.error = th;
            this.done = true;
        }

        public void complete() {
            this.done = true;
        }

        public boolean isDone() {
            return this.done;
        }

        public Throwable getError() {
            return this.error;
        }

        public T getValue() {
            Node node = this.head;
            while (true) {
                Node node2 = (Node) node.get();
                if (node2 == null) {
                    return node.value;
                }
                node = node2;
            }
        }

        public T[] getValues(T[] tArr) {
            Node node = this.head;
            int i = 0;
            Node node2 = node;
            int i2 = 0;
            while (true) {
                node2 = (Node) node2.get();
                if (node2 == null) {
                    break;
                }
                i2++;
            }
            if (tArr.length < i2) {
                tArr = (Object[]) Array.newInstance(tArr.getClass().getComponentType(), i2);
            }
            while (i < i2) {
                node = (Node) node.get();
                tArr[i] = node.value;
                i++;
            }
            if (tArr.length > i2) {
                tArr[i2] = null;
            }
            return tArr;
        }

        public void replay(ReplaySubscription<T> replaySubscription) {
            if (replaySubscription.getAndIncrement() == 0) {
                Subscriber subscriber = replaySubscription.actual;
                Node node = (Node) replaySubscription.index;
                if (node == null) {
                    node = this.head;
                }
                long j = replaySubscription.emitted;
                int i = 1;
                while (true) {
                    int i2;
                    Throwable th;
                    long j2 = replaySubscription.requested.get();
                    while (true) {
                        i2 = (j > j2 ? 1 : (j == j2 ? 0 : -1));
                        if (i2 == 0) {
                            break;
                        } else if (replaySubscription.cancelled) {
                            replaySubscription.index = null;
                            return;
                        } else {
                            boolean z;
                            boolean z2 = this.done;
                            Node node2 = (Node) node.get();
                            if (node2 == null) {
                                z = true;
                            } else {
                                z = false;
                            }
                            if (z2 && z) {
                                replaySubscription.index = null;
                                replaySubscription.cancelled = true;
                                th = this.error;
                                if (th == null) {
                                    subscriber.onComplete();
                                } else {
                                    subscriber.onError(th);
                                }
                                return;
                            } else if (z) {
                                break;
                            } else {
                                subscriber.onNext(node2.value);
                                j++;
                                node = node2;
                            }
                        }
                    }
                    if (i2 == 0) {
                        if (replaySubscription.cancelled) {
                            replaySubscription.index = null;
                            return;
                        } else if (this.done && node.get() == null) {
                            replaySubscription.index = null;
                            replaySubscription.cancelled = true;
                            th = this.error;
                            if (th == null) {
                                subscriber.onComplete();
                            } else {
                                subscriber.onError(th);
                            }
                            return;
                        }
                    }
                    replaySubscription.index = node;
                    replaySubscription.emitted = j;
                    i = replaySubscription.addAndGet(-i);
                    if (i == 0) {
                        return;
                    }
                }
            }
        }

        public int size() {
            Node node = this.head;
            int i = 0;
            while (i != Integer.MAX_VALUE) {
                node = (Node) node.get();
                if (node == null) {
                    break;
                }
                i++;
            }
            return i;
        }
    }

    static final class TimedNode<T> extends AtomicReference<TimedNode<T>> {
        private static final long serialVersionUID = 6404226426336033100L;
        final long time;
        final T value;

        TimedNode(T t, long j) {
            this.value = t;
            this.time = j;
        }
    }

    static final class UnboundedReplayBuffer<T> implements ReplayBuffer<T> {
        final List<T> buffer;
        volatile boolean done;
        Throwable error;
        volatile int size;

        UnboundedReplayBuffer(int i) {
            this.buffer = new ArrayList(ObjectHelper.verifyPositive(i, "capacityHint"));
        }

        public void next(T t) {
            this.buffer.add(t);
            this.size++;
        }

        public void error(Throwable th) {
            this.error = th;
            this.done = true;
        }

        public void complete() {
            this.done = true;
        }

        public T getValue() {
            int i = this.size;
            if (i == 0) {
                return null;
            }
            return this.buffer.get(i - 1);
        }

        public T[] getValues(T[] tArr) {
            int i = this.size;
            int i2 = 0;
            if (i == 0) {
                if (tArr.length != 0) {
                    tArr[0] = null;
                }
                return tArr;
            }
            List list = this.buffer;
            if (tArr.length < i) {
                tArr = (Object[]) Array.newInstance(tArr.getClass().getComponentType(), i);
            }
            while (i2 < i) {
                tArr[i2] = list.get(i2);
                i2++;
            }
            if (tArr.length > i) {
                tArr[i] = null;
            }
            return tArr;
        }

        public void replay(ReplaySubscription<T> replaySubscription) {
            if (replaySubscription.getAndIncrement() == 0) {
                List list = this.buffer;
                Subscriber subscriber = replaySubscription.actual;
                Integer num = (Integer) replaySubscription.index;
                int i = 0;
                if (num != null) {
                    i = num.intValue();
                } else {
                    replaySubscription.index = Integer.valueOf(0);
                }
                long j = replaySubscription.emitted;
                int i2 = 1;
                while (true) {
                    int i3;
                    Throwable th;
                    long j2 = replaySubscription.requested.get();
                    while (true) {
                        i3 = (j > j2 ? 1 : (j == j2 ? 0 : -1));
                        if (i3 == 0) {
                            break;
                        } else if (replaySubscription.cancelled) {
                            replaySubscription.index = null;
                            return;
                        } else {
                            boolean z = this.done;
                            int i4 = this.size;
                            if (z && i == i4) {
                                replaySubscription.index = null;
                                replaySubscription.cancelled = true;
                                th = this.error;
                                if (th == null) {
                                    subscriber.onComplete();
                                } else {
                                    subscriber.onError(th);
                                }
                                return;
                            } else if (i == i4) {
                                break;
                            } else {
                                subscriber.onNext(list.get(i));
                                i++;
                                j++;
                            }
                        }
                    }
                    if (i3 == 0) {
                        if (replaySubscription.cancelled) {
                            replaySubscription.index = null;
                            return;
                        }
                        boolean z2 = this.done;
                        int i5 = this.size;
                        if (z2 && i == i5) {
                            replaySubscription.index = null;
                            replaySubscription.cancelled = true;
                            th = this.error;
                            if (th == null) {
                                subscriber.onComplete();
                            } else {
                                subscriber.onError(th);
                            }
                            return;
                        }
                    }
                    replaySubscription.index = Integer.valueOf(i);
                    replaySubscription.emitted = j;
                    i2 = replaySubscription.addAndGet(-i2);
                    if (i2 == 0) {
                        return;
                    }
                }
            }
        }

        public int size() {
            return this.size;
        }

        public boolean isDone() {
            return this.done;
        }

        public Throwable getError() {
            return this.error;
        }
    }

    @CheckReturnValue
    public static <T> ReplayProcessor<T> create() {
        return new ReplayProcessor(new UnboundedReplayBuffer(16));
    }

    @CheckReturnValue
    public static <T> ReplayProcessor<T> create(int i) {
        return new ReplayProcessor(new UnboundedReplayBuffer(i));
    }

    @CheckReturnValue
    public static <T> ReplayProcessor<T> createWithSize(int i) {
        return new ReplayProcessor(new SizeBoundReplayBuffer(i));
    }

    static <T> ReplayProcessor<T> createUnbounded() {
        return new ReplayProcessor(new SizeBoundReplayBuffer(Integer.MAX_VALUE));
    }

    @CheckReturnValue
    public static <T> ReplayProcessor<T> createWithTime(long j, TimeUnit timeUnit, Scheduler scheduler) {
        return new ReplayProcessor(new SizeAndTimeBoundReplayBuffer(Integer.MAX_VALUE, j, timeUnit, scheduler));
    }

    @CheckReturnValue
    public static <T> ReplayProcessor<T> createWithTimeAndSize(long j, TimeUnit timeUnit, Scheduler scheduler, int i) {
        return new ReplayProcessor(new SizeAndTimeBoundReplayBuffer(i, j, timeUnit, scheduler));
    }

    ReplayProcessor(ReplayBuffer<T> replayBuffer) {
        this.buffer = replayBuffer;
    }

    protected void subscribeActual(Subscriber<? super T> subscriber) {
        ReplaySubscription replaySubscription = new ReplaySubscription(subscriber, this);
        subscriber.onSubscribe(replaySubscription);
        if (add(replaySubscription) && replaySubscription.cancelled) {
            remove(replaySubscription);
        } else {
            this.buffer.replay(replaySubscription);
        }
    }

    public void onSubscribe(Subscription subscription) {
        if (this.done) {
            subscription.cancel();
        } else {
            subscription.request(Long.MAX_VALUE);
        }
    }

    public void onNext(T t) {
        ObjectHelper.requireNonNull(t, "onNext called with null. Null values are generally not allowed in 2.x operators and sources.");
        if (!this.done) {
            ReplayBuffer replayBuffer = this.buffer;
            replayBuffer.next(t);
            for (ReplaySubscription replay : (ReplaySubscription[]) this.subscribers.get()) {
                replayBuffer.replay(replay);
            }
        }
    }

    public void onError(Throwable th) {
        ObjectHelper.requireNonNull(th, "onError called with null. Null values are generally not allowed in 2.x operators and sources.");
        if (this.done) {
            RxJavaPlugins.onError(th);
            return;
        }
        this.done = true;
        ReplayBuffer replayBuffer = this.buffer;
        replayBuffer.error(th);
        for (ReplaySubscription replay : (ReplaySubscription[]) this.subscribers.getAndSet(TERMINATED)) {
            replayBuffer.replay(replay);
        }
    }

    public void onComplete() {
        if (!this.done) {
            this.done = true;
            ReplayBuffer replayBuffer = this.buffer;
            replayBuffer.complete();
            for (ReplaySubscription replay : (ReplaySubscription[]) this.subscribers.getAndSet(TERMINATED)) {
                replayBuffer.replay(replay);
            }
        }
    }

    public boolean hasSubscribers() {
        return ((ReplaySubscription[]) this.subscribers.get()).length != 0;
    }

    int subscriberCount() {
        return ((ReplaySubscription[]) this.subscribers.get()).length;
    }

    public Throwable getThrowable() {
        ReplayBuffer replayBuffer = this.buffer;
        if (replayBuffer.isDone()) {
            return replayBuffer.getError();
        }
        return null;
    }

    public T getValue() {
        return this.buffer.getValue();
    }

    public Object[] getValues() {
        Object[] values = getValues(EMPTY_ARRAY);
        if (values == EMPTY_ARRAY) {
            return new Object[0];
        }
        return values;
    }

    public T[] getValues(T[] tArr) {
        return this.buffer.getValues(tArr);
    }

    public boolean hasComplete() {
        ReplayBuffer replayBuffer = this.buffer;
        return replayBuffer.isDone() && replayBuffer.getError() == null;
    }

    public boolean hasThrowable() {
        ReplayBuffer replayBuffer = this.buffer;
        return replayBuffer.isDone() && replayBuffer.getError() != null;
    }

    public boolean hasValue() {
        return this.buffer.size() != 0;
    }

    int size() {
        return this.buffer.size();
    }

    boolean add(ReplaySubscription<T> replaySubscription) {
        while (true) {
            ReplaySubscription[] replaySubscriptionArr = (ReplaySubscription[]) this.subscribers.get();
            if (replaySubscriptionArr == TERMINATED) {
                return false;
            }
            int length = replaySubscriptionArr.length;
            Object obj = new ReplaySubscription[(length + 1)];
            System.arraycopy(replaySubscriptionArr, 0, obj, 0, length);
            obj[length] = replaySubscription;
            if (this.subscribers.compareAndSet(replaySubscriptionArr, obj)) {
                return true;
            }
        }
    }

    void remove(ReplaySubscription<T> replaySubscription) {
        while (true) {
            ReplaySubscription[] replaySubscriptionArr = (ReplaySubscription[]) this.subscribers.get();
            if (replaySubscriptionArr != TERMINATED && replaySubscriptionArr != EMPTY) {
                int length = replaySubscriptionArr.length;
                int i = -1;
                for (int i2 = 0; i2 < length; i2++) {
                    if (replaySubscriptionArr[i2] == replaySubscription) {
                        i = i2;
                        break;
                    }
                }
                if (i >= 0) {
                    Object obj;
                    if (length == 1) {
                        obj = EMPTY;
                    } else {
                        Object obj2 = new ReplaySubscription[(length - 1)];
                        System.arraycopy(replaySubscriptionArr, 0, obj2, 0, i);
                        System.arraycopy(replaySubscriptionArr, i + 1, obj2, i, (length - i) - 1);
                        obj = obj2;
                    }
                    if (this.subscribers.compareAndSet(replaySubscriptionArr, obj)) {
                        return;
                    }
                } else {
                    return;
                }
            }
        }
    }
}
