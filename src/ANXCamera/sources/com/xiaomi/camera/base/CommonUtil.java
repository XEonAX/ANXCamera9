package com.xiaomi.camera.base;

import android.content.Context;
import android.media.Image;
import android.media.Image.Plane;
import android.util.Log;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;

public class CommonUtil {
    private static final String TAG = "CommonUtil";

    private CommonUtil() {
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

    /* JADX WARNING: Removed duplicated region for block: B:23:0x00cd A:{SYNTHETIC, Splitter: B:23:0x00cd} */
    /* JADX WARNING: Removed duplicated region for block: B:27:0x00d8 A:{SYNTHETIC, Splitter: B:27:0x00d8} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static boolean dumpYuvImage(Image image, String str) {
        Throwable e;
        Log.d(TAG, "dumpYuvImage start");
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("sdcard/DCIM/Camera/");
        stringBuilder.append(str);
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
                        }
                        throw e2;
                    }
                } catch (Throwable th2) {
                    e2 = th2;
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

    public static boolean saveCameraCalibrationToFile(Context context, byte[] bArr, boolean z) {
        String str;
        if (z) {
            str = "front_dual_camera_caldata.bin";
        } else {
            str = "back_dual_camera_caldata.bin";
        }
        return saveCameraCalibrationToFile(context, bArr, str);
    }

    private static boolean saveCameraCalibrationToFile(Context context, byte[] bArr, String str) {
        Throwable e;
        boolean z = false;
        if (!(bArr == null || context == null)) {
            FileOutputStream fileOutputStream = null;
            try {
                FileOutputStream openFileOutput = context.openFileOutput(str, 0);
                try {
                    openFileOutput.write(bArr);
                    z = true;
                    try {
                        openFileOutput.flush();
                        openFileOutput.close();
                    } catch (Throwable e2) {
                        Log.w(TAG, "saveCameraCalibrationToFile: failed!", e2);
                    }
                } catch (FileNotFoundException e3) {
                    e = e3;
                    fileOutputStream = openFileOutput;
                    Log.w(TAG, "saveCameraCalibrationToFile: FileNotFoundException", e);
                    fileOutputStream.flush();
                    fileOutputStream.close();
                    return z;
                } catch (IOException e4) {
                    e = e4;
                    fileOutputStream = openFileOutput;
                    try {
                        Log.w(TAG, "saveCameraCalibrationToFile: IOException", e);
                        fileOutputStream.flush();
                        fileOutputStream.close();
                        return z;
                    } catch (Throwable th) {
                        e = th;
                        try {
                            fileOutputStream.flush();
                            fileOutputStream.close();
                        } catch (Throwable e22) {
                            Log.w(TAG, "saveCameraCalibrationToFile: failed!", e22);
                        }
                        throw e;
                    }
                } catch (Throwable th2) {
                    e = th2;
                    fileOutputStream = openFileOutput;
                    fileOutputStream.flush();
                    fileOutputStream.close();
                    throw e;
                }
            } catch (FileNotFoundException e5) {
                e = e5;
                Log.w(TAG, "saveCameraCalibrationToFile: FileNotFoundException", e);
                fileOutputStream.flush();
                fileOutputStream.close();
                return z;
            } catch (IOException e6) {
                e = e6;
                Log.w(TAG, "saveCameraCalibrationToFile: IOException", e);
                fileOutputStream.flush();
                fileOutputStream.close();
                return z;
            }
        }
        return z;
    }
}
