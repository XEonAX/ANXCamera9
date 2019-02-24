package com.google.zxing.oned;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.NotFoundException;
import com.google.zxing.common.BitArray;

public final class EAN8Reader extends UPCEANReader {
    private final int[] decodeMiddleCounters = new int[4];

    protected int decodeMiddle(BitArray row, int[] startRange, StringBuilder result) throws NotFoundException {
        int[] counters = this.decodeMiddleCounters;
        counters[0] = 0;
        counters[1] = 0;
        counters[2] = 0;
        counters[3] = 0;
        int end = row.getSize();
        int rowOffset = startRange[1];
        int x = 0;
        while (x < 4 && rowOffset < end) {
            result.append((char) (48 + UPCEANReader.decodeDigit(row, counters, rowOffset, L_PATTERNS)));
            int rowOffset2 = rowOffset;
            for (int counter : counters) {
                rowOffset2 += counter;
            }
            x++;
            rowOffset = rowOffset2;
        }
        int rowOffset3 = UPCEANReader.findGuardPattern(row, rowOffset, true, MIDDLE_PATTERN)[1];
        rowOffset = 0;
        while (rowOffset < 4 && rowOffset3 < end) {
            result.append((char) (48 + UPCEANReader.decodeDigit(row, counters, rowOffset3, L_PATTERNS)));
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
        return BarcodeFormat.EAN_8;
    }
}
