package com.bumptech.glide.load.resource.bitmap;

import android.content.Context;
import android.graphics.Bitmap;
import android.support.annotation.NonNull;
import com.bumptech.glide.c;
import com.bumptech.glide.load.engine.bitmap_recycle.d;
import com.bumptech.glide.load.engine.p;
import com.bumptech.glide.load.i;
import com.bumptech.glide.util.k;

/* compiled from: BitmapTransformation */
public abstract class g implements i<Bitmap> {
    protected abstract Bitmap transform(@NonNull d dVar, @NonNull Bitmap bitmap, int i, int i2);

    @NonNull
    public final p<Bitmap> transform(@NonNull Context context, @NonNull p<Bitmap> pVar, int i, int i2) {
        if (k.p(i, i2)) {
            d e = c.b(context).e();
            Bitmap bitmap = (Bitmap) pVar.get();
            if (i == Integer.MIN_VALUE) {
                i = bitmap.getWidth();
            }
            if (i2 == Integer.MIN_VALUE) {
                i2 = bitmap.getHeight();
            }
            Bitmap transform = transform(e, bitmap, i, i2);
            if (bitmap.equals(transform)) {
                return pVar;
            }
            return f.a(transform, e);
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Cannot apply transformation on width: ");
        stringBuilder.append(i);
        stringBuilder.append(" or height: ");
        stringBuilder.append(i2);
        stringBuilder.append(" less than or equal to zero and not Target.SIZE_ORIGINAL");
        throw new IllegalArgumentException(stringBuilder.toString());
    }
}
