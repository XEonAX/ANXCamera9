package com.xiaomi.camera.base;

import android.content.Context;
import com.android.camera.log.Log;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

public final class CommonUtil {
    private static final String TAG = "CommonUtil";

    private CommonUtil() {
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
