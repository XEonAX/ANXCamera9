package com.bumptech.glide.load.resource.bitmap;

import android.graphics.Bitmap;
import android.support.annotation.NonNull;
import com.bumptech.glide.load.engine.bitmap_recycle.d;
import java.security.MessageDigest;

/* compiled from: CenterInside */
public class k extends g {
    private static final String ID = "com.bumptech.glide.load.resource.bitmap.CenterInside";
    private static final byte[] jW = ID.getBytes(cU);

    protected Bitmap transform(@NonNull d dVar, @NonNull Bitmap bitmap, int i, int i2) {
        return w.c(dVar, bitmap, i, i2);
    }

    public boolean equals(Object obj) {
        return obj instanceof k;
    }

    public int hashCode() {
        return ID.hashCode();
    }

    public void updateDiskCacheKey(@NonNull MessageDigest messageDigest) {
        messageDigest.update(jW);
    }
}
