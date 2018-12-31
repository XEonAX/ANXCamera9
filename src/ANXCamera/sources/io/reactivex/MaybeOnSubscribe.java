package io.reactivex;

import io.reactivex.annotations.NonNull;

public interface MaybeOnSubscribe<T> {
    void subscribe(@NonNull MaybeEmitter<T> maybeEmitter) throws Exception;
}
