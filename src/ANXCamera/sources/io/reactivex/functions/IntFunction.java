package io.reactivex.functions;

import io.reactivex.annotations.NonNull;

public interface IntFunction<T> {
    @NonNull
    T apply(int i) throws Exception;
}
