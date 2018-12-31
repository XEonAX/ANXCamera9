package com.bumptech.glide.load.resource.bitmap;

import android.graphics.Bitmap;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.bumptech.glide.load.engine.bitmap_recycle.d;
import com.bumptech.glide.load.engine.l;
import com.bumptech.glide.load.engine.p;
import com.bumptech.glide.util.i;
import com.bumptech.glide.util.k;

/* compiled from: BitmapResource */
public class f implements l, p<Bitmap> {
    private final Bitmap bitmap;
    private final d i;

    @Nullable
    public static f a(@Nullable Bitmap bitmap, @NonNull d dVar) {
        if (bitmap == null) {
            return null;
        }
        return new f(bitmap, dVar);
    }

    public f(@NonNull Bitmap bitmap, @NonNull d dVar) {
        this.bitmap = (Bitmap) i.a((Object) bitmap, "Bitmap must not be null");
        this.i = (d) i.a((Object) dVar, "BitmapPool must not be null");
    }

    @NonNull
    public Class<Bitmap> aZ() {
        return Bitmap.class;
    }

    @NonNull
    /* renamed from: cg */
    public Bitmap get() {
        return this.bitmap;
    }

    public int getSize() {
        return k.p(this.bitmap);
    }

    public void recycle() {
        this.i.d(this.bitmap);
    }

    public void initialize() {
        this.bitmap.prepareToDraw();
    }
}
