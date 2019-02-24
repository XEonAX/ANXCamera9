package com.google.zxing.pdf417;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.Writer;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.pdf417.encoder.Compaction;
import com.google.zxing.pdf417.encoder.Dimensions;
import com.google.zxing.pdf417.encoder.PDF417;
import java.lang.reflect.Array;
import java.nio.charset.Charset;
import java.util.Map;

public final class PDF417Writer implements Writer {
    static final int WHITE_SPACE = 30;

    public BitMatrix encode(String contents, BarcodeFormat format, int width, int height, Map<EncodeHintType, ?> hints) throws WriterException {
        if (format == BarcodeFormat.PDF_417) {
            PDF417 encoder = new PDF417();
            int margin = 30;
            if (hints != null) {
                if (hints.containsKey(EncodeHintType.PDF417_COMPACT)) {
                    encoder.setCompact(((Boolean) hints.get(EncodeHintType.PDF417_COMPACT)).booleanValue());
                }
                if (hints.containsKey(EncodeHintType.PDF417_COMPACTION)) {
                    encoder.setCompaction((Compaction) hints.get(EncodeHintType.PDF417_COMPACTION));
                }
                if (hints.containsKey(EncodeHintType.PDF417_DIMENSIONS)) {
                    Dimensions dimensions = (Dimensions) hints.get(EncodeHintType.PDF417_DIMENSIONS);
                    encoder.setDimensions(dimensions.getMaxCols(), dimensions.getMinCols(), dimensions.getMaxRows(), dimensions.getMinRows());
                }
                if (hints.containsKey(EncodeHintType.MARGIN)) {
                    margin = ((Number) hints.get(EncodeHintType.MARGIN)).intValue();
                }
                if (hints.containsKey(EncodeHintType.CHARACTER_SET)) {
                    encoder.setEncoding(Charset.forName((String) hints.get(EncodeHintType.CHARACTER_SET)));
                }
            }
            return bitMatrixFromEncoder(encoder, contents, width, height, margin);
        }
        StringBuilder stringBuilder = new StringBuilder("Can only encode PDF_417, but got ");
        stringBuilder.append(format);
        throw new IllegalArgumentException(stringBuilder.toString());
    }

    public BitMatrix encode(String contents, BarcodeFormat format, int width, int height) throws WriterException {
        return encode(contents, format, width, height, null);
    }

    private static BitMatrix bitMatrixFromEncoder(PDF417 encoder, String contents, int width, int height, int margin) throws WriterException {
        int scale;
        encoder.generateBarcodeLogic(contents, 2);
        byte[][] originalScale = encoder.getBarcodeMatrix().getScaledMatrix(2, 4 * 2);
        boolean rotated = false;
        if (((height > width ? 1 : 0) ^ (originalScale[0].length < originalScale.length ? 1 : 0)) != 0) {
            originalScale = rotateArray(originalScale);
            rotated = true;
        }
        int scaleX = width / originalScale[0].length;
        int scaleY = height / originalScale.length;
        if (scaleX < scaleY) {
            scale = scaleX;
        } else {
            scale = scaleY;
        }
        if (scale <= 1) {
            return bitMatrixFrombitArray(originalScale, margin);
        }
        byte[][] scaledMatrix = encoder.getBarcodeMatrix().getScaledMatrix(scale * 2, (scale * 4) * 2);
        if (rotated) {
            scaledMatrix = rotateArray(scaledMatrix);
        }
        return bitMatrixFrombitArray(scaledMatrix, margin);
    }

    private static BitMatrix bitMatrixFrombitArray(byte[][] input, int margin) {
        BitMatrix output = new BitMatrix(input[0].length + (2 * margin), input.length + (2 * margin));
        output.clear();
        int y = 0;
        int yOutput = (output.getHeight() - margin) - 1;
        while (y < input.length) {
            for (int x = 0; x < input[0].length; x++) {
                if (input[y][x] == (byte) 1) {
                    output.set(x + margin, yOutput);
                }
            }
            y++;
            yOutput--;
        }
        return output;
    }

    private static byte[][] rotateArray(byte[][] bitarray) {
        byte[][] temp = (byte[][]) Array.newInstance(byte.class, new int[]{bitarray[0].length, bitarray.length});
        for (int ii = 0; ii < bitarray.length; ii++) {
            int inverseii = (bitarray.length - ii) - 1;
            for (int jj = 0; jj < bitarray[0].length; jj++) {
                temp[jj][inverseii] = bitarray[ii][jj];
            }
        }
        return temp;
    }
}
