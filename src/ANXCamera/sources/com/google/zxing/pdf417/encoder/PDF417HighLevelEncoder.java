package com.google.zxing.pdf417.encoder;

import com.google.zxing.WriterException;
import com.google.zxing.common.CharacterSetECI;
import java.math.BigInteger;
import java.nio.charset.Charset;
import java.util.Arrays;

final class PDF417HighLevelEncoder {
    private static final int BYTE_COMPACTION = 1;
    private static final Charset DEFAULT_ENCODING = Charset.forName("ISO-8859-1");
    private static final int ECI_CHARSET = 927;
    private static final int ECI_GENERAL_PURPOSE = 926;
    private static final int ECI_USER_DEFINED = 925;
    private static final int LATCH_TO_BYTE = 924;
    private static final int LATCH_TO_BYTE_PADDED = 901;
    private static final int LATCH_TO_NUMERIC = 902;
    private static final int LATCH_TO_TEXT = 900;
    private static final byte[] MIXED = new byte[128];
    private static final int NUMERIC_COMPACTION = 2;
    private static final byte[] PUNCTUATION = new byte[128];
    private static final int SHIFT_TO_BYTE = 913;
    private static final int SUBMODE_ALPHA = 0;
    private static final int SUBMODE_LOWER = 1;
    private static final int SUBMODE_MIXED = 2;
    private static final int SUBMODE_PUNCTUATION = 3;
    private static final int TEXT_COMPACTION = 0;
    private static final byte[] TEXT_MIXED_RAW;
    private static final byte[] TEXT_PUNCTUATION_RAW;

    static {
        byte i;
        byte b;
        r1 = new byte[30];
        TEXT_MIXED_RAW = r1;
        byte[] bArr = new byte[30];
        bArr[0] = (byte) 59;
        bArr[1] = (byte) 60;
        bArr[2] = (byte) 62;
        bArr[3] = (byte) 64;
        bArr[4] = (byte) 91;
        bArr[5] = (byte) 92;
        bArr[6] = (byte) 93;
        bArr[7] = (byte) 95;
        bArr[8] = (byte) 96;
        bArr[9] = (byte) 126;
        bArr[10] = (byte) 33;
        bArr[11] = (byte) 13;
        bArr[12] = (byte) 9;
        bArr[13] = (byte) 44;
        bArr[14] = (byte) 58;
        bArr[15] = (byte) 10;
        bArr[16] = (byte) 45;
        bArr[17] = (byte) 46;
        bArr[18] = (byte) 36;
        bArr[19] = (byte) 47;
        bArr[20] = (byte) 34;
        bArr[21] = (byte) 124;
        bArr[22] = (byte) 42;
        bArr[23] = (byte) 40;
        bArr[24] = (byte) 41;
        bArr[25] = (byte) 63;
        bArr[26] = (byte) 123;
        bArr[27] = (byte) 125;
        bArr[28] = (byte) 39;
        TEXT_PUNCTUATION_RAW = bArr;
        Arrays.fill(MIXED, (byte) -1);
        for (i = (byte) 0; i < TEXT_MIXED_RAW.length; i = (byte) (i + 1)) {
            b = TEXT_MIXED_RAW[i];
            if (b > (byte) 0) {
                MIXED[b] = i;
            }
        }
        Arrays.fill(PUNCTUATION, (byte) -1);
        for (i = (byte) 0; i < TEXT_PUNCTUATION_RAW.length; i = (byte) (i + 1)) {
            b = TEXT_PUNCTUATION_RAW[i];
            if (b > (byte) 0) {
                PUNCTUATION[b] = i;
            }
        }
    }

    private PDF417HighLevelEncoder() {
    }

    static String encodeHighLevel(String msg, Compaction compaction, Charset encoding) throws WriterException {
        StringBuilder sb = new StringBuilder(msg.length());
        if (encoding == null) {
            encoding = DEFAULT_ENCODING;
        } else if (!DEFAULT_ENCODING.equals(encoding)) {
            CharacterSetECI eci = CharacterSetECI.getCharacterSetECIByName(encoding.name());
            if (eci != null) {
                encodingECI(eci.getValue(), sb);
            }
        }
        int len = msg.length();
        int p = 0;
        int textSubMode = 0;
        byte[] bytes = null;
        if (compaction == Compaction.TEXT) {
            encodeText(msg, 0, len, sb, 0);
        } else if (compaction == Compaction.BYTE) {
            bytes = msg.getBytes(encoding);
            encodeBinary(bytes, 0, bytes.length, 1, sb);
        } else if (compaction == Compaction.NUMERIC) {
            sb.append(902);
            encodeNumeric(msg, 0, len, sb);
        } else {
            int encodingMode = 0;
            while (p < len) {
                int n = determineConsecutiveDigitCount(msg, p);
                if (n >= 13) {
                    sb.append(902);
                    encodingMode = 2;
                    textSubMode = 0;
                    encodeNumeric(msg, p, n, sb);
                    p += n;
                } else {
                    int t = determineConsecutiveTextCount(msg, p);
                    if (t >= 5 || n == len) {
                        if (encodingMode != 0) {
                            sb.append(900);
                            encodingMode = 0;
                            textSubMode = 0;
                        }
                        textSubMode = encodeText(msg, p, t, sb, textSubMode);
                        p += t;
                    } else {
                        if (bytes == null) {
                            bytes = msg.getBytes(encoding);
                        }
                        int b = determineConsecutiveBinaryCount(msg, bytes, p);
                        if (b == 0) {
                            b = 1;
                        }
                        if (b == 1 && encodingMode == 0) {
                            encodeBinary(bytes, p, 1, 0, sb);
                        } else {
                            encodeBinary(bytes, p, b, encodingMode, sb);
                            encodingMode = 1;
                            textSubMode = 0;
                        }
                        p += b;
                    }
                }
            }
        }
        return sb.toString();
    }

    /* Code decompiled incorrectly, please refer to instructions dump. */
    private static int encodeText(CharSequence msg, int startpos, int count, StringBuilder sb, int initialSubmode) {
        CharSequence charSequence = msg;
        int i = count;
        StringBuilder stringBuilder = sb;
        StringBuilder tmp = new StringBuilder(i);
        int submode = initialSubmode;
        int idx = 0;
        while (true) {
            char ch = charSequence.charAt(startpos + idx);
            switch (submode) {
                case 0:
                    if (isAlphaUpper(ch)) {
                        if (ch == ' ') {
                            tmp.append(26);
                        } else {
                            tmp.append((char) (ch - 65));
                        }
                    } else if (isAlphaLower(ch)) {
                        submode = 1;
                        tmp.append(27);
                        break;
                    } else if (isMixed(ch)) {
                        submode = 2;
                        tmp.append(28);
                        break;
                    } else {
                        tmp.append(29);
                        tmp.append((char) PUNCTUATION[ch]);
                    }
                case 1:
                    if (isAlphaLower(ch)) {
                        if (ch == ' ') {
                            tmp.append(26);
                        } else {
                            tmp.append((char) (ch - 97));
                        }
                    } else if (isAlphaUpper(ch)) {
                        tmp.append(27);
                        tmp.append((char) (ch - 65));
                    } else if (isMixed(ch)) {
                        submode = 2;
                        tmp.append(28);
                        break;
                    } else {
                        tmp.append(29);
                        tmp.append((char) PUNCTUATION[ch]);
                    }
                case 2:
                    if (!isMixed(ch)) {
                        if (!isAlphaUpper(ch)) {
                            if (!isAlphaLower(ch)) {
                                if ((startpos + idx) + 1 < i && isPunctuation(charSequence.charAt((startpos + idx) + 1))) {
                                    submode = 3;
                                    tmp.append(25);
                                    break;
                                }
                                tmp.append(29);
                                tmp.append((char) PUNCTUATION[ch]);
                            } else {
                                submode = 1;
                                tmp.append(27);
                                break;
                            }
                        }
                        submode = 0;
                        tmp.append(28);
                        break;
                    }
                    tmp.append((char) MIXED[ch]);
                    break;
                default:
                    if (!isPunctuation(ch)) {
                        submode = 0;
                        tmp.append(29);
                        break;
                    }
                    tmp.append((char) PUNCTUATION[ch]);
                    idx++;
                    if (idx < i) {
                        break;
                    }
                    ch = 0;
                    int len = tmp.length();
                    for (int i2 = 0; i2 < len; i2++) {
                        if (i2 % 2 != 0) {
                            ch = (char) ((ch * 30) + tmp.charAt(i2));
                            stringBuilder.append(ch);
                        } else {
                            ch = tmp.charAt(i2);
                        }
                    }
                    if (len % 2 != 0) {
                        stringBuilder.append((char) ((ch * 30) + 29));
                    }
                    return submode;
            }
        }
    }

    private static void encodeBinary(byte[] bytes, int startpos, int count, int startmode, StringBuilder sb) {
        int idx;
        int i = count;
        StringBuilder stringBuilder = sb;
        int i2 = 1;
        if (i == 1 && startmode == 0) {
            stringBuilder.append(913);
        } else {
            if (i % 6 == 0) {
                stringBuilder.append(924);
            } else {
                stringBuilder.append(901);
            }
        }
        int idx2 = startpos;
        if (i >= 6) {
            char[] chars = new char[5];
            idx = idx2;
            while ((startpos + i) - idx >= 6) {
                long t = 0;
                idx2 = 0;
                while (idx2 < 6) {
                    t = ((long) (bytes[idx + idx2] & 255)) + (t << 8);
                    idx2++;
                    i2 = 1;
                }
                idx2 = 0;
                while (idx2 < 5) {
                    chars[idx2] = (char) ((int) (t % 900));
                    t /= 900;
                    idx2++;
                    i2 = 1;
                }
                for (idx2 = chars.length - i2; idx2 >= 0; idx2--) {
                    stringBuilder.append(chars[idx2]);
                }
                idx += 6;
            }
        } else {
            idx = idx2;
        }
        for (i2 = idx; i2 < startpos + i; i2++) {
            stringBuilder.append((char) (bytes[i2] & 255));
        }
    }

    private static void encodeNumeric(String msg, int startpos, int count, StringBuilder sb) {
        int idx = 0;
        StringBuilder tmp = new StringBuilder((count / 3) + 1);
        BigInteger num900 = BigInteger.valueOf(LATCH_TO_TEXT);
        BigInteger num0 = BigInteger.valueOf(null);
        while (idx < count - 1) {
            tmp.setLength(0);
            int len = Math.min(44, count - idx);
            String part = new StringBuilder(String.valueOf('1'));
            part.append(msg.substring(startpos + idx, (startpos + idx) + len));
            BigInteger bigint = new BigInteger(part.toString());
            do {
                tmp.append((char) bigint.mod(num900).intValue());
                bigint = bigint.divide(num900);
            } while (!bigint.equals(num0));
            for (int i = tmp.length() - 1; i >= 0; i--) {
                sb.append(tmp.charAt(i));
            }
            idx += len;
        }
    }

    private static boolean isDigit(char ch) {
        return ch >= '0' && ch <= '9';
    }

    private static boolean isAlphaUpper(char ch) {
        return ch == ' ' || (ch >= 'A' && ch <= 'Z');
    }

    private static boolean isAlphaLower(char ch) {
        return ch == ' ' || (ch >= 'a' && ch <= 'z');
    }

    private static boolean isMixed(char ch) {
        return MIXED[ch] != (byte) -1;
    }

    private static boolean isPunctuation(char ch) {
        return PUNCTUATION[ch] != (byte) -1;
    }

    private static boolean isText(char ch) {
        return ch == 9 || ch == 10 || ch == 13 || (ch >= ' ' && ch <= '~');
    }

    private static int determineConsecutiveDigitCount(CharSequence msg, int startpos) {
        int count = 0;
        int len = msg.length();
        int idx = startpos;
        if (idx < len) {
            char ch = msg.charAt(idx);
            while (isDigit(ch) && idx < len) {
                count++;
                idx++;
                if (idx < len) {
                    ch = msg.charAt(idx);
                }
            }
        }
        return count;
    }

    private static int determineConsecutiveTextCount(CharSequence msg, int startpos) {
        int len = msg.length();
        int idx = startpos;
        while (idx < len) {
            char ch = msg.charAt(idx);
            int numericCount = 0;
            while (numericCount < 13 && isDigit(ch) && idx < len) {
                numericCount++;
                idx++;
                if (idx < len) {
                    ch = msg.charAt(idx);
                }
            }
            if (numericCount >= 13) {
                return (idx - startpos) - numericCount;
            }
            if (numericCount <= 0) {
                if (!isText(msg.charAt(idx))) {
                    break;
                }
                idx++;
            }
        }
        return idx - startpos;
    }

    private static int determineConsecutiveBinaryCount(CharSequence msg, byte[] bytes, int startpos) throws WriterException {
        int len = msg.length();
        int idx = startpos;
        while (idx < len) {
            char ch = msg.charAt(idx);
            int numericCount = 0;
            while (numericCount < 13 && isDigit(ch)) {
                numericCount++;
                int i = idx + numericCount;
                if (i >= len) {
                    break;
                }
                ch = msg.charAt(i);
            }
            if (numericCount >= 13) {
                return idx - startpos;
            }
            ch = msg.charAt(idx);
            if (bytes[idx] != (byte) 63 || ch == '?') {
                idx++;
            } else {
                StringBuilder stringBuilder = new StringBuilder("Non-encodable character detected: ");
                stringBuilder.append(ch);
                stringBuilder.append(" (Unicode: ");
                stringBuilder.append(ch);
                stringBuilder.append(')');
                throw new WriterException(stringBuilder.toString());
            }
        }
        return idx - startpos;
    }

    private static void encodingECI(int eci, StringBuilder sb) throws WriterException {
        if (eci >= 0 && eci < LATCH_TO_TEXT) {
            sb.append(927);
            sb.append((char) eci);
        } else if (eci < 810900) {
            sb.append(926);
            sb.append((char) ((eci / LATCH_TO_TEXT) - 1));
            sb.append((char) (eci % LATCH_TO_TEXT));
        } else if (eci < 811800) {
            sb.append(925);
            sb.append((char) (810900 - eci));
        } else {
            StringBuilder stringBuilder = new StringBuilder("ECI number not in valid range from 0..811799, but was ");
            stringBuilder.append(eci);
            throw new WriterException(stringBuilder.toString());
        }
    }
}
