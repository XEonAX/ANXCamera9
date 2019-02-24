package com.google.zxing.qrcode.decoder;

import com.google.zxing.FormatException;
import com.google.zxing.common.BitMatrix;

final class BitMatrixParser {
    private final BitMatrix bitMatrix;
    private boolean mirror;
    private FormatInformation parsedFormatInfo;
    private Version parsedVersion;

    BitMatrixParser(BitMatrix bitMatrix) throws FormatException {
        int dimension = bitMatrix.getHeight();
        if (dimension < 21 || (dimension & 3) != 1) {
            throw FormatException.getFormatInstance();
        }
        this.bitMatrix = bitMatrix;
    }

    FormatInformation readFormatInformation() throws FormatException {
        if (this.parsedFormatInfo != null) {
            return this.parsedFormatInfo;
        }
        int i;
        int j;
        int formatInfoBits1 = 0;
        for (i = 0; i < 6; i++) {
            formatInfoBits1 = copyBit(i, 8, formatInfoBits1);
        }
        formatInfoBits1 = copyBit(8, 7, copyBit(8, 8, copyBit(7, 8, formatInfoBits1)));
        for (i = 5; i >= 0; i--) {
            formatInfoBits1 = copyBit(8, i, formatInfoBits1);
        }
        int dimension = this.bitMatrix.getHeight();
        i = 0;
        int jMin = dimension - 7;
        for (j = dimension - 1; j >= jMin; j--) {
            i = copyBit(8, j, i);
        }
        for (j = dimension - 8; j < dimension; j++) {
            i = copyBit(j, 8, i);
        }
        this.parsedFormatInfo = FormatInformation.decodeFormatInformation(formatInfoBits1, i);
        if (this.parsedFormatInfo != null) {
            return this.parsedFormatInfo;
        }
        throw FormatException.getFormatInstance();
    }

    Version readVersion() throws FormatException {
        if (this.parsedVersion != null) {
            return this.parsedVersion;
        }
        int dimension = this.bitMatrix.getHeight();
        int provisionalVersion = (dimension - 17) / 4;
        if (provisionalVersion <= 6) {
            return Version.getVersionForNumber(provisionalVersion);
        }
        int j;
        int versionBits = 0;
        int ijMin = dimension - 11;
        for (j = 5; j >= 0; j--) {
            for (int i = dimension - 9; i >= ijMin; i--) {
                versionBits = copyBit(i, j, versionBits);
            }
        }
        Version theParsedVersion = Version.decodeVersionInformation(versionBits);
        if (theParsedVersion == null || theParsedVersion.getDimensionForVersion() != dimension) {
            versionBits = 0;
            for (int i2 = 5; i2 >= 0; i2--) {
                for (j = dimension - 9; j >= ijMin; j--) {
                    versionBits = copyBit(i2, j, versionBits);
                }
            }
            Version theParsedVersion2 = Version.decodeVersionInformation(versionBits);
            if (theParsedVersion2 == null || theParsedVersion2.getDimensionForVersion() != dimension) {
                throw FormatException.getFormatInstance();
            }
            this.parsedVersion = theParsedVersion2;
            return theParsedVersion2;
        }
        this.parsedVersion = theParsedVersion;
        return theParsedVersion;
    }

    private int copyBit(int i, int j, int versionBits) {
        return this.mirror ? this.bitMatrix.get(j, i) : this.bitMatrix.get(i, j) ? (versionBits << 1) | 1 : versionBits << 1;
    }

    byte[] readCodewords() throws FormatException {
        BitMatrixParser bitMatrixParser = this;
        FormatInformation formatInfo = readFormatInformation();
        Version version = readVersion();
        DataMask dataMask = DataMask.forReference(formatInfo.getDataMask());
        int dimension = bitMatrixParser.bitMatrix.getHeight();
        dataMask.unmaskBitMatrix(bitMatrixParser.bitMatrix, dimension);
        BitMatrix functionPattern = version.buildFunctionPattern();
        boolean readingUp = true;
        byte[] result = new byte[version.getTotalCodewords()];
        int resultOffset = 0;
        int currentByte = 0;
        int bitsRead = 0;
        int j = dimension - 1;
        while (j > 0) {
            if (j == 6) {
                j--;
            }
            int count = 0;
            while (count < dimension) {
                int i = readingUp ? (dimension - 1) - count : count;
                int col = 0;
                while (col < 2) {
                    if (!functionPattern.get(j - col, i)) {
                        bitsRead++;
                        currentByte <<= 1;
                        if (bitMatrixParser.bitMatrix.get(j - col, i)) {
                            currentByte |= 1;
                        }
                        if (bitsRead == 8) {
                            int resultOffset2 = resultOffset + 1;
                            result[resultOffset] = (byte) currentByte;
                            currentByte = 0;
                            bitsRead = 0;
                            resultOffset = resultOffset2;
                        }
                    }
                    col++;
                    bitMatrixParser = this;
                }
                count++;
            }
            readingUp ^= 1;
            j -= 2;
        }
        if (resultOffset == version.getTotalCodewords()) {
            return result;
        }
        throw FormatException.getFormatInstance();
    }

    void remask() {
        if (this.parsedFormatInfo != null) {
            DataMask.forReference(this.parsedFormatInfo.getDataMask()).unmaskBitMatrix(this.bitMatrix, this.bitMatrix.getHeight());
        }
    }

    void setMirror(boolean mirror) {
        this.parsedVersion = null;
        this.parsedFormatInfo = null;
        this.mirror = mirror;
    }

    void mirror() {
        for (int x = 0; x < this.bitMatrix.getWidth(); x++) {
            for (int y = x + 1; y < this.bitMatrix.getHeight(); y++) {
                if (this.bitMatrix.get(x, y) != this.bitMatrix.get(y, x)) {
                    this.bitMatrix.flip(y, x);
                    this.bitMatrix.flip(x, y);
                }
            }
        }
    }
}
