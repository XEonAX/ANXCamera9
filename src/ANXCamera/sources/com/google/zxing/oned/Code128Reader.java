package com.google.zxing.oned;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.ChecksumException;
import com.google.zxing.DecodeHintType;
import com.google.zxing.FormatException;
import com.google.zxing.NotFoundException;
import com.google.zxing.Result;
import com.google.zxing.ResultPoint;
import com.google.zxing.common.BitArray;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public final class Code128Reader extends OneDReader {
    private static final int CODE_CODE_A = 101;
    private static final int CODE_CODE_B = 100;
    private static final int CODE_CODE_C = 99;
    private static final int CODE_FNC_1 = 102;
    private static final int CODE_FNC_2 = 97;
    private static final int CODE_FNC_3 = 96;
    private static final int CODE_FNC_4_A = 101;
    private static final int CODE_FNC_4_B = 100;
    static final int[][] CODE_PATTERNS = new int[][]{new int[]{2, 1, 2, 2, 2, 2}, new int[]{2, 2, 2, 1, 2, 2}, new int[]{2, 2, 2, 2, 2, 1}, new int[]{1, 2, 1, 2, 2, 3}, new int[]{1, 2, 1, 3, 2, 2}, new int[]{1, 3, 1, 2, 2, 2}, new int[]{1, 2, 2, 2, 1, 3}, new int[]{1, 2, 2, 3, 1, 2}, new int[]{1, 3, 2, 2, 1, 2}, new int[]{2, 2, 1, 2, 1, 3}, new int[]{2, 2, 1, 3, 1, 2}, new int[]{2, 3, 1, 2, 1, 2}, new int[]{1, 1, 2, 2, 3, 2}, new int[]{1, 2, 2, 1, 3, 2}, new int[]{1, 2, 2, 2, 3, 1}, new int[]{1, 1, 3, 2, 2, 2}, new int[]{1, 2, 3, 1, 2, 2}, new int[]{1, 2, 3, 2, 2, 1}, new int[]{2, 2, 3, 2, 1, 1}, new int[]{2, 2, 1, 1, 3, 2}, new int[]{2, 2, 1, 2, 3, 1}, new int[]{2, 1, 3, 2, 1, 2}, new int[]{2, 2, 3, 1, 1, 2}, new int[]{3, 1, 2, 1, 3, 1}, new int[]{3, 1, 1, 2, 2, 2}, new int[]{3, 2, 1, 1, 2, 2}, new int[]{3, 2, 1, 2, 2, 1}, new int[]{3, 1, 2, 2, 1, 2}, new int[]{3, 2, 2, 1, 1, 2}, new int[]{3, 2, 2, 2, 1, 1}, new int[]{2, 1, 2, 1, 2, 3}, new int[]{2, 1, 2, 3, 2, 1}, new int[]{2, 3, 2, 1, 2, 1}, new int[]{1, 1, 1, 3, 2, 3}, new int[]{1, 3, 1, 1, 2, 3}, new int[]{1, 3, 1, 3, 2, 1}, new int[]{1, 1, 2, 3, 1, 3}, new int[]{1, 3, 2, 1, 1, 3}, new int[]{1, 3, 2, 3, 1, 1}, new int[]{2, 1, 1, 3, 1, 3}, new int[]{2, 3, 1, 1, 1, 3}, new int[]{2, 3, 1, 3, 1, 1}, new int[]{1, 1, 2, 1, 3, 3}, new int[]{1, 1, 2, 3, 3, 1}, new int[]{1, 3, 2, 1, 3, 1}, new int[]{1, 1, 3, 1, 2, 3}, new int[]{1, 1, 3, 3, 2, 1}, new int[]{1, 3, 3, 1, 2, 1}, new int[]{3, 1, 3, 1, 2, 1}, new int[]{2, 1, 1, 3, 3, 1}, new int[]{2, 3, 1, 1, 3, 1}, new int[]{2, 1, 3, 1, 1, 3}, new int[]{2, 1, 3, 3, 1, 1}, new int[]{2, 1, 3, 1, 3, 1}, new int[]{3, 1, 1, 1, 2, 3}, new int[]{3, 1, 1, 3, 2, 1}, new int[]{3, 3, 1, 1, 2, 1}, new int[]{3, 1, 2, 1, 1, 3}, new int[]{3, 1, 2, 3, 1, 1}, new int[]{3, 3, 2, 1, 1, 1}, new int[]{3, 1, 4, 1, 1, 1}, new int[]{2, 2, 1, 4, 1, 1}, new int[]{4, 3, 1, 1, 1, 1}, new int[]{1, 1, 1, 2, 2, 4}, new int[]{1, 1, 1, 4, 2, 2}, new int[]{1, 2, 1, 1, 2, 4}, new int[]{1, 2, 1, 4, 2, 1}, new int[]{1, 4, 1, 1, 2, 2}, new int[]{1, 4, 1, 2, 2, 1}, new int[]{1, 1, 2, 2, 1, 4}, new int[]{1, 1, 2, 4, 1, 2}, new int[]{1, 2, 2, 1, 1, 4}, new int[]{1, 2, 2, 4, 1, 1}, new int[]{1, 4, 2, 1, 1, 2}, new int[]{1, 4, 2, 2, 1, 1}, new int[]{2, 4, 1, 2, 1, 1}, new int[]{2, 2, 1, 1, 1, 4}, new int[]{4, 1, 3, 1, 1, 1}, new int[]{2, 4, 1, 1, 1, 2}, new int[]{1, 3, 4, 1, 1, 1}, new int[]{1, 1, 1, 2, 4, 2}, new int[]{1, 2, 1, 1, 4, 2}, new int[]{1, 2, 1, 2, 4, 1}, new int[]{1, 1, 4, 2, 1, 2}, new int[]{1, 2, 4, 1, 1, 2}, new int[]{1, 2, 4, 2, 1, 1}, new int[]{4, 1, 1, 2, 1, 2}, new int[]{4, 2, 1, 1, 1, 2}, new int[]{4, 2, 1, 2, 1, 1}, new int[]{2, 1, 2, 1, 4, 1}, new int[]{2, 1, 4, 1, 2, 1}, new int[]{4, 1, 2, 1, 2, 1}, new int[]{1, 1, 1, 1, 4, 3}, new int[]{1, 1, 1, 3, 4, 1}, new int[]{1, 3, 1, 1, 4, 1}, new int[]{1, 1, 4, 1, 1, 3}, new int[]{1, 1, 4, 3, 1, 1}, new int[]{4, 1, 1, 1, 1, 3}, new int[]{4, 1, 1, 3, 1, 1}, new int[]{1, 1, 3, 1, 4, 1}, new int[]{1, 1, 4, 1, 3, 1}, new int[]{3, 1, 1, 1, 4, 1}, new int[]{4, 1, 1, 1, 3, 1}, new int[]{2, 1, 1, 4, 1, 2}, new int[]{2, 1, 1, 2, 1, 4}, new int[]{2, 1, 1, 2, 3, 2}, new int[]{2, 3, 3, 1, 1, 1, 2}};
    private static final int CODE_SHIFT = 98;
    private static final int CODE_START_A = 103;
    private static final int CODE_START_B = 104;
    private static final int CODE_START_C = 105;
    private static final int CODE_STOP = 106;
    private static final float MAX_AVG_VARIANCE = 0.25f;
    private static final float MAX_INDIVIDUAL_VARIANCE = 0.7f;

    private static int[] findStartPattern(BitArray row) throws NotFoundException {
        int width = row.getSize();
        int rowOffset = row.getNextSet(0);
        int counterPosition = 0;
        int[] counters = new int[6];
        int patternStart = rowOffset;
        boolean isWhite = false;
        int patternLength = counters.length;
        int i = rowOffset;
        while (i < width) {
            boolean z = true;
            if ((row.get(i) ^ isWhite) != 0) {
                counters[counterPosition] = counters[counterPosition] + 1;
            } else {
                if (counterPosition == patternLength - 1) {
                    float bestVariance = MAX_AVG_VARIANCE;
                    int bestMatch = -1;
                    for (int startCode = 103; startCode <= 105; startCode++) {
                        float variance = OneDReader.patternMatchVariance(counters, CODE_PATTERNS[startCode], MAX_INDIVIDUAL_VARIANCE);
                        if (variance < bestVariance) {
                            bestVariance = variance;
                            bestMatch = startCode;
                        }
                    }
                    if (bestMatch < 0 || !row.isRange(Math.max(0, patternStart - ((i - patternStart) / 2)), patternStart, false)) {
                        patternStart += counters[0] + counters[1];
                        System.arraycopy(counters, 2, counters, 0, patternLength - 2);
                        counters[patternLength - 2] = 0;
                        counters[patternLength - 1] = 0;
                        counterPosition--;
                    } else {
                        return new int[]{patternStart, i, bestMatch};
                    }
                }
                counterPosition++;
                counters[counterPosition] = 1;
                if (isWhite) {
                    z = false;
                }
                isWhite = z;
            }
            i++;
        }
        throw NotFoundException.getNotFoundInstance();
    }

    private static int decodeCode(BitArray row, int[] counters, int rowOffset) throws NotFoundException {
        OneDReader.recordPattern(row, rowOffset, counters);
        float bestVariance = MAX_AVG_VARIANCE;
        int bestMatch = -1;
        for (int d = 0; d < CODE_PATTERNS.length; d++) {
            float variance = OneDReader.patternMatchVariance(counters, CODE_PATTERNS[d], MAX_INDIVIDUAL_VARIANCE);
            if (variance < bestVariance) {
                bestVariance = variance;
                bestMatch = d;
            }
        }
        if (bestMatch >= 0) {
            return bestMatch;
        }
        throw NotFoundException.getNotFoundInstance();
    }

    /* JADX WARNING: Missing block: B:91:0x0242, code:
            r26 = r7;
     */
    /* JADX WARNING: Missing block: B:92:0x0244, code:
            r25 = r13;
            r12 = r33;
            r15 = 100;
     */
    /* JADX WARNING: Missing block: B:106:0x0274, code:
            r13 = false;
            r25 = r7;
            r26 = r12;
            r12 = r33;
            r15 = 100;
     */
    /* JADX WARNING: Missing block: B:113:0x028f, code:
            r8 = r7;
     */
    /* JADX WARNING: Missing block: B:115:0x0295, code:
            r26 = r12;
     */
    /* JADX WARNING: Missing block: B:133:0x02d1, code:
            r8 = r7;
     */
    /* JADX WARNING: Missing block: B:135:0x02db, code:
            r26 = r12;
            r25 = r13;
            r12 = r33;
     */
    /* JADX WARNING: Missing block: B:136:0x02e1, code:
            r13 = r3;
     */
    /* JADX WARNING: Missing block: B:137:0x02e2, code:
            if (r2 == false) goto L_0x02ed;
     */
    /* JADX WARNING: Missing block: B:139:0x02e6, code:
            if (r8 != 101) goto L_0x02e9;
     */
    /* JADX WARNING: Missing block: B:140:0x02e9, code:
            r15 = 101;
     */
    /* JADX WARNING: Missing block: B:141:0x02ea, code:
            r24 = r15;
     */
    /* JADX WARNING: Missing block: B:142:0x02ed, code:
            r24 = r8;
     */
    /* JADX WARNING: Missing block: B:143:0x02ef, code:
            r3 = r17;
            r15 = r18;
            r8 = r27;
            r2 = r40;
            r7 = true;
            r18 = r6;
            r6 = r29;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public Result decodeRow(int rowNumber, BitArray row, Map<DecodeHintType, ?> hints) throws NotFoundException, FormatException, ChecksumException {
        int codeSet;
        int[] iArr;
        int i;
        int i2;
        boolean z;
        int i3;
        int i4 = rowNumber;
        BitArray bitArray = row;
        Map<DecodeHintType, ?> map = hints;
        int i5 = 0;
        boolean convertFNC1 = map != null && map.containsKey(DecodeHintType.ASSUME_GS1);
        int[] startPatternInfo = findStartPattern(row);
        boolean z2 = true;
        int startCode = startPatternInfo[2];
        List<Byte> rawCodes = new ArrayList(20);
        rawCodes.add(Byte.valueOf((byte) startCode));
        switch (startCode) {
            case 103:
                codeSet = 101;
                break;
            case 104:
                codeSet = 100;
                break;
            case 105:
                codeSet = 99;
                break;
            default:
                throw FormatException.getFormatInstance();
        }
        boolean done = false;
        boolean isNextShifted = false;
        StringBuilder result = new StringBuilder(20);
        int lastStart = startPatternInfo[0];
        int nextStart = startPatternInfo[1];
        int[] counters = new int[6];
        int code = 0;
        int checksumTotal = startCode;
        int multiplier = 0;
        boolean lastCharacterWasPrintable = true;
        int codeSet2 = codeSet;
        codeSet = 0;
        boolean upperMode = false;
        boolean shiftUpperMode = false;
        while (!done) {
            int i6 = i5;
            iArr = startPatternInfo;
            i = startCode;
            i2 = codeSet;
            z = done;
            i3 = lastStart;
            startCode = codeSet2;
            done = z2;
            boolean unshift = isNextShifted;
            boolean isNextShifted2 = false;
            codeSet = code;
            startPatternInfo = decodeCode(bitArray, counters, nextStart);
            rawCodes.add(Byte.valueOf((byte) startPatternInfo));
            if (startPatternInfo != 106) {
                lastCharacterWasPrintable = true;
            }
            if (startPatternInfo != 106) {
                multiplier++;
                checksumTotal += multiplier * startPatternInfo;
            }
            lastStart = nextStart;
            code = nextStart;
            for (nextStart = i6; nextStart < counters.length; nextStart++) {
                code += counters[nextStart];
            }
            switch (startPatternInfo) {
                case 103:
                case 104:
                case 105:
                    throw FormatException.getFormatInstance();
                default:
                    int codeSet3;
                    switch (startCode) {
                        case 99:
                            isNextShifted = upperMode;
                            done = shiftUpperMode;
                            nextStart = 100;
                            if (startPatternInfo >= 100) {
                                if (startPatternInfo != 106) {
                                    lastCharacterWasPrintable = false;
                                }
                                if (startPatternInfo == 106) {
                                    shiftUpperMode = done;
                                    upperMode = isNextShifted;
                                    isNextShifted = false;
                                    done = true;
                                    break;
                                }
                                switch (startPatternInfo) {
                                    case 100:
                                        codeSet3 = 100;
                                        break;
                                    case 101:
                                        codeSet3 = 101;
                                        break;
                                    case 102:
                                        if (convertFNC1) {
                                            if (result.length() != 0) {
                                                result.append(29);
                                                break;
                                            }
                                            result.append("]C1");
                                            break;
                                        }
                                        break;
                                }
                            }
                            if (startPatternInfo < 10) {
                                result.append('0');
                            }
                            result.append(startPatternInfo);
                            break;
                            break;
                        case 100:
                            isNextShifted = upperMode;
                            done = shiftUpperMode;
                            if (startPatternInfo >= 96) {
                                if (startPatternInfo != 106) {
                                    lastCharacterWasPrintable = false;
                                }
                                if (startPatternInfo == 106) {
                                    z = true;
                                    break;
                                }
                                switch (startPatternInfo) {
                                    case 98:
                                        isNextShifted2 = true;
                                        codeSet3 = 101;
                                        break;
                                    case 99:
                                        codeSet3 = 99;
                                        break;
                                    case 100:
                                        if (isNextShifted || !done) {
                                            if (!isNextShifted || !done) {
                                                z2 = true;
                                                break;
                                            }
                                            z2 = false;
                                            done = false;
                                            break;
                                        }
                                        z2 = true;
                                        done = false;
                                        break;
                                    case 101:
                                        codeSet3 = 101;
                                        break;
                                    case 102:
                                        if (convertFNC1) {
                                            if (result.length() != 0) {
                                                result.append(29);
                                                break;
                                            }
                                            result.append("]C1");
                                            break;
                                        }
                                        break;
                                }
                            }
                            if (done == isNextShifted) {
                                result.append((char) (32 + startPatternInfo));
                            } else {
                                result.append((char) ((32 + startPatternInfo) + 128));
                            }
                            z2 = false;
                            break;
                            break;
                        case 101:
                            if (startPatternInfo >= 64) {
                                isNextShifted = upperMode;
                                done = shiftUpperMode;
                                if (startPatternInfo >= 96) {
                                    if (startPatternInfo != 106) {
                                        lastCharacterWasPrintable = false;
                                    }
                                    if (startPatternInfo == 106) {
                                        z = true;
                                        break;
                                    }
                                    switch (startPatternInfo) {
                                        case 98:
                                            isNextShifted2 = true;
                                            codeSet3 = 100;
                                            break;
                                        case 99:
                                            codeSet3 = 99;
                                            break;
                                        case 100:
                                            codeSet3 = 100;
                                            break;
                                        case 101:
                                            if (isNextShifted || !done) {
                                                if (!isNextShifted || !done) {
                                                    z2 = true;
                                                    break;
                                                }
                                                z2 = false;
                                                done = false;
                                                break;
                                            }
                                            z2 = true;
                                            done = false;
                                            break;
                                            break;
                                        case 102:
                                            if (convertFNC1) {
                                                if (result.length() != 0) {
                                                    result.append(29);
                                                    break;
                                                }
                                                result.append("]C1");
                                                break;
                                            }
                                            break;
                                    }
                                }
                                if (done == isNextShifted) {
                                    result.append((char) (startPatternInfo - 64));
                                } else {
                                    result.append((char) (startPatternInfo + 64));
                                }
                                z2 = false;
                                break;
                            }
                            isNextShifted = upperMode;
                            if (shiftUpperMode == isNextShifted) {
                                result.append((char) (32 + startPatternInfo));
                            } else {
                                result.append((char) ((32 + startPatternInfo) + 128));
                            }
                            z2 = false;
                            break;
                            break;
                        default:
                            isNextShifted = upperMode;
                            done = shiftUpperMode;
                            nextStart = 100;
                            break;
                    }
            }
        }
        i5 = nextStart - lastStart;
        nextStart = bitArray.getNextUnset(nextStart);
        int i7;
        if (!bitArray.isRange(nextStart, Math.min(row.getSize(), nextStart + ((nextStart - lastStart) / 2)), false)) {
            iArr = startPatternInfo;
            i = startCode;
            i2 = codeSet;
            z = done;
            i3 = lastStart;
            i7 = nextStart;
            startCode = codeSet2;
            throw NotFoundException.getNotFoundInstance();
        } else if ((checksumTotal - (multiplier * codeSet)) % 103 == codeSet) {
            int resultLength = result.length();
            if (resultLength != 0) {
                if (resultLength <= 0 || !lastCharacterWasPrintable) {
                    startCode = codeSet2;
                } else {
                    i = startCode;
                    if (codeSet2 == 99) {
                        result.delete(resultLength - 2, resultLength);
                    } else {
                        result.delete(resultLength - 1, resultLength);
                    }
                }
                float left = ((float) (startPatternInfo[1] + startPatternInfo[0])) / 2.0f;
                iArr = startPatternInfo;
                resultLength = ((float) lastStart) + (((float) i5) / 2.0f);
                int rawCodesSize = rawCodes.size();
                i5 = new byte[rawCodesSize];
                codeSet = 0;
                while (codeSet < rawCodesSize) {
                    int rawCodesSize2 = rawCodesSize;
                    z = done;
                    i3 = lastStart;
                    i7 = nextStart;
                    i5[codeSet] = ((Byte) rawCodes.get(codeSet)).byteValue();
                    codeSet++;
                    rawCodesSize = rawCodesSize2;
                    done = z;
                }
                String stringBuilder = result.toString();
                ResultPoint[] resultPointArr = new ResultPoint[true];
                resultPointArr[0] = new ResultPoint(left, (float) i4);
                resultPointArr[1] = new ResultPoint(resultLength, (float) i4);
                return new Result(stringBuilder, i5, resultPointArr, BarcodeFormat.CODE_128);
            }
            int i8 = i5;
            iArr = startPatternInfo;
            i = startCode;
            i2 = codeSet;
            z = done;
            i3 = lastStart;
            i7 = nextStart;
            startCode = codeSet2;
            throw NotFoundException.getNotFoundInstance();
        } else {
            iArr = startPatternInfo;
            i = startCode;
            i2 = codeSet;
            z = done;
            i3 = lastStart;
            i7 = nextStart;
            startCode = codeSet2;
            throw ChecksumException.getChecksumInstance();
        }
    }
}
