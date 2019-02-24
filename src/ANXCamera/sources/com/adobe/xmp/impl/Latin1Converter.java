package com.adobe.xmp.impl;

import java.io.UnsupportedEncodingException;

public class Latin1Converter {
    private static final int STATE_START = 0;
    private static final int STATE_UTF8CHAR = 11;

    private Latin1Converter() {
    }

    public static ByteBuffer convert(ByteBuffer byteBuffer) {
        if (!"UTF-8".equals(byteBuffer.getEncoding())) {
            return byteBuffer;
        }
        byte[] bArr = new byte[8];
        ByteBuffer byteBuffer2 = new ByteBuffer((byteBuffer.length() * 4) / 3);
        int i = 0;
        int i2 = 0;
        int i3 = i2;
        int i4 = i3;
        int i5 = i4;
        while (i2 < byteBuffer.length()) {
            int charAt = byteBuffer.charAt(i2);
            if (i3 == 11) {
                if (i4 <= 0 || (charAt & 192) != 128) {
                    byteBuffer2.append(convertToUTF8(bArr[0]));
                    i2 -= i5;
                } else {
                    int i6 = i5 + 1;
                    bArr[i5] = (byte) charAt;
                    i4--;
                    if (i4 == 0) {
                        byteBuffer2.append(bArr, 0, i6);
                    } else {
                        i5 = i6;
                    }
                }
                i3 = 0;
                i5 = i3;
            } else if (charAt < 127) {
                byteBuffer2.append((byte) charAt);
            } else if (charAt >= 192) {
                i3 = -1;
                i4 = charAt;
                while (i3 < 8 && (i4 & 128) == 128) {
                    i3++;
                    i4 <<= 1;
                }
                i4 = i5 + 1;
                bArr[i5] = (byte) charAt;
                i5 = i4;
                i4 = i3;
                i3 = 11;
            } else {
                byteBuffer2.append(convertToUTF8((byte) charAt));
            }
            i2++;
        }
        if (i3 == 11) {
            while (i < i5) {
                byteBuffer2.append(convertToUTF8(bArr[i]));
                i++;
            }
        }
        return byteBuffer2;
    }

    private static byte[] convertToUTF8(byte b) {
        int i = b & 255;
        if (i >= 128) {
            if (i == 129 || i == 141 || i == 143 || i == 144 || i == 157) {
                return new byte[]{(byte) 32};
            }
            try {
                return new String(new byte[]{b}, "cp1252").getBytes("UTF-8");
            } catch (UnsupportedEncodingException e) {
            }
        }
        return new byte[]{b};
    }
}
