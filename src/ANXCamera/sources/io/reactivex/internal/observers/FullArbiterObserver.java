package io.reactivex.internal.observers;

import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.disposables.ObserverFullArbiter;

public final class FullArbiterObserver<T> implements Observer<T> {
    final ObserverFullArbiter<T> arbiter;
    Disposable s;

    public FullArbiterObserver(ObserverFullArbiter<T> observerFullArbiter) {
        this.arbiter = observerFullArbiter;
    }

    public void onSubscribe(Disposable disposable) {
        if (DisposableHelper.validate(this.s, disposable)) {
            this.s = disposable;
            this.arbiter.setDisposable(disposable);
        }
    }

    public void onNext(T t) {
        this.arbiter.onNext(t, this.s);
    }

    public void onError(Throwable th) {
        this.arbiter.onError(th, this.s);
    }

    public void onComplete() {
        this.arbiter.onComplete(this.s);
    }
}
