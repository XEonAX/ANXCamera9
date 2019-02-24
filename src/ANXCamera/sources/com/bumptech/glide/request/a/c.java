package com.bumptech.glide.request.a;

import android.graphics.drawable.Drawable;
import com.bumptech.glide.load.DataSource;

/* compiled from: DrawableCrossFadeFactory */
public class c implements g<Drawable> {
    private final int duration;
    private final boolean oR;
    private d oS;

    /* compiled from: DrawableCrossFadeFactory */
    public static class a {
        private static final int oT = 300;
        private final int durationMillis;
        private boolean oR;

        public a() {
            this(300);
        }

        public a(int i) {
            this.durationMillis = i;
        }

        public a l(boolean z) {
            this.oR = z;
            return this;
        }

        public c ey() {
            return new c(this.durationMillis, this.oR);
        }
    }

    protected c(int i, boolean z) {
        this.duration = i;
        this.oR = z;
    }

    public f<Drawable> a(DataSource dataSource, boolean z) {
        return dataSource == DataSource.MEMORY_CACHE ? e.eA() : ex();
    }

    private f<Drawable> ex() {
        if (this.oS == null) {
            this.oS = new d(this.duration, this.oR);
        }
        return this.oS;
    }
}
