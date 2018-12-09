package com.bumptech.glide.load.resource.bitmap;

import android.graphics.Bitmap;
import android.support.annotation.NonNull;
import com.bumptech.glide.load.engine.bitmap_recycle.b;
import com.bumptech.glide.load.engine.bitmap_recycle.d;
import com.bumptech.glide.load.engine.p;
import com.bumptech.glide.load.f;
import com.bumptech.glide.load.g;
import com.bumptech.glide.util.c;
import java.io.IOException;
import java.io.InputStream;

/* compiled from: StreamBitmapDecoder */
public class v implements g<InputStream, Bitmap> {
    private final b du;
    private final n jV;

    /* compiled from: StreamBitmapDecoder */
    static class a implements com.bumptech.glide.load.resource.bitmap.n.a {
        private final RecyclableBufferedInputStream dt;
        private final c lb;

        a(RecyclableBufferedInputStream recyclableBufferedInputStream, c cVar) {
            this.dt = recyclableBufferedInputStream;
            this.lb = cVar;
        }

        public void cn() {
            this.dt.ct();
        }

        public void a(d dVar, Bitmap bitmap) throws IOException {
            IOException eD = this.lb.eD();
            if (eD != null) {
                if (bitmap != null) {
                    dVar.d(bitmap);
                }
                throw eD;
            }
        }
    }

    public v(n nVar, b bVar) {
        this.jV = nVar;
        this.du = bVar;
    }

    public boolean a(@NonNull InputStream inputStream, @NonNull f fVar) {
        return this.jV.e(inputStream);
    }

    public p<Bitmap> a(@NonNull InputStream inputStream, int i, int i2, @NonNull f fVar) throws IOException {
        Object obj;
        if (inputStream instanceof RecyclableBufferedInputStream) {
            inputStream = (RecyclableBufferedInputStream) inputStream;
            obj = null;
        } else {
            InputStream recyclableBufferedInputStream = new RecyclableBufferedInputStream(inputStream, this.du);
            obj = 1;
            inputStream = recyclableBufferedInputStream;
        }
        InputStream h = c.h(inputStream);
        try {
            p<Bitmap> a = this.jV.a(new com.bumptech.glide.util.g(h), i, i2, fVar, new a(inputStream, h));
            return a;
        } finally {
            h.release();
            if (obj != null) {
                inputStream.release();
            }
        }
    }
}
