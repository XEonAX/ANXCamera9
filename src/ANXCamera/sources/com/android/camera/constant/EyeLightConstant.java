package com.android.camera.constant;

import com.aeonax.camera.R;

public class EyeLightConstant {
    public static final String ANGEL = "5";
    public static final String COMIC = "1";
    public static final String CRESCENT = "4";
    public static final String NATURE = "0";
    public static final String OFF = "-1";
    public static final String RAINBOW = "3";
    public static final String STAR = "2";
    public static final String WINDOW = "6";

    /* JADX WARNING: Removed duplicated region for block: B:29:0x0061 A:{RETURN} */
    /* JADX WARNING: Removed duplicated region for block: B:44:0x007e  */
    /* JADX WARNING: Removed duplicated region for block: B:42:0x007a  */
    /* JADX WARNING: Removed duplicated region for block: B:40:0x0076  */
    /* JADX WARNING: Removed duplicated region for block: B:38:0x0072  */
    /* JADX WARNING: Removed duplicated region for block: B:36:0x006e  */
    /* JADX WARNING: Removed duplicated region for block: B:34:0x006a  */
    /* JADX WARNING: Removed duplicated region for block: B:32:0x0066  */
    /* JADX WARNING: Removed duplicated region for block: B:30:0x0062  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static int getDrawable(String str) {
        int i;
        int hashCode = str.hashCode();
        if (hashCode != 1444) {
            switch (hashCode) {
                case 48:
                    if (str.equals("0")) {
                        i = 1;
                        break;
                    }
                case 49:
                    if (str.equals("1")) {
                        i = 2;
                        break;
                    }
                case 50:
                    if (str.equals("2")) {
                        i = 3;
                        break;
                    }
                case 51:
                    if (str.equals("3")) {
                        i = 4;
                        break;
                    }
                case 52:
                    if (str.equals("4")) {
                        i = 5;
                        break;
                    }
                case 53:
                    if (str.equals("5")) {
                        i = 6;
                        break;
                    }
                case 54:
                    if (str.equals("6")) {
                        i = 7;
                        break;
                    }
            }
        } else if (str.equals(OFF)) {
            i = 0;
            switch (i) {
                case 0:
                    return R.drawable.ic_eye_light_off;
                case 1:
                    return R.drawable.ic_eye_light_nature;
                case 2:
                    return R.drawable.ic_eye_light_comic;
                case 3:
                    return R.drawable.ic_eye_light_star;
                case 4:
                    return R.drawable.ic_eye_light_rainbow;
                case 5:
                    return R.drawable.ic_eye_light_crescent;
                case 6:
                    return R.drawable.ic_eye_light_angel;
                case 7:
                    return R.drawable.ic_eye_light_window;
                default:
                    return 0;
            }
        }
        i = -1;
        switch (i) {
            case 0:
                break;
            case 1:
                break;
            case 2:
                break;
            case 3:
                break;
            case 4:
                break;
            case 5:
                break;
            case 6:
                break;
            case 7:
                break;
            default:
                break;
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:29:0x0061 A:{RETURN} */
    /* JADX WARNING: Removed duplicated region for block: B:44:0x007e  */
    /* JADX WARNING: Removed duplicated region for block: B:42:0x007a  */
    /* JADX WARNING: Removed duplicated region for block: B:40:0x0076  */
    /* JADX WARNING: Removed duplicated region for block: B:38:0x0072  */
    /* JADX WARNING: Removed duplicated region for block: B:36:0x006e  */
    /* JADX WARNING: Removed duplicated region for block: B:34:0x006a  */
    /* JADX WARNING: Removed duplicated region for block: B:32:0x0066  */
    /* JADX WARNING: Removed duplicated region for block: B:30:0x0062  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static int getString(String str) {
        int i;
        int hashCode = str.hashCode();
        if (hashCode != 1444) {
            switch (hashCode) {
                case 48:
                    if (str.equals("0")) {
                        i = 1;
                        break;
                    }
                case 49:
                    if (str.equals("1")) {
                        i = 2;
                        break;
                    }
                case 50:
                    if (str.equals("2")) {
                        i = 3;
                        break;
                    }
                case 51:
                    if (str.equals("3")) {
                        i = 4;
                        break;
                    }
                case 52:
                    if (str.equals("4")) {
                        i = 5;
                        break;
                    }
                case 53:
                    if (str.equals("5")) {
                        i = 6;
                        break;
                    }
                case 54:
                    if (str.equals("6")) {
                        i = 7;
                        break;
                    }
            }
        } else if (str.equals(OFF)) {
            i = 0;
            switch (i) {
                case 0:
                    return R.string.eye_light_off;
                case 1:
                    return R.string.eye_light_nature;
                case 2:
                    return R.string.eye_light_comic;
                case 3:
                    return R.string.eye_light_star;
                case 4:
                    return R.string.eye_light_rainbow;
                case 5:
                    return R.string.eye_light_crescent;
                case 6:
                    return R.string.eye_light_angel;
                case 7:
                    return R.string.eye_light_window;
                default:
                    return 0;
            }
        }
        i = -1;
        switch (i) {
            case 0:
                break;
            case 1:
                break;
            case 2:
                break;
            case 3:
                break;
            case 4:
                break;
            case 5:
                break;
            case 6:
                break;
            case 7:
                break;
            default:
                break;
        }
    }
}
