package io.reactivex.functions;

import io.reactivex.annotations.NonNull;

public interface Function5<T1, T2, T3, T4, T5, R> {
    @NonNull
    R apply(@NonNull T1 t1, @NonNull T2 t2, @NonNull T3 t3, @NonNull T4 t4, @NonNull T5 t5) throws Exception;
}
