package com.android.camera.module.loader.camera2;

import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.hardware.camera2.CameraCharacteristics;
import android.hardware.camera2.CameraManager;
import android.util.SparseArray;
import com.android.camera.CameraAppImpl;
import com.android.camera.CameraSettings;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.config.ComponentConfigUltraWide;
import com.android.camera.data.data.config.ComponentManuallyDualLens;
import com.android.camera.log.Log;
import com.android.camera2.CameraCapabilities;
import com.mi.config.b;
import java.util.Arrays;
import java.util.Locale;

@SuppressLint({"MissingPermission"})
@TargetApi(21)
public class Camera2DataContainer {
    public static final int BOGUS_CAMERA_ID_BACK = 0;
    public static final int BOGUS_CAMERA_ID_FRONT = 1;
    private static final int INDEX_AUX = 1;
    private static final int INDEX_BOKEH = 3;
    private static final int INDEX_INFRARED = 5;
    private static final int INDEX_MAIN = 0;
    private static final int INDEX_MUX = 2;
    private static final int INDEX_VIRTUAL = 4;
    private static final int INVALID_CAMERA_ID = -1;
    private static final int MAX_TYPES_OF_CAMERAS_OF_EACH_FACING_DIRECTION = 6;
    private static final String TAG = Camera2DataContainer.class.getSimpleName();
    private static final int ULTRA_WIDE_BOKEH = 63;
    private static final int ULTRA_WIDE_ID = 21;
    private static final Camera2DataContainer sInstance = new Camera2DataContainer();
    private volatile SparseArray<CameraCapabilities> mCapabilities = null;
    private volatile int mCurrentOpenedCameraId = -1;
    private volatile int[] mOrderedCameraIds = null;

    public static Camera2DataContainer getInstance() {
        synchronized (sInstance) {
            if (!sInstance.isInitialized()) {
                sInstance.init((CameraManager) CameraAppImpl.getAndroidContext().getSystemService("camera"));
            }
        }
        return sInstance;
    }

    public static Camera2DataContainer getInstance(CameraManager cameraManager) {
        synchronized (sInstance) {
            if (!sInstance.isInitialized()) {
                sInstance.init(cameraManager);
            }
        }
        return sInstance;
    }

    private Camera2DataContainer() {
    }

    private void init(CameraManager cameraManager) {
        Log.d(TAG, "E: init()");
        try {
            reset();
            String[] cameraIdList = cameraManager.getCameraIdList();
            int max = Math.max(6, cameraIdList.length);
            this.mOrderedCameraIds = new int[(max * 2)];
            Arrays.fill(this.mOrderedCameraIds, -1);
            this.mCapabilities = new SparseArray(cameraIdList.length);
            int length = cameraIdList.length;
            int i = 0;
            int i2 = max;
            max = 0;
            while (i < length) {
                String str = cameraIdList[i];
                StringBuilder stringBuilder;
                try {
                    int parseInt = Integer.parseInt(str);
                    CameraCharacteristics cameraCharacteristics = cameraManager.getCameraCharacteristics(str);
                    this.mCapabilities.put(parseInt, new CameraCapabilities(cameraCharacteristics, parseInt));
                    if (!(DataRepository.dataItemFeature().isSupportUltraWide() && (21 == parseInt || 63 == parseInt))) {
                        Integer num = (Integer) cameraCharacteristics.get(CameraCharacteristics.LENS_FACING);
                        int i3;
                        if (num == null) {
                            str = TAG;
                            stringBuilder = new StringBuilder();
                            stringBuilder.append("Unknown facing direction of camera ");
                            stringBuilder.append(parseInt);
                            Log.d(str, stringBuilder.toString());
                        } else if (num.intValue() == 1) {
                            i3 = max + 1;
                            this.mOrderedCameraIds[max] = parseInt;
                            max = i3;
                        } else if (num.intValue() == 0) {
                            i3 = i2 + 1;
                            this.mOrderedCameraIds[i2] = parseInt;
                            i2 = i3;
                        }
                    }
                } catch (NumberFormatException e) {
                    String str2 = TAG;
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("non-integer camera id: ");
                    stringBuilder.append(str);
                    Log.e(str2, stringBuilder.toString());
                }
                i++;
            }
            dumpCameraIds();
        } catch (Exception e2) {
            String str3 = TAG;
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("Failed to init Camera2DataContainer: ");
            stringBuilder2.append(e2);
            Log.e(str3, stringBuilder2.toString());
            reset();
        }
        Log.d(TAG, "X: init()");
    }

    private boolean isInitialized() {
        return (this.mCapabilities == null || this.mOrderedCameraIds == null) ? false : true;
    }

    public synchronized void setCurrentOpenedCameraId(int i) {
        this.mCurrentOpenedCameraId = i;
    }

    public synchronized void reset() {
        Log.d(TAG, "E: reset()");
        this.mCurrentOpenedCameraId = -1;
        this.mCapabilities = null;
        this.mOrderedCameraIds = null;
        Log.d(TAG, "X: reset()");
    }

    private void dumpCameraIds() {
        int[] iArr = new int[6];
        int[] iArr2 = new int[6];
        for (int i = 0; i < 6; i++) {
            iArr[i] = this.mOrderedCameraIds[i];
            iArr2[i] = this.mOrderedCameraIds[(this.mOrderedCameraIds.length / 2) + i];
        }
        Log.d(TAG, "====================================================================");
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("BACK: [main, aux, mux, bokeh, virtual, infrared] = ");
        stringBuilder.append(Arrays.toString(iArr));
        Log.d(str, stringBuilder.toString());
        str = TAG;
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append("FRONT: [main, aux, mux, bokeh, virtual, infrared] = ");
        stringBuilder2.append(Arrays.toString(iArr2));
        Log.d(str, stringBuilder2.toString());
        Log.d(TAG, "====================================================================");
    }

    public synchronized int getMainBackCameraId() {
        if (isInitialized()) {
            return this.mOrderedCameraIds[0];
        }
        Log.d(TAG, "Warning: getMainBackCameraId(): #init() failed.");
        return -1;
    }

    public synchronized int getAuxCameraId() {
        if (isInitialized()) {
            return this.mOrderedCameraIds[1];
        }
        Log.d(TAG, "Warning: getAuxCameraId(): #init() failed.");
        return -1;
    }

    public synchronized int getMuxCameraId() {
        if (isInitialized()) {
            return this.mOrderedCameraIds[2];
        }
        Log.d(TAG, "Warning: getMuxCameraId(): #init() failed.");
        return -1;
    }

    public synchronized int getBokehCameraId() {
        if (isInitialized()) {
            return this.mOrderedCameraIds[3];
        }
        Log.d(TAG, "Warning: getBokehCameraId(): #init() failed.");
        return -1;
    }

    public synchronized int getUltraWideBokehCameraId() {
        if (isInitialized()) {
            return 63;
        }
        Log.d(TAG, "Warning: getUltraWideBokehCameraId(): #init() failed.");
        return -1;
    }

    /* JADX WARNING: Missing block: B:13:0x001c, code:
            return r1;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized boolean hasMuxCamera() {
        boolean z = false;
        if (!isInitialized()) {
            Log.d(TAG, "Warning: hasMuxCamera(): #init() failed.");
            return false;
        } else if (this.mOrderedCameraIds[2] != -1) {
            z = true;
        }
    }

    public synchronized int getFrontCameraId() {
        if (isInitialized()) {
            return this.mOrderedCameraIds[(this.mOrderedCameraIds.length / 2) + 0];
        }
        Log.d(TAG, "Warning: getFrontCameraId(): #init() failed.");
        return -1;
    }

    public synchronized int getAuxFrontCameraId() {
        if (isInitialized()) {
            return this.mOrderedCameraIds[(this.mOrderedCameraIds.length / 2) + 1];
        }
        Log.d(TAG, "Warning: getAuxFrontCameraId(): #init() failed.");
        return -1;
    }

    public synchronized int getMuxFrontCameraId() {
        if (isInitialized()) {
            return this.mOrderedCameraIds[(this.mOrderedCameraIds.length / 2) + 2];
        }
        Log.d(TAG, "Warning: getMuxFrontCameraId(): #init() failed.");
        return -1;
    }

    public synchronized int getBokehFrontCameraId() {
        if (isInitialized()) {
            return this.mOrderedCameraIds[(this.mOrderedCameraIds.length / 2) + 3];
        }
        Log.d(TAG, "Warning: getBokehFrontCameraId(): #init() failed.");
        return -1;
    }

    /* JADX WARNING: Missing block: B:12:0x001a, code:
            return r0;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized boolean isFrontCameraId(int i) {
        CameraCapabilities capabilities = getCapabilities(i);
        boolean z = false;
        if (capabilities == null) {
            Log.d(TAG, "Warning: isFrontCameraId(): #init() failed.");
            return false;
        } else if (capabilities.getFacing() == 0) {
            z = true;
        }
    }

    /* JADX WARNING: Missing block: B:13:0x0032, code:
            return r0;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized CameraCapabilities getCapabilities(int i) {
        if (isInitialized()) {
            CameraCapabilities cameraCapabilities = (CameraCapabilities) this.mCapabilities.get(i);
            if (cameraCapabilities == null) {
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("Warning: getCapabilities(): return null for camera: ");
                stringBuilder.append(i);
                Log.d(str, stringBuilder.toString());
            }
        } else {
            Log.d(TAG, "Warning: getCapabilities(): #init() failed.");
            return null;
        }
    }

    public synchronized CameraCapabilities getCurrentCameraCapabilities() {
        if (this.mCurrentOpenedCameraId == -1) {
            Log.d(TAG, "Warning: getCurrentCameraCapabilities(): mCurrentOpenedCameraId is invalid.");
        }
        return getCapabilities(this.mCurrentOpenedCameraId);
    }

    public synchronized CameraCapabilities getCapabilitiesByBogusCameraId(int i, int i2) {
        return getCapabilities(getActualOpenCameraId(i, i2));
    }

    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized int getActualOpenCameraId(int i, int i2) {
        if (isInitialized()) {
            int ultraWideCameraId;
            if (i == 0) {
                int i3 = (CameraSettings.isDualCameraEnable() && (CameraSettings.isSupportedOpticalZoom() || CameraSettings.isSupportedPortrait())) ? 1 : 0;
                if (i3 != 0) {
                    ComponentConfigUltraWide componentConfigUltraWide = DataRepository.dataItemConfig().getComponentConfigUltraWide();
                    switch (i2) {
                        case 161:
                        case 162:
                        case 173:
                        case 174:
                            if (componentConfigUltraWide.isUltraWideOnInMode(i2)) {
                                ultraWideCameraId = getUltraWideCameraId();
                                break;
                            }
                        case 163:
                            if (CameraSettings.isRearMenuUltraPixelPhotographyOn()) {
                                ultraWideCameraId = getMainBackCameraId();
                                break;
                            }
                        case 165:
                            if (!CameraSettings.isDualCameraSatEnable() || !b.isSupportedOpticalZoom()) {
                                if (componentConfigUltraWide.isUltraWideOnInMode(i2)) {
                                    ultraWideCameraId = getUltraWideCameraId();
                                    break;
                                }
                            } else if (!componentConfigUltraWide.isUltraWideOnInMode(i2)) {
                                ultraWideCameraId = getMuxCameraId();
                                break;
                            } else {
                                ultraWideCameraId = getUltraWideCameraId();
                                break;
                            }
                            break;
                        case 166:
                        case 167:
                            if (CameraSettings.isSwitchCameraZoomMode()) {
                                String cameraZoomMode = CameraSettings.getCameraZoomMode(i2);
                                if (!ComponentManuallyDualLens.LENS_WIDE.equals(cameraZoomMode)) {
                                    if (!ComponentManuallyDualLens.LENS_TELE.equals(cameraZoomMode)) {
                                        if (!ComponentManuallyDualLens.LENS_ULTRA.equals(cameraZoomMode)) {
                                            ultraWideCameraId = i;
                                            break;
                                        }
                                        ultraWideCameraId = getUltraWideCameraId();
                                        break;
                                    }
                                    ultraWideCameraId = getAuxCameraId();
                                    break;
                                }
                                ultraWideCameraId = getMainBackCameraId();
                                break;
                            }
                        case 171:
                            if (!DataRepository.dataItemRunning().isSwitchOn("pref_ultra_wide_bokeh_enabled") || getUltraWideBokehCameraId() == -1) {
                                if (getBokehCameraId() == -1) {
                                    ultraWideCameraId = getMuxCameraId();
                                    break;
                                }
                                ultraWideCameraId = getBokehCameraId();
                                break;
                            }
                            ultraWideCameraId = getUltraWideBokehCameraId();
                            break;
                            break;
                        default:
                            ultraWideCameraId = i;
                            break;
                    }
                }
                return i;
            }
            if (i == 1) {
                if (i2 != 171) {
                    switch (i2) {
                        case 161:
                        case 162:
                            if (CameraSettings.isVideoBokehOn() && getBokehFrontCameraId() != -1) {
                                ultraWideCameraId = getBokehFrontCameraId();
                                break;
                            }
                    }
                } else if (getBokehFrontCameraId() != -1) {
                    ultraWideCameraId = getBokehFrontCameraId();
                }
            }
            ultraWideCameraId = i;
            Log.d(TAG, String.format(Locale.US, "getActualOpenCameraId: mode=%x, id=%d->%d", new Object[]{Integer.valueOf(i2), Integer.valueOf(i), Integer.valueOf(ultraWideCameraId)}));
            return ultraWideCameraId;
        }
        Log.d(TAG, "Warning: getActualOpenCameraId(): #init() failed.");
        return i;
    }

    public synchronized int getUltraWideCameraId() {
        if (isInitialized()) {
            return 21;
        }
        Log.d(TAG, "Warning: getUltraWideCameraId(): #init() failed.");
        return -1;
    }
}
