package io.reactivex.internal.operators.parallel;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
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
        void drain() {
            /*
            r19 = this;
            r1 = r19;
            r0 = r19.getAndIncrement();
            if (r0 == 0) goto L_0x0009;
        L_0x0008:
            return;
            r2 = r1.actual;
            r3 = r1.lists;
            r0 = r1.indexes;
            r4 = r0.length;
            r6 = 1;
        L_0x0012:
            r7 = r1.requested;
            r7 = r7.get();
            r11 = 0;
        L_0x001b:
            r13 = (r11 > r7 ? 1 : (r11 == r7 ? 0 : -1));
            r15 = 0;
            if (r13 == 0) goto L_0x00a8;
        L_0x0020:
            r13 = r1.cancelled;
            if (r13 == 0) goto L_0x0028;
        L_0x0024:
            java.util.Arrays.fill(r3, r15);
            return;
        L_0x0028:
            r13 = r1.error;
            r13 = r13.get();
            r13 = (java.lang.Throwable) r13;
            if (r13 == 0) goto L_0x003c;
        L_0x0032:
            r19.cancelAll();
            java.util.Arrays.fill(r3, r15);
            r2.onError(r13);
            return;
            r13 = -1;
            r17 = r13;
            r14 = r15;
            r13 = 0;
        L_0x0042:
            if (r13 >= r4) goto L_0x0091;
        L_0x0044:
            r9 = r3[r13];
            r10 = r0[r13];
            r5 = r9.size();
            if (r5 == r10) goto L_0x008e;
        L_0x004e:
            if (r14 != 0) goto L_0x0059;
        L_0x0050:
            r5 = r9.get(r10);
        L_0x0055:
            r14 = r5;
            r17 = r13;
            goto L_0x008e;
        L_0x0059:
            r5 = r9.get(r10);
            r9 = r1.comparator;	 Catch:{ Throwable -> 0x006d }
            r9 = r9.compare(r14, r5);	 Catch:{ Throwable -> 0x006d }
            if (r9 <= 0) goto L_0x0067;
        L_0x0065:
            r9 = 1;
            goto L_0x0069;
            r9 = 0;
        L_0x0069:
            if (r9 == 0) goto L_0x008e;
            goto L_0x0055;
        L_0x006d:
            r0 = move-exception;
            io.reactivex.exceptions.Exceptions.throwIfFatal(r0);
            r19.cancelAll();
            java.util.Arrays.fill(r3, r15);
            r3 = r1.error;
            r3 = r3.compareAndSet(r15, r0);
            if (r3 != 0) goto L_0x0082;
        L_0x007f:
            io.reactivex.plugins.RxJavaPlugins.onError(r0);
        L_0x0082:
            r0 = r1.error;
            r0 = r0.get();
            r0 = (java.lang.Throwable) r0;
            r2.onError(r0);
            return;
        L_0x008e:
            r13 = r13 + 1;
            goto L_0x0042;
        L_0x0091:
            if (r14 != 0) goto L_0x009a;
        L_0x0093:
            java.util.Arrays.fill(r3, r15);
            r2.onComplete();
            return;
        L_0x009a:
            r2.onNext(r14);
            r5 = r0[r17];
            r9 = 1;
            r5 = r5 + r9;
            r0[r17] = r5;
            r13 = 1;
            r11 = r11 + r13;
            goto L_0x001b;
        L_0x00a8:
            r9 = 1;
            if (r13 != 0) goto L_0x00e8;
        L_0x00ab:
            r5 = r1.cancelled;
            if (r5 == 0) goto L_0x00b3;
        L_0x00af:
            java.util.Arrays.fill(r3, r15);
            return;
        L_0x00b3:
            r5 = r1.error;
            r5 = r5.get();
            r5 = (java.lang.Throwable) r5;
            if (r5 == 0) goto L_0x00c7;
        L_0x00bd:
            r19.cancelAll();
            java.util.Arrays.fill(r3, r15);
            r2.onError(r5);
            return;
            r5 = 0;
        L_0x00c9:
            if (r5 >= r4) goto L_0x00dd;
        L_0x00cb:
            r10 = r0[r5];
            r13 = r3[r5];
            r13 = r13.size();
            if (r10 == r13) goto L_0x00da;
            r16 = 0;
            goto L_0x00df;
        L_0x00da:
            r5 = r5 + 1;
            goto L_0x00c9;
        L_0x00dd:
            r16 = r9;
        L_0x00df:
            if (r16 == 0) goto L_0x00e8;
        L_0x00e1:
            java.util.Arrays.fill(r3, r15);
            r2.onComplete();
            return;
        L_0x00e8:
            r13 = 0;
            r5 = (r11 > r13 ? 1 : (r11 == r13 ? 0 : -1));
            if (r5 == 0) goto L_0x00fd;
        L_0x00ee:
            r13 = 9223372036854775807; // 0x7fffffffffffffff float:NaN double:NaN;
            r5 = (r7 > r13 ? 1 : (r7 == r13 ? 0 : -1));
            if (r5 == 0) goto L_0x00fd;
        L_0x00f7:
            r5 = r1.requested;
            r7 = -r11;
            r5.addAndGet(r7);
        L_0x00fd:
            r5 = r19.get();
            if (r5 != r6) goto L_0x010e;
        L_0x0103:
            r5 = -r6;
            r5 = r1.addAndGet(r5);
            if (r5 != 0) goto L_0x010c;
            return;
        L_0x010c:
            r6 = r5;
            goto L_0x010f;
        L_0x010e:
            goto L_0x010c;
        L_0x010f:
            goto L_0x0012;
            */
            throw new UnsupportedOperationException("Method not decompiled: io.reactivex.internal.operators.parallel.ParallelSortedJoin.SortedJoinSubscription.drain():void");
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
