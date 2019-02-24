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
        /* Code decompiled incorrectly, please refer to instructions dump. */
        void slowPath(long j) {
            long j2 = this.end;
            long j3 = this.index;
            ConditionalSubscriber conditionalSubscriber = this.actual;
            long j4 = j3;
            j3 = j;
            while (true) {
                j = 0;
                while (true) {
                    if (j == j3 || j4 == j2) {
                        if (j4 == j2) {
                            if (!this.cancelled) {
                                conditionalSubscriber.onComplete();
                            }
                            return;
                        }
                        j3 = get();
                        if (j == j3) {
                            break;
                        }
                    } else if (!this.cancelled) {
                        if (conditionalSubscriber.tryOnNext(Long.valueOf(j4))) {
                            j++;
                        }
                        j4++;
                    } else {
                        return;
                    }
                }
            }
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
        /* Code decompiled incorrectly, please refer to instructions dump. */
        void slowPath(long j) {
            long j2 = this.end;
            long j3 = this.index;
            Subscriber subscriber = this.actual;
            long j4 = j3;
            j3 = j;
            while (true) {
                j = 0;
                while (true) {
                    if (j == j3 || j4 == j2) {
                        if (j4 == j2) {
                            if (!this.cancelled) {
                                subscriber.onComplete();
                            }
                            return;
                        }
                        j3 = get();
                        if (j == j3) {
                            break;
                        }
                    } else if (!this.cancelled) {
                        subscriber.onNext(Long.valueOf(j4));
                        j++;
                        j4++;
                    } else {
                        return;
                    }
                }
            }
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
