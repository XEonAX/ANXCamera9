package com.google.protobuf.nano;

public final class FieldArray implements Cloneable {
    private static final FieldData DELETED = new FieldData();
    private FieldData[] mData;
    private int[] mFieldNumbers;
    private boolean mGarbage;
    private int mSize;

    FieldArray() {
        this(10);
    }

    FieldArray(int i) {
        this.mGarbage = false;
        i = idealIntArraySize(i);
        this.mFieldNumbers = new int[i];
        this.mData = new FieldData[i];
        this.mSize = 0;
    }

    FieldData get(int i) {
        i = binarySearch(i);
        if (i < 0 || this.mData[i] == DELETED) {
            return null;
        }
        return this.mData[i];
    }

    public final int getFieldNumbersSize() {
        return this.mFieldNumbers.length;
    }

    public final int getFieldNumberAt(int i) {
        return this.mFieldNumbers[i];
    }

    void remove(int i) {
        i = binarySearch(i);
        if (i >= 0 && this.mData[i] != DELETED) {
            this.mData[i] = DELETED;
            this.mGarbage = true;
        }
    }

    private void gc() {
        int i = this.mSize;
        int[] iArr = this.mFieldNumbers;
        FieldData[] fieldDataArr = this.mData;
        int i2 = 0;
        int i3 = i2;
        while (i2 < i) {
            FieldData fieldData = fieldDataArr[i2];
            if (fieldData != DELETED) {
                if (i2 != i3) {
                    iArr[i3] = iArr[i2];
                    fieldDataArr[i3] = fieldData;
                    fieldDataArr[i2] = null;
                }
                i3++;
            }
            i2++;
        }
        this.mGarbage = false;
        this.mSize = i3;
    }

    void put(int i, FieldData fieldData) {
        int binarySearch = binarySearch(i);
        if (binarySearch >= 0) {
            this.mData[binarySearch] = fieldData;
        } else {
            binarySearch = ~binarySearch;
            if (binarySearch >= this.mSize || this.mData[binarySearch] != DELETED) {
                if (this.mGarbage && this.mSize >= this.mFieldNumbers.length) {
                    gc();
                    binarySearch = ~binarySearch(i);
                }
                if (this.mSize >= this.mFieldNumbers.length) {
                    int idealIntArraySize = idealIntArraySize(this.mSize + 1);
                    Object obj = new int[idealIntArraySize];
                    Object obj2 = new FieldData[idealIntArraySize];
                    System.arraycopy(this.mFieldNumbers, 0, obj, 0, this.mFieldNumbers.length);
                    System.arraycopy(this.mData, 0, obj2, 0, this.mData.length);
                    this.mFieldNumbers = obj;
                    this.mData = obj2;
                }
                if (this.mSize - binarySearch != 0) {
                    int i2 = binarySearch + 1;
                    System.arraycopy(this.mFieldNumbers, binarySearch, this.mFieldNumbers, i2, this.mSize - binarySearch);
                    System.arraycopy(this.mData, binarySearch, this.mData, i2, this.mSize - binarySearch);
                }
                this.mFieldNumbers[binarySearch] = i;
                this.mData[binarySearch] = fieldData;
                this.mSize++;
            } else {
                this.mFieldNumbers[binarySearch] = i;
                this.mData[binarySearch] = fieldData;
            }
        }
    }

    int size() {
        if (this.mGarbage) {
            gc();
        }
        return this.mSize;
    }

    public boolean isEmpty() {
        return size() == 0;
    }

    FieldData dataAt(int i) {
        if (this.mGarbage) {
            gc();
        }
        return this.mData[i];
    }

    public boolean equals(Object obj) {
        boolean z = true;
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof FieldArray)) {
            return false;
        }
        FieldArray fieldArray = (FieldArray) obj;
        if (size() != fieldArray.size()) {
            return false;
        }
        if (!(arrayEquals(this.mFieldNumbers, fieldArray.mFieldNumbers, this.mSize) && arrayEquals(this.mData, fieldArray.mData, this.mSize))) {
            z = false;
        }
        return z;
    }

    public int hashCode() {
        if (this.mGarbage) {
            gc();
        }
        int i = 17;
        for (int i2 = 0; i2 < this.mSize; i2++) {
            i = this.mData[i2].hashCode() + (31 * ((i * 31) + this.mFieldNumbers[i2]));
        }
        return i;
    }

    private int idealIntArraySize(int i) {
        return idealByteArraySize(i * 4) / 4;
    }

    private int idealByteArraySize(int i) {
        for (int i2 = 4; i2 < 32; i2++) {
            int i3 = (1 << i2) - 12;
            if (i <= i3) {
                return i3;
            }
        }
        return i;
    }

    private int binarySearch(int i) {
        int i2 = this.mSize - 1;
        int i3 = 0;
        while (i3 <= i2) {
            int i4 = (i3 + i2) >>> 1;
            int i5 = this.mFieldNumbers[i4];
            if (i5 < i) {
                i3 = i4 + 1;
            } else if (i5 <= i) {
                return i4;
            } else {
                i2 = i4 - 1;
            }
        }
        return ~i3;
    }

    private boolean arrayEquals(int[] iArr, int[] iArr2, int i) {
        for (int i2 = 0; i2 < i; i2++) {
            if (iArr[i2] != iArr2[i2]) {
                return false;
            }
        }
        return true;
    }

    private boolean arrayEquals(FieldData[] fieldDataArr, FieldData[] fieldDataArr2, int i) {
        for (int i2 = 0; i2 < i; i2++) {
            if (!fieldDataArr[i2].equals(fieldDataArr2[i2])) {
                return false;
            }
        }
        return true;
    }

    public final FieldArray clone() {
        int size = size();
        FieldArray fieldArray = new FieldArray(size);
        int i = 0;
        System.arraycopy(this.mFieldNumbers, 0, fieldArray.mFieldNumbers, 0, size);
        while (i < size) {
            if (this.mData[i] != null) {
                fieldArray.mData[i] = this.mData[i].clone();
            }
            i++;
        }
        fieldArray.mSize = size;
        return fieldArray;
    }
}
