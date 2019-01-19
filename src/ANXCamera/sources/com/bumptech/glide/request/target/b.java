package com.bumptech.glide.request.target;

import android.graphics.drawable.Drawable;
import android.support.annotation.Nullable;
import com.bumptech.glide.request.c;

/* compiled from: BaseTarget */
public abstract class b<Z> implements n<Z> {
    private c nc;

    public void j(@Nullable c cVar) {
        this.nc = cVar;
    }

    @Nullable
    public c dj() {
        return this.nc;
    }

    public void d(@Nullable Drawable drawable) {
    }

    public void e(@Nullable Drawable drawable) {
    }

    public void f(@Nullable Drawable drawable) {
    }

    public void onStart() {
    }

    public void onStop() {
    }

    public void onDestroy() {
    }
}
