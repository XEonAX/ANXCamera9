package com.google.zxing.pdf417.decoder;

import com.google.zxing.FormatException;
import com.google.zxing.pdf417.PDF417ResultMetadata;
import java.math.BigInteger;
import java.nio.charset.Charset;
import java.util.Arrays;

final class DecodedBitStreamParser {
    private static /* synthetic */ int[] $SWITCH_TABLE$com$google$zxing$pdf417$decoder$DecodedBitStreamParser$Mode = null;
    private static final int AL = 28;
    private static final int AS = 27;
    private static final int BEGIN_MACRO_PDF417_CONTROL_BLOCK = 928;
    private static final int BEGIN_MACRO_PDF417_OPTIONAL_FIELD = 923;
    private static final int BYTE_COMPACTION_MODE_LATCH = 901;
    private static final int BYTE_COMPACTION_MODE_LATCH_6 = 924;
    private static final Charset DEFAULT_ENCODING = Charset.forName("ISO-8859-1");
    private static final int ECI_CHARSET = 927;
    private static final int ECI_GENERAL_PURPOSE = 926;
    private static final int ECI_USER_DEFINED = 925;
    private static final BigInteger[] EXP900 = new BigInteger[16];
    private static final int LL = 27;
    private static final int MACRO_PDF417_TERMINATOR = 922;
    private static final int MAX_NUMERIC_CODEWORDS = 15;
    private static final char[] MIXED_CHARS = new char[]{'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '&', 13, 9, ',', ':', '#', '-', '.', '$', '/', '+', '%', '*', '=', '^'};
    private static final int ML = 28;
    private static final int MODE_SHIFT_TO_BYTE_COMPACTION_MODE = 913;
    private static final int NUMBER_OF_SEQUENCE_CODEWORDS = 2;
    private static final int NUMERIC_COMPACTION_MODE_LATCH = 902;
    private static final int PAL = 29;
    private static final int PL = 25;
    private static final int PS = 29;
    private static final char[] PUNCT_CHARS = new char[]{';', '<', '>', '@', '[', '\\', ']', '_', '`', '~', '!', 13, 9, ',', ':', 10, '-', '.', '$', '/', '\"', '|', '*', '(', ')', '?', '{', '}', '\''};
    private static final int TEXT_COMPACTION_MODE_LATCH = 900;

    private enum Mode {
        ALPHA,
        LOWER,
        MIXED,
        PUNCT,
        ALPHA_SHIFT,
        PUNCT_SHIFT
    }

    static /* synthetic */ int[] $SWITCH_TABLE$com$google$zxing$pdf417$decoder$DecodedBitStreamParser$Mode() {
        int[] iArr = $SWITCH_TABLE$com$google$zxing$pdf417$decoder$DecodedBitStreamParser$Mode;
        if (iArr != null) {
            return iArr;
        }
        iArr = new int[Mode.values().length];
        try {
            iArr[Mode.ALPHA.ordinal()] = 1;
        } catch (NoSuchFieldError e) {
        }
        try {
            iArr[Mode.ALPHA_SHIFT.ordinal()] = 5;
        } catch (NoSuchFieldError e2) {
        }
        try {
            iArr[Mode.LOWER.ordinal()] = 2;
        } catch (NoSuchFieldError e3) {
        }
        try {
            iArr[Mode.MIXED.ordinal()] = 3;
        } catch (NoSuchFieldError e4) {
        }
        try {
            iArr[Mode.PUNCT.ordinal()] = 4;
        } catch (NoSuchFieldError e5) {
        }
        try {
            iArr[Mode.PUNCT_SHIFT.ordinal()] = 6;
        } catch (NoSuchFieldError e6) {
        }
        $SWITCH_TABLE$com$google$zxing$pdf417$decoder$DecodedBitStreamParser$Mode = iArr;
        return iArr;
    }

    static {
        EXP900[0] = BigInteger.ONE;
        BigInteger nineHundred = BigInteger.valueOf(TEXT_COMPACTION_MODE_LATCH);
        EXP900[1] = nineHundred;
        for (int i = 2; i < EXP900.length; i++) {
            EXP900[i] = EXP900[i - 1].multiply(nineHundred);
        }
    }

    private DecodedBitStreamParser() {
    }

    /* JADX WARNING: Missing block: B:21:0x006a, code:
            r3 = byteCompaction(r2, r8, r1, r3, r0);
     */
    static com.google.zxing.common.DecoderResult decode(int[] r8, java.lang.String r9) throws com.google.zxing.FormatException {
        /*
        r0 = new java.lang.StringBuilder;
        r1 = r8.length;
        r1 = r1 * 2;
        r0.<init>(r1);
        r1 = DEFAULT_ENCODING;
        r2 = 1;
        r3 = r2 + 1;
        r2 = r8[r2];
        r4 = new com.google.zxing.pdf417.PDF417ResultMetadata;
        r4.<init>();
    L_0x0014:
        r5 = 0;
        r5 = r8[r5];
        if (r3 < r5) goto L_0x0032;
    L_0x0019:
        r5 = r0.length();
        if (r5 == 0) goto L_0x002d;
    L_0x001f:
        r5 = new com.google.zxing.common.DecoderResult;
        r6 = r0.toString();
        r7 = 0;
        r5.<init>(r7, r6, r7, r9);
        r5.setOther(r4);
        return r5;
    L_0x002d:
        r5 = com.google.zxing.FormatException.getFormatInstance();
        throw r5;
    L_0x0032:
        r5 = 913; // 0x391 float:1.28E-42 double:4.51E-321;
        if (r2 == r5) goto L_0x0074;
    L_0x0036:
        switch(r2) {
            case 900: goto L_0x006f;
            case 901: goto L_0x006a;
            case 902: goto L_0x0065;
            default: goto L_0x0039;
        };
    L_0x0039:
        switch(r2) {
            case 922: goto L_0x0060;
            case 923: goto L_0x0060;
            case 924: goto L_0x006a;
            case 925: goto L_0x005d;
            case 926: goto L_0x005a;
            case 927: goto L_0x0048;
            case 928: goto L_0x0043;
            default: goto L_0x003c;
        };
    L_0x003c:
        r3 = r3 + -1;
        r3 = textCompaction(r8, r3, r0);
        goto L_0x007e;
    L_0x0043:
        r3 = decodeMacroBlock(r8, r3, r4);
        goto L_0x007e;
    L_0x0048:
        r5 = r3 + 1;
        r3 = r8[r3];
        r3 = com.google.zxing.common.CharacterSetECI.getCharacterSetECIByValue(r3);
        r6 = r3.name();
        r1 = java.nio.charset.Charset.forName(r6);
        goto L_0x007d;
    L_0x005a:
        r3 = r3 + 2;
        goto L_0x007e;
    L_0x005d:
        r3 = r3 + 1;
        goto L_0x007e;
    L_0x0060:
        r5 = com.google.zxing.FormatException.getFormatInstance();
        throw r5;
    L_0x0065:
        r3 = numericCompaction(r8, r3, r0);
        goto L_0x007e;
    L_0x006a:
        r3 = byteCompaction(r2, r8, r1, r3, r0);
        goto L_0x007e;
    L_0x006f:
        r3 = textCompaction(r8, r3, r0);
        goto L_0x007e;
    L_0x0074:
        r5 = r3 + 1;
        r3 = r8[r3];
        r3 = (char) r3;
        r0.append(r3);
    L_0x007d:
        r3 = r5;
    L_0x007e:
        r5 = r8.length;
        if (r3 >= r5) goto L_0x0088;
    L_0x0081:
        r5 = r3 + 1;
        r2 = r8[r3];
        r3 = r5;
        goto L_0x0014;
    L_0x0088:
        r5 = com.google.zxing.FormatException.getFormatInstance();
        throw r5;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.zxing.pdf417.decoder.DecodedBitStreamParser.decode(int[], java.lang.String):com.google.zxing.common.DecoderResult");
    }

    private static int decodeMacroBlock(int[] codewords, int codeIndex, PDF417ResultMetadata resultMetadata) throws FormatException {
        if (codeIndex + 2 <= codewords[0]) {
            int[] segmentIndexArray = new int[2];
            int i = 0;
            while (i < 2) {
                segmentIndexArray[i] = codewords[codeIndex];
                i++;
                codeIndex++;
            }
            resultMetadata.setSegmentIndex(Integer.parseInt(decodeBase900toBase10(segmentIndexArray, 2)));
            StringBuilder fileId = new StringBuilder();
            codeIndex = textCompaction(codewords, codeIndex, fileId);
            resultMetadata.setFileId(fileId.toString());
            if (codewords[codeIndex] == BEGIN_MACRO_PDF417_OPTIONAL_FIELD) {
                codeIndex++;
                i = new int[(codewords[0] - codeIndex)];
                int additionalOptionCodeWordsIndex = 0;
                boolean end = false;
                while (codeIndex < codewords[0] && !end) {
                    int codeIndex2 = codeIndex + 1;
                    codeIndex = codewords[codeIndex];
                    if (codeIndex < TEXT_COMPACTION_MODE_LATCH) {
                        int additionalOptionCodeWordsIndex2 = additionalOptionCodeWordsIndex + 1;
                        i[additionalOptionCodeWordsIndex] = codeIndex;
                        codeIndex = codeIndex2;
                        additionalOptionCodeWordsIndex = additionalOptionCodeWordsIndex2;
                    } else if (codeIndex == MACRO_PDF417_TERMINATOR) {
                        resultMetadata.setLastSegment(true);
                        end = true;
                        codeIndex = codeIndex2 + 1;
                    } else {
                        throw FormatException.getFormatInstance();
                    }
                }
                resultMetadata.setOptionalData(Arrays.copyOf(i, additionalOptionCodeWordsIndex));
                return codeIndex;
            } else if (codewords[codeIndex] != MACRO_PDF417_TERMINATOR) {
                return codeIndex;
            } else {
                resultMetadata.setLastSegment(true);
                return codeIndex + 1;
            }
        }
        throw FormatException.getFormatInstance();
    }

    private static int textCompaction(int[] codewords, int codeIndex, StringBuilder result) {
        int[] textCompactionData = new int[((codewords[0] - codeIndex) * 2)];
        int[] byteCompactionData = new int[((codewords[0] - codeIndex) * 2)];
        int index = 0;
        boolean end = false;
        while (codeIndex < codewords[0] && !end) {
            int codeIndex2 = codeIndex + 1;
            codeIndex = codewords[codeIndex];
            if (codeIndex < TEXT_COMPACTION_MODE_LATCH) {
                textCompactionData[index] = codeIndex / 30;
                textCompactionData[index + 1] = codeIndex % 30;
                index += 2;
            } else if (codeIndex != MODE_SHIFT_TO_BYTE_COMPACTION_MODE) {
                if (codeIndex != 928) {
                    switch (codeIndex) {
                        case TEXT_COMPACTION_MODE_LATCH /*900*/:
                            int index2 = index + 1;
                            textCompactionData[index] = TEXT_COMPACTION_MODE_LATCH;
                            codeIndex = codeIndex2;
                            index = index2;
                            continue;
                        case BYTE_COMPACTION_MODE_LATCH /*901*/:
                        case NUMERIC_COMPACTION_MODE_LATCH /*902*/:
                            break;
                        default:
                            switch (codeIndex) {
                                case MACRO_PDF417_TERMINATOR /*922*/:
                                case BEGIN_MACRO_PDF417_OPTIONAL_FIELD /*923*/:
                                case BYTE_COMPACTION_MODE_LATCH_6 /*924*/:
                                    break;
                            }
                            break;
                    }
                }
                codeIndex2--;
                end = true;
            } else {
                textCompactionData[index] = MODE_SHIFT_TO_BYTE_COMPACTION_MODE;
                int codeIndex3 = codeIndex2 + 1;
                byteCompactionData[index] = codewords[codeIndex2];
                index++;
                codeIndex = codeIndex3;
            }
            codeIndex = codeIndex2;
            continue;
        }
        decodeTextCompaction(textCompactionData, byteCompactionData, index, result);
        return codeIndex;
    }

    private static void decodeTextCompaction(int[] textCompactionData, int[] byteCompactionData, int length, StringBuilder result) {
        StringBuilder stringBuilder = result;
        Mode subMode = Mode.ALPHA;
        Mode priorToShiftMode = Mode.ALPHA;
        for (int i = 0; i < length; i++) {
            int subModeCh = textCompactionData[i];
            char ch = 0;
            switch ($SWITCH_TABLE$com$google$zxing$pdf417$decoder$DecodedBitStreamParser$Mode()[subMode.ordinal()]) {
                case 1:
                    if (subModeCh >= 26) {
                        if (subModeCh != 26) {
                            if (subModeCh != 27) {
                                if (subModeCh != 28) {
                                    if (subModeCh != 29) {
                                        if (subModeCh != MODE_SHIFT_TO_BYTE_COMPACTION_MODE) {
                                            if (subModeCh == TEXT_COMPACTION_MODE_LATCH) {
                                                subMode = Mode.ALPHA;
                                                break;
                                            }
                                        }
                                        stringBuilder.append((char) byteCompactionData[i]);
                                        break;
                                    }
                                    priorToShiftMode = subMode;
                                    subMode = Mode.PUNCT_SHIFT;
                                    break;
                                }
                                subMode = Mode.MIXED;
                                break;
                            }
                            subMode = Mode.LOWER;
                            break;
                        }
                        ch = ' ';
                        break;
                    }
                    ch = (char) (65 + subModeCh);
                    break;
                    break;
                case 2:
                    if (subModeCh >= 26) {
                        if (subModeCh != 26) {
                            if (subModeCh != 27) {
                                if (subModeCh != 28) {
                                    if (subModeCh != 29) {
                                        if (subModeCh != MODE_SHIFT_TO_BYTE_COMPACTION_MODE) {
                                            if (subModeCh == TEXT_COMPACTION_MODE_LATCH) {
                                                subMode = Mode.ALPHA;
                                                break;
                                            }
                                        }
                                        stringBuilder.append((char) byteCompactionData[i]);
                                        break;
                                    }
                                    priorToShiftMode = subMode;
                                    subMode = Mode.PUNCT_SHIFT;
                                    break;
                                }
                                subMode = Mode.MIXED;
                                break;
                            }
                            priorToShiftMode = subMode;
                            subMode = Mode.ALPHA_SHIFT;
                            break;
                        }
                        ch = ' ';
                        break;
                    }
                    ch = (char) (97 + subModeCh);
                    break;
                    break;
                case 3:
                    if (subModeCh >= 25) {
                        if (subModeCh != 25) {
                            if (subModeCh != 26) {
                                if (subModeCh != 27) {
                                    if (subModeCh != 28) {
                                        if (subModeCh != 29) {
                                            if (subModeCh != MODE_SHIFT_TO_BYTE_COMPACTION_MODE) {
                                                if (subModeCh == TEXT_COMPACTION_MODE_LATCH) {
                                                    subMode = Mode.ALPHA;
                                                    break;
                                                }
                                            }
                                            stringBuilder.append((char) byteCompactionData[i]);
                                            break;
                                        }
                                        priorToShiftMode = subMode;
                                        subMode = Mode.PUNCT_SHIFT;
                                        break;
                                    }
                                    subMode = Mode.ALPHA;
                                    break;
                                }
                                subMode = Mode.LOWER;
                                break;
                            }
                            ch = ' ';
                            break;
                        }
                        subMode = Mode.PUNCT;
                        break;
                    }
                    ch = MIXED_CHARS[subModeCh];
                    break;
                    break;
                case 4:
                    if (subModeCh >= 29) {
                        if (subModeCh != 29) {
                            if (subModeCh != MODE_SHIFT_TO_BYTE_COMPACTION_MODE) {
                                if (subModeCh == TEXT_COMPACTION_MODE_LATCH) {
                                    subMode = Mode.ALPHA;
                                    break;
                                }
                            }
                            stringBuilder.append((char) byteCompactionData[i]);
                            break;
                        }
                        subMode = Mode.ALPHA;
                        break;
                    }
                    ch = PUNCT_CHARS[subModeCh];
                    break;
                    break;
                case 5:
                    subMode = priorToShiftMode;
                    if (subModeCh >= 26) {
                        if (subModeCh != 26) {
                            if (subModeCh == TEXT_COMPACTION_MODE_LATCH) {
                                subMode = Mode.ALPHA;
                                break;
                            }
                        }
                        ch = ' ';
                        break;
                    }
                    ch = (char) (65 + subModeCh);
                    break;
                    break;
                case 6:
                    subMode = priorToShiftMode;
                    if (subModeCh >= 29) {
                        if (subModeCh != 29) {
                            if (subModeCh != MODE_SHIFT_TO_BYTE_COMPACTION_MODE) {
                                if (subModeCh == TEXT_COMPACTION_MODE_LATCH) {
                                    subMode = Mode.ALPHA;
                                    break;
                                }
                            }
                            stringBuilder.append((char) byteCompactionData[i]);
                            break;
                        }
                        subMode = Mode.ALPHA;
                        break;
                    }
                    ch = PUNCT_CHARS[subModeCh];
                    break;
                    break;
            }
            if (ch != 0) {
                stringBuilder.append(ch);
            }
        }
    }

    /* JADX WARNING: Missing block: B:53:0x00d5, code:
            if (r1 == MACRO_PDF417_TERMINATOR) goto L_0x00de;
     */
    private static int byteCompaction(int r24, int[] r25, java.nio.charset.Charset r26, int r27, java.lang.StringBuilder r28) {
        /*
        r0 = r24;
        r2 = new java.io.ByteArrayOutputStream;
        r2.<init>();
        r5 = 923; // 0x39b float:1.293E-42 double:4.56E-321;
        r6 = 928; // 0x3a0 float:1.3E-42 double:4.585E-321;
        r7 = 902; // 0x386 float:1.264E-42 double:4.456E-321;
        r8 = 900; // 0x384 float:1.261E-42 double:4.447E-321;
        r10 = 924; // 0x39c float:1.295E-42 double:4.565E-321;
        r11 = 0;
        r12 = 6;
        r13 = 901; // 0x385 float:1.263E-42 double:4.45E-321;
        r14 = 900; // 0x384 float:1.261E-42 double:4.447E-321;
        if (r0 != r13) goto L_0x0098;
    L_0x0019:
        r15 = 0;
        r16 = 0;
        r3 = new int[r12];
        r19 = 0;
        r20 = r27 + 1;
        r1 = r25[r27];
        r12 = r1;
        r1 = r20;
    L_0x0027:
        r4 = r25[r11];
        if (r1 >= r4) goto L_0x007e;
    L_0x002b:
        if (r19 == 0) goto L_0x002e;
    L_0x002d:
        goto L_0x007e;
    L_0x002e:
        r4 = r15 + 1;
        r3[r15] = r12;
        r21 = r8 * r16;
        r8 = (long) r12;
        r16 = r21 + r8;
        r8 = r1 + 1;
        r12 = r25[r1];
        if (r12 == r14) goto L_0x0071;
    L_0x003d:
        if (r12 == r13) goto L_0x0071;
    L_0x003f:
        if (r12 == r7) goto L_0x0071;
    L_0x0041:
        if (r12 == r10) goto L_0x0071;
    L_0x0043:
        if (r12 == r6) goto L_0x0071;
    L_0x0045:
        if (r12 == r5) goto L_0x0071;
    L_0x0047:
        r1 = 922; // 0x39a float:1.292E-42 double:4.555E-321;
        if (r12 != r1) goto L_0x004c;
    L_0x004b:
        goto L_0x0071;
    L_0x004c:
        r1 = r4 % 5;
        if (r1 != 0) goto L_0x006e;
    L_0x0050:
        if (r4 <= 0) goto L_0x006e;
    L_0x0052:
        r1 = 0;
    L_0x0053:
        r9 = 6;
        if (r1 < r9) goto L_0x005b;
    L_0x0056:
        r16 = 0;
        r15 = 0;
        r1 = r8;
        goto L_0x007b;
    L_0x005b:
        r9 = 5 - r1;
        r15 = 8;
        r9 = r9 * r15;
        r5 = r16 >> r9;
        r5 = (int) r5;
        r5 = (byte) r5;
        r2.write(r5);
        r1 = r1 + 1;
        r5 = 923; // 0x39b float:1.293E-42 double:4.56E-321;
        r6 = 928; // 0x3a0 float:1.3E-42 double:4.585E-321;
        goto L_0x0053;
    L_0x006e:
        r15 = r4;
        r1 = r8;
        goto L_0x0077;
    L_0x0071:
        r1 = r8 + -1;
        r19 = 1;
        r15 = r4;
    L_0x0077:
        r5 = 923; // 0x39b float:1.293E-42 double:4.56E-321;
        r6 = 928; // 0x3a0 float:1.3E-42 double:4.585E-321;
    L_0x007b:
        r8 = 900; // 0x384 float:1.261E-42 double:4.447E-321;
        goto L_0x0027;
    L_0x007e:
        r4 = r25[r11];
        if (r1 != r4) goto L_0x0089;
    L_0x0082:
        if (r12 >= r14) goto L_0x0089;
    L_0x0084:
        r4 = r15 + 1;
        r3[r15] = r12;
        goto L_0x008a;
    L_0x0089:
        r4 = r15;
    L_0x008a:
        r5 = 0;
    L_0x008b:
        if (r5 < r4) goto L_0x008f;
    L_0x008d:
        goto L_0x0114;
    L_0x008f:
        r6 = r3[r5];
        r6 = (byte) r6;
        r2.write(r6);
        r5 = r5 + 1;
        goto L_0x008b;
    L_0x0098:
        if (r0 != r10) goto L_0x0112;
    L_0x009a:
        r3 = 0;
        r4 = 0;
        r6 = 0;
        r1 = r27;
    L_0x00a0:
        r8 = r25[r11];
        if (r1 >= r8) goto L_0x0114;
    L_0x00a4:
        if (r6 == 0) goto L_0x00a8;
    L_0x00a6:
        goto L_0x0114;
    L_0x00a8:
        r8 = r1 + 1;
        r1 = r25[r1];
        if (r1 >= r14) goto L_0x00c1;
    L_0x00ae:
        r3 = r3 + 1;
        r15 = 900; // 0x384 float:1.261E-42 double:4.447E-321;
        r19 = r15 * r4;
        r11 = (long) r1;
        r19 = r19 + r11;
        r4 = r19;
        r9 = 928; // 0x3a0 float:1.3E-42 double:4.585E-321;
        r11 = 923; // 0x39b float:1.293E-42 double:4.56E-321;
        r12 = 922; // 0x39a float:1.292E-42 double:4.555E-321;
        goto L_0x00e1;
    L_0x00c1:
        r15 = 900; // 0x384 float:1.261E-42 double:4.447E-321;
        if (r1 == r14) goto L_0x00d8;
    L_0x00c5:
        if (r1 == r13) goto L_0x00d8;
    L_0x00c7:
        if (r1 == r7) goto L_0x00d8;
    L_0x00c9:
        if (r1 == r10) goto L_0x00d8;
    L_0x00cb:
        r9 = 928; // 0x3a0 float:1.3E-42 double:4.585E-321;
        if (r1 == r9) goto L_0x00da;
    L_0x00cf:
        r11 = 923; // 0x39b float:1.293E-42 double:4.56E-321;
        if (r1 == r11) goto L_0x00dc;
    L_0x00d3:
        r12 = 922; // 0x39a float:1.292E-42 double:4.555E-321;
        if (r1 != r12) goto L_0x00e1;
    L_0x00d7:
        goto L_0x00de;
    L_0x00d8:
        r9 = 928; // 0x3a0 float:1.3E-42 double:4.585E-321;
    L_0x00da:
        r11 = 923; // 0x39b float:1.293E-42 double:4.56E-321;
    L_0x00dc:
        r12 = 922; // 0x39a float:1.292E-42 double:4.555E-321;
    L_0x00de:
        r8 = r8 + -1;
        r6 = 1;
    L_0x00e1:
        r17 = r3 % 5;
        if (r17 != 0) goto L_0x0109;
    L_0x00e5:
        if (r3 <= 0) goto L_0x0109;
    L_0x00e7:
        r17 = 0;
        r7 = r17;
    L_0x00eb:
        r9 = 6;
        if (r7 < r9) goto L_0x00f5;
    L_0x00ee:
        r4 = 0;
        r3 = 0;
        r1 = r8;
        r7 = 902; // 0x386 float:1.264E-42 double:4.456E-321;
        goto L_0x0110;
    L_0x00f5:
        r17 = 5 - r7;
        r18 = 8;
        r17 = r17 * r18;
        r9 = r4 >> r17;
        r9 = (int) r9;
        r9 = (byte) r9;
        r2.write(r9);
        r7 = r7 + 1;
        r9 = 928; // 0x3a0 float:1.3E-42 double:4.585E-321;
        r10 = 924; // 0x39c float:1.295E-42 double:4.565E-321;
        goto L_0x00eb;
    L_0x0109:
        r18 = 8;
        r1 = r8;
        r7 = 902; // 0x386 float:1.264E-42 double:4.456E-321;
        r10 = 924; // 0x39c float:1.295E-42 double:4.565E-321;
    L_0x0110:
        r11 = 0;
        goto L_0x00a0;
    L_0x0112:
        r1 = r27;
    L_0x0114:
        r3 = new java.lang.String;
        r4 = r2.toByteArray();
        r5 = r26;
        r3.<init>(r4, r5);
        r4 = r28;
        r4.append(r3);
        return r1;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.zxing.pdf417.decoder.DecodedBitStreamParser.byteCompaction(int, int[], java.nio.charset.Charset, int, java.lang.StringBuilder):int");
    }

    private static int numericCompaction(int[] codewords, int codeIndex, StringBuilder result) throws FormatException {
        int count = 0;
        boolean end = false;
        int[] numericCodewords = new int[15];
        while (codeIndex < codewords[0] && !end) {
            int codeIndex2 = codeIndex + 1;
            codeIndex = codewords[codeIndex];
            if (codeIndex2 == codewords[0]) {
                end = true;
            }
            if (codeIndex < TEXT_COMPACTION_MODE_LATCH) {
                numericCodewords[count] = codeIndex;
                count++;
            } else if (codeIndex == TEXT_COMPACTION_MODE_LATCH || codeIndex == BYTE_COMPACTION_MODE_LATCH || codeIndex == BYTE_COMPACTION_MODE_LATCH_6 || codeIndex == 928 || codeIndex == BEGIN_MACRO_PDF417_OPTIONAL_FIELD || codeIndex == MACRO_PDF417_TERMINATOR) {
                codeIndex2--;
                end = true;
            }
            if ((count % 15 == 0 || codeIndex == NUMERIC_COMPACTION_MODE_LATCH || end) && count > 0) {
                result.append(decodeBase900toBase10(numericCodewords, count));
                count = 0;
            }
            codeIndex = codeIndex2;
        }
        return codeIndex;
    }

    private static String decodeBase900toBase10(int[] codewords, int count) throws FormatException {
        int i;
        BigInteger result = BigInteger.ZERO;
        for (i = 0; i < count; i++) {
            result = result.add(EXP900[(count - i) - 1].multiply(BigInteger.valueOf((long) codewords[i])));
        }
        i = result.toString();
        if (i.charAt(0) == '1') {
            return i.substring(1);
        }
        throw FormatException.getFormatInstance();
    }
}
