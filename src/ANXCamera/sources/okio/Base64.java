package okio;

import java.io.UnsupportedEncodingException;

final class Base64 {
    private static final byte[] MAP = new byte[]{(byte) 65, (byte) 66, (byte) 67, (byte) 68, (byte) 69, (byte) 70, (byte) 71, (byte) 72, (byte) 73, (byte) 74, (byte) 75, (byte) 76, (byte) 77, (byte) 78, (byte) 79, (byte) 80, (byte) 81, (byte) 82, (byte) 83, (byte) 84, (byte) 85, (byte) 86, (byte) 87, (byte) 88, (byte) 89, (byte) 90, (byte) 97, (byte) 98, (byte) 99, (byte) 100, (byte) 101, (byte) 102, (byte) 103, (byte) 104, (byte) 105, (byte) 106, (byte) 107, (byte) 108, (byte) 109, (byte) 110, (byte) 111, (byte) 112, (byte) 113, (byte) 114, (byte) 115, (byte) 116, (byte) 117, (byte) 118, (byte) 119, (byte) 120, (byte) 121, (byte) 122, (byte) 48, (byte) 49, (byte) 50, (byte) 51, (byte) 52, (byte) 53, (byte) 54, (byte) 55, (byte) 56, (byte) 57, (byte) 43, (byte) 47};
    private static final byte[] URL_MAP = new byte[]{(byte) 65, (byte) 66, (byte) 67, (byte) 68, (byte) 69, (byte) 70, (byte) 71, (byte) 72, (byte) 73, (byte) 74, (byte) 75, (byte) 76, (byte) 77, (byte) 78, (byte) 79, (byte) 80, (byte) 81, (byte) 82, (byte) 83, (byte) 84, (byte) 85, (byte) 86, (byte) 87, (byte) 88, (byte) 89, (byte) 90, (byte) 97, (byte) 98, (byte) 99, (byte) 100, (byte) 101, (byte) 102, (byte) 103, (byte) 104, (byte) 105, (byte) 106, (byte) 107, (byte) 108, (byte) 109, (byte) 110, (byte) 111, (byte) 112, (byte) 113, (byte) 114, (byte) 115, (byte) 116, (byte) 117, (byte) 118, (byte) 119, (byte) 120, (byte) 121, (byte) 122, (byte) 48, (byte) 49, (byte) 50, (byte) 51, (byte) 52, (byte) 53, (byte) 54, (byte) 55, (byte) 56, (byte) 57, (byte) 45, (byte) 95};

    private Base64() {
    }

    public static byte[] decode(String str) {
        int length = str.length();
        while (length > 0) {
            char charAt = str.charAt(length - 1);
            if (charAt != '=' && charAt != 10 && charAt != 13 && charAt != ' ' && charAt != 9) {
                break;
            }
            length--;
        }
        Object obj = new byte[((int) ((((long) length) * 6) / 8))];
        int i = 0;
        int i2 = i;
        int i3 = i2;
        int i4 = i3;
        while (i < length) {
            int i5;
            char charAt2 = str.charAt(i);
            if (charAt2 >= 'A' && charAt2 <= 'Z') {
                i5 = charAt2 - 65;
            } else if (charAt2 >= 'a' && charAt2 <= 'z') {
                i5 = charAt2 - 71;
            } else if (charAt2 >= '0' && charAt2 <= '9') {
                i5 = charAt2 + 4;
            } else if (charAt2 == '+' || charAt2 == '-') {
                i5 = 62;
            } else if (charAt2 == '/' || charAt2 == '_') {
                i5 = 63;
            } else {
                if (!(charAt2 == 10 || charAt2 == 13 || charAt2 == ' ' || charAt2 == 9)) {
                    return null;
                }
                i++;
            }
            i3 = (i3 << 6) | ((byte) i5);
            i2++;
            if (i2 % 4 == 0) {
                int i6 = i4 + 1;
                obj[i4] = (byte) (i3 >> 16);
                i4 = i6 + 1;
                obj[i6] = (byte) (i3 >> 8);
                i6 = i4 + 1;
                obj[i4] = (byte) i3;
                i4 = i6;
            }
            i++;
        }
        i2 %= 4;
        if (i2 == 1) {
            return null;
        }
        if (i2 == 2) {
            length = i4 + 1;
            obj[i4] = (byte) ((i3 << 12) >> 16);
            i4 = length;
        } else if (i2 == 3) {
            int i7 = i3 << 6;
            length = i4 + 1;
            obj[i4] = (byte) (i7 >> 16);
            i4 = length + 1;
            obj[length] = (byte) (i7 >> 8);
        }
        if (i4 == obj.length) {
            return obj;
        }
        Object obj2 = new byte[i4];
        System.arraycopy(obj, 0, obj2, 0, i4);
        return obj2;
    }

    public static String encode(byte[] bArr) {
        return encode(bArr, MAP);
    }

    public static String encodeUrl(byte[] bArr) {
        return encode(bArr, URL_MAP);
    }

    private static String encode(byte[] bArr, byte[] bArr2) {
        byte[] bArr3 = new byte[(((bArr.length + 2) / 3) * 4)];
        int length = bArr.length - (bArr.length % 3);
        int i = 0;
        int i2 = 0;
        while (i < length) {
            int i3 = i2 + 1;
            bArr3[i2] = bArr2[(bArr[i] & 255) >> 2];
            i2 = i3 + 1;
            int i4 = i + 1;
            bArr3[i3] = bArr2[((bArr[i] & 3) << 4) | ((bArr[i4] & 255) >> 4)];
            i3 = i2 + 1;
            i4 = i + 2;
            bArr3[i2] = bArr2[((bArr[i4] & 15) << 2) | ((bArr[i4] & 255) >> 6)];
            i2 = i3 + 1;
            bArr3[i3] = bArr2[bArr[i4] & 63];
            i += 3;
        }
        switch (bArr.length % 3) {
            case 1:
                i = i2 + 1;
                bArr3[i2] = bArr2[(bArr[length] & 255) >> 2];
                i2 = i + 1;
                bArr3[i] = bArr2[(bArr[length] & 3) << 4];
                int i5 = i2 + 1;
                bArr3[i2] = (byte) 61;
                bArr3[i5] = (byte) 61;
                break;
            case 2:
                i = i2 + 1;
                bArr3[i2] = bArr2[(bArr[length] & 255) >> 2];
                i2 = i + 1;
                length++;
                bArr3[i] = bArr2[((bArr[length] & 3) << 4) | ((bArr[length] & 255) >> 4)];
                i = i2 + 1;
                bArr3[i2] = bArr2[(bArr[length] & 15) << 2];
                bArr3[i] = (byte) 61;
                break;
        }
        try {
            return new String(bArr3, "US-ASCII");
        } catch (UnsupportedEncodingException e) {
            throw new AssertionError(e);
        }
    }
}
