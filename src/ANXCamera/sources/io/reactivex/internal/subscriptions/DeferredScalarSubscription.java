package io.reactivex.internal.subscriptions;

import io.reactivex.annotations.Nullable;
import org.reactivestreams.Subscriber;

public class DeferredScalarSubscription<T> extends BasicIntQueueSubscription<T> {
    static final int CANCELLED = 4;
    static final int FUSED_CONSUMED = 32;
    static final int FUSED_EMPTY = 8;
    static final int FUSED_READY = 16;
    static final int HAS_REQUEST_HAS_VALUE = 3;
    static final int HAS_REQUEST_NO_VALUE = 2;
    static final int NO_REQUEST_HAS_VALUE = 1;
    static final int NO_REQUEST_NO_VALUE = 0;
    private static final long serialVersionUID = -2151279923272604993L;
    protected final Subscriber<? super T> actual;
    protected T value;

    public DeferredScalarSubscription(Subscriber<? super T> subscriber) {
        this.actual = subscriber;
    }

    public final void request(long j) {
        if (SubscriptionHelper.validate(j)) {
            while (true) {
                int i = get();
                if ((i & -2) == 0) {
                    if (i == 1) {
                        if (compareAndSet(1, 3)) {
                            Object obj = this.value;
                            if (obj != null) {
                                this.value = null;
                                Subscriber subscriber = this.actual;
                                subscriber.onNext(obj);
                                if (get() != 4) {
                                    subscriber.onComplete();
                                }
                            }
                        }
                        return;
                    } else if (compareAndSet(0, 2)) {
                        return;
                    }
                } else {
                    return;
                }
            }
        }
    }

    public final void complete(T t) {
        Subscriber subscriber;
        int i = get();
        while (i != 8) {
            if ((i & -3) == 0) {
                if (i == 2) {
                    lazySet(3);
                    subscriber = this.actual;
                    subscriber.onNext(t);
                    if (get() != 4) {
                        subscriber.onComplete();
                    }
                    return;
                }
                this.value = t;
                if (!compareAndSet(0, 1)) {
                    i = get();
                    if (i == 4) {
                        this.value = null;
                        return;
                    }
                }
                return;
            }
            return;
        }
        this.value = t;
        lazySet(16);
        subscriber = this.actual;
        subscriber.onNext(t);
        if (get() != 4) {
            subscriber.onComplete();
        }
    }

    public final int requestFusion(int i) {
        if ((i & 2) == 0) {
            return 0;
        }
        lazySet(8);
        return 2;
    }

    @Nullable
    public final T poll() {
        if (get() != 16) {
            return null;
        }
        lazySet(32);
        T t = this.value;
        this.value = null;
        return t;
    }

    public final boolean isEmpty() {
        return get() != 16;
    }

    public final void clear() {
        lazySet(32);
        this.value = null;
    }

    public void cancel() {
        set(4);
        this.value = null;
    }

    public final boolean isCancelled() {
        return get() == 4;
    }

    public final boolean tryCancel() {
        return getAndSet(4) != 4;
    }
}
