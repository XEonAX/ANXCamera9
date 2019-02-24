package com.bumptech.glide.load.resource.bitmap;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Canvas;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.support.annotation.Nullable;
import android.util.Log;
import com.bumptech.glide.load.engine.bitmap_recycle.d;
import com.bumptech.glide.load.engine.bitmap_recycle.e;
import com.bumptech.glide.load.engine.p;
import java.util.concurrent.locks.Lock;

/* compiled from: DrawableToBitmapConverter */
final class o {
    private static final String TAG = "DrawableToBitmap";
    private static final d kP = new e() {
        public void d(Bitmap bitmap) {
        }
    };

    private o() {
    }

    @Nullable
    static p<Bitmap> a(d dVar, Drawable drawable, int i, int i2) {
        Bitmap bitmap;
        drawable = drawable.getCurrent();
        Object obj = null;
        if (drawable instanceof BitmapDrawable) {
            bitmap = ((BitmapDrawable) drawable).getBitmap();
        } else if (drawable instanceof Animatable) {
            bitmap = null;
        } else {
            bitmap = b(dVar, drawable, i, i2);
            obj = 1;
        }
        if (obj == null) {
            dVar = kP;
        }
        return f.a(bitmap, dVar);
    }

    @Nullable
    private static Bitmap b(d dVar, Drawable drawable, int i, int i2) {
        String str;
        StringBuilder stringBuilder;
        if (i == Integer.MIN_VALUE && drawable.getIntrinsicWidth() <= 0) {
            if (Log.isLoggable(TAG, 5)) {
                str = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("Unable to draw ");
                stringBuilder.append(drawable);
                stringBuilder.append(" to Bitmap with Target.SIZE_ORIGINAL because the Drawable has no intrinsic width");
                Log.w(str, stringBuilder.toString());
            }
            return null;
        } else if (i2 != Integer.MIN_VALUE || drawable.getIntrinsicHeight() > 0) {
            if (drawable.getIntrinsicWidth() > 0) {
                i = drawable.getIntrinsicWidth();
            }
            if (drawable.getIntrinsicHeight() > 0) {
                i2 = drawable.getIntrinsicHeight();
            }
            Lock cu = w.cu();
            cu.lock();
            Bitmap b = dVar.b(i, i2, Config.ARGB_8888);
            try {
                Canvas canvas = new Canvas(b);
                drawable.setBounds(0, 0, i, i2);
                drawable.draw(canvas);
                canvas.setBitmap(null);
                return b;
            } finally {
                cu.unlock();
            }
        } else {
            if (Log.isLoggable(TAG, 5)) {
                str = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("Unable to draw ");
                stringBuilder.append(drawable);
                stringBuilder.append(" to Bitmap with Target.SIZE_ORIGINAL because the Drawable has no intrinsic height");
                Log.w(str, stringBuilder.toString());
            }
            return null;
        }
    }
}
