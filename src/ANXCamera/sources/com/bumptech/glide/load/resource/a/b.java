package com.bumptech.glide.load.resource.a;

import android.support.annotation.NonNull;
import com.bumptech.glide.load.engine.p;
import com.bumptech.glide.util.i;

/* compiled from: BytesResource */
public class b implements p<byte[]> {
    private final byte[] bytes;

    public b(byte[] bArr) {
        this.bytes = (byte[]) i.checkNotNull(bArr);
    }

    @NonNull
    public Class<byte[]> aZ() {
        return byte[].class;
    }

    @NonNull
    public byte[] get() {
        return this.bytes;
    }

    public int getSize() {
        return this.bytes.length;
    }

    public void recycle() {
    }
}
