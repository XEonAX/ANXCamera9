package io.reactivex.functions;

import io.reactivex.annotations.NonNull;

public interface Predicate<T> {
    boolean test(@NonNull T t) throws Exception;
}
