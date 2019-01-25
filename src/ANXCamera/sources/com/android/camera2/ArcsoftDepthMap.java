package com.android.camera2;

import android.graphics.Point;
import android.support.annotation.NonNull;
import android.util.Xml;
import com.adobe.xmp.XMPMeta;
import com.android.camera.XmpHelper;
import com.android.camera.log.Log;
import com.android.gallery3d.exif.ExifInterface;
import com.xiaomi.camera.core.PictureInfo;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.StringWriter;
import java.io.Writer;
import org.xmlpull.v1.XmlSerializer;

public class ArcsoftDepthMap {
    private static final int BLUR_LEVEL_START_ADDR = 16;
    private static final int DAPTH_MAP_START_ADDR = 152;
    private static final int DATA_LENGTH_4 = 4;
    private static final int DATA_LENGTH_START_ADDR = 148;
    private static final int HEADER_LENGTH_START_ADDR = 4;
    private static final int HEADER_START_ADDR = 0;
    private static final int POINT_X_START_ADDR = 8;
    private static final int POINT_Y_START_ADDR = 12;
    private static final String TAG = ArcsoftDepthMap.class.getSimpleName();
    @Deprecated
    public static final int TAG_DEPTH_MAP_BLUR_LEVEL = ExifInterface.defineTag(2, (short) -30575);
    @Deprecated
    public static final int TAG_DEPTH_MAP_FOCUS_POINT = ExifInterface.defineTag(2, (short) -30576);
    private byte[] mDepthMapHeader;
    private byte[] mDepthMapOriginalData;

    public ArcsoftDepthMap(byte[] bArr) {
        if (bArr != null) {
            int headerTag = getHeaderTag(bArr);
            if (headerTag == 128) {
                this.mDepthMapOriginalData = bArr;
                this.mDepthMapHeader = getDepthMapHeader();
                return;
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Illegal depth format! 0x80 != ");
            stringBuilder.append(headerTag);
            throw new IllegalArgumentException(stringBuilder.toString());
        }
        throw new IllegalArgumentException("Null depth data!");
    }

    public static boolean isDepthMapData(byte[] bArr) {
        boolean z = bArr != null && bArr.length > 4 && getHeaderTag(bArr) == 128;
        if (!z) {
            Log.e(TAG, "Illegal depth format", new RuntimeException());
        }
        return z;
    }

    public byte[] getDepthMapHeader() {
        return getBytes(this.mDepthMapOriginalData, 0, getInteger(getBytes(this.mDepthMapOriginalData, 4, 4)));
    }

    public Point getFocusPoint() {
        return new Point(getInteger(getBytes(this.mDepthMapHeader, 8, 4)), getInteger(getBytes(this.mDepthMapHeader, 12, 4)));
    }

    public int getBlurLevel() {
        return getInteger(getBytes(this.mDepthMapHeader, 16, 4));
    }

    public int getDepthMapLength() {
        return getInteger(getBytes(this.mDepthMapHeader, 148, 4));
    }

    public byte[] getDepthMapData() {
        return getBytes(this.mDepthMapOriginalData, 152, getDepthMapLength());
    }

    /* JADX WARNING: Removed duplicated region for block: B:109:0x0274 A:{Splitter: B:69:0x0227, ExcHandler: java.io.IOException (e java.io.IOException)} */
    /* JADX WARNING: Removed duplicated region for block: B:108:0x0272 A:{PHI: r10 , Splitter: B:78:0x0248, ExcHandler: java.io.IOException (e java.io.IOException)} */
    /* JADX WARNING: Missing block: B:110:0x0275, code:
            r10 = null;
     */
    /* JADX WARNING: Missing block: B:111:0x0277, code:
            com.android.camera.log.Log.d(TAG, "writePortraitExif(): Failed to insert depthmap associated xmp metadata");
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public byte[] writePortraitExif(int i, byte[] bArr, byte[] bArr2, @NonNull int[] iArr, byte[] bArr3, @NonNull int[] iArr2, int i2, boolean z, boolean z2, PictureInfo pictureInfo, int i3, int i4) {
        OutputStream byteArrayOutputStream;
        byte[] toByteArray;
        Throwable th;
        Throwable th2;
        AutoCloseable byteArrayInputStream;
        AutoCloseable byteArrayOutputStream2;
        byte[] toByteArray2;
        Throwable th3;
        Throwable th4;
        int i5 = i;
        byte[] bArr4 = bArr;
        byte[] bArr5 = bArr2;
        byte[] bArr6 = bArr3;
        int i6 = i2;
        Point focusPoint = getFocusPoint();
        int blurLevel = getBlurLevel();
        boolean isFrontCamera = pictureInfo.isFrontCamera();
        int i7 = -1;
        int i8 = 5;
        if (i5 <= 0) {
            i8 = -1;
        } else if (isFrontCamera) {
            if (pictureInfo.isAiEnabled() && pictureInfo.getAiType() == 10) {
                i7 = 70;
            } else {
                i7 = 40;
            }
        } else if (pictureInfo.isAiEnabled() && pictureInfo.getAiType() == 10) {
            i7 = 30;
        } else {
            i7 = 10;
        }
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("writePortraitExif: focusPoint: ");
        stringBuilder.append(focusPoint);
        Log.d(str, stringBuilder.toString());
        str = TAG;
        stringBuilder = new StringBuilder();
        stringBuilder.append("writePortraitExif: blurLevel: ");
        stringBuilder.append(blurLevel);
        Log.d(str, stringBuilder.toString());
        str = TAG;
        stringBuilder = new StringBuilder();
        stringBuilder.append("writePortraitExif: shineThreshold: ");
        stringBuilder.append(i8);
        Log.d(str, stringBuilder.toString());
        str = TAG;
        stringBuilder = new StringBuilder();
        stringBuilder.append("writePortraitExif: shineLevel: ");
        stringBuilder.append(i7);
        Log.d(str, stringBuilder.toString());
        str = TAG;
        stringBuilder = new StringBuilder();
        stringBuilder.append("writePortraitExif: lightingPattern: ");
        stringBuilder.append(i6);
        Log.d(str, stringBuilder.toString());
        try {
            byteArrayOutputStream = new ByteArrayOutputStream();
            try {
                ExifInterface exifInterface = new ExifInterface();
                exifInterface.readExif(bArr4);
                if (!isFrontCamera || i5 == 0) {
                    exifInterface.addDepthMapFocusPoint(focusPoint);
                }
                exifInterface.addDepthMapBlurLevel(blurLevel);
                exifInterface.addPortraitLighting(i6);
                if (bArr5 != null) {
                    exifInterface.addDulCameraWaterMark(bArr5);
                }
                if (bArr6 != null) {
                    exifInterface.addTimeWaterMark(bArr6);
                }
                if (z2) {
                    exifInterface.addFrontMirror(z);
                }
                if (i5 > 0) {
                    exifInterface.addXiaomiDepthmapVersion(i5);
                }
                exifInterface.writeExif(bArr4, byteArrayOutputStream);
                toByteArray = byteArrayOutputStream.toByteArray();
                try {
                    $closeResource(null, byteArrayOutputStream);
                } catch (IOException e) {
                }
            } catch (Throwable th5) {
                th2 = th5;
            }
        } catch (IOException e2) {
            toByteArray = null;
            Log.e(TAG, "writePortraitExif(): Failed to write depthmap associated exif metadata");
            if (toByteArray != null) {
            }
            Log.e(TAG, "writePortraitExif(): #1: return original jpeg");
            return bArr4;
        }
        if (toByteArray != null || toByteArray.length <= bArr4.length) {
            Log.e(TAG, "writePortraitExif(): #1: return original jpeg");
            return bArr4;
        }
        Object stringWriter;
        try {
            XmlSerializer newSerializer = Xml.newSerializer();
            Writer stringWriter2 = new StringWriter();
            newSerializer.setOutput(stringWriter2);
            newSerializer.startDocument("UTF-8", Boolean.valueOf(true));
            newSerializer.startTag(null, "depthmap");
            newSerializer.attribute(null, "version", String.valueOf(i));
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append(focusPoint.x);
            stringBuilder2.append(",");
            stringBuilder2.append(focusPoint.y);
            newSerializer.attribute(null, "focuspoint", stringBuilder2.toString());
            newSerializer.attribute(null, "blurlevel", String.valueOf(blurLevel));
            newSerializer.attribute(null, "shinethreshold", String.valueOf(i8));
            newSerializer.attribute(null, "shinelevel", String.valueOf(i7));
            newSerializer.attribute(null, "rawlength", String.valueOf(i3));
            newSerializer.attribute(null, "depthlength", String.valueOf(i4));
            newSerializer.endTag(null, "depthmap");
            if (bArr5 != null && bArr5.length > 0) {
                newSerializer.startTag(null, "lenswatermark");
                newSerializer.attribute(null, "width", String.valueOf(iArr[0]));
                newSerializer.attribute(null, "height", String.valueOf(iArr[1]));
                newSerializer.attribute(null, "paddingx", String.valueOf(iArr[2]));
                newSerializer.attribute(null, "paddingy", String.valueOf(iArr[3]));
                newSerializer.endTag(null, "lenswatermark");
            }
            if (bArr6 != null && bArr6.length > 0) {
                newSerializer.startTag(null, "timewatermark");
                newSerializer.attribute(null, "width", String.valueOf(iArr2[0]));
                newSerializer.attribute(null, "height", String.valueOf(iArr2[1]));
                newSerializer.attribute(null, "paddingx", String.valueOf(iArr2[2]));
                newSerializer.attribute(null, "paddingy", String.valueOf(iArr2[3]));
                newSerializer.endTag(null, "timewatermark");
            }
            newSerializer.endDocument();
            stringWriter = stringWriter2.toString();
        } catch (IOException e3) {
            Log.e(TAG, "writePortraitExif(): Failed to generate depthmap associated xmp metadata");
            stringWriter = null;
        }
        if (stringWriter == null) {
            Log.e(TAG, "writePortraitExif(): #2: return original jpeg");
            return bArr4;
        }
        try {
            byteArrayInputStream = new ByteArrayInputStream(toByteArray);
            try {
                byteArrayOutputStream2 = new ByteArrayOutputStream();
                try {
                    XMPMeta createXMPMeta = XmpHelper.createXMPMeta();
                    createXMPMeta.setProperty(XmpHelper.XIAOMI_XMP_METADATA_NAMESPACE, XmpHelper.XIAOMI_XMP_METADATA_PROPERTY_NAME, stringWriter);
                    XmpHelper.writeXMPMeta(byteArrayInputStream, byteArrayOutputStream2, createXMPMeta);
                    toByteArray2 = byteArrayOutputStream2.toByteArray();
                    th3 = null;
                    try {
                        $closeResource(null, byteArrayOutputStream2);
                        try {
                            $closeResource(null, byteArrayInputStream);
                        } catch (IOException e4) {
                        }
                        if (toByteArray2 == null && toByteArray2.length > toByteArray.length) {
                            return toByteArray2;
                        }
                        Log.e(TAG, "writePortraitExif(): #3: return original jpeg");
                        return bArr4;
                    } catch (Throwable th6) {
                        th2 = th6;
                        $closeResource(th3, byteArrayInputStream);
                        throw th2;
                    }
                } catch (Throwable th7) {
                    th2 = th7;
                }
            } catch (Throwable th8) {
                th2 = th8;
                th3 = null;
                toByteArray2 = th3;
                $closeResource(th3, byteArrayInputStream);
                throw th2;
            }
        } catch (IOException e5) {
        }
        try {
            $closeResource(th4, byteArrayOutputStream2);
            throw th2;
        } catch (Throwable th9) {
            th2 = th9;
            toByteArray2 = th3;
            $closeResource(th3, byteArrayInputStream);
            throw th2;
        }
        $closeResource(th, byteArrayOutputStream);
        throw th2;
    }

    private static /* synthetic */ void $closeResource(Throwable th, AutoCloseable autoCloseable) {
        if (th != null) {
            try {
                autoCloseable.close();
                return;
            } catch (Throwable th2) {
                th.addSuppressed(th2);
                return;
            }
        }
        autoCloseable.close();
    }

    private static int getHeaderTag(byte[] bArr) {
        return getInteger(getBytes(bArr, 0, 4));
    }

    private static int getInteger(byte[] bArr) {
        if (bArr.length == 4) {
            int i = 0;
            int i2 = 0;
            while (i < 4) {
                i2 += (bArr[i] & 255) << (i * 8);
                i++;
            }
            return i2;
        }
        throw new IllegalArgumentException("bytes can not covert to a integer value!");
    }

    private static byte[] getBytes(byte[] bArr, int i, int i2) {
        if (i2 <= 0 || i < 0 || i2 > bArr.length - i) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("WRONG ARGUMENT: from =");
            stringBuilder.append(i);
            stringBuilder.append(", length = ");
            stringBuilder.append(i2);
            throw new IllegalArgumentException(stringBuilder.toString());
        }
        byte[] bArr2 = new byte[i2];
        System.arraycopy(bArr, i, bArr2, 0, i2);
        return bArr2;
    }
}
