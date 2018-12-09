package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.annotations.Nullable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.fuseable.ConditionalSubscriber;
import io.reactivex.internal.subscriptions.BasicQueueSubscription;
import io.reactivex.internal.subscriptions.EmptySubscription;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.BackpressureHelper;
import java.util.Iterator;
import org.reactivestreams.Subscriber;

public final class FlowableFromIterable<T> extends Flowable<T> {
    final Iterable<? extends T> source;

    static abstract class BaseRangeSubscription<T> extends BasicQueueSubscription<T> {
        private static final long serialVersionUID = -2252972430506210021L;
        volatile boolean cancelled;
        Iterator<? extends T> it;
        boolean once;

        abstract void fastPath();

        abstract void slowPath(long j);

        BaseRangeSubscription(Iterator<? extends T> it) {
            this.it = it;
        }

        public final int requestFusion(int i) {
            return i & 1;
        }

        @Nullable
        public final T poll() {
            if (this.it == null) {
                return null;
            }
            if (!this.once) {
                this.once = true;
            } else if (!this.it.hasNext()) {
                return null;
            }
            return ObjectHelper.requireNonNull(this.it.next(), "Iterator.next() returned a null value");
        }

        public final boolean isEmpty() {
            return this.it == null || !this.it.hasNext();
        }

        public final void clear() {
            this.it = null;
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

    static final class IteratorConditionalSubscription<T> extends BaseRangeSubscription<T> {
        private static final long serialVersionUID = -6022804456014692607L;
        final ConditionalSubscriber<? super T> actual;

        IteratorConditionalSubscription(ConditionalSubscriber<? super T> conditionalSubscriber, Iterator<? extends T> it) {
            super(it);
            this.actual = conditionalSubscriber;
        }

        void fastPath() {
            Iterator it = this.it;
            ConditionalSubscriber conditionalSubscriber = this.actual;
            while (!this.cancelled) {
                try {
                    Object next = it.next();
                    if (!this.cancelled) {
                        if (next == null) {
                            conditionalSubscriber.onError(new NullPointerException("Iterator.next() returned a null value"));
                            return;
                        }
                        conditionalSubscriber.tryOnNext(next);
                        if (!this.cancelled) {
                            try {
                                if (!it.hasNext()) {
                                    if (!this.cancelled) {
                                        conditionalSubscriber.onComplete();
                                    }
                                    return;
                                }
                            } catch (Throwable th) {
                                Exceptions.throwIfFatal(th);
                                conditionalSubscriber.onError(th);
                                return;
                            }
                        }
                        return;
                    }
                    return;
                } catch (Throwable th2) {
                    Exceptions.throwIfFatal(th2);
                    conditionalSubscriber.onError(th2);
                    return;
                }
            }
        }

        /* JADX WARNING: Missing block: B:36:0x005f, code:
            r4 = addAndGet(-r9);
     */
        /* JADX WARNING: Missing block: B:37:0x0066, code:
            if (r4 != 0) goto L_0x0069;
     */
        /* JADX WARNING: Missing block: B:38:0x0068, code:
            return;
     */
        void slowPath(long r9) {
            /*
            r8 = this;
            r0 = r8.it;
            r1 = r8.actual;
            r2 = 0;
            r4 = r9;
        L_0x0008:
            r9 = r2;
        L_0x0009:
            r6 = (r9 > r4 ? 1 : (r9 == r4 ? 0 : -1));
            if (r6 == 0) goto L_0x0057;
        L_0x000d:
            r6 = r8.cancelled;
            if (r6 == 0) goto L_0x0012;
        L_0x0011:
            return;
        L_0x0012:
            r6 = r0.next();	 Catch:{ Throwable -> 0x004f }
            r7 = r8.cancelled;
            if (r7 == 0) goto L_0x001c;
        L_0x001b:
            return;
        L_0x001c:
            if (r6 != 0) goto L_0x0029;
        L_0x001e:
            r9 = new java.lang.NullPointerException;
            r10 = "Iterator.next() returned a null value";
            r9.<init>(r10);
            r1.onError(r9);
            return;
        L_0x0029:
            r6 = r1.tryOnNext(r6);
            r7 = r8.cancelled;
            if (r7 == 0) goto L_0x0032;
        L_0x0031:
            return;
        L_0x0032:
            r7 = r0.hasNext();	 Catch:{ Throwable -> 0x0047 }
            if (r7 != 0) goto L_0x0041;
        L_0x0039:
            r9 = r8.cancelled;
            if (r9 != 0) goto L_0x0040;
        L_0x003d:
            r1.onComplete();
        L_0x0040:
            return;
        L_0x0041:
            if (r6 == 0) goto L_0x0046;
        L_0x0043:
            r6 = 1;
            r9 = r9 + r6;
        L_0x0046:
            goto L_0x0009;
        L_0x0047:
            r9 = move-exception;
            io.reactivex.exceptions.Exceptions.throwIfFatal(r9);
            r1.onError(r9);
            return;
        L_0x004f:
            r9 = move-exception;
            io.reactivex.exceptions.Exceptions.throwIfFatal(r9);
            r1.onError(r9);
            return;
        L_0x0057:
            r4 = r8.get();
            r6 = (r9 > r4 ? 1 : (r9 == r4 ? 0 : -1));
            if (r6 != 0) goto L_0x0009;
        L_0x005f:
            r9 = -r9;
            r4 = r8.addAndGet(r9);
            r9 = (r4 > r2 ? 1 : (r4 == r2 ? 0 : -1));
            if (r9 != 0) goto L_0x0069;
        L_0x0068:
            return;
        L_0x0069:
            goto L_0x0008;
            */
            throw new UnsupportedOperationException("Method not decompiled: io.reactivex.internal.operators.flowable.FlowableFromIterable.IteratorConditionalSubscription.slowPath(long):void");
        }
    }

    static final class IteratorSubscription<T> extends BaseRangeSubscription<T> {
        private static final long serialVersionUID = -6022804456014692607L;
        final Subscriber<? super T> actual;

        IteratorSubscription(Subscriber<? super T> subscriber, Iterator<? extends T> it) {
            super(it);
            this.actual = subscriber;
        }

        void fastPath() {
            Iterator it = this.it;
            Subscriber subscriber = this.actual;
            while (!this.cancelled) {
                try {
                    Object next = it.next();
                    if (!this.cancelled) {
                        if (next == null) {
                            subscriber.onError(new NullPointerException("Iterator.next() returned a null value"));
                            return;
                        }
                        subscriber.onNext(next);
                        if (!this.cancelled) {
                            try {
                                if (!it.hasNext()) {
                                    if (!this.cancelled) {
                                        subscriber.onComplete();
                                    }
                                    return;
                                }
                            } catch (Throwable th) {
                                Exceptions.throwIfFatal(th);
                                subscriber.onError(th);
                                return;
                            }
                        }
                        return;
                    }
                    return;
                } catch (Throwable th2) {
                    Exceptions.throwIfFatal(th2);
                    subscriber.onError(th2);
                    return;
                }
            }
        }

        /* JADX WARNING: Missing block: B:34:0x005c, code:
            r4 = addAndGet(-r9);
     */
        /* JADX WARNING: Missing block: B:35:0x0063, code:
            if (r4 != 0) goto L_0x0066;
     */
        /* JADX WARNING: Missing block: B:36:0x0065, code:
            return;
     */
        void slowPath(long r9) {
            /*
            r8 = this;
            r0 = r8.it;
            r1 = r8.actual;
            r2 = 0;
            r4 = r9;
        L_0x0008:
            r9 = r2;
        L_0x0009:
            r6 = (r9 > r4 ? 1 : (r9 == r4 ? 0 : -1));
            if (r6 == 0) goto L_0x0054;
        L_0x000d:
            r6 = r8.cancelled;
            if (r6 == 0) goto L_0x0012;
        L_0x0011:
            return;
        L_0x0012:
            r6 = r0.next();	 Catch:{ Throwable -> 0x004c }
            r7 = r8.cancelled;
            if (r7 == 0) goto L_0x001c;
        L_0x001b:
            return;
        L_0x001c:
            if (r6 != 0) goto L_0x0029;
        L_0x001e:
            r9 = new java.lang.NullPointerException;
            r10 = "Iterator.next() returned a null value";
            r9.<init>(r10);
            r1.onError(r9);
            return;
        L_0x0029:
            r1.onNext(r6);
            r6 = r8.cancelled;
            if (r6 == 0) goto L_0x0031;
        L_0x0030:
            return;
        L_0x0031:
            r6 = r0.hasNext();	 Catch:{ Throwable -> 0x0044 }
            if (r6 != 0) goto L_0x0040;
        L_0x0038:
            r9 = r8.cancelled;
            if (r9 != 0) goto L_0x003f;
        L_0x003c:
            r1.onComplete();
        L_0x003f:
            return;
        L_0x0040:
            r6 = 1;
            r9 = r9 + r6;
            goto L_0x0009;
        L_0x0044:
            r9 = move-exception;
            io.reactivex.exceptions.Exceptions.throwIfFatal(r9);
            r1.onError(r9);
            return;
        L_0x004c:
            r9 = move-exception;
            io.reactivex.exceptions.Exceptions.throwIfFatal(r9);
            r1.onError(r9);
            return;
        L_0x0054:
            r4 = r8.get();
            r6 = (r9 > r4 ? 1 : (r9 == r4 ? 0 : -1));
            if (r6 != 0) goto L_0x0009;
        L_0x005c:
            r9 = -r9;
            r4 = r8.addAndGet(r9);
            r9 = (r4 > r2 ? 1 : (r4 == r2 ? 0 : -1));
            if (r9 != 0) goto L_0x0066;
        L_0x0065:
            return;
        L_0x0066:
            goto L_0x0008;
            */
            throw new UnsupportedOperationException("Method not decompiled: io.reactivex.internal.operators.flowable.FlowableFromIterable.IteratorSubscription.slowPath(long):void");
        }
    }

    public FlowableFromIterable(Iterable<? extends T> iterable) {
        this.source = iterable;
    }

    public void subscribeActual(Subscriber<? super T> subscriber) {
        try {
            subscribe(subscriber, this.source.iterator());
        } catch (Throwable th) {
            Exceptions.throwIfFatal(th);
            EmptySubscription.error(th, subscriber);
        }
    }

    public static <T> void subscribe(Subscriber<? super T> subscriber, Iterator<? extends T> it) {
        try {
            if (it.hasNext()) {
                if (subscriber instanceof ConditionalSubscriber) {
                    subscriber.onSubscribe(new IteratorConditionalSubscription((ConditionalSubscriber) subscriber, it));
                } else {
                    subscriber.onSubscribe(new IteratorSubscription(subscriber, it));
                }
                return;
            }
            EmptySubscription.complete(subscriber);
        } catch (Throwable th) {
            Exceptions.throwIfFatal(th);
            EmptySubscription.error(th, subscriber);
        }
    }
}
