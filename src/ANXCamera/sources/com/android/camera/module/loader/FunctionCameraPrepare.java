package com.android.camera.module.loader;

import android.text.TextUtils;
import com.android.camera.Camera;
import com.android.camera.CameraAppImpl;
import com.android.camera.CameraSettings;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.constant.GlobalConstant;
import com.android.camera.data.DataRepository;
import com.android.camera.data.backup.DataBackUp;
import com.android.camera.data.data.config.ComponentConfigBeauty;
import com.android.camera.data.data.config.ComponentConfigBeautyBody;
import com.android.camera.data.data.config.ComponentConfigFlash;
import com.android.camera.data.data.config.ComponentConfigHdr;
import com.android.camera.data.data.config.ComponentConfigUltraWide;
import com.android.camera.data.data.config.ComponentManuallyET;
import com.android.camera.data.data.config.DataItemConfig;
import com.android.camera.data.data.global.DataItemGlobal;
import com.android.camera.data.data.runing.DataItemRunning;
import com.android.camera.data.provider.DataProvider.ProviderEditor;
import com.android.camera.log.Log;
import com.android.camera.module.BaseModule;
import com.android.camera.permission.PermissionManager;
import com.mi.config.b;
import io.reactivex.Scheduler;
import io.reactivex.annotations.NonNull;

public class FunctionCameraPrepare extends Func1Base<Camera, BaseModule> {
    private static final String TAG = "FunctionCameraPrepare";
    private BaseModule baseModule;
    private boolean mNeedReConfigureData;
    private int mResetType;

    public FunctionCameraPrepare(int i, int i2, boolean z, BaseModule baseModule) {
        super(i);
        this.mResetType = i2;
        this.mNeedReConfigureData = z;
        this.baseModule = baseModule;
    }

    public Scheduler getWorkThread() {
        return GlobalConstant.sCameraSetupScheduler;
    }

    public NullHolder<BaseModule> apply(@NonNull NullHolder<Camera> nullHolder) throws Exception {
        if (!nullHolder.isPresent()) {
            return NullHolder.ofNullable(null, 234);
        }
        if (!PermissionManager.checkCameraLaunchPermissions()) {
            return NullHolder.ofNullable(null, 229);
        }
        Camera camera = (Camera) nullHolder.get();
        if (camera.isFinishing()) {
            Log.d(TAG, "activity is finishing, the content of BaseModuleHolder is set to null");
            return NullHolder.ofNullable(null, 235);
        }
        camera.changeRequestOrientation();
        if (this.baseModule.isDeparted()) {
            return NullHolder.ofNullable(this.baseModule, 225);
        }
        reconfigureData();
        return NullHolder.ofNullable(this.baseModule);
    }

    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void reconfigureData() {
        if (this.mNeedReConfigureData) {
            CameraSettings.upgradeGlobalPreferences();
            DataItemGlobal dataItemGlobal = DataRepository.dataItemGlobal();
            DataItemRunning dataItemRunning = DataRepository.dataItemRunning();
            DataItemConfig dataItemConfig = DataRepository.dataItemConfig();
            int lastCameraId = dataItemGlobal.getLastCameraId();
            ComponentConfigFlash componentFlash = dataItemConfig.getComponentFlash();
            ProviderEditor editor = dataItemConfig.editor();
            DataBackUp backUp = DataRepository.getInstance().backUp();
            editor.remove(CameraSettings.KEY_ZOOM).remove(CameraSettings.KEY_EXPOSURE);
            String persistValue = componentFlash.getPersistValue(this.mTargetMode);
            if (!componentFlash.isValidFlashValue(persistValue)) {
                editor.remove(componentFlash.getKey(this.mTargetMode));
            } else if (persistValue.equals("2")) {
                editor.putString(componentFlash.getKey(this.mTargetMode), componentFlash.getDefaultValue(this.mTargetMode));
            }
            if (this.mTargetMode == 167) {
                if (!Util.isStringValueContained(dataItemConfig.getString(CameraSettings.KEY_QC_ISO, CameraAppImpl.getAndroidContext().getString(R.string.pref_camera_iso_default)), (int) R.array.pref_camera_iso_entryvalues)) {
                    editor.remove(CameraSettings.KEY_QC_ISO);
                }
            }
            if (!b.gJ()) {
                editor.remove(CameraSettings.KEY_QC_FOCUS_POSITION);
                editor.remove(CameraSettings.KEY_QC_EXPOSURETIME);
            } else if (this.mTargetMode == 167) {
                ComponentManuallyET componentManuallyET = new ComponentManuallyET(dataItemConfig);
                if (!componentManuallyET.checkValueValid(componentManuallyET.getComponentValue(this.mTargetMode))) {
                    componentManuallyET.resetComponentValue(this.mTargetMode);
                }
            }
            if (!Util.isLabOptionsVisible()) {
                dataItemGlobal.editor().remove(CameraSettings.KEY_FACE_DETECTION).remove(CameraSettings.KEY_CAMERA_PORTRAIT_WITH_FACEBEAUTY).remove(CameraSettings.KEY_CAMERA_FACE_DETECTION_AUTO_HIDDEN).remove(CameraSettings.KEY_CAMERA_DUAL_ENABLE).remove(CameraSettings.KEY_CAMERA_DUAL_SAT_ENABLE).remove(CameraSettings.KEY_CAMERA_MFNR_SAT_ENABLE).remove(CameraSettings.KEY_CAMERA_SR_ENABLE).apply();
            }
            if (!Util.isValidValue(dataItemGlobal.getString(CameraSettings.KEY_ANTIBANDING, "1"))) {
                dataItemGlobal.editor().remove(CameraSettings.KEY_ANTIBANDING).apply();
            }
            switch (this.mResetType) {
                case 2:
                    backUp.revertRunning(dataItemRunning, dataItemGlobal.getDataBackUpKey(this.mTargetMode), dataItemGlobal.getCurrentCameraId());
                    if (componentFlash.getPersistValue(this.mTargetMode).equals("2")) {
                        editor.putString(componentFlash.getKey(this.mTargetMode), componentFlash.getDefaultValue(this.mTargetMode));
                        break;
                    }
                    break;
                case 3:
                case 6:
                    resetFlash(componentFlash, editor);
                    resetHdr(dataItemConfig.getComponentHdr(), editor);
                    resetVideoBeauty(dataItemConfig.getComponentConfigBeauty(), editor);
                    resetUltraWide(dataItemConfig.getComponentConfigUltraWide(), editor);
                    editor.remove("pref_eye_light_type_key");
                    editor.remove(dataItemConfig.getComponentConfigSlowMotion().getKey(this.mTargetMode));
                    if (dataItemGlobal.getCurrentCameraId() == 0) {
                        resetBeauty(dataItemConfig.getComponentConfigBeauty(), editor);
                        resetBeautyBody(this.mTargetMode, dataItemConfig.getComponentConfigBeautyBody(), editor);
                        dataItemConfig = (DataItemConfig) DataRepository.provider().dataConfig(1);
                    } else {
                        dataItemConfig = (DataItemConfig) DataRepository.provider().dataConfig(0);
                    }
                    ProviderEditor editor2 = dataItemConfig.editor();
                    resetFlash(dataItemConfig.getComponentFlash(), editor2);
                    resetHdr(dataItemConfig.getComponentHdr(), editor2);
                    resetVideoBeauty(dataItemConfig.getComponentConfigBeauty(), editor2);
                    editor2.remove("pref_eye_light_type_key");
                    editor2.apply();
                    dataItemRunning.clearArrayMap();
                    backUp.clearBackUp();
                    if (DataRepository.dataItemFeature().fF()) {
                        DataRepository.dataItemLive().editor().remove(CameraSettings.KEY_LIVE_MUSIC_PATH).remove(CameraSettings.KEY_LIVE_MUSIC_HINT).remove(CameraSettings.KEY_LIVE_STICKER).remove(CameraSettings.KEY_LIVE_STICKER_NAME).remove(CameraSettings.KEY_LIVE_STICKER_HINT).remove(CameraSettings.KEY_LIVE_SPEED).remove(CameraSettings.KEY_LIVE_FILTER).remove(CameraSettings.KEY_LIVE_SHRINK_FACE_RATIO).remove(CameraSettings.KEY_LIVE_ENLARGE_EYE_RATIO).remove(CameraSettings.KEY_LIVE_SMOOTH_STRENGTH).remove(CameraSettings.KEY_LIVE_BEAUTY_STATUS).apply();
                        break;
                    }
                    break;
                case 4:
                case 5:
                    int i = this.mTargetMode;
                    if (i != 174) {
                        switch (i) {
                            case 161:
                                break;
                            case 162:
                                i = dataItemGlobal.getCurrentCameraId();
                                if (i == 0) {
                                    backUp.removeOtherVideoMode();
                                    break;
                                }
                                break;
                            default:
                                switch (i) {
                                    case 166:
                                    case 167:
                                        i = 0;
                                        break;
                                    case 168:
                                    case 169:
                                    case 170:
                                        i = dataItemGlobal.getCurrentCameraId();
                                        break;
                                    case 171:
                                        if (b.ht()) {
                                            i = dataItemGlobal.getCurrentCameraId();
                                            break;
                                        }
                                    default:
                                        i = dataItemGlobal.getCurrentCameraId();
                                        break;
                                }
                        }
                    }
                    i = dataItemGlobal.getCurrentCameraId();
                    dataItemGlobal.setCameraIdTransient(i);
                    backUp.revertRunning(dataItemRunning, dataItemGlobal.getDataBackUpKey(this.mTargetMode), i);
                    break;
            }
            boolean fH = DataRepository.dataItemFeature().fH();
            if (this.mResetType == 4 && lastCameraId == dataItemGlobal.getCurrentCameraId()) {
                fH = false;
            }
            if (fH) {
                editor.putBoolean(CameraSettings.KEY_LENS_DIRTY_DETECT_ENABLED, true);
            }
            editor.apply();
            return;
        }
        DataRepository.dataItemConfig().editor().remove(CameraSettings.KEY_ZOOM).apply();
    }

    private void resetBeautyBody(int i, ComponentConfigBeautyBody componentConfigBeautyBody, ProviderEditor providerEditor) {
        componentConfigBeautyBody.resetBeautyBody(i, providerEditor);
    }

    private void resetFlash(ComponentConfigFlash componentConfigFlash, ProviderEditor providerEditor) {
        if (!componentConfigFlash.getPersistValue(this.mTargetMode).equals("3")) {
            providerEditor.putString(componentConfigFlash.getKey(this.mTargetMode), componentConfigFlash.getDefaultValue(this.mTargetMode));
        }
    }

    private void resetHdr(ComponentConfigHdr componentConfigHdr, ProviderEditor providerEditor) {
        String persistValue = componentConfigHdr.getPersistValue(this.mTargetMode);
        if (!persistValue.equals("auto") && !persistValue.equals("off")) {
            providerEditor.putString(componentConfigHdr.getKey(this.mTargetMode), componentConfigHdr.getDefaultValue(this.mTargetMode));
        }
    }

    private void resetBeauty(ComponentConfigBeauty componentConfigBeauty, ProviderEditor providerEditor) {
        CharSequence persistValue = componentConfigBeauty.getPersistValue(this.mTargetMode);
        Object defaultValue = componentConfigBeauty.getDefaultValue(this.mTargetMode);
        if (!TextUtils.equals(persistValue, defaultValue)) {
            providerEditor.putString(componentConfigBeauty.getKey(this.mTargetMode), defaultValue);
        }
    }

    private void resetVideoBeauty(ComponentConfigBeauty componentConfigBeauty, ProviderEditor providerEditor) {
        CharSequence persistValue = componentConfigBeauty.getPersistValue(162);
        Object defaultValue = componentConfigBeauty.getDefaultValue(162);
        if (!TextUtils.equals(persistValue, defaultValue)) {
            providerEditor.putString(componentConfigBeauty.getKey(162), defaultValue);
        }
    }

    private void resetUltraWide(ComponentConfigUltraWide componentConfigUltraWide, ProviderEditor providerEditor) {
        if (componentConfigUltraWide != null) {
            componentConfigUltraWide.resetUltraWide(providerEditor);
        }
    }
}
