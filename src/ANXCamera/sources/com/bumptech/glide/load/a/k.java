package com.bumptech.glide.load.a;

import android.support.annotation.NonNull;
import com.bumptech.glide.load.engine.bitmap_recycle.b;
import com.bumptech.glide.load.resource.bitmap.RecyclableBufferedInputStream;
import java.io.IOException;
import java.io.InputStream;

/* compiled from: InputStreamRewinder */
public final class k implements e<InputStream> {
    private static final int dq = 5242880;
    private final RecyclableBufferedInputStream dt;

    /* compiled from: InputStreamRewinder */
    public static final class a implements com.bumptech.glide.load.a.e.a<InputStream> {
        private final b du;

        public a(b bVar) {
            this.du = bVar;
        }

        @NonNull
        /* renamed from: c */
        public e<InputStream> j(InputStream inputStream) {
            return new k(inputStream, this.du);
        }

        @NonNull
        public Class<InputStream> ad() {
            return InputStream.class;
        }
    }

    k(InputStream inputStream, b bVar) {
        this.dt = new RecyclableBufferedInputStream(inputStream, bVar);
        this.dt.mark(dq);
    }

    @NonNull
    /* renamed from: ah */
    public InputStream ag() throws IOException {
        this.dt.reset();
        return this.dt;
    }

    public void cleanup() {
        this.dt.release();
    }
}
