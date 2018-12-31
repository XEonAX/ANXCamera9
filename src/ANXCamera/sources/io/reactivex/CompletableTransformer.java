package io.reactivex;

import io.reactivex.annotations.NonNull;

public interface CompletableTransformer {
    @NonNull
    CompletableSource apply(@NonNull Completable completable);
}
