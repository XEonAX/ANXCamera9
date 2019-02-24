package com.google.zxing.oned.rss.expanded.decoders;

import com.google.zxing.FormatException;
import com.google.zxing.NotFoundException;
import com.google.zxing.common.BitArray;

final class AI01393xDecoder extends AI01decoder {
    private static final int FIRST_THREE_DIGITS_SIZE = 10;
    private static final int HEADER_SIZE = 8;
    private static final int LAST_DIGIT_SIZE = 2;

    AI01393xDecoder(BitArray information) {
        super(information);
    }

    public String parseInformation() throws NotFoundException, FormatException {
        if (getInformation().getSize() >= 48) {
            StringBuilder buf = new StringBuilder();
            encodeCompressedGtin(buf, 8);
            int lastAIdigit = getGeneralDecoder().extractNumericValueFromBitArray(48, 2);
            buf.append("(393");
            buf.append(lastAIdigit);
            buf.append(')');
            int firstThreeDigits = getGeneralDecoder().extractNumericValueFromBitArray(50, 10);
            if (firstThreeDigits / 100 == 0) {
                buf.append('0');
            }
            if (firstThreeDigits / 10 == 0) {
                buf.append('0');
            }
            buf.append(firstThreeDigits);
            buf.append(getGeneralDecoder().decodeGeneralPurposeField(60, null).getNewString());
            return buf.toString();
        }
        throw NotFoundException.getNotFoundInstance();
    }
}
