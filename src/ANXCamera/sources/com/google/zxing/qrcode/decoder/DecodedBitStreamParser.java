package com.google.zxing.qrcode.decoder;

import com.google.zxing.DecodeHintType;
import com.google.zxing.FormatException;
import com.google.zxing.common.BitSource;
import com.google.zxing.common.CharacterSetECI;
import com.google.zxing.common.StringUtils;
import java.io.UnsupportedEncodingException;
import java.util.Collection;
import java.util.Map;

final class DecodedBitStreamParser {
    private static final char[] ALPHANUMERIC_CHARS = new char[]{'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', ' ', '$', '%', '*', '+', '-', '.', '/', ':'};
    private static final int GB2312_SUBSET = 1;

    private DecodedBitStreamParser() {
    }

    /* JADX WARNING: Removed duplicated region for block: B:64:0x0107 A:{LOOP_END, LOOP:0: B:1:0x0020->B:64:0x0107} */
    /* JADX WARNING: Removed duplicated region for block: B:70:0x00e4 A:{SYNTHETIC} */
    static com.google.zxing.common.DecoderResult decode(byte[] r17, com.google.zxing.qrcode.decoder.Version r18, com.google.zxing.qrcode.decoder.ErrorCorrectionLevel r19, java.util.Map<com.google.zxing.DecodeHintType, ?> r20) throws com.google.zxing.FormatException {
        /*
        r1 = r18;
        r0 = new com.google.zxing.common.BitSource;
        r9 = r17;
        r0.<init>(r9);
        r10 = r0;
        r0 = new java.lang.StringBuilder;
        r2 = 50;
        r0.<init>(r2);
        r11 = r0;
        r0 = new java.util.ArrayList;
        r8 = 1;
        r0.<init>(r8);
        r12 = r0;
        r0 = -1;
        r2 = -1;
        r3 = 0;
        r4 = 0;
        r13 = r0;
        r14 = r2;
        r0 = r3;
    L_0x0020:
        r15 = r4;
        r2 = r10.available();	 Catch:{ IllegalArgumentException -> 0x010c }
        r3 = 4;
        if (r2 >= r3) goto L_0x002b;
    L_0x0028:
        r2 = com.google.zxing.qrcode.decoder.Mode.TERMINATOR;	 Catch:{ IllegalArgumentException -> 0x010c }
        goto L_0x0033;
    L_0x002b:
        r2 = r10.readBits(r3);	 Catch:{ IllegalArgumentException -> 0x010c }
        r2 = com.google.zxing.qrcode.decoder.Mode.forBits(r2);	 Catch:{ IllegalArgumentException -> 0x010c }
    L_0x0033:
        r7 = r2;
        r2 = com.google.zxing.qrcode.decoder.Mode.TERMINATOR;	 Catch:{ IllegalArgumentException -> 0x010c }
        if (r7 == r2) goto L_0x00dc;
    L_0x0038:
        r2 = com.google.zxing.qrcode.decoder.Mode.FNC1_FIRST_POSITION;	 Catch:{ IllegalArgumentException -> 0x010c }
        if (r7 == r2) goto L_0x00d5;
    L_0x003c:
        r2 = com.google.zxing.qrcode.decoder.Mode.FNC1_SECOND_POSITION;	 Catch:{ IllegalArgumentException -> 0x010c }
        if (r7 != r2) goto L_0x0045;
    L_0x0040:
        r16 = r0;
        r0 = r7;
        goto L_0x00d8;
    L_0x0045:
        r2 = com.google.zxing.qrcode.decoder.Mode.STRUCTURED_APPEND;	 Catch:{ IllegalArgumentException -> 0x010c }
        if (r7 != r2) goto L_0x0068;
    L_0x0049:
        r2 = r10.available();	 Catch:{ IllegalArgumentException -> 0x010c }
        r3 = 16;
        if (r2 < r3) goto L_0x0063;
    L_0x0051:
        r2 = 8;
        r3 = r10.readBits(r2);	 Catch:{ IllegalArgumentException -> 0x010c }
        r13 = r3;
        r2 = r10.readBits(r2);	 Catch:{ IllegalArgumentException -> 0x010c }
        r16 = r0;
        r14 = r2;
    L_0x0060:
        r0 = r7;
        goto L_0x00df;
    L_0x0063:
        r2 = com.google.zxing.FormatException.getFormatInstance();	 Catch:{ IllegalArgumentException -> 0x010c }
        throw r2;	 Catch:{ IllegalArgumentException -> 0x010c }
    L_0x0068:
        r2 = com.google.zxing.qrcode.decoder.Mode.ECI;	 Catch:{ IllegalArgumentException -> 0x010c }
        if (r7 != r2) goto L_0x007f;
    L_0x006c:
        r2 = parseECIValue(r10);	 Catch:{ IllegalArgumentException -> 0x010c }
        r3 = com.google.zxing.common.CharacterSetECI.getCharacterSetECIByValue(r2);	 Catch:{ IllegalArgumentException -> 0x010c }
        r0 = r3;
        if (r0 == 0) goto L_0x007a;
    L_0x0077:
        r16 = r0;
        goto L_0x0060;
    L_0x007a:
        r3 = com.google.zxing.FormatException.getFormatInstance();	 Catch:{ IllegalArgumentException -> 0x010c }
        throw r3;	 Catch:{ IllegalArgumentException -> 0x010c }
    L_0x007f:
        r2 = com.google.zxing.qrcode.decoder.Mode.HANZI;	 Catch:{ IllegalArgumentException -> 0x010c }
        if (r7 != r2) goto L_0x0098;
    L_0x0083:
        r2 = r10.readBits(r3);	 Catch:{ IllegalArgumentException -> 0x010c }
        r3 = r7.getCharacterCountBits(r1);	 Catch:{ IllegalArgumentException -> 0x010c }
        r3 = r10.readBits(r3);	 Catch:{ IllegalArgumentException -> 0x010c }
        if (r2 != r8) goto L_0x0095;
    L_0x0091:
        decodeHanziSegment(r10, r11, r3);	 Catch:{ IllegalArgumentException -> 0x010c }
    L_0x0095:
        r16 = r0;
        goto L_0x0060;
    L_0x0098:
        r2 = r7.getCharacterCountBits(r1);	 Catch:{ IllegalArgumentException -> 0x010c }
        r2 = r10.readBits(r2);	 Catch:{ IllegalArgumentException -> 0x010c }
        r6 = r2;
        r2 = com.google.zxing.qrcode.decoder.Mode.NUMERIC;	 Catch:{ IllegalArgumentException -> 0x010c }
        if (r7 != r2) goto L_0x00a9;
    L_0x00a5:
        decodeNumericSegment(r10, r11, r6);	 Catch:{ IllegalArgumentException -> 0x010c }
        goto L_0x0095;
    L_0x00a9:
        r2 = com.google.zxing.qrcode.decoder.Mode.ALPHANUMERIC;	 Catch:{ IllegalArgumentException -> 0x010c }
        if (r7 != r2) goto L_0x00b1;
    L_0x00ad:
        decodeAlphanumericSegment(r10, r11, r6, r15);	 Catch:{ IllegalArgumentException -> 0x010c }
        goto L_0x0095;
    L_0x00b1:
        r2 = com.google.zxing.qrcode.decoder.Mode.BYTE;	 Catch:{ IllegalArgumentException -> 0x010c }
        if (r7 != r2) goto L_0x00c4;
    L_0x00b5:
        r2 = r10;
        r3 = r11;
        r4 = r6;
        r5 = r0;
        r8 = r6;
        r6 = r12;
        r16 = r0;
        r0 = r7;
        r7 = r20;
        decodeByteSegment(r2, r3, r4, r5, r6, r7);	 Catch:{ IllegalArgumentException -> 0x010c }
        goto L_0x00df;
    L_0x00c4:
        r16 = r0;
        r8 = r6;
        r0 = r7;
        r2 = com.google.zxing.qrcode.decoder.Mode.KANJI;	 Catch:{ IllegalArgumentException -> 0x010c }
        if (r0 != r2) goto L_0x00d0;
    L_0x00cc:
        decodeKanjiSegment(r10, r11, r8);	 Catch:{ IllegalArgumentException -> 0x010c }
        goto L_0x00df;
    L_0x00d0:
        r2 = com.google.zxing.FormatException.getFormatInstance();	 Catch:{ IllegalArgumentException -> 0x010c }
        throw r2;	 Catch:{ IllegalArgumentException -> 0x010c }
    L_0x00d5:
        r16 = r0;
        r0 = r7;
    L_0x00d8:
        r2 = 1;
        r4 = r2;
        goto L_0x00e0;
    L_0x00dc:
        r16 = r0;
        r0 = r7;
    L_0x00df:
        r4 = r15;
    L_0x00e0:
        r2 = com.google.zxing.qrcode.decoder.Mode.TERMINATOR;	 Catch:{ IllegalArgumentException -> 0x010c }
        if (r0 != r2) goto L_0x0107;
        r0 = new com.google.zxing.common.DecoderResult;
        r4 = r11.toString();
        r2 = r12.isEmpty();
        r3 = 0;
        if (r2 == 0) goto L_0x00f4;
    L_0x00f2:
        r5 = r3;
        goto L_0x00f5;
    L_0x00f4:
        r5 = r12;
    L_0x00f5:
        if (r19 != 0) goto L_0x00f9;
    L_0x00f7:
        r6 = r3;
        goto L_0x00fe;
    L_0x00f9:
        r2 = r19.toString();
        r6 = r2;
        r2 = r0;
        r3 = r9;
        r7 = r13;
        r8 = r14;
        r2.<init>(r3, r4, r5, r6, r7, r8);
        return r0;
    L_0x0107:
        r0 = r16;
        r8 = 1;
        goto L_0x0020;
    L_0x010c:
        r0 = move-exception;
        r2 = com.google.zxing.FormatException.getFormatInstance();
        throw r2;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.zxing.qrcode.decoder.DecodedBitStreamParser.decode(byte[], com.google.zxing.qrcode.decoder.Version, com.google.zxing.qrcode.decoder.ErrorCorrectionLevel, java.util.Map):com.google.zxing.common.DecoderResult");
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
