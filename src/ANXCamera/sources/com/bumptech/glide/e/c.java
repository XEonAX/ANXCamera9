package com.bumptech.glide.e;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.nio.ByteBuffer;
import java.security.MessageDigest;

/* compiled from: MediaStoreSignature */
public class c implements com.bumptech.glide.load.c {
    @NonNull
    private final String mimeType;
    private final int orientation;
    private final long pd;

    public c(@Nullable String str, long j, int i) {
        if (str == null) {
            str = "";
        }
        this.mimeType = str;
        this.pd = j;
        this.orientation = i;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        c cVar = (c) obj;
        if (this.pd == cVar.pd && this.orientation == cVar.orientation && this.mimeType.equals(cVar.mimeType)) {
            return true;
        }
        return false;
    }

    public int hashCode() {
        return (31 * ((this.mimeType.hashCode() * 31) + ((int) (this.pd ^ (this.pd >>> 32))))) + this.orientation;
    }

    public void updateDiskCacheKey(@NonNull MessageDigest messageDigest) {
        messageDigest.update(ByteBuffer.allocate(12).putLong(this.pd).putInt(this.orientation).array());
        messageDigest.update(this.mimeType.getBytes(cT));
    }
}
