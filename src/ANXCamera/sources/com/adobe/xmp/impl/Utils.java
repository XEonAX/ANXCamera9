package com.adobe.xmp.impl;

import com.adobe.xmp.XMPConst;

public class Utils implements XMPConst {
    public static final int UUID_LENGTH = 36;
    public static final int UUID_SEGMENT_COUNT = 4;
    private static boolean[] xmlNameChars;
    private static boolean[] xmlNameStartChars;

    static {
        initCharTables();
    }

    private Utils() {
    }

    public static String normalizeLangValue(String str) {
        if (XMPConst.X_DEFAULT.equals(str)) {
            return str;
        }
        StringBuffer stringBuffer = new StringBuffer();
        int i = 1;
        for (int i2 = 0; i2 < str.length(); i2++) {
            char charAt = str.charAt(i2);
            if (charAt != ' ') {
                if (charAt == '-' || charAt == '_') {
                    stringBuffer.append('-');
                    i++;
                } else if (i != 2) {
                    stringBuffer.append(Character.toLowerCase(str.charAt(i2)));
                } else {
                    stringBuffer.append(Character.toUpperCase(str.charAt(i2)));
                }
            }
        }
        return stringBuffer.toString();
    }

    static String[] splitNameAndValue(String str) {
        int indexOf = str.indexOf(61);
        String substring = str.substring(str.charAt(1) == '?' ? 2 : 1, indexOf);
        int i = indexOf + 1;
        char charAt = str.charAt(i);
        i++;
        int length = str.length() - 2;
        StringBuffer stringBuffer = new StringBuffer(length - indexOf);
        while (i < length) {
            stringBuffer.append(str.charAt(i));
            i++;
            if (str.charAt(i) == charAt) {
                i++;
            }
        }
        return new String[]{substring, stringBuffer.toString()};
    }

    static boolean isInternalProperty(String str, String str2) {
        if (XMPConst.NS_DC.equals(str)) {
            if ("dc:format".equals(str2) || "dc:language".equals(str2)) {
                return true;
            }
        } else if (XMPConst.NS_XMP.equals(str)) {
            if ("xmp:BaseURL".equals(str2) || "xmp:CreatorTool".equals(str2) || "xmp:Format".equals(str2) || "xmp:Locale".equals(str2) || "xmp:MetadataDate".equals(str2) || "xmp:ModifyDate".equals(str2)) {
                return true;
            }
        } else if (XMPConst.NS_PDF.equals(str)) {
            if ("pdf:BaseURL".equals(str2) || "pdf:Creator".equals(str2) || "pdf:ModDate".equals(str2) || "pdf:PDFVersion".equals(str2) || "pdf:Producer".equals(str2)) {
                return true;
            }
        } else if (XMPConst.NS_TIFF.equals(str)) {
            if (!("tiff:ImageDescription".equals(str2) || "tiff:Artist".equals(str2) || "tiff:Copyright".equals(str2))) {
                return true;
            }
        } else if (XMPConst.NS_EXIF.equals(str)) {
            if (!"exif:UserComment".equals(str2)) {
                return true;
            }
        } else if (XMPConst.NS_EXIF_AUX.equals(str)) {
            return true;
        } else {
            if (XMPConst.NS_PHOTOSHOP.equals(str)) {
                if ("photoshop:ICCProfile".equals(str2)) {
                    return true;
                }
            } else if (XMPConst.NS_CAMERARAW.equals(str)) {
                if ("crs:Version".equals(str2) || "crs:RawFileName".equals(str2) || "crs:ToneCurveName".equals(str2)) {
                    return true;
                }
            } else if (XMPConst.NS_ADOBESTOCKPHOTO.equals(str) || XMPConst.NS_XMP_MM.equals(str) || XMPConst.TYPE_TEXT.equals(str) || XMPConst.TYPE_PAGEDFILE.equals(str) || XMPConst.TYPE_GRAPHICS.equals(str) || XMPConst.TYPE_IMAGE.equals(str) || XMPConst.TYPE_FONT.equals(str)) {
                return true;
            }
        }
        return false;
    }

    static boolean checkUUIDFormat(String str) {
        boolean z = false;
        if (str == null) {
            return false;
        }
        int i = 0;
        int i2 = i;
        boolean z2 = true;
        while (i < str.length()) {
            if (str.charAt(i) == '-') {
                i2++;
                z2 = z2 && (i == 8 || i == 13 || i == 18 || i == 23);
            }
            i++;
        }
        if (z2 && 4 == i2 && 36 == i) {
            z = true;
        }
        return z;
    }

    public static boolean isXMLName(String str) {
        if (str.length() > 0 && !isNameStartChar(str.charAt(0))) {
            return false;
        }
        for (int i = 1; i < str.length(); i++) {
            if (!isNameChar(str.charAt(i))) {
                return false;
            }
        }
        return true;
    }

    public static boolean isXMLNameNS(String str) {
        if (str.length() > 0 && (!isNameStartChar(str.charAt(0)) || str.charAt(0) == ':')) {
            return false;
        }
        int i = 1;
        while (i < str.length()) {
            if (!isNameChar(str.charAt(i)) || str.charAt(i) == ':') {
                return false;
            }
            i++;
        }
        return true;
    }

    static boolean isControlChar(char c) {
        return ((c > 31 && c != 127) || c == 9 || c == 10 || c == 13) ? false : true;
    }

    public static String escapeXML(String str, boolean z, boolean z2) {
        int i;
        char charAt;
        int i2 = 0;
        for (i = 0; i < str.length(); i++) {
            charAt = str.charAt(i);
            if (charAt == '<' || charAt == '>' || charAt == '&' || ((z2 && (charAt == 9 || charAt == 10 || charAt == 13)) || (z && charAt == '\"'))) {
                i = 1;
                break;
            }
        }
        i = 0;
        if (i == 0) {
            return str;
        }
        StringBuffer stringBuffer = new StringBuffer((str.length() * 4) / 3);
        while (i2 < str.length()) {
            charAt = str.charAt(i2);
            if (z2 && (charAt == 9 || charAt == 10 || charAt == 13)) {
                stringBuffer.append("&#x");
                stringBuffer.append(Integer.toHexString(charAt).toUpperCase());
                stringBuffer.append(';');
            } else if (charAt == '\"') {
                stringBuffer.append(z ? "&quot;" : "\"");
            } else if (charAt == '&') {
                stringBuffer.append("&amp;");
            } else if (charAt == '<') {
                stringBuffer.append("&lt;");
            } else if (charAt != '>') {
                stringBuffer.append(charAt);
            } else {
                stringBuffer.append("&gt;");
            }
            i2++;
        }
        return stringBuffer.toString();
    }

    static String removeControlChars(String str) {
        StringBuffer stringBuffer = new StringBuffer(str);
        for (int i = 0; i < stringBuffer.length(); i++) {
            if (isControlChar(stringBuffer.charAt(i))) {
                stringBuffer.setCharAt(i, ' ');
            }
        }
        return stringBuffer.toString();
    }

    private static boolean isNameStartChar(char c) {
        return c > 255 || xmlNameStartChars[c];
    }

    private static boolean isNameChar(char c) {
        return c > 255 || xmlNameChars[c];
    }

    private static void initCharTables() {
        xmlNameChars = new boolean[256];
        xmlNameStartChars = new boolean[256];
        int i = 0;
        while (i < xmlNameChars.length) {
            boolean[] zArr = xmlNameStartChars;
            boolean z = true;
            boolean z2 = (97 <= i && i <= 122) || ((65 <= i && i <= 90) || i == 58 || i == 95 || ((192 <= i && i <= 214) || (216 <= i && i <= 246)));
            zArr[i] = z2;
            zArr = xmlNameChars;
            if ((97 > i || i > 122) && ((65 > i || i > 90) && !((48 <= i && i <= 57) || i == 58 || i == 95 || i == 45 || i == 46 || i == 183 || ((192 <= i && i <= 214) || (216 <= i && i <= 246))))) {
                z = false;
            }
            zArr[i] = z;
            i = (char) (i + 1);
        }
    }
}
