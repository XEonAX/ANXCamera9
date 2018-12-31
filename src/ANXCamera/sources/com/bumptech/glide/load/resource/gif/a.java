package com.bumptech.glide.load.resource.gif;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.bumptech.glide.load.engine.bitmap_recycle.b;
import com.bumptech.glide.load.engine.bitmap_recycle.d;

/* compiled from: GifBitmapProvider */
public final class a implements com.bumptech.glide.b.a.a {
    private final d i;
    @Nullable
    private final b r;

    public a(d dVar) {
        this(dVar, null);
    }

    public a(d dVar, @Nullable b bVar) {
        this.i = dVar;
        this.r = bVar;
    }

    @NonNull
    public Bitmap a(int i, int i2, @NonNull Config config) {
        return this.i.g(i, i2, config);
    }

    public void c(@NonNull Bitmap bitmap) {
        this.i.d(bitmap);
    }

    @NonNull
    public byte[] i(int i) {
        if (this.r == null) {
            return new byte[i];
        }
        return (byte[]) this.r.a(i, byte[].class);
    }

    public void c(@NonNull byte[] bArr) {
        if (this.r != null) {
            this.r.put(bArr);
        }
    }

    @NonNull
    public int[] j(int i) {
        if (this.r == null) {
            return new int[i];
        }
        return (int[]) this.r.a(i, int[].class);
    }

    public void a(@NonNull int[] iArr) {
        if (this.r != null) {
            this.r.put(iArr);
        }
    }
}
