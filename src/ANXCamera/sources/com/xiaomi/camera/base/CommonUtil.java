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
    public static boolean dumpYuvImage(android.media.Image r9, java.lang.String r10) {
        /*
        r0 = "CommonUtil";
        r1 = "dumpYuvImage start";
        android.util.Log.d(r0, r1);
        r0 = new java.lang.StringBuilder;
        r0.<init>();
        r1 = "sdcard/DCIM/Camera/";
        r0.append(r1);
        r0.append(r10);
        r10 = r0.toString();
        r0 = r9.getFormat();
        r1 = 17;
        r2 = 0;
        if (r0 == r1) goto L_0x0029;
    L_0x0023:
        r1 = 35;
        if (r0 == r1) goto L_0x0029;
    L_0x0027:
        goto L_0x00d4;
    L_0x0029:
        r0 = 0;
        r1 = new java.io.FileOutputStream;	 Catch:{ Exception -> 0x00c3 }
        r3 = new java.lang.StringBuilder;	 Catch:{ Exception -> 0x00c3 }
        r3.<init>();	 Catch:{ Exception -> 0x00c3 }
        r3.append(r10);	 Catch:{ Exception -> 0x00c3 }
        r10 = ".yuv";
        r3.append(r10);	 Catch:{ Exception -> 0x00c3 }
        r10 = r3.toString();	 Catch:{ Exception -> 0x00c3 }
        r1.<init>(r10);	 Catch:{ Exception -> 0x00c3 }
        r10 = r9.getPlanes();	 Catch:{ Exception -> 0x00bd, all -> 0x00bb }
        r10 = r10[r2];	 Catch:{ Exception -> 0x00bd, all -> 0x00bb }
        r10 = r10.getBuffer();	 Catch:{ Exception -> 0x00bd, all -> 0x00bb }
        r0 = r9.getPlanes();	 Catch:{ Exception -> 0x00bd, all -> 0x00bb }
        r3 = 2;
        r0 = r0[r3];	 Catch:{ Exception -> 0x00bd, all -> 0x00bb }
        r0 = r0.getBuffer();	 Catch:{ Exception -> 0x00bd, all -> 0x00bb }
        r4 = r10.limit();	 Catch:{ Exception -> 0x00bd, all -> 0x00bb }
        r5 = r0.limit();	 Catch:{ Exception -> 0x00bd, all -> 0x00bb }
        r6 = "CommonUtil";
        r7 = new java.lang.StringBuilder;	 Catch:{ Exception -> 0x00bd, all -> 0x00bb }
        r7.<init>();	 Catch:{ Exception -> 0x00bd, all -> 0x00bb }
        r8 = "dumpingYuvImage: size=";
        r7.append(r8);	 Catch:{ Exception -> 0x00bd, all -> 0x00bb }
        r8 = r9.getWidth();	 Catch:{ Exception -> 0x00bd, all -> 0x00bb }
        r7.append(r8);	 Catch:{ Exception -> 0x00bd, all -> 0x00bb }
        r8 = "x";
        r7.append(r8);	 Catch:{ Exception -> 0x00bd, all -> 0x00bb }
        r8 = r9.getHeight();	 Catch:{ Exception -> 0x00bd, all -> 0x00bb }
        r7.append(r8);	 Catch:{ Exception -> 0x00bd, all -> 0x00bb }
        r8 = " stride=";
        r7.append(r8);	 Catch:{ Exception -> 0x00bd, all -> 0x00bb }
        r9 = r9.getPlanes();	 Catch:{ Exception -> 0x00bd, all -> 0x00bb }
        r9 = r9[r3];	 Catch:{ Exception -> 0x00bd, all -> 0x00bb }
        r9 = r9.getRowStride();	 Catch:{ Exception -> 0x00bd, all -> 0x00bb }
        r7.append(r9);	 Catch:{ Exception -> 0x00bd, all -> 0x00bb }
        r9 = r7.toString();	 Catch:{ Exception -> 0x00bd, all -> 0x00bb }
        android.util.Log.d(r6, r9);	 Catch:{ Exception -> 0x00bd, all -> 0x00bb }
        r9 = r4 + r5;
        r9 = new byte[r9];	 Catch:{ Exception -> 0x00bd, all -> 0x00bb }
        r10.get(r9, r2, r4);	 Catch:{ Exception -> 0x00bd, all -> 0x00bb }
        r0.get(r9, r4, r5);	 Catch:{ Exception -> 0x00bd, all -> 0x00bb }
        r1.write(r9);	 Catch:{ Exception -> 0x00bd, all -> 0x00bb }
        r10.rewind();	 Catch:{ Exception -> 0x00bd, all -> 0x00bb }
        r0.rewind();	 Catch:{ Exception -> 0x00bd, all -> 0x00bb }
        r2 = 1;
        r1.flush();	 Catch:{ Exception -> 0x00b1 }
        r1.close();	 Catch:{ Exception -> 0x00b1 }
        goto L_0x00ba;
    L_0x00b1:
        r9 = move-exception;
        r10 = "CommonUtil";
        r0 = "Failed to flush/close stream";
        android.util.Log.e(r10, r0, r9);
        goto L_0x00d4;
    L_0x00ba:
        goto L_0x00d4;
    L_0x00bb:
        r9 = move-exception;
        goto L_0x00d5;
    L_0x00bd:
        r9 = move-exception;
        r0 = r1;
        goto L_0x00c4;
    L_0x00c0:
        r9 = move-exception;
        r1 = r0;
        goto L_0x00d5;
    L_0x00c3:
        r9 = move-exception;
    L_0x00c4:
        r10 = "CommonUtil";
        r1 = "Failed to write image";
        android.util.Log.e(r10, r1, r9);	 Catch:{ all -> 0x00c0 }
        if (r0 == 0) goto L_0x00ba;
    L_0x00cd:
        r0.flush();	 Catch:{ Exception -> 0x00b1 }
        r0.close();	 Catch:{ Exception -> 0x00b1 }
        goto L_0x00ba;
    L_0x00d4:
        return r2;
        if (r1 == 0) goto L_0x00e8;
    L_0x00d8:
        r1.flush();	 Catch:{ Exception -> 0x00df }
        r1.close();	 Catch:{ Exception -> 0x00df }
        goto L_0x00e8;
    L_0x00df:
        r10 = move-exception;
        r0 = "CommonUtil";
        r1 = "Failed to flush/close stream";
        android.util.Log.e(r0, r1, r10);
    L_0x00e8:
        throw r9;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.xiaomi.camera.base.CommonUtil.dumpYuvImage(android.media.Image, java.lang.String):boolean");
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
