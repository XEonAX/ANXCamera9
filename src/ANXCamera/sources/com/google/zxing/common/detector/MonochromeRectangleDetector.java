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
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private int[] blackWhiteRange(int fixedDimension, int maxWhiteRun, int minDim, int maxDim, boolean horizontal) {
        int whiteRunSize;
        int center = (minDim + maxDim) / 2;
        int start = center;
        while (start >= minDim) {
            int start2;
            if (!horizontal) {
                start2 = start;
                while (true) {
                    start2--;
                    if (start2 < minDim) {
                    }
                }
                whiteRunSize = start - start2;
                if (start2 >= minDim) {
                }
                break;
            }
            start2 = start;
            while (true) {
                start2--;
                if (start2 < minDim) {
                    break;
                } else if (horizontal) {
                    if (this.image.get(start2, fixedDimension)) {
                        break;
                    }
                } else if (this.image.get(fixedDimension, start2)) {
                    break;
                }
            }
            whiteRunSize = start - start2;
            if (start2 >= minDim || whiteRunSize > maxWhiteRun) {
                break;
            }
            start = start2;
            start--;
        }
        start++;
        whiteRunSize = center;
        while (whiteRunSize < maxDim) {
            int end;
            int whiteRunSize2;
            if (!horizontal) {
                end = whiteRunSize;
                while (true) {
                    end++;
                    if (end >= maxDim) {
                    }
                }
                whiteRunSize2 = end - whiteRunSize;
                if (end < maxDim) {
                }
                break;
            }
            end = whiteRunSize;
            while (true) {
                end++;
                if (end >= maxDim) {
                    break;
                } else if (horizontal) {
                    if (this.image.get(end, fixedDimension)) {
                        break;
                    }
                } else if (this.image.get(fixedDimension, end)) {
                    break;
                }
            }
            whiteRunSize2 = end - whiteRunSize;
            if (end < maxDim || whiteRunSize2 > maxWhiteRun) {
                break;
            }
            whiteRunSize = end;
            whiteRunSize++;
        }
        if (whiteRunSize - 1 <= start) {
            return null;
        }
        return new int[]{start, whiteRunSize - 1};
    }
}
