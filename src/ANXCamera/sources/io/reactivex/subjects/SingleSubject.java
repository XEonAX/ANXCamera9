package io.reactivex.subjects;

import io.reactivex.Single;
import io.reactivex.SingleObserver;
import io.reactivex.annotations.CheckReturnValue;
import io.reactivex.annotations.NonNull;
import io.reactivex.annotations.Nullable;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;

public final class SingleSubject<T> extends Single<T> implements SingleObserver<T> {
    static final SingleDisposable[] EMPTY = new SingleDisposable[0];
    static final SingleDisposable[] TERMINATED = new SingleDisposable[0];
    Throwable error;
    final AtomicReference<SingleDisposable<T>[]> observers = new AtomicReference(EMPTY);
    final AtomicBoolean once = new AtomicBoolean();
    T value;

    static final class SingleDisposable<T> extends AtomicReference<SingleSubject<T>> implements Disposable {
        private static final long serialVersionUID = -7650903191002190468L;
        final SingleObserver<? super T> actual;

        SingleDisposable(SingleObserver<? super T> singleObserver, SingleSubject<T> singleSubject) {
            this.actual = singleObserver;
            lazySet(singleSubject);
        }

        public void dispose() {
            SingleSubject singleSubject = (SingleSubject) getAndSet(null);
            if (singleSubject != null) {
                singleSubject.remove(this);
            }
        }

        public boolean isDisposed() {
            return get() == null;
        }
    }

    @CheckReturnValue
    @NonNull
    public static <T> SingleSubject<T> create() {
        return new SingleSubject();
    }

    SingleSubject() {
    }

    public void onSubscribe(@NonNull Disposable disposable) {
        if (this.observers.get() == TERMINATED) {
            disposable.dispose();
        }
    }

    public void onSuccess(@NonNull T t) {
        ObjectHelper.requireNonNull(t, "onSuccess called with null. Null values are generally not allowed in 2.x operators and sources.");
        int i = 0;
        if (this.once.compareAndSet(false, true)) {
            this.value = t;
            SingleDisposable[] singleDisposableArr = (SingleDisposable[]) this.observers.getAndSet(TERMINATED);
            int length = singleDisposableArr.length;
            while (i < length) {
                singleDisposableArr[i].actual.onSuccess(t);
                i++;
            }
        }
    }

    public void onError(@NonNull Throwable th) {
        ObjectHelper.requireNonNull(th, "onError called with null. Null values are generally not allowed in 2.x operators and sources.");
        int i = 0;
        if (this.once.compareAndSet(false, true)) {
            this.error = th;
            SingleDisposable[] singleDisposableArr = (SingleDisposable[]) this.observers.getAndSet(TERMINATED);
            int length = singleDisposableArr.length;
            while (i < length) {
                singleDisposableArr[i].actual.onError(th);
                i++;
            }
            return;
        }
        RxJavaPlugins.onError(th);
    }

    protected void subscribeActual(@NonNull SingleObserver<? super T> singleObserver) {
        SingleDisposable singleDisposable = new SingleDisposable(singleObserver, this);
        singleObserver.onSubscribe(singleDisposable);
        if (!add(singleDisposable)) {
            Throwable th = this.error;
            if (th != null) {
                singleObserver.onError(th);
            } else {
                singleObserver.onSuccess(this.value);
            }
        } else if (singleDisposable.isDisposed()) {
            remove(singleDisposable);
        }
    }

    boolean add(@NonNull SingleDisposable<T> singleDisposable) {
        while (true) {
            SingleDisposable[] singleDisposableArr = (SingleDisposable[]) this.observers.get();
            if (singleDisposableArr == TERMINATED) {
                return false;
            }
            int length = singleDisposableArr.length;
            Object obj = new SingleDisposable[(length + 1)];
            System.arraycopy(singleDisposableArr, 0, obj, 0, length);
            obj[length] = singleDisposable;
            if (this.observers.compareAndSet(singleDisposableArr, obj)) {
                return true;
            }
        }
    }

    void remove(@NonNull SingleDisposable<T> singleDisposable) {
        while (true) {
            SingleDisposable[] singleDisposableArr = (SingleDisposable[]) this.observers.get();
            int length = singleDisposableArr.length;
            if (length != 0) {
                int i = -1;
                for (int i2 = 0; i2 < length; i2++) {
                    if (singleDisposableArr[i2] == singleDisposable) {
                        i = i2;
                        break;
                    }
                }
                if (i >= 0) {
                    Object obj;
                    if (length == 1) {
                        obj = EMPTY;
                    } else {
                        Object obj2 = new SingleDisposable[(length - 1)];
                        System.arraycopy(singleDisposableArr, 0, obj2, 0, i);
                        System.arraycopy(singleDisposableArr, i + 1, obj2, i, (length - i) - 1);
                        obj = obj2;
                    }
                    if (this.observers.compareAndSet(singleDisposableArr, obj)) {
                        return;
                    }
                } else {
                    return;
                }
            }
            return;
        }
    }

    @Nullable
    public T getValue() {
        if (this.observers.get() == TERMINATED) {
            return this.value;
        }
        return null;
    }

    public boolean hasValue() {
        return this.observers.get() == TERMINATED && this.value != null;
    }

    @Nullable
    public Throwable getThrowable() {
        if (this.observers.get() == TERMINATED) {
            return this.error;
        }
        return null;
    }

    public boolean hasThrowable() {
        return this.observers.get() == TERMINATED && this.error != null;
    }

    public boolean hasObservers() {
        return ((SingleDisposable[]) this.observers.get()).length != 0;
    }

    int observerCount() {
        return ((SingleDisposable[]) this.observers.get()).length;
    }
}
