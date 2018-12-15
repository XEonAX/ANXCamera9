package com.google.zxing.oned;

import java.util.Arrays;

public final class CodaBarWriter extends OneDimensionalCodeWriter {
    private static final char[] ALT_START_END_CHARS = new char[]{'T', 'N', '*', 'E'};
    private static final char[] CHARS_WHICH_ARE_TEN_LENGTH_EACH_AFTER_DECODED = new char[]{'/', ':', '+', '.'};
    private static final char[] START_END_CHARS = new char[]{'A', 'B', 'C', 'D'};

    public boolean[] encode(String contents) {
        String str = contents;
        if (contents.length() >= 2) {
            char firstChar = Character.toUpperCase(str.charAt(0));
            char lastChar = Character.toUpperCase(str.charAt(contents.length() - 1));
            boolean startsEndsNormal = CodaBarReader.arrayContains(START_END_CHARS, firstChar) && CodaBarReader.arrayContains(START_END_CHARS, lastChar);
            boolean startsEndsAlt = CodaBarReader.arrayContains(ALT_START_END_CHARS, firstChar) && CodaBarReader.arrayContains(ALT_START_END_CHARS, lastChar);
            StringBuilder stringBuilder;
            if (startsEndsNormal || startsEndsAlt) {
                int resultLength = 20;
                int i = 1;
                while (i < contents.length() - 1) {
                    if (Character.isDigit(str.charAt(i)) || str.charAt(i) == '-' || str.charAt(i) == '$') {
                        resultLength += 9;
                    } else if (CodaBarReader.arrayContains(CHARS_WHICH_ARE_TEN_LENGTH_EACH_AFTER_DECODED, str.charAt(i))) {
                        resultLength += 10;
                    } else {
                        stringBuilder = new StringBuilder("Cannot encode : '");
                        stringBuilder.append(str.charAt(i));
                        stringBuilder.append('\'');
                        throw new IllegalArgumentException(stringBuilder.toString());
                    }
                    i++;
                }
                boolean[] result = new boolean[(resultLength + (contents.length() - 1))];
                int position = 0;
                int index = 0;
                while (index < contents.length()) {
                    char c = Character.toUpperCase(str.charAt(index));
                    if (index == 0 || index == contents.length() - 1) {
                        if (c == '*') {
                            c = 'C';
                        } else if (c == 'E') {
                            c = 'D';
                        } else if (c == 'N') {
                            c = 'B';
                        } else if (c == 'T') {
                            c = 'A';
                        }
                    }
                    char c2 = c;
                    int code = 0;
                    for (resultLength = 0; resultLength < CodaBarReader.ALPHABET.length; resultLength++) {
                        if (c2 == CodaBarReader.ALPHABET[resultLength]) {
                            code = CodaBarReader.CHARACTER_ENCODINGS[resultLength];
                            break;
                        }
                    }
                    i = code;
                    boolean color = true;
                    code = 0;
                    int bit = 0;
                    while (bit < 7) {
                        result[position] = color;
                        position++;
                        if (((i >> (6 - bit)) & 1) == 0 || code == 1) {
                            color = !color;
                            bit++;
                            code = 0;
                        } else {
                            code++;
                        }
                    }
                    if (index < contents.length() - 1) {
                        result[position] = false;
                        position++;
                    }
                    index++;
                }
                return result;
            }
            stringBuilder = new StringBuilder("Codabar should start/end with ");
            stringBuilder.append(Arrays.toString(START_END_CHARS));
            stringBuilder.append(", or start/end with ");
            stringBuilder.append(Arrays.toString(ALT_START_END_CHARS));
            throw new IllegalArgumentException(stringBuilder.toString());
        }
        throw new IllegalArgumentException("Codabar should start/end with start/stop symbols");
    }
}
