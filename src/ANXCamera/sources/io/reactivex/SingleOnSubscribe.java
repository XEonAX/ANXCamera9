package io.reactivex;

import io.reactivex.annotations.NonNull;

public interface SingleOnSubscribe<T> {
    void subscribe(@NonNull SingleEmitter<T> singleEmitter) throws Exception;
}
