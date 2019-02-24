package io.reactivex;

import io.reactivex.annotations.Experimental;
import io.reactivex.annotations.NonNull;

@Experimental
public interface SingleConverter<T, R> {
    @NonNull
    R apply(@NonNull Single<T> single);
}
