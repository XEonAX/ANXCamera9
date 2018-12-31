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
    private final c dZ;
    private final c ee;
    private final com.bumptech.glide.load.f eg;
    private final Class<?> gm;
    private final i<?> gn;
    private final int height;
    private final b r;
    private final int width;

    r(b bVar, c cVar, c cVar2, int i, int i2, i<?> iVar, Class<?> cls, com.bumptech.glide.load.f fVar) {
        this.r = bVar;
        this.dZ = cVar;
        this.ee = cVar2;
        this.width = i;
        this.height = i2;
        this.gn = iVar;
        this.gm = cls;
        this.eg = fVar;
    }

    public boolean equals(Object obj) {
        boolean z = false;
        if (!(obj instanceof r)) {
            return false;
        }
        r rVar = (r) obj;
        if (this.height == rVar.height && this.width == rVar.width && k.b(this.gn, rVar.gn) && this.gm.equals(rVar.gm) && this.dZ.equals(rVar.dZ) && this.ee.equals(rVar.ee) && this.eg.equals(rVar.eg)) {
            z = true;
        }
        return z;
    }

    public int hashCode() {
        int hashCode = (((((this.dZ.hashCode() * 31) + this.ee.hashCode()) * 31) + this.width) * 31) + this.height;
        if (this.gn != null) {
            hashCode = (hashCode * 31) + this.gn.hashCode();
        }
        return (31 * ((hashCode * 31) + this.gm.hashCode())) + this.eg.hashCode();
    }

    public void updateDiskCacheKey(@NonNull MessageDigest messageDigest) {
        byte[] bArr = (byte[]) this.r.b(8, byte[].class);
        ByteBuffer.wrap(bArr).putInt(this.width).putInt(this.height).array();
        this.ee.updateDiskCacheKey(messageDigest);
        this.dZ.updateDiskCacheKey(messageDigest);
        messageDigest.update(bArr);
        if (this.gn != null) {
            this.gn.updateDiskCacheKey(messageDigest);
        }
        this.eg.updateDiskCacheKey(messageDigest);
        messageDigest.update(bd());
        this.r.put(bArr);
    }

    private byte[] bd() {
        byte[] bArr = (byte[]) gl.get(this.gm);
        if (bArr != null) {
            return bArr;
        }
        Object bytes = this.gm.getName().getBytes(cT);
        gl.put(this.gm, bytes);
        return bytes;
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("ResourceCacheKey{sourceKey=");
        stringBuilder.append(this.dZ);
        stringBuilder.append(", signature=");
        stringBuilder.append(this.ee);
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
        stringBuilder.append(this.eg);
        stringBuilder.append('}');
        return stringBuilder.toString();
    }
}
