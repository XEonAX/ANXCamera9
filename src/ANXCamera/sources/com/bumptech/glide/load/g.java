package com.bumptech.glide.load;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.bumptech.glide.load.engine.p;
import java.io.IOException;

/* compiled from: ResourceDecoder */
public interface g<T, Z> {
    @Nullable
    p<Z> a(@NonNull T t, int i, int i2, @NonNull f fVar) throws IOException;

    boolean a(@NonNull T t, @NonNull f fVar) throws IOException;
}
