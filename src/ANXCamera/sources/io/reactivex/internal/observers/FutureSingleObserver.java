package io.reactivex.internal.observers;

import io.reactivex.SingleObserver;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.util.BlockingHelper;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.CancellationException;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.concurrent.atomic.AtomicReference;

public final class FutureSingleObserver<T> extends CountDownLatch implements SingleObserver<T>, Disposable, Future<T> {
    Throwable error;
    final AtomicReference<Disposable> s = new AtomicReference();
    T value;

    public FutureSingleObserver() {
        super(1);
    }

    public boolean cancel(boolean z) {
        while (true) {
            DisposableHelper disposableHelper = (Disposable) this.s.get();
            if (disposableHelper != this && disposableHelper != DisposableHelper.DISPOSED) {
                if (this.s.compareAndSet(disposableHelper, DisposableHelper.DISPOSED)) {
                    if (disposableHelper != null) {
                        disposableHelper.dispose();
                    }
                    countDown();
                    return true;
                }
            }
        }
        return false;
    }

    public boolean isCancelled() {
        return DisposableHelper.isDisposed((Disposable) this.s.get());
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

    public void onSubscribe(Disposable disposable) {
        DisposableHelper.setOnce(this.s, disposable);
    }

    public void onSuccess(T t) {
        Disposable disposable = (Disposable) this.s.get();
        if (disposable != DisposableHelper.DISPOSED) {
            this.value = t;
            this.s.compareAndSet(disposable, this);
            countDown();
        }
    }

    public void onError(Throwable th) {
        while (true) {
            Disposable disposable = (Disposable) this.s.get();
            if (disposable == DisposableHelper.DISPOSED) {
                RxJavaPlugins.onError(th);
                return;
            }
            this.error = th;
            if (this.s.compareAndSet(disposable, this)) {
                countDown();
                return;
            }
        }
    }

    public void dispose() {
    }

    public boolean isDisposed() {
        return isDone();
    }
}
