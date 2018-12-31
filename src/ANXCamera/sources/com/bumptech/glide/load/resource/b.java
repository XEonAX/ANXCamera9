package com.bumptech.glide.load.resource;

import android.content.Context;
import android.support.annotation.NonNull;
import com.bumptech.glide.load.engine.p;
import com.bumptech.glide.load.i;
import java.security.MessageDigest;

/* compiled from: UnitTransformation */
public final class b<T> implements i<T> {
    private static final i<?> jQ = new b();

    @NonNull
    public static <T> b<T> cf() {
        return (b) jQ;
    }

    private b() {
    }

    @NonNull
    public p<T> transform(@NonNull Context context, @NonNull p<T> pVar, int i, int i2) {
        return pVar;
    }

    public void updateDiskCacheKey(@NonNull MessageDigest messageDigest) {
    }
}
