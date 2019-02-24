package com.bumptech.glide.load.engine.bitmap_recycle;

/* compiled from: ByteArrayAdapter */
public final class f implements a<byte[]> {
    private static final String TAG = "ByteArrayPool";

    public String getTag() {
        return TAG;
    }

    /* renamed from: e */
    public int l(byte[] bArr) {
        return bArr.length;
    }

    /* renamed from: n */
    public byte[] newArray(int i) {
        return new byte[i];
    }

    public int be() {
        return 1;
    }
}
