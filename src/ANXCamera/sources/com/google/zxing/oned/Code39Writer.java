package com.google.zxing.oned;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import java.util.Map;

public final class Code39Writer extends OneDimensionalCodeWriter {
    public BitMatrix encode(String contents, BarcodeFormat format, int width, int height, Map<EncodeHintType, ?> hints) throws WriterException {
        if (format == BarcodeFormat.CODE_39) {
            return super.encode(contents, format, width, height, hints);
        }
        StringBuilder stringBuilder = new StringBuilder("Can only encode CODE_39, but got ");
        stringBuilder.append(format);
        throw new IllegalArgumentException(stringBuilder.toString());
    }

    public boolean[] encode(String contents) {
        int length = contents.length();
        if (length <= 80) {
            int[] widths = new int[9];
            int codeWidth = 25 + length;
            int i = 0;
            while (true) {
                int i2 = 0;
                if (i >= length) {
                    boolean[] result = new boolean[codeWidth];
                    toIntArray(Code39Reader.CHARACTER_ENCODINGS[39], widths);
                    i = OneDimensionalCodeWriter.appendPattern(result, 0, widths, true);
                    int[] narrowWhite = new int[]{1};
                    i += OneDimensionalCodeWriter.appendPattern(result, i, narrowWhite, false);
                    for (int i3 = 0; i3 < length; i3++) {
                        toIntArray(Code39Reader.CHARACTER_ENCODINGS["0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ-. *$/+%".indexOf(contents.charAt(i3))], widths);
                        i += OneDimensionalCodeWriter.appendPattern(result, i, widths, true);
                        i += OneDimensionalCodeWriter.appendPattern(result, i, narrowWhite, false);
                    }
                    toIntArray(Code39Reader.CHARACTER_ENCODINGS[39], widths);
                    OneDimensionalCodeWriter.appendPattern(result, i, widths, true);
                    return result;
                }
                int indexInString = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ-. *$/+%".indexOf(contents.charAt(i));
                if (indexInString >= 0) {
                    toIntArray(Code39Reader.CHARACTER_ENCODINGS[indexInString], widths);
                    while (i2 < widths.length) {
                        codeWidth += widths[i2];
                        i2++;
                    }
                    i++;
                } else {
                    StringBuilder stringBuilder = new StringBuilder("Bad contents: ");
                    stringBuilder.append(contents);
                    throw new IllegalArgumentException(stringBuilder.toString());
                }
            }
        }
        StringBuilder stringBuilder2 = new StringBuilder("Requested contents should be less than 80 digits long, but got ");
        stringBuilder2.append(length);
        throw new IllegalArgumentException(stringBuilder2.toString());
    }

    private static void toIntArray(int a, int[] toReturn) {
        for (int i = 0; i < 9; i++) {
            int i2 = 1;
            if (((1 << (8 - i)) & a) != 0) {
                i2 = 2;
            }
            toReturn[i] = i2;
        }
    }
}
