package io.reactivex.internal.subscribers;

import io.reactivex.FlowableSubscriber;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.BlockingHelper;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.NoSuchElementException;
import java.util.concurrent.CancellationException;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.concurrent.atomic.AtomicReference;
import org.reactivestreams.Subscription;

public final class FutureSubscriber<T> extends CountDownLatch implements FlowableSubscriber<T>, Future<T>, Subscription {
    Throwable error;
    final AtomicReference<Subscription> s = new AtomicReference();
    T value;

    public FutureSubscriber() {
        super(1);
    }

    public boolean cancel(boolean z) {
        while (true) {
            SubscriptionHelper subscriptionHelper = (Subscription) this.s.get();
            if (subscriptionHelper != this && subscriptionHelper != SubscriptionHelper.CANCELLED) {
                if (this.s.compareAndSet(subscriptionHelper, SubscriptionHelper.CANCELLED)) {
                    if (subscriptionHelper != null) {
                        subscriptionHelper.cancel();
                    }
                    countDown();
                    return true;
                }
            }
        }
        return false;
    }

    public boolean isCancelled() {
        return SubscriptionHelper.isCancelled((Subscription) this.s.get());
    }

    public boolean isDone() {
        return getCount() == 0;
    }

    public T get() throws InterruptedException, ExecutionException {
        if (getCount() != 0) {
            BlockingHelper.verifyNonBlocking();
            await();
        }
        if (isCancelled()) {
            throw new CancellationException();
        }
        Throwable th = this.error;
        if (th == null) {
            return this.value;
        }
        throw new ExecutionException(th);
    }

    public T get(long j, TimeUnit timeUnit) throws InterruptedException, ExecutionException, TimeoutException {
        if (getCount() != 0) {
            BlockingHelper.verifyNonBlocking();
            if (!await(j, timeUnit)) {
                throw new TimeoutException();
            }
        }
        if (isCancelled()) {
            throw new CancellationException();
        }
        Throwable th = this.error;
        if (th == null) {
            return this.value;
        }
        throw new ExecutionException(th);
    }

    public void onSubscribe(Subscription subscription) {
        if (SubscriptionHelper.setOnce(this.s, subscription)) {
            subscription.request(Long.MAX_VALUE);
        }
    }

    public void onNext(T t) {
        if (this.value != null) {
            ((Subscription) this.s.get()).cancel();
            onError(new IndexOutOfBoundsException("More than one element received"));
            return;
        }
        this.value = t;
    }

    public void onError(Throwable th) {
        while (true) {
            SubscriptionHelper subscriptionHelper = (Subscription) this.s.get();
            if (subscriptionHelper == this || subscriptionHelper == SubscriptionHelper.CANCELLED) {
                RxJavaPlugins.onError(th);
            } else {
                this.error = th;
                if (this.s.compareAndSet(subscriptionHelper, this)) {
                    countDown();
                    return;
                }
            }
        }
        RxJavaPlugins.onError(th);
    }

    public void onComplete() {
        if (this.value == null) {
            onError(new NoSuchElementException("The source is empty"));
            return;
        }
        while (true) {
            SubscriptionHelper subscriptionHelper = (Subscription) this.s.get();
            if (subscriptionHelper != this && subscriptionHelper != SubscriptionHelper.CANCELLED) {
                if (this.s.compareAndSet(subscriptionHelper, this)) {
                    countDown();
                    return;
                }
            }
        }
    }

    public void cancel() {
    }

    public void request(long j) {
    }
}
