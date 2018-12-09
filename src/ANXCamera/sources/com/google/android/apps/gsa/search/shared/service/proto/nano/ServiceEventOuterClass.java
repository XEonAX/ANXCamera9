package com.google.android.apps.gsa.search.shared.service.proto.nano;

import com.google.protobuf.nano.NanoEnumValue;

public abstract class ServiceEventOuterClass {
    private ServiceEventOuterClass() {
    }

    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static int checkServiceEventIdOrThrow(int i) {
        if (i >= 1 && i <= 10) {
            return i;
        }
        if (i >= 12 && i <= 18) {
            return i;
        }
        if (i >= 20 && i <= 22) {
            return i;
        }
        if (i >= 24 && i <= 27) {
            return i;
        }
        if (i >= 29 && i <= 39) {
            return i;
        }
        if (i >= 42 && i <= 51) {
            return i;
        }
        if (i >= 56 && i <= 85) {
            return i;
        }
        if (i >= 87 && i <= 89) {
            return i;
        }
        if (i >= 91 && i <= 91) {
            return i;
        }
        if (i >= 94 && i <= 108) {
            return i;
        }
        if (i >= 110 && i <= 111) {
            return i;
        }
        if (i >= 113 && i <= 113) {
            return i;
        }
        if (i >= 115 && i <= 123) {
            return i;
        }
        if (i >= 126 && i <= 146) {
            return i;
        }
        if (i >= 148 && i <= 158) {
            return i;
        }
        if (i >= 160 && i <= 160) {
            return i;
        }
        if (i >= 162 && i <= 168) {
            return i;
        }
        if (i >= 170 && i <= 172) {
            return i;
        }
        if (i >= 174 && i <= 174) {
            return i;
        }
        if (i >= 176 && i <= 176) {
            return i;
        }
        if (i >= 178 && i <= 189) {
            return i;
        }
        if (i >= 191 && i <= 207) {
            return i;
        }
        if (i >= 210 && i <= 240) {
            return i;
        }
        StringBuilder stringBuilder = new StringBuilder(46);
        stringBuilder.append(i);
        stringBuilder.append(" is not a valid enum ServiceEventId");
        throw new IllegalArgumentException(stringBuilder.toString());
    }

    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static int[] checkServiceEventIdOrThrow(int[] iArr) {
        iArr = (int[]) iArr.clone();
        for (int checkServiceEventIdOrThrow : iArr) {
            checkServiceEventIdOrThrow(checkServiceEventIdOrThrow);
        }
        return iArr;
    }
}
