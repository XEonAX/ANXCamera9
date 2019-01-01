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
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private static ResultPoint[] findRowsWithPattern(BitMatrix matrix, int height, int width, int startRow, int startColumn, int[] pattern) {
        int stopRow;
        int i = height;
        ResultPoint[] result = new ResultPoint[4];
        boolean found = false;
        int[] iArr = pattern;
        int[] counters = new int[iArr.length];
        int startRow2 = startRow;
        while (startRow2 < i) {
            int[] loc = findGuardPattern(matrix, startColumn, startRow2, width, false, iArr, counters);
            if (loc != null) {
                int[] loc2 = loc;
                while (startRow2 > 0) {
                    startRow2--;
                    loc = findGuardPattern(matrix, startColumn, startRow2, width, false, iArr, counters);
                    if (loc == null) {
                        startRow2++;
                        break;
                    }
                    loc2 = loc;
                }
                result[0] = new ResultPoint((float) loc2[0], (float) startRow2);
                result[1] = new ResultPoint((float) loc2[1], (float) startRow2);
                found = true;
                stopRow = startRow2 + 1;
                if (found) {
                    int skippedRowCount;
                    int stopRow2;
                    int stopRow3 = stopRow;
                    int skippedRowCount2 = 0;
                    int[] previousRowLoc = new int[]{(int) result[0].getX(), (int) result[1].getX()};
                    while (stopRow3 < i) {
                        Object obj;
                        skippedRowCount = skippedRowCount2;
                        stopRow2 = stopRow3;
                        loc = findGuardPattern(matrix, previousRowLoc[0], stopRow3, width, false, iArr, counters);
                        if (loc != null && Math.abs(previousRowLoc[0] - loc[0]) < 5 && Math.abs(previousRowLoc[1] - loc[1]) < 5) {
                            previousRowLoc = loc;
                            skippedRowCount2 = 0;
                            obj = 2;
                        } else if (skippedRowCount > 25) {
                            break;
                        } else {
                            obj = 2;
                            skippedRowCount2 = skippedRowCount + 1;
                        }
                        stopRow3 = stopRow2 + 1;
                        Object obj2 = obj;
                    }
                    skippedRowCount = skippedRowCount2;
                    stopRow2 = stopRow3;
                    stopRow = stopRow2 - (skippedRowCount + 1);
                    result[2] = new ResultPoint((float) previousRowLoc[0], (float) stopRow);
                    result[3] = new ResultPoint((float) previousRowLoc[1], (float) stopRow);
                }
                if (stopRow - startRow2 < 10) {
                    for (int i2 = 0; i2 < result.length; i2++) {
                        result[i2] = null;
                    }
                }
                return result;
            }
            startRow2 += 5;
        }
        stopRow = startRow2 + 1;
        if (found) {
        }
        if (stopRow - startRow2 < 10) {
        }
        return result;
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
