package com.google.zxing.oned;

import android.provider.MiuiSettings.ScreenEffect;
import com.google.zxing.BinaryBitmap;
import com.google.zxing.ChecksumException;
import com.google.zxing.DecodeHintType;
import com.google.zxing.FormatException;
import com.google.zxing.NotFoundException;
import com.google.zxing.Reader;
import com.google.zxing.ReaderException;
import com.google.zxing.Result;
import com.google.zxing.ResultMetadataType;
import com.google.zxing.ResultPoint;
import com.google.zxing.common.BitArray;
import java.util.Arrays;
import java.util.EnumMap;
import java.util.Map;

public abstract class OneDReader implements Reader {
    public abstract Result decodeRow(int i, BitArray bitArray, Map<DecodeHintType, ?> map) throws NotFoundException, ChecksumException, FormatException;

    public Result decode(BinaryBitmap image) throws NotFoundException, FormatException {
        return decode(image, null);
    }

    public Result decode(BinaryBitmap image, Map<DecodeHintType, ?> hints) throws NotFoundException, FormatException {
        try {
            return doDecode(image, hints);
        } catch (NotFoundException nfe) {
            boolean tryHarder = hints != null && hints.containsKey(DecodeHintType.TRY_HARDER);
            if (tryHarder && image.isRotateSupported()) {
                BinaryBitmap rotatedImage = image.rotateCounterClockwise();
                Result result = doDecode(rotatedImage, hints);
                Map<ResultMetadataType, ?> metadata = result.getResultMetadata();
                int orientation = 270;
                if (metadata != null && metadata.containsKey(ResultMetadataType.ORIENTATION)) {
                    orientation = (((Integer) metadata.get(ResultMetadataType.ORIENTATION)).intValue() + 270) % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT;
                }
                result.putMetadata(ResultMetadataType.ORIENTATION, Integer.valueOf(orientation));
                ResultPoint[] points = result.getResultPoints();
                if (points != null) {
                    int height = rotatedImage.getHeight();
                    for (int i = 0; i < points.length; i++) {
                        points[i] = new ResultPoint((((float) height) - points[i].getY()) - 1.0f, points[i].getX());
                    }
                }
                return result;
            }
            throw nfe;
        }
    }

    public void reset() {
    }

    /* JADX WARNING: Removed duplicated region for block: B:78:0x0104 A:{SYNTHETIC} */
    /* JADX WARNING: Removed duplicated region for block: B:44:0x0099 A:{SYNTHETIC, Splitter: B:44:0x0099} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private Result doDecode(BinaryBitmap image, Map<DecodeHintType, ?> hints) throws NotFoundException {
        int maxLines;
        int i;
        int i2;
        int i3;
        Map<DecodeHintType, ?> hints2;
        BinaryBitmap binaryBitmap;
        int i4;
        Map<DecodeHintType, ?> map = hints;
        int width = image.getWidth();
        int height = image.getHeight();
        BitArray row = new BitArray(width);
        int middle = height >> 1;
        int hints3 = 1;
        boolean tryHarder = map != null && map.containsKey(DecodeHintType.TRY_HARDER);
        int rowStep = Math.max(1, height >> (tryHarder ? 8 : 5));
        if (tryHarder) {
            maxLines = height;
        } else {
            maxLines = 15;
        }
        int x = 0;
        BitArray row2 = row;
        Map<DecodeHintType, ?> hints4 = map;
        while (x < maxLines) {
            Map<DecodeHintType, ?> i42 = 2;
            int rowStepsAboveOrBelow = (x + 1) / 2;
            int rowNumber = middle + (((x & 1) == 0 ? hints3 : false ? rowStepsAboveOrBelow : -rowStepsAboveOrBelow) * rowStep);
            if (rowNumber >= 0) {
                if (rowNumber >= height) {
                    i = width;
                    i2 = height;
                    i3 = middle;
                    break;
                }
                try {
                    row2 = image.getBlackRow(rowNumber, row2);
                    Map<DecodeHintType, ?> map2 = hints4;
                    hints4 = 0;
                    map = map2;
                    while (hints4 < i42) {
                        Map<DecodeHintType, ?> hints5;
                        Result result;
                        if (hints4 == hints3) {
                            row2.reverse();
                            if (map != null && map.containsKey(DecodeHintType.NEED_RESULT_POINT_CALLBACK)) {
                                hints5 = new EnumMap(DecodeHintType.class);
                                hints5.putAll(map);
                                hints5.remove(DecodeHintType.NEED_RESULT_POINT_CALLBACK);
                                result = decodeRow(rowNumber, row2, hints5);
                                i2 = height;
                                if (hints4 != 1) {
                                    try {
                                        i3 = middle;
                                        try {
                                            result.putMetadata(ResultMetadataType.ORIENTATION, Integer.valueOf(180));
                                            height = result.getResultPoints();
                                            if (height != 0) {
                                                hints2 = hints5;
                                                try {
                                                    height[0] = new ResultPoint((((float) width) - height[0].getX()) - 1.0f, height[0].getY());
                                                    i = width;
                                                    hints3 = 1;
                                                    try {
                                                        height[1] = new ResultPoint((((float) width) - height[1].getX()) - 1.0f, height[1].getY());
                                                    } catch (ReaderException e) {
                                                    }
                                                } catch (ReaderException e2) {
                                                    i = width;
                                                    hints3 = 1;
                                                    hints4++;
                                                    height = i2;
                                                    middle = i3;
                                                    map = hints2;
                                                    width = i;
                                                    binaryBitmap = image;
                                                    i42 = 2;
                                                }
                                            } else {
                                                hints2 = hints5;
                                            }
                                        } catch (ReaderException e3) {
                                            i = width;
                                            hints2 = hints5;
                                            hints3 = 1;
                                            hints4++;
                                            height = i2;
                                            middle = i3;
                                            map = hints2;
                                            width = i;
                                            binaryBitmap = image;
                                            i42 = 2;
                                        }
                                    } catch (ReaderException e4) {
                                        i = width;
                                        i3 = middle;
                                        hints2 = hints5;
                                        hints3 = 1;
                                        hints4++;
                                        height = i2;
                                        middle = i3;
                                        map = hints2;
                                        width = i;
                                        binaryBitmap = image;
                                        i42 = 2;
                                    }
                                } else {
                                    i3 = middle;
                                    hints2 = hints5;
                                }
                                return result;
                            }
                        }
                        hints5 = map;
                        try {
                            result = decodeRow(rowNumber, row2, hints5);
                            i2 = height;
                            if (hints4 != 1) {
                            }
                            return result;
                        } catch (ReaderException e5) {
                            i = width;
                            i2 = height;
                            i3 = middle;
                            hints2 = hints5;
                            hints3 = 1;
                            hints4++;
                            height = i2;
                            middle = i3;
                            map = hints2;
                            width = i;
                            binaryBitmap = image;
                            i42 = 2;
                        }
                    }
                    hints4 = map;
                    i = width;
                    i2 = height;
                    i3 = middle;
                } catch (NotFoundException ignored) {
                    i = width;
                    i2 = height;
                    i3 = middle;
                    width = ignored;
                }
                x++;
                height = i2;
                middle = i3;
                width = i;
            } else {
                break;
            }
        }
        i = width;
        i2 = height;
        i3 = middle;
        throw NotFoundException.getNotFoundInstance();
    }

    protected static void recordPattern(BitArray row, int start, int[] counters) throws NotFoundException {
        int numCounters = counters.length;
        Arrays.fill(counters, 0, numCounters, 0);
        int end = row.getSize();
        if (start < end) {
            boolean isWhite = row.get(start) ^ true;
            int counterPosition = 0;
            int i = start;
            while (i < end) {
                if ((row.get(i) ^ isWhite) != 0) {
                    counters[counterPosition] = counters[counterPosition] + 1;
                } else {
                    counterPosition++;
                    if (counterPosition == numCounters) {
                        break;
                    }
                    counters[counterPosition] = 1;
                    isWhite = !isWhite;
                }
                i++;
            }
            if (counterPosition == numCounters) {
                return;
            }
            if (counterPosition != numCounters - 1 || i != end) {
                throw NotFoundException.getNotFoundInstance();
            }
            return;
        }
        throw NotFoundException.getNotFoundInstance();
    }

    protected static void recordPatternInReverse(BitArray row, int start, int[] counters) throws NotFoundException {
        int numTransitionsLeft = counters.length;
        boolean last = row.get(start);
        while (start > 0 && numTransitionsLeft >= 0) {
            start--;
            if (row.get(start) != last) {
                numTransitionsLeft--;
                last = !last;
            }
        }
        if (numTransitionsLeft < 0) {
            recordPattern(row, start + 1, counters);
            return;
        }
        throw NotFoundException.getNotFoundInstance();
    }

    protected static float patternMatchVariance(int[] counters, int[] pattern, float maxIndividualVariance) {
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
