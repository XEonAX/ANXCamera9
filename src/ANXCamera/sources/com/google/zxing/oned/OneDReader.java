package com.google.zxing.oned;

import com.google.zxing.BinaryBitmap;
import com.google.zxing.ChecksumException;
import com.google.zxing.DecodeHintType;
import com.google.zxing.FormatException;
import com.google.zxing.NotFoundException;
import com.google.zxing.Reader;
import com.google.zxing.Result;
import com.google.zxing.ResultMetadataType;
import com.google.zxing.ResultPoint;
import com.google.zxing.common.BitArray;
import java.util.Arrays;
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
                    orientation = (((Integer) metadata.get(ResultMetadataType.ORIENTATION)).intValue() + 270) % 360;
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
    private com.google.zxing.Result doDecode(com.google.zxing.BinaryBitmap r23, java.util.Map<com.google.zxing.DecodeHintType, ?> r24) throws com.google.zxing.NotFoundException {
        /*
        r22 = this;
        r0 = r24;
        r1 = r23.getWidth();
        r2 = r23.getHeight();
        r3 = new com.google.zxing.common.BitArray;
        r3.<init>(r1);
        r4 = r2 >> 1;
        r6 = 1;
        if (r0 == 0) goto L_0x001e;
    L_0x0014:
        r7 = com.google.zxing.DecodeHintType.TRY_HARDER;
        r7 = r0.containsKey(r7);
        if (r7 == 0) goto L_0x001e;
    L_0x001c:
        r7 = r6;
        goto L_0x001f;
    L_0x001e:
        r7 = 0;
    L_0x001f:
        if (r7 == 0) goto L_0x0024;
    L_0x0021:
        r8 = 8;
        goto L_0x0025;
    L_0x0024:
        r8 = 5;
    L_0x0025:
        r8 = r2 >> r8;
        r8 = java.lang.Math.max(r6, r8);
        if (r7 == 0) goto L_0x002f;
    L_0x002d:
        r9 = r2;
        goto L_0x0031;
    L_0x002f:
        r9 = 15;
    L_0x0031:
        r10 = 0;
        r11 = r3;
        r3 = r0;
    L_0x0034:
        if (r10 >= r9) goto L_0x0146;
    L_0x0036:
        r0 = r10 + 1;
        r12 = 2;
        r13 = r0 / 2;
        r0 = r10 & 1;
        if (r0 != 0) goto L_0x0041;
    L_0x003f:
        r0 = r6;
        goto L_0x0042;
    L_0x0041:
        r0 = 0;
    L_0x0042:
        r14 = r0;
        if (r14 == 0) goto L_0x0047;
    L_0x0045:
        r0 = r13;
        goto L_0x0048;
    L_0x0047:
        r0 = -r13;
    L_0x0048:
        r0 = r0 * r8;
        r15 = r4 + r0;
        if (r15 < 0) goto L_0x0146;
    L_0x004d:
        if (r15 >= r2) goto L_0x013d;
    L_0x004f:
        r5 = r23;
        r0 = r5.getBlackRow(r15, r11);	 Catch:{ NotFoundException -> 0x0126 }
        r11 = r0;
        r0 = 0;
        r21 = r3;
        r3 = r0;
        r0 = r21;
    L_0x005d:
        if (r3 < r12) goto L_0x006c;
    L_0x005f:
        r12 = r22;
        r3 = r0;
        r20 = r1;
        r17 = r2;
        r18 = r4;
        r16 = 0;
        goto L_0x0133;
    L_0x006c:
        if (r3 != r6) goto L_0x008d;
    L_0x006e:
        r11.reverse();
        if (r0 == 0) goto L_0x008d;
    L_0x0073:
        r12 = com.google.zxing.DecodeHintType.NEED_RESULT_POINT_CALLBACK;
        r12 = r0.containsKey(r12);
        if (r12 == 0) goto L_0x008d;
    L_0x007b:
        r12 = new java.util.EnumMap;
        r6 = com.google.zxing.DecodeHintType.class;
        r12.<init>(r6);
        r6 = r12;
        r6.putAll(r0);
        r12 = com.google.zxing.DecodeHintType.NEED_RESULT_POINT_CALLBACK;
        r6.remove(r12);
        r0 = r6;
        goto L_0x008e;
    L_0x008d:
        r6 = r0;
    L_0x008e:
        r12 = r22;
        r0 = r12.decodeRow(r15, r11, r6);	 Catch:{ ReaderException -> 0x010b }
        r17 = r2;
        r2 = 1;
        if (r3 != r2) goto L_0x0104;
    L_0x0099:
        r2 = com.google.zxing.ResultMetadataType.ORIENTATION;	 Catch:{ ReaderException -> 0x00f9 }
        r18 = r4;
        r4 = 180; // 0xb4 float:2.52E-43 double:8.9E-322;
        r4 = java.lang.Integer.valueOf(r4);	 Catch:{ ReaderException -> 0x00f0 }
        r0.putMetadata(r2, r4);	 Catch:{ ReaderException -> 0x00f0 }
        r2 = r0.getResultPoints();	 Catch:{ ReaderException -> 0x00f0 }
        if (r2 == 0) goto L_0x00eb;
    L_0x00ac:
        r4 = new com.google.zxing.ResultPoint;	 Catch:{ ReaderException -> 0x00f0 }
        r5 = (float) r1;
        r19 = r6;
        r16 = 0;
        r6 = r2[r16];	 Catch:{ ReaderException -> 0x00e6 }
        r6 = r6.getX();	 Catch:{ ReaderException -> 0x00e6 }
        r5 = r5 - r6;
        r6 = 1065353216; // 0x3f800000 float:1.0 double:5.263544247E-315;
        r5 = r5 - r6;
        r6 = r2[r16];	 Catch:{ ReaderException -> 0x00e6 }
        r6 = r6.getY();	 Catch:{ ReaderException -> 0x00e6 }
        r4.<init>(r5, r6);	 Catch:{ ReaderException -> 0x00e6 }
        r2[r16] = r4;	 Catch:{ ReaderException -> 0x00e6 }
        r4 = new com.google.zxing.ResultPoint;	 Catch:{ ReaderException -> 0x00e6 }
        r5 = (float) r1;
        r20 = r1;
        r6 = 1;
        r1 = r2[r6];	 Catch:{ ReaderException -> 0x00e4 }
        r1 = r1.getX();	 Catch:{ ReaderException -> 0x00e4 }
        r5 = r5 - r1;
        r1 = 1065353216; // 0x3f800000 float:1.0 double:5.263544247E-315;
        r5 = r5 - r1;
        r1 = r2[r6];	 Catch:{ ReaderException -> 0x00e4 }
        r1 = r1.getY();	 Catch:{ ReaderException -> 0x00e4 }
        r4.<init>(r5, r1);	 Catch:{ ReaderException -> 0x00e4 }
        r2[r6] = r4;	 Catch:{ ReaderException -> 0x00e4 }
        goto L_0x010a;
    L_0x00e4:
        r0 = move-exception;
        goto L_0x0117;
    L_0x00e6:
        r0 = move-exception;
        r20 = r1;
        r6 = 1;
        goto L_0x0117;
    L_0x00eb:
        r20 = r1;
        r19 = r6;
        goto L_0x010a;
    L_0x00f0:
        r0 = move-exception;
        r20 = r1;
        r19 = r6;
        r6 = 1;
        r16 = 0;
        goto L_0x0117;
    L_0x00f9:
        r0 = move-exception;
        r20 = r1;
        r18 = r4;
        r19 = r6;
        r6 = 1;
        r16 = 0;
        goto L_0x0117;
    L_0x0104:
        r20 = r1;
        r18 = r4;
        r19 = r6;
    L_0x010a:
        return r0;
    L_0x010b:
        r0 = move-exception;
        r20 = r1;
        r17 = r2;
        r18 = r4;
        r19 = r6;
        r6 = 1;
        r16 = 0;
    L_0x0117:
        r3 = r3 + 1;
        r2 = r17;
        r4 = r18;
        r0 = r19;
        r1 = r20;
        r5 = r23;
        r12 = 2;
        goto L_0x005d;
    L_0x0126:
        r0 = move-exception;
        r12 = r22;
        r20 = r1;
        r17 = r2;
        r18 = r4;
        r16 = 0;
        r1 = r0;
    L_0x0133:
        r10 = r10 + 1;
        r2 = r17;
        r4 = r18;
        r1 = r20;
        goto L_0x0034;
    L_0x013d:
        r12 = r22;
        r20 = r1;
        r17 = r2;
        r18 = r4;
        goto L_0x014e;
    L_0x0146:
        r12 = r22;
        r20 = r1;
        r17 = r2;
        r18 = r4;
    L_0x014e:
        r0 = com.google.zxing.NotFoundException.getNotFoundInstance();
        throw r0;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.zxing.oned.OneDReader.doDecode(com.google.zxing.BinaryBitmap, java.util.Map):com.google.zxing.Result");
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
