package com.google.zxing.common;

import com.google.zxing.Binarizer;
import com.google.zxing.LuminanceSource;
import com.google.zxing.NotFoundException;

public class GlobalHistogramBinarizer extends Binarizer {
    private static final byte[] EMPTY = new byte[0];
    private static final int LUMINANCE_BITS = 5;
    private static final int LUMINANCE_BUCKETS = 32;
    private static final int LUMINANCE_SHIFT = 3;
    private final int[] buckets = new int[32];
    private byte[] luminances = EMPTY;

    public GlobalHistogramBinarizer(LuminanceSource source) {
        super(source);
    }

    public BitArray getBlackRow(int y, BitArray row) throws NotFoundException {
        int x;
        int i;
        LuminanceSource source = getLuminanceSource();
        int width = source.getWidth();
        if (row == null || row.getSize() < width) {
            row = new BitArray(width);
        } else {
            row.clear();
        }
        initArrays(width);
        byte[] localLuminances = source.getRow(y, this.luminances);
        int[] localBuckets = this.buckets;
        for (x = 0; x < width; x++) {
            i = (localLuminances[x] & 255) >> 3;
            localBuckets[i] = localBuckets[i] + 1;
        }
        int blackPoint = estimateBlackPoint(localBuckets);
        x = localLuminances[0] & 255;
        int center = localLuminances[1] & 255;
        for (i = 1; i < width - 1; i++) {
            int right = localLuminances[i + 1] & 255;
            if ((((center * 4) - x) - right) / 2 < blackPoint) {
                row.set(i);
            }
            x = center;
            center = right;
        }
        return row;
    }

    public BitMatrix getBlackMatrix() throws NotFoundException {
        int y;
        byte[] localLuminances;
        int right;
        LuminanceSource source = getLuminanceSource();
        int width = source.getWidth();
        int height = source.getHeight();
        BitMatrix matrix = new BitMatrix(width, height);
        initArrays(width);
        int[] localBuckets = this.buckets;
        for (y = 1; y < 5; y++) {
            localLuminances = source.getRow((height * y) / 5, this.luminances);
            right = (width * 4) / 5;
            for (int x = width / 5; x < right; x++) {
                int i = (localLuminances[x] & 255) >> 3;
                localBuckets[i] = localBuckets[i] + 1;
            }
        }
        int blackPoint = estimateBlackPoint(localBuckets);
        localLuminances = source.getMatrix();
        for (right = 0; right < height; right++) {
            int offset = right * width;
            for (y = 0; y < width; y++) {
                if ((localLuminances[offset + y] & 255) < blackPoint) {
                    matrix.set(y, right);
                }
            }
        }
        return matrix;
    }

    public Binarizer createBinarizer(LuminanceSource source) {
        return new GlobalHistogramBinarizer(source);
    }

    private void initArrays(int luminanceSize) {
        if (this.luminances.length < luminanceSize) {
            this.luminances = new byte[luminanceSize];
        }
        for (int x = 0; x < 32; x++) {
            this.buckets[x] = 0;
        }
    }

    private static int estimateBlackPoint(int[] buckets) throws NotFoundException {
        int x;
        int x2;
        int distanceToBiggest;
        int score;
        int numBuckets = buckets.length;
        int maxBucketCount = 0;
        int firstPeak = 0;
        int firstPeakSize = 0;
        for (x = 0; x < numBuckets; x++) {
            if (buckets[x] > firstPeakSize) {
                firstPeak = x;
                firstPeakSize = buckets[x];
            }
            if (buckets[x] > maxBucketCount) {
                maxBucketCount = buckets[x];
            }
        }
        x = 0;
        int secondPeakScore = 0;
        for (x2 = 0; x2 < numBuckets; x2++) {
            distanceToBiggest = x2 - firstPeak;
            score = (buckets[x2] * distanceToBiggest) * distanceToBiggest;
            if (score > secondPeakScore) {
                x = x2;
                secondPeakScore = score;
            }
        }
        if (firstPeak > x) {
            x2 = firstPeak;
            firstPeak = x;
            x = x2;
        }
        if (x - firstPeak > numBuckets / 16) {
            x2 = x - 1;
            distanceToBiggest = -1;
            for (score = x - 1; score > firstPeak; score--) {
                int fromFirst = score - firstPeak;
                int score2 = ((fromFirst * fromFirst) * (x - score)) * (maxBucketCount - buckets[score]);
                if (score2 > distanceToBiggest) {
                    x2 = score;
                    distanceToBiggest = score2;
                }
            }
            return x2 << 3;
        }
        throw NotFoundException.getNotFoundInstance();
    }
}
