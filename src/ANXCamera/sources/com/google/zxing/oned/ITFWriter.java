package com.google.zxing.oned;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import java.util.Map;

public final class ITFWriter extends OneDimensionalCodeWriter {
    private static final int[] END_PATTERN = new int[]{3, 1, 1};
    private static final int[] START_PATTERN = new int[]{1, 1, 1, 1};

    public BitMatrix encode(String contents, BarcodeFormat format, int width, int height, Map<EncodeHintType, ?> hints) throws WriterException {
        if (format == BarcodeFormat.ITF) {
            return super.encode(contents, format, width, height, hints);
        }
        StringBuilder stringBuilder = new StringBuilder("Can only encode ITF, but got ");
        stringBuilder.append(format);
        throw new IllegalArgumentException(stringBuilder.toString());
    }

    public boolean[] encode(String contents) {
        int length = contents.length();
        if (length % 2 != 0) {
            throw new IllegalArgumentException("The lenght of the input should be even");
        } else if (length <= 80) {
            boolean[] result = new boolean[(9 + (9 * length))];
            int pos = OneDimensionalCodeWriter.appendPattern(result, 0, START_PATTERN, true);
            for (int i = 0; i < length; i += 2) {
                int one = Character.digit(contents.charAt(i), 10);
                int two = Character.digit(contents.charAt(i + 1), 10);
                int[] encoding = new int[18];
                for (int j = 0; j < 5; j++) {
                    encoding[2 * j] = ITFReader.PATTERNS[one][j];
                    encoding[(2 * j) + 1] = ITFReader.PATTERNS[two][j];
                }
                pos += OneDimensionalCodeWriter.appendPattern(result, pos, encoding, true);
            }
            OneDimensionalCodeWriter.appendPattern(result, pos, END_PATTERN, true);
            return result;
        } else {
            StringBuilder stringBuilder = new StringBuilder("Requested contents should be less than 80 digits long, but got ");
            stringBuilder.append(length);
            throw new IllegalArgumentException(stringBuilder.toString());
        }
    }
}
