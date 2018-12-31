package io.reactivex.internal.subscriptions;

import io.reactivex.disposables.Disposable;
import java.util.concurrent.atomic.AtomicReferenceArray;
import org.reactivestreams.Subscription;

public final class ArrayCompositeSubscription extends AtomicReferenceArray<Subscription> implements Disposable {
    private static final long serialVersionUID = 2746389416410565408L;

    public ArrayCompositeSubscription(int i) {
        super(i);
    }

    public boolean setResource(int i, Subscription subscription) {
        while (true) {
            Subscription subscription2 = (Subscription) get(i);
            if (subscription2 == SubscriptionHelper.CANCELLED) {
                if (subscription != null) {
                    subscription.cancel();
                }
                return false;
            } else if (compareAndSet(i, subscription2, subscription)) {
                if (subscription2 != null) {
                    subscription2.cancel();
                }
                return true;
            }
        }
    }

    public Subscription replaceResource(int i, Subscription subscription) {
        while (true) {
            Subscription subscription2 = (Subscription) get(i);
            if (subscription2 == SubscriptionHelper.CANCELLED) {
                if (subscription != null) {
                    subscription.cancel();
                }
                return null;
            } else if (compareAndSet(i, subscription2, subscription)) {
                return subscription2;
            }
        }
    }

    public void dispose() {
        int i = 0;
        if (get(0) != SubscriptionHelper.CANCELLED) {
            int length = length();
            while (i < length) {
                if (((Subscription) get(i)) != SubscriptionHelper.CANCELLED) {
                    Subscription subscription = (Subscription) getAndSet(i, SubscriptionHelper.CANCELLED);
                    if (!(subscription == SubscriptionHelper.CANCELLED || subscription == null)) {
                        subscription.cancel();
                    }
                }
                i++;
            }
        }
    }

    public boolean isDisposed() {
        return get(0) == SubscriptionHelper.CANCELLED;
    }
}
