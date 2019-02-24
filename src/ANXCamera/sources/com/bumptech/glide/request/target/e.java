package com.bumptech.glide.request.target;

import android.graphics.drawable.Drawable;
import android.support.annotation.Nullable;
import android.widget.ImageView;

/* compiled from: DrawableImageViewTarget */
public class e extends h<Drawable> {
    public e(ImageView imageView) {
        super(imageView);
    }

    @Deprecated
    public e(ImageView imageView, boolean z) {
        super(imageView, z);
    }

    /* renamed from: l */
    protected void s(@Nullable Drawable drawable) {
        ((ImageView) this.view).setImageDrawable(drawable);
    }
}
