package com.android.camera.panorama;

import android.media.Image;
import java.lang.reflect.Field;
import java.nio.Buffer;
import java.nio.ByteBuffer;

public class PanoramaGP3ImageFormat {
    public static final String YUV420_PLANAR = "YUV420_PLANAR";
    public static final String YUV420_SEMIPLANAR = "YUV420_SEMIPLANAR";
    public static final String YVU420_SEMIPLANAR = "YVU420_SEMIPLANAR";

    /* JADX WARNING: Removed duplicated region for block: B:3:0x0011 A:{Splitter: B:0:0x0000, ExcHandler: java.lang.NoSuchFieldException (e java.lang.NoSuchFieldException)} */
    /* JADX WARNING: Missing block: B:5:0x0016, code:
            return com.android.camera.panorama.NativeMemoryAllocator.getAddress(r2);
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private static long getByteBufferAddress(ByteBuffer byteBuffer) {
        try {
            Field declaredField = Buffer.class.getDeclaredField("effectiveDirectAddress");
            declaredField.setAccessible(true);
            return declaredField.getLong(byteBuffer);
        } catch (NoSuchFieldException e) {
        }
    }

    private static String getImageFormat(long j, long j2) {
        if (j > j2) {
            return YVU420_SEMIPLANAR;
        }
        return YUV420_SEMIPLANAR;
    }

    public static String getImageFormat(Image image) {
        if (image.getPlanes()[1].getPixelStride() == 1) {
            return YUV420_PLANAR;
        }
        return getImageFormat(getByteBufferAddress(image.getPlanes()[1].getBuffer()), getByteBufferAddress(image.getPlanes()[2].getBuffer()));
    }
}
