package com.bumptech.glide.request.a;

import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import com.bumptech.glide.load.DataSource;

/* compiled from: BitmapContainerTransitionFactory */
public abstract class a<R> implements g<R> {
    private final g<Drawable> oP;

    /* compiled from: BitmapContainerTransitionFactory */
    private final class a implements f<R> {
        private final f<Drawable> oQ;

        a(f<Drawable> fVar) {
            this.oQ = fVar;
        }

        public boolean a(R r, com.bumptech.glide.request.a.f.a aVar) {
            return this.oQ.a(new BitmapDrawable(aVar.getView().getResources(), a.this.w(r)), aVar);
        }
    }

    protected abstract Bitmap w(R r);

    public a(g<Drawable> gVar) {
        this.oP = gVar;
    }

    public f<R> a(DataSource dataSource, boolean z) {
        return new a(this.oP.a(dataSource, z));
    }
}
