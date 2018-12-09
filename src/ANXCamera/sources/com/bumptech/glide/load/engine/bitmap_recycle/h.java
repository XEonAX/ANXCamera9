package com.bumptech.glide.load.engine.bitmap_recycle;

/* compiled from: IntegerArrayAdapter */
public final class h implements a<int[]> {
    private static final String TAG = "IntegerArrayPool";

    public String getTag() {
        return TAG;
    }

    /* renamed from: b */
    public int l(int[] iArr) {
        return iArr.length;
    }

    public int[] newArray(int i) {
        return new int[i];
    }

    public int be() {
        return 4;
    }
}
