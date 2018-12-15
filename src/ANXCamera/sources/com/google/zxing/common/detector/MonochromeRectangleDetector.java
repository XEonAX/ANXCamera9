package com.google.zxing.common.detector;

import com.google.zxing.NotFoundException;
import com.google.zxing.ResultPoint;
import com.google.zxing.common.BitMatrix;

public final class MonochromeRectangleDetector {
    private static final int MAX_MODULES = 32;
    private final BitMatrix image;

    public MonochromeRectangleDetector(BitMatrix image) {
        this.image = image;
    }

    public ResultPoint[] detect() throws NotFoundException {
        int height = this.image.getHeight();
        int width = this.image.getWidth();
        int halfHeight = height / 2;
        int halfWidth = width / 2;
        int deltaY = Math.max(1, height / 256);
        int deltaX = Math.max(1, width / 256);
        int bottom = height;
        ResultPoint pointA = findCornerFromCenter(halfWidth, 0, 0, width, halfHeight, -deltaY, 0, bottom, halfWidth / 2);
        int top = ((int) pointA.getY()) - 1;
        int i = -deltaX;
        int deltaX2 = deltaX;
        ResultPoint pointD = halfWidth;
        int deltaY2 = deltaY;
        int i2 = 1;
        int width2 = width;
        height = halfHeight;
        int i3 = top;
        int i4 = bottom;
        ResultPoint pointB = findCornerFromCenter(pointD, i, 0, width, height, 0, i3, i4, halfHeight / 2);
        int left = ((int) pointB.getX()) - 1;
        int i5 = left;
        ResultPoint pointC = findCornerFromCenter(pointD, deltaX2, i5, width, height, 0, i3, i4, halfHeight / 2);
        int right = ((int) pointC.getX()) + 1;
        ResultPoint pointA2 = findCornerFromCenter(halfWidth, 0, left, right, halfHeight, -deltaY2, top, ((int) findCornerFromCenter(pointD, 0, i5, right, height, deltaY2, i3, i4, halfWidth / 2).getY()) + 1, halfWidth / 4);
        return new ResultPoint[]{pointA2, pointB, pointC, pointD};
    }

    private ResultPoint findCornerFromCenter(int centerX, int deltaX, int left, int right, int centerY, int deltaY, int top, int bottom, int maxWhiteRun) throws NotFoundException {
        int i = centerX;
        int i2 = centerY;
        int y = i2;
        int[] lastRange = null;
        int x = i;
        while (true) {
            int i3 = bottom;
            int i4;
            if (y >= i3) {
                i4 = top;
                break;
            }
            i4 = top;
            if (y < i4) {
                break;
            }
            int i5 = right;
            if (x >= i5) {
                break;
            }
            int i6 = left;
            if (x < i6) {
                break;
            }
            int[] range;
            if (deltaX == 0) {
                range = blackWhiteRange(y, maxWhiteRun, i6, i5, true);
            } else {
                range = blackWhiteRange(x, maxWhiteRun, i4, i3, false);
            }
            int[] range2 = range;
            int lastY;
            if (range2 != null) {
                lastRange = range2;
                y += deltaY;
                x += deltaX;
            } else if (lastRange == null) {
                throw NotFoundException.getNotFoundInstance();
            } else if (deltaX == 0) {
                lastY = y - deltaY;
                if (lastRange[0] >= i) {
                    return new ResultPoint((float) lastRange[1], (float) lastY);
                }
                if (lastRange[1] <= i) {
                    return new ResultPoint((float) lastRange[0], (float) lastY);
                }
                return new ResultPoint((float) (deltaY > 0 ? lastRange[0] : lastRange[1]), (float) lastY);
            } else {
                lastY = x - deltaX;
                if (lastRange[0] >= i2) {
                    return new ResultPoint((float) lastY, (float) lastRange[1]);
                }
                if (lastRange[1] <= i2) {
                    return new ResultPoint((float) lastY, (float) lastRange[0]);
                }
                return new ResultPoint((float) lastY, (float) (deltaX < 0 ? lastRange[0] : lastRange[1]));
            }
        }
        throw NotFoundException.getNotFoundInstance();
    }

    /* JADX WARNING: Removed duplicated region for block: B:53:0x0036 A:{SYNTHETIC, EDGE_INSN: B:53:0x0036->B:16:0x0036 ?: BREAK  , EDGE_INSN: B:53:0x0036->B:16:0x0036 ?: BREAK  } */
    /* JADX WARNING: Removed duplicated region for block: B:11:0x0023  */
    /* JADX WARNING: Removed duplicated region for block: B:67:0x0074 A:{SYNTHETIC, EDGE_INSN: B:67:0x0074->B:37:0x0074 ?: BREAK  , EDGE_INSN: B:67:0x0074->B:37:0x0074 ?: BREAK  } */
    /* JADX WARNING: Removed duplicated region for block: B:32:0x0061  */
    private int[] blackWhiteRange(int r8, int r9, int r10, int r11, boolean r12) {
        /*
        r7 = this;
        r0 = r10 + r11;
        r1 = 2;
        r0 = r0 / r1;
        r2 = r0;
    L_0x0005:
        if (r2 >= r10) goto L_0x0008;
    L_0x0007:
        goto L_0x0041;
    L_0x0008:
        if (r12 == 0) goto L_0x0013;
    L_0x000a:
        r3 = r7.image;
        r3 = r3.get(r2, r8);
        if (r3 == 0) goto L_0x001e;
    L_0x0012:
        goto L_0x001b;
    L_0x0013:
        r3 = r7.image;
        r3 = r3.get(r8, r2);
        if (r3 == 0) goto L_0x001e;
    L_0x001b:
        r2 = r2 + -1;
        goto L_0x0005;
    L_0x001e:
        r3 = r2;
    L_0x001f:
        r3 = r3 + -1;
        if (r3 < r10) goto L_0x0036;
    L_0x0023:
        if (r12 == 0) goto L_0x002e;
    L_0x0025:
        r4 = r7.image;
        r4 = r4.get(r3, r8);
        if (r4 == 0) goto L_0x001f;
    L_0x002d:
        goto L_0x0036;
    L_0x002e:
        r4 = r7.image;
        r4 = r4.get(r8, r3);
        if (r4 == 0) goto L_0x001f;
    L_0x0036:
        r4 = r2 - r3;
        if (r3 < r10) goto L_0x003f;
    L_0x003a:
        if (r4 <= r9) goto L_0x003d;
    L_0x003c:
        goto L_0x003f;
    L_0x003d:
        r2 = r3;
        goto L_0x0005;
    L_0x003f:
        r3 = r2;
    L_0x0041:
        r3 = 1;
        r2 = r2 + r3;
        r4 = r0;
    L_0x0044:
        if (r4 < r11) goto L_0x0047;
    L_0x0046:
        goto L_0x007f;
    L_0x0047:
        if (r12 == 0) goto L_0x0052;
    L_0x0049:
        r5 = r7.image;
        r5 = r5.get(r4, r8);
        if (r5 == 0) goto L_0x005d;
    L_0x0051:
        goto L_0x005a;
    L_0x0052:
        r5 = r7.image;
        r5 = r5.get(r8, r4);
        if (r5 == 0) goto L_0x005d;
    L_0x005a:
        r4 = r4 + 1;
        goto L_0x0044;
    L_0x005d:
        r5 = r4;
    L_0x005e:
        r5 = r5 + r3;
        if (r5 >= r11) goto L_0x0074;
    L_0x0061:
        if (r12 == 0) goto L_0x006c;
    L_0x0063:
        r6 = r7.image;
        r6 = r6.get(r5, r8);
        if (r6 == 0) goto L_0x005e;
    L_0x006b:
        goto L_0x0074;
    L_0x006c:
        r6 = r7.image;
        r6 = r6.get(r8, r5);
        if (r6 == 0) goto L_0x005e;
    L_0x0074:
        r6 = r5 - r4;
        if (r5 >= r11) goto L_0x007d;
    L_0x0078:
        if (r6 <= r9) goto L_0x007b;
    L_0x007a:
        goto L_0x007d;
    L_0x007b:
        r4 = r5;
        goto L_0x0044;
    L_0x007d:
        r5 = r4;
    L_0x007f:
        r4 = r4 + -1;
        if (r4 <= r2) goto L_0x008b;
    L_0x0083:
        r1 = new int[r1];
        r5 = 0;
        r1[r5] = r2;
        r1[r3] = r4;
        goto L_0x008c;
    L_0x008b:
        r1 = 0;
    L_0x008c:
        return r1;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.zxing.common.detector.MonochromeRectangleDetector.blackWhiteRange(int, int, int, int, boolean):int[]");
    }
}
