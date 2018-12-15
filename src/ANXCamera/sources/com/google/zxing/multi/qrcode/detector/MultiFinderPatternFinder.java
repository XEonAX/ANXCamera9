package com.google.zxing.multi.qrcode.detector;

import com.google.zxing.DecodeHintType;
import com.google.zxing.NotFoundException;
import com.google.zxing.ResultPoint;
import com.google.zxing.ResultPointCallback;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.detector.FinderPattern;
import com.google.zxing.qrcode.detector.FinderPatternFinder;
import com.google.zxing.qrcode.detector.FinderPatternInfo;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

final class MultiFinderPatternFinder extends FinderPatternFinder {
    private static final float DIFF_MODSIZE_CUTOFF = 0.5f;
    private static final float DIFF_MODSIZE_CUTOFF_PERCENT = 0.05f;
    private static final FinderPatternInfo[] EMPTY_RESULT_ARRAY = new FinderPatternInfo[0];
    private static final float MAX_MODULE_COUNT_PER_EDGE = 180.0f;
    private static final float MIN_MODULE_COUNT_PER_EDGE = 9.0f;

    private static final class ModuleSizeComparator implements Comparator<FinderPattern>, Serializable {
        private ModuleSizeComparator() {
        }

        /* synthetic */ ModuleSizeComparator(ModuleSizeComparator moduleSizeComparator) {
            this();
        }

        public int compare(FinderPattern center1, FinderPattern center2) {
            float value = center2.getEstimatedModuleSize() - center1.getEstimatedModuleSize();
            if (((double) value) < 0.0d) {
                return -1;
            }
            return ((double) value) > 0.0d ? 1 : 0;
        }
    }

    MultiFinderPatternFinder(BitMatrix image) {
        super(image);
    }

    MultiFinderPatternFinder(BitMatrix image, ResultPointCallback resultPointCallback) {
        super(image, resultPointCallback);
    }

    private FinderPattern[][] selectMutipleBestPatterns() throws NotFoundException {
        List<FinderPattern> possibleCenters = getPossibleCenters();
        int size = possibleCenters.size();
        int i = 3;
        int size2;
        if (size >= 3) {
            int i2 = 0;
            int i3 = 1;
            if (size == 3) {
                FinderPattern[][] finderPatternArr = new FinderPattern[1][];
                finderPatternArr[0] = new FinderPattern[]{(FinderPattern) possibleCenters.get(0), (FinderPattern) possibleCenters.get(1), (FinderPattern) possibleCenters.get(2)};
                return finderPatternArr;
            }
            Collections.sort(possibleCenters, new ModuleSizeComparator());
            List<FinderPattern[]> results = new ArrayList();
            for (int i1 = 0; i1 < size - 2; i1++) {
                FinderPattern p1 = (FinderPattern) possibleCenters.get(i1);
                if (p1 != null) {
                    int i22 = i1 + 1;
                    while (i22 < size - 1) {
                        FinderPattern p2 = (FinderPattern) possibleCenters.get(i22);
                        if (p2 != null) {
                            float vModSize12 = (p1.getEstimatedModuleSize() - p2.getEstimatedModuleSize()) / Math.min(p1.getEstimatedModuleSize(), p2.getEstimatedModuleSize());
                            float f = 0.5f;
                            int i4 = (Math.abs(p1.getEstimatedModuleSize() - p2.getEstimatedModuleSize()) > 0.5f ? 1 : (Math.abs(p1.getEstimatedModuleSize() - p2.getEstimatedModuleSize()) == 0.5f ? 0 : -1));
                            float f2 = DIFF_MODSIZE_CUTOFF_PERCENT;
                            if (i4 > 0 && vModSize12 >= DIFF_MODSIZE_CUTOFF_PERCENT) {
                                break;
                            }
                            i4 = i22 + 1;
                            while (i4 < size) {
                                int i5;
                                int i6;
                                int i7;
                                List<FinderPattern> possibleCenters2;
                                FinderPattern p3 = (FinderPattern) possibleCenters.get(i4);
                                if (p3 != null) {
                                    float vModSize23 = (p2.getEstimatedModuleSize() - p3.getEstimatedModuleSize()) / Math.min(p2.getEstimatedModuleSize(), p3.getEstimatedModuleSize());
                                    if (Math.abs(p2.getEstimatedModuleSize() - p3.getEstimatedModuleSize()) > f && vModSize23 >= f2) {
                                        break;
                                    }
                                    FinderPattern[] test = new FinderPattern[i];
                                    i5 = 0;
                                    test[0] = p1;
                                    i6 = 1;
                                    test[1] = p2;
                                    i7 = 2;
                                    test[2] = p3;
                                    ResultPoint.orderBestPatterns(test);
                                    FinderPatternInfo info = new FinderPatternInfo(test);
                                    f = ResultPoint.distance(info.getTopLeft(), info.getBottomLeft());
                                    possibleCenters2 = possibleCenters;
                                    possibleCenters = ResultPoint.distance(info.getTopRight(), info.getBottomLeft());
                                    size2 = size;
                                    float dB = ResultPoint.distance(info.getTopLeft(), info.getTopRight());
                                    f2 = (f + dB) / (p1.getEstimatedModuleSize() * 2.0f);
                                    if (f2 <= MAX_MODULE_COUNT_PER_EDGE && f2 >= 9.0f) {
                                        float vABBC = Math.abs((f - dB) / Math.min(f, dB));
                                        if (vABBC < 0.1f) {
                                            dB = (float) Math.sqrt((double) ((f * f) + (dB * dB)));
                                            if (Math.abs((possibleCenters - dB) / Math.min(possibleCenters, dB)) < 0.1f) {
                                                results.add(test);
                                            }
                                        }
                                    }
                                } else {
                                    possibleCenters2 = possibleCenters;
                                    size2 = size;
                                    i5 = i2;
                                    i6 = i3;
                                    i7 = 2;
                                }
                                i4++;
                                int i8 = i7;
                                i2 = i5;
                                i3 = i6;
                                possibleCenters = possibleCenters2;
                                size = size2;
                                i = 3;
                                f = 0.5f;
                                f2 = DIFF_MODSIZE_CUTOFF_PERCENT;
                            }
                        }
                        i22++;
                        i2 = 0;
                        i3 = 1;
                    }
                }
            }
            if (!results.isEmpty()) {
                return (FinderPattern[][]) results.toArray(new FinderPattern[results.size()][]);
            }
            throw NotFoundException.getNotFoundInstance();
        }
        size2 = size;
        throw NotFoundException.getNotFoundInstance();
    }

    public FinderPatternInfo[] findMulti(Map<DecodeHintType, ?> hints) throws NotFoundException {
        int j;
        Map<DecodeHintType, ?> map = hints;
        int i = 0;
        boolean tryHarder = map != null && map.containsKey(DecodeHintType.TRY_HARDER);
        boolean pureBarcode = map != null && map.containsKey(DecodeHintType.PURE_BARCODE);
        BitMatrix image = getImage();
        int maxI = image.getHeight();
        int maxJ = image.getWidth();
        int iSkip = (int) ((((float) maxI) / 228.0f) * 1077936128);
        int i2 = 3;
        if (iSkip < 3 || tryHarder) {
            iSkip = 3;
        }
        int[] stateCount = new int[5];
        int i3 = iSkip - 1;
        while (i3 < maxI) {
            stateCount[0] = 0;
            stateCount[1] = 0;
            stateCount[2] = 0;
            stateCount[i2] = 0;
            stateCount[4] = 0;
            i2 = 0;
            j = 0;
            while (j < maxJ) {
                if (image.get(j, i3)) {
                    if ((i2 & 1) == 1) {
                        i2++;
                    }
                    stateCount[i2] = stateCount[i2] + 1;
                } else if ((i2 & 1) != 0) {
                    stateCount[i2] = stateCount[i2] + 1;
                } else if (i2 != 4) {
                    i2++;
                    stateCount[i2] = stateCount[i2] + 1;
                } else if (FinderPatternFinder.foundPatternCross(stateCount) && handlePossibleCenter(stateCount, i3, j, pureBarcode)) {
                    i2 = 0;
                    stateCount[0] = 0;
                    stateCount[1] = 0;
                    stateCount[2] = 0;
                    stateCount[3] = 0;
                    stateCount[4] = 0;
                } else {
                    stateCount[0] = stateCount[2];
                    stateCount[1] = stateCount[3];
                    stateCount[2] = stateCount[4];
                    stateCount[3] = 1;
                    stateCount[4] = 0;
                    i2 = 3;
                }
                j++;
            }
            if (FinderPatternFinder.foundPatternCross(stateCount)) {
                handlePossibleCenter(stateCount, i3, maxJ, pureBarcode);
            }
            i3 += iSkip;
            i2 = 3;
        }
        FinderPattern[][] patternInfo = selectMutipleBestPatterns();
        ArrayList result = new ArrayList();
        j = patternInfo.length;
        while (i < j) {
            FinderPattern[] pattern = patternInfo[i];
            ResultPoint.orderBestPatterns(pattern);
            result.add(new FinderPatternInfo(pattern));
            i++;
        }
        if (result.isEmpty()) {
            return EMPTY_RESULT_ARRAY;
        }
        return (FinderPatternInfo[]) result.toArray(new FinderPatternInfo[result.size()]);
    }
}
