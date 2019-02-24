package com.bumptech.glide.load.resource;

import android.support.annotation.NonNull;
import com.bumptech.glide.load.engine.p;
import com.bumptech.glide.util.i;

/* compiled from: SimpleResource */
public class a<T> implements p<T> {
    protected final T data;

    public a(@NonNull T t) {
        this.data = i.checkNotNull(t);
    }

    @NonNull
    public Class<T> aZ() {
        return this.data.getClass();
    }

    @NonNull
    public final T get() {
        return this.data;
    }

    public final int getSize() {
        return 1;
    }

    public void recycle() {
    }
}
