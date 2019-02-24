package com.bumptech.glide.load.engine;

import android.support.annotation.NonNull;
import com.bumptech.glide.load.c;
import com.bumptech.glide.load.engine.bitmap_recycle.b;
import com.bumptech.glide.load.i;
import com.bumptech.glide.util.f;
import com.bumptech.glide.util.k;
import java.nio.ByteBuffer;
import java.security.MessageDigest;

/* compiled from: ResourceCacheKey */
final class r implements c {
    private static final f<Class<?>, byte[]> gl = new f(50);
    private final c ea;
    private final c ef;
    private final com.bumptech.glide.load.f eh;
    private final Class<?> gm;
    private final i<?> gn;
    private final int height;
    private final b v;
    private final int width;

    r(b bVar, c cVar, c cVar2, int i, int i2, i<?> iVar, Class<?> cls, com.bumptech.glide.load.f fVar) {
        this.v = bVar;
        this.ea = cVar;
        this.ef = cVar2;
        this.width = i;
        this.height = i2;
        this.gn = iVar;
        this.gm = cls;
        this.eh = fVar;
    }

    public boolean equals(Object obj) {
        boolean z = false;
        if (!(obj instanceof r)) {
            return false;
        }
        r rVar = (r) obj;
        if (this.height == rVar.height && this.width == rVar.width && k.b(this.gn, rVar.gn) && this.gm.equals(rVar.gm) && this.ea.equals(rVar.ea) && this.ef.equals(rVar.ef) && this.eh.equals(rVar.eh)) {
            z = true;
        }
        return z;
    }

    public int hashCode() {
        int hashCode = (((((this.ea.hashCode() * 31) + this.ef.hashCode()) * 31) + this.width) * 31) + this.height;
        if (this.gn != null) {
            hashCode = (hashCode * 31) + this.gn.hashCode();
        }
        return (31 * ((hashCode * 31) + this.gm.hashCode())) + this.eh.hashCode();
    }

    public void updateDiskCacheKey(@NonNull MessageDigest messageDigest) {
        byte[] bArr = (byte[]) this.v.b(8, byte[].class);
        ByteBuffer.wrap(bArr).putInt(this.width).putInt(this.height).array();
        this.ef.updateDiskCacheKey(messageDigest);
        this.ea.updateDiskCacheKey(messageDigest);
        messageDigest.update(bArr);
        if (this.gn != null) {
            this.gn.updateDiskCacheKey(messageDigest);
        }
        this.eh.updateDiskCacheKey(messageDigest);
        messageDigest.update(bd());
        this.v.put(bArr);
    }

    private byte[] bd() {
        byte[] bArr = (byte[]) gl.get(this.gm);
        if (bArr != null) {
            return bArr;
        }
        Object bytes = this.gm.getName().getBytes(cU);
        gl.put(this.gm, bytes);
        return bytes;
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("ResourceCacheKey{sourceKey=");
        stringBuilder.append(this.ea);
        stringBuilder.append(", signature=");
        stringBuilder.append(this.ef);
        stringBuilder.append(", width=");
        stringBuilder.append(this.width);
        stringBuilder.append(", height=");
        stringBuilder.append(this.height);
        stringBuilder.append(", decodedResourceClass=");
        stringBuilder.append(this.gm);
        stringBuilder.append(", transformation='");
        stringBuilder.append(this.gn);
        stringBuilder.append('\'');
        stringBuilder.append(", options=");
        stringBuilder.append(this.eh);
        stringBuilder.append('}');
        return stringBuilder.toString();
    }
}
