package com.bumptech.glide.load.resource.bitmap;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.support.annotation.NonNull;
import com.bumptech.glide.c;
import com.bumptech.glide.load.i;
import java.security.MessageDigest;

/* compiled from: DrawableTransformation */
public class p implements i<Drawable> {
    private final i<Bitmap> jS;
    private final boolean kQ;

    public p(i<Bitmap> iVar, boolean z) {
        this.jS = iVar;
        this.kQ = z;
    }

    public i<BitmapDrawable> co() {
        return this;
    }

    @NonNull
    public com.bumptech.glide.load.engine.p<Drawable> transform(@NonNull Context context, @NonNull com.bumptech.glide.load.engine.p<Drawable> pVar, int i, int i2) {
        Drawable drawable = (Drawable) pVar.get();
        com.bumptech.glide.load.engine.p a = o.a(c.b(context).e(), drawable, i, i2);
        if (a != null) {
            com.bumptech.glide.load.engine.p transform = this.jS.transform(context, a, i, i2);
            if (!transform.equals(a)) {
                return a(context, transform);
            }
            transform.recycle();
            return pVar;
        } else if (!this.kQ) {
            return pVar;
        } else {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Unable to convert ");
            stringBuilder.append(drawable);
            stringBuilder.append(" to a Bitmap");
            throw new IllegalArgumentException(stringBuilder.toString());
        }
    }

    private com.bumptech.glide.load.engine.p<Drawable> a(Context context, com.bumptech.glide.load.engine.p<Bitmap> pVar) {
        return s.a(context.getResources(), (com.bumptech.glide.load.engine.p) pVar);
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof p)) {
            return false;
        }
        return this.jS.equals(((p) obj).jS);
    }

    public int hashCode() {
        return this.jS.hashCode();
    }

    public void updateDiskCacheKey(@NonNull MessageDigest messageDigest) {
        this.jS.updateDiskCacheKey(messageDigest);
    }
}
