package com.android.camera.module.impl.component;

import com.android.camera.ActivityBase;
import com.android.camera.CameraSettings;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.config.ComponentManuallyDualLens;
import com.android.camera.data.data.config.ComponentManuallyET;
import com.android.camera.data.data.config.ComponentManuallyFocus;
import com.android.camera.data.data.config.ComponentManuallyISO;
import com.android.camera.data.data.config.ComponentManuallyWB;
import com.android.camera.effect.EffectController;
import com.android.camera.module.BaseModule;
import com.android.camera.module.loader.StartControl;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.ManuallyValueChanged;
import com.android.camera.protocol.ModeProtocol.TopAlert;
import com.android.camera.statistic.CameraStatUtil;
import com.mi.config.b;

public class ManuallyValueChangeImpl implements ManuallyValueChanged {
    private static final String TAG = ManuallyValueChangeImpl.class.getSimpleName();
    private ActivityBase mActivity;

    public static ManuallyValueChangeImpl create(ActivityBase activityBase) {
        return new ManuallyValueChangeImpl(activityBase);
    }

    public ManuallyValueChangeImpl(ActivityBase activityBase) {
        this.mActivity = activityBase;
    }

    public BaseModule getBaseModule() {
        return (BaseModule) this.mActivity.getCurrentModule();
    }

    public void registerProtocol() {
        ModeCoordinatorImpl.getInstance().attachProtocol(174, this);
    }

    public void unRegisterProtocol() {
        ModeCoordinatorImpl.getInstance().detachProtocol(174, this);
    }

    public void onWBValueChanged(ComponentManuallyWB componentManuallyWB, String str, boolean z) {
        if (!z) {
            componentManuallyWB.getKey(167);
        }
        if (z) {
            str = "manual";
        }
        CameraStatUtil.trackAwbChanged(str);
        getBaseModule().updatePreferenceInWorkThread(6);
    }

    public void onFocusValueChanged(ComponentManuallyFocus componentManuallyFocus, String str, String str2) {
        if (!CameraSettings.getMappingFocusMode(Integer.valueOf(str).intValue()).equals(CameraSettings.getMappingFocusMode(Integer.valueOf(str2).intValue()))) {
            CameraSettings.setFocusModeSwitching(true);
            boolean equals = str2.equals(componentManuallyFocus.getDefaultValue(167));
            if (b.gU()) {
                TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
                if (equals) {
                    topAlert.removeConfigItem(199);
                    EffectController.getInstance().setDrawPeaking(false);
                } else {
                    topAlert.insertConfigItem(199);
                    if (DataRepository.dataItemRunning().isSwitchOn("pref_camera_peak_key")) {
                        EffectController.getInstance().setDrawPeaking(true);
                    }
                }
            }
        }
        getBaseModule().updatePreferenceInWorkThread(14);
    }

    public void onETValueChanged(ComponentManuallyET componentManuallyET, String str) {
        CameraStatUtil.trackExposureTimeChanged(str);
        getBaseModule().updatePreferenceInWorkThread(16, 20);
    }

    public void onISOValueChanged(ComponentManuallyISO componentManuallyISO, String str) {
        CameraStatUtil.trackIsoChanged(str);
        getBaseModule().updatePreferenceInWorkThread(15);
    }

    public void onDualZoomHappened(boolean z) {
        BaseModule baseModule = getBaseModule();
        if (baseModule.isAlive() && !CameraSettings.isSwitchCameraZoomMode() && baseModule.getActualCameraId() == Camera2DataContainer.getInstance().getMuxCameraId()) {
            baseModule.notifyDualZoom(z);
        }
    }

    public void onDualLensZooming(boolean z) {
        BaseModule baseModule = getBaseModule();
        if (baseModule.isAlive() && !CameraSettings.isSwitchCameraZoomMode() && baseModule.getActualCameraId() == Camera2DataContainer.getInstance().getMuxCameraId()) {
            baseModule.notifyZooming(z);
        }
    }

    public void onDualLensSwitch(ComponentManuallyDualLens componentManuallyDualLens, int i) {
        String next = ComponentManuallyDualLens.next(componentManuallyDualLens.getComponentValue(i), i);
        componentManuallyDualLens.setComponentValue(i, next);
        CameraSettings.setUltraWideConfig(i, ComponentManuallyDualLens.LENS_ULTRA.equalsIgnoreCase(next));
        if (!ComponentManuallyDualLens.LENS_WIDE.equalsIgnoreCase(next)) {
            CameraSettings.setUltraPixelPhotographyConfig(false);
        }
        CameraStatUtil.trackLensChanged(next);
        this.mActivity.onModeSelected(StartControl.create(i).setResetType(5).setViewConfigType(2).setNeedBlurAnimation(true));
    }

    public void onDualZoomValueChanged(float f, boolean z) {
        if (getBaseModule().isAlive()) {
            getBaseModule().onZoomRatioChanged(f, z);
        }
    }

    public void onBokehFNumberValueChanged(String str) {
        CameraSettings.writeFNumber(str);
        getBaseModule().updatePreferenceInWorkThread(48);
    }
}
