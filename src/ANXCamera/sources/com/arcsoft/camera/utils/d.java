package com.arcsoft.camera.utils;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.BitmapFactory;
import android.graphics.ImageFormat;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.YuvImage;
import android.hardware.camera2.CameraCharacteristics;
import android.media.Image;
import android.media.Image.Plane;
import android.net.Uri;
import android.text.TextUtils;
import android.util.SizeF;
import android.webkit.MimeTypeMap;
import com.android.camera.storage.Storage;
import com.ss.android.ugc.effectmanager.effect.model.ComposerHelper;
import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.ByteBuffer;
import java.util.Properties;

/* compiled from: ToolUtil */
public class d {
    public static final int COLOR_FormatI420 = 1;
    public static final int COLOR_FormatNV21 = 2;

    /* JADX WARNING: Removed duplicated region for block: B:24:0x0030 A:{SYNTHETIC, Splitter: B:24:0x0030} */
    /* JADX WARNING: Removed duplicated region for block: B:28:0x0037 A:{SYNTHETIC, Splitter: B:28:0x0037} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static int a(String str, byte[] bArr) {
        Exception e;
        Throwable th;
        int i = -1;
        if (TextUtils.isEmpty(str) || bArr == null || bArr.length <= 0) {
            return -1;
        }
        FileOutputStream fileOutputStream = null;
        try {
            FileOutputStream fileOutputStream2 = new FileOutputStream(str);
            try {
                fileOutputStream2.write(bArr);
                i = 0;
            } catch (Exception e2) {
                e = e2;
                fileOutputStream = fileOutputStream2;
                try {
                    e.printStackTrace();
                    if (fileOutputStream != null) {
                    }
                    return i;
                } catch (Throwable th2) {
                    th = th2;
                    if (fileOutputStream != null) {
                        try {
                            fileOutputStream.close();
                        } catch (IOException e3) {
                            e3.printStackTrace();
                        }
                    }
                    throw th;
                }
            } catch (Throwable th3) {
                th = th3;
                fileOutputStream = fileOutputStream2;
                if (fileOutputStream != null) {
                }
                throw th;
            }
            try {
                fileOutputStream2.close();
            } catch (IOException e4) {
                e4.printStackTrace();
            }
        } catch (Exception e5) {
            e = e5;
            e.printStackTrace();
            if (fileOutputStream != null) {
                fileOutputStream.close();
            }
            return i;
        }
        return i;
    }

    public static Bitmap a(Bitmap bitmap, float f) {
        if (bitmap == null) {
            return null;
        }
        int width = bitmap.getWidth();
        int height = bitmap.getHeight();
        Matrix matrix = new Matrix();
        matrix.preScale(f, f);
        matrix.setRotate(180.0f);
        Bitmap createBitmap = Bitmap.createBitmap(bitmap, 0, 0, width, height, matrix, false);
        if (createBitmap.equals(bitmap)) {
            return createBitmap;
        }
        bitmap.recycle();
        return createBitmap;
    }

    public static Bitmap a(byte[] bArr, int i, int i2) {
        Bitmap decodeByteArray;
        Exception e;
        try {
            YuvImage yuvImage = new YuvImage(bArr, 17, i, i2, null);
            OutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            yuvImage.compressToJpeg(new Rect(0, 0, i, i2), 90, byteArrayOutputStream);
            decodeByteArray = BitmapFactory.decodeByteArray(byteArrayOutputStream.toByteArray(), 0, byteArrayOutputStream.size());
            try {
                byteArrayOutputStream.close();
            } catch (Exception e2) {
                e = e2;
            }
        } catch (Exception e3) {
            e = e3;
            decodeByteArray = null;
            e.printStackTrace();
            return decodeByteArray;
        }
        return decodeByteArray;
    }

    public static String a(Context context, Uri uri) {
        if (uri.getScheme() == null) {
            return null;
        }
        if (uri.getScheme().equals(ComposerHelper.COMPOSER_CONTENT)) {
            return context.getContentResolver().getType(uri);
        }
        if (!uri.getScheme().equals(ComposerHelper.COMPOSER_PATH)) {
            return null;
        }
        String toLowerCase = MimeTypeMap.getFileExtensionFromUrl(uri.getPath()).toLowerCase();
        return toLowerCase != null ? MimeTypeMap.getSingleton().getMimeTypeFromExtension(toLowerCase) : null;
    }

    public static void a(String str, Bitmap bitmap) {
        File file = new File(str);
        if (file.exists()) {
            file.delete();
        }
        try {
            OutputStream fileOutputStream = new FileOutputStream(file);
            bitmap.compress(CompressFormat.PNG, 90, fileOutputStream);
            fileOutputStream.flush();
            fileOutputStream.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e2) {
            e2.printStackTrace();
        }
    }

    public static boolean a(String str, String str2, byte[] bArr) {
        boolean z = false;
        if (str2 == null || bArr == null) {
            return false;
        }
        File file = new File(str);
        if (!file.exists()) {
            file.mkdir();
        }
        File file2 = new File(str2);
        int i = 0;
        while (file2.exists()) {
            i++;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(str2);
            stringBuilder.append(i);
            file2 = new File(stringBuilder.toString());
        }
        try {
            FileOutputStream fileOutputStream = new FileOutputStream(str2);
            fileOutputStream.write(bArr);
            fileOutputStream.close();
            z = true;
        } catch (FileNotFoundException e) {
        } catch (IOException e2) {
        }
        return z;
    }

    /* JADX WARNING: Removed duplicated region for block: B:28:0x0038 A:{SYNTHETIC, Splitter: B:28:0x0038} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static int b(String str, byte[] bArr) {
        Exception e;
        Throwable th;
        if (TextUtils.isEmpty(str) || bArr == null) {
            return -1;
        }
        FileOutputStream fileOutputStream = null;
        try {
            FileOutputStream fileOutputStream2 = new FileOutputStream(str);
            try {
                fileOutputStream2.write(bArr);
                try {
                    fileOutputStream2.close();
                } catch (IOException e2) {
                    e2.printStackTrace();
                }
                return 0;
            } catch (Exception e3) {
                e = e3;
                fileOutputStream = fileOutputStream2;
            } catch (Throwable th2) {
                th = th2;
                fileOutputStream = fileOutputStream2;
                if (fileOutputStream != null) {
                }
                throw th;
            }
        } catch (Exception e4) {
            e = e4;
            try {
                e.printStackTrace();
                if (fileOutputStream != null) {
                    try {
                        fileOutputStream.close();
                    } catch (IOException e22) {
                        e22.printStackTrace();
                    }
                }
                return 0;
            } catch (Throwable th3) {
                th = th3;
                if (fileOutputStream != null) {
                    try {
                        fileOutputStream.close();
                    } catch (IOException e5) {
                        e5.printStackTrace();
                    }
                }
                throw th;
            }
        }
    }

    public static byte[] b(byte[] bArr, int i, int i2) {
        try {
            YuvImage yuvImage = new YuvImage(bArr, 17, i, i2, null);
            OutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            yuvImage.compressToJpeg(new Rect(0, 0, i, i2), 100, byteArrayOutputStream);
            byte[] toByteArray = byteArrayOutputStream.toByteArray();
            byteArrayOutputStream.close();
            return toByteArray;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static boolean c(Image image) {
        int format = image.getFormat();
        return format == 17 || format == 35 || format == 842094169;
    }

    public static SizeF getAngleValue(CameraCharacteristics cameraCharacteristics) {
        SizeF sizeF = (SizeF) cameraCharacteristics.get(CameraCharacteristics.SENSOR_INFO_PHYSICAL_SIZE);
        float[] fArr = (float[]) cameraCharacteristics.get(CameraCharacteristics.LENS_INFO_AVAILABLE_FOCAL_LENGTHS);
        return (fArr == null || fArr.length <= 0) ? null : new SizeF((float) Math.toDegrees(StrictMath.atan((double) (sizeF.getWidth() / (fArr[0] * 2.0f))) * 2.0d), (float) Math.toDegrees(2.0d * StrictMath.atan((double) (sizeF.getHeight() / (2.0f * fArr[0])))));
    }

    /* JADX WARNING: Missing block: B:17:0x0060, code:
            r12 = r8;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static byte[] getDataFromImage(Image image, int i) {
        int i2 = i;
        int i3 = 2;
        int i4 = 1;
        if (i2 != 1 && i2 != 2) {
            throw new IllegalArgumentException("only support COLOR_FormatI420 and COLOR_FormatNV21");
        } else if (c(image)) {
            Rect cropRect = image.getCropRect();
            int format = image.getFormat();
            int width = cropRect.width();
            int height = cropRect.height();
            Plane[] planes = image.getPlanes();
            int i5 = width * height;
            byte[] bArr = new byte[((ImageFormat.getBitsPerPixel(format) * i5) / 8)];
            int i6 = 0;
            byte[] bArr2 = new byte[planes[0].getRowStride()];
            int i7 = 1;
            int i8 = 0;
            int i9 = i8;
            while (i8 < planes.length) {
                Rect rect;
                switch (i8) {
                    case 0:
                        i7 = i4;
                        i9 = i6;
                        break;
                    case 1:
                        if (i2 != i4) {
                            if (i2 == i3) {
                                i9 = i5 + 1;
                                i7 = i3;
                                break;
                            }
                        }
                        i7 = i4;
                        break;
                    case 2:
                        if (i2 == i4) {
                            i9 = (int) (((double) i5) * 1.25d);
                            i7 = i4;
                            break;
                        } else if (i2 == i3) {
                            i7 = i3;
                        }
                        break;
                }
                ByteBuffer buffer = planes[i8].getBuffer();
                int rowStride = planes[i8].getRowStride();
                i3 = planes[i8].getPixelStride();
                int i10 = i8 == 0 ? i6 : i4;
                i6 = width >> i10;
                i4 = height >> i10;
                int i11 = width;
                buffer.position(((cropRect.top >> i10) * rowStride) + ((cropRect.left >> i10) * i3));
                i2 = 0;
                while (i2 < i4) {
                    if (i3 == 1 && i7 == 1) {
                        buffer.get(bArr, i9, i6);
                        i9 += i6;
                        rect = cropRect;
                        width = i6;
                    } else {
                        width = ((i6 - 1) * i3) + 1;
                        rect = cropRect;
                        buffer.get(bArr2, 0, width);
                        int i12 = i9;
                        for (i9 = 0; i9 < i6; i9++) {
                            bArr[i12] = bArr2[i9 * i3];
                            i12 += i7;
                        }
                        i9 = i12;
                    }
                    if (i2 < i4 - 1) {
                        buffer.position((buffer.position() + rowStride) - width);
                    }
                    i2++;
                    cropRect = rect;
                }
                rect = cropRect;
                i8++;
                i4 = 1;
                width = i11;
                i2 = i;
                i3 = 2;
                i6 = 0;
            }
            return bArr;
        } else {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("can't convert Image to byte array, format ");
            stringBuilder.append(image.getFormat());
            throw new UnsupportedOperationException(stringBuilder.toString());
        }
    }

    public static String k(String str, String str2) {
        String str3 = "";
        if (TextUtils.isEmpty(str) || TextUtils.isEmpty(str2)) {
            return str3;
        }
        File file = new File(str);
        if (!file.exists()) {
            file.getParentFile().mkdirs();
            file.mkdirs();
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(str);
        stringBuilder.append(File.separator);
        stringBuilder.append(str2);
        stringBuilder.append(Storage.JPEG_SUFFIX);
        str3 = stringBuilder.toString();
        int i = 0;
        File file2 = new File(str3);
        while (file2.exists()) {
            i++;
            stringBuilder = new StringBuilder();
            stringBuilder.append(str2);
            stringBuilder.append("_");
            stringBuilder.append(i);
            str2 = stringBuilder.toString();
            stringBuilder = new StringBuilder();
            stringBuilder.append(str);
            stringBuilder.append(File.separator);
            stringBuilder.append(str2);
            stringBuilder.append(Storage.JPEG_SUFFIX);
            str3 = stringBuilder.toString();
            file2 = new File(str3);
        }
        return str3;
    }

    public static String l(String str, String str2) {
        Exception e;
        Properties properties = new Properties();
        try {
            properties.load(new BufferedInputStream(new FileInputStream(str)));
            str = properties.getProperty(str2);
            try {
                return TextUtils.isEmpty(str) ? null : str;
            } catch (Exception e2) {
                e = e2;
                e.printStackTrace();
                return str;
            }
        } catch (Exception e3) {
            e = e3;
            str = null;
            e.printStackTrace();
            return str;
        }
    }

    public static Bitmap rotateBitmap(Bitmap bitmap, int i, boolean z) {
        if (i == 0 || bitmap == null) {
            return bitmap;
        }
        int width = bitmap.getWidth();
        int height = bitmap.getHeight();
        Matrix matrix = new Matrix();
        matrix.setRotate((float) i, ((float) width) / 2.0f, ((float) height) / 2.0f);
        try {
            Bitmap createBitmap = Bitmap.createBitmap(bitmap, 0, 0, width, height, matrix, true);
            if (bitmap != createBitmap) {
                if (z) {
                    bitmap.recycle();
                }
                bitmap = createBitmap;
            }
        } catch (OutOfMemoryError e) {
        }
        return bitmap;
    }

    public static Bitmap scaleBitmap(Bitmap bitmap, int i, int i2) {
        if (bitmap == null) {
            return null;
        }
        int height = bitmap.getHeight();
        int width = bitmap.getWidth();
        float f = ((float) i) / ((float) width);
        float f2 = ((float) i2) / ((float) height);
        Matrix matrix = new Matrix();
        matrix.postScale(f, f2);
        Bitmap createBitmap = Bitmap.createBitmap(bitmap, 0, 0, width, height, matrix, false);
        if (!bitmap.isRecycled()) {
            bitmap.recycle();
        }
        return createBitmap;
    }
}
