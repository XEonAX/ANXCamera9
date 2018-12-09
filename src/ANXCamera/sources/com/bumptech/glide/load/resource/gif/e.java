package com.bumptech.glide.load.resource.gif;

import android.content.Context;
import android.graphics.Bitmap;
import android.support.annotation.NonNull;
import com.bumptech.glide.c;
import com.bumptech.glide.load.engine.p;
import com.bumptech.glide.load.i;
import com.bumptech.glide.load.resource.bitmap.f;
import java.security.MessageDigest;

/* compiled from: GifDrawableTransformation */
public class e implements i<b> {
    private final i<Bitmap> jS;

    public e(i<Bitmap> iVar) {
        this.jS = (i) com.bumptech.glide.util.i.checkNotNull(iVar);
    }

    @NonNull
    public p<b> transform(@NonNull Context context, @NonNull p<b> pVar, int i, int i2) {
        b bVar = (b) pVar.get();
        p fVar = new f(bVar.cA(), c.b(context).e());
        p transform = this.jS.transform(context, fVar, i, i2);
        if (!fVar.equals(transform)) {
            fVar.recycle();
        }
        bVar.a(this.jS, (Bitmap) transform.get());
        return pVar;
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof e)) {
            return false;
        }
        return this.jS.equals(((e) obj).jS);
    }

    public int hashCode() {
        return this.jS.hashCode();
    }

    public void updateDiskCacheKey(@NonNull MessageDigest messageDigest) {
        this.jS.updateDiskCacheKey(messageDigest);
    }
}
