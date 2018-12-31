package com.bumptech.glide.load.resource.bitmap;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.support.annotation.NonNull;
import com.bumptech.glide.load.engine.p;
import com.bumptech.glide.load.i;
import java.security.MessageDigest;

@Deprecated
/* compiled from: BitmapDrawableTransformation */
public class d implements i<BitmapDrawable> {
    private final i<Drawable> jS;

    public d(i<Bitmap> iVar) {
        this.jS = (i) com.bumptech.glide.util.i.checkNotNull(new p(iVar, false));
    }

    @NonNull
    public p<BitmapDrawable> transform(@NonNull Context context, @NonNull p<BitmapDrawable> pVar, int i, int i2) {
        return j(this.jS.transform(context, k(pVar), i, i2));
    }

    private static p<BitmapDrawable> j(p<Drawable> pVar) {
        if (pVar.get() instanceof BitmapDrawable) {
            return pVar;
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Wrapped transformation unexpectedly returned a non BitmapDrawable resource: ");
        stringBuilder.append(pVar.get());
        throw new IllegalArgumentException(stringBuilder.toString());
    }

    private static p<Drawable> k(p<BitmapDrawable> pVar) {
        return pVar;
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof d)) {
            return false;
        }
        return this.jS.equals(((d) obj).jS);
    }

    public int hashCode() {
        return this.jS.hashCode();
    }

    public void updateDiskCacheKey(@NonNull MessageDigest messageDigest) {
        this.jS.updateDiskCacheKey(messageDigest);
    }
}
