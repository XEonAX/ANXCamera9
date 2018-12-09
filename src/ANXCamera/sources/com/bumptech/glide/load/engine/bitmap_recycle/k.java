package com.bumptech.glide.load.engine.bitmap_recycle;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.support.annotation.Nullable;

/* compiled from: LruPoolStrategy */
interface k {
    @Nullable
    Bitmap b(int i, int i2, Config config);

    @Nullable
    Bitmap bf();

    String c(int i, int i2, Config config);

    void d(Bitmap bitmap);

    String e(Bitmap bitmap);

    int f(Bitmap bitmap);
}
