package io.reactivex;

import io.reactivex.annotations.NonNull;

public interface ObservableSource<T> {
    void subscribe(@NonNull Observer<? super T> observer);
}
