package com.google.zxing.qrcode.decoder;

import com.google.zxing.common.BitMatrix;

abstract class DataMask {
    private static final DataMask[] DATA_MASKS = new DataMask[]{new DataMask000(), new DataMask001(), new DataMask010(), new DataMask011(), new DataMask100(), new DataMask101(), new DataMask110(), new DataMask111()};

    private static final class DataMask000 extends DataMask {
        private DataMask000() {
            super();
        }

        /* synthetic */ DataMask000(DataMask000 dataMask000) {
            this();
        }

        boolean isMasked(int i, int j) {
            return ((i + j) & 1) == 0;
        }
    }

    private static final class DataMask001 extends DataMask {
        private DataMask001() {
            super();
        }

        /* synthetic */ DataMask001(DataMask001 dataMask001) {
            this();
        }

        boolean isMasked(int i, int j) {
            return (i & 1) == 0;
        }
    }

    private static final class DataMask010 extends DataMask {
        private DataMask010() {
            super();
        }

        /* synthetic */ DataMask010(DataMask010 dataMask010) {
            this();
        }

        boolean isMasked(int i, int j) {
            return j % 3 == 0;
        }
    }

    private static final class DataMask011 extends DataMask {
        private DataMask011() {
            super();
        }

        /* synthetic */ DataMask011(DataMask011 dataMask011) {
            this();
        }

        boolean isMasked(int i, int j) {
            return (i + j) % 3 == 0;
        }
    }

    private static final class DataMask100 extends DataMask {
        private DataMask100() {
            super();
        }

        /* synthetic */ DataMask100(DataMask100 dataMask100) {
            this();
        }

        boolean isMasked(int i, int j) {
            return (((i / 2) + (j / 3)) & 1) == 0;
        }
    }

    private static final class DataMask101 extends DataMask {
        private DataMask101() {
            super();
        }

        /* synthetic */ DataMask101(DataMask101 dataMask101) {
            this();
        }

        boolean isMasked(int i, int j) {
            int temp = i * j;
            return (temp & 1) + (temp % 3) == 0;
        }
    }

    private static final class DataMask110 extends DataMask {
        private DataMask110() {
            super();
        }

        /* synthetic */ DataMask110(DataMask110 dataMask110) {
            this();
        }

        boolean isMasked(int i, int j) {
            int temp = i * j;
            return (((temp & 1) + (temp % 3)) & 1) == 0;
        }
    }

    private static final class DataMask111 extends DataMask {
        private DataMask111() {
            super();
        }

        /* synthetic */ DataMask111(DataMask111 dataMask111) {
            this();
        }

        boolean isMasked(int i, int j) {
            return ((((i + j) & 1) + ((i * j) % 3)) & 1) == 0;
        }
    }

    abstract boolean isMasked(int i, int i2);

    private DataMask() {
    }

    /* synthetic */ DataMask(DataMask dataMask) {
        this();
    }

    final void unmaskBitMatrix(BitMatrix bits, int dimension) {
        for (int i = 0; i < dimension; i++) {
            for (int j = 0; j < dimension; j++) {
                if (isMasked(i, j)) {
                    bits.flip(j, i);
                }
            }
        }
    }

    static DataMask forReference(int reference) {
        if (reference >= 0 && reference <= 7) {
            return DATA_MASKS[reference];
        }
        throw new IllegalArgumentException();
    }
}
