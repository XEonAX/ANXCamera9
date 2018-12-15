package com.google.zxing.oned.rss.expanded;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.DecodeHintType;
import com.google.zxing.FormatException;
import com.google.zxing.NotFoundException;
import com.google.zxing.Result;
import com.google.zxing.ResultPoint;
import com.google.zxing.common.BitArray;
import com.google.zxing.oned.OneDReader;
import com.google.zxing.oned.rss.AbstractRSSReader;
import com.google.zxing.oned.rss.DataCharacter;
import com.google.zxing.oned.rss.FinderPattern;
import com.google.zxing.oned.rss.RSSUtils;
import com.google.zxing.oned.rss.expanded.decoders.AbstractExpandedDecoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public final class RSSExpandedReader extends AbstractRSSReader {
    private static final int[] EVEN_TOTAL_SUBSET = new int[]{4, 20, 52, 104, 204};
    private static final int[][] FINDER_PATTERNS = new int[][]{new int[]{1, 8, 4, 1}, new int[]{3, 6, 4, 1}, new int[]{3, 4, 6, 1}, new int[]{3, 2, 8, 1}, new int[]{2, 6, 5, 1}, new int[]{2, 2, 9, 1}};
    private static final int[][] FINDER_PATTERN_SEQUENCES;
    private static final int FINDER_PAT_A = 0;
    private static final int FINDER_PAT_B = 1;
    private static final int FINDER_PAT_C = 2;
    private static final int FINDER_PAT_D = 3;
    private static final int FINDER_PAT_E = 4;
    private static final int FINDER_PAT_F = 5;
    private static final int[] GSUM;
    private static final int MAX_PAIRS = 11;
    private static final int[] SYMBOL_WIDEST = new int[]{7, 5, 4, 3, 1};
    private static final int[][] WEIGHTS = new int[][]{new int[]{1, 3, 9, 27, 81, 32, 96, 77}, new int[]{20, 60, 180, 118, 143, 7, 21, 63}, new int[]{189, 145, 13, 39, 117, 140, 209, 205}, new int[]{193, 157, 49, 147, 19, 57, 171, 91}, new int[]{62, 186, 136, 197, 169, 85, 44, 132}, new int[]{185, 133, 188, 142, 4, 12, 36, 108}, new int[]{113, 128, 173, 97, 80, 29, 87, 50}, new int[]{150, 28, 84, 41, 123, 158, 52, 156}, new int[]{46, 138, 203, 187, 139, 206, 196, 166}, new int[]{76, 17, 51, 153, 37, 111, 122, 155}, new int[]{43, 129, 176, 106, 107, 110, 119, 146}, new int[]{16, 48, 144, 10, 30, 90, 59, 177}, new int[]{109, 116, 137, 200, 178, 112, 125, 164}, new int[]{70, 210, 208, 202, 184, 130, 179, 115}, new int[]{134, 191, 151, 31, 93, 68, 204, 190}, new int[]{148, 22, 66, 198, 172, 94, 71, 2}, new int[]{6, 18, 54, 162, 64, 192, 154, 40}, new int[]{120, 149, 25, 75, 14, 42, 126, 167}, new int[]{79, 26, 78, 23, 69, 207, 199, 175}, new int[]{103, 98, 83, 38, 114, 131, 182, 124}, new int[]{161, 61, 183, 127, 170, 88, 53, 159}, new int[]{55, 165, 73, 8, 24, 72, 5, 15}, new int[]{45, 135, 194, 160, 58, 174, 100, 89}};
    private final List<ExpandedPair> pairs = new ArrayList(11);
    private final List<ExpandedRow> rows = new ArrayList();
    private final int[] startEnd = new int[2];
    private boolean startFromEven = false;

    static {
        int[] iArr = new int[5];
        iArr[1] = 348;
        iArr[2] = 1388;
        iArr[3] = 2948;
        iArr[4] = 3988;
        GSUM = iArr;
        r6 = new int[10][];
        int[] iArr2 = new int[]{1, 1, iArr2};
        iArr2 = new int[]{2, 1, 3, iArr2};
        iArr2 = new int[]{4, 1, 3, 2, iArr2};
        iArr2 = new int[]{4, 1, 3, 3, 5, iArr2};
        iArr2 = new int[]{4, 1, 3, 4, 5, 5, iArr2};
        iArr2 = new int[8];
        iArr2[2] = 1;
        iArr2[3] = 1;
        iArr2[4] = 2;
        iArr2[5] = 2;
        iArr2[6] = 3;
        iArr2[7] = 3;
        r6[6] = iArr2;
        iArr2 = new int[9];
        iArr2[2] = 1;
        iArr2[3] = 1;
        iArr2[4] = 2;
        iArr2[5] = 2;
        iArr2[6] = 3;
        iArr2[7] = 4;
        iArr2[8] = 4;
        r6[7] = iArr2;
        iArr2 = new int[10];
        iArr2[2] = 1;
        iArr2[3] = 1;
        iArr2[4] = 2;
        iArr2[5] = 2;
        iArr2[6] = 3;
        iArr2[7] = 4;
        iArr2[8] = 5;
        iArr2[9] = 5;
        r6[8] = iArr2;
        iArr2 = new int[11];
        iArr2[2] = 1;
        iArr2[3] = 1;
        iArr2[4] = 2;
        iArr2[5] = 3;
        iArr2[6] = 3;
        iArr2[7] = 4;
        iArr2[8] = 4;
        iArr2[9] = 5;
        iArr2[10] = 5;
        r6[9] = iArr2;
        FINDER_PATTERN_SEQUENCES = r6;
    }

    public Result decodeRow(int rowNumber, BitArray row, Map<DecodeHintType, ?> map) throws NotFoundException, FormatException {
        this.pairs.clear();
        this.startFromEven = false;
        try {
            return constructResult(decodeRow2pairs(rowNumber, row));
        } catch (NotFoundException e) {
            this.pairs.clear();
            this.startFromEven = true;
            return constructResult(decodeRow2pairs(rowNumber, row));
        }
    }

    public void reset() {
        this.pairs.clear();
        this.rows.clear();
    }

    List<ExpandedPair> decodeRow2pairs(int rowNumber, BitArray row) throws NotFoundException {
        while (true) {
            try {
                this.pairs.add(retrieveNextPair(row, this.pairs, rowNumber));
            } catch (NotFoundException nfe) {
                NotFoundException nfe2;
                if (this.pairs.isEmpty()) {
                    throw nfe2;
                } else if (checkChecksum() != null) {
                    return this.pairs;
                } else {
                    nfe2 = this.rows.isEmpty() ^ 1;
                    storeRow(rowNumber, false);
                    if (nfe2 != null) {
                        List<ExpandedPair> ps = checkRows(null);
                        if (ps != null) {
                            return ps;
                        }
                        List<ExpandedPair> ps2 = checkRows(true);
                        if (ps2 != null) {
                            return ps2;
                        }
                    }
                    throw NotFoundException.getNotFoundInstance();
                }
            }
        }
    }

    private List<ExpandedPair> checkRows(boolean reverse) {
        if (this.rows.size() > 25) {
            this.rows.clear();
            return null;
        }
        this.pairs.clear();
        if (reverse) {
            Collections.reverse(this.rows);
        }
        List<ExpandedPair> ps = null;
        try {
            ps = checkRows(new ArrayList(), 0);
        } catch (NotFoundException e) {
        }
        if (reverse) {
            Collections.reverse(this.rows);
        }
        return ps;
    }

    private List<ExpandedPair> checkRows(List<ExpandedRow> collectedRows, int currentRow) throws NotFoundException {
        for (int i = currentRow; i < this.rows.size(); i++) {
            int j;
            ExpandedRow row = (ExpandedRow) this.rows.get(i);
            this.pairs.clear();
            int size = collectedRows.size();
            for (j = 0; j < size; j++) {
                this.pairs.addAll(((ExpandedRow) collectedRows.get(j)).getPairs());
            }
            this.pairs.addAll(row.getPairs());
            if (isValidSequence(this.pairs)) {
                if (checkChecksum()) {
                    return this.pairs;
                }
                j = new ArrayList();
                j.addAll(collectedRows);
                j.add(row);
                try {
                    return checkRows(j, i + 1);
                } catch (NotFoundException e) {
                }
            }
        }
        throw NotFoundException.getNotFoundInstance();
    }

    private static boolean isValidSequence(List<ExpandedPair> pairs) {
        for (int[] sequence : FINDER_PATTERN_SEQUENCES) {
            if (pairs.size() <= sequence.length) {
                boolean stop = true;
                for (int j = 0; j < pairs.size(); j++) {
                    if (((ExpandedPair) pairs.get(j)).getFinderPattern().getValue() != sequence[j]) {
                        stop = false;
                        break;
                    }
                }
                if (stop) {
                    return true;
                }
            }
        }
        return false;
    }

    /* JADX WARNING: Missing block: B:13:0x0045, code:
            return;
     */
    private void storeRow(int r7, boolean r8) {
        /*
        r6 = this;
        r0 = 0;
        r1 = 0;
        r2 = 0;
    L_0x0003:
        r3 = r6.rows;
        r3 = r3.size();
        if (r0 < r3) goto L_0x000c;
    L_0x000b:
        goto L_0x0021;
    L_0x000c:
        r3 = r6.rows;
        r3 = r3.get(r0);
        r3 = (com.google.zxing.oned.rss.expanded.ExpandedRow) r3;
        r4 = r3.getRowNumber();
        if (r4 <= r7) goto L_0x0046;
    L_0x001a:
        r4 = r6.pairs;
        r2 = r3.isEquivalent(r4);
    L_0x0021:
        if (r2 != 0) goto L_0x0045;
    L_0x0023:
        if (r1 == 0) goto L_0x0026;
    L_0x0025:
        goto L_0x0045;
    L_0x0026:
        r3 = r6.pairs;
        r4 = r6.rows;
        r3 = isPartialRow(r3, r4);
        if (r3 == 0) goto L_0x0031;
    L_0x0030:
        return;
    L_0x0031:
        r3 = r6.rows;
        r4 = new com.google.zxing.oned.rss.expanded.ExpandedRow;
        r5 = r6.pairs;
        r4.<init>(r5, r7, r8);
        r3.add(r0, r4);
        r3 = r6.pairs;
        r4 = r6.rows;
        removePartialRows(r3, r4);
        return;
    L_0x0045:
        return;
    L_0x0046:
        r4 = r6.pairs;
        r1 = r3.isEquivalent(r4);
        r0 = r0 + 1;
        goto L_0x0003;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.zxing.oned.rss.expanded.RSSExpandedReader.storeRow(int, boolean):void");
    }

    private static void removePartialRows(List<ExpandedPair> pairs, List<ExpandedRow> rows) {
        Iterator<ExpandedRow> iterator = rows.iterator();
        while (iterator.hasNext()) {
            ExpandedRow r = (ExpandedRow) iterator.next();
            if (r.getPairs().size() != pairs.size()) {
                boolean allFound = true;
                for (ExpandedPair p : r.getPairs()) {
                    boolean found = false;
                    for (ExpandedPair pp : pairs) {
                        if (p.equals(pp)) {
                            found = true;
                            continue;
                            break;
                        }
                    }
                    if (!found) {
                        allFound = false;
                        break;
                    }
                }
                if (allFound) {
                    iterator.remove();
                }
            }
        }
    }

    private static boolean isPartialRow(Iterable<ExpandedPair> pairs, Iterable<ExpandedRow> rows) {
        for (ExpandedRow r : rows) {
            boolean allFound = true;
            for (ExpandedPair p : pairs) {
                boolean found = false;
                for (ExpandedPair pp : r.getPairs()) {
                    if (p.equals(pp)) {
                        found = true;
                        continue;
                        break;
                    }
                }
                if (!found) {
                    allFound = false;
                    continue;
                    break;
                }
            }
            if (allFound) {
                return true;
            }
        }
        return false;
    }

    List<ExpandedRow> getRows() {
        return this.rows;
    }

    static Result constructResult(List<ExpandedPair> pairs) throws NotFoundException, FormatException {
        String resultingString = AbstractExpandedDecoder.createDecoder(BitArrayBuilder.buildBitArray(pairs)).parseInformation();
        ResultPoint[] firstPoints = ((ExpandedPair) pairs.get(0)).getFinderPattern().getResultPoints();
        ResultPoint[] lastPoints = ((ExpandedPair) pairs.get(pairs.size() - 1)).getFinderPattern().getResultPoints();
        return new Result(resultingString, null, new ResultPoint[]{firstPoints[0], firstPoints[1], lastPoints[0], lastPoints[1]}, BarcodeFormat.RSS_EXPANDED);
    }

    private boolean checkChecksum() {
        boolean z = false;
        ExpandedPair firstPair = (ExpandedPair) this.pairs.get(0);
        DataCharacter checkCharacter = firstPair.getLeftChar();
        DataCharacter firstCharacter = firstPair.getRightChar();
        if (firstCharacter == null) {
            return false;
        }
        int checksum = firstCharacter.getChecksumPortion();
        int s = 2;
        for (int i = 1; i < this.pairs.size(); i++) {
            ExpandedPair currentPair = (ExpandedPair) this.pairs.get(i);
            checksum += currentPair.getLeftChar().getChecksumPortion();
            s++;
            DataCharacter currentRightChar = currentPair.getRightChar();
            if (currentRightChar != null) {
                checksum += currentRightChar.getChecksumPortion();
                s++;
            }
        }
        if ((211 * (s - 4)) + (checksum % 211) == checkCharacter.getValue()) {
            z = true;
        }
        return z;
    }

    private static int getNextSecondBar(BitArray row, int initialPos) {
        if (row.get(initialPos)) {
            return row.getNextSet(row.getNextUnset(initialPos));
        }
        return row.getNextUnset(row.getNextSet(initialPos));
    }

    ExpandedPair retrieveNextPair(BitArray row, List<ExpandedPair> previousPairs, int rowNumber) throws NotFoundException {
        FinderPattern pattern;
        boolean isOddPattern = previousPairs.size() % 2 == 0;
        if (this.startFromEven) {
            isOddPattern = isOddPattern ? null : true;
        }
        boolean keepFinding = true;
        int forcedOffset = -1;
        do {
            findNextPair(row, previousPairs, forcedOffset);
            pattern = parseFoundFinderPattern(row, rowNumber, isOddPattern);
            if (pattern == null) {
                forcedOffset = getNextSecondBar(row, this.startEnd[0]);
                continue;
            } else {
                keepFinding = false;
                continue;
            }
        } while (keepFinding);
        DataCharacter leftChar = decodeDataCharacter(row, pattern, isOddPattern, true);
        if (previousPairs.isEmpty() || !((ExpandedPair) previousPairs.get(previousPairs.size() - 1)).mustBeLast()) {
            DataCharacter rightChar;
            try {
                rightChar = decodeDataCharacter(row, pattern, isOddPattern, false);
            } catch (NotFoundException e) {
                rightChar = null;
            }
            return new ExpandedPair(leftChar, rightChar, pattern, true);
        }
        throw NotFoundException.getNotFoundInstance();
    }

    /* JADX WARNING: Removed duplicated region for block: B:11:0x0048  */
    /* JADX WARNING: Removed duplicated region for block: B:10:0x0046  */
    /* JADX WARNING: Removed duplicated region for block: B:14:0x004d  */
    /* JADX WARNING: Removed duplicated region for block: B:20:0x0057  */
    /* JADX WARNING: Removed duplicated region for block: B:24:0x0065  */
    private void findNextPair(com.google.zxing.common.BitArray r18, java.util.List<com.google.zxing.oned.rss.expanded.ExpandedPair> r19, int r20) throws com.google.zxing.NotFoundException {
        /*
        r17 = this;
        r0 = r17;
        r1 = r18;
        r2 = r17.getDecodeFinderCounters();
        r3 = 0;
        r2[r3] = r3;
        r4 = 1;
        r2[r4] = r3;
        r5 = 2;
        r2[r5] = r3;
        r6 = 3;
        r2[r6] = r3;
        r7 = r18.getSize();
        if (r20 < 0) goto L_0x0020;
    L_0x001a:
        r8 = r20;
    L_0x001d:
        r9 = r19;
        goto L_0x003f;
    L_0x0020:
        r8 = r19.isEmpty();
        if (r8 == 0) goto L_0x0028;
    L_0x0026:
        r8 = 0;
        goto L_0x001d;
    L_0x0028:
        r8 = r19.size();
        r8 = r8 - r4;
        r9 = r19;
        r8 = r9.get(r8);
        r8 = (com.google.zxing.oned.rss.expanded.ExpandedPair) r8;
        r10 = r8.getFinderPattern();
        r10 = r10.getStartEnd();
        r8 = r10[r4];
    L_0x003f:
        r10 = r19.size();
        r10 = r10 % r5;
        if (r10 == 0) goto L_0x0048;
    L_0x0046:
        r10 = r4;
        goto L_0x0049;
    L_0x0048:
        r10 = r3;
    L_0x0049:
        r11 = r0.startFromEven;
        if (r11 == 0) goto L_0x0053;
    L_0x004d:
        if (r10 == 0) goto L_0x0051;
    L_0x004f:
        r11 = r3;
        goto L_0x0052;
    L_0x0051:
        r11 = r4;
    L_0x0052:
        r10 = r11;
    L_0x0053:
        r11 = 0;
    L_0x0054:
        if (r8 < r7) goto L_0x0057;
    L_0x0056:
        goto L_0x0060;
    L_0x0057:
        r12 = r1.get(r8);
        r12 = r12 ^ r4;
        r11 = r12;
        if (r11 != 0) goto L_0x00b5;
    L_0x0060:
        r12 = 0;
        r13 = r8;
        r14 = r8;
    L_0x0063:
        if (r14 >= r7) goto L_0x00b0;
    L_0x0065:
        r15 = r1.get(r14);
        r15 = r15 ^ r11;
        if (r15 == 0) goto L_0x0072;
    L_0x006c:
        r15 = r2[r12];
        r15 = r15 + r4;
        r2[r12] = r15;
        goto L_0x00ad;
    L_0x0072:
        if (r12 != r6) goto L_0x00a3;
    L_0x0074:
        if (r10 == 0) goto L_0x0079;
    L_0x0076:
        reverseCounters(r2);
    L_0x0079:
        r15 = com.google.zxing.oned.rss.AbstractRSSReader.isFinderPattern(r2);
        if (r15 == 0) goto L_0x0088;
    L_0x007f:
        r5 = r0.startEnd;
        r5[r3] = r13;
        r3 = r0.startEnd;
        r3[r4] = r14;
        return;
    L_0x0088:
        if (r10 == 0) goto L_0x008d;
    L_0x008a:
        reverseCounters(r2);
    L_0x008d:
        r15 = r2[r3];
        r16 = r2[r4];
        r15 = r15 + r16;
        r13 = r13 + r15;
        r15 = r2[r5];
        r2[r3] = r15;
        r15 = r2[r6];
        r2[r4] = r15;
        r2[r5] = r3;
        r2[r6] = r3;
        r12 = r12 + -1;
        goto L_0x00a5;
    L_0x00a3:
        r12 = r12 + 1;
    L_0x00a5:
        r2[r12] = r4;
        if (r11 == 0) goto L_0x00ab;
    L_0x00a9:
        r15 = r3;
        goto L_0x00ac;
    L_0x00ab:
        r15 = r4;
    L_0x00ac:
        r11 = r15;
    L_0x00ad:
        r14 = r14 + 1;
        goto L_0x0063;
    L_0x00b0:
        r3 = com.google.zxing.NotFoundException.getNotFoundInstance();
        throw r3;
    L_0x00b5:
        r8 = r8 + 1;
        goto L_0x0054;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.zxing.oned.rss.expanded.RSSExpandedReader.findNextPair(com.google.zxing.common.BitArray, java.util.List, int):void");
    }

    private static void reverseCounters(int[] counters) {
        int length = counters.length;
        for (int i = 0; i < length / 2; i++) {
            int tmp = counters[i];
            counters[i] = counters[(length - i) - 1];
            counters[(length - i) - 1] = tmp;
        }
    }

    private FinderPattern parseFoundFinderPattern(BitArray row, int rowNumber, boolean oddPattern) {
        int firstElementStart;
        int firstCounter;
        int start;
        BitArray bitArray = row;
        if (oddPattern) {
            firstElementStart = this.startEnd[0] - 1;
            while (firstElementStart >= 0 && !bitArray.get(firstElementStart)) {
                firstElementStart--;
            }
            firstElementStart++;
            firstCounter = this.startEnd[0] - firstElementStart;
            start = firstElementStart;
            firstElementStart = this.startEnd[1];
        } else {
            start = this.startEnd[0];
            firstElementStart = bitArray.getNextUnset(this.startEnd[1] + 1);
            firstCounter = firstElementStart - this.startEnd[1];
        }
        int start2 = start;
        int[] counters = getDecodeFinderCounters();
        System.arraycopy(counters, 0, counters, 1, counters.length - 1);
        counters[0] = firstCounter;
        try {
            return new FinderPattern(AbstractRSSReader.parseFinderValue(counters, FINDER_PATTERNS), new int[]{start2, firstElementStart}, start2, firstElementStart, rowNumber);
        } catch (NotFoundException e) {
            return null;
        }
    }

    DataCharacter decodeDataCharacter(BitArray row, FinderPattern pattern, boolean isOddPattern, boolean leftChar) throws NotFoundException {
        int i;
        int j;
        int i2;
        BitArray bitArray = row;
        int[] counters = getDataCharacterCounters();
        int i3 = 0;
        counters[0] = 0;
        int i4 = 1;
        counters[1] = 0;
        int i5 = 2;
        counters[2] = 0;
        counters[3] = 0;
        int i6 = 4;
        counters[4] = 0;
        counters[5] = 0;
        counters[6] = 0;
        counters[7] = 0;
        if (leftChar) {
            OneDReader.recordPatternInReverse(bitArray, pattern.getStartEnd()[0], counters);
        } else {
            OneDReader.recordPattern(bitArray, pattern.getStartEnd()[1], counters);
            i = 0;
            j = counters.length - 1;
            while (i < j) {
                i6 = i3;
                i2 = i4;
                i3 = counters[i];
                counters[i] = counters[j];
                counters[j] = i3;
                i++;
                j--;
                i4 = i2;
                i3 = i6;
                bitArray = row;
                i5 = 2;
                i6 = 4;
            }
        }
        i = 17;
        j = ((float) AbstractRSSReader.count(counters)) / ((float) 17);
        float expectedElementWidth = ((float) (pattern.getStartEnd()[i4] - pattern.getStartEnd()[i3])) / 15.0f;
        int numModules;
        if (Math.abs(j - expectedElementWidth) / expectedElementWidth <= 0.3f) {
            int[] oddCounts = getOddCounts();
            int[] evenCounts = getEvenCounts();
            float[] oddRoundingErrors = getOddRoundingErrors();
            float[] evenRoundingErrors = getEvenRoundingErrors();
            int i7 = 0;
            while (i7 < counters.length) {
                float f;
                i2 = i6;
                numModules = i;
                i6 = i3;
                float value = (1.0f * ((float) counters[i7])) / j;
                i4 = (int) (1056964608 + value);
                if (i4 < 1) {
                    f = 0.3f;
                    if (value >= 0.3f) {
                        i4 = 1;
                    } else {
                        throw NotFoundException.getNotFoundInstance();
                    }
                }
                f = 0.3f;
                if (i4 > 8) {
                    if (value <= 8.7f) {
                        i4 = 8;
                    } else {
                        throw NotFoundException.getNotFoundInstance();
                    }
                }
                i2 = i7 / 2;
                if ((i7 & 1) == 0) {
                    oddCounts[i2] = i4;
                    oddRoundingErrors[i2] = value - ((float) i4);
                } else {
                    evenCounts[i2] = i4;
                    evenRoundingErrors[i2] = value - ((float) i4);
                }
                i7++;
                i3 = i6;
                i4 = 1;
                float f2 = f;
                i = numModules;
                bitArray = row;
                i5 = 2;
                i6 = 4;
            }
            adjustOddEvenCounts(i);
            int weightRowNumber = (((pattern.getValue() * i6) + (isOddPattern ? i3 : i5)) + (leftChar ^ 1)) - 1;
            i7 = 0;
            int oddChecksumPortion = 0;
            i3 = oddCounts.length - i4;
            while (i3 >= 0) {
                i2 = i6;
                numModules = i;
                if (isNotA1left(pattern, isOddPattern, leftChar)) {
                    oddChecksumPortion += oddCounts[i3] * WEIGHTS[weightRowNumber][2 * i3];
                }
                i7 += oddCounts[i3];
                i3--;
                i6 = i2;
                i = numModules;
                bitArray = row;
                i4 = 1;
            }
            i3 = 0;
            i5 = evenCounts.length - i4;
            while (i5 >= 0) {
                i2 = i6;
                numModules = i;
                if (isNotA1left(pattern, isOddPattern, leftChar)) {
                    i3 += evenCounts[i5] * WEIGHTS[weightRowNumber][(2 * i5) + 1];
                }
                i5--;
                i6 = i2;
                i = numModules;
                bitArray = row;
            }
            i5 = oddChecksumPortion + i3;
            if ((i7 & 1) != 0 || i7 > 13 || i7 < i6) {
                numModules = i;
                throw NotFoundException.getNotFoundInstance();
            }
            i4 = (13 - i7) / 2;
            i6 = SYMBOL_WIDEST[i4];
            i2 = 9 - i6;
            numModules = i;
            return new DataCharacter(((RSSUtils.getRSSvalue(oddCounts, i6, 1) * EVEN_TOTAL_SUBSET[i4]) + RSSUtils.getRSSvalue(evenCounts, i2, 0)) + GSUM[i4], i5);
        }
        numModules = 17;
        throw NotFoundException.getNotFoundInstance();
    }

    private static boolean isNotA1left(FinderPattern pattern, boolean isOddPattern, boolean leftChar) {
        return (pattern.getValue() == 0 && isOddPattern && leftChar) ? false : true;
    }

    private void adjustOddEvenCounts(int numModules) throws NotFoundException {
        int oddSum = AbstractRSSReader.count(getOddCounts());
        int evenSum = AbstractRSSReader.count(getEvenCounts());
        int mismatch = (oddSum + evenSum) - numModules;
        boolean evenParityBad = false;
        boolean oddParityBad = (oddSum & 1) == 1;
        if ((evenSum & 1) == 0) {
            evenParityBad = true;
        }
        boolean incrementOdd = false;
        boolean decrementOdd = false;
        if (oddSum > 13) {
            decrementOdd = true;
        } else if (oddSum < 4) {
            incrementOdd = true;
        }
        boolean incrementEven = false;
        boolean decrementEven = false;
        if (evenSum > 13) {
            decrementEven = true;
        } else if (evenSum < 4) {
            incrementEven = true;
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
