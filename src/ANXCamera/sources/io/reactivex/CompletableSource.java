package io.reactivex;

import io.reactivex.annotations.NonNull;

public interface CompletableSource {
    void subscribe(@NonNull CompletableObserver completableObserver);
}
