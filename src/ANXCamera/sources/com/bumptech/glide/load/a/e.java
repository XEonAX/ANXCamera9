package com.bumptech.glide.load.a;

import android.support.annotation.NonNull;
import java.io.IOException;

/* compiled from: DataRewinder */
public interface e<T> {

    /* compiled from: DataRewinder */
    public interface a<T> {
        @NonNull
        Class<T> ad();

        @NonNull
        e<T> j(@NonNull T t);
    }

    @NonNull
    T ag() throws IOException;

    void cleanup();
}
