package io.reactivex.subjects;

import io.reactivex.Completable;
import io.reactivex.CompletableObserver;
import io.reactivex.annotations.CheckReturnValue;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;

public final class CompletableSubject extends Completable implements CompletableObserver {
    static final CompletableDisposable[] EMPTY = new CompletableDisposable[0];
    static final CompletableDisposable[] TERMINATED = new CompletableDisposable[0];
    Throwable error;
    final AtomicReference<CompletableDisposable[]> observers = new AtomicReference(EMPTY);
    final AtomicBoolean once = new AtomicBoolean();

    static final class CompletableDisposable extends AtomicReference<CompletableSubject> implements Disposable {
        private static final long serialVersionUID = -7650903191002190468L;
        final CompletableObserver actual;

        CompletableDisposable(CompletableObserver completableObserver, CompletableSubject completableSubject) {
            this.actual = completableObserver;
            lazySet(completableSubject);
        }

        public void dispose() {
            CompletableSubject completableSubject = (CompletableSubject) getAndSet(null);
            if (completableSubject != null) {
                completableSubject.remove(this);
            }
        }

        public boolean isDisposed() {
            return get() == null;
        }
    }

    @CheckReturnValue
    public static CompletableSubject create() {
        return new CompletableSubject();
    }

    CompletableSubject() {
    }

    public void onSubscribe(Disposable disposable) {
        if (this.observers.get() == TERMINATED) {
            disposable.dispose();
        }
    }

    public void onError(Throwable th) {
        ObjectHelper.requireNonNull(th, "onError called with null. Null values are generally not allowed in 2.x operators and sources.");
        int i = 0;
        if (this.once.compareAndSet(false, true)) {
            this.error = th;
            CompletableDisposable[] completableDisposableArr = (CompletableDisposable[]) this.observers.getAndSet(TERMINATED);
            int length = completableDisposableArr.length;
            while (i < length) {
                completableDisposableArr[i].actual.onError(th);
                i++;
            }
            return;
        }
        RxJavaPlugins.onError(th);
    }

    public void onComplete() {
        int i = 0;
        if (this.once.compareAndSet(false, true)) {
            CompletableDisposable[] completableDisposableArr = (CompletableDisposable[]) this.observers.getAndSet(TERMINATED);
            int length = completableDisposableArr.length;
            while (i < length) {
                completableDisposableArr[i].actual.onComplete();
                i++;
            }
        }
    }

    protected void subscribeActual(CompletableObserver completableObserver) {
        CompletableDisposable completableDisposable = new CompletableDisposable(completableObserver, this);
        completableObserver.onSubscribe(completableDisposable);
        if (!add(completableDisposable)) {
            Throwable th = this.error;
            if (th != null) {
                completableObserver.onError(th);
            } else {
                completableObserver.onComplete();
            }
        } else if (completableDisposable.isDisposed()) {
            remove(completableDisposable);
        }
    }

    boolean add(CompletableDisposable completableDisposable) {
        while (true) {
            CompletableDisposable[] completableDisposableArr = (CompletableDisposable[]) this.observers.get();
            if (completableDisposableArr == TERMINATED) {
                return false;
            }
            int length = completableDisposableArr.length;
            Object obj = new CompletableDisposable[(length + 1)];
            System.arraycopy(completableDisposableArr, 0, obj, 0, length);
            obj[length] = completableDisposable;
            if (this.observers.compareAndSet(completableDisposableArr, obj)) {
                return true;
            }
        }
    }

    void remove(CompletableDisposable completableDisposable) {
        while (true) {
            CompletableDisposable[] completableDisposableArr = (CompletableDisposable[]) this.observers.get();
            int length = completableDisposableArr.length;
            if (length != 0) {
                int i = -1;
                for (int i2 = 0; i2 < length; i2++) {
                    if (completableDisposableArr[i2] == completableDisposable) {
                        i = i2;
                        break;
                    }
                }
                if (i >= 0) {
                    Object obj;
                    if (length == 1) {
                        obj = EMPTY;
                    } else {
                        Object obj2 = new CompletableDisposable[(length - 1)];
                        System.arraycopy(completableDisposableArr, 0, obj2, 0, i);
                        System.arraycopy(completableDisposableArr, i + 1, obj2, i, (length - i) - 1);
                        obj = obj2;
                    }
                    if (this.observers.compareAndSet(completableDisposableArr, obj)) {
                        return;
                    }
                } else {
                    return;
                }
            }
            return;
        }
    }

    public Throwable getThrowable() {
        if (this.observers.get() == TERMINATED) {
            return this.error;
        }
        return null;
    }

    public boolean hasThrowable() {
        return this.observers.get() == TERMINATED && this.error != null;
    }

    public boolean hasComplete() {
        return this.observers.get() == TERMINATED && this.error == null;
    }

    public boolean hasObservers() {
        return ((CompletableDisposable[]) this.observers.get()).length != 0;
    }

    int observerCount() {
        return ((CompletableDisposable[]) this.observers.get()).length;
    }
}
