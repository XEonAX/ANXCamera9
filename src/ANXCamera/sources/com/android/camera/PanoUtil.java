package com.android.camera;

import com.android.camera.panorama.NativeMemoryAllocator;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.text.SimpleDateFormat;
import java.util.Date;

public class PanoUtil {
    public static String createName(String str, long j) {
        return new SimpleDateFormat(str).format(new Date(j));
    }

    public static double calculateDifferenceBetweenAngles(double d, double d2) {
        double d3 = (d2 - d) % 360.0d;
        if (d3 < 0.0d) {
            d3 += 360.0d;
        }
        d = (d - d2) % 360.0d;
        if (d < 0.0d) {
            d += 360.0d;
        }
        return Math.min(d3, d);
    }

    public static void decodeYUV420SPQuarterRes(int[] iArr, byte[] bArr, int i, int i2) {
        int i3 = i;
        int i4 = i2;
        int i5 = i3 * i4;
        int i6 = 0;
        int i7 = i6;
        while (i6 < i4) {
            int i8 = ((i6 >> 1) * i3) + i5;
            int i9 = 0;
            int i10 = i9;
            int i11 = i7;
            i7 = i10;
            while (i7 < i3) {
                int i12 = (bArr[(i6 * i3) + i7] & 255) - 16;
                if (i12 < 0) {
                    i12 = 0;
                }
                if ((i7 & 1) == 0) {
                    i9 = i8 + 1;
                    i10 = i9 + 1;
                    int i13 = (bArr[i9] & 255) - 128;
                    i9 = (bArr[i8] & 255) - 128;
                    i8 = i10 + 2;
                    i10 = i13;
                }
                int i14 = 1192 * i12;
                i12 = (1634 * i9) + i14;
                int i15 = (i14 - (833 * i9)) - (400 * i10);
                i14 += 2066 * i10;
                if (i12 < 0) {
                    i12 = 0;
                } else if (i12 > 262143) {
                    i12 = 262143;
                }
                if (i15 < 0) {
                    i15 = 0;
                } else if (i15 > 262143) {
                    i15 = 262143;
                }
                if (i14 < 0) {
                    i14 = 0;
                } else if (i14 > 262143) {
                    i14 = 262143;
                }
                iArr[i11] = ((((i12 << 6) & 16711680) | -16777216) | ((i15 >> 2) & 65280)) | (255 & (i14 >> 10));
                i7 += 4;
                i11++;
            }
            i6 += 4;
            i7 = i11;
        }
    }

    public static ByteBuffer createByteBuffer(byte[] bArr) {
        ByteBuffer allocateBuffer = NativeMemoryAllocator.allocateBuffer(bArr.length);
        allocateBuffer.order(ByteOrder.nativeOrder());
        allocateBuffer.position(0);
        allocateBuffer.put(bArr);
        allocateBuffer.position(0);
        return allocateBuffer;
    }
}
