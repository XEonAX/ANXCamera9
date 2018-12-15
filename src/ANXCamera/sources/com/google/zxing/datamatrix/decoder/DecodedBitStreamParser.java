package com.google.zxing.datamatrix.decoder;

import com.google.zxing.FormatException;
import com.google.zxing.common.BitSource;
import java.io.UnsupportedEncodingException;
import java.util.Collection;

final class DecodedBitStreamParser {
    private static /* synthetic */ int[] $SWITCH_TABLE$com$google$zxing$datamatrix$decoder$DecodedBitStreamParser$Mode;
    private static final char[] C40_BASIC_SET_CHARS = new char[]{'*', '*', '*', ' ', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};
    private static final char[] C40_SHIFT2_SET_CHARS = new char[]{'!', '\"', '#', '$', '%', '&', '\'', '(', ')', '*', '+', ',', '-', '.', '/', ':', ';', '<', '=', '>', '?', '@', '[', '\\', ']', '^', '_'};
    private static final char[] TEXT_BASIC_SET_CHARS = new char[]{'*', '*', '*', ' ', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};
    private static final char[] TEXT_SHIFT3_SET_CHARS = new char[]{'`', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '{', '|', '}', '~', 127};

    private enum Mode {
        PAD_ENCODE,
        ASCII_ENCODE,
        C40_ENCODE,
        TEXT_ENCODE,
        ANSIX12_ENCODE,
        EDIFACT_ENCODE,
        BASE256_ENCODE
    }

    static /* synthetic */ int[] $SWITCH_TABLE$com$google$zxing$datamatrix$decoder$DecodedBitStreamParser$Mode() {
        int[] iArr = $SWITCH_TABLE$com$google$zxing$datamatrix$decoder$DecodedBitStreamParser$Mode;
        if (iArr != null) {
            return iArr;
        }
        iArr = new int[Mode.values().length];
        try {
            iArr[Mode.ANSIX12_ENCODE.ordinal()] = 5;
        } catch (NoSuchFieldError e) {
        }
        try {
            iArr[Mode.ASCII_ENCODE.ordinal()] = 2;
        } catch (NoSuchFieldError e2) {
        }
        try {
            iArr[Mode.BASE256_ENCODE.ordinal()] = 7;
        } catch (NoSuchFieldError e3) {
        }
        try {
            iArr[Mode.C40_ENCODE.ordinal()] = 3;
        } catch (NoSuchFieldError e4) {
        }
        try {
            iArr[Mode.EDIFACT_ENCODE.ordinal()] = 6;
        } catch (NoSuchFieldError e5) {
        }
        try {
            iArr[Mode.PAD_ENCODE.ordinal()] = 1;
        } catch (NoSuchFieldError e6) {
        }
        try {
            iArr[Mode.TEXT_ENCODE.ordinal()] = 4;
        } catch (NoSuchFieldError e7) {
        }
        $SWITCH_TABLE$com$google$zxing$datamatrix$decoder$DecodedBitStreamParser$Mode = iArr;
        return iArr;
    }

    private DecodedBitStreamParser() {
    }

    /* JADX WARNING: Removed duplicated region for block: B:20:0x005b  */
    /* JADX WARNING: Removed duplicated region for block: B:24:0x006d  */
    /* JADX WARNING: Removed duplicated region for block: B:23:0x006b  */
    static com.google.zxing.common.DecoderResult decode(byte[] r9) throws com.google.zxing.FormatException {
        /*
        r0 = new com.google.zxing.common.BitSource;
        r0.<init>(r9);
        r1 = new java.lang.StringBuilder;
        r2 = 100;
        r1.<init>(r2);
        r2 = new java.lang.StringBuilder;
        r3 = 0;
        r2.<init>(r3);
        r3 = new java.util.ArrayList;
        r4 = 1;
        r3.<init>(r4);
        r4 = com.google.zxing.datamatrix.decoder.DecodedBitStreamParser.Mode.ASCII_ENCODE;
    L_0x001a:
        r5 = com.google.zxing.datamatrix.decoder.DecodedBitStreamParser.Mode.ASCII_ENCODE;
        if (r4 != r5) goto L_0x0023;
    L_0x001e:
        r4 = decodeAsciiSegment(r0, r1, r2);
        goto L_0x004b;
    L_0x0023:
        r5 = $SWITCH_TABLE$com$google$zxing$datamatrix$decoder$DecodedBitStreamParser$Mode();
        r6 = r4.ordinal();
        r5 = r5[r6];
        switch(r5) {
            case 3: goto L_0x0045;
            case 4: goto L_0x0041;
            case 5: goto L_0x003d;
            case 6: goto L_0x0039;
            case 7: goto L_0x0035;
            default: goto L_0x0030;
        };
    L_0x0030:
        r5 = com.google.zxing.FormatException.getFormatInstance();
        throw r5;
    L_0x0035:
        decodeBase256Segment(r0, r1, r3);
        goto L_0x0049;
    L_0x0039:
        decodeEdifactSegment(r0, r1);
        goto L_0x0049;
    L_0x003d:
        decodeAnsiX12Segment(r0, r1);
        goto L_0x0049;
    L_0x0041:
        decodeTextSegment(r0, r1);
        goto L_0x0049;
    L_0x0045:
        decodeC40Segment(r0, r1);
    L_0x0049:
        r4 = com.google.zxing.datamatrix.decoder.DecodedBitStreamParser.Mode.ASCII_ENCODE;
    L_0x004b:
        r5 = com.google.zxing.datamatrix.decoder.DecodedBitStreamParser.Mode.PAD_ENCODE;
        if (r4 == r5) goto L_0x0055;
    L_0x004f:
        r5 = r0.available();
        if (r5 > 0) goto L_0x001a;
    L_0x0055:
        r5 = r2.length();
        if (r5 <= 0) goto L_0x005e;
    L_0x005b:
        r1.append(r2);
    L_0x005e:
        r5 = new com.google.zxing.common.DecoderResult;
        r6 = r1.toString();
        r7 = r3.isEmpty();
        r8 = 0;
        if (r7 == 0) goto L_0x006d;
    L_0x006b:
        r7 = r8;
        goto L_0x006e;
    L_0x006d:
        r7 = r3;
    L_0x006e:
        r5.<init>(r9, r6, r7, r8);
        return r5;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.zxing.datamatrix.decoder.DecodedBitStreamParser.decode(byte[]):com.google.zxing.common.DecoderResult");
    }

    private static Mode decodeAsciiSegment(BitSource bits, StringBuilder result, StringBuilder resultTrailer) throws FormatException {
        boolean upperShift = false;
        do {
            int oneByte = bits.readBits(8);
            if (oneByte == 0) {
                throw FormatException.getFormatInstance();
            } else if (oneByte <= 128) {
                if (upperShift) {
                    oneByte += 128;
                }
                result.append((char) (oneByte - 1));
                return Mode.ASCII_ENCODE;
            } else if (oneByte == 129) {
                return Mode.PAD_ENCODE;
            } else {
                if (oneByte <= 229) {
                    int value = oneByte - 130;
                    if (value < 10) {
                        result.append('0');
                    }
                    result.append(value);
                } else if (oneByte == 230) {
                    return Mode.C40_ENCODE;
                } else {
                    if (oneByte == 231) {
                        return Mode.BASE256_ENCODE;
                    }
                    if (oneByte == 232) {
                        result.append(29);
                    } else if (!(oneByte == 233 || oneByte == 234)) {
                        if (oneByte == 235) {
                            upperShift = true;
                        } else if (oneByte == 236) {
                            result.append("[)>\u001e05\u001d");
                            resultTrailer.insert(0, "\u001e\u0004");
                        } else if (oneByte == 237) {
                            result.append("[)>\u001e06\u001d");
                            resultTrailer.insert(0, "\u001e\u0004");
                        } else if (oneByte == 238) {
                            return Mode.ANSIX12_ENCODE;
                        } else {
                            if (oneByte == 239) {
                                return Mode.TEXT_ENCODE;
                            }
                            if (oneByte == 240) {
                                return Mode.EDIFACT_ENCODE;
                            }
                            if (!(oneByte == 241 || oneByte < 242 || (oneByte == 254 && bits.available() == 0))) {
                                throw FormatException.getFormatInstance();
                            }
                        }
                    }
                }
            }
        } while (bits.available() > 0);
        return Mode.ASCII_ENCODE;
    }

    private static void decodeC40Segment(BitSource bits, StringBuilder result) throws FormatException {
        boolean upperShift = false;
        int[] cValues = new int[3];
        int shift = 0;
        while (bits.available() != 8) {
            int firstByte = bits.readBits(8);
            if (firstByte != 254) {
                parseTwoBytes(firstByte, bits.readBits(8), cValues);
                for (int i = 0; i < 3; i++) {
                    int cValue = cValues[i];
                    char c40char;
                    switch (shift) {
                        case 0:
                            if (cValue < 3) {
                                shift = cValue + 1;
                                break;
                            } else if (cValue < C40_BASIC_SET_CHARS.length) {
                                c40char = C40_BASIC_SET_CHARS[cValue];
                                if (!upperShift) {
                                    result.append(c40char);
                                    break;
                                }
                                result.append((char) (c40char + 128));
                                upperShift = false;
                                break;
                            } else {
                                throw FormatException.getFormatInstance();
                            }
                        case 1:
                            if (upperShift) {
                                result.append((char) (cValue + 128));
                                upperShift = false;
                            } else {
                                result.append((char) cValue);
                            }
                            shift = 0;
                            break;
                        case 2:
                            if (cValue < C40_SHIFT2_SET_CHARS.length) {
                                c40char = C40_SHIFT2_SET_CHARS[cValue];
                                if (upperShift) {
                                    result.append((char) (c40char + 128));
                                    upperShift = false;
                                } else {
                                    result.append(c40char);
                                }
                            } else if (cValue == 27) {
                                result.append(29);
                            } else if (cValue == 30) {
                                upperShift = true;
                            } else {
                                throw FormatException.getFormatInstance();
                            }
                            shift = 0;
                            break;
                        case 3:
                            if (upperShift) {
                                result.append((char) (cValue + 224));
                                upperShift = false;
                            } else {
                                result.append((char) (cValue + 96));
                            }
                            shift = 0;
                            break;
                        default:
                            throw FormatException.getFormatInstance();
                    }
                }
                if (bits.available() <= 0) {
                    return;
                }
            }
            return;
        }
    }

    private static void decodeTextSegment(BitSource bits, StringBuilder result) throws FormatException {
        boolean upperShift = false;
        int[] cValues = new int[3];
        int shift = 0;
        while (bits.available() != 8) {
            int firstByte = bits.readBits(8);
            if (firstByte != 254) {
                parseTwoBytes(firstByte, bits.readBits(8), cValues);
                for (int i = 0; i < 3; i++) {
                    int cValue = cValues[i];
                    char textChar;
                    switch (shift) {
                        case 0:
                            if (cValue < 3) {
                                shift = cValue + 1;
                                break;
                            } else if (cValue < TEXT_BASIC_SET_CHARS.length) {
                                textChar = TEXT_BASIC_SET_CHARS[cValue];
                                if (!upperShift) {
                                    result.append(textChar);
                                    break;
                                }
                                result.append((char) (textChar + 128));
                                upperShift = false;
                                break;
                            } else {
                                throw FormatException.getFormatInstance();
                            }
                        case 1:
                            if (upperShift) {
                                result.append((char) (cValue + 128));
                                upperShift = false;
                            } else {
                                result.append((char) cValue);
                            }
                            shift = 0;
                            break;
                        case 2:
                            if (cValue < C40_SHIFT2_SET_CHARS.length) {
                                textChar = C40_SHIFT2_SET_CHARS[cValue];
                                if (upperShift) {
                                    result.append((char) (textChar + 128));
                                    upperShift = false;
                                } else {
                                    result.append(textChar);
                                }
                            } else if (cValue == 27) {
                                result.append(29);
                            } else if (cValue == 30) {
                                upperShift = true;
                            } else {
                                throw FormatException.getFormatInstance();
                            }
                            shift = 0;
                            break;
                        case 3:
                            if (cValue < TEXT_SHIFT3_SET_CHARS.length) {
                                textChar = TEXT_SHIFT3_SET_CHARS[cValue];
                                if (upperShift) {
                                    result.append((char) (textChar + 128));
                                    upperShift = false;
                                } else {
                                    result.append(textChar);
                                }
                                shift = 0;
                                break;
                            }
                            throw FormatException.getFormatInstance();
                        default:
                            throw FormatException.getFormatInstance();
                    }
                }
                if (bits.available() <= 0) {
                    return;
                }
            }
            return;
        }
    }

    private static void decodeAnsiX12Segment(BitSource bits, StringBuilder result) throws FormatException {
        int[] cValues = new int[3];
        while (bits.available() != 8) {
            int firstByte = bits.readBits(8);
            if (firstByte != 254) {
                parseTwoBytes(firstByte, bits.readBits(8), cValues);
                for (int i = 0; i < 3; i++) {
                    int cValue = cValues[i];
                    if (cValue == 0) {
                        result.append(13);
                    } else if (cValue == 1) {
                        result.append('*');
                    } else if (cValue == 2) {
                        result.append('>');
                    } else if (cValue == 3) {
                        result.append(' ');
                    } else if (cValue < 14) {
                        result.append((char) (cValue + 44));
                    } else if (cValue < 40) {
                        result.append((char) (cValue + 51));
                    } else {
                        throw FormatException.getFormatInstance();
                    }
                }
                if (bits.available() <= 0) {
                    return;
                }
            }
            return;
        }
    }

    private static void parseTwoBytes(int firstByte, int secondByte, int[] result) {
        int fullBitValue = ((firstByte << 8) + secondByte) - 1;
        int temp = fullBitValue / 1600;
        result[0] = temp;
        fullBitValue -= temp * 1600;
        temp = fullBitValue / 40;
        result[1] = temp;
        result[2] = fullBitValue - (temp * 40);
    }

    private static void decodeEdifactSegment(BitSource bits, StringBuilder result) {
        while (bits.available() > 16) {
            for (int i = 0; i < 4; i++) {
                int edifactValue = bits.readBits(6);
                if (edifactValue == 31) {
                    int bitsLeft = 8 - bits.getBitOffset();
                    if (bitsLeft != 8) {
                        bits.readBits(bitsLeft);
                    }
                    return;
                }
                if ((edifactValue & 32) == 0) {
                    edifactValue |= 64;
                }
                result.append((char) edifactValue);
            }
            if (bits.available() <= 0) {
                return;
            }
        }
    }

    private static void decodeBase256Segment(BitSource bits, StringBuilder result, Collection<byte[]> byteSegments) throws FormatException {
        int count;
        int d1 = 1 + bits.getByteOffset();
        int codewordPosition = d1 + 1;
        d1 = unrandomize255State(bits.readBits(8), d1);
        if (d1 == 0) {
            count = bits.available() / 8;
        } else if (d1 < 250) {
            count = d1;
        } else {
            count = (250 * (d1 - 249)) + unrandomize255State(bits.readBits(8), codewordPosition);
            codewordPosition++;
        }
        if (count >= 0) {
            byte[] bytes = new byte[count];
            int i = 0;
            while (i < count) {
                if (bits.available() >= 8) {
                    int codewordPosition2 = codewordPosition + 1;
                    bytes[i] = (byte) unrandomize255State(bits.readBits(8), codewordPosition);
                    i++;
                    codewordPosition = codewordPosition2;
                } else {
                    throw FormatException.getFormatInstance();
                }
            }
            byteSegments.add(bytes);
            try {
                result.append(new String(bytes, "ISO8859_1"));
                return;
            } catch (UnsupportedEncodingException uee) {
                StringBuilder stringBuilder = new StringBuilder("Platform does not support required encoding: ");
                stringBuilder.append(uee);
                throw new IllegalStateException(stringBuilder.toString());
            }
        }
        throw FormatException.getFormatInstance();
    }

    private static int unrandomize255State(int randomizedBase256Codeword, int base256CodewordPosition) {
        int tempVariable = randomizedBase256Codeword - (((149 * base256CodewordPosition) % 255) + 1);
        return tempVariable >= 0 ? tempVariable : tempVariable + 256;
    }
}
