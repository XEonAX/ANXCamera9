package io.reactivex;

import io.reactivex.annotations.NonNull;

public interface FlowableOnSubscribe<T> {
    void subscribe(@NonNull FlowableEmitter<T> flowableEmitter) throws Exception;
}
