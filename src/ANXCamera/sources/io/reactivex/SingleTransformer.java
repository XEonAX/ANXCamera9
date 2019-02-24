package io.reactivex;

import io.reactivex.annotations.NonNull;

public interface SingleTransformer<Upstream, Downstream> {
    @NonNull
    SingleSource<Downstream> apply(@NonNull Single<Upstream> single);
}
