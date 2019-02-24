package com.bumptech.glide.load.resource.gif;

import android.graphics.Bitmap;
import android.support.annotation.NonNull;
import com.bumptech.glide.b.a;
import com.bumptech.glide.load.engine.bitmap_recycle.d;
import com.bumptech.glide.load.engine.p;
import com.bumptech.glide.load.g;

/* compiled from: GifFrameResourceDecoder */
public final class f implements g<a, Bitmap> {
    private final d i;

    public f(d dVar) {
        this.i = dVar;
    }

    public boolean a(@NonNull a aVar, @NonNull com.bumptech.glide.load.f fVar) {
        return true;
    }

    public p<Bitmap> a(@NonNull a aVar, int i, int i2, @NonNull com.bumptech.glide.load.f fVar) {
        return com.bumptech.glide.load.resource.bitmap.f.a(aVar.U(), this.i);
    }
}
