package com.google.zxing.qrcode.detector;

import com.google.zxing.DecodeHintType;
import com.google.zxing.NotFoundException;
import com.google.zxing.ResultPoint;
import com.google.zxing.ResultPointCallback;
import com.google.zxing.common.BitMatrix;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

public class FinderPatternFinder {
    private static final int CENTER_QUORUM = 2;
    protected static final int MAX_MODULES = 57;
    protected static final int MIN_SKIP = 3;
    private final int[] crossCheckStateCount;
    private boolean hasSkipped;
    private final BitMatrix image;
    private final List<FinderPattern> possibleCenters;
    private final ResultPointCallback resultPointCallback;

    private static final class CenterComparator implements Comparator<FinderPattern>, Serializable {
        private final float average;

        private CenterComparator(float f) {
            this.average = f;
        }

        /* synthetic */ CenterComparator(float f, CenterComparator centerComparator) {
            this(f);
        }

        public int compare(FinderPattern center1, FinderPattern center2) {
            if (center2.getCount() != center1.getCount()) {
                return center2.getCount() - center1.getCount();
            }
            float dA = Math.abs(center2.getEstimatedModuleSize() - this.average);
            float dB = Math.abs(center1.getEstimatedModuleSize() - this.average);
            int i = dA < dB ? 1 : dA == dB ? 0 : -1;
            return i;
        }
    }

    private static final class FurthestFromAverageComparator implements Comparator<FinderPattern>, Serializable {
        private final float average;

        private FurthestFromAverageComparator(float f) {
            this.average = f;
        }

        /* synthetic */ FurthestFromAverageComparator(float f, FurthestFromAverageComparator furthestFromAverageComparator) {
            this(f);
        }

        public int compare(FinderPattern center1, FinderPattern center2) {
            float dA = Math.abs(center2.getEstimatedModuleSize() - this.average);
            float dB = Math.abs(center1.getEstimatedModuleSize() - this.average);
            if (dA < dB) {
                return -1;
            }
            return dA == dB ? 0 : 1;
        }
    }

    public FinderPatternFinder(BitMatrix image) {
        this(image, null);
    }

    public FinderPatternFinder(BitMatrix image, ResultPointCallback resultPointCallback) {
        this.image = image;
        this.possibleCenters = new ArrayList();
        this.crossCheckStateCount = new int[5];
        this.resultPointCallback = resultPointCallback;
    }

    protected final BitMatrix getImage() {
        return this.image;
    }

    protected final List<FinderPattern> getPossibleCenters() {
        return this.possibleCenters;
    }

    final FinderPatternInfo find(Map<DecodeHintType, ?> hints) throws NotFoundException {
        Map<DecodeHintType, ?> map = hints;
        int i = 1;
        boolean tryHarder = map != null && map.containsKey(DecodeHintType.TRY_HARDER);
        boolean pureBarcode = map != null && map.containsKey(DecodeHintType.PURE_BARCODE);
        int maxI = this.image.getHeight();
        int maxJ = this.image.getWidth();
        int i2 = 3;
        int iSkip = (3 * maxI) / 228;
        if (iSkip < 3 || tryHarder) {
            iSkip = 3;
        }
        boolean done = false;
        int[] stateCount = new int[5];
        int i3 = iSkip - 1;
        while (i3 < maxI && !done) {
            int i4;
            stateCount[0] = 0;
            stateCount[i] = 0;
            stateCount[2] = 0;
            stateCount[i2] = 0;
            int i5 = 4;
            stateCount[4] = 0;
            int currentState = 0;
            boolean z = done;
            int iSkip2 = iSkip;
            iSkip = 0;
            boolean done2 = z;
            while (iSkip < maxJ) {
                if (this.image.get(iSkip, i3)) {
                    if ((currentState & 1) == i) {
                        currentState++;
                    }
                    stateCount[currentState] = stateCount[currentState] + i;
                    i2 = i;
                    i = i5;
                    i5 = 3;
                } else if ((currentState & 1) != 0) {
                    i2 = i;
                    i = i5;
                    i5 = 3;
                    stateCount[currentState] = stateCount[currentState] + 1;
                } else if (currentState != i5) {
                    i2 = i;
                    i = i5;
                    i5 = 3;
                    currentState++;
                    stateCount[currentState] = stateCount[currentState] + 1;
                } else if (foundPatternCross(stateCount)) {
                    if (handlePossibleCenter(stateCount, i3, iSkip, pureBarcode)) {
                        iSkip2 = true;
                        if (this.hasSkipped) {
                            done2 = haveMultiplyConfirmedCenters();
                        } else {
                            i5 = findRowSkip();
                            if (i5 > stateCount[2]) {
                                i3 += (i5 - stateCount[2]) - 2;
                                iSkip = maxJ - 1;
                            }
                        }
                        stateCount[0] = 0;
                        stateCount[1] = 0;
                        stateCount[2] = 0;
                        i5 = 3;
                        stateCount[3] = 0;
                        stateCount[4] = 0;
                        currentState = 0;
                        i = 4;
                    } else {
                        int i6 = i5;
                        i5 = 3;
                        stateCount[0] = stateCount[2];
                        stateCount[1] = stateCount[3];
                        stateCount[2] = stateCount[i6];
                        stateCount[3] = 1;
                        stateCount[i6] = 0;
                        currentState = 3;
                        i = 4;
                    }
                    i2 = 1;
                } else {
                    i5 = 3;
                    stateCount[0] = stateCount[2];
                    i2 = 1;
                    stateCount[1] = stateCount[3];
                    i = 4;
                    stateCount[2] = stateCount[4];
                    stateCount[3] = 1;
                    stateCount[4] = 0;
                    currentState = 3;
                }
                iSkip += i2;
                i4 = i5;
                i5 = i;
                i = i2;
                i2 = i4;
            }
            if (foundPatternCross(stateCount) && handlePossibleCenter(stateCount, i3, maxJ, pureBarcode)) {
                iSkip2 = stateCount[0];
                if (this.hasSkipped) {
                    i4 = iSkip2;
                    done = haveMultiplyConfirmedCenters();
                    iSkip = i4;
                    i3 += iSkip;
                }
            }
            iSkip = iSkip2;
            done = done2;
            i3 += iSkip;
        }
        FinderPattern[] patternInfo = selectBestPatterns();
        ResultPoint.orderBestPatterns(patternInfo);
        return new FinderPatternInfo(patternInfo);
    }

    private static float centerFromEnd(int[] stateCount, int end) {
        return ((float) ((end - stateCount[4]) - stateCount[3])) - (((float) stateCount[2]) / 2.0f);
    }

    protected static boolean foundPatternCross(int[] stateCount) {
        int i;
        int totalModuleSize = 0;
        for (i = 0; i < 5; i++) {
            int count = stateCount[i];
            if (count == 0) {
                return false;
            }
            totalModuleSize += count;
        }
        if (totalModuleSize < 7) {
            return false;
        }
        i = ((float) totalModuleSize) / 1088421888;
        float maxVariance = i / 2.0f;
        if (Math.abs(i - ((float) stateCount[0])) >= maxVariance || Math.abs(i - ((float) stateCount[1])) >= maxVariance || Math.abs((3.0f * i) - ((float) stateCount[2])) >= 3.0f * maxVariance || Math.abs(i - ((float) stateCount[3])) >= maxVariance || Math.abs(i - ((float) stateCount[4])) >= maxVariance) {
            return false;
        }
        return true;
    }

    private int[] getCrossCheckStateCount() {
        this.crossCheckStateCount[0] = 0;
        this.crossCheckStateCount[1] = 0;
        this.crossCheckStateCount[2] = 0;
        this.crossCheckStateCount[3] = 0;
        this.crossCheckStateCount[4] = 0;
        return this.crossCheckStateCount;
    }

    private boolean crossCheckDiagonal(int startI, int centerJ, int maxCount, int originalStateCountTotal) {
        int i = startI;
        int i2 = centerJ;
        int i3 = maxCount;
        int[] stateCount = getCrossCheckStateCount();
        int i4 = 0;
        while (i >= i4 && i2 >= i4 && this.image.get(i2 - i4, i - i4)) {
            stateCount[2] = stateCount[2] + 1;
            i4++;
        }
        if (i < i4 || i2 < i4) {
            return false;
        }
        while (i >= i4 && i2 >= i4 && !this.image.get(i2 - i4, i - i4) && stateCount[1] <= i3) {
            stateCount[1] = stateCount[1] + 1;
            i4++;
        }
        if (i < i4 || i2 < i4 || stateCount[1] > i3) {
            return false;
        }
        while (i >= i4 && i2 >= i4 && this.image.get(i2 - i4, i - i4) && stateCount[0] <= i3) {
            stateCount[0] = stateCount[0] + 1;
            i4++;
        }
        if (stateCount[0] > i3) {
            return false;
        }
        int maxI = this.image.getHeight();
        int maxJ = this.image.getWidth();
        i4 = 1;
        while (i + i4 < maxI && i2 + i4 < maxJ && this.image.get(i2 + i4, i + i4)) {
            stateCount[2] = stateCount[2] + 1;
            i4++;
        }
        if (i + i4 >= maxI || i2 + i4 >= maxJ) {
            return false;
        }
        while (i + i4 < maxI && i2 + i4 < maxJ && !this.image.get(i2 + i4, i + i4) && stateCount[3] < i3) {
            stateCount[3] = stateCount[3] + 1;
            i4++;
        }
        if (i + i4 >= maxI || i2 + i4 >= maxJ || stateCount[3] >= i3) {
            return false;
        }
        while (i + i4 < maxI && i2 + i4 < maxJ && this.image.get(i2 + i4, i + i4) && stateCount[4] < i3) {
            stateCount[4] = stateCount[4] + 1;
            i4++;
        }
        if (stateCount[4] < i3 && Math.abs(((((stateCount[0] + stateCount[1]) + stateCount[2]) + stateCount[3]) + stateCount[4]) - originalStateCountTotal) < 2 * originalStateCountTotal && foundPatternCross(stateCount)) {
            return true;
        }
        return false;
    }

    private float crossCheckVertical(int startI, int centerJ, int maxCount, int originalStateCountTotal) {
        BitMatrix image = this.image;
        int maxI = image.getHeight();
        int[] stateCount = getCrossCheckStateCount();
        int i = startI;
        while (i >= 0 && image.get(centerJ, i)) {
            stateCount[2] = stateCount[2] + 1;
            i--;
        }
        float f = Float.NaN;
        if (i < 0) {
            return Float.NaN;
        }
        while (i >= 0 && !image.get(centerJ, i) && stateCount[1] <= maxCount) {
            stateCount[1] = stateCount[1] + 1;
            i--;
        }
        if (i < 0 || stateCount[1] > maxCount) {
            return Float.NaN;
        }
        while (i >= 0 && image.get(centerJ, i) && stateCount[0] <= maxCount) {
            stateCount[0] = stateCount[0] + 1;
            i--;
        }
        if (stateCount[0] > maxCount) {
            return Float.NaN;
        }
        i = startI + 1;
        while (i < maxI && image.get(centerJ, i)) {
            stateCount[2] = stateCount[2] + 1;
            i++;
        }
        if (i == maxI) {
            return Float.NaN;
        }
        while (i < maxI && !image.get(centerJ, i) && stateCount[3] < maxCount) {
            stateCount[3] = stateCount[3] + 1;
            i++;
        }
        if (i == maxI || stateCount[3] >= maxCount) {
            return Float.NaN;
        }
        while (i < maxI && image.get(centerJ, i) && stateCount[4] < maxCount) {
            stateCount[4] = stateCount[4] + 1;
            i++;
        }
        if (stateCount[4] >= maxCount || 5 * Math.abs(((((stateCount[0] + stateCount[1]) + stateCount[2]) + stateCount[3]) + stateCount[4]) - originalStateCountTotal) >= 2 * originalStateCountTotal) {
            return Float.NaN;
        }
        if (foundPatternCross(stateCount)) {
            f = centerFromEnd(stateCount, i);
        }
        return f;
    }

    private float crossCheckHorizontal(int startJ, int centerI, int maxCount, int originalStateCountTotal) {
        BitMatrix image = this.image;
        int maxJ = image.getWidth();
        int[] stateCount = getCrossCheckStateCount();
        int j = startJ;
        while (j >= 0 && image.get(j, centerI)) {
            stateCount[2] = stateCount[2] + 1;
            j--;
        }
        float f = Float.NaN;
        if (j < 0) {
            return Float.NaN;
        }
        while (j >= 0 && !image.get(j, centerI) && stateCount[1] <= maxCount) {
            stateCount[1] = stateCount[1] + 1;
            j--;
        }
        if (j < 0 || stateCount[1] > maxCount) {
            return Float.NaN;
        }
        while (j >= 0 && image.get(j, centerI) && stateCount[0] <= maxCount) {
            stateCount[0] = stateCount[0] + 1;
            j--;
        }
        if (stateCount[0] > maxCount) {
            return Float.NaN;
        }
        j = startJ + 1;
        while (j < maxJ && image.get(j, centerI)) {
            stateCount[2] = stateCount[2] + 1;
            j++;
        }
        if (j == maxJ) {
            return Float.NaN;
        }
        while (j < maxJ && !image.get(j, centerI) && stateCount[3] < maxCount) {
            stateCount[3] = stateCount[3] + 1;
            j++;
        }
        if (j == maxJ || stateCount[3] >= maxCount) {
            return Float.NaN;
        }
        while (j < maxJ && image.get(j, centerI) && stateCount[4] < maxCount) {
            stateCount[4] = stateCount[4] + 1;
            j++;
        }
        if (stateCount[4] >= maxCount || 5 * Math.abs(((((stateCount[0] + stateCount[1]) + stateCount[2]) + stateCount[3]) + stateCount[4]) - originalStateCountTotal) >= originalStateCountTotal) {
            return Float.NaN;
        }
        if (foundPatternCross(stateCount)) {
            f = centerFromEnd(stateCount, j);
        }
        return f;
    }

    protected final boolean handlePossibleCenter(int[] stateCount, int i, int j, boolean pureBarcode) {
        int stateCountTotal = (((stateCount[0] + stateCount[1]) + stateCount[2]) + stateCount[3]) + stateCount[4];
        float centerJ = centerFromEnd(stateCount, j);
        float centerI = crossCheckVertical(i, (int) centerJ, stateCount[2], stateCountTotal);
        if (!Float.isNaN(centerI)) {
            centerJ = crossCheckHorizontal((int) centerJ, (int) centerI, stateCount[2], stateCountTotal);
            if (!Float.isNaN(centerJ) && (!pureBarcode || crossCheckDiagonal((int) centerI, (int) centerJ, stateCount[2], stateCountTotal))) {
                float estimatedModuleSize = ((float) stateCountTotal) / 7.0f;
                boolean found = false;
                for (int index = 0; index < this.possibleCenters.size(); index++) {
                    FinderPattern center = (FinderPattern) this.possibleCenters.get(index);
                    if (center.aboutEquals(estimatedModuleSize, centerI, centerJ)) {
                        this.possibleCenters.set(index, center.combineEstimate(centerI, centerJ, estimatedModuleSize));
                        found = true;
                        break;
                    }
                }
                if (!found) {
                    FinderPattern point = new FinderPattern(centerJ, centerI, estimatedModuleSize);
                    this.possibleCenters.add(point);
                    if (this.resultPointCallback != null) {
                        this.resultPointCallback.foundPossibleResultPoint(point);
                    }
                }
                return true;
            }
        }
        return false;
    }

    private int findRowSkip() {
        if (this.possibleCenters.size() <= 1) {
            return 0;
        }
        ResultPoint firstConfirmedCenter = null;
        for (ResultPoint center : this.possibleCenters) {
            if (center.getCount() >= 2) {
                if (firstConfirmedCenter == null) {
                    firstConfirmedCenter = center;
                } else {
                    this.hasSkipped = true;
                    return ((int) (Math.abs(firstConfirmedCenter.getX() - center.getX()) - Math.abs(firstConfirmedCenter.getY() - center.getY()))) / 2;
                }
            }
        }
        return 0;
    }

    private boolean haveMultiplyConfirmedCenters() {
        float totalDeviation;
        int confirmedCount = 0;
        float totalModuleSize = 0.0f;
        int max = this.possibleCenters.size();
        for (FinderPattern pattern : this.possibleCenters) {
            if (pattern.getCount() >= 2) {
                confirmedCount++;
                totalModuleSize += pattern.getEstimatedModuleSize();
            }
        }
        boolean z = false;
        if (confirmedCount < 3) {
            return false;
        }
        float average = totalModuleSize / ((float) max);
        totalDeviation = 0.0f;
        for (FinderPattern pattern2 : this.possibleCenters) {
            totalDeviation += Math.abs(pattern2.getEstimatedModuleSize() - average);
        }
        if (totalDeviation <= 0.05f * totalModuleSize) {
            z = true;
        }
        return z;
    }

    private FinderPattern[] selectBestPatterns() throws NotFoundException {
        int startSize = this.possibleCenters.size();
        if (startSize >= 3) {
            float totalModuleSize;
            if (startSize > 3) {
                float size;
                totalModuleSize = 0.0f;
                float square = 0.0f;
                for (FinderPattern center : this.possibleCenters) {
                    size = center.getEstimatedModuleSize();
                    totalModuleSize += size;
                    square += size * size;
                }
                float average = totalModuleSize / ((float) startSize);
                float stdDev = (float) Math.sqrt((double) ((square / ((float) startSize)) - (average * average)));
                Collections.sort(this.possibleCenters, new FurthestFromAverageComparator(average, null));
                size = Math.max(0.2f * average, stdDev);
                int i = 0;
                while (i < this.possibleCenters.size() && this.possibleCenters.size() > 3) {
                    if (Math.abs(((FinderPattern) this.possibleCenters.get(i)).getEstimatedModuleSize() - average) > size) {
                        this.possibleCenters.remove(i);
                        i--;
                    }
                    i++;
                }
            }
            if (this.possibleCenters.size() > 3) {
                totalModuleSize = 0.0f;
                for (FinderPattern possibleCenter : this.possibleCenters) {
                    totalModuleSize += possibleCenter.getEstimatedModuleSize();
                }
                Collections.sort(this.possibleCenters, new CenterComparator(totalModuleSize / ((float) this.possibleCenters.size()), null));
                this.possibleCenters.subList(3, this.possibleCenters.size()).clear();
            }
            return new FinderPattern[]{(FinderPattern) this.possibleCenters.get(0), (FinderPattern) this.possibleCenters.get(1), (FinderPattern) this.possibleCenters.get(2)};
        }
        throw NotFoundException.getNotFoundInstance();
    }
}
