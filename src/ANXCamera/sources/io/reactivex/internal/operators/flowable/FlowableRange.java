package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.annotations.Nullable;
import io.reactivex.internal.fuseable.ConditionalSubscriber;
import io.reactivex.internal.subscriptions.BasicQueueSubscription;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.BackpressureHelper;
import org.reactivestreams.Subscriber;

public final class FlowableRange extends Flowable<Integer> {
    final int end;
    final int start;

    static abstract class BaseRangeSubscription extends BasicQueueSubscription<Integer> {
        private static final long serialVersionUID = -2252972430506210021L;
        volatile boolean cancelled;
        final int end;
        int index;

        abstract void fastPath();

        abstract void slowPath(long j);

        BaseRangeSubscription(int i, int i2) {
            this.index = i;
            this.end = i2;
        }

        public final int requestFusion(int i) {
            return i & 1;
        }

        @Nullable
        public final Integer poll() {
            int i = this.index;
            if (i == this.end) {
                return null;
            }
            this.index = i + 1;
            return Integer.valueOf(i);
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
        final ConditionalSubscriber<? super Integer> actual;

        RangeConditionalSubscription(ConditionalSubscriber<? super Integer> conditionalSubscriber, int i, int i2) {
            super(i, i2);
            this.actual = conditionalSubscriber;
        }

        void fastPath() {
            int i = this.end;
            ConditionalSubscriber conditionalSubscriber = this.actual;
            int i2 = this.index;
            while (i2 != i) {
                if (!this.cancelled) {
                    conditionalSubscriber.tryOnNext(Integer.valueOf(i2));
                    i2++;
                } else {
                    return;
                }
            }
            if (!this.cancelled) {
                conditionalSubscriber.onComplete();
            }
        }

        /* JADX WARNING: Missing block: B:19:0x0038, code:
            r9.index = r1;
            r5 = addAndGet(-r10);
     */
        /* JADX WARNING: Missing block: B:20:0x0041, code:
            if (r5 != 0) goto L_0x0044;
     */
        /* JADX WARNING: Missing block: B:21:0x0043, code:
            return;
     */
        void slowPath(long r10) {
            /*
            r9 = this;
            r0 = r9.end;
            r1 = r9.index;
            r2 = r9.actual;
            r3 = 0;
            r5 = r10;
        L_0x000a:
            r10 = r3;
        L_0x000b:
            r7 = (r10 > r5 ? 1 : (r10 == r5 ? 0 : -1));
            if (r7 == 0) goto L_0x0026;
        L_0x000f:
            if (r1 == r0) goto L_0x0026;
        L_0x0011:
            r7 = r9.cancelled;
            if (r7 == 0) goto L_0x0016;
        L_0x0015:
            return;
        L_0x0016:
            r7 = java.lang.Integer.valueOf(r1);
            r7 = r2.tryOnNext(r7);
            if (r7 == 0) goto L_0x0023;
        L_0x0020:
            r7 = 1;
            r10 = r10 + r7;
        L_0x0023:
            r1 = r1 + 1;
            goto L_0x000b;
        L_0x0026:
            if (r1 != r0) goto L_0x0030;
        L_0x0028:
            r10 = r9.cancelled;
            if (r10 != 0) goto L_0x002f;
        L_0x002c:
            r2.onComplete();
        L_0x002f:
            return;
        L_0x0030:
            r5 = r9.get();
            r7 = (r10 > r5 ? 1 : (r10 == r5 ? 0 : -1));
            if (r7 != 0) goto L_0x000b;
        L_0x0038:
            r9.index = r1;
            r10 = -r10;
            r5 = r9.addAndGet(r10);
            r10 = (r5 > r3 ? 1 : (r5 == r3 ? 0 : -1));
            if (r10 != 0) goto L_0x0044;
        L_0x0043:
            return;
        L_0x0044:
            goto L_0x000a;
            */
            throw new UnsupportedOperationException("Method not decompiled: io.reactivex.internal.operators.flowable.FlowableRange.RangeConditionalSubscription.slowPath(long):void");
        }
    }

    static final class RangeSubscription extends BaseRangeSubscription {
        private static final long serialVersionUID = 2587302975077663557L;
        final Subscriber<? super Integer> actual;

        RangeSubscription(Subscriber<? super Integer> subscriber, int i, int i2) {
            super(i, i2);
            this.actual = subscriber;
        }

        void fastPath() {
            int i = this.end;
            Subscriber subscriber = this.actual;
            int i2 = this.index;
            while (i2 != i) {
                if (!this.cancelled) {
                    subscriber.onNext(Integer.valueOf(i2));
                    i2++;
                } else {
                    return;
                }
            }
            if (!this.cancelled) {
                subscriber.onComplete();
            }
        }

        /* JADX WARNING: Missing block: B:16:0x0035, code:
            r9.index = r1;
            r5 = addAndGet(-r10);
     */
        /* JADX WARNING: Missing block: B:17:0x003e, code:
            if (r5 != 0) goto L_0x0041;
     */
        /* JADX WARNING: Missing block: B:18:0x0040, code:
            return;
     */
        void slowPath(long r10) {
            /*
            r9 = this;
            r0 = r9.end;
            r1 = r9.index;
            r2 = r9.actual;
            r3 = 0;
            r5 = r10;
        L_0x000a:
            r10 = r3;
        L_0x000b:
            r7 = (r10 > r5 ? 1 : (r10 == r5 ? 0 : -1));
            if (r7 == 0) goto L_0x0023;
        L_0x000f:
            if (r1 == r0) goto L_0x0023;
        L_0x0011:
            r7 = r9.cancelled;
            if (r7 == 0) goto L_0x0016;
        L_0x0015:
            return;
        L_0x0016:
            r7 = java.lang.Integer.valueOf(r1);
            r2.onNext(r7);
            r7 = 1;
            r10 = r10 + r7;
            r1 = r1 + 1;
            goto L_0x000b;
        L_0x0023:
            if (r1 != r0) goto L_0x002d;
        L_0x0025:
            r10 = r9.cancelled;
            if (r10 != 0) goto L_0x002c;
        L_0x0029:
            r2.onComplete();
        L_0x002c:
            return;
        L_0x002d:
            r5 = r9.get();
            r7 = (r10 > r5 ? 1 : (r10 == r5 ? 0 : -1));
            if (r7 != 0) goto L_0x000b;
        L_0x0035:
            r9.index = r1;
            r10 = -r10;
            r5 = r9.addAndGet(r10);
            r10 = (r5 > r3 ? 1 : (r5 == r3 ? 0 : -1));
            if (r10 != 0) goto L_0x0041;
        L_0x0040:
            return;
        L_0x0041:
            goto L_0x000a;
            */
            throw new UnsupportedOperationException("Method not decompiled: io.reactivex.internal.operators.flowable.FlowableRange.RangeSubscription.slowPath(long):void");
        }
    }

    public FlowableRange(int i, int i2) {
        this.start = i;
        this.end = i + i2;
    }

    public void subscribeActual(Subscriber<? super Integer> subscriber) {
        if (subscriber instanceof ConditionalSubscriber) {
            subscriber.onSubscribe(new RangeConditionalSubscription((ConditionalSubscriber) subscriber, this.start, this.end));
        } else {
            subscriber.onSubscribe(new RangeSubscription(subscriber, this.start, this.end));
        }
    }
}
