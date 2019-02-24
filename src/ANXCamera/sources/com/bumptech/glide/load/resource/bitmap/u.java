package com.bumptech.glide.load.resource.bitmap;

import android.graphics.Bitmap;
import android.support.annotation.NonNull;
import com.bumptech.glide.load.engine.bitmap_recycle.d;
import com.bumptech.glide.util.i;
import com.bumptech.glide.util.k;
import java.nio.ByteBuffer;
import java.security.MessageDigest;

/* compiled from: RoundedCorners */
public final class u extends g {
    private static final String ID = "com.bumptech.glide.load.resource.bitmap.RoundedCorners";
    private static final byte[] jW = ID.getBytes(cU);
    private final int la;

    public u(int i) {
        i.a(i > 0, "roundingRadius must be greater than 0.");
        this.la = i;
    }

    protected Bitmap transform(@NonNull d dVar, @NonNull Bitmap bitmap, int i, int i2) {
        return w.b(dVar, bitmap, this.la);
    }

    public boolean equals(Object obj) {
        boolean z = false;
        if (!(obj instanceof u)) {
            return false;
        }
        if (this.la == ((u) obj).la) {
            z = true;
        }
        return z;
    }

    public int hashCode() {
        return k.q(ID.hashCode(), k.hashCode(this.la));
    }

    public void updateDiskCacheKey(@NonNull MessageDigest messageDigest) {
        messageDigest.update(jW);
        messageDigest.update(ByteBuffer.allocate(4).putInt(this.la).array());
    }
}
