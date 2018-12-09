package com.android.camera.constant;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.ArrayList;
import java.util.List;

public class AutoFocus {
    public static final String LEGACY_AUTO = "auto";
    public static final String LEGACY_CONTINUOUS_PICTURE = "continuous-picture";
    public static final String LEGACY_CONTINUOUS_VIDEO = "continuous-video";
    public static final String LEGACY_EDOF = "edof";
    public static final String LEGACY_MACRO = "macro";
    public static final String LEGACY_MANUAL = "manual";

    @Retention(RetentionPolicy.SOURCE)
    public @interface FocusMode {
    }

    public static List<String> convertToLegacyFocusModes(int[] iArr) {
        List<String> arrayList = new ArrayList();
        for (int i : iArr) {
            switch (i) {
                case 0:
                    arrayList.add("manual");
                    break;
                case 1:
                    arrayList.add("auto");
                    break;
                case 2:
                    arrayList.add(LEGACY_MACRO);
                    break;
                case 3:
                    arrayList.add(LEGACY_CONTINUOUS_VIDEO);
                    break;
                case 4:
                    arrayList.add(LEGACY_CONTINUOUS_PICTURE);
                    break;
                case 5:
                    arrayList.add(LEGACY_EDOF);
                    break;
                default:
                    break;
            }
        }
        return arrayList;
    }

    public static int convertToFocusMode(java.lang.String r7) {
        /*
        r0 = r7.hashCode();
        r1 = 5;
        r2 = 2;
        r3 = 4;
        r4 = 1;
        r5 = 3;
        r6 = 0;
        switch(r0) {
            case -1081415738: goto L_0x0040;
            case -194628547: goto L_0x0036;
            case 3005871: goto L_0x002c;
            case 3108534: goto L_0x0022;
            case 103652300: goto L_0x0018;
            case 910005312: goto L_0x000e;
            default: goto L_0x000d;
        };
    L_0x000d:
        goto L_0x004a;
    L_0x000e:
        r0 = "continuous-picture";
        r7 = r7.equals(r0);
        if (r7 == 0) goto L_0x004a;
    L_0x0016:
        r7 = r5;
        goto L_0x004b;
    L_0x0018:
        r0 = "macro";
        r7 = r7.equals(r0);
        if (r7 == 0) goto L_0x004a;
    L_0x0020:
        r7 = r4;
        goto L_0x004b;
    L_0x0022:
        r0 = "edof";
        r7 = r7.equals(r0);
        if (r7 == 0) goto L_0x004a;
    L_0x002a:
        r7 = r3;
        goto L_0x004b;
    L_0x002c:
        r0 = "auto";
        r7 = r7.equals(r0);
        if (r7 == 0) goto L_0x004a;
    L_0x0034:
        r7 = r6;
        goto L_0x004b;
    L_0x0036:
        r0 = "continuous-video";
        r7 = r7.equals(r0);
        if (r7 == 0) goto L_0x004a;
    L_0x003e:
        r7 = r2;
        goto L_0x004b;
    L_0x0040:
        r0 = "manual";
        r7 = r7.equals(r0);
        if (r7 == 0) goto L_0x004a;
    L_0x0048:
        r7 = r1;
        goto L_0x004b;
    L_0x004a:
        r7 = -1;
    L_0x004b:
        switch(r7) {
            case 0: goto L_0x0054;
            case 1: goto L_0x0053;
            case 2: goto L_0x0052;
            case 3: goto L_0x0051;
            case 4: goto L_0x0050;
            case 5: goto L_0x004f;
            default: goto L_0x004e;
        };
    L_0x004e:
        return r6;
    L_0x004f:
        return r6;
    L_0x0050:
        return r1;
    L_0x0051:
        return r3;
    L_0x0052:
        return r5;
    L_0x0053:
        return r2;
    L_0x0054:
        return r4;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.constant.AutoFocus.convertToFocusMode(java.lang.String):int");
    }
}
