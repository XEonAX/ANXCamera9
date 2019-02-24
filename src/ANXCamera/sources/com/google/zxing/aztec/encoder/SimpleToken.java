package com.google.zxing.aztec.encoder;

import com.google.zxing.common.BitArray;

final class SimpleToken extends Token {
    private final short bitCount;
    private final short value;

    SimpleToken(Token previous, int value, int bitCount) {
        super(previous);
        this.value = (short) value;
        this.bitCount = (short) bitCount;
    }

    void appendTo(BitArray bitArray, byte[] text) {
        bitArray.appendBits(this.value, this.bitCount);
    }

    public String toString() {
        int value = (this.value & ((1 << this.bitCount) - 1)) | (1 << this.bitCount);
        StringBuilder stringBuilder = new StringBuilder(String.valueOf('<'));
        stringBuilder.append(Integer.toBinaryString((1 << this.bitCount) | value).substring(1));
        stringBuilder.append('>');
        return stringBuilder.toString();
    }
}
