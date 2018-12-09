package io.reactivex;

import io.reactivex.annotations.NonNull;

public interface SingleSource<T> {
    void subscribe(@NonNull SingleObserver<? super T> singleObserver);
}
