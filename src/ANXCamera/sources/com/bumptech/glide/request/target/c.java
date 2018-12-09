package com.bumptech.glide.request.target;

import android.graphics.Bitmap;
import android.widget.ImageView;

/* compiled from: BitmapImageViewTarget */
public class c extends h<Bitmap> {
    public c(ImageView imageView) {
        super(imageView);
    }

    @Deprecated
    public c(ImageView imageView, boolean z) {
        super(imageView, z);
    }

    /* renamed from: n */
    protected void s(Bitmap bitmap) {
        ((ImageView) this.view).setImageBitmap(bitmap);
    }
}
