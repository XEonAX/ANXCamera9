package io.reactivex.internal.operators.flowable;

import io.reactivex.Emitter;
import io.reactivex.Flowable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.BiFunction;
import io.reactivex.functions.Consumer;
import io.reactivex.internal.subscriptions.EmptySubscription;
import io.reactivex.internal.util.BackpressureHelper;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.Callable;
import java.util.concurrent.atomic.AtomicLong;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;

public final class FlowableGenerate<T, S> extends Flowable<T> {
    final Consumer<? super S> disposeState;
    final BiFunction<S, Emitter<T>, S> generator;
    final Callable<S> stateSupplier;

    static final class GeneratorSubscription<T, S> extends AtomicLong implements Emitter<T>, Subscription {
        private static final long serialVersionUID = 7565982551505011832L;
        final Subscriber<? super T> actual;
        volatile boolean cancelled;
        final Consumer<? super S> disposeState;
        final BiFunction<S, ? super Emitter<T>, S> generator;
        boolean hasNext;
        S state;
        boolean terminate;

        GeneratorSubscription(Subscriber<? super T> subscriber, BiFunction<S, ? super Emitter<T>, S> biFunction, Consumer<? super S> consumer, S s) {
            this.actual = subscriber;
            this.generator = biFunction;
            this.disposeState = consumer;
            this.state = s;
        }

        /* JADX WARNING: Missing block: B:27:0x0059, code:
            r9.state = r0;
            r4 = addAndGet(-r10);
     */
        /* JADX WARNING: Missing block: B:28:0x0062, code:
            if (r4 != 0) goto L_0x0066;
     */
        /* JADX WARNING: Missing block: B:29:0x0065, code:
            return;
     */
        public void request(long r10) {
            /*
            r9 = this;
            r0 = io.reactivex.internal.subscriptions.SubscriptionHelper.validate(r10);
            if (r0 != 0) goto L_0x0007;
        L_0x0006:
            return;
        L_0x0007:
            r0 = io.reactivex.internal.util.BackpressureHelper.add(r9, r10);
            r2 = 0;
            r0 = (r0 > r2 ? 1 : (r0 == r2 ? 0 : -1));
            if (r0 == 0) goto L_0x0012;
        L_0x0011:
            return;
            r0 = r9.state;
            r1 = r9.generator;
            r4 = r10;
        L_0x0018:
            r10 = r2;
        L_0x0019:
            r6 = (r10 > r4 ? 1 : (r10 == r4 ? 0 : -1));
            if (r6 == 0) goto L_0x0051;
        L_0x001d:
            r6 = r9.cancelled;
            r7 = 0;
            if (r6 == 0) goto L_0x0028;
        L_0x0022:
            r9.state = r7;
            r9.dispose(r0);
            return;
        L_0x0028:
            r6 = 0;
            r9.hasNext = r6;
            r6 = 1;
            r8 = r1.apply(r0, r9);	 Catch:{ Throwable -> 0x0042 }
            r0 = r9.terminate;
            if (r0 == 0) goto L_0x003d;
        L_0x0035:
            r9.cancelled = r6;
            r9.state = r7;
            r9.dispose(r8);
            return;
        L_0x003d:
            r6 = 1;
            r10 = r10 + r6;
            r0 = r8;
            goto L_0x0019;
        L_0x0042:
            r10 = move-exception;
            io.reactivex.exceptions.Exceptions.throwIfFatal(r10);
            r9.cancelled = r6;
            r9.state = r7;
            r9.onError(r10);
            r9.dispose(r0);
            return;
        L_0x0051:
            r4 = r9.get();
            r6 = (r10 > r4 ? 1 : (r10 == r4 ? 0 : -1));
            if (r6 != 0) goto L_0x0019;
        L_0x0059:
            r9.state = r0;
            r10 = -r10;
            r4 = r9.addAndGet(r10);
            r10 = (r4 > r2 ? 1 : (r4 == r2 ? 0 : -1));
            if (r10 != 0) goto L_0x0066;
            return;
        L_0x0066:
            goto L_0x0018;
            */
            throw new UnsupportedOperationException("Method not decompiled: io.reactivex.internal.operators.flowable.FlowableGenerate.GeneratorSubscription.request(long):void");
        }

        private void dispose(S s) {
            try {
                this.disposeState.accept(s);
            } catch (Throwable th) {
                Exceptions.throwIfFatal(th);
                RxJavaPlugins.onError(th);
            }
        }

        public void cancel() {
            if (!this.cancelled) {
                this.cancelled = true;
                if (BackpressureHelper.add(this, 1) == 0) {
                    Object obj = this.state;
                    this.state = null;
                    dispose(obj);
                }
            }
        }

        public void onNext(T t) {
            if (!this.terminate) {
                if (this.hasNext) {
                    onError(new IllegalStateException("onNext already called in this generate turn"));
                } else if (t == null) {
                    onError(new NullPointerException("onNext called with null. Null values are generally not allowed in 2.x operators and sources."));
                } else {
                    this.hasNext = true;
                    this.actual.onNext(t);
                }
            }
        }

        public void onError(Throwable th) {
            if (this.terminate) {
                RxJavaPlugins.onError(th);
                return;
            }
            if (th == null) {
                th = new NullPointerException("onError called with null. Null values are generally not allowed in 2.x operators and sources.");
            }
            this.terminate = true;
            this.actual.onError(th);
        }

        public void onComplete() {
            if (!this.terminate) {
                this.terminate = true;
                this.actual.onComplete();
            }
        }
    }

    public FlowableGenerate(Callable<S> callable, BiFunction<S, Emitter<T>, S> biFunction, Consumer<? super S> consumer) {
        this.stateSupplier = callable;
        this.generator = biFunction;
        this.disposeState = consumer;
    }

    public void subscribeActual(Subscriber<? super T> subscriber) {
        try {
            subscriber.onSubscribe(new GeneratorSubscription(subscriber, this.generator, this.disposeState, this.stateSupplier.call()));
        } catch (Throwable th) {
            Exceptions.throwIfFatal(th);
            EmptySubscription.error(th, subscriber);
        }
    }
}
