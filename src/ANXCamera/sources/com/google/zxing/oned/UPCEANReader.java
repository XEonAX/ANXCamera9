package com.google.zxing.oned;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.ChecksumException;
import com.google.zxing.DecodeHintType;
import com.google.zxing.FormatException;
import com.google.zxing.NotFoundException;
import com.google.zxing.ReaderException;
import com.google.zxing.Result;
import com.google.zxing.ResultMetadataType;
import com.google.zxing.ResultPoint;
import com.google.zxing.ResultPointCallback;
import com.google.zxing.common.BitArray;
import java.util.Arrays;
import java.util.Map;

public abstract class UPCEANReader extends OneDReader {
    static final int[][] L_AND_G_PATTERNS = new int[20][];
    static final int[][] L_PATTERNS = new int[][]{new int[]{3, 2, 1, 1}, new int[]{2, 2, 2, 1}, new int[]{2, 1, 2, 2}, new int[]{1, 4, 1, 1}, new int[]{1, 1, 3, 2}, new int[]{1, 2, 3, 1}, new int[]{1, 1, 1, 4}, new int[]{1, 3, 1, 2}, new int[]{1, 2, 1, 3}, new int[]{3, 1, 1, 2}};
    private static final float MAX_AVG_VARIANCE = 0.48f;
    private static final float MAX_INDIVIDUAL_VARIANCE = 0.7f;
    static final int[] MIDDLE_PATTERN = new int[]{1, 1, 1, 1, 1};
    static final int[] START_END_PATTERN = new int[]{1, 1, 1};
    private final StringBuilder decodeRowStringBuffer = new StringBuilder(20);
    private final EANManufacturerOrgSupport eanManSupport = new EANManufacturerOrgSupport();
    private final UPCEANExtensionSupport extensionReader = new UPCEANExtensionSupport();

    protected abstract int decodeMiddle(BitArray bitArray, int[] iArr, StringBuilder stringBuilder) throws NotFoundException;

    abstract BarcodeFormat getBarcodeFormat();

    static {
        System.arraycopy(L_PATTERNS, 0, L_AND_G_PATTERNS, 0, 10);
        for (int i = 10; i < 20; i++) {
            int[] widths = L_PATTERNS[i - 10];
            int[] reversedWidths = new int[widths.length];
            for (int j = 0; j < widths.length; j++) {
                reversedWidths[j] = widths[(widths.length - j) - 1];
            }
            L_AND_G_PATTERNS[i] = reversedWidths;
        }
    }

    protected UPCEANReader() {
    }

    static int[] findStartGuardPattern(BitArray row) throws NotFoundException {
        boolean foundStart = false;
        int[] startRange = null;
        int nextStart = 0;
        int[] counters = new int[START_END_PATTERN.length];
        while (!foundStart) {
            Arrays.fill(counters, 0, START_END_PATTERN.length, 0);
            startRange = findGuardPattern(row, nextStart, false, START_END_PATTERN, counters);
            int start = startRange[0];
            nextStart = startRange[1];
            int quietStart = start - (nextStart - start);
            if (quietStart >= 0) {
                foundStart = row.isRange(quietStart, start, false);
            }
        }
        return startRange;
    }

    public Result decodeRow(int rowNumber, BitArray row, Map<DecodeHintType, ?> hints) throws NotFoundException, ChecksumException, FormatException {
        return decodeRow(rowNumber, row, findStartGuardPattern(row), hints);
    }

    public Result decodeRow(int rowNumber, BitArray row, int[] startGuardRange, Map<DecodeHintType, ?> hints) throws NotFoundException, ChecksumException, FormatException {
        ResultPointCallback resultPointCallback;
        int i = rowNumber;
        BitArray bitArray = row;
        int[] iArr = startGuardRange;
        Map<DecodeHintType, ?> map = hints;
        if (map == null) {
            resultPointCallback = null;
        } else {
            resultPointCallback = (ResultPointCallback) map.get(DecodeHintType.NEED_RESULT_POINT_CALLBACK);
        }
        ResultPointCallback resultPointCallback2 = resultPointCallback;
        if (resultPointCallback2 != null) {
            resultPointCallback2.foundPossibleResultPoint(new ResultPoint(((float) (iArr[0] + iArr[1])) / 2.0f, (float) i));
        }
        StringBuilder result = this.decodeRowStringBuffer;
        result.setLength(0);
        int endStart = decodeMiddle(bitArray, iArr, result);
        if (resultPointCallback2 != null) {
            resultPointCallback2.foundPossibleResultPoint(new ResultPoint((float) endStart, (float) i));
        }
        int[] endRange = decodeEnd(bitArray, endStart);
        if (resultPointCallback2 != null) {
            resultPointCallback2.foundPossibleResultPoint(new ResultPoint(((float) (endRange[0] + endRange[1])) / 2.0f, (float) i));
        }
        int end = endRange[1];
        int quietEnd = (end - endRange[0]) + end;
        StringBuilder stringBuilder;
        if (quietEnd >= row.getSize() || !bitArray.isRange(end, quietEnd, false)) {
            stringBuilder = result;
            throw NotFoundException.getNotFoundInstance();
        }
        String resultString = result.toString();
        if (resultString.length() < 8) {
            stringBuilder = result;
            throw FormatException.getFormatInstance();
        } else if (checkChecksum(resultString)) {
            int[] allowedExtensions;
            float left = ((float) (iArr[1] + iArr[0])) / 2.0f;
            float right = ((float) (endRange[1] + endRange[0])) / 2.0f;
            BarcodeFormat format = getBarcodeFormat();
            ResultPoint[] resultPointArr = new ResultPoint[2];
            resultPointArr[0] = new ResultPoint(left, (float) i);
            resultPointArr[1] = new ResultPoint(right, (float) i);
            Result decodeResult = new Result(resultString, null, resultPointArr, format);
            result = null;
            try {
                Result extensionResult = this.extensionReader.decodeRow(i, bitArray, endRange[1]);
                decodeResult.putMetadata(ResultMetadataType.UPC_EAN_EXTENSION, extensionResult.getText());
                decodeResult.putAllMetadata(extensionResult.getResultMetadata());
                decodeResult.addResultPoints(extensionResult.getResultPoints());
                result = extensionResult.getText().length();
            } catch (ReaderException e) {
            }
            if (map == null) {
                allowedExtensions = null;
            } else {
                allowedExtensions = (int[]) map.get(DecodeHintType.ALLOWED_EAN_EXTENSIONS);
            }
            if (allowedExtensions != null) {
                int length = allowedExtensions.length;
                boolean valid = false;
                i = 0;
                while (i < length) {
                    if (result == allowedExtensions[i]) {
                        valid = true;
                        break;
                    }
                    i++;
                    bitArray = row;
                }
                if (!valid) {
                    throw NotFoundException.getNotFoundInstance();
                }
            }
            if (format == BarcodeFormat.EAN_13 || format == BarcodeFormat.UPC_A) {
                String countryID = this.eanManSupport.lookupCountryIdentifier(resultString);
                if (countryID != null) {
                    decodeResult.putMetadata(ResultMetadataType.POSSIBLE_COUNTRY, countryID);
                }
            }
            return decodeResult;
        } else {
            stringBuilder = result;
            throw ChecksumException.getChecksumInstance();
        }
    }

    boolean checkChecksum(String s) throws FormatException {
        return checkStandardUPCEANChecksum(s);
    }

    static boolean checkStandardUPCEANChecksum(CharSequence s) throws FormatException {
        int length = s.length();
        boolean z = false;
        if (length == 0) {
            return false;
        }
        int i;
        int digit;
        int sum = 0;
        for (i = length - 2; i >= 0; i -= 2) {
            digit = s.charAt(i) - 48;
            if (digit < 0 || digit > 9) {
                throw FormatException.getFormatInstance();
            }
            sum += digit;
        }
        sum *= 3;
        for (i = length - 1; i >= 0; i -= 2) {
            digit = s.charAt(i) - 48;
            if (digit < 0 || digit > 9) {
                throw FormatException.getFormatInstance();
            }
            sum += digit;
        }
        if (sum % 10 == 0) {
            z = true;
        }
        return z;
    }

    int[] decodeEnd(BitArray row, int endStart) throws NotFoundException {
        return findGuardPattern(row, endStart, false, START_END_PATTERN);
    }

    static int[] findGuardPattern(BitArray row, int rowOffset, boolean whiteFirst, int[] pattern) throws NotFoundException {
        return findGuardPattern(row, rowOffset, whiteFirst, pattern, new int[pattern.length]);
    }

    private static int[] findGuardPattern(BitArray row, int rowOffset, boolean whiteFirst, int[] pattern, int[] counters) throws NotFoundException {
        int patternLength = pattern.length;
        int width = row.getSize();
        boolean isWhite = whiteFirst;
        rowOffset = whiteFirst ? row.getNextUnset(rowOffset) : row.getNextSet(rowOffset);
        int counterPosition = 0;
        int patternStart = rowOffset;
        for (int x = rowOffset; x < width; x++) {
            boolean z = true;
            if ((row.get(x) ^ isWhite) != 0) {
                counters[counterPosition] = counters[counterPosition] + 1;
            } else {
                if (counterPosition != patternLength - 1) {
                    counterPosition++;
                } else if (OneDReader.patternMatchVariance(counters, pattern, MAX_INDIVIDUAL_VARIANCE) < MAX_AVG_VARIANCE) {
                    return new int[]{patternStart, x};
                } else {
                    patternStart += counters[0] + counters[1];
                    System.arraycopy(counters, 2, counters, 0, patternLength - 2);
                    counters[patternLength - 2] = 0;
                    counters[patternLength - 1] = 0;
                    counterPosition--;
                }
                counters[counterPosition] = 1;
                if (isWhite) {
                    z = false;
                }
                isWhite = z;
            }
        }
        throw NotFoundException.getNotFoundInstance();
    }

    static int decodeDigit(BitArray row, int[] counters, int rowOffset, int[][] patterns) throws NotFoundException {
        OneDReader.recordPattern(row, rowOffset, counters);
        float bestVariance = MAX_AVG_VARIANCE;
        int bestMatch = -1;
        int max = patterns.length;
        for (int i = 0; i < max; i++) {
            float variance = OneDReader.patternMatchVariance(counters, patterns[i], MAX_INDIVIDUAL_VARIANCE);
            if (variance < bestVariance) {
                bestVariance = variance;
                bestMatch = i;
            }
        }
        if (bestMatch >= 0) {
            return bestMatch;
        }
        throw NotFoundException.getNotFoundInstance();
    }
}
