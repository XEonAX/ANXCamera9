package com.bumptech.glide.request.a;

import android.content.Context;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import com.bumptech.glide.load.DataSource;

/* compiled from: ViewAnimationFactory */
public class h<R> implements g<R> {
    private f<R> oP;
    private final a oW;

    /* compiled from: ViewAnimationFactory */
    private static class a implements a {
        private final Animation oX;

        a(Animation animation) {
            this.oX = animation;
        }

        public Animation l(Context context) {
            return this.oX;
        }
    }

    /* compiled from: ViewAnimationFactory */
    private static class b implements a {
        private final int oY;

        b(int i) {
            this.oY = i;
        }

        public Animation l(Context context) {
            return AnimationUtils.loadAnimation(context, this.oY);
        }
    }

    public h(Animation animation) {
        this(new a(animation));
    }

    public h(int i) {
        this(new b(i));
    }

    h(a aVar) {
        this.oW = aVar;
    }

    public f<R> a(DataSource dataSource, boolean z) {
        if (dataSource == DataSource.MEMORY_CACHE || !z) {
            return e.eA();
        }
        if (this.oP == null) {
            this.oP = new k(this.oW);
        }
        return this.oP;
    }
}
