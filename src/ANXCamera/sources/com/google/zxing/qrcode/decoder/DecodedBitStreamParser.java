package com.google.zxing.qrcode.decoder;

import com.google.zxing.DecodeHintType;
import com.google.zxing.FormatException;
import com.google.zxing.common.BitSource;
import com.google.zxing.common.CharacterSetECI;
import com.google.zxing.common.DecoderResult;
import com.google.zxing.common.StringUtils;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

final class DecodedBitStreamParser {
    private static final char[] ALPHANUMERIC_CHARS = new char[]{'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', ' ', '$', '%', '*', '+', '-', '.', '/', ':'};
    private static final int GB2312_SUBSET = 1;

    private DecodedBitStreamParser() {
    }

    /* JADX WARNING: Removed duplicated region for block: B:64:0x0107 A:{LOOP_END, LOOP:0: B:1:0x0020->B:64:0x0107} */
    /* JADX WARNING: Removed duplicated region for block: B:70:0x00e4 A:{SYNTHETIC} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    static DecoderResult decode(byte[] bytes, Version version, ErrorCorrectionLevel ecLevel, Map<DecodeHintType, ?> hints) throws FormatException {
        Version version2 = version;
        byte[] bArr = bytes;
        BitSource bits = new BitSource(bArr);
        StringBuilder result = new StringBuilder(50);
        int i = 1;
        Collection byteSegments = new ArrayList(1);
        boolean fc1InEffect = false;
        int symbolSequence = -1;
        int parityData = -1;
        CharacterSetECI currentCharacterSetECI = null;
        while (true) {
            boolean fc1InEffect2 = fc1InEffect;
            try {
                Enum mode;
                Mode mode2;
                if (bits.available() < 4) {
                    mode = Mode.TERMINATOR;
                } else {
                    mode = Mode.forBits(bits.readBits(4));
                }
                Enum mode3 = mode;
                CharacterSetECI currentCharacterSetECI2;
                if (mode3 != Mode.TERMINATOR) {
                    if (mode3 == Mode.FNC1_FIRST_POSITION) {
                        currentCharacterSetECI2 = currentCharacterSetECI;
                        mode2 = mode3;
                    } else if (mode3 == Mode.FNC1_SECOND_POSITION) {
                        currentCharacterSetECI2 = currentCharacterSetECI;
                        mode2 = mode3;
                    } else {
                        if (mode3 == Mode.STRUCTURED_APPEND) {
                            if (bits.available() >= 16) {
                                symbolSequence = bits.readBits(8);
                                currentCharacterSetECI2 = currentCharacterSetECI;
                                parityData = bits.readBits(8);
                            } else {
                                throw FormatException.getFormatInstance();
                            }
                        } else if (mode3 == Mode.ECI) {
                            currentCharacterSetECI = CharacterSetECI.getCharacterSetECIByValue(parseECIValue(bits));
                            if (currentCharacterSetECI != null) {
                                currentCharacterSetECI2 = currentCharacterSetECI;
                            } else {
                                throw FormatException.getFormatInstance();
                            }
                        } else {
                            if (mode3 == Mode.HANZI) {
                                int subset = bits.readBits(4);
                                int countHanzi = bits.readBits(mode3.getCharacterCountBits(version2));
                                if (subset == i) {
                                    decodeHanziSegment(bits, result, countHanzi);
                                }
                            } else {
                                int count = bits.readBits(mode3.getCharacterCountBits(version2));
                                if (mode3 == Mode.NUMERIC) {
                                    decodeNumericSegment(bits, result, count);
                                } else if (mode3 == Mode.ALPHANUMERIC) {
                                    decodeAlphanumericSegment(bits, result, count, fc1InEffect2);
                                } else if (mode3 == Mode.BYTE) {
                                    currentCharacterSetECI2 = currentCharacterSetECI;
                                    mode2 = mode3;
                                    decodeByteSegment(bits, result, count, currentCharacterSetECI, byteSegments, hints);
                                } else {
                                    currentCharacterSetECI2 = currentCharacterSetECI;
                                    i = count;
                                    mode2 = mode3;
                                    if (mode2 == Mode.KANJI) {
                                        decodeKanjiSegment(bits, result, i);
                                    } else {
                                        throw FormatException.getFormatInstance();
                                    }
                                }
                            }
                            currentCharacterSetECI2 = currentCharacterSetECI;
                        }
                        mode2 = mode3;
                    }
                    fc1InEffect = true;
                    if (mode2 != Mode.TERMINATOR) {
                        String str;
                        String stringBuilder = result.toString();
                        List list = byteSegments.isEmpty() ? null : byteSegments;
                        if (ecLevel == null) {
                            str = null;
                        } else {
                            str = ecLevel.toString();
                        }
                        return new DecoderResult(bArr, stringBuilder, list, str, symbolSequence, parityData);
                    }
                    currentCharacterSetECI = currentCharacterSetECI2;
                    i = 1;
                } else {
                    currentCharacterSetECI2 = currentCharacterSetECI;
                    mode2 = mode3;
                }
                fc1InEffect = fc1InEffect2;
                if (mode2 != Mode.TERMINATOR) {
                }
            } catch (IllegalArgumentException e) {
                throw FormatException.getFormatInstance();
            }
        }
    }

    private static void decodeHanziSegment(BitSource bits, StringBuilder result, int count) throws FormatException {
        if (count * 13 <= bits.available()) {
            byte[] buffer = new byte[(2 * count)];
            int offset = 0;
            while (count > 0) {
                int i;
                int twoBytes = bits.readBits(13);
                int assembledTwoBytes = ((twoBytes / 96) << 8) | (twoBytes % 96);
                if (assembledTwoBytes < 959) {
                    i = 41377;
                } else {
                    i = 42657;
                }
                assembledTwoBytes += i;
                buffer[offset] = (byte) ((assembledTwoBytes >> 8) & 255);
                buffer[offset + 1] = (byte) (assembledTwoBytes & 255);
                offset += 2;
                count--;
            }
            try {
                result.append(new String(buffer, StringUtils.GB2312));
                return;
            } catch (UnsupportedEncodingException e) {
                throw FormatException.getFormatInstance();
            }
        }
        throw FormatException.getFormatInstance();
    }

    private static void decodeKanjiSegment(BitSource bits, StringBuilder result, int count) throws FormatException {
        if (count * 13 <= bits.available()) {
            byte[] buffer = new byte[(2 * count)];
            int offset = 0;
            while (count > 0) {
                int i;
                int twoBytes = bits.readBits(13);
                int assembledTwoBytes = ((twoBytes / 192) << 8) | (twoBytes % 192);
                if (assembledTwoBytes < 7936) {
                    i = 33088;
                } else {
                    i = 49472;
                }
                assembledTwoBytes += i;
                buffer[offset] = (byte) (assembledTwoBytes >> 8);
                buffer[offset + 1] = (byte) assembledTwoBytes;
                offset += 2;
                count--;
            }
            try {
                result.append(new String(buffer, StringUtils.SHIFT_JIS));
                return;
            } catch (UnsupportedEncodingException e) {
                throw FormatException.getFormatInstance();
            }
        }
        throw FormatException.getFormatInstance();
    }

    private static void decodeByteSegment(BitSource bits, StringBuilder result, int count, CharacterSetECI currentCharacterSetECI, Collection<byte[]> byteSegments, Map<DecodeHintType, ?> hints) throws FormatException {
        if (8 * count <= bits.available()) {
            String encoding;
            byte[] readBytes = new byte[count];
            for (int i = 0; i < count; i++) {
                readBytes[i] = (byte) bits.readBits(8);
            }
            if (currentCharacterSetECI == null) {
                encoding = StringUtils.guessEncoding(readBytes, hints);
            } else {
                encoding = currentCharacterSetECI.name();
            }
            try {
                result.append(new String(readBytes, encoding));
                byteSegments.add(readBytes);
                return;
            } catch (UnsupportedEncodingException e) {
                throw FormatException.getFormatInstance();
            }
        }
        throw FormatException.getFormatInstance();
    }

    private static char toAlphaNumericChar(int value) throws FormatException {
        if (value < ALPHANUMERIC_CHARS.length) {
            return ALPHANUMERIC_CHARS[value];
        }
        throw FormatException.getFormatInstance();
    }

    private static void decodeAlphanumericSegment(BitSource bits, StringBuilder result, int count, boolean fc1InEffect) throws FormatException {
        int start = result.length();
        while (count > 1) {
            if (bits.available() >= 11) {
                int nextTwoCharsBits = bits.readBits(11);
                result.append(toAlphaNumericChar(nextTwoCharsBits / 45));
                result.append(toAlphaNumericChar(nextTwoCharsBits % 45));
                count -= 2;
            } else {
                throw FormatException.getFormatInstance();
            }
        }
        if (count == 1) {
            if (bits.available() >= 6) {
                result.append(toAlphaNumericChar(bits.readBits(6)));
            } else {
                throw FormatException.getFormatInstance();
            }
        }
        if (fc1InEffect) {
            int i = start;
            while (i < result.length()) {
                if (result.charAt(i) == '%') {
                    if (i >= result.length() - 1 || result.charAt(i + 1) != '%') {
                        result.setCharAt(i, 29);
                    } else {
                        result.deleteCharAt(i + 1);
                    }
                }
                i++;
            }
        }
    }

    private static void decodeNumericSegment(BitSource bits, StringBuilder result, int count) throws FormatException {
        int threeDigitsBits;
        while (count >= 3) {
            if (bits.available() >= 10) {
                threeDigitsBits = bits.readBits(10);
                if (threeDigitsBits < 1000) {
                    result.append(toAlphaNumericChar(threeDigitsBits / 100));
                    result.append(toAlphaNumericChar((threeDigitsBits / 10) % 10));
                    result.append(toAlphaNumericChar(threeDigitsBits % 10));
                    count -= 3;
                } else {
                    throw FormatException.getFormatInstance();
                }
            }
            throw FormatException.getFormatInstance();
        }
        if (count == 2) {
            if (bits.available() >= 7) {
                threeDigitsBits = bits.readBits(7);
                if (threeDigitsBits < 100) {
                    result.append(toAlphaNumericChar(threeDigitsBits / 10));
                    result.append(toAlphaNumericChar(threeDigitsBits % 10));
                    return;
                }
                throw FormatException.getFormatInstance();
            }
            throw FormatException.getFormatInstance();
        } else if (count != 1) {
        } else {
            if (bits.available() >= 4) {
                threeDigitsBits = bits.readBits(4);
                if (threeDigitsBits < 10) {
                    result.append(toAlphaNumericChar(threeDigitsBits));
                    return;
                }
                throw FormatException.getFormatInstance();
            }
            throw FormatException.getFormatInstance();
        }
    }

    private static int parseECIValue(BitSource bits) throws FormatException {
        int firstByte = bits.readBits(8);
        if ((firstByte & 128) == 0) {
            return firstByte & 127;
        }
        if ((firstByte & 192) == 128) {
            return ((firstByte & 63) << 8) | bits.readBits(8);
        } else if ((firstByte & 224) == 192) {
            return ((firstByte & 31) << 16) | bits.readBits(16);
        } else {
            throw FormatException.getFormatInstance();
        }
    }
}
