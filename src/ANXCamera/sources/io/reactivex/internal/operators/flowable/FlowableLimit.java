package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.annotations.Experimental;
import io.reactivex.internal.subscriptions.EmptySubscription;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.atomic.AtomicLong;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;

@Experimental
public final class FlowableLimit<T> extends AbstractFlowableWithUpstream<T, T> {
    final long n;

    static final class LimitSubscriber<T> extends AtomicLong implements FlowableSubscriber<T>, Subscription {
        private static final long serialVersionUID = 2288246011222124525L;
        final Subscriber<? super T> actual;
        long remaining;
        Subscription upstream;

        LimitSubscriber(Subscriber<? super T> subscriber, long j) {
            this.actual = subscriber;
            this.remaining = j;
            lazySet(j);
        }

        public void onSubscribe(Subscription subscription) {
            if (!SubscriptionHelper.validate(this.upstream, subscription)) {
                return;
            }
            if (this.remaining == 0) {
                subscription.cancel();
                EmptySubscription.complete(this.actual);
                return;
            }
            this.upstream = subscription;
            this.actual.onSubscribe(this);
        }

        public void onNext(T t) {
            long j = this.remaining;
            if (j > 0) {
                j--;
                this.remaining = j;
                this.actual.onNext(t);
                if (j == 0) {
                    this.upstream.cancel();
                    this.actual.onComplete();
                }
            }
        }

        public void onError(Throwable th) {
            if (this.remaining > 0) {
                this.remaining = 0;
                this.actual.onError(th);
                return;
            }
            RxJavaPlugins.onError(th);
        }

        public void onComplete() {
            if (this.remaining > 0) {
                this.remaining = 0;
                this.actual.onComplete();
            }
        }

        public void request(long j) {
            if (SubscriptionHelper.validate(j)) {
                while (true) {
                    long j2 = get();
                    if (j2 != 0) {
                        long j3 = j2 <= j ? j2 : j;
                        if (compareAndSet(j2, j2 - j3)) {
                            this.upstream.request(j3);
                            return;
                        }
                    } else {
                        return;
                    }
                }
            }
        }

        public void cancel() {
            this.upstream.cancel();
        }
    }

    public FlowableLimit(Flowable<T> flowable, long j) {
        super(flowable);
        this.n = j;
    }

    protected void subscribeActual(Subscriber<? super T> subscriber) {
        this.source.subscribe(new LimitSubscriber(subscriber, this.n));
    }
}
