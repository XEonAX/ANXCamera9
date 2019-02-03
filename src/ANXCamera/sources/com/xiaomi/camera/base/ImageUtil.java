package com.xiaomi.camera.base;

import android.media.Image;
import android.media.Image.Plane;
import android.util.Size;
import com.android.camera.log.Log;
import java.io.FileOutputStream;
import java.nio.ByteBuffer;
import java.util.Locale;
import libcore.io.Memory;

public final class ImageUtil {
    private static final String TAG = ImageUtil.class.getSimpleName();

    private ImageUtil() {
    }

    public static void imageCopy(Image image, Image image2) {
        if (image == null || image2 == null) {
            throw new IllegalArgumentException("Images should be non-null");
        } else if (image.getFormat() != image2.getFormat()) {
            throw new IllegalArgumentException("Src and dst images should have the same format");
        } else if (image.getFormat() == 34 || image2.getFormat() == 34) {
            throw new IllegalArgumentException("PRIVATE format images are not copyable");
        } else if (image.getFormat() != 36) {
            Size size = new Size(image.getWidth(), image.getHeight());
            Size size2 = new Size(image2.getWidth(), image2.getHeight());
            if (size.equals(size2)) {
                Plane[] planes = image.getPlanes();
                Plane[] planes2 = image2.getPlanes();
                int i = 0;
                while (i < planes.length) {
                    int rowStride = planes[i].getRowStride();
                    int rowStride2 = planes2[i].getRowStride();
                    ByteBuffer buffer = planes[i].getBuffer();
                    ByteBuffer buffer2 = planes2[i].getBuffer();
                    if (!buffer.isDirect() || !buffer2.isDirect()) {
                        throw new IllegalArgumentException("Source and destination ByteBuffers must be direct byteBuffer!");
                    } else if (planes[i].getPixelStride() == planes2[i].getPixelStride()) {
                        int position = buffer.position();
                        buffer.rewind();
                        buffer2.rewind();
                        if (rowStride == rowStride2) {
                            buffer2.put(buffer);
                        } else {
                            int position2 = buffer.position();
                            int position3 = buffer2.position();
                            Size effectivePlaneSizeForImage = getEffectivePlaneSizeForImage(image, i);
                            int width = effectivePlaneSizeForImage.getWidth() * planes[i].getPixelStride();
                            int i2 = position3;
                            position3 = position2;
                            for (position2 = 0; position2 < effectivePlaneSizeForImage.getHeight(); position2++) {
                                if (position2 == effectivePlaneSizeForImage.getHeight() - 1) {
                                    int remaining = buffer.remaining() - position3;
                                    if (width > remaining) {
                                        width = remaining;
                                    }
                                }
                                directByteBufferCopy(buffer, position3, buffer2, i2, width);
                                position3 += rowStride;
                                i2 += rowStride2;
                            }
                        }
                        buffer.position(position);
                        buffer2.rewind();
                        i++;
                    } else {
                        StringBuilder stringBuilder = new StringBuilder();
                        stringBuilder.append("Source plane image pixel stride ");
                        stringBuilder.append(planes[i].getPixelStride());
                        stringBuilder.append(" must be same as destination image pixel stride ");
                        stringBuilder.append(planes2[i].getPixelStride());
                        throw new IllegalArgumentException(stringBuilder.toString());
                    }
                }
                return;
            }
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("source image size ");
            stringBuilder2.append(size);
            stringBuilder2.append(" is different with destination image size ");
            stringBuilder2.append(size2);
            throw new IllegalArgumentException(stringBuilder2.toString());
        } else {
            throw new IllegalArgumentException("Copy of RAW_OPAQUE format has not been implemented");
        }
    }

    private static Size getEffectivePlaneSizeForImage(Image image, int i) {
        switch (image.getFormat()) {
            case 1:
            case 2:
            case 3:
            case 4:
            case 20:
            case 32:
            case 37:
            case 38:
            case 256:
                return new Size(image.getWidth(), image.getHeight());
            case 16:
                if (i == 0) {
                    return new Size(image.getWidth(), image.getHeight());
                }
                return new Size(image.getWidth(), image.getHeight() / 2);
            case 17:
            case 35:
            case 842094169:
                if (i == 0) {
                    return new Size(image.getWidth(), image.getHeight());
                }
                return new Size(image.getWidth() / 2, image.getHeight() / 2);
            case 34:
                return new Size(0, 0);
            default:
                throw new UnsupportedOperationException(String.format("Invalid image format %d", new Object[]{Integer.valueOf(image.getFormat())}));
        }
    }

    private static void directByteBufferCopy(ByteBuffer byteBuffer, int i, ByteBuffer byteBuffer2, int i2, int i3) {
        Memory.memmove(byteBuffer2, i2, byteBuffer, i, (long) i3);
    }

    /* JADX WARNING: Removed duplicated region for block: B:23:0x00e7 A:{SYNTHETIC, Splitter: B:23:0x00e7} */
    /* JADX WARNING: Removed duplicated region for block: B:27:0x00f2 A:{SYNTHETIC, Splitter: B:27:0x00f2} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static boolean dumpYuvImage(Image image, String str) {
        Throwable e;
        Log.d(TAG, "dumpYuvImage start");
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("sdcard/DCIM/Camera/");
        stringBuilder.append(str);
        stringBuilder.append("_");
        stringBuilder.append(image.getWidth());
        stringBuilder.append("x");
        stringBuilder.append(image.getHeight());
        str = stringBuilder.toString();
        int format = image.getFormat();
        boolean z = false;
        if (format == 17 || format == 35) {
            FileOutputStream fileOutputStream = null;
            try {
                StringBuilder stringBuilder2 = new StringBuilder();
                stringBuilder2.append(str);
                stringBuilder2.append(".yuv");
                FileOutputStream fileOutputStream2 = new FileOutputStream(stringBuilder2.toString());
                try {
                    ByteBuffer buffer = image.getPlanes()[0].getBuffer();
                    ByteBuffer buffer2 = image.getPlanes()[2].getBuffer();
                    int limit = buffer.limit();
                    int limit2 = buffer2.limit();
                    String str2 = TAG;
                    StringBuilder stringBuilder3 = new StringBuilder();
                    stringBuilder3.append("dumpingYuvImage: size=");
                    stringBuilder3.append(image.getWidth());
                    stringBuilder3.append("x");
                    stringBuilder3.append(image.getHeight());
                    stringBuilder3.append(" stride=");
                    stringBuilder3.append(image.getPlanes()[2].getRowStride());
                    Log.d(str2, stringBuilder3.toString());
                    byte[] bArr = new byte[(limit + limit2)];
                    buffer.get(bArr, 0, limit);
                    buffer2.get(bArr, limit, limit2);
                    fileOutputStream2.write(bArr);
                    buffer.rewind();
                    buffer2.rewind();
                    z = true;
                    try {
                        fileOutputStream2.flush();
                        fileOutputStream2.close();
                    } catch (Throwable e2) {
                        Log.e(TAG, "Failed to flush/close stream", e2);
                    }
                } catch (Exception e3) {
                    e2 = e3;
                    fileOutputStream = fileOutputStream2;
                    try {
                        Log.e(TAG, "Failed to write image", e2);
                        if (fileOutputStream != null) {
                        }
                        return z;
                    } catch (Throwable th) {
                        e2 = th;
                        fileOutputStream2 = fileOutputStream;
                        if (fileOutputStream2 != null) {
                            try {
                                fileOutputStream2.flush();
                                fileOutputStream2.close();
                            } catch (Throwable e4) {
                                Log.e(TAG, "Failed to flush/close stream", e4);
                            }
                        }
                        throw e2;
                    }
                } catch (Throwable th2) {
                    e2 = th2;
                    if (fileOutputStream2 != null) {
                    }
                    throw e2;
                }
            } catch (Exception e5) {
                e2 = e5;
                Log.e(TAG, "Failed to write image", e2);
                if (fileOutputStream != null) {
                    fileOutputStream.flush();
                    fileOutputStream.close();
                }
                return z;
            }
        }
        return z;
    }

    public static byte[] getFirstPlane(Image image) {
        Plane[] planes = image.getPlanes();
        if (planes.length <= 0) {
            return null;
        }
        ByteBuffer buffer = planes[0].getBuffer();
        byte[] bArr = new byte[buffer.remaining()];
        buffer.get(bArr);
        return bArr;
    }

    public static ByteBuffer removePadding(Plane plane, int i, int i2) {
        long currentTimeMillis = System.currentTimeMillis();
        ByteBuffer buffer = plane.getBuffer();
        int rowStride = plane.getRowStride();
        int pixelStride = plane.getPixelStride();
        String str = TAG;
        r7 = new Object[4];
        int i3 = 0;
        r7[0] = Integer.valueOf(rowStride);
        r7[1] = Integer.valueOf(pixelStride);
        r7[2] = Integer.valueOf(i);
        r7[3] = Integer.valueOf(i2);
        Log.d(str, String.format(Locale.ENGLISH, "removePadding: rowStride=%d pixelStride=%d size=%dx%d", r7));
        i *= pixelStride;
        if (rowStride == i) {
            return buffer;
        }
        pixelStride = i * i2;
        ByteBuffer allocateDirect = ByteBuffer.allocateDirect(pixelStride);
        int position = buffer.position();
        int position2 = allocateDirect.position();
        while (i3 < i2) {
            if (i3 == i2 - 1) {
                int remaining = buffer.remaining() - position;
                if (i > remaining) {
                    String str2 = TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("removePadding: ");
                    stringBuilder.append(remaining);
                    stringBuilder.append("/");
                    stringBuilder.append(i);
                    Log.d(str2, stringBuilder.toString());
                    i = remaining;
                }
            }
            directByteBufferCopy(buffer, position, allocateDirect, position2, i);
            position += rowStride;
            position2 += i;
            i3++;
        }
        if (position2 < pixelStride) {
            String str3 = TAG;
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("removePadding: add data: ");
            stringBuilder2.append(position2);
            stringBuilder2.append("|");
            stringBuilder2.append(pixelStride);
            Log.d(str3, stringBuilder2.toString());
            while (position2 < pixelStride) {
                allocateDirect.put(position2, allocateDirect.get(position2 - 2));
                position2++;
            }
        }
        String str4 = TAG;
        StringBuilder stringBuilder3 = new StringBuilder();
        stringBuilder3.append("removePadding: cost=");
        stringBuilder3.append(System.currentTimeMillis() - currentTimeMillis);
        Log.v(str4, stringBuilder3.toString());
        return allocateDirect;
    }

    private static void updateImagePlane(Plane plane, int i, int i2, byte[] bArr, int i3) {
        ByteBuffer buffer = plane.getBuffer();
        buffer.rewind();
        int rowStride = plane.getRowStride();
        int pixelStride = plane.getPixelStride();
        int i4 = i * pixelStride;
        String str = TAG;
        r6 = new Object[6];
        int i5 = 0;
        r6[0] = Integer.valueOf(i);
        r6[1] = Integer.valueOf(i2);
        r6[2] = Integer.valueOf(i3);
        r6[3] = Integer.valueOf(bArr.length);
        r6[4] = Integer.valueOf(rowStride);
        r6[5] = Integer.valueOf(pixelStride);
        Log.d(str, String.format(Locale.ENGLISH, "updateImagePlane: size=%dx%d offset=%d length=%d rowStride=%d pixelStride=%d", r6));
        pixelStride = i4 * i2;
        if (bArr.length - i3 >= pixelStride) {
            if (rowStride == i4) {
                pixelStride = Math.min(buffer.remaining(), pixelStride);
                String str2 = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("updateImagePlane: ");
                stringBuilder.append(pixelStride);
                Log.d(str2, stringBuilder.toString());
                buffer.put(bArr, i3, pixelStride);
            } else {
                pixelStride = buffer.position();
                i = i4;
                while (i5 < i2) {
                    buffer.position(pixelStride);
                    if (i5 == i2 - 1) {
                        i = Math.min(buffer.remaining(), i4);
                        if (i < i4) {
                            str = TAG;
                            StringBuilder stringBuilder2 = new StringBuilder();
                            stringBuilder2.append("updateImagePlane: ");
                            stringBuilder2.append(i);
                            stringBuilder2.append("/");
                            stringBuilder2.append(i4);
                            Log.d(str, stringBuilder2.toString());
                            i = buffer.remaining();
                        }
                    }
                    buffer.put(bArr, i3, i);
                    i3 += i4;
                    pixelStride += rowStride;
                    i5++;
                }
            }
            buffer.rewind();
            return;
        }
        throw new RuntimeException(String.format(Locale.ENGLISH, "buffer size should be at least %d but actual size is %d", new Object[]{Integer.valueOf(pixelStride), Integer.valueOf(i)}));
    }

    public static void updateYuvImage(Image image, byte[] bArr) {
        if (image == null || 35 != image.getFormat()) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("updateYuvImage: ");
            stringBuilder.append(image);
            Log.e(str, stringBuilder.toString());
            return;
        }
        Plane[] planes = image.getPlanes();
        updateImagePlane(planes[0], image.getWidth(), image.getHeight(), bArr, 0);
        updateImagePlane(planes[1], image.getWidth() / 2, image.getHeight() / 2, bArr, image.getWidth() * image.getHeight());
    }
}
