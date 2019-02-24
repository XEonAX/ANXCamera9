package com.google.zxing.oned;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.NotFoundException;
import com.google.zxing.common.BitArray;

public final class EAN13Reader extends UPCEANReader {
    static final int[] FIRST_DIGIT_ENCODINGS;
    private final int[] decodeMiddleCounters = new int[4];

    static {
        int[] iArr = new int[10];
        iArr[1] = 11;
        iArr[2] = 13;
        iArr[3] = 14;
        iArr[4] = 19;
        iArr[5] = 25;
        iArr[6] = 28;
        iArr[7] = 21;
        iArr[8] = 22;
        iArr[9] = 26;
        FIRST_DIGIT_ENCODINGS = iArr;
    }

    protected int decodeMiddle(BitArray row, int[] startRange, StringBuilder resultString) throws NotFoundException {
        BitArray bitArray = row;
        StringBuilder stringBuilder = resultString;
        int[] counters = this.decodeMiddleCounters;
        counters[0] = 0;
        counters[1] = 0;
        counters[2] = 0;
        counters[3] = 0;
        int end = row.getSize();
        int rowOffset = startRange[1];
        int lgPatternFound = 0;
        int x = 0;
        while (x < 6 && rowOffset < end) {
            int bestMatch = UPCEANReader.decodeDigit(bitArray, counters, rowOffset, L_AND_G_PATTERNS);
            stringBuilder.append((char) (48 + (bestMatch % 10)));
            int rowOffset2 = rowOffset;
            for (int counter : counters) {
                rowOffset2 += counter;
            }
            if (bestMatch >= 10) {
                lgPatternFound = (1 << (5 - x)) | lgPatternFound;
            }
            x++;
            rowOffset = rowOffset2;
        }
        determineFirstDigit(stringBuilder, lgPatternFound);
        int rowOffset3 = UPCEANReader.findGuardPattern(bitArray, rowOffset, true, MIDDLE_PATTERN)[1];
        rowOffset = 0;
        while (rowOffset < 6 && rowOffset3 < end) {
            stringBuilder.append((char) (48 + UPCEANReader.decodeDigit(bitArray, counters, rowOffset3, L_PATTERNS)));
            int rowOffset4 = rowOffset3;
            for (int counter2 : counters) {
                rowOffset4 += counter2;
            }
            rowOffset++;
            rowOffset3 = rowOffset4;
        }
        return rowOffset3;
    }

    BarcodeFormat getBarcodeFormat() {
        return BarcodeFormat.EAN_13;
    }

    private static void determineFirstDigit(StringBuilder resultString, int lgPatternFound) throws NotFoundException {
        for (int d = 0; d < 10; d++) {
            if (lgPatternFound == FIRST_DIGIT_ENCODINGS[d]) {
                resultString.insert(0, (char) (48 + d));
                return;
            }
        }
        throw NotFoundException.getNotFoundInstance();
    }
}
