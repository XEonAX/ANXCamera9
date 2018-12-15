package com.google.zxing.oned;

import com.google.zxing.NotFoundException;
import com.google.zxing.common.BitArray;

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
    public com.google.zxing.Result decodeRow(int r38, com.google.zxing.common.BitArray r39, java.util.Map<com.google.zxing.DecodeHintType, ?> r40) throws com.google.zxing.NotFoundException, com.google.zxing.FormatException, com.google.zxing.ChecksumException {
        /*
        r37 = this;
        r0 = r38;
        r1 = r39;
        r2 = r40;
        r3 = 0;
        r4 = 1;
        if (r2 == 0) goto L_0x0014;
    L_0x000a:
        r5 = com.google.zxing.DecodeHintType.ASSUME_GS1;
        r5 = r2.containsKey(r5);
        if (r5 == 0) goto L_0x0014;
    L_0x0012:
        r5 = r4;
        goto L_0x0015;
    L_0x0014:
        r5 = r3;
    L_0x0015:
        r6 = findStartPattern(r39);
        r7 = 2;
        r8 = r6[r7];
        r9 = new java.util.ArrayList;
        r10 = 20;
        r9.<init>(r10);
        r11 = (byte) r8;
        r11 = java.lang.Byte.valueOf(r11);
        r9.add(r11);
        switch(r8) {
            case 103: goto L_0x003d;
            case 104: goto L_0x003a;
            case 105: goto L_0x0037;
            default: goto L_0x002e;
        };
    L_0x002e:
        r29 = r6;
        r27 = r8;
        r2 = com.google.zxing.FormatException.getFormatInstance();
        throw r2;
    L_0x0037:
        r11 = 99;
        goto L_0x0040;
    L_0x003a:
        r11 = 100;
        goto L_0x0040;
    L_0x003d:
        r11 = 101; // 0x65 float:1.42E-43 double:5.0E-322;
        r12 = 0;
        r13 = 0;
        r14 = new java.lang.StringBuilder;
        r14.<init>(r10);
        r10 = r14;
        r14 = r6[r3];
        r15 = r6[r4];
        r4 = 6;
        r4 = new int[r4];
        r17 = 0;
        r18 = 0;
        r19 = r8;
        r20 = 0;
        r21 = 1;
        r22 = 0;
        r23 = 0;
        r24 = r11;
        r11 = r17;
        r25 = r22;
        r26 = r23;
    L_0x0066:
        if (r12 == 0) goto L_0x0162;
    L_0x0068:
        r3 = r15 - r14;
        r15 = r1.getNextUnset(r15);
        r2 = r39.getSize();
        r17 = r15 - r14;
        r17 = r17 / 2;
        r7 = r15 + r17;
        r2 = java.lang.Math.min(r2, r7);
        r7 = 0;
        r2 = r1.isRange(r15, r2, r7);
        if (r2 == 0) goto L_0x014d;
    L_0x0085:
        r2 = r20 * r11;
        r19 = r19 - r2;
        r2 = r19 % 103;
        if (r2 != r11) goto L_0x0138;
    L_0x008d:
        r2 = r10.length();
        if (r2 == 0) goto L_0x0121;
    L_0x0093:
        if (r2 <= 0) goto L_0x00ab;
    L_0x0095:
        if (r21 == 0) goto L_0x00ab;
    L_0x0097:
        r7 = 99;
        r27 = r8;
        r8 = r24;
        if (r8 != r7) goto L_0x00a5;
    L_0x009f:
        r7 = r2 + -2;
        r10.delete(r7, r2);
        goto L_0x00af;
    L_0x00a5:
        r7 = r2 + -1;
        r10.delete(r7, r2);
        goto L_0x00af;
    L_0x00ab:
        r27 = r8;
        r8 = r24;
    L_0x00af:
        r7 = 1;
        r17 = r6[r7];
        r7 = 0;
        r22 = r6[r7];
        r7 = r17 + r22;
        r7 = (float) r7;
        r17 = 1073741824; // 0x40000000 float:2.0 double:5.304989477E-315;
        r7 = r7 / r17;
        r28 = r2;
        r2 = (float) r14;
        r29 = r6;
        r6 = (float) r3;
        r6 = r6 / r17;
        r2 = r2 + r6;
        r6 = r9.size();
        r30 = r3;
        r3 = new byte[r6];
        r17 = 0;
        r31 = r11;
        r11 = r17;
    L_0x00d3:
        if (r11 < r6) goto L_0x0101;
    L_0x00d5:
        r11 = new com.google.zxing.Result;
        r32 = r6;
        r6 = r10.toString();
        r33 = r12;
        r12 = 2;
        r12 = new com.google.zxing.ResultPoint[r12];
        r34 = r14;
        r14 = new com.google.zxing.ResultPoint;
        r35 = r15;
        r15 = (float) r0;
        r14.<init>(r7, r15);
        r17 = 0;
        r12[r17] = r14;
        r14 = new com.google.zxing.ResultPoint;
        r15 = (float) r0;
        r14.<init>(r2, r15);
        r16 = 1;
        r12[r16] = r14;
        r14 = com.google.zxing.BarcodeFormat.CODE_128;
        r11.<init>(r6, r3, r12, r14);
        return r11;
    L_0x0101:
        r32 = r6;
        r33 = r12;
        r34 = r14;
        r35 = r15;
        r12 = 2;
        r16 = 1;
        r17 = 0;
        r6 = r9.get(r11);
        r6 = (java.lang.Byte) r6;
        r6 = r6.byteValue();
        r3[r11] = r6;
        r11 = r11 + 1;
        r6 = r32;
        r12 = r33;
        goto L_0x00d3;
    L_0x0121:
        r28 = r2;
        r30 = r3;
        r29 = r6;
        r27 = r8;
        r31 = r11;
        r33 = r12;
        r34 = r14;
        r35 = r15;
        r8 = r24;
        r2 = com.google.zxing.NotFoundException.getNotFoundInstance();
        throw r2;
    L_0x0138:
        r30 = r3;
        r29 = r6;
        r27 = r8;
        r31 = r11;
        r33 = r12;
        r34 = r14;
        r35 = r15;
        r8 = r24;
        r2 = com.google.zxing.ChecksumException.getChecksumInstance();
        throw r2;
    L_0x014d:
        r30 = r3;
        r29 = r6;
        r27 = r8;
        r31 = r11;
        r33 = r12;
        r34 = r14;
        r35 = r15;
        r8 = r24;
        r2 = com.google.zxing.NotFoundException.getNotFoundInstance();
        throw r2;
    L_0x0162:
        r17 = r3;
        r29 = r6;
        r27 = r8;
        r31 = r11;
        r33 = r12;
        r34 = r14;
        r8 = r24;
        r16 = 1;
        r12 = r7;
        r2 = r13;
        r3 = 0;
        r11 = r18;
        r6 = decodeCode(r1, r4, r15);
        r7 = (byte) r6;
        r7 = java.lang.Byte.valueOf(r7);
        r9.add(r7);
        r7 = 106; // 0x6a float:1.49E-43 double:5.24E-322;
        if (r6 == r7) goto L_0x0189;
    L_0x0187:
        r21 = 1;
    L_0x0189:
        if (r6 == r7) goto L_0x0191;
    L_0x018b:
        r20 = r20 + 1;
        r13 = r20 * r6;
        r19 = r19 + r13;
    L_0x0191:
        r14 = r15;
        r13 = r4.length;
        r18 = r15;
        r15 = r17;
    L_0x0197:
        if (r15 < r13) goto L_0x02fe;
    L_0x0199:
        switch(r6) {
            case 103: goto L_0x01ab;
            case 104: goto L_0x01ab;
            case 105: goto L_0x01ab;
            default: goto L_0x019c;
        };
    L_0x019c:
        r15 = 96;
        r22 = 32;
        switch(r8) {
            case 99: goto L_0x0298;
            case 100: goto L_0x0229;
            case 101: goto L_0x01b0;
            default: goto L_0x01a3;
        };
    L_0x01a3:
        r13 = r25;
        r12 = r26;
        r15 = 100;
        goto L_0x02db;
    L_0x01ab:
        r7 = com.google.zxing.FormatException.getFormatInstance();
        throw r7;
    L_0x01b0:
        r13 = 64;
        if (r6 >= r13) goto L_0x01cc;
    L_0x01b4:
        r13 = r25;
        r7 = r26;
        if (r7 != r13) goto L_0x01c1;
    L_0x01ba:
        r12 = r22 + r6;
        r12 = (char) r12;
        r10.append(r12);
        goto L_0x01c9;
    L_0x01c1:
        r12 = r22 + r6;
        r12 = r12 + 128;
        r12 = (char) r12;
        r10.append(r12);
    L_0x01c9:
        r7 = 0;
        goto L_0x0242;
    L_0x01cc:
        r13 = r25;
        r12 = r26;
        if (r6 >= r15) goto L_0x01e3;
    L_0x01d2:
        if (r12 != r13) goto L_0x01db;
    L_0x01d4:
        r7 = r6 + -64;
        r7 = (char) r7;
        r10.append(r7);
        goto L_0x01e1;
    L_0x01db:
        r7 = r6 + 64;
        r7 = (char) r7;
        r10.append(r7);
    L_0x01e1:
        r7 = 0;
        goto L_0x0242;
    L_0x01e3:
        if (r6 == r7) goto L_0x01e7;
    L_0x01e5:
        r21 = 0;
    L_0x01e7:
        if (r6 == r7) goto L_0x0224;
    L_0x01e9:
        switch(r6) {
            case 96: goto L_0x0222;
            case 97: goto L_0x0222;
            case 98: goto L_0x021d;
            case 99: goto L_0x0219;
            case 100: goto L_0x0215;
            case 101: goto L_0x0203;
            case 102: goto L_0x01ed;
            default: goto L_0x01ec;
        };
    L_0x01ec:
        goto L_0x0227;
    L_0x01ed:
        if (r5 == 0) goto L_0x0295;
    L_0x01ef:
        r7 = r10.length();
        if (r7 != 0) goto L_0x01fc;
    L_0x01f5:
        r7 = "]C1";
        r10.append(r7);
        goto L_0x0295;
    L_0x01fc:
        r7 = 29;
        r10.append(r7);
        goto L_0x0295;
    L_0x0203:
        if (r13 != 0) goto L_0x020b;
    L_0x0205:
        if (r12 == 0) goto L_0x020b;
    L_0x0207:
        r7 = 1;
        r12 = 0;
        goto L_0x0274;
    L_0x020b:
        if (r13 == 0) goto L_0x0213;
    L_0x020d:
        if (r12 == 0) goto L_0x0213;
    L_0x020f:
        r7 = 0;
        r12 = 0;
        goto L_0x0274;
    L_0x0213:
        r7 = 1;
        goto L_0x0242;
    L_0x0215:
        r7 = 100;
        goto L_0x028f;
    L_0x0219:
        r7 = 99;
        goto L_0x028f;
    L_0x021d:
        r3 = 1;
        r7 = 100;
        goto L_0x028f;
    L_0x0222:
        goto L_0x0295;
    L_0x0224:
        r7 = 1;
        r33 = r7;
    L_0x0227:
        goto L_0x0295;
    L_0x0229:
        r13 = r25;
        r12 = r26;
        if (r6 >= r15) goto L_0x024c;
    L_0x022f:
        if (r12 != r13) goto L_0x0238;
    L_0x0231:
        r7 = r22 + r6;
        r7 = (char) r7;
        r10.append(r7);
        goto L_0x0240;
    L_0x0238:
        r7 = r22 + r6;
        r7 = r7 + 128;
        r7 = (char) r7;
        r10.append(r7);
    L_0x0240:
        r7 = 0;
    L_0x0242:
        r26 = r7;
    L_0x0244:
        r25 = r13;
        r12 = r33;
        r15 = 100;
        goto L_0x02e1;
    L_0x024c:
        if (r6 == r7) goto L_0x0250;
    L_0x024e:
        r21 = 0;
    L_0x0250:
        if (r6 == r7) goto L_0x0292;
    L_0x0252:
        switch(r6) {
            case 96: goto L_0x0291;
            case 97: goto L_0x0291;
            case 98: goto L_0x028b;
            case 99: goto L_0x0288;
            case 100: goto L_0x026d;
            case 101: goto L_0x026a;
            case 102: goto L_0x0256;
            default: goto L_0x0255;
        };
    L_0x0255:
        goto L_0x0295;
    L_0x0256:
        if (r5 == 0) goto L_0x0295;
    L_0x0258:
        r7 = r10.length();
        if (r7 != 0) goto L_0x0264;
    L_0x025e:
        r7 = "]C1";
        r10.append(r7);
        goto L_0x0295;
    L_0x0264:
        r7 = 29;
        r10.append(r7);
        goto L_0x0295;
    L_0x026a:
        r7 = 101; // 0x65 float:1.42E-43 double:5.0E-322;
        goto L_0x028f;
    L_0x026d:
        if (r13 != 0) goto L_0x027f;
    L_0x026f:
        if (r12 == 0) goto L_0x027f;
    L_0x0271:
        r7 = 1;
        r12 = 0;
    L_0x0274:
        r13 = r3;
        r25 = r7;
        r26 = r12;
        r12 = r33;
        r15 = 100;
        goto L_0x02e2;
    L_0x027f:
        if (r13 == 0) goto L_0x0286;
    L_0x0281:
        if (r12 == 0) goto L_0x0286;
    L_0x0283:
        r7 = 0;
        r12 = 0;
        goto L_0x0274;
    L_0x0286:
        r7 = 1;
        goto L_0x0242;
    L_0x0288:
        r7 = 99;
        goto L_0x028f;
    L_0x028b:
        r3 = 1;
        r7 = 101; // 0x65 float:1.42E-43 double:5.0E-322;
    L_0x028f:
        r8 = r7;
        goto L_0x0295;
    L_0x0291:
        goto L_0x0295;
    L_0x0292:
        r7 = 1;
        r33 = r7;
    L_0x0295:
        r26 = r12;
        goto L_0x0244;
    L_0x0298:
        r13 = r25;
        r12 = r26;
        r15 = 100;
        if (r6 >= r15) goto L_0x02ad;
    L_0x02a0:
        r7 = 10;
        if (r6 >= r7) goto L_0x02a9;
    L_0x02a4:
        r7 = 48;
        r10.append(r7);
    L_0x02a9:
        r10.append(r6);
        goto L_0x02db;
    L_0x02ad:
        if (r6 == r7) goto L_0x02b1;
    L_0x02af:
        r21 = 0;
    L_0x02b1:
        if (r6 == r7) goto L_0x02d3;
    L_0x02b3:
        switch(r6) {
            case 100: goto L_0x02ce;
            case 101: goto L_0x02cb;
            case 102: goto L_0x02b7;
            default: goto L_0x02b6;
        };
    L_0x02b6:
        goto L_0x02db;
    L_0x02b7:
        if (r5 == 0) goto L_0x02db;
    L_0x02b9:
        r7 = r10.length();
        if (r7 != 0) goto L_0x02c5;
    L_0x02bf:
        r7 = "]C1";
        r10.append(r7);
        goto L_0x02db;
    L_0x02c5:
        r7 = 29;
        r10.append(r7);
        goto L_0x02db;
    L_0x02cb:
        r7 = 101; // 0x65 float:1.42E-43 double:5.0E-322;
        goto L_0x02d1;
    L_0x02ce:
        r7 = 100;
    L_0x02d1:
        r8 = r7;
        goto L_0x02db;
    L_0x02d3:
        r7 = 1;
        r26 = r12;
        r25 = r13;
        r13 = r3;
        r12 = r7;
        goto L_0x02e2;
    L_0x02db:
        r26 = r12;
        r25 = r13;
        r12 = r33;
    L_0x02e1:
        r13 = r3;
    L_0x02e2:
        if (r2 == 0) goto L_0x02ed;
    L_0x02e4:
        r3 = 101; // 0x65 float:1.42E-43 double:5.0E-322;
        if (r8 != r3) goto L_0x02e9;
    L_0x02e8:
        goto L_0x02ea;
    L_0x02e9:
        r15 = r3;
    L_0x02ea:
        r24 = r15;
        goto L_0x02ef;
    L_0x02ed:
        r24 = r8;
    L_0x02ef:
        r3 = r17;
        r15 = r18;
        r8 = r27;
        r2 = r40;
        r7 = 2;
        r18 = r6;
        r6 = r29;
        goto L_0x0066;
    L_0x02fe:
        r12 = r26;
        r22 = r4[r15];
        r18 = r18 + r22;
        r15 = r15 + 1;
        r12 = 2;
        goto L_0x0197;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.zxing.oned.Code128Reader.decodeRow(int, com.google.zxing.common.BitArray, java.util.Map):com.google.zxing.Result");
    }
}
