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
        /* Code decompiled incorrectly, please refer to instructions dump. */
        void slowPath(long j) {
            int i = this.end;
            int i2 = this.index;
            ConditionalSubscriber conditionalSubscriber = this.actual;
            long j2 = j;
            while (true) {
                j = 0;
                while (true) {
                    if (j == j2 || i2 == i) {
                        if (i2 == i) {
                            if (!this.cancelled) {
                                conditionalSubscriber.onComplete();
                            }
                            return;
                        }
                        j2 = get();
                        if (j == j2) {
                            break;
                        }
                    } else if (!this.cancelled) {
                        if (conditionalSubscriber.tryOnNext(Integer.valueOf(i2))) {
                            j++;
                        }
                        i2++;
                    } else {
                        return;
                    }
                }
            }
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
        /* Code decompiled incorrectly, please refer to instructions dump. */
        void slowPath(long j) {
            int i = this.end;
            int i2 = this.index;
            Subscriber subscriber = this.actual;
            long j2 = j;
            while (true) {
                j = 0;
                while (true) {
                    if (j == j2 || i2 == i) {
                        if (i2 == i) {
                            if (!this.cancelled) {
                                subscriber.onComplete();
                            }
                            return;
                        }
                        j2 = get();
                        if (j == j2) {
                            break;
                        }
                    } else if (!this.cancelled) {
                        subscriber.onNext(Integer.valueOf(i2));
                        j++;
                        i2++;
                    } else {
                        return;
                    }
                }
            }
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
