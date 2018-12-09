package io.reactivex;

import io.reactivex.annotations.NonNull;

public interface MaybeSource<T> {
    void subscribe(@NonNull MaybeObserver<? super T> maybeObserver);
}
