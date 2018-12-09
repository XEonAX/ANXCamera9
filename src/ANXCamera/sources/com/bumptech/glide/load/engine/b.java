package com.bumptech.glide.load.engine;

import android.support.annotation.NonNull;
import com.bumptech.glide.load.c;
import java.security.MessageDigest;

/* compiled from: DataCacheKey */
final class b implements c {
    private final c dZ;
    private final c ee;

    b(c cVar, c cVar2) {
        this.dZ = cVar;
        this.ee = cVar2;
    }

    c ao() {
        return this.dZ;
    }

    public boolean equals(Object obj) {
        boolean z = false;
        if (!(obj instanceof b)) {
            return false;
        }
        b bVar = (b) obj;
        if (this.dZ.equals(bVar.dZ) && this.ee.equals(bVar.ee)) {
            z = true;
        }
        return z;
    }

    public int hashCode() {
        return (31 * this.dZ.hashCode()) + this.ee.hashCode();
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("DataCacheKey{sourceKey=");
        stringBuilder.append(this.dZ);
        stringBuilder.append(", signature=");
        stringBuilder.append(this.ee);
        stringBuilder.append('}');
        return stringBuilder.toString();
    }

    public void updateDiskCacheKey(@NonNull MessageDigest messageDigest) {
        this.dZ.updateDiskCacheKey(messageDigest);
        this.ee.updateDiskCacheKey(messageDigest);
    }
}
