package com.bumptech.glide.load.engine.bitmap_recycle;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.support.annotation.NonNull;

/* compiled from: BitmapPoolAdapter */
public class e implements d {
    public long getMaxSize() {
        return 0;
    }

    public void b(float f) {
    }

    public void d(Bitmap bitmap) {
        bitmap.recycle();
    }

    @NonNull
    public Bitmap b(int i, int i2, Config config) {
        return Bitmap.createBitmap(i, i2, config);
    }

    @NonNull
    public Bitmap g(int i, int i2, Config config) {
        return b(i, i2, config);
    }

    public void i() {
    }

    public void trimMemory(int i) {
    }
}
