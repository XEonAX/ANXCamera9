package com.xiaomi.camera.imagecodec;

import android.graphics.Rect;
import android.media.Image;
import android.util.Log;
import android.util.Size;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.Locale;

public class MiImage {
    private static final String TAG = MiImage.class.getSimpleName();
    private Rect mCropRect;
    private int mFormat = -1;
    private int mHeight = -1;
    private Plane[] mPlanes;
    private long mTimeStamp;
    private int mWidth = -1;

    public class Plane {
        private ByteBuffer mBuffer;
        private final int mPixelStride;
        private final int mRowStride;

        public Plane(int i, int i2, ByteBuffer byteBuffer) {
            this.mRowStride = i;
            this.mPixelStride = i2;
            this.mBuffer = byteBuffer;
            this.mBuffer.order(ByteOrder.nativeOrder());
        }

        public int getRowStride() {
            return this.mRowStride;
        }

        public int getPixelStride() {
            return this.mPixelStride;
        }

        public ByteBuffer getBuffer() {
            return this.mBuffer;
        }

        private void clearBuffer() {
            if (this.mBuffer != null) {
                this.mBuffer = null;
            }
        }
    }

    public MiImage(Image image) {
        this.mFormat = image.getFormat();
        this.mWidth = image.getWidth();
        this.mHeight = image.getHeight();
        this.mCropRect = image.getCropRect();
        this.mTimeStamp = image.getTimestamp();
        android.media.Image.Plane[] planes = image.getPlanes();
        int length = planes.length;
        this.mPlanes = new Plane[length];
        for (int i = 0; i < length; i++) {
            this.mPlanes[i] = new Plane(getEffectivePlaneSizeForImage(i).getWidth() * planes[i].getPixelStride(), planes[i].getPixelStride(), ByteBuffer.allocate(planes[i].getBuffer().limit()));
        }
        fromImage(image);
    }

    private void fromImage(Image image) {
        long j;
        StringBuilder stringBuilder;
        long currentTimeMillis = System.currentTimeMillis();
        android.media.Image.Plane[] planes = image.getPlanes();
        Plane[] planes2 = getPlanes();
        int i = 0;
        while (i < planes2.length) {
            int rowStride = planes[i].getRowStride();
            int rowStride2 = planes2[i].getRowStride();
            ByteBuffer buffer = planes[i].getBuffer();
            ByteBuffer buffer2 = planes2[i].getBuffer();
            Plane[] planeArr;
            android.media.Image.Plane[] planeArr2;
            int i2;
            if (planes[i].getPixelStride() == planes2[i].getPixelStride()) {
                int position = buffer.position();
                buffer.rewind();
                buffer2.rewind();
                if (rowStride != rowStride2) {
                    int position2 = buffer.position();
                    int position3 = buffer2.position();
                    Size effectivePlaneSizeForImage = getEffectivePlaneSizeForImage(i);
                    int width = effectivePlaneSizeForImage.getWidth() * planes[i].getPixelStride();
                    byte[] bArr = new byte[width];
                    int i3 = width;
                    width = position3;
                    position3 = position2;
                    position2 = 0;
                    while (true) {
                        j = currentTimeMillis;
                        if (position2 >= effectivePlaneSizeForImage.getHeight()) {
                            break;
                        }
                        Size size;
                        buffer.position(position3);
                        buffer2.position(width);
                        if (position2 == effectivePlaneSizeForImage.getHeight() - 1) {
                            int remaining = buffer.remaining();
                            if (i3 > remaining) {
                                size = effectivePlaneSizeForImage;
                                planeArr = planes2;
                                planeArr2 = planes;
                                Log.d(TAG, String.format(Locale.ENGLISH, "srcPlane[%d].remain=%d", new Object[]{Integer.valueOf(i), Integer.valueOf(remaining)}));
                                i3 = remaining;
                            } else {
                                planeArr2 = planes;
                                planeArr = planes2;
                                size = effectivePlaneSizeForImage;
                            }
                            remaining = buffer2.remaining();
                            if (i3 > remaining) {
                                String str = TAG;
                                Object[] objArr = new Object[2];
                                Integer valueOf = Integer.valueOf(i);
                                i2 = i;
                                i = 0;
                                objArr[0] = valueOf;
                                objArr[1] = Integer.valueOf(remaining);
                                Log.d(str, String.format(Locale.ENGLISH, "dstPlane[%d].remain=%d", objArr));
                                i3 = remaining;
                                buffer.get(bArr, i, i3);
                                buffer2.put(bArr, i, i3);
                                position3 += rowStride;
                                width += rowStride2;
                                position2++;
                                currentTimeMillis = j;
                                effectivePlaneSizeForImage = size;
                                planes2 = planeArr;
                                planes = planeArr2;
                                i = i2;
                            } else {
                                i2 = i;
                            }
                        } else {
                            planeArr2 = planes;
                            planeArr = planes2;
                            i2 = i;
                            size = effectivePlaneSizeForImage;
                        }
                        i = 0;
                        buffer.get(bArr, i, i3);
                        buffer2.put(bArr, i, i3);
                        position3 += rowStride;
                        width += rowStride2;
                        position2++;
                        currentTimeMillis = j;
                        effectivePlaneSizeForImage = size;
                        planes2 = planeArr;
                        planes = planeArr2;
                        i = i2;
                    }
                } else {
                    buffer2.put(buffer);
                    j = currentTimeMillis;
                }
                planeArr2 = planes;
                planeArr = planes2;
                i2 = i;
                buffer.position(position);
                buffer2.rewind();
                i = i2 + 1;
                currentTimeMillis = j;
                planes2 = planeArr;
                planes = planeArr2;
            } else {
                planeArr2 = planes;
                planeArr = planes2;
                i2 = i;
                stringBuilder = new StringBuilder();
                stringBuilder.append("source plane image pixel stride ");
                stringBuilder.append(planeArr2[i2].getPixelStride());
                stringBuilder.append(" must be same as destination image pixel stride ");
                stringBuilder.append(planeArr[i2].getPixelStride());
                throw new IllegalArgumentException(stringBuilder.toString());
            }
        }
        j = currentTimeMillis;
        String str2 = TAG;
        stringBuilder = new StringBuilder();
        stringBuilder.append("fromImage: cost=");
        stringBuilder.append(System.currentTimeMillis() - j);
        Log.d(str2, stringBuilder.toString());
    }

    public int getFormat() {
        return this.mFormat;
    }

    public int getWidth() {
        return this.mWidth;
    }

    public int getHeight() {
        return this.mHeight;
    }

    public Plane[] getPlanes() {
        return this.mPlanes;
    }

    public void close() {
        if (this.mPlanes != null) {
            for (int i = 0; i < this.mPlanes.length; i++) {
                if (this.mPlanes[i] != null) {
                    this.mPlanes[i].clearBuffer();
                    this.mPlanes[i] = null;
                }
            }
        }
    }

    public void toImage(Image image) {
        if (getFormat() == image.getFormat()) {
            Size size = new Size(getWidth(), getHeight());
            Size size2 = new Size(image.getWidth(), image.getHeight());
            if (size.equals(size2)) {
                long j;
                StringBuilder stringBuilder;
                long currentTimeMillis = System.currentTimeMillis();
                Plane[] planes = getPlanes();
                android.media.Image.Plane[] planes2 = image.getPlanes();
                int i = 1;
                int length = planes.length - 1;
                while (length >= 0) {
                    int rowStride = planes[length].getRowStride();
                    int rowStride2 = planes2[length].getRowStride();
                    ByteBuffer buffer = planes[length].getBuffer();
                    ByteBuffer buffer2 = planes2[length].getBuffer();
                    Plane[] planeArr;
                    android.media.Image.Plane[] planeArr2;
                    int i2;
                    if (planes[length].getPixelStride() == planes2[length].getPixelStride()) {
                        int i3;
                        int position = buffer.position();
                        buffer.rewind();
                        buffer2.rewind();
                        if (rowStride == rowStride2) {
                            buffer2.put(buffer);
                            j = currentTimeMillis;
                            planeArr = planes;
                            planeArr2 = planes2;
                            i2 = length;
                            i3 = i;
                        } else {
                            int position2 = buffer.position();
                            int position3 = buffer2.position();
                            Size effectivePlaneSizeForImage = getEffectivePlaneSizeForImage(length);
                            int width = effectivePlaneSizeForImage.getWidth() * planes[length].getPixelStride();
                            byte[] bArr = new byte[width];
                            int i4 = position2;
                            position2 = position3;
                            int i5 = width;
                            width = i4;
                            position3 = 0;
                            while (true) {
                                j = currentTimeMillis;
                                if (position3 >= effectivePlaneSizeForImage.getHeight()) {
                                    break;
                                }
                                Size size3;
                                buffer.position(width);
                                buffer2.position(position2);
                                if (position3 == effectivePlaneSizeForImage.getHeight() - 1) {
                                    int remaining = buffer.remaining();
                                    if (i5 > remaining) {
                                        size3 = effectivePlaneSizeForImage;
                                        planeArr2 = planes2;
                                        planeArr = planes;
                                        Log.d(TAG, String.format(Locale.ENGLISH, "srcPlane[%d].remain=%d", new Object[]{Integer.valueOf(length), Integer.valueOf(remaining)}));
                                        i5 = remaining;
                                    } else {
                                        planeArr = planes;
                                        planeArr2 = planes2;
                                        size3 = effectivePlaneSizeForImage;
                                    }
                                    remaining = buffer2.remaining();
                                    if (i5 > remaining) {
                                        String str = TAG;
                                        Object[] objArr = new Object[2];
                                        Integer valueOf = Integer.valueOf(length);
                                        i2 = length;
                                        length = 0;
                                        objArr[0] = valueOf;
                                        objArr[1] = Integer.valueOf(remaining);
                                        Log.d(str, String.format(Locale.ENGLISH, "dstPlane[%d].remain=%d", objArr));
                                        i5 = remaining;
                                        buffer.get(bArr, length, i5);
                                        buffer2.put(bArr, length, i5);
                                        width += rowStride;
                                        position2 += rowStride2;
                                        position3++;
                                        currentTimeMillis = j;
                                        effectivePlaneSizeForImage = size3;
                                        planes2 = planeArr2;
                                        planes = planeArr;
                                        length = i2;
                                    } else {
                                        i2 = length;
                                    }
                                } else {
                                    planeArr = planes;
                                    planeArr2 = planes2;
                                    i2 = length;
                                    size3 = effectivePlaneSizeForImage;
                                }
                                length = 0;
                                buffer.get(bArr, length, i5);
                                buffer2.put(bArr, length, i5);
                                width += rowStride;
                                position2 += rowStride2;
                                position3++;
                                currentTimeMillis = j;
                                effectivePlaneSizeForImage = size3;
                                planes2 = planeArr2;
                                planes = planeArr;
                                length = i2;
                            }
                            planeArr = planes;
                            planeArr2 = planes2;
                            i2 = length;
                            i3 = 1;
                        }
                        buffer.position(position);
                        buffer2.rewind();
                        length = i2 - 1;
                        i = i3;
                        currentTimeMillis = j;
                        planes2 = planeArr2;
                        planes = planeArr;
                    } else {
                        planeArr = planes;
                        planeArr2 = planes2;
                        i2 = length;
                        stringBuilder = new StringBuilder();
                        stringBuilder.append("source plane image pixel stride ");
                        stringBuilder.append(planeArr[i2].getPixelStride());
                        stringBuilder.append(" must be same as destination image pixel stride ");
                        stringBuilder.append(planeArr2[i2].getPixelStride());
                        throw new IllegalArgumentException(stringBuilder.toString());
                    }
                }
                j = currentTimeMillis;
                String str2 = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("toImage: cost=");
                stringBuilder.append(System.currentTimeMillis() - j);
                Log.d(str2, stringBuilder.toString());
                return;
            }
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("source image size ");
            stringBuilder2.append(size);
            stringBuilder2.append(" is different with destination image size ");
            stringBuilder2.append(size2);
            throw new IllegalArgumentException(stringBuilder2.toString());
        }
        throw new IllegalArgumentException("src and dst images should have the same format");
    }

    private Size getEffectivePlaneSizeForImage(int i) {
        switch (getFormat()) {
            case 1:
            case 2:
            case 3:
            case 4:
            case 20:
            case 32:
            case 37:
            case 38:
            case 256:
                return new Size(getWidth(), getHeight());
            case 16:
                if (i == 0) {
                    return new Size(getWidth(), getHeight());
                }
                return new Size(getWidth(), getHeight() / 2);
            case 17:
            case 35:
            case 842094169:
                if (i == 0) {
                    return new Size(getWidth(), getHeight());
                }
                return new Size(getWidth() / 2, getHeight() / 2);
            case 34:
                return new Size(0, 0);
            default:
                throw new UnsupportedOperationException(String.format("Invalid image format %d", new Object[]{Integer.valueOf(getFormat())}));
        }
    }
}
