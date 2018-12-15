package com.google.zxing.qrcode;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.BinaryBitmap;
import com.google.zxing.ChecksumException;
import com.google.zxing.DecodeHintType;
import com.google.zxing.FormatException;
import com.google.zxing.NotFoundException;
import com.google.zxing.Reader;
import com.google.zxing.Result;
import com.google.zxing.ResultMetadataType;
import com.google.zxing.ResultPoint;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.common.DecoderResult;
import com.google.zxing.qrcode.decoder.Decoder;
import com.google.zxing.qrcode.decoder.QRCodeDecoderMetaData;
import com.google.zxing.qrcode.detector.Detector;
import java.util.List;
import java.util.Map;

public class QRCodeReader implements Reader {
    private static final ResultPoint[] NO_POINTS = new ResultPoint[0];
    private final Decoder decoder = new Decoder();

    protected final Decoder getDecoder() {
        return this.decoder;
    }

    public Result decode(BinaryBitmap image) throws NotFoundException, ChecksumException, FormatException {
        return decode(image, null);
    }

    public final Result decode(BinaryBitmap image, Map<DecodeHintType, ?> hints) throws NotFoundException, ChecksumException, FormatException {
        ResultPoint[] points;
        DecoderResult decoderResult;
        if (hints == null || !hints.containsKey(DecodeHintType.PURE_BARCODE)) {
            points = new Detector(image.getBlackMatrix()).detect(hints);
            decoderResult = this.decoder.decode(points.getBits(), (Map) hints);
            points = points.getPoints();
        } else {
            decoderResult = this.decoder.decode(extractPureBits(image.getBlackMatrix()), (Map) hints);
            points = NO_POINTS;
        }
        if (decoderResult.getOther() instanceof QRCodeDecoderMetaData) {
            ((QRCodeDecoderMetaData) decoderResult.getOther()).applyMirroredCorrection(points);
        }
        Result result = new Result(decoderResult.getText(), decoderResult.getRawBytes(), points, BarcodeFormat.QR_CODE);
        List<byte[]> byteSegments = decoderResult.getByteSegments();
        if (byteSegments != null) {
            result.putMetadata(ResultMetadataType.BYTE_SEGMENTS, byteSegments);
        }
        String ecLevel = decoderResult.getECLevel();
        if (ecLevel != null) {
            result.putMetadata(ResultMetadataType.ERROR_CORRECTION_LEVEL, ecLevel);
        }
        if (decoderResult.hasStructuredAppend()) {
            result.putMetadata(ResultMetadataType.STRUCTURED_APPEND_SEQUENCE, Integer.valueOf(decoderResult.getStructuredAppendSequenceNumber()));
            result.putMetadata(ResultMetadataType.STRUCTURED_APPEND_PARITY, Integer.valueOf(decoderResult.getStructuredAppendParity()));
        }
        return result;
    }

    public void reset() {
    }

    private static BitMatrix extractPureBits(BitMatrix image) throws NotFoundException {
        BitMatrix bitMatrix = image;
        int[] leftTopBlack = image.getTopLeftOnBit();
        int[] rightBottomBlack = image.getBottomRightOnBit();
        int[] iArr;
        if (leftTopBlack == null || rightBottomBlack == null) {
            iArr = rightBottomBlack;
            throw NotFoundException.getNotFoundInstance();
        }
        float moduleSize = moduleSize(leftTopBlack, bitMatrix);
        int top = leftTopBlack[1];
        int bottom = rightBottomBlack[1];
        int left = leftTopBlack[0];
        int right = rightBottomBlack[0];
        if (left >= right || top >= bottom) {
            iArr = rightBottomBlack;
            throw NotFoundException.getNotFoundInstance();
        }
        if (bottom - top != right - left) {
            right = left + (bottom - top);
        }
        int matrixWidth = Math.round(((float) ((right - left) + 1)) / moduleSize);
        int matrixHeight = Math.round(((float) ((bottom - top) + 1)) / moduleSize);
        if (matrixWidth <= 0 || matrixHeight <= 0) {
            iArr = rightBottomBlack;
            throw NotFoundException.getNotFoundInstance();
        } else if (matrixHeight == matrixWidth) {
            int nudge = (int) (moduleSize / 1073741824);
            top += nudge;
            left += nudge;
            int nudgedTooFarRight = (((int) (((float) (matrixWidth - 1)) * moduleSize)) + left) - right;
            if (nudgedTooFarRight > 0) {
                if (nudgedTooFarRight <= nudge) {
                    left -= nudgedTooFarRight;
                } else {
                    throw NotFoundException.getNotFoundInstance();
                }
            }
            int left2 = left;
            int nudgedTooFarDown = (((int) (((float) (matrixHeight - 1)) * moduleSize)) + top) - bottom;
            if (nudgedTooFarDown > 0) {
                if (nudgedTooFarDown <= nudge) {
                    top -= nudgedTooFarDown;
                } else {
                    throw NotFoundException.getNotFoundInstance();
                }
            }
            int top2 = top;
            BitMatrix bits = new BitMatrix(matrixWidth, matrixHeight);
            top = 0;
            while (top < matrixHeight) {
                left = ((int) (((float) top) * moduleSize)) + top2;
                int[] leftTopBlack2 = leftTopBlack;
                leftTopBlack = 0;
                while (leftTopBlack < matrixWidth) {
                    iArr = rightBottomBlack;
                    if (bitMatrix.get(((int) (((float) leftTopBlack) * moduleSize)) + left2, left)) {
                        bits.set(leftTopBlack, top);
                    }
                    leftTopBlack++;
                    rightBottomBlack = iArr;
                }
                top++;
                leftTopBlack = leftTopBlack2;
            }
            return bits;
        } else {
            iArr = rightBottomBlack;
            throw NotFoundException.getNotFoundInstance();
        }
    }

    private static float moduleSize(int[] leftTopBlack, BitMatrix image) throws NotFoundException {
        int height = image.getHeight();
        int width = image.getWidth();
        int x = leftTopBlack[0];
        int y = leftTopBlack[1];
        boolean inBlack = true;
        int transitions = 0;
        while (x < width && y < height) {
            if (inBlack != image.get(x, y)) {
                transitions++;
                if (transitions == 5) {
                    break;
                }
                inBlack = !inBlack;
            }
            x++;
            y++;
        }
        if (x != width && y != height) {
            return ((float) (x - leftTopBlack[0])) / 7.0f;
        }
        throw NotFoundException.getNotFoundInstance();
    }
}
