package com.android.gallery3d.ui;

public class IntArray {
    private static final int INIT_CAPACITY = 8;
    private int[] mData = new int[8];
    private int mSize = 0;

    public void add(int i) {
        if (this.mData.length == this.mSize) {
            Object obj = new int[(this.mSize + this.mSize)];
            System.arraycopy(this.mData, 0, obj, 0, this.mSize);
            this.mData = obj;
        }
        int[] iArr = this.mData;
        int i2 = this.mSize;
        this.mSize = i2 + 1;
        iArr[i2] = i;
    }

    public int size() {
        return this.mSize;
    }

    public int[] toArray(int[] iArr) {
        Object iArr2;
        if (iArr2 == null || iArr2.length < this.mSize) {
            iArr2 = new int[this.mSize];
        }
        System.arraycopy(this.mData, 0, iArr2, 0, this.mSize);
        return iArr2;
    }

    public int[] getInternalArray() {
        return this.mData;
    }

    public void clear() {
        this.mSize = 0;
        if (this.mData.length != 8) {
            this.mData = new int[8];
        }
    }
}
