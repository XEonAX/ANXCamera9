package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.annotations.Nullable;
import io.reactivex.internal.fuseable.ConditionalSubscriber;
import io.reactivex.internal.subscriptions.BasicQueueSubscription;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.BackpressureHelper;
import org.reactivestreams.Subscriber;

public final class FlowableRangeLong extends Flowable<Long> {
    final long end;
    final long start;

    static abstract class BaseRangeSubscription extends BasicQueueSubscription<Long> {
        private static final long serialVersionUID = -2252972430506210021L;
        volatile boolean cancelled;
        final long end;
        long index;

        abstract void fastPath();

        abstract void slowPath(long j);

        BaseRangeSubscription(long j, long j2) {
            this.index = j;
            this.end = j2;
        }

        public final int requestFusion(int i) {
            return i & 1;
        }

        @Nullable
        public final Long poll() {
            long j = this.index;
            if (j == this.end) {
                return null;
            }
            this.index = 1 + j;
            return Long.valueOf(j);
        }

        public final boolean isEmpty() {
            return this.index == this.end;
        }

        public final void clear() {
            this.index = this.end;
        }

        public final void request(long j) {
            if (!SubscriptionHelper.validate(j) || BackpressureHelper.add(this, j) != 0) {
                return;
            }
            if (j == Long.MAX_VALUE) {
                fastPath();
            } else {
                slowPath(j);
            }
        }

        public final void cancel() {
            this.cancelled = true;
        }
    }

    static final class RangeConditionalSubscription extends BaseRangeSubscription {
        private static final long serialVersionUID = 2587302975077663557L;
        final ConditionalSubscriber<? super Long> actual;

        RangeConditionalSubscription(ConditionalSubscriber<? super Long> conditionalSubscriber, long j, long j2) {
            super(j, j2);
            this.actual = conditionalSubscriber;
        }

        void fastPath() {
            long j = this.end;
            ConditionalSubscriber conditionalSubscriber = this.actual;
            long j2 = this.index;
            while (j2 != j) {
                if (!this.cancelled) {
                    conditionalSubscriber.tryOnNext(Long.valueOf(j2));
                    j2++;
                } else {
                    return;
                }
            }
            if (!this.cancelled) {
                conditionalSubscriber.onComplete();
            }
        }

        /* JADX WARNING: Missing block: B:21:0x003c, code:
            r12.index = r7;
            r2 = addAndGet(-r13);
     */
        /* JADX WARNING: Missing block: B:22:0x0045, code:
            if (r2 != 0) goto L_0x0048;
     */
        /* JADX WARNING: Missing block: B:23:0x0047, code:
            return;
     */
        void slowPath(long r13) {
            /*
            r12 = this;
            r0 = r12.end;
            r2 = r12.index;
            r4 = r12.actual;
            r5 = 0;
            r7 = r2;
            r2 = r13;
        L_0x000b:
            r13 = r5;
        L_0x000c:
            r9 = (r13 > r2 ? 1 : (r13 == r2 ? 0 : -1));
            if (r9 == 0) goto L_0x0028;
        L_0x0010:
            r9 = (r7 > r0 ? 1 : (r7 == r0 ? 0 : -1));
            if (r9 == 0) goto L_0x0028;
        L_0x0014:
            r9 = r12.cancelled;
            if (r9 == 0) goto L_0x0019;
        L_0x0018:
            return;
        L_0x0019:
            r9 = java.lang.Long.valueOf(r7);
            r9 = r4.tryOnNext(r9);
            r10 = 1;
            if (r9 == 0) goto L_0x0026;
        L_0x0025:
            r13 = r13 + r10;
        L_0x0026:
            r7 = r7 + r10;
            goto L_0x000c;
        L_0x0028:
            r2 = (r7 > r0 ? 1 : (r7 == r0 ? 0 : -1));
            if (r2 != 0) goto L_0x0034;
        L_0x002c:
            r13 = r12.cancelled;
            if (r13 != 0) goto L_0x0033;
        L_0x0030:
            r4.onComplete();
        L_0x0033:
            return;
        L_0x0034:
            r2 = r12.get();
            r9 = (r13 > r2 ? 1 : (r13 == r2 ? 0 : -1));
            if (r9 != 0) goto L_0x000c;
        L_0x003c:
            r12.index = r7;
            r13 = -r13;
            r2 = r12.addAndGet(r13);
            r13 = (r2 > r5 ? 1 : (r2 == r5 ? 0 : -1));
            if (r13 != 0) goto L_0x0048;
        L_0x0047:
            return;
        L_0x0048:
            goto L_0x000b;
            */
            throw new UnsupportedOperationException("Method not decompiled: io.reactivex.internal.operators.flowable.FlowableRangeLong.RangeConditionalSubscription.slowPath(long):void");
        }
    }

    static final class RangeSubscription extends BaseRangeSubscription {
        private static final long serialVersionUID = 2587302975077663557L;
        final Subscriber<? super Long> actual;

        RangeSubscription(Subscriber<? super Long> subscriber, long j, long j2) {
            super(j, j2);
            this.actual = subscriber;
        }

        void fastPath() {
            long j = this.end;
            Subscriber subscriber = this.actual;
            long j2 = this.index;
            while (j2 != j) {
                if (!this.cancelled) {
                    subscriber.onNext(Long.valueOf(j2));
                    j2++;
                } else {
                    return;
                }
            }
            if (!this.cancelled) {
                subscriber.onComplete();
            }
        }

        /* JADX WARNING: Missing block: B:18:0x0039, code:
            r11.index = r7;
            r2 = addAndGet(-r12);
     */
        /* JADX WARNING: Missing block: B:19:0x0042, code:
            if (r2 != 0) goto L_0x0045;
     */
        /* JADX WARNING: Missing block: B:20:0x0044, code:
            return;
     */
        void slowPath(long r12) {
            /*
            r11 = this;
            r0 = r11.end;
            r2 = r11.index;
            r4 = r11.actual;
            r5 = 0;
            r7 = r2;
            r2 = r12;
        L_0x000b:
            r12 = r5;
        L_0x000c:
            r9 = (r12 > r2 ? 1 : (r12 == r2 ? 0 : -1));
            if (r9 == 0) goto L_0x0025;
        L_0x0010:
            r9 = (r7 > r0 ? 1 : (r7 == r0 ? 0 : -1));
            if (r9 == 0) goto L_0x0025;
        L_0x0014:
            r9 = r11.cancelled;
            if (r9 == 0) goto L_0x0019;
        L_0x0018:
            return;
        L_0x0019:
            r9 = java.lang.Long.valueOf(r7);
            r4.onNext(r9);
            r9 = 1;
            r12 = r12 + r9;
            r7 = r7 + r9;
            goto L_0x000c;
        L_0x0025:
            r2 = (r7 > r0 ? 1 : (r7 == r0 ? 0 : -1));
            if (r2 != 0) goto L_0x0031;
        L_0x0029:
            r12 = r11.cancelled;
            if (r12 != 0) goto L_0x0030;
        L_0x002d:
            r4.onComplete();
        L_0x0030:
            return;
        L_0x0031:
            r2 = r11.get();
            r9 = (r12 > r2 ? 1 : (r12 == r2 ? 0 : -1));
            if (r9 != 0) goto L_0x000c;
        L_0x0039:
            r11.index = r7;
            r12 = -r12;
            r2 = r11.addAndGet(r12);
            r12 = (r2 > r5 ? 1 : (r2 == r5 ? 0 : -1));
            if (r12 != 0) goto L_0x0045;
        L_0x0044:
            return;
        L_0x0045:
            goto L_0x000b;
            */
            throw new UnsupportedOperationException("Method not decompiled: io.reactivex.internal.operators.flowable.FlowableRangeLong.RangeSubscription.slowPath(long):void");
        }
    }

    public FlowableRangeLong(long j, long j2) {
        this.start = j;
        this.end = j + j2;
    }

    public void subscribeActual(Subscriber<? super Long> subscriber) {
        if (subscriber instanceof ConditionalSubscriber) {
            subscriber.onSubscribe(new RangeConditionalSubscription((ConditionalSubscriber) subscriber, this.start, this.end));
            return;
        }
        subscriber.onSubscribe(new RangeSubscription(subscriber, this.start, this.end));
    }
}
