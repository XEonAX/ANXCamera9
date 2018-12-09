package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.annotations.Nullable;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.fuseable.ConditionalSubscriber;
import io.reactivex.internal.subscriptions.BasicQueueSubscription;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.BackpressureHelper;
import org.reactivestreams.Subscriber;

public final class FlowableFromArray<T> extends Flowable<T> {
    final T[] array;

    static abstract class BaseArraySubscription<T> extends BasicQueueSubscription<T> {
        private static final long serialVersionUID = -2252972430506210021L;
        final T[] array;
        volatile boolean cancelled;
        int index;

        abstract void fastPath();

        abstract void slowPath(long j);

        BaseArraySubscription(T[] tArr) {
            this.array = tArr;
        }

        public final int requestFusion(int i) {
            return i & 1;
        }

        @Nullable
        public final T poll() {
            int i = this.index;
            Object[] objArr = this.array;
            if (i == objArr.length) {
                return null;
            }
            this.index = i + 1;
            return ObjectHelper.requireNonNull(objArr[i], "array element is null");
        }

        public final boolean isEmpty() {
            return this.index == this.array.length;
        }

        public final void clear() {
            this.index = this.array.length;
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

    static final class ArrayConditionalSubscription<T> extends BaseArraySubscription<T> {
        private static final long serialVersionUID = 2587302975077663557L;
        final ConditionalSubscriber<? super T> actual;

        ArrayConditionalSubscription(ConditionalSubscriber<? super T> conditionalSubscriber, T[] tArr) {
            super(tArr);
            this.actual = conditionalSubscriber;
        }

        void fastPath() {
            Object[] objArr = this.array;
            int length = objArr.length;
            ConditionalSubscriber conditionalSubscriber = this.actual;
            int i = this.index;
            while (i != length) {
                if (!this.cancelled) {
                    Object obj = objArr[i];
                    if (obj == null) {
                        conditionalSubscriber.onError(new NullPointerException("array element is null"));
                        return;
                    } else {
                        conditionalSubscriber.tryOnNext(obj);
                        i++;
                    }
                } else {
                    return;
                }
            }
            if (!this.cancelled) {
                conditionalSubscriber.onComplete();
            }
        }

        /* JADX WARNING: Missing block: B:23:0x0044, code:
            r10.index = r2;
            r6 = addAndGet(-r11);
     */
        /* JADX WARNING: Missing block: B:24:0x004d, code:
            if (r6 != 0) goto L_0x0050;
     */
        /* JADX WARNING: Missing block: B:25:0x004f, code:
            return;
     */
        void slowPath(long r11) {
            /*
            r10 = this;
            r0 = r10.array;
            r1 = r0.length;
            r2 = r10.index;
            r3 = r10.actual;
            r4 = 0;
            r6 = r11;
        L_0x000b:
            r11 = r4;
        L_0x000c:
            r8 = (r11 > r6 ? 1 : (r11 == r6 ? 0 : -1));
            if (r8 == 0) goto L_0x0032;
        L_0x0010:
            if (r2 == r1) goto L_0x0032;
        L_0x0012:
            r8 = r10.cancelled;
            if (r8 == 0) goto L_0x0017;
        L_0x0016:
            return;
        L_0x0017:
            r8 = r0[r2];
            if (r8 != 0) goto L_0x0026;
        L_0x001b:
            r11 = new java.lang.NullPointerException;
            r12 = "array element is null";
            r11.<init>(r12);
            r3.onError(r11);
            return;
        L_0x0026:
            r8 = r3.tryOnNext(r8);
            if (r8 == 0) goto L_0x002f;
        L_0x002c:
            r8 = 1;
            r11 = r11 + r8;
        L_0x002f:
            r2 = r2 + 1;
            goto L_0x000c;
        L_0x0032:
            if (r2 != r1) goto L_0x003c;
        L_0x0034:
            r11 = r10.cancelled;
            if (r11 != 0) goto L_0x003b;
        L_0x0038:
            r3.onComplete();
        L_0x003b:
            return;
        L_0x003c:
            r6 = r10.get();
            r8 = (r11 > r6 ? 1 : (r11 == r6 ? 0 : -1));
            if (r8 != 0) goto L_0x000c;
        L_0x0044:
            r10.index = r2;
            r11 = -r11;
            r6 = r10.addAndGet(r11);
            r11 = (r6 > r4 ? 1 : (r6 == r4 ? 0 : -1));
            if (r11 != 0) goto L_0x0050;
        L_0x004f:
            return;
        L_0x0050:
            goto L_0x000b;
            */
            throw new UnsupportedOperationException("Method not decompiled: io.reactivex.internal.operators.flowable.FlowableFromArray.ArrayConditionalSubscription.slowPath(long):void");
        }
    }

    static final class ArraySubscription<T> extends BaseArraySubscription<T> {
        private static final long serialVersionUID = 2587302975077663557L;
        final Subscriber<? super T> actual;

        ArraySubscription(Subscriber<? super T> subscriber, T[] tArr) {
            super(tArr);
            this.actual = subscriber;
        }

        void fastPath() {
            Object[] objArr = this.array;
            int length = objArr.length;
            Subscriber subscriber = this.actual;
            int i = this.index;
            while (i != length) {
                if (!this.cancelled) {
                    Object obj = objArr[i];
                    if (obj == null) {
                        subscriber.onError(new NullPointerException("array element is null"));
                        return;
                    } else {
                        subscriber.onNext(obj);
                        i++;
                    }
                } else {
                    return;
                }
            }
            if (!this.cancelled) {
                subscriber.onComplete();
            }
        }

        /* JADX WARNING: Missing block: B:20:0x0041, code:
            r10.index = r2;
            r6 = addAndGet(-r11);
     */
        /* JADX WARNING: Missing block: B:21:0x004a, code:
            if (r6 != 0) goto L_0x004d;
     */
        /* JADX WARNING: Missing block: B:22:0x004c, code:
            return;
     */
        void slowPath(long r11) {
            /*
            r10 = this;
            r0 = r10.array;
            r1 = r0.length;
            r2 = r10.index;
            r3 = r10.actual;
            r4 = 0;
            r6 = r11;
        L_0x000b:
            r11 = r4;
        L_0x000c:
            r8 = (r11 > r6 ? 1 : (r11 == r6 ? 0 : -1));
            if (r8 == 0) goto L_0x002f;
        L_0x0010:
            if (r2 == r1) goto L_0x002f;
        L_0x0012:
            r8 = r10.cancelled;
            if (r8 == 0) goto L_0x0017;
        L_0x0016:
            return;
        L_0x0017:
            r8 = r0[r2];
            if (r8 != 0) goto L_0x0026;
        L_0x001b:
            r11 = new java.lang.NullPointerException;
            r12 = "array element is null";
            r11.<init>(r12);
            r3.onError(r11);
            return;
        L_0x0026:
            r3.onNext(r8);
            r8 = 1;
            r11 = r11 + r8;
            r2 = r2 + 1;
            goto L_0x000c;
        L_0x002f:
            if (r2 != r1) goto L_0x0039;
        L_0x0031:
            r11 = r10.cancelled;
            if (r11 != 0) goto L_0x0038;
        L_0x0035:
            r3.onComplete();
        L_0x0038:
            return;
        L_0x0039:
            r6 = r10.get();
            r8 = (r11 > r6 ? 1 : (r11 == r6 ? 0 : -1));
            if (r8 != 0) goto L_0x000c;
        L_0x0041:
            r10.index = r2;
            r11 = -r11;
            r6 = r10.addAndGet(r11);
            r11 = (r6 > r4 ? 1 : (r6 == r4 ? 0 : -1));
            if (r11 != 0) goto L_0x004d;
        L_0x004c:
            return;
        L_0x004d:
            goto L_0x000b;
            */
            throw new UnsupportedOperationException("Method not decompiled: io.reactivex.internal.operators.flowable.FlowableFromArray.ArraySubscription.slowPath(long):void");
        }
    }

    public FlowableFromArray(T[] tArr) {
        this.array = tArr;
    }

    public void subscribeActual(Subscriber<? super T> subscriber) {
        if (subscriber instanceof ConditionalSubscriber) {
            subscriber.onSubscribe(new ArrayConditionalSubscription((ConditionalSubscriber) subscriber, this.array));
        } else {
            subscriber.onSubscribe(new ArraySubscription(subscriber, this.array));
        }
    }
}
