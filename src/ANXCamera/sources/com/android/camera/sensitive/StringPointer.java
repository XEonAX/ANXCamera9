package com.android.camera.sensitive;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;

public class StringPointer implements Parcelable, CharSequence, Comparable<StringPointer> {
    public static final Creator<StringPointer> CREATOR = new Creator<StringPointer>() {
        public StringPointer createFromParcel(Parcel parcel) {
            return new StringPointer(parcel);
        }

        public StringPointer[] newArray(int i) {
            return new StringPointer[i];
        }
    };
    private int hash = 0;
    protected final int length;
    protected final int offset;
    protected final char[] value;

    public StringPointer(String str) {
        this.value = str.toCharArray();
        this.offset = 0;
        this.length = this.value.length;
    }

    public StringPointer(char[] cArr, int i, int i2) {
        this.value = cArr;
        this.offset = i;
        this.length = i2;
    }

    protected StringPointer(Parcel parcel) {
        this.value = parcel.createCharArray();
        this.offset = parcel.readInt();
        this.length = parcel.readInt();
        this.hash = parcel.readInt();
    }

    public int nextTwoCharHash(int i) {
        return (31 * this.value[this.offset + i]) + this.value[(this.offset + i) + 1];
    }

    public int nextTwoCharMix(int i) {
        return this.value[(this.offset + i) + 1] | (this.value[this.offset + i] << 16);
    }

    public boolean nextStartsWith(int i, StringPointer stringPointer) {
        if (stringPointer.length > this.length - i) {
            return false;
        }
        for (int i2 = stringPointer.length - 1; i2 >= 0; i2--) {
            if (this.value[(this.offset + i) + i2] != stringPointer.value[stringPointer.offset + i2]) {
                return false;
            }
        }
        return true;
    }

    public void fill(int i, int i2, char c) {
        while (i < i2) {
            this.value[this.offset + i] = c;
            i++;
        }
    }

    public int length() {
        return this.length;
    }

    public char charAt(int i) {
        return this.value[this.offset + i];
    }

    public StringPointer substring(int i) {
        return new StringPointer(this.value, this.offset + i, this.length - i);
    }

    public StringPointer substring(int i, int i2) {
        return new StringPointer(this.value, this.offset + i, i2 - i);
    }

    public CharSequence subSequence(int i, int i2) {
        return substring(i, i2);
    }

    public String toString() {
        return new String(this.value, this.offset, this.length);
    }

    public int hashCode() {
        int i = this.hash;
        if (i == 0 && this.length > 0) {
            for (int i2 = 0; i2 < this.length; i2++) {
                i = this.value[this.offset + i2] + (31 * i);
            }
            this.hash = i;
        }
        return i;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof StringPointer) {
            StringPointer stringPointer = (StringPointer) obj;
            if (this.length == stringPointer.length) {
                char[] cArr = this.value;
                char[] cArr2 = stringPointer.value;
                for (int i = 0; i < this.length; i++) {
                    if (cArr[this.offset + i] != cArr2[stringPointer.offset + i]) {
                        return false;
                    }
                }
                return true;
            }
        }
        return false;
    }

    public int compareTo(StringPointer stringPointer) {
        int i = this.length;
        int i2 = stringPointer.length;
        int min = Math.min(i, i2);
        char[] cArr = this.value;
        char[] cArr2 = stringPointer.value;
        for (int i3 = 0; i3 < min; i3++) {
            char c = cArr[this.offset + i3];
            char c2 = cArr2[stringPointer.offset + i3];
            if (c != c2) {
                return c - c2;
            }
        }
        return i - i2;
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeCharArray(this.value);
        parcel.writeInt(this.offset);
        parcel.writeInt(this.length);
        parcel.writeInt(this.hash);
    }
}
