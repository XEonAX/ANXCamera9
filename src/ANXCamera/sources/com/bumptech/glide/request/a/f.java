package com.bumptech.glide.request.a;

import android.graphics.drawable.Drawable;
import android.support.annotation.Nullable;
import android.view.View;

/* compiled from: Transition */
public interface f<R> {

    /* compiled from: Transition */
    public interface a {
        @Nullable
        Drawable getCurrentDrawable();

        View getView();

        void setDrawable(Drawable drawable);
    }

    boolean a(R r, a aVar);
}
