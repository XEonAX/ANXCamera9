package com.google.zxing.oned.rss.expanded;

import com.google.zxing.common.BitArray;
import java.util.List;

final class BitArrayBuilder {
    private BitArrayBuilder() {
    }

    static BitArray buildBitArray(List<ExpandedPair> pairs) {
        int i;
        int charNumber = (pairs.size() * 2) - 1;
        if (((ExpandedPair) pairs.get(pairs.size() - 1)).getRightChar() == null) {
            charNumber--;
        }
        BitArray binary = new BitArray(12 * charNumber);
        int accPos = 0;
        int firstValue = ((ExpandedPair) pairs.get(0)).getRightChar().getValue();
        for (i = 11; i >= 0; i--) {
            if (((1 << i) & firstValue) != 0) {
                binary.set(accPos);
            }
            accPos++;
        }
        for (int i2 = 1; i2 < pairs.size(); i2++) {
            ExpandedPair currentPair = (ExpandedPair) pairs.get(i2);
            int leftValue = currentPair.getLeftChar().getValue();
            for (i = 11; i >= 0; i--) {
                if (((1 << i) & leftValue) != 0) {
                    binary.set(accPos);
                }
                accPos++;
            }
            if (currentPair.getRightChar() != 0) {
                i = currentPair.getRightChar().getValue();
                for (int j = 11; j >= 0; j--) {
                    if (((1 << j) & i) != 0) {
                        binary.set(accPos);
                    }
                    accPos++;
                }
            }
        }
        return binary;
    }
}
