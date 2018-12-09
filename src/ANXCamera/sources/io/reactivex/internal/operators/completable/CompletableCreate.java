package io.reactivex.internal.operators.completable;

import io.reactivex.Completable;
import io.reactivex.CompletableEmitter;
import io.reactivex.CompletableObserver;
import io.reactivex.CompletableOnSubscribe;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Cancellable;
import io.reactivex.internal.disposables.CancellableDisposable;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.atomic.AtomicReference;

public final class CompletableCreate extends Completable {
    final CompletableOnSubscribe source;

    static final class Emitter extends AtomicReference<Disposable> implements CompletableEmitter, Disposable {
        private static final long serialVersionUID = -2467358622224974244L;
        final CompletableObserver actual;

        Emitter(CompletableObserver completableObserver) {
            this.actual = completableObserver;
        }

        /* JADX WARNING: Failed to extract finally block: empty outs */
        /* JADX WARNING: Missing block: B:15:?, code:
            return;
     */
        public void onComplete() {
            /*
            r2 = this;
            r0 = r2.get();
            r1 = io.reactivex.internal.disposables.DisposableHelper.DISPOSED;
            if (r0 == r1) goto L_0x0026;
        L_0x0008:
            r0 = io.reactivex.internal.disposables.DisposableHelper.DISPOSED;
            r0 = r2.getAndSet(r0);
            r0 = (io.reactivex.disposables.Disposable) r0;
            r1 = io.reactivex.internal.disposables.DisposableHelper.DISPOSED;
            if (r0 == r1) goto L_0x0026;
        L_0x0014:
            r1 = r2.actual;	 Catch:{ all -> 0x001f }
            r1.onComplete();	 Catch:{ all -> 0x001f }
            if (r0 == 0) goto L_0x0026;
        L_0x001b:
            r0.dispose();
            goto L_0x0026;
        L_0x001f:
            r1 = move-exception;
            if (r0 == 0) goto L_0x0025;
        L_0x0022:
            r0.dispose();
        L_0x0025:
            throw r1;
        L_0x0026:
            return;
            */
            throw new UnsupportedOperationException("Method not decompiled: io.reactivex.internal.operators.completable.CompletableCreate.Emitter.onComplete():void");
        }

        public void onError(Throwable th) {
            if (!tryOnError(th)) {
                RxJavaPlugins.onError(th);
            }
        }

        public boolean tryOnError(Throwable th) {
            if (th == null) {
                th = new NullPointerException("onError called with null. Null values are generally not allowed in 2.x operators and sources.");
            }
            if (get() != DisposableHelper.DISPOSED) {
                Disposable disposable = (Disposable) getAndSet(DisposableHelper.DISPOSED);
                if (disposable != DisposableHelper.DISPOSED) {
                    try {
                        this.actual.onError(th);
                        return true;
                    } finally {
                        if (disposable != null) {
                            disposable.dispose();
                        }
                    }
                }
            }
            return false;
        }

        public void setDisposable(Disposable disposable) {
            DisposableHelper.set(this, disposable);
        }

        public void setCancellable(Cancellable cancellable) {
            setDisposable(new CancellableDisposable(cancellable));
        }

        public void dispose() {
            DisposableHelper.dispose(this);
        }

        public boolean isDisposed() {
            return DisposableHelper.isDisposed((Disposable) get());
        }
    }

    public CompletableCreate(CompletableOnSubscribe completableOnSubscribe) {
        this.source = completableOnSubscribe;
    }

    protected void subscribeActual(CompletableObserver completableObserver) {
        Emitter emitter = new Emitter(completableObserver);
        completableObserver.onSubscribe(emitter);
        try {
            this.source.subscribe(emitter);
        } catch (Throwable th) {
            Exceptions.throwIfFatal(th);
            emitter.onError(th);
        }
    }
}
