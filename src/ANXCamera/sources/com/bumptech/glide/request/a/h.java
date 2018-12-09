package com.bumptech.glide.request.a;

import android.content.Context;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import com.bumptech.glide.load.DataSource;

/* compiled from: ViewAnimationFactory */
public class h<R> implements g<R> {
    private f<R> oQ;
    private final a oX;

    /* compiled from: ViewAnimationFactory */
    private static class a implements a {
        private final Animation oY;

        a(Animation animation) {
            this.oY = animation;
        }

        public Animation m(Context context) {
            return this.oY;
        }
    }

    /* compiled from: ViewAnimationFactory */
    private static class b implements a {
        private final int oZ;

        b(int i) {
            this.oZ = i;
        }

        public Animation m(Context context) {
            return AnimationUtils.loadAnimation(context, this.oZ);
        }
    }

    public h(Animation animation) {
        this(new a(animation));
    }

    public h(int i) {
        this(new b(i));
    }

    h(a aVar) {
        this.oX = aVar;
    }

    public f<R> a(DataSource dataSource, boolean z) {
        if (dataSource == DataSource.MEMORY_CACHE || !z) {
            return e.eA();
        }
        if (this.oQ == null) {
            this.oQ = new k(this.oX);
        }
        return this.oQ;
    }
}
