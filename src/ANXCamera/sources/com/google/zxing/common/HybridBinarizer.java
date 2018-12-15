package com.google.zxing.common;

import com.google.zxing.Binarizer;
import com.google.zxing.LuminanceSource;
import com.google.zxing.NotFoundException;
import java.lang.reflect.Array;

public final class HybridBinarizer extends GlobalHistogramBinarizer {
    private static final int BLOCK_SIZE = 8;
    private static final int BLOCK_SIZE_MASK = 7;
    private static final int BLOCK_SIZE_POWER = 3;
    private static final int MINIMUM_DIMENSION = 40;
    private static final int MIN_DYNAMIC_RANGE = 24;
    private BitMatrix matrix;

    public HybridBinarizer(LuminanceSource source) {
        super(source);
    }

    public BitMatrix getBlackMatrix() throws NotFoundException {
        if (this.matrix != null) {
            return this.matrix;
        }
        LuminanceSource source = getLuminanceSource();
        int width = source.getWidth();
        int height = source.getHeight();
        if (width < 40 || height < 40) {
            this.matrix = super.getBlackMatrix();
        } else {
            byte[] luminances = source.getMatrix();
            int subWidth = width >> 3;
            if ((width & 7) != 0) {
                subWidth++;
            }
            int subWidth2 = subWidth;
            subWidth = height >> 3;
            if ((height & 7) != 0) {
                subWidth++;
            }
            int subHeight = subWidth;
            int[][] blackPoints = calculateBlackPoints(luminances, subWidth2, subHeight, width, height);
            BitMatrix newMatrix = new BitMatrix(width, height);
            calculateThresholdForBlock(luminances, subWidth2, subHeight, width, height, blackPoints, newMatrix);
            this.matrix = newMatrix;
        }
        return this.matrix;
    }

    public Binarizer createBinarizer(LuminanceSource source) {
        return new HybridBinarizer(source);
    }

    private static void calculateThresholdForBlock(byte[] luminances, int subWidth, int subHeight, int width, int height, int[][] blackPoints, BitMatrix matrix) {
        int i = subWidth;
        int i2 = subHeight;
        for (int y = 0; y < i2; y++) {
            int yoffset = y << 3;
            int maxYOffset = height - 8;
            if (yoffset > maxYOffset) {
                yoffset = maxYOffset;
            }
            for (int x = 0; x < i; x++) {
                int xoffset = x << 3;
                int maxXOffset = width - 8;
                if (xoffset > maxXOffset) {
                    xoffset = maxXOffset;
                }
                int xoffset2 = xoffset;
                int left = cap(x, 2, i - 3);
                int top = cap(y, 2, i2 - 3);
                int sum = 0;
                for (int z = -2; z <= 2; z++) {
                    int[] blackRow = blackPoints[top + z];
                    sum += (((blackRow[left - 2] + blackRow[left - 1]) + blackRow[left]) + blackRow[left + 1]) + blackRow[left + 2];
                }
                thresholdBlock(luminances, xoffset2, yoffset, sum / 25, width, matrix);
            }
        }
    }

    private static int cap(int value, int min, int max) {
        if (value < min) {
            return min;
        }
        return value > max ? max : value;
    }

    private static void thresholdBlock(byte[] luminances, int xoffset, int yoffset, int threshold, int stride, BitMatrix matrix) {
        int y = 0;
        int offset = (yoffset * stride) + xoffset;
        while (y < 8) {
            for (int x = 0; x < 8; x++) {
                if ((luminances[offset + x] & 255) <= threshold) {
                    matrix.set(xoffset + x, yoffset + y);
                }
            }
            y++;
            offset += stride;
        }
    }

    private static int[][] calculateBlackPoints(byte[] luminances, int subWidth, int subHeight, int width, int height) {
        int i = subWidth;
        int i2 = subHeight;
        int[][] blackPoints = (int[][]) Array.newInstance(int.class, new int[]{i2, i});
        for (int y = 0; y < i2; y++) {
            int yoffset = y << 3;
            int maxYOffset = height - 8;
            if (yoffset > maxYOffset) {
                yoffset = maxYOffset;
            }
            int x = 0;
            while (x < i) {
                int sum;
                int xoffset = x << 3;
                int maxXOffset = width - 8;
                if (xoffset > maxXOffset) {
                    xoffset = maxXOffset;
                }
                int sum2 = 0;
                int min = 255;
                int max = 0;
                int yy = 0;
                int offset = (yoffset * width) + xoffset;
                while (true) {
                    i = 8;
                    if (yy >= 8) {
                        break;
                    }
                    sum = sum2;
                    sum2 = 0;
                    while (sum2 < i) {
                        i2 = i;
                        i = luminances[offset + sum2] & 255;
                        sum += i;
                        if (i < min) {
                            min = i;
                        }
                        if (i > max) {
                            max = i;
                        }
                        sum2++;
                        i = i2;
                        i2 = subHeight;
                    }
                    if (max - min > 24) {
                        i = yy + 1;
                        sum2 = offset + width;
                        while (true) {
                            yy = 8;
                            if (i >= 8) {
                                break;
                            }
                            i2 = 0;
                            while (i2 < yy) {
                                sum += luminances[sum2 + i2] & 255;
                                i2++;
                                yy = 8;
                            }
                            i++;
                            sum2 += width;
                            i2 = subHeight;
                        }
                        yy = i;
                    } else {
                        sum2 = offset;
                    }
                    yy++;
                    offset = sum2 + width;
                    sum2 = sum;
                    i = subWidth;
                    i2 = subHeight;
                }
                sum = sum2 >> 6;
                if (max - min <= 24) {
                    i = min / 2;
                    if (y > 0 && x > 0) {
                        yy = ((blackPoints[y - 1][x] + (2 * blackPoints[y][x - 1])) + blackPoints[y - 1][x - 1]) / 4;
                        if (min < yy) {
                            i = yy;
                        }
                    }
                } else {
                    i = sum;
                }
                blackPoints[y][x] = i;
                x++;
                i = subWidth;
            }
        }
        return blackPoints;
    }
}
