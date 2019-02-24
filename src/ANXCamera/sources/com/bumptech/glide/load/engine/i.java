package com.bumptech.glide.load.engine;

import android.support.annotation.NonNull;
import com.bumptech.glide.load.c;
import com.bumptech.glide.load.f;
import java.security.MessageDigest;
import java.util.Map;

/* compiled from: EngineKey */
class i implements c {
    private final Class<?> aI;
    private final Object aL;
    private final c ef;
    private final f eh;
    private final Class<?> ej;
    private final Map<Class<?>, com.bumptech.glide.load.i<?>> el;
    private int hashCode;
    private final int height;
    private final int width;

    i(Object obj, c cVar, int i, int i2, Map<Class<?>, com.bumptech.glide.load.i<?>> map, Class<?> cls, Class<?> cls2, f fVar) {
        this.aL = com.bumptech.glide.util.i.checkNotNull(obj);
        this.ef = (c) com.bumptech.glide.util.i.a((Object) cVar, "Signature must not be null");
        this.width = i;
        this.height = i2;
        this.el = (Map) com.bumptech.glide.util.i.checkNotNull(map);
        this.ej = (Class) com.bumptech.glide.util.i.a((Object) cls, "Resource class must not be null");
        this.aI = (Class) com.bumptech.glide.util.i.a((Object) cls2, "Transcode class must not be null");
        this.eh = (f) com.bumptech.glide.util.i.checkNotNull(fVar);
    }

    public boolean equals(Object obj) {
        boolean z = false;
        if (!(obj instanceof i)) {
            return false;
        }
        i iVar = (i) obj;
        if (this.aL.equals(iVar.aL) && this.ef.equals(iVar.ef) && this.height == iVar.height && this.width == iVar.width && this.el.equals(iVar.el) && this.ej.equals(iVar.ej) && this.aI.equals(iVar.aI) && this.eh.equals(iVar.eh)) {
            z = true;
        }
        return z;
    }

    public int hashCode() {
        if (this.hashCode == 0) {
            this.hashCode = this.aL.hashCode();
            this.hashCode = (this.hashCode * 31) + this.ef.hashCode();
            this.hashCode = (this.hashCode * 31) + this.width;
            this.hashCode = (this.hashCode * 31) + this.height;
            this.hashCode = (this.hashCode * 31) + this.el.hashCode();
            this.hashCode = (this.hashCode * 31) + this.ej.hashCode();
            this.hashCode = (this.hashCode * 31) + this.aI.hashCode();
            this.hashCode = (31 * this.hashCode) + this.eh.hashCode();
        }
        return this.hashCode;
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("EngineKey{model=");
        stringBuilder.append(this.aL);
        stringBuilder.append(", width=");
        stringBuilder.append(this.width);
        stringBuilder.append(", height=");
        stringBuilder.append(this.height);
        stringBuilder.append(", resourceClass=");
        stringBuilder.append(this.ej);
        stringBuilder.append(", transcodeClass=");
        stringBuilder.append(this.aI);
        stringBuilder.append(", signature=");
        stringBuilder.append(this.ef);
        stringBuilder.append(", hashCode=");
        stringBuilder.append(this.hashCode);
        stringBuilder.append(", transformations=");
        stringBuilder.append(this.el);
        stringBuilder.append(", options=");
        stringBuilder.append(this.eh);
        stringBuilder.append('}');
        return stringBuilder.toString();
    }

    public void updateDiskCacheKey(@NonNull MessageDigest messageDigest) {
        throw new UnsupportedOperationException();
    }
}
