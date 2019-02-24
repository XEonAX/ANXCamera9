package io.reactivex;

import io.reactivex.annotations.NonNull;

public interface ObservableOnSubscribe<T> {
    void subscribe(@NonNull ObservableEmitter<T> observableEmitter) throws Exception;
}
