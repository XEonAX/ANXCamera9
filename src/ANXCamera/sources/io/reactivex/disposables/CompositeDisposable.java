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
    public boolean delete(@io.reactivex.annotations.NonNull io.reactivex.disposables.Disposable r3) {
        /*
        r2 = this;
        r0 = "Disposable item is null";
        io.reactivex.internal.functions.ObjectHelper.requireNonNull(r3, r0);
        r0 = r2.disposed;
        r1 = 0;
        if (r0 == 0) goto L_0x000b;
    L_0x000a:
        return r1;
    L_0x000b:
        monitor-enter(r2);
        r0 = r2.disposed;	 Catch:{ all -> 0x0022 }
        if (r0 == 0) goto L_0x0012;
    L_0x0010:
        monitor-exit(r2);	 Catch:{ all -> 0x0022 }
        return r1;
    L_0x0012:
        r0 = r2.resources;	 Catch:{ all -> 0x0022 }
        if (r0 == 0) goto L_0x0020;
    L_0x0016:
        r3 = r0.remove(r3);	 Catch:{ all -> 0x0022 }
        if (r3 != 0) goto L_0x001d;
    L_0x001c:
        goto L_0x0020;
    L_0x001d:
        monitor-exit(r2);	 Catch:{ all -> 0x0022 }
        r3 = 1;
        return r3;
    L_0x0020:
        monitor-exit(r2);	 Catch:{ all -> 0x0022 }
        return r1;
    L_0x0022:
        r3 = move-exception;
        monitor-exit(r2);	 Catch:{ all -> 0x0022 }
        throw r3;
        */
        throw new UnsupportedOperationException("Method not decompiled: io.reactivex.disposables.CompositeDisposable.delete(io.reactivex.disposables.Disposable):boolean");
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
    public int size() {
        /*
        r2 = this;
        r0 = r2.disposed;
        r1 = 0;
        if (r0 == 0) goto L_0x0006;
    L_0x0005:
        return r1;
    L_0x0006:
        monitor-enter(r2);
        r0 = r2.disposed;	 Catch:{ all -> 0x0018 }
        if (r0 == 0) goto L_0x000d;
    L_0x000b:
        monitor-exit(r2);	 Catch:{ all -> 0x0018 }
        return r1;
    L_0x000d:
        r0 = r2.resources;	 Catch:{ all -> 0x0018 }
        if (r0 == 0) goto L_0x0016;
    L_0x0011:
        r1 = r0.size();	 Catch:{ all -> 0x0018 }
    L_0x0016:
        monitor-exit(r2);	 Catch:{ all -> 0x0018 }
        return r1;
    L_0x0018:
        r0 = move-exception;
        monitor-exit(r2);	 Catch:{ all -> 0x0018 }
        throw r0;
        */
        throw new UnsupportedOperationException("Method not decompiled: io.reactivex.disposables.CompositeDisposable.size():int");
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
