package com.google.zxing.qrcode.encoder;

import com.google.zxing.EncodeHintType;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitArray;
import com.google.zxing.common.CharacterSetECI;
import com.google.zxing.common.reedsolomon.GenericGF;
import com.google.zxing.common.reedsolomon.ReedSolomonEncoder;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;
import com.google.zxing.qrcode.decoder.Mode;
import com.google.zxing.qrcode.decoder.Version;
import com.google.zxing.qrcode.decoder.Version.ECBlocks;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Map;

public final class Encoder {
    private static /* synthetic */ int[] $SWITCH_TABLE$com$google$zxing$qrcode$decoder$Mode = null;
    private static final int[] ALPHANUMERIC_TABLE;
    static final String DEFAULT_BYTE_MODE_ENCODING = "ISO-8859-1";

    static /* synthetic */ int[] $SWITCH_TABLE$com$google$zxing$qrcode$decoder$Mode() {
        int[] iArr = $SWITCH_TABLE$com$google$zxing$qrcode$decoder$Mode;
        if (iArr != null) {
            return iArr;
        }
        iArr = new int[Mode.values().length];
        try {
            iArr[Mode.ALPHANUMERIC.ordinal()] = 3;
        } catch (NoSuchFieldError e) {
        }
        try {
            iArr[Mode.BYTE.ordinal()] = 5;
        } catch (NoSuchFieldError e2) {
        }
        try {
            iArr[Mode.ECI.ordinal()] = 6;
        } catch (NoSuchFieldError e3) {
        }
        try {
            iArr[Mode.FNC1_FIRST_POSITION.ordinal()] = 8;
        } catch (NoSuchFieldError e4) {
        }
        try {
            iArr[Mode.FNC1_SECOND_POSITION.ordinal()] = 9;
        } catch (NoSuchFieldError e5) {
        }
        try {
            iArr[Mode.HANZI.ordinal()] = 10;
        } catch (NoSuchFieldError e6) {
        }
        try {
            iArr[Mode.KANJI.ordinal()] = 7;
        } catch (NoSuchFieldError e7) {
        }
        try {
            iArr[Mode.NUMERIC.ordinal()] = 2;
        } catch (NoSuchFieldError e8) {
        }
        try {
            iArr[Mode.STRUCTURED_APPEND.ordinal()] = 4;
        } catch (NoSuchFieldError e9) {
        }
        try {
            iArr[Mode.TERMINATOR.ordinal()] = 1;
        } catch (NoSuchFieldError e10) {
        }
        $SWITCH_TABLE$com$google$zxing$qrcode$decoder$Mode = iArr;
        return iArr;
    }

    static {
        int[] iArr = new int[96];
        iArr[0] = -1;
        iArr[1] = -1;
        iArr[2] = -1;
        iArr[3] = -1;
        iArr[4] = -1;
        iArr[5] = -1;
        iArr[6] = -1;
        iArr[7] = -1;
        iArr[8] = -1;
        iArr[9] = -1;
        iArr[10] = -1;
        iArr[11] = -1;
        iArr[12] = -1;
        iArr[13] = -1;
        iArr[14] = -1;
        iArr[15] = -1;
        iArr[16] = -1;
        iArr[17] = -1;
        iArr[18] = -1;
        iArr[19] = -1;
        iArr[20] = -1;
        iArr[21] = -1;
        iArr[22] = -1;
        iArr[23] = -1;
        iArr[24] = -1;
        iArr[25] = -1;
        iArr[26] = -1;
        iArr[27] = -1;
        iArr[28] = -1;
        iArr[29] = -1;
        iArr[30] = -1;
        iArr[31] = -1;
        iArr[32] = 36;
        iArr[33] = -1;
        iArr[34] = -1;
        iArr[35] = -1;
        iArr[36] = 37;
        iArr[37] = 38;
        iArr[38] = -1;
        iArr[39] = -1;
        iArr[40] = -1;
        iArr[41] = -1;
        iArr[42] = 39;
        iArr[43] = 40;
        iArr[44] = -1;
        iArr[45] = 41;
        iArr[46] = 42;
        iArr[47] = 43;
        iArr[49] = 1;
        iArr[50] = 2;
        iArr[51] = 3;
        iArr[52] = 4;
        iArr[53] = 5;
        iArr[54] = 6;
        iArr[55] = 7;
        iArr[56] = 8;
        iArr[57] = 9;
        iArr[58] = 44;
        iArr[59] = -1;
        iArr[60] = -1;
        iArr[61] = -1;
        iArr[62] = -1;
        iArr[63] = -1;
        iArr[64] = -1;
        iArr[65] = 10;
        iArr[66] = 11;
        iArr[67] = 12;
        iArr[68] = 13;
        iArr[69] = 14;
        iArr[70] = 15;
        iArr[71] = 16;
        iArr[72] = 17;
        iArr[73] = 18;
        iArr[74] = 19;
        iArr[75] = 20;
        iArr[76] = 21;
        iArr[77] = 22;
        iArr[78] = 23;
        iArr[79] = 24;
        iArr[80] = 25;
        iArr[81] = 26;
        iArr[82] = 27;
        iArr[83] = 28;
        iArr[84] = 29;
        iArr[85] = 30;
        iArr[86] = 31;
        iArr[87] = 32;
        iArr[88] = 33;
        iArr[89] = 34;
        iArr[90] = 35;
        iArr[91] = -1;
        iArr[92] = -1;
        iArr[93] = -1;
        iArr[94] = -1;
        iArr[95] = -1;
        ALPHANUMERIC_TABLE = iArr;
    }

    private Encoder() {
    }

    private static int calculateMaskPenalty(ByteMatrix matrix) {
        return ((MaskUtil.applyMaskPenaltyRule1(matrix) + MaskUtil.applyMaskPenaltyRule2(matrix)) + MaskUtil.applyMaskPenaltyRule3(matrix)) + MaskUtil.applyMaskPenaltyRule4(matrix);
    }

    public static QRCode encode(String content, ErrorCorrectionLevel ecLevel) throws WriterException {
        return encode(content, ecLevel, null);
    }

    public static QRCode encode(String content, ErrorCorrectionLevel ecLevel, Map<EncodeHintType, ?> hints) throws WriterException {
        String str = content;
        ErrorCorrectionLevel errorCorrectionLevel = ecLevel;
        Map<EncodeHintType, ?> map = hints;
        String encoding = map == null ? null : (String) map.get(EncodeHintType.CHARACTER_SET);
        if (encoding == null) {
            encoding = "ISO-8859-1";
        }
        Mode mode = chooseMode(str, encoding);
        BitArray headerBits = new BitArray();
        if (mode == Mode.BYTE && !"ISO-8859-1".equals(encoding)) {
            CharacterSetECI eci = CharacterSetECI.getCharacterSetECIByName(encoding);
            if (eci != null) {
                appendECI(eci, headerBits);
            }
        }
        appendModeInfo(mode, headerBits);
        BitArray dataBits = new BitArray();
        appendBytes(str, mode, dataBits, encoding);
        Version version = chooseVersion((headerBits.getSize() + mode.getCharacterCountBits(chooseVersion((headerBits.getSize() + mode.getCharacterCountBits(Version.getVersionForNumber(1))) + dataBits.getSize(), errorCorrectionLevel))) + dataBits.getSize(), errorCorrectionLevel);
        BitArray headerAndDataBits = new BitArray();
        headerAndDataBits.appendBitArray(headerBits);
        appendLengthInfo(mode == Mode.BYTE ? dataBits.getSizeInBytes() : content.length(), version, mode, headerAndDataBits);
        headerAndDataBits.appendBitArray(dataBits);
        ECBlocks ecBlocks = version.getECBlocksForLevel(errorCorrectionLevel);
        int numDataBytes = version.getTotalCodewords() - ecBlocks.getTotalECCodewords();
        terminateBits(numDataBytes, headerAndDataBits);
        BitArray finalBits = interleaveWithECBytes(headerAndDataBits, version.getTotalCodewords(), numDataBytes, ecBlocks.getNumBlocks());
        QRCode qrCode = new QRCode();
        qrCode.setECLevel(errorCorrectionLevel);
        qrCode.setMode(mode);
        qrCode.setVersion(version);
        int dimension = version.getDimensionForVersion();
        ByteMatrix matrix = new ByteMatrix(dimension, dimension);
        dimension = chooseMaskPattern(finalBits, errorCorrectionLevel, version, matrix);
        qrCode.setMaskPattern(dimension);
        MatrixUtil.buildMatrix(finalBits, errorCorrectionLevel, version, dimension, matrix);
        qrCode.setMatrix(matrix);
        return qrCode;
    }

    static int getAlphanumericCode(int code) {
        if (code < ALPHANUMERIC_TABLE.length) {
            return ALPHANUMERIC_TABLE[code];
        }
        return -1;
    }

    public static Mode chooseMode(String content) {
        return chooseMode(content, null);
    }

    private static Mode chooseMode(String content, String encoding) {
        if ("Shift_JIS".equals(encoding)) {
            return isOnlyDoubleByteKanji(content) ? Mode.KANJI : Mode.BYTE;
        }
        boolean hasNumeric = false;
        boolean hasAlphanumeric = false;
        for (int i = 0; i < content.length(); i++) {
            char c = content.charAt(i);
            if (c >= '0' && c <= '9') {
                hasNumeric = true;
            } else if (getAlphanumericCode(c) == -1) {
                return Mode.BYTE;
            } else {
                hasAlphanumeric = true;
            }
        }
        if (hasAlphanumeric) {
            return Mode.ALPHANUMERIC;
        }
        if (hasNumeric) {
            return Mode.NUMERIC;
        }
        return Mode.BYTE;
    }

    private static boolean isOnlyDoubleByteKanji(String content) {
        try {
            byte[] bytes = content.getBytes("Shift_JIS");
            int length = bytes.length;
            if (length % 2 != 0) {
                return false;
            }
            for (int i = 0; i < length; i += 2) {
                int byte1 = bytes[i] & 255;
                if ((byte1 < 129 || byte1 > 159) && (byte1 < 224 || byte1 > 235)) {
                    return false;
                }
            }
            return true;
        } catch (UnsupportedEncodingException e) {
            return false;
        }
    }

    private static int chooseMaskPattern(BitArray bits, ErrorCorrectionLevel ecLevel, Version version, ByteMatrix matrix) throws WriterException {
        int minPenalty = Integer.MAX_VALUE;
        int bestMaskPattern = -1;
        for (int maskPattern = 0; maskPattern < 8; maskPattern++) {
            MatrixUtil.buildMatrix(bits, ecLevel, version, maskPattern, matrix);
            int penalty = calculateMaskPenalty(matrix);
            if (penalty < minPenalty) {
                minPenalty = penalty;
                bestMaskPattern = maskPattern;
            }
        }
        return bestMaskPattern;
    }

    private static Version chooseVersion(int numInputBits, ErrorCorrectionLevel ecLevel) throws WriterException {
        for (int versionNum = 1; versionNum <= 40; versionNum++) {
            Version version = Version.getVersionForNumber(versionNum);
            if (version.getTotalCodewords() - version.getECBlocksForLevel(ecLevel).getTotalECCodewords() >= (numInputBits + 7) / 8) {
                return version;
            }
        }
        throw new WriterException("Data too big");
    }

    static void terminateBits(int numDataBytes, BitArray bits) throws WriterException {
        int capacity = numDataBytes * 8;
        if (bits.getSize() <= capacity) {
            int i;
            int i2;
            for (i = 0; i < 4 && bits.getSize() < capacity; i++) {
                bits.appendBit(false);
            }
            i = bits.getSize() & 7;
            if (i > 0) {
                for (i2 = i; i2 < 8; i2++) {
                    bits.appendBit(false);
                }
            }
            int numPaddingBytes = numDataBytes - bits.getSizeInBytes();
            for (i2 = 0; i2 < numPaddingBytes; i2++) {
                bits.appendBits((i2 & 1) == 0 ? 236 : 17, 8);
            }
            if (bits.getSize() != capacity) {
                throw new WriterException("Bits size does not equal capacity");
            }
            return;
        }
        StringBuilder stringBuilder = new StringBuilder("data bits cannot fit in the QR Code");
        stringBuilder.append(bits.getSize());
        stringBuilder.append(" > ");
        stringBuilder.append(capacity);
        throw new WriterException(stringBuilder.toString());
    }

    static void getNumDataBytesAndNumECBytesForBlockID(int numTotalBytes, int numDataBytes, int numRSBlocks, int blockID, int[] numDataBytesInBlock, int[] numECBytesInBlock) throws WriterException {
        if (blockID < numRSBlocks) {
            int numRsBlocksInGroup2 = numTotalBytes % numRSBlocks;
            int numRsBlocksInGroup1 = numRSBlocks - numRsBlocksInGroup2;
            int numTotalBytesInGroup1 = numTotalBytes / numRSBlocks;
            int numDataBytesInGroup1 = numDataBytes / numRSBlocks;
            int numDataBytesInGroup2 = numDataBytesInGroup1 + 1;
            int numEcBytesInGroup1 = numTotalBytesInGroup1 - numDataBytesInGroup1;
            int numEcBytesInGroup2 = (numTotalBytesInGroup1 + 1) - numDataBytesInGroup2;
            if (numEcBytesInGroup1 != numEcBytesInGroup2) {
                throw new WriterException("EC bytes mismatch");
            } else if (numRSBlocks != numRsBlocksInGroup1 + numRsBlocksInGroup2) {
                throw new WriterException("RS blocks mismatch");
            } else if (numTotalBytes != ((numDataBytesInGroup1 + numEcBytesInGroup1) * numRsBlocksInGroup1) + ((numDataBytesInGroup2 + numEcBytesInGroup2) * numRsBlocksInGroup2)) {
                throw new WriterException("Total bytes mismatch");
            } else if (blockID < numRsBlocksInGroup1) {
                numDataBytesInBlock[0] = numDataBytesInGroup1;
                numECBytesInBlock[0] = numEcBytesInGroup1;
                return;
            } else {
                numDataBytesInBlock[0] = numDataBytesInGroup2;
                numECBytesInBlock[0] = numEcBytesInGroup2;
                return;
            }
        }
        throw new WriterException("Block ID too large");
    }

    static BitArray interleaveWithECBytes(BitArray bits, int numTotalBytes, int numDataBytes, int numRSBlocks) throws WriterException {
        int i = numTotalBytes;
        int i2 = numDataBytes;
        int i3 = numRSBlocks;
        if (bits.getSizeInBytes() == i2) {
            int size;
            byte[] ecBytes;
            ArrayList<BlockPair> blocks = new ArrayList(i3);
            int dataBytesOffset = 0;
            int maxNumDataBytes = 0;
            int maxNumEcBytes = 0;
            for (int i4 = 0; i4 < i3; i4++) {
                int[] numDataBytesInBlock = new int[1];
                int[] numEcBytesInBlock = new int[1];
                int[] numEcBytesInBlock2 = numEcBytesInBlock;
                getNumDataBytesAndNumECBytesForBlockID(i, i2, i3, i4, numDataBytesInBlock, numEcBytesInBlock);
                size = numDataBytesInBlock[0];
                byte[] dataBytes = new byte[size];
                bits.toBytes(8 * dataBytesOffset, dataBytes, 0, size);
                ecBytes = generateECBytes(dataBytes, numEcBytesInBlock2[0]);
                blocks.add(new BlockPair(dataBytes, ecBytes));
                maxNumDataBytes = Math.max(maxNumDataBytes, size);
                maxNumEcBytes = Math.max(maxNumEcBytes, ecBytes.length);
                dataBytesOffset += numDataBytesInBlock[0];
            }
            if (i2 == dataBytesOffset) {
                BitArray result = new BitArray();
                for (size = 0; size < maxNumDataBytes; size++) {
                    for (BlockPair block : blocks) {
                        ecBytes = block.getDataBytes();
                        if (size < ecBytes.length) {
                            result.appendBits(ecBytes[size], 8);
                        }
                    }
                }
                for (int i5 = 0; i5 < maxNumEcBytes; i5++) {
                    for (BlockPair i6 : blocks) {
                        ecBytes = i6.getErrorCorrectionBytes();
                        if (i5 < ecBytes.length) {
                            result.appendBits(ecBytes[i5], 8);
                        }
                    }
                }
                if (i == result.getSizeInBytes()) {
                    return result;
                }
                StringBuilder stringBuilder = new StringBuilder("Interleaving error: ");
                stringBuilder.append(i);
                stringBuilder.append(" and ");
                stringBuilder.append(result.getSizeInBytes());
                stringBuilder.append(" differ.");
                throw new WriterException(stringBuilder.toString());
            }
            throw new WriterException("Data bytes does not match offset");
        }
        BitArray bitArray = bits;
        throw new WriterException("Number of bits and data bytes does not match");
    }

    static byte[] generateECBytes(byte[] dataBytes, int numEcBytesInBlock) {
        int i;
        int numDataBytes = dataBytes.length;
        int[] toEncode = new int[(numDataBytes + numEcBytesInBlock)];
        for (i = 0; i < numDataBytes; i++) {
            toEncode[i] = dataBytes[i] & 255;
        }
        new ReedSolomonEncoder(GenericGF.QR_CODE_FIELD_256).encode(toEncode, numEcBytesInBlock);
        byte[] ecBytes = new byte[numEcBytesInBlock];
        for (i = 0; i < numEcBytesInBlock; i++) {
            ecBytes[i] = (byte) toEncode[numDataBytes + i];
        }
        return ecBytes;
    }

    static void appendModeInfo(Mode mode, BitArray bits) {
        bits.appendBits(mode.getBits(), 4);
    }

    static void appendLengthInfo(int numLetters, Version version, Mode mode, BitArray bits) throws WriterException {
        int numBits = mode.getCharacterCountBits(version);
        if (numLetters < (1 << numBits)) {
            bits.appendBits(numLetters, numBits);
            return;
        }
        StringBuilder stringBuilder = new StringBuilder(String.valueOf(numLetters));
        stringBuilder.append(" is bigger than ");
        stringBuilder.append((1 << numBits) - 1);
        throw new WriterException(stringBuilder.toString());
    }

    static void appendBytes(String content, Mode mode, BitArray bits, String encoding) throws WriterException {
        int i = $SWITCH_TABLE$com$google$zxing$qrcode$decoder$Mode()[mode.ordinal()];
        if (i == 5) {
            append8BitBytes(content, bits, encoding);
        } else if (i != 7) {
            switch (i) {
                case 2:
                    appendNumericBytes(content, bits);
                    return;
                case 3:
                    appendAlphanumericBytes(content, bits);
                    return;
                default:
                    StringBuilder stringBuilder = new StringBuilder("Invalid mode: ");
                    stringBuilder.append(mode);
                    throw new WriterException(stringBuilder.toString());
            }
        } else {
            appendKanjiBytes(content, bits);
        }
    }

    static void appendNumericBytes(CharSequence content, BitArray bits) {
        int length = content.length();
        int i = 0;
        while (i < length) {
            int num1 = content.charAt(i) - 48;
            if (i + 2 < length) {
                bits.appendBits(((num1 * 100) + ((content.charAt(i + 1) - 48) * 10)) + (content.charAt(i + 2) - 48), 10);
                i += 3;
            } else if (i + 1 < length) {
                bits.appendBits((num1 * 10) + (content.charAt(i + 1) - 48), 7);
                i += 2;
            } else {
                bits.appendBits(num1, 4);
                i++;
            }
        }
    }

    static void appendAlphanumericBytes(CharSequence content, BitArray bits) throws WriterException {
        int length = content.length();
        int i = 0;
        while (i < length) {
            int code1 = getAlphanumericCode(content.charAt(i));
            if (code1 == -1) {
                throw new WriterException();
            } else if (i + 1 < length) {
                int code2 = getAlphanumericCode(content.charAt(i + 1));
                if (code2 != -1) {
                    bits.appendBits((code1 * 45) + code2, 11);
                    i += 2;
                } else {
                    throw new WriterException();
                }
            } else {
                bits.appendBits(code1, 6);
                i++;
            }
        }
    }

    static void append8BitBytes(String content, BitArray bits, String encoding) throws WriterException {
        try {
            for (byte b : content.getBytes(encoding)) {
                bits.appendBits(b, 8);
            }
        } catch (Throwable uee) {
            throw new WriterException(uee);
        }
    }

    static void appendKanjiBytes(String content, BitArray bits) throws WriterException {
        try {
            byte[] bytes = content.getBytes("Shift_JIS");
            int length = bytes.length;
            int i = 0;
            while (i < length) {
                int code = ((bytes[i] & 255) << 8) | (bytes[i + 1] & 255);
                int subtracted = -1;
                if (code >= 33088 && code <= 40956) {
                    subtracted = code - 33088;
                } else if (code >= 57408 && code <= 60351) {
                    subtracted = code - 49472;
                }
                if (subtracted != -1) {
                    bits.appendBits(((subtracted >> 8) * 192) + (subtracted & 255), 13);
                    i += 2;
                } else {
                    throw new WriterException("Invalid byte sequence");
                }
            }
        } catch (Throwable uee) {
            throw new WriterException(uee);
        }
    }

    private static void appendECI(CharacterSetECI eci, BitArray bits) {
        bits.appendBits(Mode.ECI.getBits(), 4);
        bits.appendBits(eci.getValue(), 8);
    }
}
