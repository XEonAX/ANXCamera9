package com.google.zxing.aztec.decoder;

import com.android.camera.constant.CameraScene;
import com.android.camera.constant.LightingConstant;
import com.android.camera.data.data.config.SupportedConfigFactory;
import com.android.gallery3d.exif.ExifInterface.GpsLongitudeRef;
import com.android.gallery3d.exif.ExifInterface.GpsSpeedRef;
import com.android.gallery3d.exif.ExifInterface.GpsStatus;
import com.android.gallery3d.exif.ExifInterface.GpsTrackRef;
import com.google.zxing.FormatException;
import com.google.zxing.aztec.AztecDetectorResult;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.common.DecoderResult;
import com.google.zxing.common.reedsolomon.GenericGF;
import com.google.zxing.common.reedsolomon.ReedSolomonDecoder;
import com.google.zxing.common.reedsolomon.ReedSolomonException;
import java.util.Arrays;
import miui.reflect.Field;

public final class Decoder {
    private static /* synthetic */ int[] $SWITCH_TABLE$com$google$zxing$aztec$decoder$Decoder$Table;
    private static final String[] DIGIT_TABLE = new String[]{"CTRL_PS", " ", "0", "1", "2", "3", "4", "5", "6", LightingConstant.LIGHTING_LEAF, "8", CameraScene.SNOW, ",", ".", "CTRL_UL", "CTRL_US"};
    private static final String[] LOWER_TABLE = new String[]{"CTRL_PS", " ", SupportedConfigFactory.CLOSE_BY_HHT, SupportedConfigFactory.CLOSE_BY_GROUP, SupportedConfigFactory.CLOSE_BY_SUPER_RESOLUTION, SupportedConfigFactory.CLOSE_BY_BURST_SHOOT, SupportedConfigFactory.CLOSE_BY_AI, "f", SupportedConfigFactory.CLOSE_BY_HDR, SupportedConfigFactory.CLOSE_BY_VIDEO, SupportedConfigFactory.CLOSE_BY_ULTRA_WIDE, SupportedConfigFactory.CLOSE_BY_ULTRA_PIXEL, SupportedConfigFactory.CLOSE_BY_FILTER, "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "CTRL_US", "CTRL_ML", "CTRL_DL", "CTRL_BS"};
    private static final String[] MIXED_TABLE = new String[]{"CTRL_PS", " ", "\u0001", "\u0002", "\u0003", "\u0004", "\u0005", "\u0006", "\u0007", "\b", "\t", "\n", "\u000b", "\f", "\r", "\u001b", "\u001c", "\u001d", "\u001e", "\u001f", "@", "\\", "^", "_", "`", "|", "~", "", "CTRL_LL", "CTRL_UL", "CTRL_PL", "CTRL_BS"};
    private static final String[] PUNCT_TABLE = new String[]{"", "\r", "\r\n", ". ", ", ", ": ", "!", "\"", "#", "$", "%", "&", "'", "(", ")", "*", "+", ",", "-", ".", "/", ":", ";", "<", "=", ">", "?", "[", "]", "{", "}", "CTRL_UL"};
    private static final String[] UPPER_TABLE = new String[]{"CTRL_PS", " ", GpsStatus.IN_PROGRESS, Field.BYTE_SIGNATURE_PRIMITIVE, Field.CHAR_SIGNATURE_PRIMITIVE, Field.DOUBLE_SIGNATURE_PRIMITIVE, GpsLongitudeRef.EAST, Field.FLOAT_SIGNATURE_PRIMITIVE, "G", "H", Field.INT_SIGNATURE_PRIMITIVE, Field.LONG_SIGNATURE_PRIMITIVE, GpsSpeedRef.KILOMETERS, "L", "M", "N", "O", "P", "Q", "R", "S", GpsTrackRef.TRUE_DIRECTION, "U", "V", GpsLongitudeRef.WEST, "X", "Y", Field.BOOLEAN_SIGNATURE_PRIMITIVE, "CTRL_LL", "CTRL_ML", "CTRL_DL", "CTRL_BS"};
    private AztecDetectorResult ddata;

    private enum Table {
        UPPER,
        LOWER,
        MIXED,
        DIGIT,
        PUNCT,
        BINARY
    }

    static /* synthetic */ int[] $SWITCH_TABLE$com$google$zxing$aztec$decoder$Decoder$Table() {
        int[] iArr = $SWITCH_TABLE$com$google$zxing$aztec$decoder$Decoder$Table;
        if (iArr != null) {
            return iArr;
        }
        iArr = new int[Table.values().length];
        try {
            iArr[Table.BINARY.ordinal()] = 6;
        } catch (NoSuchFieldError e) {
        }
        try {
            iArr[Table.DIGIT.ordinal()] = 4;
        } catch (NoSuchFieldError e2) {
        }
        try {
            iArr[Table.LOWER.ordinal()] = 2;
        } catch (NoSuchFieldError e3) {
        }
        try {
            iArr[Table.MIXED.ordinal()] = 3;
        } catch (NoSuchFieldError e4) {
        }
        try {
            iArr[Table.PUNCT.ordinal()] = 5;
        } catch (NoSuchFieldError e5) {
        }
        try {
            iArr[Table.UPPER.ordinal()] = 1;
        } catch (NoSuchFieldError e6) {
        }
        $SWITCH_TABLE$com$google$zxing$aztec$decoder$Decoder$Table = iArr;
        return iArr;
    }

    public DecoderResult decode(AztecDetectorResult detectorResult) throws FormatException {
        this.ddata = detectorResult;
        return new DecoderResult(null, getEncodedData(correctBits(extractBits(detectorResult.getBits()))), null, null);
    }

    public static String highLevelDecode(boolean[] correctedBits) {
        return getEncodedData(correctedBits);
    }

    private static String getEncodedData(boolean[] correctedBits) {
        int endIndex = correctedBits.length;
        Table latchTable = Table.UPPER;
        Table shiftTable = Table.UPPER;
        StringBuilder result = new StringBuilder(20);
        int index = 0;
        while (index < endIndex) {
            int size;
            if (shiftTable != Table.BINARY) {
                size = shiftTable == Table.DIGIT ? 4 : 5;
                if (endIndex - index < size) {
                    break;
                }
                int code = readCode(correctedBits, index, size);
                index += size;
                String str = getCharacter(shiftTable, code);
                if (str.startsWith("CTRL_")) {
                    shiftTable = getTable(str.charAt(5));
                    if (str.charAt(6) == 'L') {
                        latchTable = shiftTable;
                    }
                } else {
                    result.append(str);
                    shiftTable = latchTable;
                }
            } else if (endIndex - index < 5) {
                break;
            } else {
                size = readCode(correctedBits, index, 5);
                index += 5;
                if (size == 0) {
                    if (endIndex - index < 11) {
                        break;
                    }
                    size = readCode(correctedBits, index, 11) + 31;
                    index += 11;
                }
                for (int charCount = 0; charCount < size; charCount++) {
                    if (endIndex - index < 8) {
                        index = endIndex;
                        break;
                    }
                    result.append((char) readCode(correctedBits, index, 8));
                    index += 8;
                }
                shiftTable = latchTable;
            }
        }
        return result.toString();
    }

    private static Table getTable(char t) {
        if (t == 'B') {
            return Table.BINARY;
        }
        if (t == 'D') {
            return Table.DIGIT;
        }
        if (t == 'P') {
            return Table.PUNCT;
        }
        switch (t) {
            case 'L':
                return Table.LOWER;
            case 'M':
                return Table.MIXED;
            default:
                return Table.UPPER;
        }
    }

    private static String getCharacter(Table table, int code) {
        switch ($SWITCH_TABLE$com$google$zxing$aztec$decoder$Decoder$Table()[table.ordinal()]) {
            case 1:
                return UPPER_TABLE[code];
            case 2:
                return LOWER_TABLE[code];
            case 3:
                return MIXED_TABLE[code];
            case 4:
                return DIGIT_TABLE[code];
            case 5:
                return PUNCT_TABLE[code];
            default:
                throw new IllegalStateException("Bad table");
        }
    }

    private boolean[] correctBits(boolean[] rawbits) throws FormatException {
        int codewordSize;
        GenericGF gf;
        boolean[] zArr = rawbits;
        if (this.ddata.getNbLayers() <= 2) {
            codewordSize = 6;
            gf = GenericGF.AZTEC_DATA_6;
        } else if (this.ddata.getNbLayers() <= 8) {
            codewordSize = 8;
            gf = GenericGF.AZTEC_DATA_8;
        } else if (this.ddata.getNbLayers() <= 22) {
            codewordSize = 10;
            gf = GenericGF.AZTEC_DATA_10;
        } else {
            codewordSize = 12;
            gf = GenericGF.AZTEC_DATA_12;
        }
        int codewordSize2 = codewordSize;
        int numDataCodewords = this.ddata.getNbDatablocks();
        int numCodewords = zArr.length / codewordSize2;
        if (numCodewords >= numDataCodewords) {
            int numECCodewords = numCodewords - numDataCodewords;
            int[] dataWords = new int[numCodewords];
            int i = 0;
            int offset = zArr.length % codewordSize2;
            while (i < numCodewords) {
                dataWords[i] = readCode(zArr, offset, codewordSize2);
                i++;
                offset += codewordSize2;
            }
            try {
                new ReedSolomonDecoder(gf).decode(dataWords, numECCodewords);
                codewordSize = 1;
                i = (1 << codewordSize2) - 1;
                int stuffedBits = 0;
                int i2 = 0;
                while (i2 < numDataCodewords) {
                    codewordSize = dataWords[i2];
                    if (codewordSize == 0 || codewordSize == i) {
                        throw FormatException.getFormatInstance();
                    }
                    if (codewordSize == 1 || codewordSize == i - 1) {
                        stuffedBits++;
                    }
                    i2++;
                    codewordSize = 1;
                }
                boolean[] correctedBits = new boolean[((numDataCodewords * codewordSize2) - stuffedBits)];
                i2 = 0;
                int i3 = 0;
                while (i3 < numDataCodewords) {
                    int dataWord = dataWords[i3];
                    if (dataWord == codewordSize || dataWord == i - 1) {
                        Arrays.fill(correctedBits, i2, (i2 + codewordSize2) - 1, dataWord > 1);
                        i2 += codewordSize2 - 1;
                    } else {
                        codewordSize = codewordSize2 - 1;
                        while (codewordSize >= 0) {
                            int index = i2 + 1;
                            correctedBits[i2] = (dataWord & (1 << codewordSize)) != 0;
                            codewordSize--;
                            i2 = index;
                        }
                    }
                    i3++;
                    codewordSize = 1;
                }
                return correctedBits;
            } catch (ReedSolomonException e) {
                throw FormatException.getFormatInstance();
            }
        }
        throw FormatException.getFormatInstance();
    }

    boolean[] extractBits(BitMatrix matrix) {
        int i;
        int origCenter;
        BitMatrix bitMatrix = matrix;
        boolean compact = this.ddata.isCompact();
        int layers = this.ddata.getNbLayers();
        int baseMatrixSize = (compact ? 11 : 14) + (layers * 4);
        int[] alignmentMap = new int[baseMatrixSize];
        boolean[] rawbits = new boolean[totalBitsInLayer(layers, compact)];
        int i2 = 2;
        if (compact) {
            for (i = 0; i < alignmentMap.length; i++) {
                alignmentMap[i] = i;
            }
        } else {
            origCenter = baseMatrixSize / 2;
            int center = ((baseMatrixSize + 1) + ((((baseMatrixSize / 2) - 1) / 15) * 2)) / 2;
            int i3 = 0;
            while (i3 < origCenter) {
                i2 = (i3 / 15) + i3;
                alignmentMap[(origCenter - i3) - 1] = (center - i2) - 1;
                alignmentMap[origCenter + i3] = (center + i2) + 1;
                i3++;
                i2 = 2;
            }
        }
        int rowOffset = 0;
        for (int i4 = 0; i4 < layers; i4++) {
            int rowSize = compact ? ((layers - i4) * 4) + 9 : ((layers - i4) * 4) + 12;
            int low = i4 * 2;
            int high = (baseMatrixSize - 1) - low;
            for (i = 0; i < rowSize; i++) {
                int columnOffset = i * 2;
                origCenter = 0;
                while (origCenter < i2) {
                    rawbits[(rowOffset + columnOffset) + origCenter] = bitMatrix.get(alignmentMap[low + origCenter], alignmentMap[low + i]);
                    rawbits[(((i2 * rowSize) + rowOffset) + columnOffset) + origCenter] = bitMatrix.get(alignmentMap[low + i], alignmentMap[high - origCenter]);
                    rawbits[(((4 * rowSize) + rowOffset) + columnOffset) + origCenter] = bitMatrix.get(alignmentMap[high - origCenter], alignmentMap[high - i]);
                    rawbits[(((6 * rowSize) + rowOffset) + columnOffset) + origCenter] = bitMatrix.get(alignmentMap[high - i], alignmentMap[low + origCenter]);
                    origCenter++;
                    i2 = 2;
                }
            }
            rowOffset += rowSize * 8;
        }
        return rawbits;
    }

    private static int readCode(boolean[] rawbits, int startIndex, int length) {
        int res = 0;
        for (int i = startIndex; i < startIndex + length; i++) {
            res <<= 1;
            if (rawbits[i]) {
                res |= 1;
            }
        }
        return res;
    }

    private static int totalBitsInLayer(int layers, boolean compact) {
        return ((compact ? 88 : 112) + (16 * layers)) * layers;
    }
}
