package io.reactivex.disposables;

import io.reactivex.annotations.Nullable;
import io.reactivex.internal.disposables.DisposableHelper;
import java.util.concurrent.atomic.AtomicReference;

public final class SerialDisposable implements Disposable {
    final AtomicReference<Disposable> resource;

    public SerialDisposable() {
        this.resource = new AtomicReference();
    }

    public SerialDisposable(@Nullable Disposable disposable) {
        this.resource = new AtomicReference(disposable);
    }

    public boolean set(@Nullable Disposable disposable) {
        return DisposableHelper.set(this.resource, disposable);
    }

    public boolean replace(@Nullable Disposable disposable) {
        return DisposableHelper.replace(this.resource, disposable);
    }

    @Nullable
    public Disposable get() {
        Disposable disposable = (Disposable) this.resource.get();
        if (disposable == DisposableHelper.DISPOSED) {
            return Disposables.disposed();
        }
        return disposable;
    }

    public void dispose() {
        DisposableHelper.dispose(this.resource);
    }

    public boolean isDisposed() {
        return DisposableHelper.isDisposed((Disposable) this.resource.get());
    }
}
