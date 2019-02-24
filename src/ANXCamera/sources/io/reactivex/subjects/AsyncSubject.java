package io.reactivex.subjects;

import io.reactivex.Observer;
import io.reactivex.annotations.CheckReturnValue;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.observers.DeferredScalarDisposable;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.Arrays;
import java.util.concurrent.atomic.AtomicReference;

public final class AsyncSubject<T> extends Subject<T> {
    static final AsyncDisposable[] EMPTY = new AsyncDisposable[0];
    static final AsyncDisposable[] TERMINATED = new AsyncDisposable[0];
    Throwable error;
    final AtomicReference<AsyncDisposable<T>[]> subscribers = new AtomicReference(EMPTY);
    T value;

    static final class AsyncDisposable<T> extends DeferredScalarDisposable<T> {
        private static final long serialVersionUID = 5629876084736248016L;
        final AsyncSubject<T> parent;

        AsyncDisposable(Observer<? super T> observer, AsyncSubject<T> asyncSubject) {
            super(observer);
            this.parent = asyncSubject;
        }

        public void dispose() {
            if (super.tryDispose()) {
                this.parent.remove(this);
            }
        }

        void onComplete() {
            if (!isDisposed()) {
                this.actual.onComplete();
            }
        }

        void onError(Throwable th) {
            if (isDisposed()) {
                RxJavaPlugins.onError(th);
            } else {
                this.actual.onError(th);
            }
        }
    }

    @CheckReturnValue
    public static <T> AsyncSubject<T> create() {
        return new AsyncSubject();
    }

    AsyncSubject() {
    }

    public void onSubscribe(Disposable disposable) {
        if (this.subscribers.get() == TERMINATED) {
            disposable.dispose();
        }
    }

    public void onNext(T t) {
        ObjectHelper.requireNonNull(t, "onNext called with null. Null values are generally not allowed in 2.x operators and sources.");
        if (this.subscribers.get() != TERMINATED) {
            this.value = t;
        }
    }

    public void onError(Throwable th) {
        ObjectHelper.requireNonNull(th, "onError called with null. Null values are generally not allowed in 2.x operators and sources.");
        if (this.subscribers.get() == TERMINATED) {
            RxJavaPlugins.onError(th);
            return;
        }
        this.value = null;
        this.error = th;
        for (AsyncDisposable onError : (AsyncDisposable[]) this.subscribers.getAndSet(TERMINATED)) {
            onError.onError(th);
        }
    }

    public void onComplete() {
        if (this.subscribers.get() != TERMINATED) {
            Object obj = this.value;
            AsyncDisposable[] asyncDisposableArr = (AsyncDisposable[]) this.subscribers.getAndSet(TERMINATED);
            int i = 0;
            if (obj == null) {
                int length = asyncDisposableArr.length;
                while (i < length) {
                    asyncDisposableArr[i].onComplete();
                    i++;
                }
            } else {
                int length2 = asyncDisposableArr.length;
                while (i < length2) {
                    asyncDisposableArr[i].complete(obj);
                    i++;
                }
            }
        }
    }

    public boolean hasObservers() {
        return ((AsyncDisposable[]) this.subscribers.get()).length != 0;
    }

    public boolean hasThrowable() {
        return this.subscribers.get() == TERMINATED && this.error != null;
    }

    public boolean hasComplete() {
        return this.subscribers.get() == TERMINATED && this.error == null;
    }

    public Throwable getThrowable() {
        return this.subscribers.get() == TERMINATED ? this.error : null;
    }

    protected void subscribeActual(Observer<? super T> observer) {
        AsyncDisposable asyncDisposable = new AsyncDisposable(observer, this);
        observer.onSubscribe(asyncDisposable);
        if (!add(asyncDisposable)) {
            Throwable th = this.error;
            if (th != null) {
                observer.onError(th);
                return;
            }
            Object obj = this.value;
            if (obj != null) {
                asyncDisposable.complete(obj);
            } else {
                asyncDisposable.onComplete();
            }
        } else if (asyncDisposable.isDisposed()) {
            remove(asyncDisposable);
        }
    }

    boolean add(AsyncDisposable<T> asyncDisposable) {
        while (true) {
            AsyncDisposable[] asyncDisposableArr = (AsyncDisposable[]) this.subscribers.get();
            if (asyncDisposableArr == TERMINATED) {
                return false;
            }
            int length = asyncDisposableArr.length;
            Object obj = new AsyncDisposable[(length + 1)];
            System.arraycopy(asyncDisposableArr, 0, obj, 0, length);
            obj[length] = asyncDisposable;
            if (this.subscribers.compareAndSet(asyncDisposableArr, obj)) {
                return true;
            }
        }
    }

    void remove(AsyncDisposable<T> asyncDisposable) {
        while (true) {
            AsyncDisposable[] asyncDisposableArr = (AsyncDisposable[]) this.subscribers.get();
            int length = asyncDisposableArr.length;
            if (length != 0) {
                int i = -1;
                for (int i2 = 0; i2 < length; i2++) {
                    if (asyncDisposableArr[i2] == asyncDisposable) {
                        i = i2;
                        break;
                    }
                }
                if (i >= 0) {
                    Object obj;
                    if (length == 1) {
                        obj = EMPTY;
                    } else {
                        Object obj2 = new AsyncDisposable[(length - 1)];
                        System.arraycopy(asyncDisposableArr, 0, obj2, 0, i);
                        System.arraycopy(asyncDisposableArr, i + 1, obj2, i, (length - i) - 1);
                        obj = obj2;
                    }
                    if (this.subscribers.compareAndSet(asyncDisposableArr, obj)) {
                        return;
                    }
                } else {
                    return;
                }
            }
            return;
        }
    }

    public boolean hasValue() {
        return this.subscribers.get() == TERMINATED && this.value != null;
    }

    public T getValue() {
        return this.subscribers.get() == TERMINATED ? this.value : null;
    }

    public Object[] getValues() {
        if (getValue() == null) {
            return new Object[0];
        }
        return new Object[]{getValue()};
    }

    public T[] getValues(T[] tArr) {
        Object value = getValue();
        if (value == null) {
            if (tArr.length != 0) {
                tArr[0] = null;
            }
            return tArr;
        }
        if (tArr.length == 0) {
            tArr = Arrays.copyOf(tArr, 1);
        }
        tArr[0] = value;
        if (tArr.length != 1) {
            tArr[1] = null;
        }
        return tArr;
    }
}
