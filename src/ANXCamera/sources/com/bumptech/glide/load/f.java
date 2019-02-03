package com.bumptech.glide.load;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.util.ArrayMap;
import com.bumptech.glide.util.CachedHashCodeArrayMap;
import java.security.MessageDigest;

/* compiled from: Options */
public final class f implements c {
    private final ArrayMap<e<?>, Object> cZ = new CachedHashCodeArrayMap();

    public void a(@NonNull f fVar) {
        this.cZ.putAll(fVar.cZ);
    }

    @NonNull
    public <T> f a(@NonNull e<T> eVar, @NonNull T t) {
        this.cZ.put(eVar, t);
        return this;
    }

    @Nullable
    public <T> T a(@NonNull e<T> eVar) {
        return this.cZ.containsKey(eVar) ? this.cZ.get(eVar) : eVar.getDefaultValue();
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof f)) {
            return false;
        }
        return this.cZ.equals(((f) obj).cZ);
    }

    public int hashCode() {
        return this.cZ.hashCode();
    }

    public void updateDiskCacheKey(@NonNull MessageDigest messageDigest) {
        for (int i = 0; i < this.cZ.size(); i++) {
            a((e) this.cZ.keyAt(i), this.cZ.valueAt(i), messageDigest);
        }
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Options{values=");
        stringBuilder.append(this.cZ);
        stringBuilder.append('}');
        return stringBuilder.toString();
    }

    private static <T> void a(@NonNull e<T> eVar, @NonNull Object obj, @NonNull MessageDigest messageDigest) {
        eVar.a(obj, messageDigest);
    }
}
