package com.google.zxing.oned;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.ChecksumException;
import com.google.zxing.DecodeHintType;
import com.google.zxing.FormatException;
import com.google.zxing.NotFoundException;
import com.google.zxing.Result;
import com.google.zxing.ResultPoint;
import com.google.zxing.common.BitArray;
import java.util.Arrays;
import java.util.Map;

public final class Code39Reader extends OneDReader {
    private static final char[] ALPHABET = ALPHABET_STRING.toCharArray();
    static final String ALPHABET_STRING = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ-. *$/+%";
    private static final int ASTERISK_ENCODING = CHARACTER_ENCODINGS[39];
    static final int[] CHARACTER_ENCODINGS = new int[]{52, 289, 97, 352, 49, 304, 112, 37, 292, 100, 265, 73, 328, 25, 280, 88, 13, 268, 76, 28, 259, 67, 322, 19, 274, 82, 7, 262, 70, 22, 385, 193, 448, 145, 400, 208, 133, 388, 196, 148, 168, 162, 138, 42};
    private final int[] counters;
    private final StringBuilder decodeRowResult;
    private final boolean extendedMode;
    private final boolean usingCheckDigit;

    public Code39Reader() {
        this(false);
    }

    public Code39Reader(boolean usingCheckDigit) {
        this(usingCheckDigit, false);
    }

    public Code39Reader(boolean usingCheckDigit, boolean extendedMode) {
        this.usingCheckDigit = usingCheckDigit;
        this.extendedMode = extendedMode;
        this.decodeRowResult = new StringBuilder(20);
        this.counters = new int[9];
    }

    public Result decodeRow(int rowNumber, BitArray row, Map<DecodeHintType, ?> map) throws NotFoundException, ChecksumException, FormatException {
        Code39Reader code39Reader = this;
        int i = rowNumber;
        BitArray bitArray = row;
        int[] theCounters = code39Reader.counters;
        Arrays.fill(theCounters, 0);
        StringBuilder result = code39Reader.decodeRowResult;
        result.setLength(0);
        int[] start = findAsteriskPattern(bitArray, theCounters);
        int nextStart = bitArray.getNextSet(start[1]);
        int end = row.getSize();
        while (true) {
            OneDReader.recordPattern(bitArray, nextStart, theCounters);
            int pattern = toNarrowWidePattern(theCounters);
            if (pattern >= 0) {
                StringBuilder result2;
                int i2;
                char decodedChar = patternToChar(pattern);
                result.append(decodedChar);
                int lastStart = nextStart;
                int nextStart2 = nextStart;
                nextStart = 0;
                while (nextStart < theCounters.length) {
                    result2 = result;
                    i2 = 1;
                    result = null;
                    nextStart2 += theCounters[nextStart];
                    nextStart++;
                    result = result2;
                    code39Reader = this;
                    bitArray = row;
                }
                nextStart = bitArray.getNextSet(nextStart2);
                if (decodedChar == '*') {
                    result.setLength(result.length() - 1);
                    nextStart2 = 0;
                    pattern = 0;
                    while (pattern < theCounters.length) {
                        result2 = result;
                        i2 = 1;
                        result = null;
                        nextStart2 += theCounters[pattern];
                        pattern++;
                        result = result2;
                        code39Reader = this;
                        bitArray = row;
                    }
                    pattern = (nextStart - lastStart) - nextStart2;
                    if (nextStart == end || pattern * 2 >= nextStart2) {
                        if (code39Reader.usingCheckDigit) {
                            int max = result.length() - 1;
                            i2 = 0;
                            for (int i3 = 0; i3 < max; i3++) {
                                i2 += ALPHABET_STRING.indexOf(code39Reader.decodeRowResult.charAt(i3));
                            }
                            if (result.charAt(max) == ALPHABET[i2 % 43]) {
                                result.setLength(max);
                            } else {
                                throw ChecksumException.getChecksumInstance();
                            }
                        }
                        if (result.length() != 0) {
                            String resultString;
                            if (code39Reader.extendedMode) {
                                resultString = decodeExtended(result);
                            } else {
                                resultString = result.toString();
                            }
                            float right = ((float) lastStart) + (((float) nextStart2) / 2.0f);
                            r13 = new ResultPoint[2];
                            r13[0] = new ResultPoint(((float) (start[1] + start[0])) / 2.0f, (float) i);
                            r13[1] = new ResultPoint(right, (float) i);
                            return new Result(resultString, null, r13, BarcodeFormat.CODE_39);
                        }
                        throw NotFoundException.getNotFoundInstance();
                    }
                    throw NotFoundException.getNotFoundInstance();
                }
            } else {
                throw NotFoundException.getNotFoundInstance();
            }
        }
    }

    private static int[] findAsteriskPattern(BitArray row, int[] counters) throws NotFoundException {
        int width = row.getSize();
        int rowOffset = row.getNextSet(0);
        int counterPosition = 0;
        int patternStart = rowOffset;
        boolean isWhite = false;
        int patternLength = counters.length;
        int i = rowOffset;
        while (i < width) {
            boolean z = true;
            if ((row.get(i) ^ isWhite) != 0) {
                counters[counterPosition] = counters[counterPosition] + 1;
            } else {
                if (counterPosition != patternLength - 1) {
                    counterPosition++;
                } else if (toNarrowWidePattern(counters) == ASTERISK_ENCODING && row.isRange(Math.max(0, patternStart - ((i - patternStart) / 2)), patternStart, false)) {
                    return new int[]{patternStart, i};
                } else {
                    patternStart += counters[0] + counters[1];
                    System.arraycopy(counters, 2, counters, 0, patternLength - 2);
                    counters[patternLength - 2] = 0;
                    counters[patternLength - 1] = 0;
                    counterPosition--;
                }
                counters[counterPosition] = 1;
                if (isWhite) {
                    z = false;
                }
                isWhite = z;
            }
            i++;
        }
        throw NotFoundException.getNotFoundInstance();
    }

    private static int toNarrowWidePattern(int[] counters) {
        int numCounters = counters.length;
        int maxNarrowCounter = 0;
        while (true) {
            int i;
            int minCounter = Integer.MAX_VALUE;
            for (int counter : counters) {
                if (counter < minCounter && counter > maxNarrowCounter) {
                    minCounter = counter;
                }
            }
            int counter2 = minCounter;
            maxNarrowCounter = 0;
            int minCounter2 = 0;
            int i2 = 0;
            for (i = 0; i < numCounters; i++) {
                int counter3 = counters[i];
                if (counter3 > counter2) {
                    i2 |= 1 << ((numCounters - 1) - i);
                    maxNarrowCounter++;
                    minCounter2 += counter3;
                }
            }
            if (maxNarrowCounter == 3) {
                for (int i3 = 0; i3 < numCounters && maxNarrowCounter > 0; i3++) {
                    i = counters[i3];
                    if (i > counter2) {
                        maxNarrowCounter--;
                        if (i * 2 >= minCounter2) {
                            return -1;
                        }
                    }
                }
                return i2;
            } else if (maxNarrowCounter <= 3) {
                return -1;
            } else {
                maxNarrowCounter = counter2;
            }
        }
    }

    private static char patternToChar(int pattern) throws NotFoundException {
        for (int i = 0; i < CHARACTER_ENCODINGS.length; i++) {
            if (CHARACTER_ENCODINGS[i] == pattern) {
                return ALPHABET[i];
            }
        }
        throw NotFoundException.getNotFoundInstance();
    }

    private static String decodeExtended(CharSequence encoded) throws FormatException {
        int length = encoded.length();
        StringBuilder decoded = new StringBuilder(length);
        int i = 0;
        while (i < length) {
            char c = encoded.charAt(i);
            if (c == '+' || c == '$' || c == '%' || c == '/') {
                char next = encoded.charAt(i + 1);
                char decodedChar = 0;
                if (c != '+') {
                    if (c != '/') {
                        switch (c) {
                            case '$':
                                if (next >= 'A' && next <= 'Z') {
                                    decodedChar = (char) (next - 64);
                                    break;
                                }
                                throw FormatException.getFormatInstance();
                                break;
                            case '%':
                                if (next < 'A' || next > 'E') {
                                    if (next >= 'F' && next <= 'W') {
                                        decodedChar = (char) (next - 11);
                                        break;
                                    }
                                    throw FormatException.getFormatInstance();
                                }
                                decodedChar = (char) (next - 38);
                                break;
                                break;
                        }
                    } else if (next >= 'A' && next <= 'O') {
                        decodedChar = (char) (next - 32);
                    } else if (next == 'Z') {
                        decodedChar = ':';
                    } else {
                        throw FormatException.getFormatInstance();
                    }
                } else if (next < 'A' || next > 'Z') {
                    throw FormatException.getFormatInstance();
                } else {
                    decodedChar = (char) (next + 32);
                }
                decoded.append(decodedChar);
                i++;
            } else {
                decoded.append(c);
            }
            i++;
        }
        return decoded.toString();
    }
}
