package com.google.zxing.datamatrix.decoder;

final class DataBlock {
    private final byte[] codewords;
    private final int numDataCodewords;

    private DataBlock(int numDataCodewords, byte[] codewords) {
        this.numDataCodewords = numDataCodewords;
        this.codewords = codewords;
    }

    static DataBlock[] getDataBlocks(byte[] rawCodewords, Version version) {
        int i;
        int numDataCodewords;
        int numResultBlocks;
        int longerBlocksTotalCodewords;
        int rawCodewordsOffset;
        byte[] bArr = rawCodewords;
        ECBlocks ecBlocks = version.getECBlocks();
        ECB[] ecBlockArray = ecBlocks.getECBlocks();
        int totalBlocks = 0;
        for (ECB ecBlock : ecBlockArray) {
            totalBlocks += ecBlock.getCount();
        }
        DataBlock[] result = new DataBlock[totalBlocks];
        int totalBlocks2 = 0;
        for (ECB ecBlock2 : ecBlockArray) {
            i = 0;
            while (i < ecBlock2.getCount()) {
                numDataCodewords = ecBlock2.getDataCodewords();
                numResultBlocks = totalBlocks2 + 1;
                result[totalBlocks2] = new DataBlock(numDataCodewords, new byte[(ecBlocks.getECCodewords() + numDataCodewords)]);
                i++;
                totalBlocks2 = numResultBlocks;
            }
        }
        i = result[0].codewords.length;
        int longerBlocksNumDataCodewords = i - ecBlocks.getECCodewords();
        numDataCodewords = longerBlocksNumDataCodewords - 1;
        int i2 = 0;
        int i3 = 0;
        while (i3 < numDataCodewords) {
            longerBlocksTotalCodewords = i;
            i = 0;
            while (i < totalBlocks2) {
                numResultBlocks = i2 + 1;
                result[i].codewords[i3] = bArr[i2];
                i++;
                i2 = numResultBlocks;
            }
            i3++;
            i = longerBlocksTotalCodewords;
        }
        boolean specialVersion = version.getVersionNumber() == 24;
        numResultBlocks = specialVersion ? 8 : totalBlocks2;
        i3 = 0;
        while (i3 < numResultBlocks) {
            longerBlocksTotalCodewords = i;
            rawCodewordsOffset = i2 + 1;
            result[i3].codewords[longerBlocksNumDataCodewords - 1] = bArr[i2];
            i3++;
            i2 = rawCodewordsOffset;
            i = longerBlocksTotalCodewords;
        }
        int max = result[0].codewords.length;
        for (rawCodewordsOffset = longerBlocksNumDataCodewords; rawCodewordsOffset < max; rawCodewordsOffset++) {
            int j = 0;
            while (j < totalBlocks2) {
                i3 = (!specialVersion || j <= 7) ? rawCodewordsOffset : rawCodewordsOffset - 1;
                longerBlocksTotalCodewords = i;
                int rawCodewordsOffset2 = i2 + 1;
                result[j].codewords[i3] = bArr[i2];
                j++;
                i = longerBlocksTotalCodewords;
                i2 = rawCodewordsOffset2;
            }
        }
        if (i2 == bArr.length) {
            return result;
        }
        throw new IllegalArgumentException();
    }

    int getNumDataCodewords() {
        return this.numDataCodewords;
    }

    byte[] getCodewords() {
        return this.codewords;
    }
}
