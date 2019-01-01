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

    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static int convertToFocusMode(String str) {
        int i;
        switch (str.hashCode()) {
            case -1081415738:
                if (str.equals("manual")) {
                    i = 5;
                    break;
                }
            case -194628547:
                if (str.equals(LEGACY_CONTINUOUS_VIDEO)) {
                    i = 2;
                    break;
                }
            case 3005871:
                if (str.equals("auto")) {
                    i = 0;
                    break;
                }
            case 3108534:
                if (str.equals(LEGACY_EDOF)) {
                    i = 4;
                    break;
                }
            case 103652300:
                if (str.equals(LEGACY_MACRO)) {
                    i = 1;
                    break;
                }
            case 910005312:
                if (str.equals(LEGACY_CONTINUOUS_PICTURE)) {
                    i = 3;
                    break;
                }
            default:
                i = -1;
                break;
        }
        switch (i) {
            case 0:
                return 1;
            case 1:
                return 2;
            case 2:
                return 3;
            case 3:
                return 4;
            case 4:
                return 5;
            case 5:
                return 0;
            default:
                return 0;
        }
    }
}
