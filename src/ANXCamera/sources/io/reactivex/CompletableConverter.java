package io.reactivex;

import io.reactivex.annotations.Experimental;
import io.reactivex.annotations.NonNull;

@Experimental
public interface CompletableConverter<R> {
    @NonNull
    R apply(@NonNull Completable completable);
}
