package com.google.zxing.aztec.encoder;

import android.support.v4.internal.view.SupportMenu;
import com.google.zxing.common.BitArray;
import java.util.Deque;
import java.util.LinkedList;

final class State {
    static final State INITIAL_STATE = new State(Token.EMPTY, 0, 0, 0);
    private final int binaryShiftByteCount;
    private final int bitCount;
    private final int mode;
    private final Token token;

    private State(Token token, int mode, int binaryBytes, int bitCount) {
        this.token = token;
        this.mode = mode;
        this.binaryShiftByteCount = binaryBytes;
        this.bitCount = bitCount;
    }

    int getMode() {
        return this.mode;
    }

    Token getToken() {
        return this.token;
    }

    int getBinaryShiftByteCount() {
        return this.binaryShiftByteCount;
    }

    int getBitCount() {
        return this.bitCount;
    }

    State latchAndAppend(int mode, int value) {
        int latch;
        int bitCount = this.bitCount;
        Token token = this.token;
        if (mode != this.mode) {
            latch = HighLevelEncoder.LATCH_TABLE[this.mode][mode];
            token = token.add(SupportMenu.USER_MASK & latch, latch >> 16);
            bitCount += latch >> 16;
        }
        latch = mode == 2 ? 4 : 5;
        return new State(token.add(value, latch), mode, 0, bitCount + latch);
    }

    State shiftAndAppend(int mode, int value) {
        Token token = this.token;
        int thisModeBitCount = this.mode == 2 ? 4 : 5;
        return new State(token.add(HighLevelEncoder.SHIFT_TABLE[this.mode][mode], thisModeBitCount).add(value, 5), this.mode, 0, (this.bitCount + thisModeBitCount) + 5);
    }

    State addBinaryShiftChar(int index) {
        int latch;
        Token token = this.token;
        int mode = this.mode;
        int bitCount = this.bitCount;
        if (this.mode == 4 || this.mode == 2) {
            latch = HighLevelEncoder.LATCH_TABLE[mode][0];
            token = token.add(SupportMenu.USER_MASK & latch, latch >> 16);
            bitCount += latch >> 16;
            mode = 0;
        }
        latch = (this.binaryShiftByteCount == 0 || this.binaryShiftByteCount == 31) ? 18 : this.binaryShiftByteCount == 62 ? 9 : 8;
        State result = new State(token, mode, this.binaryShiftByteCount + 1, bitCount + latch);
        if (result.binaryShiftByteCount == 2078) {
            return result.endBinaryShift(index + 1);
        }
        return result;
    }

    State endBinaryShift(int index) {
        if (this.binaryShiftByteCount == 0) {
            return this;
        }
        return new State(this.token.addBinaryShift(index - this.binaryShiftByteCount, this.binaryShiftByteCount), this.mode, 0, this.bitCount);
    }

    boolean isBetterThanOrEqualTo(State other) {
        int mySize = this.bitCount + (HighLevelEncoder.LATCH_TABLE[this.mode][other.mode] >> 16);
        if (other.binaryShiftByteCount > 0 && (this.binaryShiftByteCount == 0 || this.binaryShiftByteCount > other.binaryShiftByteCount)) {
            mySize += 10;
        }
        return mySize <= other.bitCount;
    }

    BitArray toBitArray(byte[] text) {
        Token token;
        Deque<Token> symbols = new LinkedList();
        for (token = endBinaryShift(text.length).token; token != null; token = token.getPrevious()) {
            symbols.addFirst(token);
        }
        Token bitArray = new BitArray();
        for (Token token2 : symbols) {
            token2.appendTo(bitArray, text);
        }
        return bitArray;
    }

    public String toString() {
        return String.format("%s bits=%d bytes=%d", new Object[]{HighLevelEncoder.MODE_NAMES[this.mode], Integer.valueOf(this.bitCount), Integer.valueOf(this.binaryShiftByteCount)});
    }
}
