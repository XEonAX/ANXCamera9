package com.google.zxing.oned;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.DecodeHintType;
import com.google.zxing.NotFoundException;
import com.google.zxing.Result;
import com.google.zxing.ResultPoint;
import com.google.zxing.common.BitArray;
import java.util.Arrays;
import java.util.Map;

public final class CodaBarReader extends OneDReader {
    static final char[] ALPHABET = ALPHABET_STRING.toCharArray();
    private static final String ALPHABET_STRING = "0123456789-$:/.+ABCD";
    static final int[] CHARACTER_ENCODINGS = new int[]{3, 6, 9, 96, 18, 66, 33, 36, 48, 72, 12, 24, 69, 81, 84, 21, 26, 41, 11, 14};
    private static final float MAX_ACCEPTABLE = 2.0f;
    private static final int MIN_CHARACTER_LENGTH = 3;
    private static final float PADDING = 1.5f;
    private static final char[] STARTEND_ENCODING = new char[]{'A', 'B', 'C', 'D'};
    private int counterLength = 0;
    private int[] counters = new int[80];
    private final StringBuilder decodeRowResult = new StringBuilder(20);

    public Result decodeRow(int rowNumber, BitArray row, Map<DecodeHintType, ?> hints) throws NotFoundException {
        int charOffset;
        int i;
        BitArray bitArray;
        int i2;
        Map<DecodeHintType, ?> map;
        int i3 = rowNumber;
        Map map2 = hints;
        int i4 = 0;
        Arrays.fill(this.counters, 0);
        setCounters(row);
        int startOffset = findStartPattern();
        int nextStart = startOffset;
        this.decodeRowResult.setLength(0);
        while (true) {
            charOffset = toNarrowWidePattern(nextStart);
            if (charOffset != -1) {
                this.decodeRowResult.append((char) charOffset);
                nextStart += 8;
                i = 1;
                if ((this.decodeRowResult.length() <= 1 || !arrayContains(STARTEND_ENCODING, ALPHABET[charOffset])) && nextStart < this.counterLength) {
                    bitArray = row;
                }
            } else {
                throw NotFoundException.getNotFoundInstance();
            }
        }
        charOffset = this.counters[nextStart - 1];
        int lastPatternSize = 0;
        int i5 = -8;
        while (i5 < -1) {
            i2 = 1;
            lastPatternSize += this.counters[nextStart + i5];
            i5++;
            i4 = i4;
            map2 = hints;
            bitArray = row;
        }
        if (nextStart >= this.counterLength || charOffset >= lastPatternSize / 2) {
            int i6;
            validatePattern(startOffset);
            int i7 = 0;
            while (i7 < this.decodeRowResult.length()) {
                i6 = i4;
                i2 = i;
                this.decodeRowResult.setCharAt(i7, ALPHABET[this.decodeRowResult.charAt(i7)]);
                i7++;
                i4 = i6;
                i = i2;
                map2 = hints;
                bitArray = row;
            }
            if (arrayContains(STARTEND_ENCODING, this.decodeRowResult.charAt(i4))) {
                if (!arrayContains(STARTEND_ENCODING, this.decodeRowResult.charAt(this.decodeRowResult.length() - i))) {
                    throw NotFoundException.getNotFoundInstance();
                } else if (this.decodeRowResult.length() > 3) {
                    if (map2 == null || !map2.containsKey(DecodeHintType.RETURN_CODABAR_START_END)) {
                        this.decodeRowResult.deleteCharAt(this.decodeRowResult.length() - i);
                        this.decodeRowResult.deleteCharAt(i4);
                    }
                    int runningCount = 0;
                    int i8 = 0;
                    while (i8 < startOffset) {
                        i6 = i4;
                        i2 = i;
                        runningCount += this.counters[i8];
                        i8++;
                        map2 = hints;
                        bitArray = row;
                    }
                    float left = (float) runningCount;
                    i8 = startOffset;
                    while (i8 < nextStart - 1) {
                        i6 = i4;
                        i2 = i;
                        runningCount += this.counters[i8];
                        i8++;
                        map2 = hints;
                        bitArray = row;
                    }
                    i8 = (float) runningCount;
                    return new Result(this.decodeRowResult.toString(), null, new ResultPoint[]{new ResultPoint(left, (float) i3), new ResultPoint(i8, (float) i3)}, BarcodeFormat.CODABAR);
                } else {
                    throw NotFoundException.getNotFoundInstance();
                }
            }
            throw NotFoundException.getNotFoundInstance();
        }
        throw NotFoundException.getNotFoundInstance();
    }

    void validatePattern(int start) throws NotFoundException {
        int pattern;
        int j;
        int i;
        int[] sizes = new int[4];
        int[] counts = new int[4];
        int end = this.decodeRowResult.length() - 1;
        int i2 = 0;
        int pos = start;
        int i3 = 0;
        while (true) {
            pattern = CHARACTER_ENCODINGS[this.decodeRowResult.charAt(i3)];
            for (j = 6; j >= 0; j--) {
                int category = (j & 1) + ((pattern & 1) * 2);
                sizes[category] = sizes[category] + this.counters[pos + j];
                counts[category] = counts[category] + 1;
                pattern >>= 1;
            }
            if (i3 >= end) {
                break;
            }
            pos += 8;
            i3++;
        }
        j = new float[4];
        float[] mins = new float[4];
        for (i = 0; i < 2; i++) {
            mins[i] = 0.0f;
            mins[i + 2] = ((((float) sizes[i]) / ((float) counts[i])) + (((float) sizes[i + 2]) / ((float) counts[i + 2]))) / 2.0f;
            j[i] = mins[i + 2];
            j[i + 2] = ((((float) sizes[i + 2]) * 2.0f) + 1069547520) / ((float) counts[i + 2]);
        }
        i = start;
        loop3:
        while (true) {
            i3 = i2;
            i2 = CHARACTER_ENCODINGS[this.decodeRowResult.charAt(i3)];
            pos = 6;
            while (pos >= 0) {
                pattern = (pos & 1) + ((i2 & 1) * 2);
                int size = this.counters[i + pos];
                if (((float) size) >= mins[pattern] && ((float) size) <= j[pattern]) {
                    i2 >>= 1;
                    pos--;
                }
            }
            if (i3 < end) {
                i += 8;
                i2 = i3 + 1;
            } else {
                return;
            }
        }
        throw NotFoundException.getNotFoundInstance();
    }

    private void setCounters(BitArray row) throws NotFoundException {
        this.counterLength = 0;
        int i = row.getNextUnset(0);
        int end = row.getSize();
        if (i < end) {
            boolean isWhite = true;
            int count = 0;
            while (i < end) {
                if ((row.get(i) ^ isWhite) != 0) {
                    count++;
                } else {
                    counterAppend(count);
                    count = 1;
                    isWhite = !isWhite;
                }
                i++;
            }
            counterAppend(count);
            return;
        }
        throw NotFoundException.getNotFoundInstance();
    }

    private void counterAppend(int e) {
        this.counters[this.counterLength] = e;
        this.counterLength++;
        if (this.counterLength >= this.counters.length) {
            int[] temp = new int[(this.counterLength * 2)];
            System.arraycopy(this.counters, 0, temp, 0, this.counterLength);
            this.counters = temp;
        }
    }

    private int findStartPattern() throws NotFoundException {
        int i = 1;
        while (i < this.counterLength) {
            int charOffset = toNarrowWidePattern(i);
            if (charOffset != -1 && arrayContains(STARTEND_ENCODING, ALPHABET[charOffset])) {
                int patternSize = 0;
                for (int j = i; j < i + 7; j++) {
                    patternSize += this.counters[j];
                }
                if (i == 1 || this.counters[i - 1] >= patternSize / 2) {
                    return i;
                }
            }
            i += 2;
        }
        throw NotFoundException.getNotFoundInstance();
    }

    static boolean arrayContains(char[] array, char key) {
        if (array != null) {
            for (char c : array) {
                if (c == key) {
                    return true;
                }
            }
        }
        return false;
    }

    private int toNarrowWidePattern(int position) {
        int end = position + 7;
        if (end >= this.counterLength) {
            return -1;
        }
        int j;
        int currentCounter;
        int j2;
        int currentCounter2;
        int i;
        int[] theCounters = this.counters;
        int maxBar = 0;
        int minBar = Integer.MAX_VALUE;
        for (j = position; j < end; j += 2) {
            currentCounter = theCounters[j];
            if (currentCounter < minBar) {
                minBar = currentCounter;
            }
            if (currentCounter > maxBar) {
                maxBar = currentCounter;
            }
        }
        currentCounter = (minBar + maxBar) / 2;
        j = 0;
        int minSpace = Integer.MAX_VALUE;
        for (j2 = position + 1; j2 < end; j2 += 2) {
            currentCounter2 = theCounters[j2];
            if (currentCounter2 < minSpace) {
                minSpace = currentCounter2;
            }
            if (currentCounter2 > j) {
                j = currentCounter2;
            }
        }
        currentCounter2 = (minSpace + j) / 2;
        j2 = 128;
        int pattern = 0;
        for (i = 0; i < 7; i++) {
            j2 >>= 1;
            if (theCounters[position + i] > ((i & 1) == 0 ? currentCounter : currentCounter2)) {
                pattern |= j2;
            }
        }
        for (i = 0; i < CHARACTER_ENCODINGS.length; i++) {
            if (CHARACTER_ENCODINGS[i] == pattern) {
                return i;
            }
        }
        return -1;
    }
}
