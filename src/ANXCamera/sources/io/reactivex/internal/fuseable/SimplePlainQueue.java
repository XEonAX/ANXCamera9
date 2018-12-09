package io.reactivex.internal.fuseable;

import io.reactivex.annotations.Nullable;

public interface SimplePlainQueue<T> extends SimpleQueue<T> {
    @Nullable
    T poll();
}
