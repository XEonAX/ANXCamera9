package com.bumptech.glide.load.model.a;

import android.content.Context;
import android.net.Uri;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.bumptech.glide.e.d;
import com.bumptech.glide.load.a.a.b;
import com.bumptech.glide.load.a.a.c;
import com.bumptech.glide.load.f;
import com.bumptech.glide.load.model.m;
import com.bumptech.glide.load.model.n;
import com.bumptech.glide.load.model.q;
import com.bumptech.glide.load.resource.bitmap.VideoDecoder;
import java.io.InputStream;

/* compiled from: MediaStoreVideoThumbLoader */
public class e implements m<Uri, InputStream> {
    private final Context context;

    /* compiled from: MediaStoreVideoThumbLoader */
    public static class a implements n<Uri, InputStream> {
        private final Context context;

        public a(Context context) {
            this.context = context;
        }

        @NonNull
        public m<Uri, InputStream> a(q qVar) {
            return new e(this.context);
        }

        public void bR() {
        }
    }

    public e(Context context) {
        this.context = context.getApplicationContext();
    }

    @Nullable
    /* renamed from: a */
    public com.bumptech.glide.load.model.m.a<InputStream> b(@NonNull Uri uri, int i, int i2, @NonNull f fVar) {
        if (b.g(i, i2) && c(fVar)) {
            return new com.bumptech.glide.load.model.m.a(new d(uri), c.b(this.context, uri));
        }
        return null;
    }

    private boolean c(f fVar) {
        Long l = (Long) fVar.a(VideoDecoder.lk);
        return l != null && l.longValue() == -1;
    }

    /* renamed from: k */
    public boolean o(@NonNull Uri uri) {
        return b.e(uri);
    }
}
