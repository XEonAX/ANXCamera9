package com.android.camera.module.loader;

import android.text.TextUtils;
import com.android.camera.Camera;
import com.android.camera.constant.GlobalConstant;
import com.android.camera.data.data.config.ComponentConfigBeauty;
import com.android.camera.data.data.config.ComponentConfigFlash;
import com.android.camera.data.data.config.ComponentConfigHdr;
import com.android.camera.data.provider.DataProvider.ProviderEditor;
import com.android.camera.log.Log;
import com.android.camera.module.BaseModule;
import com.android.camera.permission.PermissionManager;
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

    private void reconfigureData() {
        /*
        r10 = this;
        r0 = r10.mNeedReConfigureData;
        if (r0 != 0) goto L_0x0016;
    L_0x0004:
        r0 = com.android.camera.data.DataRepository.dataItemConfig();
        r0 = r0.editor();
        r1 = "pref_camera_zoom_key";
        r0 = r0.remove(r1);
        r0.apply();
        return;
    L_0x0016:
        com.android.camera.CameraSettings.upgradeGlobalPreferences();
        r0 = com.android.camera.data.DataRepository.dataItemGlobal();
        r1 = com.android.camera.data.DataRepository.dataItemRunning();
        r2 = com.android.camera.data.DataRepository.dataItemConfig();
        r3 = r0.getLastCameraId();
        r4 = r2.getComponentFlash();
        r5 = r2.editor();
        r6 = com.android.camera.data.DataRepository.getInstance();
        r6 = r6.backUp();
        r7 = "pref_camera_zoom_key";
        r7 = r5.remove(r7);
        r8 = "pref_camera_exposure_key";
        r7.remove(r8);
        r7 = r10.mTargetMode;
        r7 = r4.getPersistValue(r7);
        r8 = r4.isValidFlashValue(r7);
        if (r8 != 0) goto L_0x005a;
    L_0x0050:
        r7 = r10.mTargetMode;
        r7 = r4.getKey(r7);
        r5.remove(r7);
        goto L_0x0071;
    L_0x005a:
        r8 = "2";
        r7 = r7.equals(r8);
        if (r7 == 0) goto L_0x0071;
    L_0x0062:
        r7 = r10.mTargetMode;
        r7 = r4.getKey(r7);
        r8 = r10.mTargetMode;
        r8 = r4.getDefaultValue(r8);
        r5.putString(r7, r8);
    L_0x0071:
        r7 = r10.mTargetMode;
        r8 = 167; // 0xa7 float:2.34E-43 double:8.25E-322;
        if (r7 != r8) goto L_0x0096;
    L_0x0077:
        r7 = com.android.camera.CameraAppImpl.getAndroidContext();
        r9 = 2131427493; // 0x7f0b00a5 float:1.8476604E38 double:1.053065101E-314;
        r7 = r7.getString(r9);
        r9 = "pref_qc_camera_iso_key";
        r7 = r2.getString(r9, r7);
        r9 = 2131623962; // 0x7f0e001a float:1.887509E38 double:1.0531621695E-314;
        r7 = com.android.camera.Util.isStringValueContained(r7, r9);
        if (r7 != 0) goto L_0x0096;
    L_0x0091:
        r7 = "pref_qc_camera_iso_key";
        r5.remove(r7);
    L_0x0096:
        r7 = com.mi.config.b.gr();
        if (r7 != 0) goto L_0x00a7;
    L_0x009c:
        r7 = "pref_focus_position_key";
        r5.remove(r7);
        r7 = "pref_qc_camera_exposuretime_key";
        r5.remove(r7);
        goto L_0x00c1;
    L_0x00a7:
        r7 = r10.mTargetMode;
        if (r7 != r8) goto L_0x00c1;
    L_0x00ab:
        r7 = new com.android.camera.data.data.config.ComponentManuallyET;
        r7.<init>(r2);
        r8 = r10.mTargetMode;
        r8 = r7.getComponentValue(r8);
        r8 = r7.checkValueValid(r8);
        if (r8 != 0) goto L_0x00c1;
    L_0x00bc:
        r8 = r10.mTargetMode;
        r7.resetComponentValue(r8);
    L_0x00c1:
        r7 = com.android.camera.Util.isLabOptionsVisible();
        if (r7 != 0) goto L_0x00f8;
    L_0x00c7:
        r7 = r0.editor();
        r8 = "pref_camera_facedetection_key";
        r7 = r7.remove(r8);
        r8 = "pref_camera_portrait_with_facebeauty_key";
        r7 = r7.remove(r8);
        r8 = "pref_camera_facedetection_auto_hidden_key";
        r7 = r7.remove(r8);
        r8 = "pref_camera_dual_enable_key";
        r7 = r7.remove(r8);
        r8 = "pref_camera_dual_sat_enable_key";
        r7 = r7.remove(r8);
        r8 = "pref_camera_mfnr_sat_enable_key";
        r7 = r7.remove(r8);
        r8 = "pref_camera_sr_enable_key";
        r7 = r7.remove(r8);
        r7.apply();
    L_0x00f8:
        r7 = "pref_camera_antibanding_key";
        r8 = "1";
        r7 = r0.getString(r7, r8);
        r7 = com.android.camera.Util.isValidValue(r7);
        if (r7 != 0) goto L_0x0113;
    L_0x0106:
        r7 = r0.editor();
        r8 = "pref_camera_antibanding_key";
        r7 = r7.remove(r8);
        r7.apply();
    L_0x0113:
        r7 = r10.mResetType;
        r8 = 1;
        r9 = 0;
        switch(r7) {
            case 1: goto L_0x01ca;
            case 2: goto L_0x015b;
            case 3: goto L_0x011c;
            case 4: goto L_0x011a;
            case 5: goto L_0x011c;
            case 6: goto L_0x015b;
            default: goto L_0x011a;
        };
    L_0x011a:
        goto L_0x0220;
    L_0x011c:
        r2 = r10.mTargetMode;
        switch(r2) {
            case 161: goto L_0x0148;
            case 162: goto L_0x013e;
            case 163: goto L_0x0121;
            case 164: goto L_0x0121;
            case 165: goto L_0x0121;
            case 166: goto L_0x013a;
            case 167: goto L_0x0138;
            case 168: goto L_0x0133;
            case 169: goto L_0x0133;
            case 170: goto L_0x0133;
            case 171: goto L_0x0126;
            default: goto L_0x0121;
        };
    L_0x0121:
        r2 = r0.getCurrentCameraId();
        goto L_0x014d;
    L_0x0126:
        r2 = com.mi.config.b.hb();
        if (r2 == 0) goto L_0x0131;
    L_0x012c:
        r2 = r0.getCurrentCameraId();
        goto L_0x014d;
        goto L_0x013c;
    L_0x0133:
        r2 = r0.getCurrentCameraId();
        goto L_0x014d;
        goto L_0x013c;
    L_0x013c:
        r2 = r9;
        goto L_0x014d;
    L_0x013e:
        r2 = r0.getCurrentCameraId();
        if (r2 != 0) goto L_0x014d;
    L_0x0144:
        r6.removeOtherVideoMode();
        goto L_0x014d;
    L_0x0148:
        r2 = r0.getCurrentCameraId();
    L_0x014d:
        r0.setCameraIdTransient(r2);
        r4 = r10.mTargetMode;
        r4 = r0.getDataBackUpKey(r4);
        r6.revertRunning(r1, r4, r2);
        goto L_0x0220;
    L_0x015b:
        r10.resetFlash(r4, r5);
        r4 = r2.getComponentHdr();
        r10.resetHdr(r4, r5);
        r4 = r2.getComponentConfigBeauty();
        r10.resetVideoBeauty(r4, r5);
        r4 = "pref_eye_light_type_key";
        r5.remove(r4);
        r4 = r2.getComponentConfigSlowMotion();
        r7 = r10.mTargetMode;
        r4 = r4.getKey(r7);
        r5.remove(r4);
        r4 = r0.getCurrentCameraId();
        if (r4 != 0) goto L_0x0196;
    L_0x0184:
        r2 = r2.getComponentConfigBeauty();
        r10.resetBeauty(r2, r5);
        r2 = com.android.camera.data.DataRepository.provider();
        r2 = r2.dataConfig(r8);
        r2 = (com.android.camera.data.data.config.DataItemConfig) r2;
        goto L_0x01a0;
    L_0x0196:
        r2 = com.android.camera.data.DataRepository.provider();
        r2 = r2.dataConfig(r9);
        r2 = (com.android.camera.data.data.config.DataItemConfig) r2;
    L_0x01a0:
        r4 = r2.editor();
        r7 = r2.getComponentFlash();
        r10.resetFlash(r7, r4);
        r7 = r2.getComponentHdr();
        r10.resetHdr(r7, r4);
        r2 = r2.getComponentConfigBeauty();
        r10.resetVideoBeauty(r2, r4);
        r2 = "pref_eye_light_type_key";
        r4.remove(r2);
        r4.apply();
        r1.clearArrayMap();
        r6.clearBackUp();
        r1 = r10.mTargetMode;
        goto L_0x0220;
    L_0x01ca:
        r2 = r10.mTargetMode;
        r2 = r0.getDataBackUpKey(r2);
        r7 = r0.getCurrentCameraId();
        r6.revertRunning(r1, r2, r7);
        r1 = r10.mTargetMode;
        r1 = r4.getPersistValue(r1);
        r2 = "2";
        r1 = r1.equals(r2);
        if (r1 == 0) goto L_0x01f4;
    L_0x01e5:
        r1 = r10.mTargetMode;
        r1 = r4.getKey(r1);
        r2 = r10.mTargetMode;
        r2 = r4.getDefaultValue(r2);
        r5.putString(r1, r2);
    L_0x01f4:
        r1 = r10.mTargetMode;
        r2 = 163; // 0xa3 float:2.28E-43 double:8.05E-322;
        if (r1 == r2) goto L_0x0220;
    L_0x01fa:
        r1 = r10.mTargetMode;
        r2 = 165; // 0xa5 float:2.31E-43 double:8.15E-322;
        if (r1 == r2) goto L_0x0220;
    L_0x0200:
        r1 = r10.mTargetMode;
        r2 = 171; // 0xab float:2.4E-43 double:8.45E-322;
        if (r1 == r2) goto L_0x0220;
    L_0x0206:
        r1 = r10.mTargetMode;
        r2 = 162; // 0xa2 float:2.27E-43 double:8.0E-322;
        if (r1 == r2) goto L_0x0220;
    L_0x020c:
        r1 = r10.mTargetMode;
        r2 = 169; // 0xa9 float:2.37E-43 double:8.35E-322;
        if (r1 == r2) goto L_0x0220;
    L_0x0212:
        r1 = r10.mTargetMode;
        r2 = 168; // 0xa8 float:2.35E-43 double:8.3E-322;
        if (r1 == r2) goto L_0x0220;
    L_0x0218:
        r1 = r10.mTargetMode;
        r2 = 170; // 0xaa float:2.38E-43 double:8.4E-322;
        if (r1 == r2) goto L_0x0220;
    L_0x021e:
        r1 = r10.mTargetMode;
    L_0x0220:
        r1 = com.android.camera.data.DataRepository.dataItemFeature();
        r1 = r1.fD();
        r2 = r10.mResetType;
        r4 = 3;
        if (r2 != r4) goto L_0x0235;
    L_0x022d:
        r0 = r0.getCurrentCameraId();
        if (r3 != r0) goto L_0x0235;
        r1 = r9;
    L_0x0235:
        if (r1 == 0) goto L_0x023c;
    L_0x0237:
        r0 = "pref_lens_dirty_detect_enabled_key";
        r5.putBoolean(r0, r8);
    L_0x023c:
        r5.apply();
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.module.loader.FunctionCameraPrepare.reconfigureData():void");
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
}
