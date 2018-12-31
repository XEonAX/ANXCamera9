package com.google.android.apps.gsa.search.shared.service.proto.nano;

import com.google.protobuf.nano.NanoEnumValue;

public abstract class ClientEventOuterClass {
    private ClientEventOuterClass() {
    }

    @NanoEnumValue(legacy = false, value = ClientEventId.class)
    public static int checkClientEventIdOrThrow(int i) {
        if (i >= 0 && i <= 7) {
            return i;
        }
        if (i >= 9 && i <= 12) {
            return i;
        }
        if (i >= 14 && i <= 18) {
            return i;
        }
        if (i >= 23 && i <= 25) {
            return i;
        }
        if (i >= 27 && i <= 27) {
            return i;
        }
        if (i >= 29 && i <= 29) {
            return i;
        }
        if (i >= 31 && i <= 49) {
            return i;
        }
        if (i >= 51 && i <= 55) {
            return i;
        }
        if (i >= 57 && i <= 90) {
            return i;
        }
        if (i >= 92 && i <= 100) {
            return i;
        }
        if (i >= 103 && i <= 103) {
            return i;
        }
        if (i >= 105 && i <= 108) {
            return i;
        }
        if (i >= 110 && i <= 158) {
            return i;
        }
        if (i >= 160 && i <= 163) {
            return i;
        }
        if (i >= 166 && i <= 171) {
            return i;
        }
        if (i >= 173 && i <= 175) {
            return i;
        }
        if (i >= 178 && i <= 192) {
            return i;
        }
        if (i >= 194 && i <= 200) {
            return i;
        }
        if (i >= 203 && i <= 216) {
            return i;
        }
        if (i >= 218 && i <= 228) {
            return i;
        }
        if (i >= 230 && i <= 233) {
            return i;
        }
        if (i >= 235 && i <= 251) {
            return i;
        }
        if (i >= 253 && i <= 265) {
            return i;
        }
        if (i >= 267 && i <= 309) {
            return i;
        }
        if (i >= 311 && i <= 348) {
            return i;
        }
        StringBuilder stringBuilder = new StringBuilder(45);
        stringBuilder.append(i);
        stringBuilder.append(" is not a valid enum ClientEventId");
        throw new IllegalArgumentException(stringBuilder.toString());
    }

    @NanoEnumValue(legacy = false, value = ClientEventId.class)
    public static int[] checkClientEventIdOrThrow(int[] iArr) {
        iArr = (int[]) iArr.clone();
        for (int checkClientEventIdOrThrow : iArr) {
            checkClientEventIdOrThrow(checkClientEventIdOrThrow);
        }
        return iArr;
    }
}
