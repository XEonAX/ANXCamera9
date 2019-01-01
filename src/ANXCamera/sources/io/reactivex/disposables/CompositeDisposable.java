package io.reactivex.disposables;

import io.reactivex.annotations.NonNull;
import io.reactivex.exceptions.CompositeException;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.internal.disposables.DisposableContainer;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.util.ExceptionHelper;
import io.reactivex.internal.util.OpenHashSet;
import java.util.ArrayList;

public final class CompositeDisposable implements Disposable, DisposableContainer {
    volatile boolean disposed;
    OpenHashSet<Disposable> resources;

    public CompositeDisposable(@NonNull Disposable... disposableArr) {
        ObjectHelper.requireNonNull(disposableArr, "resources is null");
        this.resources = new OpenHashSet(disposableArr.length + 1);
        for (Object obj : disposableArr) {
            ObjectHelper.requireNonNull(obj, "Disposable item is null");
            this.resources.add(obj);
        }
    }

    public CompositeDisposable(@NonNull Iterable<? extends Disposable> iterable) {
        ObjectHelper.requireNonNull(iterable, "resources is null");
        this.resources = new OpenHashSet();
        for (Disposable disposable : iterable) {
            ObjectHelper.requireNonNull(disposable, "Disposable item is null");
            this.resources.add(disposable);
        }
    }

    public void dispose() {
        if (!this.disposed) {
            synchronized (this) {
                if (this.disposed) {
                    return;
                }
                this.disposed = true;
                OpenHashSet openHashSet = this.resources;
                this.resources = null;
                dispose(openHashSet);
            }
        }
    }

    public boolean isDisposed() {
        return this.disposed;
    }

    public boolean add(@NonNull Disposable disposable) {
        ObjectHelper.requireNonNull(disposable, "d is null");
        if (!this.disposed) {
            synchronized (this) {
                if (!this.disposed) {
                    OpenHashSet openHashSet = this.resources;
                    if (openHashSet == null) {
                        openHashSet = new OpenHashSet();
                        this.resources = openHashSet;
                    }
                    openHashSet.add(disposable);
                    return true;
                }
            }
        }
        disposable.dispose();
        return false;
    }

    public boolean addAll(@NonNull Disposable... disposableArr) {
        ObjectHelper.requireNonNull(disposableArr, "ds is null");
        int i = 0;
        if (!this.disposed) {
            synchronized (this) {
                if (!this.disposed) {
                    OpenHashSet openHashSet = this.resources;
                    if (openHashSet == null) {
                        openHashSet = new OpenHashSet(disposableArr.length + 1);
                        this.resources = openHashSet;
                    }
                    int length = disposableArr.length;
                    while (i < length) {
                        Object obj = disposableArr[i];
                        ObjectHelper.requireNonNull(obj, "d is null");
                        openHashSet.add(obj);
                        i++;
                    }
                    return true;
                }
            }
        }
        for (Disposable dispose : disposableArr) {
            dispose.dispose();
        }
        return false;
    }

    public boolean remove(@NonNull Disposable disposable) {
        if (!delete(disposable)) {
            return false;
        }
        disposable.dispose();
        return true;
    }

    /* JADX WARNING: Missing block: B:17:0x0021, code:
            return false;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public boolean delete(@NonNull Disposable disposable) {
        ObjectHelper.requireNonNull(disposable, "Disposable item is null");
        if (this.disposed) {
            return false;
        }
        synchronized (this) {
            if (this.disposed) {
                return false;
            }
            OpenHashSet openHashSet = this.resources;
            if (openHashSet == null || !openHashSet.remove(disposable)) {
            } else {
                return true;
            }
        }
    }

    public void clear() {
        if (!this.disposed) {
            synchronized (this) {
                if (this.disposed) {
                    return;
                }
                OpenHashSet openHashSet = this.resources;
                this.resources = null;
                dispose(openHashSet);
            }
        }
    }

    /* JADX WARNING: Missing block: B:13:0x0017, code:
            return r1;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public int size() {
        int i = 0;
        if (this.disposed) {
            return 0;
        }
        synchronized (this) {
            if (this.disposed) {
                return 0;
            }
            OpenHashSet openHashSet = this.resources;
            if (openHashSet != null) {
                i = openHashSet.size();
            }
        }
    }

    void dispose(OpenHashSet<Disposable> openHashSet) {
        if (openHashSet != null) {
            Iterable iterable = null;
            for (Object obj : openHashSet.keys()) {
                if (obj instanceof Disposable) {
                    try {
                        ((Disposable) obj).dispose();
                    } catch (Throwable th) {
                        Exceptions.throwIfFatal(th);
                        if (iterable == null) {
                            iterable = new ArrayList();
                        }
                        iterable.add(th);
                    }
                }
            }
            if (iterable == null) {
                return;
            }
            if (iterable.size() == 1) {
                throw ExceptionHelper.wrapOrThrow((Throwable) iterable.get(0));
            }
            throw new CompositeException(iterable);
        }
    }
}
