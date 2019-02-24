package com.bumptech.glide.request.target;

import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.widget.ImageView;
import com.bumptech.glide.request.a.f;
import com.bumptech.glide.request.a.f.a;

/* compiled from: ImageViewTarget */
public abstract class h<Z> extends ViewTarget<ImageView, Z> implements a {
    @Nullable
    private Animatable ox;

    protected abstract void s(@Nullable Z z);

    public h(ImageView imageView) {
        super(imageView);
    }

    @Deprecated
    public h(ImageView imageView, boolean z) {
        super(imageView, z);
    }

    @Nullable
    public Drawable getCurrentDrawable() {
        return ((ImageView) this.view).getDrawable();
    }

    public void setDrawable(Drawable drawable) {
        ((ImageView) this.view).setImageDrawable(drawable);
    }

    public void e(@Nullable Drawable drawable) {
        super.e(drawable);
        u(null);
        setDrawable(drawable);
    }

    public void f(@Nullable Drawable drawable) {
        super.f(drawable);
        u(null);
        setDrawable(drawable);
    }

    public void d(@Nullable Drawable drawable) {
        super.d(drawable);
        if (this.ox != null) {
            this.ox.stop();
        }
        u(null);
        setDrawable(drawable);
    }

    public void a(@NonNull Z z, @Nullable f<? super Z> fVar) {
        if (fVar == null || !fVar.a(z, this)) {
            u(z);
        } else {
            v(z);
        }
    }

    public void onStart() {
        if (this.ox != null) {
            this.ox.start();
        }
    }

    public void onStop() {
        if (this.ox != null) {
            this.ox.stop();
        }
    }

    private void u(@Nullable Z z) {
        s(z);
        v(z);
    }

    private void v(@Nullable Z z) {
        if (z instanceof Animatable) {
            this.ox = (Animatable) z;
            this.ox.start();
            return;
        }
        this.ox = null;
    }
}
