package com.arcsoft.avatar.d;

import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.Bitmap.Config;
import android.media.Image;
import android.media.Image.Plane;
import android.support.annotation.NonNull;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.Buffer;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;

/* compiled from: AsvloffscreenUtil */
public class d {
    static String a = d.class.getSimpleName();

    public static int a(a aVar, File file) {
        IOException e;
        Throwable th;
        if (aVar == null || aVar.N() == null || file == null) {
            return 2;
        }
        Buffer wrap = ByteBuffer.wrap(aVar.N());
        Bitmap createBitmap = Bitmap.createBitmap(aVar.getWidth(), aVar.getHeight(), Config.ARGB_8888);
        createBitmap.copyPixelsFromBuffer(wrap);
        FileOutputStream fileOutputStream = null;
        try {
            OutputStream fileOutputStream2 = new FileOutputStream(file);
            try {
                createBitmap.compress(CompressFormat.JPEG, 90, fileOutputStream2);
                try {
                    fileOutputStream2.close();
                } catch (IOException e2) {
                    e2.printStackTrace();
                }
                return 0;
            } catch (IOException e3) {
                e2 = e3;
                fileOutputStream = fileOutputStream2;
                try {
                    e2.printStackTrace();
                    try {
                        fileOutputStream.close();
                    } catch (IOException e22) {
                        e22.printStackTrace();
                    }
                    return 2;
                } catch (Throwable th2) {
                    th = th2;
                }
            } catch (Throwable th3) {
                th = th3;
                fileOutputStream = fileOutputStream2;
                try {
                    fileOutputStream.close();
                } catch (IOException e4) {
                    e4.printStackTrace();
                }
                throw th;
            }
        } catch (IOException e5) {
            e22 = e5;
            e22.printStackTrace();
            fileOutputStream.close();
            return 2;
        }
    }

    public static a a(Image image) {
        if (image == null) {
            return null;
        }
        int width = image.getWidth();
        int height = image.getHeight();
        Plane[] planes = image.getPlanes();
        if (planes.length < 3) {
            return null;
        }
        int i = 0;
        Plane plane = planes[0];
        Plane plane2 = planes[1];
        Plane plane3 = planes[2];
        int rowStride = plane.getRowStride();
        int height2 = image.getHeight();
        ByteBuffer buffer = planes[0].getBuffer();
        ByteBuffer buffer2 = planes[2].getBuffer();
        rowStride *= height2;
        byte[] bArr = new byte[rowStride];
        byte[] bArr2 = new byte[(rowStride >> 1)];
        buffer.get(bArr, 0, buffer.remaining());
        buffer2.get(bArr2, 0, buffer2.remaining());
        int[] iArr = new int[planes.length];
        while (i < planes.length) {
            iArr[i] = planes[i].getRowStride();
            i++;
        }
        return new a(bArr, bArr2, iArr, width, height);
    }

    public static a a(@NonNull byte[] bArr) {
        return null;
    }

    public static a b(Bitmap bitmap) {
        if (bitmap == null || bitmap.isRecycled() || !bitmap.hasAlpha()) {
            return null;
        }
        int width = bitmap.getWidth();
        int height = bitmap.getHeight();
        Buffer order = ByteBuffer.allocate(bitmap.getRowBytes() * bitmap.getHeight()).order(ByteOrder.nativeOrder());
        bitmap.copyPixelsToBuffer(order);
        return new a(width, height, order.array());
    }

    public static a b(Image image) {
        if (image == null) {
            return null;
        }
        int width = image.getWidth();
        int height = image.getHeight();
        Plane[] planes = image.getPlanes();
        if (planes.length < 3) {
            return null;
        }
        Plane plane = planes[0];
        Plane plane2 = planes[1];
        Plane plane3 = planes[2];
        int rowStride = plane.getRowStride();
        int height2 = image.getHeight();
        ByteBuffer buffer = planes[0].getBuffer();
        ByteBuffer buffer2 = planes[2].getBuffer();
        rowStride *= height2;
        byte[] bArr = new byte[((rowStride * 3) >> 1)];
        buffer.get(bArr, 0, buffer.remaining());
        buffer2.get(bArr, rowStride, buffer2.remaining());
        int[] iArr = new int[planes.length];
        for (int i = 0; i < planes.length; i++) {
            iArr[i] = planes[i].getRowStride();
        }
        return new a(bArr, iArr[0], width, height);
    }
}
