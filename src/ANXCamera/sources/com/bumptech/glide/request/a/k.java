package com.bumptech.glide.request.a;

import android.content.Context;
import android.view.View;
import android.view.animation.Animation;

/* compiled from: ViewTransition */
public class k<R> implements f<R> {
    private final a oX;

    /* compiled from: ViewTransition */
    interface a {
        Animation m(Context context);
    }

    k(a aVar) {
        this.oX = aVar;
    }

    public boolean a(R r, com.bumptech.glide.request.a.f.a aVar) {
        View view = aVar.getView();
        if (view != null) {
            view.clearAnimation();
            view.startAnimation(this.oX.m(view.getContext()));
        }
        return false;
    }
}
