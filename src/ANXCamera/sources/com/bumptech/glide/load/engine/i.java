package com.bumptech.glide.load.engine;

import android.support.annotation.NonNull;
import com.bumptech.glide.load.c;
import com.bumptech.glide.load.f;
import java.security.MessageDigest;
import java.util.Map;

/* compiled from: EngineKey */
class i implements c {
    private final Class<?> aH;
    private final Object aK;
    private final c ee;
    private final f eg;
    private final Class<?> ei;
    private final Map<Class<?>, com.bumptech.glide.load.i<?>> ek;
    private int hashCode;
    private final int height;
    private final int width;

    i(Object obj, c cVar, int i, int i2, Map<Class<?>, com.bumptech.glide.load.i<?>> map, Class<?> cls, Class<?> cls2, f fVar) {
        this.aK = com.bumptech.glide.util.i.checkNotNull(obj);
        this.ee = (c) com.bumptech.glide.util.i.a((Object) cVar, "Signature must not be null");
        this.width = i;
        this.height = i2;
        this.ek = (Map) com.bumptech.glide.util.i.checkNotNull(map);
        this.ei = (Class) com.bumptech.glide.util.i.a((Object) cls, "Resource class must not be null");
        this.aH = (Class) com.bumptech.glide.util.i.a((Object) cls2, "Transcode class must not be null");
        this.eg = (f) com.bumptech.glide.util.i.checkNotNull(fVar);
    }

    public boolean equals(Object obj) {
        boolean z = false;
        if (!(obj instanceof i)) {
            return false;
        }
        i iVar = (i) obj;
        if (this.aK.equals(iVar.aK) && this.ee.equals(iVar.ee) && this.height == iVar.height && this.width == iVar.width && this.ek.equals(iVar.ek) && this.ei.equals(iVar.ei) && this.aH.equals(iVar.aH) && this.eg.equals(iVar.eg)) {
            z = true;
        }
        return z;
    }

    public int hashCode() {
        if (this.hashCode == 0) {
            this.hashCode = this.aK.hashCode();
            this.hashCode = (this.hashCode * 31) + this.ee.hashCode();
            this.hashCode = (this.hashCode * 31) + this.width;
            this.hashCode = (this.hashCode * 31) + this.height;
            this.hashCode = (this.hashCode * 31) + this.ek.hashCode();
            this.hashCode = (this.hashCode * 31) + this.ei.hashCode();
            this.hashCode = (this.hashCode * 31) + this.aH.hashCode();
            this.hashCode = (31 * this.hashCode) + this.eg.hashCode();
        }
        return this.hashCode;
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("EngineKey{model=");
        stringBuilder.append(this.aK);
        stringBuilder.append(", width=");
        stringBuilder.append(this.width);
        stringBuilder.append(", height=");
        stringBuilder.append(this.height);
        stringBuilder.append(", resourceClass=");
        stringBuilder.append(this.ei);
        stringBuilder.append(", transcodeClass=");
        stringBuilder.append(this.aH);
        stringBuilder.append(", signature=");
        stringBuilder.append(this.ee);
        stringBuilder.append(", hashCode=");
        stringBuilder.append(this.hashCode);
        stringBuilder.append(", transformations=");
        stringBuilder.append(this.ek);
        stringBuilder.append(", options=");
        stringBuilder.append(this.eg);
        stringBuilder.append('}');
        return stringBuilder.toString();
    }

    public void updateDiskCacheKey(@NonNull MessageDigest messageDigest) {
        throw new UnsupportedOperationException();
    }
}
