package com.bumptech.glide.load.engine;

import android.support.annotation.NonNull;
import com.bumptech.glide.load.c;
import java.security.MessageDigest;

/* compiled from: DataCacheKey */
final class b implements c {
    private final c ea;
    private final c ef;

    b(c cVar, c cVar2) {
        this.ea = cVar;
        this.ef = cVar2;
    }

    c ao() {
        return this.ea;
    }

    public boolean equals(Object obj) {
        boolean z = false;
        if (!(obj instanceof b)) {
            return false;
        }
        b bVar = (b) obj;
        if (this.ea.equals(bVar.ea) && this.ef.equals(bVar.ef)) {
            z = true;
        }
        return z;
    }

    public int hashCode() {
        return (31 * this.ea.hashCode()) + this.ef.hashCode();
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("DataCacheKey{sourceKey=");
        stringBuilder.append(this.ea);
        stringBuilder.append(", signature=");
        stringBuilder.append(this.ef);
        stringBuilder.append('}');
        return stringBuilder.toString();
    }

    public void updateDiskCacheKey(@NonNull MessageDigest messageDigest) {
        this.ea.updateDiskCacheKey(messageDigest);
        this.ef.updateDiskCacheKey(messageDigest);
    }
}
