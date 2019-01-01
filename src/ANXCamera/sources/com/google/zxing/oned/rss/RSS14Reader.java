package com.google.zxing.oned.rss;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.DecodeHintType;
import com.google.zxing.NotFoundException;
import com.google.zxing.Result;
import com.google.zxing.ResultPoint;
import com.google.zxing.ResultPointCallback;
import com.google.zxing.common.BitArray;
import com.google.zxing.oned.OneDReader;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

public final class RSS14Reader extends AbstractRSSReader {
    private static final int[][] FINDER_PATTERNS = new int[][]{new int[]{3, 8, 2, 1}, new int[]{3, 5, 5, 1}, new int[]{3, 3, 7, 1}, new int[]{3, 1, 9, 1}, new int[]{2, 7, 4, 1}, new int[]{2, 5, 6, 1}, new int[]{2, 3, 8, 1}, new int[]{1, 5, 7, 1}, new int[]{1, 3, 9, 1}};
    private static final int[] INSIDE_GSUM;
    private static final int[] INSIDE_ODD_TOTAL_SUBSET = new int[]{4, 20, 48, 81};
    private static final int[] INSIDE_ODD_WIDEST = new int[]{2, 4, 6, 8};
    private static final int[] OUTSIDE_EVEN_TOTAL_SUBSET = new int[]{1, 10, 34, 70, 126};
    private static final int[] OUTSIDE_GSUM;
    private static final int[] OUTSIDE_ODD_WIDEST = new int[]{8, 6, 4, 3, 1};
    private final List<Pair> possibleLeftPairs = new ArrayList();
    private final List<Pair> possibleRightPairs = new ArrayList();

    static {
        int[] iArr = new int[5];
        iArr[1] = 161;
        iArr[2] = 961;
        iArr[3] = 2015;
        iArr[4] = 2715;
        OUTSIDE_GSUM = iArr;
        iArr = new int[4];
        iArr[1] = 336;
        iArr[2] = 1036;
        iArr[3] = 1516;
        INSIDE_GSUM = iArr;
    }

    public Result decodeRow(int rowNumber, BitArray row, Map<DecodeHintType, ?> hints) throws NotFoundException {
        addOrTally(this.possibleLeftPairs, decodePair(row, null, rowNumber, hints));
        row.reverse();
        addOrTally(this.possibleRightPairs, decodePair(row, true, rowNumber, hints));
        row.reverse();
        int lefSize = this.possibleLeftPairs.size();
        for (int i = 0; i < lefSize; i++) {
            Pair left = (Pair) this.possibleLeftPairs.get(i);
            if (left.getCount() > 1) {
                int rightSize = this.possibleRightPairs.size();
                for (int j = 0; j < rightSize; j++) {
                    Pair right = (Pair) this.possibleRightPairs.get(j);
                    if (right.getCount() > 1 && checkChecksum(left, right)) {
                        return constructResult(left, right);
                    }
                }
                continue;
            }
        }
        throw NotFoundException.getNotFoundInstance();
    }

    private static void addOrTally(Collection<Pair> possiblePairs, Pair pair) {
        if (pair != null) {
            boolean found = false;
            for (Pair other : possiblePairs) {
                if (other.getValue() == pair.getValue()) {
                    other.incrementCount();
                    found = true;
                    break;
                }
            }
            if (!found) {
                possiblePairs.add(pair);
            }
        }
    }

    public void reset() {
        this.possibleLeftPairs.clear();
        this.possibleRightPairs.clear();
    }

    private static Result constructResult(Pair leftPair, Pair rightPair) {
        int i;
        String text = String.valueOf((4537077 * ((long) leftPair.getValue())) + ((long) rightPair.getValue()));
        StringBuilder buffer = new StringBuilder(14);
        for (i = 13 - text.length(); i > 0; i--) {
            buffer.append('0');
        }
        buffer.append(text);
        i = 0;
        for (int i2 = 0; i2 < 13; i2++) {
            int digit = buffer.charAt(i2) - 48;
            i += (i2 & 1) == 0 ? 3 * digit : digit;
        }
        i = 10 - (i % 10);
        if (i == 10) {
            i = 0;
        }
        buffer.append(i);
        ResultPoint[] leftPoints = leftPair.getFinderPattern().getResultPoints();
        ResultPoint[] rightPoints = rightPair.getFinderPattern().getResultPoints();
        return new Result(String.valueOf(buffer.toString()), null, new ResultPoint[]{leftPoints[0], leftPoints[1], rightPoints[0], rightPoints[1]}, BarcodeFormat.RSS_14);
    }

    private static boolean checkChecksum(Pair leftPair, Pair rightPair) {
        int checkValue = (leftPair.getChecksumPortion() + (16 * rightPair.getChecksumPortion())) % 79;
        int targetCheckValue = (9 * leftPair.getFinderPattern().getValue()) + rightPair.getFinderPattern().getValue();
        if (targetCheckValue > 72) {
            targetCheckValue--;
        }
        if (targetCheckValue > 8) {
            targetCheckValue--;
        }
        return checkValue == targetCheckValue;
    }

    private Pair decodePair(BitArray row, boolean right, int rowNumber, Map<DecodeHintType, ?> hints) {
        try {
            ResultPointCallback resultPointCallback;
            int[] startEnd = findFinderPattern(row, 0, right);
            FinderPattern pattern = parseFoundFinderPattern(row, rowNumber, right, startEnd);
            if (hints == null) {
                resultPointCallback = null;
            } else {
                resultPointCallback = (ResultPointCallback) hints.get(DecodeHintType.NEED_RESULT_POINT_CALLBACK);
            }
            if (resultPointCallback != null) {
                float center = ((float) (startEnd[0] + startEnd[1])) / 2.0f;
                if (right) {
                    center = ((float) (row.getSize() - 1)) - center;
                }
                resultPointCallback.foundPossibleResultPoint(new ResultPoint(center, (float) rowNumber));
            }
            DataCharacter outside = decodeDataCharacter(row, pattern, true);
            DataCharacter inside = decodeDataCharacter(row, pattern, false);
            return new Pair((1597 * outside.getValue()) + inside.getValue(), outside.getChecksumPortion() + (4 * inside.getChecksumPortion()), pattern);
        } catch (NotFoundException e) {
            return null;
        }
    }

    private DataCharacter decodeDataCharacter(BitArray row, FinderPattern pattern, boolean outsideChar) throws NotFoundException {
        int i;
        int temp;
        int i2;
        BitArray bitArray = row;
        boolean z = outsideChar;
        int[] counters = getDataCharacterCounters();
        int i3 = 0;
        counters[0] = 0;
        int i4 = 1;
        counters[1] = 0;
        int i5 = 2;
        counters[2] = 0;
        counters[3] = 0;
        counters[4] = 0;
        counters[5] = 0;
        counters[6] = 0;
        counters[7] = 0;
        if (z) {
            OneDReader.recordPatternInReverse(bitArray, pattern.getStartEnd()[0], counters);
        } else {
            OneDReader.recordPattern(bitArray, pattern.getStartEnd()[1] + 1, counters);
            i = 0;
            int j = counters.length - 1;
            while (i < j) {
                i5 = 1;
                temp = counters[i];
                counters[i] = counters[j];
                counters[j] = temp;
                i++;
                j--;
                bitArray = row;
                z = outsideChar;
                i3 = 0;
                i5 = 2;
            }
        }
        int numModules = z ? 16 : 15;
        float elementWidth = ((float) AbstractRSSReader.count(counters)) / ((float) numModules);
        int[] oddCounts = getOddCounts();
        int[] evenCounts = getEvenCounts();
        float[] oddRoundingErrors = getOddRoundingErrors();
        float[] evenRoundingErrors = getEvenRoundingErrors();
        i = 0;
        while (i < counters.length) {
            i4 = i3;
            i2 = i5;
            float value = ((float) counters[i]) / elementWidth;
            i3 = (int) (1056964608 + value);
            if (i3 < 1) {
                i3 = 1;
            } else if (i3 > 8) {
                i3 = 8;
            }
            i2 = i / 2;
            if ((i & 1) == 0) {
                oddCounts[i2] = i3;
                oddRoundingErrors[i2] = value - ((float) i3);
            } else {
                evenCounts[i2] = i3;
                evenRoundingErrors[i2] = value - ((float) i3);
            }
            i++;
            i4 = 1;
            bitArray = row;
            z = outsideChar;
            i3 = 0;
            i5 = 2;
        }
        adjustOddEvenCounts(z, numModules);
        i = 0;
        int oddChecksumPortion = 0;
        i3 = oddCounts.length - i4;
        while (i3 >= 0) {
            i2 = i5;
            oddChecksumPortion = (oddChecksumPortion * 9) + oddCounts[i3];
            i += oddCounts[i3];
            i3--;
            bitArray = row;
            z = outsideChar;
            i4 = 1;
        }
        i3 = 0;
        i5 = evenCounts.length - i4;
        int evenSum = 0;
        while (i5 >= 0) {
            i3 = (i3 * 9) + evenCounts[i5];
            evenSum += evenCounts[i5];
            i5--;
            bitArray = row;
            z = outsideChar;
        }
        int checksumPortion = oddChecksumPortion + (3 * i3);
        int vOdd;
        if (!z) {
            temp = evenSum;
            if ((temp & 1) != 0 || temp > 10 || temp < 4) {
                throw NotFoundException.getNotFoundInstance();
            }
            i2 = (10 - temp) / 2;
            i4 = INSIDE_ODD_WIDEST[i2];
            i5 = 9 - i4;
            vOdd = RSSUtils.getRSSvalue(oddCounts, i4, 1);
            i4 = RSSUtils.getRSSvalue(evenCounts, i5, 0);
            return new DataCharacter(((i4 * INSIDE_ODD_TOTAL_SUBSET[i2]) + vOdd) + INSIDE_GSUM[i2], checksumPortion);
        } else if ((i & 1) != 0 || i > 12 || i < 4) {
            throw NotFoundException.getNotFoundInstance();
        } else {
            i5 = (12 - i) / 2;
            vOdd = OUTSIDE_ODD_WIDEST[i5];
            i4 = 9 - vOdd;
            temp = RSSUtils.getRSSvalue(oddCounts, vOdd, 0);
            return new DataCharacter(((temp * OUTSIDE_EVEN_TOTAL_SUBSET[i5]) + RSSUtils.getRSSvalue(evenCounts, i4, 1)) + OUTSIDE_GSUM[i5], checksumPortion);
        }
    }

    private int[] findFinderPattern(BitArray row, int rowOffset, boolean rightFinderPattern) throws NotFoundException {
        int[] counters = getDecodeFinderCounters();
        counters[0] = 0;
        counters[1] = 0;
        counters[2] = 0;
        counters[3] = 0;
        int width = row.getSize();
        boolean isWhite = false;
        while (rowOffset < width) {
            isWhite = row.get(rowOffset) ^ 1;
            if (rightFinderPattern == isWhite) {
                break;
            }
            rowOffset++;
        }
        int counterPosition = 0;
        int patternStart = rowOffset;
        for (int x = rowOffset; x < width; x++) {
            if ((row.get(x) ^ isWhite) != 0) {
                counters[counterPosition] = counters[counterPosition] + 1;
            } else {
                if (counterPosition != 3) {
                    counterPosition++;
                } else if (AbstractRSSReader.isFinderPattern(counters)) {
                    return new int[]{patternStart, x};
                } else {
                    patternStart += counters[0] + counters[1];
                    counters[0] = counters[2];
                    counters[1] = counters[3];
                    counters[2] = 0;
                    counters[3] = 0;
                    counterPosition--;
                }
                counters[counterPosition] = 1;
                isWhite = !isWhite;
            }
        }
        throw NotFoundException.getNotFoundInstance();
    }

    private FinderPattern parseFoundFinderPattern(BitArray row, int rowNumber, boolean right, int[] startEnd) throws NotFoundException {
        int end;
        int start;
        BitArray bitArray = row;
        boolean firstIsBlack = bitArray.get(startEnd[0]);
        int firstElementStart = startEnd[0] - 1;
        while (firstElementStart >= 0 && (bitArray.get(firstElementStart) ^ firstIsBlack) != 0) {
            firstElementStart--;
        }
        firstElementStart++;
        int firstCounter = startEnd[0] - firstElementStart;
        int[] counters = getDecodeFinderCounters();
        System.arraycopy(counters, 0, counters, 1, counters.length - 1);
        counters[0] = firstCounter;
        int value = AbstractRSSReader.parseFinderValue(counters, FINDER_PATTERNS);
        int start2 = firstElementStart;
        int end2 = startEnd[1];
        if (right) {
            end = (row.getSize() - 1) - end2;
            start = (row.getSize() - 1) - start2;
        } else {
            start = start2;
            end = end2;
        }
        return new FinderPattern(value, new int[]{firstElementStart, startEnd[1]}, start, end, rowNumber);
    }

    private void adjustOddEvenCounts(boolean outsideChar, int numModules) throws NotFoundException {
        int oddSum = AbstractRSSReader.count(getOddCounts());
        int evenSum = AbstractRSSReader.count(getEvenCounts());
        int mismatch = (oddSum + evenSum) - numModules;
        boolean evenParityBad = false;
        boolean oddParityBad = (oddSum & 1) == outsideChar;
        if ((evenSum & 1) == 1) {
            evenParityBad = true;
        }
        boolean incrementOdd = false;
        boolean decrementOdd = false;
        boolean incrementEven = false;
        boolean decrementEven = false;
        if (outsideChar) {
            if (oddSum > 12) {
                decrementOdd = true;
            } else if (oddSum < 4) {
                incrementOdd = true;
            }
            if (evenSum > 12) {
                decrementEven = true;
            } else if (evenSum < 4) {
                incrementEven = true;
            }
        } else {
            if (oddSum > 11) {
                decrementOdd = true;
            } else if (oddSum < 5) {
                incrementOdd = true;
            }
            if (evenSum > 10) {
                decrementEven = true;
            } else if (evenSum < 4) {
                incrementEven = true;
            }
        }
        if (mismatch == 1) {
            if (oddParityBad) {
                if (evenParityBad) {
                    throw NotFoundException.getNotFoundInstance();
                }
                decrementOdd = true;
            } else if (evenParityBad) {
                decrementEven = true;
            } else {
                throw NotFoundException.getNotFoundInstance();
            }
        } else if (mismatch == -1) {
            if (oddParityBad) {
                if (evenParityBad) {
                    throw NotFoundException.getNotFoundInstance();
                }
                incrementOdd = true;
            } else if (evenParityBad) {
                incrementEven = true;
            } else {
                throw NotFoundException.getNotFoundInstance();
            }
        } else if (mismatch != 0) {
            throw NotFoundException.getNotFoundInstance();
        } else if (oddParityBad) {
            if (!evenParityBad) {
                throw NotFoundException.getNotFoundInstance();
            } else if (oddSum < evenSum) {
                incrementOdd = true;
                decrementEven = true;
            } else {
                decrementOdd = true;
                incrementEven = true;
            }
        } else if (evenParityBad) {
            throw NotFoundException.getNotFoundInstance();
        }
        if (incrementOdd) {
            if (decrementOdd) {
                throw NotFoundException.getNotFoundInstance();
            }
            AbstractRSSReader.increment(getOddCounts(), getOddRoundingErrors());
        }
        if (decrementOdd) {
            AbstractRSSReader.decrement(getOddCounts(), getOddRoundingErrors());
        }
        if (incrementEven) {
            if (decrementEven) {
                throw NotFoundException.getNotFoundInstance();
            }
            AbstractRSSReader.increment(getEvenCounts(), getOddRoundingErrors());
        }
        if (decrementEven) {
            AbstractRSSReader.decrement(getEvenCounts(), getEvenRoundingErrors());
        }
    }
}
