package io.reactivex;

import io.reactivex.annotations.NonNull;

public interface CompletableOnSubscribe {
    void subscribe(@NonNull CompletableEmitter completableEmitter) throws Exception;
}
