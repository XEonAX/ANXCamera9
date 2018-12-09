package com.bumptech.glide.load.resource.b;

import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.Drawable.ConstantState;
import android.support.annotation.NonNull;
import com.bumptech.glide.load.engine.l;
import com.bumptech.glide.load.engine.p;
import com.bumptech.glide.util.i;

/* compiled from: DrawableResource */
public abstract class b<T extends Drawable> implements l, p<T> {
    protected final T drawable;

    public b(T t) {
        this.drawable = (Drawable) i.checkNotNull(t);
    }

    @NonNull
    /* renamed from: cx */
    public final T get() {
        ConstantState constantState = this.drawable.getConstantState();
        if (constantState == null) {
            return this.drawable;
        }
        return constantState.newDrawable();
    }

    public void initialize() {
        if (this.drawable instanceof BitmapDrawable) {
            ((BitmapDrawable) this.drawable).getBitmap().prepareToDraw();
        } else if (this.drawable instanceof com.bumptech.glide.load.resource.gif.b) {
            ((com.bumptech.glide.load.resource.gif.b) this.drawable).cA().prepareToDraw();
        }
    }
}
