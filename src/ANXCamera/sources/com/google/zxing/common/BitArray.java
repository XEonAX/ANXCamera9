package com.google.zxing.common;

import java.util.Arrays;

public final class BitArray implements Cloneable {
    private int[] bits;
    private int size;

    public BitArray() {
        this.size = 0;
        this.bits = new int[1];
    }

    public BitArray(int size) {
        this.size = size;
        this.bits = makeArray(size);
    }

    BitArray(int[] bits, int size) {
        this.bits = bits;
        this.size = size;
    }

    public int getSize() {
        return this.size;
    }

    public int getSizeInBytes() {
        return (this.size + 7) / 8;
    }

    private void ensureCapacity(int size) {
        if (size > this.bits.length * 32) {
            int[] newBits = makeArray(size);
            System.arraycopy(this.bits, 0, newBits, 0, this.bits.length);
            this.bits = newBits;
        }
    }

    public boolean get(int i) {
        return (this.bits[i / 32] & (1 << (i & 31))) != 0;
    }

    public void set(int i) {
        int[] iArr = this.bits;
        int i2 = i / 32;
        iArr[i2] = iArr[i2] | (1 << (i & 31));
    }

    public void flip(int i) {
        int[] iArr = this.bits;
        int i2 = i / 32;
        iArr[i2] = iArr[i2] ^ (1 << (i & 31));
    }

    public int getNextSet(int from) {
        if (from >= this.size) {
            return this.size;
        }
        int bitsOffset = from / 32;
        int currentBits = this.bits[bitsOffset] & (~((1 << (from & 31)) - 1));
        while (currentBits == 0) {
            bitsOffset++;
            if (bitsOffset == this.bits.length) {
                return this.size;
            }
            currentBits = this.bits[bitsOffset];
        }
        int result = (bitsOffset * 32) + Integer.numberOfTrailingZeros(currentBits);
        return result > this.size ? this.size : result;
    }

    public int getNextUnset(int from) {
        if (from >= this.size) {
            return this.size;
        }
        int bitsOffset = from / 32;
        int currentBits = (~this.bits[bitsOffset]) & (~((1 << (from & 31)) - 1));
        while (currentBits == 0) {
            bitsOffset++;
            if (bitsOffset == this.bits.length) {
                return this.size;
            }
            currentBits = ~this.bits[bitsOffset];
        }
        int result = (bitsOffset * 32) + Integer.numberOfTrailingZeros(currentBits);
        return result > this.size ? this.size : result;
    }

    public void setBulk(int i, int newBits) {
        this.bits[i / 32] = newBits;
    }

    public void setRange(int start, int end) {
        if (end < start) {
            throw new IllegalArgumentException();
        } else if (end != start) {
            int end2 = end - 1;
            int firstInt = start / 32;
            int lastInt = end2 / 32;
            int i = firstInt;
            while (i <= lastInt) {
                int firstBit = i > firstInt ? 0 : start & 31;
                int lastBit = i < lastInt ? 31 : end2 & 31;
                if (firstBit == 0 && lastBit == 31) {
                    end = -1;
                } else {
                    end = 0;
                    for (int j = firstBit; j <= lastBit; j++) {
                        end |= 1 << j;
                    }
                }
                int[] iArr = this.bits;
                iArr[i] = iArr[i] | end;
                i++;
            }
        }
    }

    public void clear() {
        int max = this.bits.length;
        for (int i = 0; i < max; i++) {
            this.bits[i] = 0;
        }
    }

    public boolean isRange(int start, int end, boolean value) {
        if (end < start) {
            throw new IllegalArgumentException();
        } else if (end == start) {
            return true;
        } else {
            int end2 = end - 1;
            int firstInt = start / 32;
            int lastInt = end2 / 32;
            int i = firstInt;
            while (i <= lastInt) {
                int firstBit = i > firstInt ? 0 : start & 31;
                int lastBit = i < lastInt ? 31 : end2 & 31;
                if (firstBit == 0 && lastBit == 31) {
                    end = -1;
                } else {
                    end = 0;
                    for (int j = firstBit; j <= lastBit; j++) {
                        end |= 1 << j;
                    }
                }
                if ((this.bits[i] & end) != (value ? end : false)) {
                    return false;
                }
                i++;
            }
            return true;
        }
    }

    public void appendBit(boolean bit) {
        ensureCapacity(this.size + 1);
        if (bit) {
            int[] iArr = this.bits;
            int i = this.size / 32;
            iArr[i] = iArr[i] | (1 << (this.size & 31));
        }
        this.size++;
    }

    public void appendBits(int value, int numBits) {
        if (numBits < 0 || numBits > 32) {
            throw new IllegalArgumentException("Num bits must be between 0 and 32");
        }
        ensureCapacity(this.size + numBits);
        for (int numBitsLeft = numBits; numBitsLeft > 0; numBitsLeft--) {
            boolean z = true;
            if (((value >> (numBitsLeft - 1)) & 1) != 1) {
                z = false;
            }
            appendBit(z);
        }
    }

    public void appendBitArray(BitArray other) {
        int otherSize = other.size;
        ensureCapacity(this.size + otherSize);
        for (int i = 0; i < otherSize; i++) {
            appendBit(other.get(i));
        }
    }

    public void xor(BitArray other) {
        if (this.bits.length == other.bits.length) {
            for (int i = 0; i < this.bits.length; i++) {
                int[] iArr = this.bits;
                iArr[i] = iArr[i] ^ other.bits[i];
            }
            return;
        }
        throw new IllegalArgumentException("Sizes don't match");
    }

    public void toBytes(int bitOffset, byte[] array, int offset, int numBytes) {
        for (int i = 0; i < numBytes; i++) {
            int theByte = 0;
            for (int j = 0; j < 8; j++) {
                if (get(bitOffset)) {
                    theByte |= 1 << (7 - j);
                }
                bitOffset++;
            }
            array[offset + i] = (byte) theByte;
        }
    }

    public int[] getBitArray() {
        return this.bits;
    }

    public void reverse() {
        int i;
        int[] newBits = new int[this.bits.length];
        int len = (this.size - 1) / 32;
        int oldBitsLen = len + 1;
        for (i = 0; i < oldBitsLen; i++) {
            long x = (long) this.bits[i];
            x = ((x >> 1) & 1431655765) | ((1431655765 & x) << 1);
            x = ((x >> 2) & 858993459) | ((858993459 & x) << 2);
            x = ((x >> 4) & 252645135) | ((252645135 & x) << 4);
            x = ((x >> 8) & 16711935) | ((16711935 & x) << 8);
            newBits[len - i] = (int) (((x >> 16) & 65535) | ((65535 & x) << 16));
        }
        if (this.size != oldBitsLen * 32) {
            int i2;
            i = (oldBitsLen * 32) - this.size;
            int mask = 1;
            for (i2 = 0; i2 < 31 - i; i2++) {
                mask = (mask << 1) | 1;
            }
            int currentInt = (newBits[0] >> i) & mask;
            for (i2 = 1; i2 < oldBitsLen; i2++) {
                int nextInt = newBits[i2];
                newBits[i2 - 1] = currentInt | (nextInt << (32 - i));
                currentInt = (nextInt >> i) & mask;
            }
            newBits[oldBitsLen - 1] = currentInt;
        }
        this.bits = newBits;
    }

    private static int[] makeArray(int size) {
        return new int[((size + 31) / 32)];
    }

    public boolean equals(Object o) {
        boolean z = false;
        if (!(o instanceof BitArray)) {
            return false;
        }
        BitArray other = (BitArray) o;
        if (this.size == other.size && Arrays.equals(this.bits, other.bits)) {
            z = true;
        }
        return z;
    }

    public int hashCode() {
        return (31 * this.size) + Arrays.hashCode(this.bits);
    }

    public String toString() {
        StringBuilder result = new StringBuilder(this.size);
        for (int i = 0; i < this.size; i++) {
            if ((i & 7) == 0) {
                result.append(' ');
            }
            result.append(get(i) ? 'X' : '.');
        }
        return result.toString();
    }

    public BitArray clone() {
        return new BitArray((int[]) this.bits.clone(), this.size);
    }
}
