package com.google.zxing.qrcode.decoder;

import com.google.zxing.qrcode.decoder.Version.ECB;
import com.google.zxing.qrcode.decoder.Version.ECBlocks;

final class DataBlock {
    private final byte[] codewords;
    private final int numDataCodewords;

    private DataBlock(int numDataCodewords, byte[] codewords) {
        this.numDataCodewords = numDataCodewords;
        this.codewords = codewords;
    }

    static DataBlock[] getDataBlocks(byte[] rawCodewords, Version version, ErrorCorrectionLevel ecLevel) {
        byte[] bArr = rawCodewords;
        if (bArr.length == version.getTotalCodewords()) {
            int i;
            int i2;
            int numDataCodewords;
            int numResultBlocks;
            int i3;
            ECBlocks ecBlocks = version.getECBlocksForLevel(ecLevel);
            ECB[] ecBlockArray = ecBlocks.getECBlocks();
            int totalBlocks = 0;
            for (ECB ecBlock : ecBlockArray) {
                totalBlocks += ecBlock.getCount();
            }
            DataBlock[] result = new DataBlock[totalBlocks];
            int totalBlocks2 = 0;
            for (ECB ecBlock2 : ecBlockArray) {
                i2 = 0;
                while (i2 < ecBlock2.getCount()) {
                    numDataCodewords = ecBlock2.getDataCodewords();
                    numResultBlocks = totalBlocks2 + 1;
                    result[totalBlocks2] = new DataBlock(numDataCodewords, new byte[(ecBlocks.getECCodewordsPerBlock() + numDataCodewords)]);
                    i2++;
                    totalBlocks2 = numResultBlocks;
                }
            }
            i2 = result[0].codewords.length;
            int length = result.length - 1;
            while (length >= 0 && result[length].codewords.length != i2) {
                length--;
            }
            int longerBlocksStartAt = length + 1;
            numDataCodewords = i2 - ecBlocks.getECCodewordsPerBlock();
            length = 0;
            for (i3 = 0; i3 < numDataCodewords; i3++) {
                i = 0;
                while (i < totalBlocks2) {
                    int rawCodewordsOffset = length + 1;
                    result[i].codewords[i3] = bArr[length];
                    i++;
                    length = rawCodewordsOffset;
                }
            }
            i = longerBlocksStartAt;
            while (i < totalBlocks2) {
                numResultBlocks = length + 1;
                result[i].codewords[numDataCodewords] = bArr[length];
                i++;
                length = numResultBlocks;
            }
            i3 = result[0].codewords.length;
            numResultBlocks = numDataCodewords;
            while (numResultBlocks < i3) {
                int j = 0;
                while (j < totalBlocks2) {
                    int rawCodewordsOffset2 = length + 1;
                    result[j].codewords[j < longerBlocksStartAt ? numResultBlocks : numResultBlocks + 1] = bArr[length];
                    j++;
                    length = rawCodewordsOffset2;
                }
                numResultBlocks++;
            }
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
