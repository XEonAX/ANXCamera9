package com.bumptech.glide.load.resource.bitmap;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.bumptech.glide.c;
import com.bumptech.glide.load.engine.bitmap_recycle.d;
import com.bumptech.glide.load.engine.l;
import com.bumptech.glide.load.engine.p;
import com.bumptech.glide.util.i;

/* compiled from: LazyBitmapDrawableResource */
public final class s implements l, p<BitmapDrawable> {
    private final Resources jG;
    private final p<Bitmap> kY;

    @Deprecated
    public static s a(Context context, Bitmap bitmap) {
        return (s) a(context.getResources(), f.a(bitmap, c.b(context).e()));
    }

    @Deprecated
    public static s a(Resources resources, d dVar, Bitmap bitmap) {
        return (s) a(resources, f.a(bitmap, dVar));
    }

    @Nullable
    public static p<BitmapDrawable> a(@NonNull Resources resources, @Nullable p<Bitmap> pVar) {
        if (pVar == null) {
            return null;
        }
        return new s(resources, pVar);
    }

    private s(@NonNull Resources resources, @NonNull p<Bitmap> pVar) {
        this.jG = (Resources) i.checkNotNull(resources);
        this.kY = (p) i.checkNotNull(pVar);
    }

    @NonNull
    public Class<BitmapDrawable> aZ() {
        return BitmapDrawable.class;
    }

    @NonNull
    /* renamed from: cr */
    public BitmapDrawable get() {
        return new BitmapDrawable(this.jG, (Bitmap) this.kY.get());
    }

    public int getSize() {
        return this.kY.getSize();
    }

    public void recycle() {
        this.kY.recycle();
    }

    public void initialize() {
        if (this.kY instanceof l) {
            ((l) this.kY).initialize();
        }
    }
}
