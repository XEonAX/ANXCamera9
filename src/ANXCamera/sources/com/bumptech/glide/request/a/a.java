package com.bumptech.glide.request.a;

import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import com.bumptech.glide.load.DataSource;

/* compiled from: BitmapContainerTransitionFactory */
public abstract class a<R> implements g<R> {
    private final g<Drawable> oO;

    /* compiled from: BitmapContainerTransitionFactory */
    private final class a implements f<R> {
        private final f<Drawable> oP;

        a(f<Drawable> fVar) {
            this.oP = fVar;
        }

        public boolean a(R r, com.bumptech.glide.request.a.f.a aVar) {
            return this.oP.a(new BitmapDrawable(aVar.getView().getResources(), a.this.w(r)), aVar);
        }
    }

    protected abstract Bitmap w(R r);

    public a(g<Drawable> gVar) {
        this.oO = gVar;
    }

    public f<R> a(DataSource dataSource, boolean z) {
        return new a(this.oO.a(dataSource, z));
    }
}
