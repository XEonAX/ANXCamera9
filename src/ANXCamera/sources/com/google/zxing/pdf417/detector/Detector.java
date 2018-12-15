package com.google.zxing.pdf417.detector;

import com.google.zxing.BinaryBitmap;
import com.google.zxing.DecodeHintType;
import com.google.zxing.NotFoundException;
import com.google.zxing.ResultPoint;
import com.google.zxing.common.BitMatrix;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

public final class Detector {
    private static final int BARCODE_MIN_HEIGHT = 10;
    private static final int[] INDEXES_START_PATTERN;
    private static final int[] INDEXES_STOP_PATTERN = new int[]{6, 2, 7, 3};
    private static final float MAX_AVG_VARIANCE = 0.42f;
    private static final float MAX_INDIVIDUAL_VARIANCE = 0.8f;
    private static final int MAX_PATTERN_DRIFT = 5;
    private static final int MAX_PIXEL_DRIFT = 3;
    private static final int ROW_STEP = 5;
    private static final int SKIPPED_ROW_COUNT_MAX = 25;
    private static final int[] START_PATTERN = new int[]{8, 1, 1, 1, 1, 1, 1, 3};
    private static final int[] STOP_PATTERN = new int[]{7, 1, 1, 3, 1, 1, 1, 2, 1};

    static {
        int[] iArr = new int[4];
        iArr[1] = 4;
        iArr[2] = 1;
        iArr[3] = 5;
        INDEXES_START_PATTERN = iArr;
    }

    private Detector() {
    }

    public static PDF417DetectorResult detect(BinaryBitmap image, Map<DecodeHintType, ?> map, boolean multiple) throws NotFoundException {
        BitMatrix bitMatrix = image.getBlackMatrix();
        List<ResultPoint[]> barcodeCoordinates = detect(multiple, bitMatrix);
        if (barcodeCoordinates.isEmpty()) {
            bitMatrix = bitMatrix.clone();
            bitMatrix.rotate180();
            barcodeCoordinates = detect(multiple, bitMatrix);
        }
        return new PDF417DetectorResult(bitMatrix, barcodeCoordinates);
    }

    private static List<ResultPoint[]> detect(boolean multiple, BitMatrix bitMatrix) {
        List<ResultPoint[]> barcodeCoordinates = new ArrayList();
        int row = 0;
        int column = 0;
        boolean foundBarcodeInRow = false;
        while (row < bitMatrix.getHeight()) {
            ResultPoint[] vertices = findVertices(bitMatrix, row, column);
            if (vertices[0] != null || vertices[3] != null) {
                foundBarcodeInRow = true;
                barcodeCoordinates.add(vertices);
                if (!multiple) {
                    break;
                } else if (vertices[2] != null) {
                    column = (int) vertices[2].getX();
                    row = (int) vertices[2].getY();
                } else {
                    column = (int) vertices[4].getX();
                    row = (int) vertices[4].getY();
                }
            } else if (!foundBarcodeInRow) {
                break;
            } else {
                for (ResultPoint[] column2 : barcodeCoordinates) {
                    if (column2[1] != null) {
                        row = (int) Math.max((float) row, column2[1].getY());
                    }
                    if (column2[3] != null) {
                        row = Math.max(row, (int) column2[3].getY());
                    }
                }
                row += 5;
                foundBarcodeInRow = false;
                column = 0;
            }
        }
        return barcodeCoordinates;
    }

    private static ResultPoint[] findVertices(BitMatrix matrix, int startRow, int startColumn) {
        int height = matrix.getHeight();
        int width = matrix.getWidth();
        ResultPoint[] result = new ResultPoint[8];
        copyToResult(result, findRowsWithPattern(matrix, height, width, startRow, startColumn, START_PATTERN), INDEXES_START_PATTERN);
        if (result[4] != null) {
            startColumn = (int) result[4].getX();
            startRow = (int) result[4].getY();
        }
        copyToResult(result, findRowsWithPattern(matrix, height, width, startRow, startColumn, STOP_PATTERN), INDEXES_STOP_PATTERN);
        return result;
    }

    private static void copyToResult(ResultPoint[] result, ResultPoint[] tmpResult, int[] destinationIndexes) {
        for (int i = 0; i < destinationIndexes.length; i++) {
            result[destinationIndexes[i]] = tmpResult[i];
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:14:0x0058  */
    /* JADX WARNING: Removed duplicated region for block: B:31:0x00d9  */
    private static com.google.zxing.ResultPoint[] findRowsWithPattern(com.google.zxing.common.BitMatrix r18, int r19, int r20, int r21, int r22, int[] r23) {
        /*
        r0 = r19;
        r1 = 4;
        r1 = new com.google.zxing.ResultPoint[r1];
        r2 = 0;
        r10 = r23;
        r3 = r10.length;
        r11 = new int[r3];
        r12 = r21;
    L_0x000d:
        r13 = 0;
        r14 = 1;
        if (r12 < r0) goto L_0x0012;
    L_0x0011:
        goto L_0x0054;
    L_0x0012:
        r7 = 0;
        r3 = r18;
        r4 = r22;
        r5 = r12;
        r6 = r20;
        r8 = r10;
        r9 = r11;
        r3 = findGuardPattern(r3, r4, r5, r6, r7, r8, r9);
        if (r3 == 0) goto L_0x00e5;
    L_0x0022:
        r15 = r3;
    L_0x0023:
        if (r12 > 0) goto L_0x0026;
    L_0x0025:
        goto L_0x003c;
    L_0x0026:
        r12 = r12 + -1;
        r7 = 0;
        r3 = r18;
        r4 = r22;
        r5 = r12;
        r6 = r20;
        r8 = r10;
        r9 = r11;
        r3 = findGuardPattern(r3, r4, r5, r6, r7, r8, r9);
        if (r3 == 0) goto L_0x003a;
    L_0x0038:
        r15 = r3;
        goto L_0x0023;
    L_0x003a:
        r12 = r12 + r14;
    L_0x003c:
        r3 = new com.google.zxing.ResultPoint;
        r4 = r15[r13];
        r4 = (float) r4;
        r5 = (float) r12;
        r3.<init>(r4, r5);
        r1[r13] = r3;
        r3 = new com.google.zxing.ResultPoint;
        r4 = r15[r14];
        r4 = (float) r4;
        r5 = (float) r12;
        r3.<init>(r4, r5);
        r1[r14] = r3;
        r2 = 1;
    L_0x0054:
        r3 = r12 + 1;
        if (r2 == 0) goto L_0x00d3;
    L_0x0058:
        r4 = 0;
        r15 = 2;
        r5 = new int[r15];
        r6 = r1[r13];
        r6 = r6.getX();
        r6 = (int) r6;
        r5[r13] = r6;
        r6 = r1[r14];
        r6 = r6.getX();
        r6 = (int) r6;
        r5[r14] = r6;
        r9 = r3;
        r8 = r4;
        r16 = r5;
    L_0x0072:
        if (r9 < r0) goto L_0x0078;
    L_0x0074:
        r15 = r8;
        r17 = r9;
        goto L_0x00af;
    L_0x0078:
        r4 = r16[r13];
        r7 = 0;
        r3 = r18;
        r5 = r9;
        r6 = r20;
        r15 = r8;
        r8 = r10;
        r17 = r9;
        r9 = r11;
        r3 = findGuardPattern(r3, r4, r5, r6, r7, r8, r9);
        if (r3 == 0) goto L_0x00aa;
    L_0x008b:
        r4 = r16[r13];
        r5 = r3[r13];
        r4 = r4 - r5;
        r4 = java.lang.Math.abs(r4);
        r5 = 5;
        if (r4 >= r5) goto L_0x00aa;
    L_0x0097:
        r4 = r16[r14];
        r6 = r3[r14];
        r4 = r4 - r6;
        r4 = java.lang.Math.abs(r4);
        if (r4 >= r5) goto L_0x00aa;
    L_0x00a2:
        r4 = r3;
        r5 = 0;
        r16 = r4;
        r8 = r5;
        r5 = 2;
        goto L_0x00cf;
    L_0x00aa:
        r4 = 25;
        if (r15 <= r4) goto L_0x00cc;
    L_0x00af:
        r8 = r15 + 1;
        r3 = r17 - r8;
        r4 = new com.google.zxing.ResultPoint;
        r5 = r16[r13];
        r5 = (float) r5;
        r6 = (float) r3;
        r4.<init>(r5, r6);
        r5 = 2;
        r1[r5] = r4;
        r4 = 3;
        r5 = new com.google.zxing.ResultPoint;
        r6 = r16[r14];
        r6 = (float) r6;
        r7 = (float) r3;
        r5.<init>(r6, r7);
        r1[r4] = r5;
        goto L_0x00d3;
    L_0x00cc:
        r5 = 2;
        r8 = r15 + 1;
    L_0x00cf:
        r9 = r17 + 1;
        r15 = r5;
        goto L_0x0072;
    L_0x00d3:
        r4 = r3 - r12;
        r5 = 10;
        if (r4 >= r5) goto L_0x00e4;
    L_0x00d9:
        r4 = 0;
    L_0x00da:
        r5 = r1.length;
        if (r4 < r5) goto L_0x00de;
    L_0x00dd:
        goto L_0x00e4;
    L_0x00de:
        r5 = 0;
        r1[r4] = r5;
        r4 = r4 + 1;
        goto L_0x00da;
    L_0x00e4:
        return r1;
    L_0x00e5:
        r12 = r12 + 5;
        goto L_0x000d;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.zxing.pdf417.detector.Detector.findRowsWithPattern(com.google.zxing.common.BitMatrix, int, int, int, int, int[]):com.google.zxing.ResultPoint[]");
    }

    private static int[] findGuardPattern(BitMatrix matrix, int column, int row, int width, boolean whiteFirst, int[] pattern, int[] counters) {
        int pixelDrift;
        BitMatrix bitMatrix = matrix;
        int i = row;
        int[] iArr = pattern;
        Object obj = counters;
        int i2 = 0;
        Arrays.fill(obj, 0, obj.length, 0);
        int patternLength = iArr.length;
        int isWhite = whiteFirst;
        int patternStart = column;
        int pixelDrift2 = 0;
        while (bitMatrix.get(patternStart, i) && patternStart > 0) {
            pixelDrift = pixelDrift2 + 1;
            if (pixelDrift2 >= 3) {
                break;
            }
            patternStart--;
            pixelDrift2 = pixelDrift;
        }
        pixelDrift = patternStart;
        int counterPosition = 0;
        while (pixelDrift < width) {
            int i3;
            if ((bitMatrix.get(pixelDrift, i) ^ isWhite) != 0) {
                obj[counterPosition] = obj[counterPosition] + 1;
                i3 = i2;
            } else {
                if (counterPosition != patternLength - 1) {
                    i3 = 0;
                    counterPosition++;
                } else if (patternMatchVariance(obj, iArr, MAX_INDIVIDUAL_VARIANCE) < MAX_AVG_VARIANCE) {
                    return new int[]{patternStart, pixelDrift};
                } else {
                    i3 = 0;
                    patternStart += obj[0] + obj[1];
                    System.arraycopy(obj, 2, obj, 0, patternLength - 2);
                    obj[patternLength - 2] = null;
                    obj[patternLength - 1] = null;
                    counterPosition--;
                }
                boolean z = true;
                obj[counterPosition] = 1;
                if (isWhite != 0) {
                    z = i3;
                }
                isWhite = z;
            }
            pixelDrift++;
            i2 = i3;
        }
        if (counterPosition != patternLength - 1 || patternMatchVariance(obj, iArr, MAX_INDIVIDUAL_VARIANCE) >= MAX_AVG_VARIANCE) {
            return null;
        }
        return new int[]{patternStart, pixelDrift - 1};
    }

    private static float patternMatchVariance(int[] counters, int[] pattern, float maxIndividualVariance) {
        int i;
        int numCounters = counters.length;
        int total = 0;
        int patternLength = 0;
        for (i = 0; i < numCounters; i++) {
            total += counters[i];
            patternLength += pattern[i];
        }
        if (total < patternLength) {
            return Float.POSITIVE_INFINITY;
        }
        float unitBarWidth = ((float) total) / ((float) patternLength);
        float maxIndividualVariance2 = maxIndividualVariance * unitBarWidth;
        maxIndividualVariance = 0.0f;
        for (i = 0; i < numCounters; i++) {
            int counter = counters[i];
            float scaledPattern = ((float) pattern[i]) * unitBarWidth;
            float variance = ((float) counter) > scaledPattern ? ((float) counter) - scaledPattern : scaledPattern - ((float) counter);
            if (variance > maxIndividualVariance2) {
                return Float.POSITIVE_INFINITY;
            }
            maxIndividualVariance += variance;
        }
        return maxIndividualVariance / ((float) total);
    }
}
