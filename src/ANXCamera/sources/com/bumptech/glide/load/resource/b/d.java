package com.bumptech.glide.load.resource.b;

import android.graphics.drawable.Drawable;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.bumptech.glide.load.engine.p;

/* compiled from: NonOwnedDrawableResource */
final class d extends b<Drawable> {
    @Nullable
    static p<Drawable> c(@Nullable Drawable drawable) {
        return drawable != null ? new d(drawable) : null;
    }

    private d(Drawable drawable) {
        super(drawable);
    }

    @NonNull
    public Class<Drawable> aZ() {
        return this.drawable.getClass();
    }

    public int getSize() {
        return Math.max(1, (this.drawable.getIntrinsicWidth() * this.drawable.getIntrinsicHeight()) * 4);
    }

    public void recycle() {
    }
}
