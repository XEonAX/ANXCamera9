package io.reactivex.internal.operators.parallel;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.BackpressureHelper;
import io.reactivex.parallel.ParallelFlowable;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;

public final class ParallelSortedJoin<T> extends Flowable<T> {
    final Comparator<? super T> comparator;
    final ParallelFlowable<List<T>> source;

    static final class SortedJoinInnerSubscriber<T> extends AtomicReference<Subscription> implements FlowableSubscriber<List<T>> {
        private static final long serialVersionUID = 6751017204873808094L;
        final int index;
        final SortedJoinSubscription<T> parent;

        SortedJoinInnerSubscriber(SortedJoinSubscription<T> sortedJoinSubscription, int i) {
            this.parent = sortedJoinSubscription;
            this.index = i;
        }

        public void onSubscribe(Subscription subscription) {
            if (SubscriptionHelper.setOnce(this, subscription)) {
                subscription.request(Long.MAX_VALUE);
            }
        }

        public void onNext(List<T> list) {
            this.parent.innerNext(list, this.index);
        }

        public void onError(Throwable th) {
            this.parent.innerError(th);
        }

        public void onComplete() {
        }

        void cancel() {
            SubscriptionHelper.cancel(this);
        }
    }

    static final class SortedJoinSubscription<T> extends AtomicInteger implements Subscription {
        private static final long serialVersionUID = 3481980673745556697L;
        final Subscriber<? super T> actual;
        volatile boolean cancelled;
        final Comparator<? super T> comparator;
        final AtomicReference<Throwable> error = new AtomicReference();
        final int[] indexes;
        final List<T>[] lists;
        final AtomicInteger remaining = new AtomicInteger();
        final AtomicLong requested = new AtomicLong();
        final SortedJoinInnerSubscriber<T>[] subscribers;

        SortedJoinSubscription(Subscriber<? super T> subscriber, int i, Comparator<? super T> comparator) {
            this.actual = subscriber;
            this.comparator = comparator;
            SortedJoinInnerSubscriber[] sortedJoinInnerSubscriberArr = new SortedJoinInnerSubscriber[i];
            for (int i2 = 0; i2 < i; i2++) {
                sortedJoinInnerSubscriberArr[i2] = new SortedJoinInnerSubscriber(this, i2);
            }
            this.subscribers = sortedJoinInnerSubscriberArr;
            this.lists = new List[i];
            this.indexes = new int[i];
            this.remaining.lazySet(i);
        }

        public void request(long j) {
            if (SubscriptionHelper.validate(j)) {
                BackpressureHelper.add(this.requested, j);
                if (this.remaining.get() == 0) {
                    drain();
                }
            }
        }

        public void cancel() {
            if (!this.cancelled) {
                this.cancelled = true;
                cancelAll();
                if (getAndIncrement() == 0) {
                    Arrays.fill(this.lists, null);
                }
            }
        }

        void cancelAll() {
            for (SortedJoinInnerSubscriber cancel : this.subscribers) {
                cancel.cancel();
            }
        }

        void innerNext(List<T> list, int i) {
            this.lists[i] = list;
            if (this.remaining.decrementAndGet() == 0) {
                drain();
            }
        }

        void innerError(Throwable th) {
            if (this.error.compareAndSet(null, th)) {
                drain();
            } else if (th != this.error.get()) {
                RxJavaPlugins.onError(th);
            }
        }

        /* JADX WARNING: Missing block: B:41:0x00a9, code:
            if (r13 != 0) goto L_0x00e8;
     */
        /* JADX WARNING: Missing block: B:43:0x00ad, code:
            if (r1.cancelled == false) goto L_0x00b3;
     */
        /* JADX WARNING: Missing block: B:44:0x00af, code:
            java.util.Arrays.fill(r3, null);
     */
        /* JADX WARNING: Missing block: B:45:0x00b2, code:
            return;
     */
        /* JADX WARNING: Missing block: B:46:0x00b3, code:
            r5 = (java.lang.Throwable) r1.error.get();
     */
        /* JADX WARNING: Missing block: B:47:0x00bb, code:
            if (r5 == null) goto L_0x00c7;
     */
        /* JADX WARNING: Missing block: B:48:0x00bd, code:
            cancelAll();
            java.util.Arrays.fill(r3, null);
            r2.onError(r5);
     */
        /* JADX WARNING: Missing block: B:49:0x00c6, code:
            return;
     */
        /* JADX WARNING: Missing block: B:50:0x00c7, code:
            r5 = 0;
     */
        /* JADX WARNING: Missing block: B:51:0x00c9, code:
            if (r5 >= r4) goto L_0x00dd;
     */
        /* JADX WARNING: Missing block: B:53:0x00d3, code:
            if (r0[r5] == r3[r5].size()) goto L_0x00da;
     */
        /* JADX WARNING: Missing block: B:54:0x00d5, code:
            r16 = null;
     */
        /* JADX WARNING: Missing block: B:55:0x00da, code:
            r5 = r5 + 1;
     */
        /* JADX WARNING: Missing block: B:56:0x00dd, code:
            r16 = 1;
     */
        /* JADX WARNING: Missing block: B:57:0x00df, code:
            if (r16 == null) goto L_0x00e8;
     */
        /* JADX WARNING: Missing block: B:58:0x00e1, code:
            java.util.Arrays.fill(r3, null);
            r2.onComplete();
     */
        /* JADX WARNING: Missing block: B:59:0x00e7, code:
            return;
     */
        /* JADX WARNING: Missing block: B:61:0x00ec, code:
            if (r11 == 0) goto L_0x00fd;
     */
        /* JADX WARNING: Missing block: B:63:0x00f5, code:
            if (r7 == Long.MAX_VALUE) goto L_0x00fd;
     */
        /* JADX WARNING: Missing block: B:64:0x00f7, code:
            r1.requested.addAndGet(-r11);
     */
        /* JADX WARNING: Missing block: B:65:0x00fd, code:
            r5 = get();
     */
        /* JADX WARNING: Missing block: B:66:0x0101, code:
            if (r5 != r6) goto L_0x010c;
     */
        /* JADX WARNING: Missing block: B:67:0x0103, code:
            r5 = addAndGet(-r6);
     */
        /* JADX WARNING: Missing block: B:68:0x0108, code:
            if (r5 != 0) goto L_0x010c;
     */
        /* JADX WARNING: Missing block: B:69:0x010b, code:
            return;
     */
        /* JADX WARNING: Missing block: B:70:0x010c, code:
            r6 = r5;
     */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        void drain() {
            if (getAndIncrement() == 0) {
                Subscriber subscriber = this.actual;
                List[] listArr = this.lists;
                int[] iArr = this.indexes;
                int length = iArr.length;
                int i = 1;
                while (true) {
                    long j = this.requested.get();
                    long j2 = 0;
                    while (true) {
                        int i2 = (j2 > j ? 1 : (j2 == j ? 0 : -1));
                        if (i2 == 0) {
                            break;
                        } else if (this.cancelled) {
                            Arrays.fill(listArr, null);
                            return;
                        } else {
                            Throwable th = (Throwable) this.error.get();
                            if (th != null) {
                                cancelAll();
                                Arrays.fill(listArr, null);
                                subscriber.onError(th);
                                return;
                            }
                            int i3 = -1;
                            Object obj = null;
                            for (i2 = 0; i2 < length; i2++) {
                                List list = listArr[i2];
                                int i4 = iArr[i2];
                                if (list.size() != i4) {
                                    Object obj2;
                                    if (obj == null) {
                                        obj2 = list.get(i4);
                                    } else {
                                        obj2 = list.get(i4);
                                        try {
                                            if ((this.comparator.compare(obj, obj2) > 0 ? 1 : null) == null) {
                                            }
                                        } catch (Throwable th2) {
                                            Exceptions.throwIfFatal(th2);
                                            cancelAll();
                                            Arrays.fill(listArr, null);
                                            if (!this.error.compareAndSet(null, th2)) {
                                                RxJavaPlugins.onError(th2);
                                            }
                                            subscriber.onError((Throwable) this.error.get());
                                            return;
                                        }
                                    }
                                    obj = obj2;
                                    i3 = i2;
                                }
                            }
                            if (obj == null) {
                                Arrays.fill(listArr, null);
                                subscriber.onComplete();
                                return;
                            }
                            subscriber.onNext(obj);
                            iArr[i3] = iArr[i3] + 1;
                            j2++;
                        }
                    }
                }
            }
        }
    }

    public ParallelSortedJoin(ParallelFlowable<List<T>> parallelFlowable, Comparator<? super T> comparator) {
        this.source = parallelFlowable;
        this.comparator = comparator;
    }

    protected void subscribeActual(Subscriber<? super T> subscriber) {
        Object sortedJoinSubscription = new SortedJoinSubscription(subscriber, this.source.parallelism(), this.comparator);
        subscriber.onSubscribe(sortedJoinSubscription);
        this.source.subscribe(sortedJoinSubscription.subscribers);
    }
}
