package com.xiaomi.camera.base;

import android.content.Context;
import android.hardware.camera2.CameraCharacteristics;
import android.hardware.camera2.CameraCharacteristics.Key;
import android.hardware.camera2.CameraManager;
import android.hardware.camera2.CaptureResult;
import android.os.Parcelable;
import com.android.camera.log.Log;
import com.xiaomi.engine.CameraCombinationMode;
import com.xiaomi.protocol.ICustomCaptureResult;
import java.lang.reflect.Method;

public final class CameraDeviceUtil {
    private static final String TAG = CameraDeviceUtil.class.getSimpleName();

    private CameraDeviceUtil() {
    }

    /* JADX WARNING: Removed duplicated region for block: B:15:0x0056 A:{ExcHandler: java.lang.ClassNotFoundException (r7_1 'e' java.lang.Throwable), Splitter: B:10:0x0024} */
    /* JADX WARNING: Removed duplicated region for block: B:15:0x0056 A:{ExcHandler: java.lang.ClassNotFoundException (r7_1 'e' java.lang.Throwable), Splitter: B:10:0x0024} */
    /* JADX WARNING: Removed duplicated region for block: B:15:0x0056 A:{ExcHandler: java.lang.ClassNotFoundException (r7_1 'e' java.lang.Throwable), Splitter: B:10:0x0024} */
    /* JADX WARNING: Removed duplicated region for block: B:15:0x0056 A:{ExcHandler: java.lang.ClassNotFoundException (r7_1 'e' java.lang.Throwable), Splitter: B:10:0x0024} */
    /* JADX WARNING: Missing block: B:15:0x0056, code:
            r7 = move-exception;
     */
    /* JADX WARNING: Missing block: B:16:0x0057, code:
            com.android.camera.log.Log.e(TAG, "prepareCalibrationDataForAlgo: call reflect method failed!", r7);
     */
    /* JADX WARNING: Missing block: B:17:0x0065, code:
            throw new java.lang.RuntimeException("getCameraCharacteristics's dualCalibrationData failed");
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static void prepareCalibrationDataForAlgo(Context context, String str) {
        try {
            CameraCharacteristics cameraCharacteristics = ((CameraManager) context.getSystemService("camera")).getCameraCharacteristics(str);
            Integer num = (Integer) cameraCharacteristics.get(CameraCharacteristics.LENS_FACING);
            if (num != null) {
                boolean z = num.intValue() == 0;
                try {
                    byte[] bArr = (byte[]) cameraCharacteristics.get((Key) Class.forName("android.hardware.camera2.CameraCharacteristics$Key").getDeclaredConstructor(new Class[]{String.class, Class.class}).newInstance(new Object[]{"com.xiaomi.camera.algoup.dualCalibrationData", byte[].class}));
                    if (bArr != null) {
                        CommonUtil.saveCameraCalibrationToFile(context, bArr, z);
                    }
                } catch (Throwable e) {
                }
            }
        } catch (Throwable e2) {
            Log.e(TAG, "prepareCalibrationDataForAlgo: get getCameraCharacteristics failed!", e2);
        }
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

    /* JADX WARNING: Missing block: B:19:0x0022, code:
            return com.xiaomi.engine.CameraCombinationMode.CAM_COMBINATION_MODE_REAR_BOKEH_WT;
     */
    /* JADX WARNING: Missing block: B:21:0x0025, code:
            return 513;
     */
    /* JADX WARNING: Missing block: B:23:0x0027, code:
            return 2;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static int getCameraCombinationMode(int i) {
        if (i == 40) {
            return 18;
        }
        switch (i) {
            case 0:
                return 1;
            case 1:
                return 17;
            case 2:
                break;
            case 3:
                break;
            case 4:
                break;
            default:
                switch (i) {
                    case 20:
                        break;
                    case 21:
                        return 3;
                    default:
                        switch (i) {
                            case 60:
                                break;
                            case 61:
                                break;
                            case 62:
                                return CameraCombinationMode.CAM_COMBINATION_MODE_REAR_SAT_WU;
                            case 63:
                                return CameraCombinationMode.CAM_COMBINATION_MODE_REAR_BOKEH_WU;
                            default:
                                switch (i) {
                                    case 80:
                                        return CameraCombinationMode.CAM_COMBINATION_MODE_FRONT_SAT;
                                    case 81:
                                        return CameraCombinationMode.CAM_COMBINATION_MODE_FRONT_BOKEH;
                                    default:
                                        return 0;
                                }
                        }
                }
        }
    }
}
