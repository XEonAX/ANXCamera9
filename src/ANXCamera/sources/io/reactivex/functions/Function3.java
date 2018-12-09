package io.reactivex.functions;

import io.reactivex.annotations.NonNull;

public interface Function3<T1, T2, T3, R> {
    @NonNull
    R apply(@NonNull T1 t1, @NonNull T2 t2, @NonNull T3 t3) throws Exception;
}
