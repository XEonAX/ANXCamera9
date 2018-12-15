package com.google.zxing.qrcode;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.Writer;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;
import com.google.zxing.qrcode.encoder.ByteMatrix;
import com.google.zxing.qrcode.encoder.Encoder;
import com.google.zxing.qrcode.encoder.QRCode;
import java.util.Map;

public final class QRCodeWriter implements Writer {
    private static final int QUIET_ZONE_SIZE = 4;

    public BitMatrix encode(String contents, BarcodeFormat format, int width, int height) throws WriterException {
        return encode(contents, format, width, height, null);
    }

    public BitMatrix encode(String contents, BarcodeFormat format, int width, int height, Map<EncodeHintType, ?> hints) throws WriterException {
        StringBuilder stringBuilder;
        if (contents.isEmpty()) {
            throw new IllegalArgumentException("Found empty contents");
        } else if (format != BarcodeFormat.QR_CODE) {
            stringBuilder = new StringBuilder("Can only encode QR_CODE, but got ");
            stringBuilder.append(format);
            throw new IllegalArgumentException(stringBuilder.toString());
        } else if (width < 0 || height < 0) {
            stringBuilder = new StringBuilder("Requested dimensions are too small: ");
            stringBuilder.append(width);
            stringBuilder.append('x');
            stringBuilder.append(height);
            throw new IllegalArgumentException(stringBuilder.toString());
        } else {
            ErrorCorrectionLevel errorCorrectionLevel = ErrorCorrectionLevel.L;
            int quietZone = 4;
            if (hints != null) {
                ErrorCorrectionLevel requestedECLevel = (ErrorCorrectionLevel) hints.get(EncodeHintType.ERROR_CORRECTION);
                if (requestedECLevel != null) {
                    errorCorrectionLevel = requestedECLevel;
                }
                Integer quietZoneInt = (Integer) hints.get(EncodeHintType.MARGIN);
                if (quietZoneInt != null) {
                    quietZone = quietZoneInt.intValue();
                }
            }
            return renderResult(Encoder.encode(contents, errorCorrectionLevel, hints), width, height, quietZone);
        }
    }

    private static BitMatrix renderResult(QRCode code, int width, int height, int quietZone) {
        ByteMatrix input = code.getMatrix();
        ByteMatrix input2;
        if (input != null) {
            int inputWidth = input.getWidth();
            int inputHeight = input.getHeight();
            int qrWidth = (quietZone * 2) + inputWidth;
            int qrHeight = (quietZone * 2) + inputHeight;
            int outputWidth = Math.max(width, qrWidth);
            int outputHeight = Math.max(height, qrHeight);
            int multiple = Math.min(outputWidth / qrWidth, outputHeight / qrHeight);
            int leftPadding = (outputWidth - (inputWidth * multiple)) / 2;
            int topPadding = (outputHeight - (inputHeight * multiple)) / 2;
            BitMatrix output = new BitMatrix(outputWidth, outputHeight);
            int inputY = 0;
            int outputY = topPadding;
            while (inputY < inputHeight) {
                int inputHeight2 = inputHeight;
                int inputX = 0;
                inputHeight = leftPadding;
                while (inputX < inputWidth) {
                    int inputWidth2 = inputWidth;
                    input2 = input;
                    if (input.get(inputX, inputY) == (byte) 1) {
                        output.setRegion(inputHeight, outputY, multiple, multiple);
                    }
                    inputX++;
                    inputHeight += multiple;
                    inputWidth = inputWidth2;
                    input = input2;
                }
                inputY++;
                outputY += multiple;
                inputHeight = inputHeight2;
            }
            return output;
        }
        int i = width;
        int i2 = height;
        input2 = input;
        throw new IllegalStateException();
    }
}
