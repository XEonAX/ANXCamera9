package com.miui.extravideo.common;

public class MediaColorConvertUtils {
    public static void convertDecodeColorToEncode(byte[] bArr, byte[] bArr2, MediaParamsHolder mediaParamsHolder) {
        ColorConverterJNI.convertYuv420spToYvu420sp(mediaParamsHolder.videoWidth, mediaParamsHolder.videoHeight, bArr, bArr2, mediaParamsHolder.intervalPaddingSize, mediaParamsHolder.topPaddingSize, mediaParamsHolder.leftPaddingSize, mediaParamsHolder.stride, false);
    }

    public static void toggleYUV(byte[] bArr, int i, int i2) {
        for (i *= i2; i < bArr.length; i += 2) {
            byte b = bArr[i];
            int i3 = i + 1;
            bArr[i] = bArr[i3];
            bArr[i3] = b;
        }
    }
}
