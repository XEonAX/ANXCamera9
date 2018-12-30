package com.android.camera.panorama;

import android.media.Image;

public class PanoramaGP3ImageFormat {
    public static final String YUV420_PLANAR = "YUV420_PLANAR";
    public static final String YUV420_SEMIPLANAR = "YUV420_SEMIPLANAR";
    public static final String YVU420_SEMIPLANAR = "YVU420_SEMIPLANAR";

    /* JADX WARNING: Removed duplicated region for block: B:3:0x0011 A:{Splitter: B:0:0x0000, ExcHandler: java.lang.NoSuchFieldException (e java.lang.NoSuchFieldException)} */
    /* JADX WARNING: Missing block: B:5:0x0016, code:
            return com.android.camera.panorama.NativeMemoryAllocator.getAddress(r2);
     */
    private static long getByteBufferAddress(java.nio.ByteBuffer r2) {
        /*
        r0 = java.nio.Buffer.class;
        r1 = "effectiveDirectAddress";
        r0 = r0.getDeclaredField(r1);	 Catch:{ NoSuchFieldException -> 0x0011, NoSuchFieldException -> 0x0011 }
        r1 = 1;
        r0.setAccessible(r1);	 Catch:{ NoSuchFieldException -> 0x0011, NoSuchFieldException -> 0x0011 }
        r0 = r0.getLong(r2);	 Catch:{ NoSuchFieldException -> 0x0011, NoSuchFieldException -> 0x0011 }
        return r0;
    L_0x0011:
        r0 = move-exception;
        r0 = com.android.camera.panorama.NativeMemoryAllocator.getAddress(r2);
        return r0;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.panorama.PanoramaGP3ImageFormat.getByteBufferAddress(java.nio.ByteBuffer):long");
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
