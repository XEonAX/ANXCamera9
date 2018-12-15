package com.google.zxing.aztec.encoder;

import com.google.zxing.common.BitArray;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.common.reedsolomon.GenericGF;
import com.google.zxing.common.reedsolomon.ReedSolomonEncoder;

public final class Encoder {
    public static final int DEFAULT_AZTEC_LAYERS = 0;
    public static final int DEFAULT_EC_PERCENT = 33;
    private static final int MAX_NB_BITS = 32;
    private static final int MAX_NB_BITS_COMPACT = 4;
    private static final int[] WORD_SIZE = new int[]{4, 6, 6, 8, 8, 8, 8, 8, 8, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12};

    private Encoder() {
    }

    public static AztecCode encode(byte[] data) {
        return encode(data, 33, 0);
    }

    public static AztecCode encode(byte[] data, int minECCPercent, int userSpecifiedLayers) {
        boolean compact;
        int layers;
        int wordSize;
        int totalBitsInLayer;
        BitArray stuffedBits;
        int i;
        boolean compact2;
        int layers2;
        BitArray bits;
        int eccBits;
        int totalSizeBits;
        int matrixSize;
        int i2;
        int i3;
        BitArray stuffedBits2;
        BitArray bits2 = new HighLevelEncoder(data).encode();
        int baseMatrixSize = 11;
        int eccBits2 = ((bits2.getSize() * minECCPercent) / 100) + 11;
        int totalSizeBits2 = bits2.getSize() + eccBits2;
        int i4 = 32;
        boolean z = false;
        boolean z2 = true;
        if (userSpecifiedLayers != 0) {
            compact = userSpecifiedLayers < 0;
            layers = Math.abs(userSpecifiedLayers);
            if (compact) {
                i4 = 4;
            }
            if (layers <= i4) {
                i4 = totalBitsInLayer(layers, compact);
                wordSize = WORD_SIZE[layers];
                int usableBitsInLayers = i4 - (i4 % wordSize);
                BitArray stuffedBits3 = stuffBits(bits2, wordSize);
                if (stuffedBits3.getSize() + eccBits2 > usableBitsInLayers) {
                    throw new IllegalArgumentException("Data to large for user specified layer");
                } else if (!compact || stuffedBits3.getSize() <= wordSize * 64) {
                    totalBitsInLayer = i4;
                    stuffedBits = stuffedBits3;
                } else {
                    throw new IllegalArgumentException("Data to large for user specified layer");
                }
            }
            throw new IllegalArgumentException(String.format("Illegal value %s for layers", new Object[]{Integer.valueOf(userSpecifiedLayers)}));
        }
        BitArray stuffedBits4 = null;
        layers = 0;
        i = 0;
        while (i <= i4) {
            boolean totalSizeBits3;
            compact2 = i <= 3 ? z2 : z;
            layers2 = compact2 ? i + 1 : i;
            totalBitsInLayer = totalBitsInLayer(layers2, compact2);
            if (totalSizeBits2 > totalBitsInLayer) {
                bits = bits2;
                eccBits = eccBits2;
                totalSizeBits = totalSizeBits2;
                totalSizeBits3 = z2;
            } else {
                if (layers != WORD_SIZE[layers2]) {
                    i4 = WORD_SIZE[layers2];
                    stuffedBits4 = stuffBits(bits2, i4);
                    layers = i4;
                }
                i4 = totalBitsInLayer - (totalBitsInLayer % layers);
                if (compact2 && stuffedBits4.getSize() > layers * 64) {
                    bits = bits2;
                    eccBits = eccBits2;
                    totalSizeBits = totalSizeBits2;
                    totalSizeBits3 = true;
                } else if (stuffedBits4.getSize() + eccBits2 <= i4) {
                    stuffedBits = stuffedBits4;
                    wordSize = layers;
                    compact = compact2;
                    layers = layers2;
                } else {
                    bits = bits2;
                    eccBits = eccBits2;
                    totalSizeBits = totalSizeBits2;
                    totalSizeBits3 = true;
                }
            }
            i++;
            z2 = totalSizeBits3;
            bits2 = bits;
            eccBits2 = eccBits;
            totalSizeBits2 = totalSizeBits;
            byte[] bArr = data;
            i4 = 32;
            z = false;
        }
        eccBits = eccBits2;
        totalSizeBits = totalSizeBits2;
        throw new IllegalArgumentException("Data too large for an Aztec code");
        z2 = compact;
        i = layers;
        layers = generateCheckWords(stuffedBits, totalBitsInLayer, wordSize);
        compact2 = stuffedBits.getSize() / wordSize;
        layers2 = generateModeMessage(z2, i, compact2);
        if (!z2) {
            baseMatrixSize = 14;
        }
        baseMatrixSize += i * 4;
        totalBitsInLayer = new int[baseMatrixSize];
        if (z2) {
            matrixSize = baseMatrixSize;
            i2 = 0;
            while (true) {
                bits = bits2;
                if (i2 >= totalBitsInLayer.length) {
                    break;
                }
                totalBitsInLayer[i2] = i2;
                i2++;
                bits2 = bits;
            }
        } else {
            matrixSize = (baseMatrixSize + 1) + ((((baseMatrixSize / 2) - 1) / 15) * 2);
            i2 = baseMatrixSize / 2;
            bits2 = matrixSize / 2;
            i3 = 0;
            while (i3 < i2) {
                eccBits = eccBits2;
                totalSizeBits = totalSizeBits2;
                stuffedBits2 = stuffedBits;
                eccBits2 = (i3 / 15) + i3;
                totalBitsInLayer[(i2 - i3) - 1] = (bits2 - eccBits2) - 1;
                totalBitsInLayer[i2 + i3] = (bits2 + eccBits2) + 1;
                i3++;
                eccBits2 = eccBits;
                totalSizeBits2 = totalSizeBits;
                stuffedBits = stuffedBits2;
            }
        }
        i2 = matrixSize;
        bits2 = new BitMatrix(i2);
        i3 = 0;
        int rowOffset = 0;
        while (i3 < i) {
            eccBits = eccBits2;
            eccBits2 = z2 ? ((i - i3) * 4) + 9 : ((i - i3) * 4) + 12;
            int j = 0;
            while (j < eccBits2) {
                int columnOffset = j * 2;
                int matrixSize2 = i2;
                i2 = 0;
                while (true) {
                    totalSizeBits = totalSizeBits2;
                    if (i2 >= 2) {
                        break;
                    }
                    if (layers.get((rowOffset + columnOffset) + i2)) {
                        stuffedBits2 = stuffedBits;
                        bits2.set(totalBitsInLayer[(i3 * 2) + i2], totalBitsInLayer[(i3 * 2) + j]);
                    } else {
                        stuffedBits2 = stuffedBits;
                    }
                    if (layers.get(((rowOffset + (eccBits2 * 2)) + columnOffset) + i2)) {
                        bits2.set(totalBitsInLayer[(i3 * 2) + j], totalBitsInLayer[((baseMatrixSize - 1) - (i3 * 2)) - i2]);
                    }
                    if (layers.get(((rowOffset + (eccBits2 * 4)) + columnOffset) + i2)) {
                        bits2.set(totalBitsInLayer[((baseMatrixSize - 1) - (i3 * 2)) - i2], totalBitsInLayer[((baseMatrixSize - 1) - (i3 * 2)) - j]);
                    }
                    if (layers.get(((rowOffset + (eccBits2 * 6)) + columnOffset) + i2)) {
                        bits2.set(totalBitsInLayer[((baseMatrixSize - 1) - (i3 * 2)) - j], totalBitsInLayer[(i3 * 2) + i2]);
                    }
                    i2++;
                    totalSizeBits2 = totalSizeBits;
                    stuffedBits = stuffedBits2;
                }
                j++;
                i2 = matrixSize2;
                totalSizeBits2 = totalSizeBits;
            }
            rowOffset += eccBits2 * 8;
            i3++;
            eccBits2 = eccBits;
        }
        drawModeMessage(bits2, z2, i2, layers2);
        if (z2) {
            eccBits = eccBits2;
            drawBullsEye(bits2, i2 / 2, 5);
        } else {
            drawBullsEye(bits2, i2 / 2, 7);
            matrixSize = 0;
            eccBits2 = 0;
            while (eccBits2 < (baseMatrixSize / 2) - 1) {
                i3 = (i2 / 2) & 1;
                while (i3 < i2) {
                    int i5 = eccBits2;
                    bits2.set((i2 / 2) - matrixSize, i3);
                    bits2.set((i2 / 2) + matrixSize, i3);
                    bits2.set(i3, (i2 / 2) - matrixSize);
                    bits2.set(i3, (i2 / 2) + matrixSize);
                    i3 += 2;
                    eccBits2 = i5;
                }
                eccBits2 += 15;
                matrixSize += 16;
            }
        }
        AztecCode aztec = new AztecCode();
        aztec.setCompact(z2);
        aztec.setSize(i2);
        aztec.setLayers(i);
        aztec.setCodeWords(compact2);
        aztec.setMatrix(bits2);
        return aztec;
    }

    private static void drawBullsEye(BitMatrix matrix, int center, int size) {
        for (int i = 0; i < size; i += 2) {
            for (int j = center - i; j <= center + i; j++) {
                matrix.set(j, center - i);
                matrix.set(j, center + i);
                matrix.set(center - i, j);
                matrix.set(center + i, j);
            }
        }
        matrix.set(center - size, center - size);
        matrix.set((center - size) + 1, center - size);
        matrix.set(center - size, (center - size) + 1);
        matrix.set(center + size, center - size);
        matrix.set(center + size, (center - size) + 1);
        matrix.set(center + size, (center + size) - 1);
    }

    static BitArray generateModeMessage(boolean compact, int layers, int messageSizeInWords) {
        BitArray modeMessage = new BitArray();
        if (compact) {
            modeMessage.appendBits(layers - 1, 2);
            modeMessage.appendBits(messageSizeInWords - 1, 6);
            return generateCheckWords(modeMessage, 28, 4);
        }
        modeMessage.appendBits(layers - 1, 5);
        modeMessage.appendBits(messageSizeInWords - 1, 11);
        return generateCheckWords(modeMessage, 40, 4);
    }

    private static void drawModeMessage(BitMatrix matrix, boolean compact, int matrixSize, BitArray modeMessage) {
        int center = matrixSize / 2;
        int i;
        int offset;
        if (compact) {
            for (i = 0; i < 7; i++) {
                offset = (center - 3) + i;
                if (modeMessage.get(i)) {
                    matrix.set(offset, center - 5);
                }
                if (modeMessage.get(i + 7)) {
                    matrix.set(center + 5, offset);
                }
                if (modeMessage.get(20 - i)) {
                    matrix.set(offset, center + 5);
                }
                if (modeMessage.get(27 - i)) {
                    matrix.set(center - 5, offset);
                }
            }
            return;
        }
        for (i = 0; i < 10; i++) {
            offset = ((center - 5) + i) + (i / 5);
            if (modeMessage.get(i)) {
                matrix.set(offset, center - 7);
            }
            if (modeMessage.get(i + 10)) {
                matrix.set(center + 7, offset);
            }
            if (modeMessage.get(29 - i)) {
                matrix.set(offset, center + 7);
            }
            if (modeMessage.get(39 - i)) {
                matrix.set(center - 7, offset);
            }
        }
    }

    private static BitArray generateCheckWords(BitArray bitArray, int totalBits, int wordSize) {
        int messageSizeInWords = bitArray.getSize() / wordSize;
        ReedSolomonEncoder rs = new ReedSolomonEncoder(getGF(wordSize));
        int totalWords = totalBits / wordSize;
        int[] messageWords = bitsToWords(bitArray, wordSize, totalWords);
        rs.encode(messageWords, totalWords - messageSizeInWords);
        int startPad = totalBits % wordSize;
        BitArray messageBits = new BitArray();
        int i = 0;
        messageBits.appendBits(0, startPad);
        int length = messageWords.length;
        while (i < length) {
            messageBits.appendBits(messageWords[i], wordSize);
            i++;
        }
        return messageBits;
    }

    private static int[] bitsToWords(BitArray stuffedBits, int wordSize, int totalWords) {
        int[] message = new int[totalWords];
        int n = stuffedBits.getSize() / wordSize;
        for (int i = 0; i < n; i++) {
            int value = 0;
            for (int j = 0; j < wordSize; j++) {
                value |= stuffedBits.get((i * wordSize) + j) ? 1 << ((wordSize - j) - 1) : 0;
            }
            message[i] = value;
        }
        return message;
    }

    private static GenericGF getGF(int wordSize) {
        if (wordSize == 4) {
            return GenericGF.AZTEC_PARAM;
        }
        if (wordSize == 6) {
            return GenericGF.AZTEC_DATA_6;
        }
        if (wordSize == 8) {
            return GenericGF.AZTEC_DATA_8;
        }
        if (wordSize == 10) {
            return GenericGF.AZTEC_DATA_10;
        }
        if (wordSize != 12) {
            return null;
        }
        return GenericGF.AZTEC_DATA_12;
    }

    static BitArray stuffBits(BitArray bits, int wordSize) {
        BitArray out = new BitArray();
        int n = bits.getSize();
        int mask = (1 << wordSize) - 2;
        int i = 0;
        while (i < n) {
            int word = 0;
            int j = 0;
            while (j < wordSize) {
                if (i + j >= n || bits.get(i + j)) {
                    word |= 1 << ((wordSize - 1) - j);
                }
                j++;
            }
            if ((word & mask) == mask) {
                out.appendBits(word & mask, wordSize);
                i--;
            } else if ((word & mask) == 0) {
                out.appendBits(word | 1, wordSize);
                i--;
            } else {
                out.appendBits(word, wordSize);
            }
            i += wordSize;
        }
        return out;
    }

    private static int totalBitsInLayer(int layers, boolean compact) {
        return ((compact ? 88 : 112) + (16 * layers)) * layers;
    }
}
