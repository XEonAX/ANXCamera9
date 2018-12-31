package com.bumptech.glide.load.resource.bitmap;

import android.graphics.Bitmap;
import android.support.annotation.NonNull;
import com.bumptech.glide.load.engine.p;
import com.bumptech.glide.load.f;
import com.bumptech.glide.load.g;
import com.bumptech.glide.util.k;

/* compiled from: UnitBitmapDecoder */
public final class x implements g<Bitmap, Bitmap> {

    /* compiled from: UnitBitmapDecoder */
    private static final class a implements p<Bitmap> {
        private final Bitmap bitmap;

        a(@NonNull Bitmap bitmap) {
            this.bitmap = bitmap;
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
        }
    }

    /* renamed from: b */
    public boolean a(@NonNull Bitmap bitmap, @NonNull f fVar) {
        return true;
    }

    public p<Bitmap> a(@NonNull Bitmap bitmap, int i, int i2, @NonNull f fVar) {
        return new a(bitmap);
    }
}
