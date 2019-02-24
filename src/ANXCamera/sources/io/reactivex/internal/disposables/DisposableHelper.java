package io.reactivex.internal.disposables;

import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.ProtocolViolationException;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.atomic.AtomicReference;

public enum DisposableHelper implements Disposable {
    DISPOSED;

    public static boolean isDisposed(Disposable disposable) {
        return disposable == DISPOSED;
    }

    public static boolean set(AtomicReference<Disposable> atomicReference, Disposable disposable) {
        while (true) {
            Disposable disposable2 = (Disposable) atomicReference.get();
            if (disposable2 == DISPOSED) {
                if (disposable != null) {
                    disposable.dispose();
                }
                return false;
            } else if (atomicReference.compareAndSet(disposable2, disposable)) {
                if (disposable2 != null) {
                    disposable2.dispose();
                }
                return true;
            }
        }
    }

    public static boolean setOnce(AtomicReference<Disposable> atomicReference, Disposable disposable) {
        ObjectHelper.requireNonNull(disposable, "d is null");
        if (atomicReference.compareAndSet(null, disposable)) {
            return true;
        }
        disposable.dispose();
        if (atomicReference.get() != DISPOSED) {
            reportDisposableSet();
        }
        return false;
    }

    public static boolean replace(AtomicReference<Disposable> atomicReference, Disposable disposable) {
        while (true) {
            Disposable disposable2 = (Disposable) atomicReference.get();
            if (disposable2 == DISPOSED) {
                if (disposable != null) {
                    disposable.dispose();
                }
                return false;
            } else if (atomicReference.compareAndSet(disposable2, disposable)) {
                return true;
            }
        }
    }

    public static boolean dispose(AtomicReference<Disposable> atomicReference) {
        Disposable disposable = (Disposable) atomicReference.get();
        Disposable disposable2 = DISPOSED;
        if (disposable != disposable2) {
            Disposable disposable3 = (Disposable) atomicReference.getAndSet(disposable2);
            if (disposable3 != disposable2) {
                if (disposable3 != null) {
                    disposable3.dispose();
                }
                return true;
            }
        }
        return false;
    }

    public static boolean validate(Disposable disposable, Disposable disposable2) {
        if (disposable2 == null) {
            RxJavaPlugins.onError(new NullPointerException("next is null"));
            return false;
        } else if (disposable == null) {
            return true;
        } else {
            disposable2.dispose();
            reportDisposableSet();
            return false;
        }
    }

    public static void reportDisposableSet() {
        RxJavaPlugins.onError(new ProtocolViolationException("Disposable already set!"));
    }

    public static boolean trySet(AtomicReference<Disposable> atomicReference, Disposable disposable) {
        if (atomicReference.compareAndSet(null, disposable)) {
            return true;
        }
        if (atomicReference.get() == DISPOSED) {
            disposable.dispose();
        }
        return false;
    }

    public void dispose() {
    }

    public boolean isDisposed() {
        return true;
    }
}
