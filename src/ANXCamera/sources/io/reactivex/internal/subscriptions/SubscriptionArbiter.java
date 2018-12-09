package io.reactivex.internal.subscriptions;

import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.util.BackpressureHelper;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;
import org.reactivestreams.Subscription;

public class SubscriptionArbiter extends AtomicInteger implements Subscription {
    private static final long serialVersionUID = -2189523197179400958L;
    Subscription actual;
    volatile boolean cancelled;
    final AtomicLong missedProduced = new AtomicLong();
    final AtomicLong missedRequested = new AtomicLong();
    final AtomicReference<Subscription> missedSubscription = new AtomicReference();
    long requested;
    protected boolean unbounded;

    public final void setSubscription(Subscription subscription) {
        if (this.cancelled) {
            subscription.cancel();
            return;
        }
        ObjectHelper.requireNonNull(subscription, "s is null");
        if (get() == 0 && compareAndSet(0, 1)) {
            Subscription subscription2 = this.actual;
            if (subscription2 != null) {
                subscription2.cancel();
            }
            this.actual = subscription;
            long j = this.requested;
            if (decrementAndGet() != 0) {
                drainLoop();
            }
            if (j != 0) {
                subscription.request(j);
            }
            return;
        }
        subscription = (Subscription) this.missedSubscription.getAndSet(subscription);
        if (subscription != null) {
            subscription.cancel();
        }
        drain();
    }

    public final void request(long j) {
        if (SubscriptionHelper.validate(j) && !this.unbounded) {
            if (get() == 0 && compareAndSet(0, 1)) {
                long j2 = this.requested;
                if (j2 != Long.MAX_VALUE) {
                    j2 = BackpressureHelper.addCap(j2, j);
                    this.requested = j2;
                    if (j2 == Long.MAX_VALUE) {
                        this.unbounded = true;
                    }
                }
                Subscription subscription = this.actual;
                if (decrementAndGet() != 0) {
                    drainLoop();
                }
                if (subscription != null) {
                    subscription.request(j);
                }
                return;
            }
            BackpressureHelper.add(this.missedRequested, j);
            drain();
        }
    }

    public final void produced(long j) {
        if (!this.unbounded) {
            if (get() == 0 && compareAndSet(0, 1)) {
                long j2 = this.requested;
                if (j2 != Long.MAX_VALUE) {
                    j2 -= j;
                    j = 0;
                    if (j2 < 0) {
                        SubscriptionHelper.reportMoreProduced(j2);
                    } else {
                        j = j2;
                    }
                    this.requested = j;
                }
                if (decrementAndGet() != 0) {
                    drainLoop();
                    return;
                }
                return;
            }
            BackpressureHelper.add(this.missedProduced, j);
            drain();
        }
    }

    public void cancel() {
        if (!this.cancelled) {
            this.cancelled = true;
            drain();
        }
    }

    final void drain() {
        if (getAndIncrement() == 0) {
            drainLoop();
        }
    }

    final void drainLoop() {
        Subscription subscription = null;
        int i = 1;
        long j = 0;
        while (true) {
            Subscription subscription2 = (Subscription) this.missedSubscription.get();
            if (subscription2 != null) {
                subscription2 = (Subscription) this.missedSubscription.getAndSet(null);
            }
            long j2 = this.missedRequested.get();
            if (j2 != 0) {
                j2 = this.missedRequested.getAndSet(0);
            }
            long j3 = this.missedProduced.get();
            if (j3 != 0) {
                j3 = this.missedProduced.getAndSet(0);
            }
            Subscription subscription3 = this.actual;
            if (this.cancelled) {
                if (subscription3 != null) {
                    subscription3.cancel();
                    this.actual = null;
                }
                if (subscription2 != null) {
                    subscription2.cancel();
                }
            } else {
                long j4 = this.requested;
                if (j4 != Long.MAX_VALUE) {
                    j4 = BackpressureHelper.addCap(j4, j2);
                    if (j4 != Long.MAX_VALUE) {
                        j3 = j4 - j3;
                        if (j3 < 0) {
                            SubscriptionHelper.reportMoreProduced(j3);
                            j3 = 0;
                        }
                        j4 = j3;
                    }
                    this.requested = j4;
                }
                if (subscription2 != null) {
                    if (subscription3 != null) {
                        subscription3.cancel();
                    }
                    this.actual = subscription2;
                    if (j4 != 0) {
                        j = BackpressureHelper.addCap(j, j4);
                        subscription = subscription2;
                    }
                } else if (!(subscription3 == null || j2 == 0)) {
                    j = BackpressureHelper.addCap(j, j2);
                    subscription = subscription3;
                }
            }
            i = addAndGet(-i);
            if (i == 0) {
                break;
            }
        }
        if (j != 0) {
            subscription.request(j);
        }
    }

    public final boolean isUnbounded() {
        return this.unbounded;
    }

    public final boolean isCancelled() {
        return this.cancelled;
    }
}
