package com.bumptech.glide.request.a;

import android.graphics.drawable.Drawable;
import com.bumptech.glide.load.DataSource;

/* compiled from: DrawableCrossFadeFactory */
public class c implements g<Drawable> {
    private final int duration;
    private final boolean oS;
    private d oT;

    /* compiled from: DrawableCrossFadeFactory */
    public static class a {
        private static final int oU = 300;
        private final int durationMillis;
        private boolean oS;

        public a() {
            this(300);
        }

        public a(int i) {
            this.durationMillis = i;
        }

        public a l(boolean z) {
            this.oS = z;
            return this;
        }

        public c ey() {
            return new c(this.durationMillis, this.oS);
        }
    }

    protected c(int i, boolean z) {
        this.duration = i;
        this.oS = z;
    }

    public f<Drawable> a(DataSource dataSource, boolean z) {
        return dataSource == DataSource.MEMORY_CACHE ? e.eA() : ex();
    }

    private f<Drawable> ex() {
        if (this.oT == null) {
            this.oT = new d(this.duration, this.oS);
        }
        return this.oT;
    }
}
