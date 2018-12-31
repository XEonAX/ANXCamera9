package com.xiaomi.camera.base;

import android.hardware.camera2.CaptureResult;
import android.os.Parcelable;
import android.util.Log;
import com.xiaomi.protocol.ICustomCaptureResult;
import java.lang.reflect.Method;

public class CameraDeviceUtil {
    private static final String TAG = CameraDeviceUtil.class.getSimpleName();

    private CameraDeviceUtil() {
    }

    /* JADX WARNING: Removed duplicated region for block: B:15:0x0057 A:{ExcHandler: java.lang.ClassNotFoundException (r7_1 'e' java.lang.Throwable), Splitter: B:10:0x0025} */
    /* JADX WARNING: Removed duplicated region for block: B:15:0x0057 A:{ExcHandler: java.lang.ClassNotFoundException (r7_1 'e' java.lang.Throwable), Splitter: B:10:0x0025} */
    /* JADX WARNING: Removed duplicated region for block: B:15:0x0057 A:{ExcHandler: java.lang.ClassNotFoundException (r7_1 'e' java.lang.Throwable), Splitter: B:10:0x0025} */
    /* JADX WARNING: Removed duplicated region for block: B:15:0x0057 A:{ExcHandler: java.lang.ClassNotFoundException (r7_1 'e' java.lang.Throwable), Splitter: B:10:0x0025} */
    /* JADX WARNING: Missing block: B:15:0x0057, code:
            r7 = move-exception;
     */
    /* JADX WARNING: Missing block: B:16:0x0058, code:
            android.util.Log.e(TAG, "prepareCalibrationDataForAlgo: call reflect method failed!", r7);
     */
    /* JADX WARNING: Missing block: B:17:0x0066, code:
            throw new java.lang.RuntimeException("getCameraCharacteristics's dualCalibrationData failed");
     */
    public static void prepareCalibrationDataForAlgo(android.content.Context r7, java.lang.String r8) {
        /*
        r0 = "camera";
        r0 = r7.getSystemService(r0);
        r0 = (android.hardware.camera2.CameraManager) r0;
        r8 = r0.getCameraCharacteristics(r8);	 Catch:{ CameraAccessException -> 0x0067 }
        r0 = android.hardware.camera2.CameraCharacteristics.LENS_FACING;
        r0 = r8.get(r0);
        r0 = (java.lang.Integer) r0;
        if (r0 != 0) goto L_0x0018;
    L_0x0017:
        return;
    L_0x0018:
        r0 = r0.intValue();
        r1 = 0;
        r2 = 1;
        if (r0 != 0) goto L_0x0022;
    L_0x0020:
        r0 = r2;
        goto L_0x0024;
        r0 = r1;
        r3 = "android.hardware.camera2.CameraCharacteristics$Key";
        r3 = java.lang.Class.forName(r3);	 Catch:{ ClassNotFoundException -> 0x0057, ClassNotFoundException -> 0x0057, ClassNotFoundException -> 0x0057, ClassNotFoundException -> 0x0057, ClassNotFoundException -> 0x0057 }
        r4 = 2;
        r5 = new java.lang.Class[r4];	 Catch:{ ClassNotFoundException -> 0x0057, ClassNotFoundException -> 0x0057, ClassNotFoundException -> 0x0057, ClassNotFoundException -> 0x0057, ClassNotFoundException -> 0x0057 }
        r6 = java.lang.String.class;
        r5[r1] = r6;	 Catch:{ ClassNotFoundException -> 0x0057, ClassNotFoundException -> 0x0057, ClassNotFoundException -> 0x0057, ClassNotFoundException -> 0x0057, ClassNotFoundException -> 0x0057 }
        r6 = java.lang.Class.class;
        r5[r2] = r6;	 Catch:{ ClassNotFoundException -> 0x0057, ClassNotFoundException -> 0x0057, ClassNotFoundException -> 0x0057, ClassNotFoundException -> 0x0057, ClassNotFoundException -> 0x0057 }
        r4 = new java.lang.Object[r4];	 Catch:{ ClassNotFoundException -> 0x0057, ClassNotFoundException -> 0x0057, ClassNotFoundException -> 0x0057, ClassNotFoundException -> 0x0057, ClassNotFoundException -> 0x0057 }
        r6 = "com.xiaomi.camera.algoup.dualCalibrationData";
        r4[r1] = r6;	 Catch:{ ClassNotFoundException -> 0x0057, ClassNotFoundException -> 0x0057, ClassNotFoundException -> 0x0057, ClassNotFoundException -> 0x0057, ClassNotFoundException -> 0x0057 }
        r1 = byte[].class;
        r4[r2] = r1;	 Catch:{ ClassNotFoundException -> 0x0057, ClassNotFoundException -> 0x0057, ClassNotFoundException -> 0x0057, ClassNotFoundException -> 0x0057, ClassNotFoundException -> 0x0057 }
        r1 = r3.getDeclaredConstructor(r5);	 Catch:{ ClassNotFoundException -> 0x0057, ClassNotFoundException -> 0x0057, ClassNotFoundException -> 0x0057, ClassNotFoundException -> 0x0057, ClassNotFoundException -> 0x0057 }
        r1 = r1.newInstance(r4);	 Catch:{ ClassNotFoundException -> 0x0057, ClassNotFoundException -> 0x0057, ClassNotFoundException -> 0x0057, ClassNotFoundException -> 0x0057, ClassNotFoundException -> 0x0057 }
        r1 = (android.hardware.camera2.CameraCharacteristics.Key) r1;	 Catch:{ ClassNotFoundException -> 0x0057, ClassNotFoundException -> 0x0057, ClassNotFoundException -> 0x0057, ClassNotFoundException -> 0x0057, ClassNotFoundException -> 0x0057 }
        r8 = r8.get(r1);	 Catch:{ ClassNotFoundException -> 0x0057, ClassNotFoundException -> 0x0057, ClassNotFoundException -> 0x0057, ClassNotFoundException -> 0x0057, ClassNotFoundException -> 0x0057 }
        r8 = (byte[]) r8;	 Catch:{ ClassNotFoundException -> 0x0057, ClassNotFoundException -> 0x0057, ClassNotFoundException -> 0x0057, ClassNotFoundException -> 0x0057, ClassNotFoundException -> 0x0057 }
        if (r8 == 0) goto L_0x0056;
    L_0x0053:
        com.xiaomi.camera.base.CommonUtil.saveCameraCalibrationToFile(r7, r8, r0);
    L_0x0056:
        return;
    L_0x0057:
        r7 = move-exception;
        r8 = TAG;
        r0 = "prepareCalibrationDataForAlgo: call reflect method failed!";
        android.util.Log.e(r8, r0, r7);
        r7 = new java.lang.RuntimeException;
        r8 = "getCameraCharacteristics's dualCalibrationData failed";
        r7.<init>(r8);
        throw r7;
    L_0x0067:
        r7 = move-exception;
        r8 = TAG;
        r0 = "prepareCalibrationDataForAlgo: get getCameraCharacteristics failed!";
        android.util.Log.e(r8, r0, r7);
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.xiaomi.camera.base.CameraDeviceUtil.prepareCalibrationDataForAlgo(android.content.Context, java.lang.String):void");
    }

    public static ICustomCaptureResult getCustomCaptureResult(CaptureResult captureResult) {
        try {
            Method method = captureResult.getClass().getMethod("getNativeCopy", new Class[0]);
            method.setAccessible(true);
            Parcelable parcelable = (Parcelable) method.invoke(captureResult, new Object[0]);
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("getCustomCaptureResult: cameraMetadataNative =");
            stringBuilder.append(parcelable);
            Log.d(str, stringBuilder.toString());
            ICustomCaptureResult iCustomCaptureResult = new ICustomCaptureResult();
            iCustomCaptureResult.setFrameNumber(captureResult.getFrameNumber());
            iCustomCaptureResult.setRequest(captureResult.getRequest());
            iCustomCaptureResult.setSequenceId(captureResult.getSequenceId());
            iCustomCaptureResult.setResults(parcelable);
            Long l = (Long) captureResult.get(CaptureResult.SENSOR_TIMESTAMP);
            if (l != null) {
                iCustomCaptureResult.setTimeStamp(l.longValue());
            }
            String str2 = TAG;
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("getCustomCaptureResult: ");
            stringBuilder2.append(iCustomCaptureResult);
            Log.d(str2, stringBuilder2.toString());
            return iCustomCaptureResult;
        } catch (Throwable e) {
            Log.e(TAG, "getCustomCaptureResult: getCustomCaptureResult", e);
            return null;
        }
    }
}
