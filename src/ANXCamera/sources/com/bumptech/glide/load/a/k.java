package com.bumptech.glide.load.a;

import android.support.annotation.NonNull;
import com.bumptech.glide.load.engine.bitmap_recycle.b;
import com.bumptech.glide.load.resource.bitmap.RecyclableBufferedInputStream;
import java.io.IOException;
import java.io.InputStream;

/* compiled from: InputStreamRewinder */
public final class k implements e<InputStream> {
    private static final int dt = 5242880;
    private final RecyclableBufferedInputStream du;

    /* compiled from: InputStreamRewinder */
    public static final class a implements com.bumptech.glide.load.a.e.a<InputStream> {
        private final b dv;

        public a(b bVar) {
            this.dv = bVar;
        }

        @NonNull
        /* renamed from: c */
        public e<InputStream> j(InputStream inputStream) {
            return new k(inputStream, this.dv);
        }

        @NonNull
        public Class<InputStream> ad() {
            return InputStream.class;
        }
    }

    k(InputStream inputStream, b bVar) {
        this.du = new RecyclableBufferedInputStream(inputStream, bVar);
        this.du.mark(dt);
    }

    @NonNull
    /* renamed from: ah */
    public InputStream ag() throws IOException {
        this.du.reset();
        return this.du;
    }

    public void cleanup() {
        this.du.release();
    }
}
