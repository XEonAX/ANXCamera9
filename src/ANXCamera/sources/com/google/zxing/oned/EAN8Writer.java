package com.google.zxing.oned;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import java.util.Map;

public final class EAN8Writer extends UPCEANWriter {
    private static final int CODE_WIDTH = 67;

    public BitMatrix encode(String contents, BarcodeFormat format, int width, int height, Map<EncodeHintType, ?> hints) throws WriterException {
        if (format == BarcodeFormat.EAN_8) {
            return super.encode(contents, format, width, height, hints);
        }
        StringBuilder stringBuilder = new StringBuilder("Can only encode EAN_8, but got ");
        stringBuilder.append(format);
        throw new IllegalArgumentException(stringBuilder.toString());
    }

    public boolean[] encode(String contents) {
        if (contents.length() == 8) {
            int i;
            boolean[] result = new boolean[67];
            int pos = 0 + OneDimensionalCodeWriter.appendPattern(result, 0, UPCEANReader.START_END_PATTERN, true);
            for (i = 0; i <= 3; i++) {
                pos += OneDimensionalCodeWriter.appendPattern(result, pos, UPCEANReader.L_PATTERNS[Integer.parseInt(contents.substring(i, i + 1))], false);
            }
            pos += OneDimensionalCodeWriter.appendPattern(result, pos, UPCEANReader.MIDDLE_PATTERN, false);
            for (i = 4; i <= 7; i++) {
                pos += OneDimensionalCodeWriter.appendPattern(result, pos, UPCEANReader.L_PATTERNS[Integer.parseInt(contents.substring(i, i + 1))], true);
            }
            OneDimensionalCodeWriter.appendPattern(result, pos, UPCEANReader.START_END_PATTERN, true);
            return result;
        }
        StringBuilder stringBuilder = new StringBuilder("Requested contents should be 8 digits long, but got ");
        stringBuilder.append(contents.length());
        throw new IllegalArgumentException(stringBuilder.toString());
    }
}
