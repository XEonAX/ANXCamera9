package com.android.camera.module.impl.component;

import android.content.Intent;
import android.provider.MiuiSettings.System;
import android.support.annotation.StringRes;
import android.text.TextUtils;
import com.android.camera.ActivityBase;
import com.android.camera.BasePreferenceActivity;
import com.android.camera.CameraIntentManager;
import com.android.camera.CameraPreferenceActivity;
import com.android.camera.CameraSettings;
import com.android.camera.MutexModeManager;
import com.android.camera.R;
import com.android.camera.ThermalDetector;
import com.android.camera.ToastUtils;
import com.android.camera.Util;
import com.android.camera.constant.BeautyConstant;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.config.ComponentConfigBeauty;
import com.android.camera.data.data.config.ComponentConfigBeautyBody;
import com.android.camera.data.data.config.ComponentConfigFlash;
import com.android.camera.data.data.config.ComponentConfigHdr;
import com.android.camera.data.data.config.ComponentConfigSlowMotion;
import com.android.camera.data.data.config.ComponentConfigUltraPixel;
import com.android.camera.data.data.config.DataItemConfig;
import com.android.camera.data.data.config.SupportedConfigFactory;
import com.android.camera.data.data.global.DataItemGlobal;
import com.android.camera.data.data.runing.ComponentRunningLiveShot;
import com.android.camera.data.data.runing.ComponentRunningTiltValue;
import com.android.camera.data.data.runing.ComponentRunningTimer;
import com.android.camera.data.data.runing.DataItemRunning;
import com.android.camera.effect.EffectController;
import com.android.camera.effect.FilterInfo;
import com.android.camera.fragment.manually.ManuallyListener;
import com.android.camera.log.Log;
import com.android.camera.module.BaseModule;
import com.android.camera.module.Camera2Module;
import com.android.camera.module.ModuleManager;
import com.android.camera.module.loader.StartControl;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.ActionProcessing;
import com.android.camera.protocol.ModeProtocol.BaseDelegate;
import com.android.camera.protocol.ModeProtocol.BokehFNumberController;
import com.android.camera.protocol.ModeProtocol.BottomMenuProtocol;
import com.android.camera.protocol.ModeProtocol.BottomPopupTips;
import com.android.camera.protocol.ModeProtocol.ConfigChanges;
import com.android.camera.protocol.ModeProtocol.DualController;
import com.android.camera.protocol.ModeProtocol.FilterProtocol;
import com.android.camera.protocol.ModeProtocol.MainContentProtocol;
import com.android.camera.protocol.ModeProtocol.ManuallyAdjust;
import com.android.camera.protocol.ModeProtocol.MiBeautyProtocol;
import com.android.camera.protocol.ModeProtocol.TopAlert;
import com.android.camera.protocol.ModeProtocol.UltraWideProtocol;
import com.android.camera.protocol.ModeProtocol.VerticalProtocol;
import com.android.camera.statistic.CameraStat;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera2.Camera2Proxy;
import com.android.camera2.CameraCapabilities;
import java.util.HashMap;
import java.util.Map;

public class ConfigChangeImpl implements ConfigChanges {
    private static final String TAG = ConfigChangeImpl.class.getSimpleName();
    private ActivityBase mActivity;
    private boolean mLastAiSceneStateOn = CameraSettings.getAiSceneOpen();
    private int[] mRecordingMutexElements;

    public static void preload() {
        Log.i(TAG, "preload");
    }

    public static ConfigChangeImpl create(ActivityBase activityBase) {
        return new ConfigChangeImpl(activityBase);
    }

    public ConfigChangeImpl(ActivityBase activityBase) {
        this.mActivity = activityBase;
    }

    private BaseModule getBaseModule() {
        return (BaseModule) this.mActivity.getCurrentModule();
    }

    public void registerProtocol() {
        ModeCoordinatorImpl.getInstance().attachProtocol(164, this);
    }

    public void unRegisterProtocol() {
        this.mActivity = null;
        ModeCoordinatorImpl.getInstance().detachProtocol(164, this);
    }

    public void onConfigChanged(int i) {
        if (isAlive()) {
            if (SupportedConfigFactory.isMutexConfig(i)) {
                DataItemRunning dataItemRunning = DataRepository.dataItemRunning();
                int[] iArr = SupportedConfigFactory.MUTEX_MENU_CONFIGS;
                int length = iArr.length;
                int i2 = 0;
                boolean z = i2;
                while (i2 < length) {
                    int i3 = iArr[i2];
                    if (i3 != i) {
                        if (i3 != 203) {
                            switch (i3) {
                                case 250:
                                    break;
                                case 251:
                                    z = closeComponentUltraPixelFront();
                                    break;
                                default:
                                    if (!dataItemRunning.isSwitchOn(SupportedConfigFactory.getConfigKey(i3))) {
                                        break;
                                    }
                                    applyConfig(i3, 3);
                                    break;
                            }
                        } else if (((ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162)).isShowLightingView()) {
                            showOrHideLighting(false);
                        }
                    }
                    i2++;
                }
                getBaseModule().onSharedPreferenceChanged();
                applyConfig(i, 1);
                if (CameraSettings.isRearMenuUltraPixelPhotographyOn() && i != 250) {
                    applyConfig(250, 3);
                }
                if (z && getBaseModule() != null) {
                    Log.d(TAG, "onConfigChanged: need restart module.");
                    getBaseModule().restartModule();
                }
            } else {
                applyConfig(i, 1);
            }
        }
    }

    public void onThermalNotification(int i) {
        if (isAlive()) {
            BaseModule baseModule = getBaseModule();
            if (baseModule == null || !baseModule.isFrameAvailable() || baseModule.isSelectingCapturedResult()) {
                Log.w(TAG, "onThermalNotification current module is null ready");
            } else if (!DataRepository.dataItemConfig().getComponentFlash().isEmpty()) {
                String str = "";
                if (ThermalDetector.thermalConstrained(i)) {
                    Log.w(TAG, "thermalConstrained");
                    str = "0";
                } else if (baseModule.isThermalThreshold() && ((i == 2 && CameraSettings.isFrontCamera()) || i == 3)) {
                    Log.w(TAG, "recording time is up to thermal threshold");
                    str = "0";
                }
                updateFlashModeAndRefreshUI(baseModule, str);
            }
        }
    }

    private void updateFlashModeAndRefreshUI(BaseModule baseModule, String str) {
        int moduleIndex = baseModule.getModuleIndex();
        String str2 = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("updateFlashModeAndRefreshUI flashMode = ");
        stringBuilder.append(str);
        Log.d(str2, stringBuilder.toString());
        if (!TextUtils.isEmpty(str)) {
            CameraSettings.setFlashMode(moduleIndex, str);
        }
        if ("0".equals(str)) {
            if (CameraSettings.isFrontCamera()) {
                ToastUtils.showToast(this.mActivity, (int) R.string.close_front_flash_toast);
            } else {
                ToastUtils.showToast(this.mActivity, (int) R.string.close_back_flash_toast);
            }
        }
        baseModule.updatePreferenceInWorkThread(10);
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        if (topAlert != null) {
            topAlert.updateConfigItem(193);
        }
    }

    public void reCheckMutexConfigs(int i) {
        if (isAlive() && getBaseModule().isCreated()) {
            DataItemRunning dataItemRunning = DataRepository.dataItemRunning();
            for (int i2 : SupportedConfigFactory.MUTEX_MENU_CONFIGS) {
                if (i2 != 203) {
                    if (i2 != 251 && dataItemRunning.isSwitchOn(SupportedConfigFactory.getConfigKey(i2))) {
                        applyConfig(i2, 2);
                    }
                } else if (dataItemRunning.getComponentRunningLighting().isSwitchOn(i)) {
                    reCheckLighting();
                }
            }
        }
    }

    public void reCheckUltraPixelPhotoGraphy() {
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        if (topAlert != null && this.mActivity != null) {
            BaseModule baseModule = getBaseModule();
            if (baseModule != null) {
                int moduleIndex = baseModule.getModuleIndex();
                if (moduleIndex == 163 || moduleIndex == 167) {
                    CameraCapabilities cameraCapabilities = baseModule.getCameraCapabilities();
                    boolean isRearMenuUltraPixelPhotographyOn;
                    if (CameraSettings.isSupportedUltraPixelPhotography(cameraCapabilities)) {
                        isRearMenuUltraPixelPhotographyOn = CameraSettings.isRearMenuUltraPixelPhotographyOn();
                        boolean isUltraPixelPhotographyOn = CameraSettings.isUltraPixelPhotographyOn();
                        ComponentConfigUltraPixel rearComponentConfigUltraPixel = DataRepository.dataItemConfig().getRearComponentConfigUltraPixel();
                        if (isRearMenuUltraPixelPhotographyOn || isUltraPixelPhotographyOn) {
                            topAlert.alertTopHint(0, rearComponentConfigUltraPixel.getUltraPixelOpenTip());
                        }
                    } else if (CameraSettings.isFrontSupportedUltraPixelPhotography(cameraCapabilities)) {
                        isRearMenuUltraPixelPhotographyOn = CameraSettings.isFrontMenuUltraPixelPhotographyOn();
                        ComponentConfigUltraPixel frontComponentConfigUltraPixel = DataRepository.dataItemConfig().getFrontComponentConfigUltraPixel();
                        if (isRearMenuUltraPixelPhotographyOn) {
                            topAlert.alertTopHint(0, frontComponentConfigUltraPixel.getUltraPixelOpenTip());
                        }
                    }
                }
            }
        }
    }

    /* JADX WARNING: Missing block: B:14:0x0037, code:
            return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void reCheckLiveShot() {
        if (DataRepository.dataItemFeature().fC()) {
            TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
            if (topAlert != null) {
                BaseModule baseModule = getBaseModule();
                if (baseModule != null && baseModule.getModuleIndex() == 163 && CameraSettings.isLiveShotOn()) {
                    topAlert.alertSwitchHint(1, (int) R.string.camera_liveshot_on_tip);
                }
            }
        }
    }

    public void reCheckHandGesture() {
        if (CameraSettings.isHangGestureOpen()) {
            TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
            if (topAlert != null) {
                topAlert.alertTopHint(0, (int) R.string.hand_gesture_tip);
            }
        }
    }

    private void applyConfig(int i, int i2) {
        if (i == 199) {
            configFocusPeakSwitch(i2);
        } else if (i == 209) {
            configSwitchUltraPixelPhotography();
        } else if (i != 243) {
            switch (i) {
                case 195:
                    configPortraitSwitch(i2);
                    return;
                case 196:
                    beautyMutexHandle();
                    showOrHideFilter();
                    return;
                default:
                    switch (i) {
                        case 201:
                            configAiSceneSwitch(i2);
                            return;
                        case 202:
                            configVideoHFR();
                            return;
                        case 203:
                            showOrHideLighting(true);
                            return;
                        case 204:
                            configFPS960();
                            return;
                        case 205:
                            configSwitchUltraWide();
                            return;
                        case 206:
                            configLiveShotSwitch(i2);
                            return;
                        case 207:
                            configSwitchUltraWideBokeh();
                            return;
                        default:
                            switch (i) {
                                case 225:
                                    showSetting();
                                    return;
                                case 226:
                                    configTimerSwitch();
                                    return;
                                default:
                                    switch (i) {
                                        case 228:
                                            configTiltSwitch(i2);
                                            return;
                                        case 229:
                                            configGradienterSwitch(i2);
                                            return;
                                        case 230:
                                            configHHTSwitch(i2);
                                            return;
                                        case 231:
                                            configMagicFocusSwitch();
                                            return;
                                        case 232:
                                            configVideoSlow();
                                            return;
                                        case 233:
                                            configVideoFast();
                                            return;
                                        case 234:
                                            configScene(i2);
                                            return;
                                        case 235:
                                            configGroupSwitch(i2);
                                            return;
                                        case 236:
                                            configMagicMirrorSwitch(i2);
                                            return;
                                        case 237:
                                            configRawSwitch();
                                            return;
                                        case 238:
                                            configGenderAgeSwitch(i2);
                                            return;
                                        case 239:
                                            configBeautySwitch(i2);
                                            return;
                                        case 240:
                                            configDualWaterMarkSwitch();
                                            return;
                                        case 241:
                                            configSuperResolutionSwitch(i2);
                                            return;
                                        default:
                                            switch (i) {
                                                case 246:
                                                    configMoon(true);
                                                    return;
                                                case 247:
                                                    configMoonNight();
                                                    return;
                                                case 248:
                                                    configSilhouette();
                                                    return;
                                                case 249:
                                                    configMoonBacklight();
                                                    return;
                                                case 250:
                                                    configSwitchMenuUltraPixelPhotography(i2);
                                                    return;
                                                case 251:
                                                    configSwitchMenuUltraPixelPhotographyFront();
                                                    return;
                                                case 252:
                                                    configSwitchHandGesture();
                                                    return;
                                                case 253:
                                                    configAutoZoom();
                                                    return;
                                                default:
                                                    return;
                                            }
                                    }
                            }
                    }
            }
        } else {
            configVideoBokehSwitch(i2);
        }
    }

    private void configSwitchHandGesture() {
        if (DataRepository.dataItemFeature().fR() && ((TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172)) != null) {
            BaseModule baseModule = getBaseModule();
            if (baseModule != null && (baseModule.getModuleIndex() == 163 || baseModule.getModuleIndex() == 171)) {
                boolean isHangGestureOpen = CameraSettings.isHangGestureOpen() ^ 1;
                CameraSettings.setHandGestureStatus(isHangGestureOpen);
                BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
                if (isHangGestureOpen) {
                    bottomPopupTips.showTips(16, R.string.hand_gesture_open_tip, 2);
                }
                ((Camera2Module) getBaseModule()).onHanGestureSwitched(isHangGestureOpen);
            }
        }
    }

    private void configAutoZoom() {
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        if (DataRepository.dataItemRunning().isSwitchOn("pref_camera_auto_zoom")) {
            DataRepository.dataItemRunning().switchOff("pref_camera_auto_zoom");
        } else {
            DataRepository.dataItemRunning().switchOn("pref_camera_auto_zoom");
        }
        topAlert.updateConfigItem(253);
        closeVideoFast();
        closeMutexElement(SupportedConfigFactory.CLOSE_BY_VIDEO, 239);
        this.mActivity.onModeSelected(StartControl.create(162).setViewConfigType(2).setNeedBlurAnimation(true).setNeedReConfigureData(false).setNeedReConfigureCamera(true));
        BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
        boolean isSwitchOn = DataRepository.dataItemRunning().isSwitchOn("pref_camera_auto_zoom");
        int i = DataRepository.dataItemGlobal().getInt("pref_auto_zoom_ultra_count", 0);
        if (isSwitchOn) {
            topAlert.alertSwitchHint(1, (int) R.string.autozoom_hint);
            if (i < 3) {
                bottomPopupTips.showTips(14, R.string.ultra_wide_recommend_tip_hint, 6);
                DataRepository.dataItemGlobal().putInt("pref_auto_zoom_ultra_count", i + 1);
            }
        } else {
            topAlert.alertSwitchHint(1, (int) R.string.autozoom_disabled_hint);
        }
        bottomPopupTips.updateTipImage();
    }

    private void configSwitchMenuUltraPixelPhotography(int i) {
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        if (topAlert != null && this.mActivity != null) {
            BaseModule baseModule = getBaseModule();
            if (baseModule != null) {
                int moduleIndex = baseModule.getModuleIndex();
                if (moduleIndex == 163) {
                    if (CameraSettings.isSupportedUltraPixelPhotography(baseModule.getCameraCapabilities()) || DataRepository.dataItemFeature().fP() > 0) {
                        boolean isRearMenuUltraPixelPhotographyOn = CameraSettings.isRearMenuUltraPixelPhotographyOn();
                        boolean z = isRearMenuUltraPixelPhotographyOn ^ 1;
                        ComponentConfigUltraPixel rearComponentConfigUltraPixel = DataRepository.dataItemConfig().getRearComponentConfigUltraPixel();
                        boolean z2 = false;
                        if (i == 1) {
                            if (CameraSettings.isUltraWideConfigOpen(moduleIndex)) {
                                CameraSettings.setUltraWideConfig(moduleIndex, false);
                                ((BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175)).updateLeftTipImage();
                            }
                            Object componentValue = DataRepository.dataItemConfig().getComponentHdr().getComponentValue(getBaseModule().getModuleIndex());
                            if (!(TextUtils.isEmpty(componentValue) || componentValue.equals("off"))) {
                                DataRepository.dataItemConfig().getComponentHdr().setComponentValue(getBaseModule().getModuleIndex(), "off");
                            }
                            if (CameraSettings.getAiSceneOpen()) {
                                configAiSceneSwitch(3);
                            }
                            if (z) {
                                DataRepository.dataItemConfig().getComponentConfigBeautyBody().setClosed(true);
                                DataRepository.dataItemConfig().getComponentConfigBeauty().setClosed(true, moduleIndex);
                            } else {
                                DataRepository.dataItemConfig().getComponentConfigBeautyBody().setClosed(false);
                                DataRepository.dataItemConfig().getComponentConfigBeauty().setClosed(false, moduleIndex);
                            }
                            CameraSettings.setRearMenuUltraPixelPhotographyConfig(z);
                            baseModule.restartModule();
                            if (z) {
                                topAlert.alertTopHint(0, rearComponentConfigUltraPixel.getUltraPixelOpenTip());
                            } else {
                                topAlert.alertTopHint(8, rearComponentConfigUltraPixel.getUltraPixelCloseTip());
                                topAlert.alertSwitchHint(1, rearComponentConfigUltraPixel.getUltraPixelCloseTip());
                            }
                        } else if (i == 3 && isRearMenuUltraPixelPhotographyOn) {
                            DataRepository.dataItemConfig().getComponentConfigBeautyBody().setClosed(false);
                            DataRepository.dataItemConfig().getComponentConfigBeautyBody().setClosed(false);
                            CameraSettings.setRearMenuUltraPixelPhotographyConfig(false);
                            baseModule.restartModule();
                            topAlert.alertTopHint(8, rearComponentConfigUltraPixel.getUltraPixelCloseTip());
                        }
                        BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
                        DualController dualController = (DualController) ModeCoordinatorImpl.getInstance().getAttachProtocol(182);
                        MiBeautyProtocol miBeautyProtocol = (MiBeautyProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(194);
                        if (z) {
                            if (bottomPopupTips != null) {
                                bottomPopupTips.directHideTipImage();
                                bottomPopupTips.directShowOrHideLeftTipImage(false);
                            }
                            if (dualController != null) {
                                dualController.hideZoomButton();
                                if (topAlert != null) {
                                    topAlert.alertUpdateValue(2);
                                }
                            }
                        } else {
                            if (miBeautyProtocol != null) {
                                z2 = miBeautyProtocol.isBeautyPanelShow();
                            }
                            if (!(bottomPopupTips == null || z2)) {
                                bottomPopupTips.reInitTipImage();
                            }
                            if (!(dualController == null || z2)) {
                                dualController.showZoomButton();
                                if (topAlert != null) {
                                    topAlert.clearAlertStatus();
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    private void configSwitchMenuUltraPixelPhotographyFront() {
        if (((TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172)) != null && this.mActivity != null) {
            BaseModule baseModule = getBaseModule();
            if (baseModule != null && CameraSettings.isFrontSupportedUltraPixelPhotography(baseModule.getCameraCapabilities()) && DataRepository.dataItemFeature().fQ() > 0) {
                boolean isFrontMenuUltraPixelPhotographyOn = CameraSettings.isFrontMenuUltraPixelPhotographyOn() ^ true;
                if (isFrontMenuUltraPixelPhotographyOn) {
                    closeMutexElement(SupportedConfigFactory.CLOSE_BY_ULTRA_PIXEL, 196);
                    SupportedConfigFactory.gRecordingMutexElements = this.mRecordingMutexElements;
                } else {
                    this.mRecordingMutexElements = SupportedConfigFactory.gRecordingMutexElements;
                    restoreAllMutexElement(SupportedConfigFactory.CLOSE_BY_ULTRA_PIXEL);
                }
                CameraSettings.setFrontMenuUltraPixelPhotographyConfig(isFrontMenuUltraPixelPhotographyOn);
                baseModule.restartModule();
            }
        }
    }

    private void configMoonBacklight() {
        BaseModule baseModule = getBaseModule();
        if (baseModule instanceof Camera2Module) {
            ((Camera2Module) baseModule).updateBacklight();
        }
    }

    private void configSilhouette() {
        BaseModule baseModule = getBaseModule();
        if (baseModule instanceof Camera2Module) {
            ((Camera2Module) baseModule).updateSilhouette();
        }
    }

    private void configMoon(boolean z) {
        BaseModule baseModule = getBaseModule();
        if (baseModule instanceof Camera2Module) {
            ((Camera2Module) baseModule).updateMoon(z);
        }
    }

    private void configMoonNight() {
        BaseModule baseModule = getBaseModule();
        if (baseModule instanceof Camera2Module) {
            Camera2Module camera2Module = (Camera2Module) baseModule;
            configMoon(false);
            camera2Module.updateMoonNight();
        }
    }

    private void configSwitchUltraWide() {
        int moduleIndex = getBaseModule().getModuleIndex();
        int i = 169 == moduleIndex ? 1 : false;
        boolean isUltraWideConfigOpen = true ^ CameraSettings.isUltraWideConfigOpen(moduleIndex);
        if (isUltraWideConfigOpen && i != 0) {
            DataRepository.dataItemGlobal().setCurrentMode(162);
            TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
            if (topAlert != null) {
                topAlert.refreshExtraMenu();
            }
        }
        if (CameraSettings.isRearMenuUltraPixelPhotographyOn()) {
            CameraSettings.setRearMenuUltraPixelPhotographyConfig(false);
        }
        CameraSettings.setUltraWideConfig(moduleIndex, isUltraWideConfigOpen);
        UltraWideProtocol ultraWideProtocol = (UltraWideProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(200);
        if (ultraWideProtocol != null) {
            ultraWideProtocol.onSwitchUltraWide();
        }
        BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
        if (isUltraWideConfigOpen) {
            bottomPopupTips.showTips(13, R.string.ultra_wide_open_tip, 6, System.SCREEN_KEY_LONG_PRESS_TIMEOUT_DEFAULT);
        } else {
            bottomPopupTips.showTips(13, R.string.ultra_wide_close_tip, 6);
        }
    }

    private void configSwitchUltraPixelPhotography() {
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        if (topAlert != null && this.mActivity != null) {
            BaseModule baseModule = getBaseModule();
            if (baseModule != null && baseModule.getModuleIndex() == 167 && CameraSettings.isSupportedUltraPixelPhotography(baseModule.getCameraCapabilities())) {
                boolean isUltraPixelPhotographyOn = CameraSettings.isUltraPixelPhotographyOn();
                CameraSettings.setUltraPixelPhotographyConfig(isUltraPixelPhotographyOn ^ 1);
                ComponentConfigUltraPixel rearComponentConfigUltraPixel = DataRepository.dataItemConfig().getRearComponentConfigUltraPixel();
                if (isUltraPixelPhotographyOn) {
                    topAlert.alertTopHint(8, rearComponentConfigUltraPixel.getUltraPixelCloseTip());
                    topAlert.alertSwitchHint(2, rearComponentConfigUltraPixel.getUltraPixelCloseTip());
                } else {
                    topAlert.alertTopHint(0, rearComponentConfigUltraPixel.getUltraPixelOpenTip());
                }
                baseModule.restartModule();
            }
        }
    }

    private void configSwitchUltraWideBokeh() {
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        if (topAlert != null && this.mActivity != null) {
            BaseModule baseModule = getBaseModule();
            if (baseModule != null) {
                if (DataRepository.dataItemRunning().isSwitchOn("pref_ultra_wide_bokeh_enabled")) {
                    DataRepository.dataItemRunning().switchOff("pref_ultra_wide_bokeh_enabled");
                    topAlert.alertSwitchHint(2, (int) R.string.ultra_wide_bokeh_close_tip);
                } else {
                    DataRepository.dataItemRunning().switchOn("pref_ultra_wide_bokeh_enabled");
                    topAlert.alertSwitchHint(2, (int) R.string.ultra_wide_bokeh_open_tip);
                }
                baseModule.restartModule();
            }
        }
    }

    private void beautyMutexHandle() {
        BaseDelegate baseDelegate = (BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160);
        if (baseDelegate != null && baseDelegate.getActiveFragment(R.id.bottom_beauty) == 251) {
            baseDelegate.delegateEvent(2);
            if (baseDelegate.getActiveFragment(R.id.bottom_popup_beauty) == 252) {
                baseDelegate.delegateEvent(3);
            }
            ((BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175)).reInitTipImage();
            ((BottomMenuProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(197)).onSwitchCameraActionMenu(0);
        }
    }

    public void showSetting() {
        Intent intent = new Intent();
        intent.setClass(this.mActivity, CameraPreferenceActivity.class);
        intent.putExtra(BasePreferenceActivity.FROM_WHERE, DataRepository.dataItemGlobal().getCurrentMode());
        if (DataRepository.dataItemGlobal().getIntentType() == 1) {
            intent.putExtra(CameraPreferenceActivity.IS_IMAGE_CAPTURE_INTENT, true);
        }
        intent.putExtra(":miui:starting_window_label", this.mActivity.getResources().getString(R.string.pref_camera_settings_category));
        if (this.mActivity.startFromKeyguard()) {
            intent.putExtra("StartActivityWhenLocked", true);
        }
        this.mActivity.getIntent().removeExtra(CameraIntentManager.EXTRAS_CAMERA_FACING);
        this.mActivity.startActivity(intent);
        this.mActivity.setJumpFlag(2);
        trackGotoSettings();
    }

    private void trackGotoSettings() {
        BaseModule baseModule = (BaseModule) this.mActivity.getCurrentModule();
        if (baseModule != null) {
            CameraStatUtil.trackGotoSettings(baseModule.getModuleIndex());
        }
    }

    public void showOrHideFilter() {
        if (((BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160)) != null) {
            ActionProcessing actionProcessing = (ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162);
            boolean isShowLightingView = actionProcessing.isShowLightingView();
            boolean showOrHideFilterView = actionProcessing.showOrHideFilterView();
            BokehFNumberController bokehFNumberController = (BokehFNumberController) ModeCoordinatorImpl.getInstance().getAttachProtocol(210);
            if (showOrHideFilterView && isShowLightingView) {
                String componentValue = DataRepository.dataItemRunning().getComponentRunningLighting().getComponentValue(171);
                DataRepository.dataItemRunning().getComponentRunningLighting().setComponentValue(171, "0");
                setLighting(true, componentValue, "0", false);
                if (bokehFNumberController != null) {
                    bokehFNumberController.showFNumberPanel();
                }
            }
            if (bokehFNumberController != null && bokehFNumberController.isFNumberVisible()) {
                bokehFNumberController.hideFNumberPanel(false, false);
                bokehFNumberController.showFNumberPanel();
            }
            if (Util.UI_DEBUG()) {
                BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
                MiBeautyProtocol miBeautyProtocol = (MiBeautyProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(194);
                if (bottomPopupTips != null) {
                    if (showOrHideFilterView) {
                        bottomPopupTips.updateLeftTipImage();
                    } else if (miBeautyProtocol == null || !miBeautyProtocol.isBeautyPanelShow()) {
                        bottomPopupTips.updateLeftTipImage();
                    }
                }
            } else if (showOrHideFilterView) {
                showCloseTip(1, true);
            } else {
                showCloseTip(1, false);
            }
        }
    }

    public void reCheckLighting() {
        String componentValue = DataRepository.dataItemRunning().getComponentRunningLighting().getComponentValue(171);
        if (!componentValue.equals("0")) {
            ActionProcessing actionProcessing = (ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162);
            if (!actionProcessing.isShowLightingView()) {
                actionProcessing.showOrHideLightingView();
            }
            setLighting(false, "0", componentValue, false);
        }
    }

    public void showOrHideLighting(boolean z) {
        beautyMutexHandle();
        BaseDelegate baseDelegate = (BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160);
        if (baseDelegate != null) {
            boolean showOrHideLightingView = ((ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162)).showOrHideLightingView();
            TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
            BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
            BokehFNumberController bokehFNumberController = (BokehFNumberController) ModeCoordinatorImpl.getInstance().getAttachProtocol(210);
            if (showOrHideLightingView) {
                reCheckLighting();
                DataRepository.dataItemRunning().getComponentConfigFilter().reset(getBaseModule().getModuleIndex());
                setFilter(FilterInfo.FILTER_ID_NONE);
                topAlert.alertLightingTitle(true);
                if (bokehFNumberController != null) {
                    bokehFNumberController.hideFNumberPanel(true, true);
                }
                bottomPopupTips.directHideTipImage();
            } else {
                String componentValue = DataRepository.dataItemRunning().getComponentRunningLighting().getComponentValue(171);
                DataRepository.dataItemRunning().getComponentRunningLighting().setComponentValue(171, "0");
                setLighting(true, componentValue, "0", false);
                bottomPopupTips.reInitTipImage();
                topAlert.alertLightingTitle(false);
                if (bokehFNumberController != null) {
                    bokehFNumberController.showFNumberPanel();
                }
            }
            if (baseDelegate.getActiveFragment(R.id.bottom_action) == 251) {
                baseDelegate.delegateEvent(7);
            }
            if (z) {
                CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_LIGHTING_BUTTON);
            }
            if (Util.UI_DEBUG()) {
                BottomPopupTips bottomPopupTips2 = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
                if (bottomPopupTips2 != null) {
                    if (showOrHideLightingView) {
                        bottomPopupTips2.showCloseTip(2, true);
                    } else {
                        bottomPopupTips2.updateLeftTipImage();
                    }
                }
            } else if (showOrHideLightingView) {
                showCloseTip(2, true);
            } else {
                showCloseTip(2, false);
            }
        }
    }

    public void setLighting(boolean z, String str, String str2, boolean z2) {
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
        VerticalProtocol verticalProtocol = (VerticalProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(198);
        if (str.equals("0") || str2.equals("0")) {
            topAlert.updateConfigItem(203);
            MainContentProtocol mainContentProtocol = (MainContentProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(166);
            ActionProcessing actionProcessing = (ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162);
            if (str2.equals("0")) {
                if (!z) {
                    topAlert.alertLightingTitle(true);
                }
                mainContentProtocol.lightingCancel();
            } else {
                topAlert.alertLightingTitle(false);
                mainContentProtocol.lightingStart();
                actionProcessing.setLightingViewStatus(true);
            }
        }
        bottomPopupTips.setLightingPattern(str2);
        verticalProtocol.setLightingPattern(str2);
        if (str2 == "0") {
            topAlert.alertLightingHint(-1);
            verticalProtocol.alertLightingHint(-1);
        }
        getBaseModule().updatePreferenceInWorkThread(43);
        if (z2) {
            CameraStatUtil.trackLightingChanged(171, str2);
        }
    }

    public void setEyeLight(String str) {
        getBaseModule().updatePreferenceInWorkThread(45);
    }

    public void setFilter(int i) {
        EffectController.getInstance().setInvertFlag(0);
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        if (CameraSettings.isGroupShotOn()) {
            ((ConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(164)).configGroupSwitch(4);
            topAlert.refreshExtraMenu();
        }
        FilterProtocol filterProtocol = (FilterProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(165);
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("setFilter: filterId = ");
        stringBuilder.append(i);
        stringBuilder.append(", FilterProtocol = ");
        stringBuilder.append(filterProtocol);
        Log.d(str, stringBuilder.toString());
        if (filterProtocol != null) {
            filterProtocol.onFilterChanged(FilterInfo.getCategory(i), FilterInfo.getIndex(i));
        }
        topAlert.updateConfigItem(196);
        if (CameraSettings.isFrontMenuUltraPixelPhotographyOn()) {
            closeMutexElement(SupportedConfigFactory.CLOSE_BY_FILTER, 251);
        }
    }

    public void configFlash(String str) {
        if (!ModuleManager.isVideoNewSlowMotion()) {
            conflictWithFlashAndHdr();
        }
        getBaseModule().updatePreferenceInWorkThread(11, 10);
    }

    public void configHdr(String str) {
        conflictWithFlashAndHdr();
        getBaseModule().updatePreferenceInWorkThread(11, 10);
        if ("off" != str && CameraSettings.isRearMenuUltraPixelPhotographyOn()) {
            configSwitchMenuUltraPixelPhotography(3);
        }
    }

    public void configGradienterSwitch(int i) {
        boolean state = getState(i, "pref_camera_gradienter_key");
        if (1 == i) {
            trackGradienterChanged(state);
        }
        ((Camera2Module) getBaseModule()).onGradienterSwitched(state);
        EffectController.getInstance().setDrawGradienter(state);
    }

    public void configHHTSwitch(int i) {
        boolean state = getState(i, "pref_camera_hand_night_key");
        if (1 == i) {
            trackHHTChanged(state);
        }
        MutexModeManager mutexModePicker = getBaseModule().getMutexModePicker();
        if (state) {
            updateTipMessage(4, R.string.hine_hht, 2);
            closeMutexElement(SupportedConfigFactory.CLOSE_BY_HHT, 193, 194);
            mutexModePicker.setMutexModeMandatory(3);
            return;
        }
        hideTipMessage(R.string.hine_hht);
        mutexModePicker.clearMandatoryFlag();
        getBaseModule().resetMutexModeManually();
        restoreAllMutexElement(SupportedConfigFactory.CLOSE_BY_HHT);
    }

    public void configSuperResolutionSwitch(int i) {
        boolean state = getState(i, "pref_camera_super_resolution_key");
        if (1 == i) {
            trackSuperResolutionChanged(state);
        }
        MutexModeManager mutexModePicker = getBaseModule().getMutexModePicker();
        if (state) {
            closeMutexElement(SupportedConfigFactory.CLOSE_BY_SUPER_RESOLUTION, 193, 194);
            mutexModePicker.setMutexModeMandatory(10);
            return;
        }
        mutexModePicker.clearMandatoryFlag();
        getBaseModule().resetMutexModeManually();
        restoreAllMutexElement(SupportedConfigFactory.CLOSE_BY_SUPER_RESOLUTION);
    }

    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void configTiltSwitch(int i) {
        DataItemRunning dataItemRunning = DataRepository.dataItemRunning();
        boolean isSwitchOn = dataItemRunning.isSwitchOn("pref_camera_tilt_shift_mode");
        ComponentRunningTiltValue componentRunningTiltValue = dataItemRunning.getComponentRunningTiltValue();
        switch (i) {
            case 1:
                if (!isSwitchOn) {
                    isSwitchOn = true;
                    CameraStatUtil.trackTiltShiftChanged(ComponentRunningTiltValue.TILT_CIRCLE);
                    dataItemRunning.switchOn("pref_camera_tilt_shift_mode");
                    componentRunningTiltValue.setComponentValue(160, ComponentRunningTiltValue.TILT_CIRCLE);
                    break;
                } else if (ComponentRunningTiltValue.TILT_CIRCLE.equals(componentRunningTiltValue.getComponentValue(160))) {
                    CameraStatUtil.trackTiltShiftChanged(ComponentRunningTiltValue.TILT_PARALLEL);
                    componentRunningTiltValue.setComponentValue(160, ComponentRunningTiltValue.TILT_PARALLEL);
                    break;
                } else {
                    CameraStatUtil.trackTiltShiftChanged("off");
                    dataItemRunning.switchOff("pref_camera_tilt_shift_mode");
                }
            case 3:
                dataItemRunning.switchOff("pref_camera_tilt_shift_mode");
                isSwitchOn = false;
                break;
        }
        isSwitchOn = false;
        ((Camera2Module) getBaseModule()).onTiltShiftSwitched(isSwitchOn);
        EffectController.getInstance().setDrawTilt(isSwitchOn);
    }

    public void configTimerSwitch() {
        ComponentRunningTimer componentRunningTimer = DataRepository.dataItemRunning().getComponentRunningTimer();
        String nextValue = componentRunningTimer.getNextValue();
        CameraStatUtil.trackTimerChanged(nextValue);
        componentRunningTimer.setComponentValue(160, nextValue);
    }

    public void configMagicFocusSwitch() {
        trackMagicMirrorChanged(DataRepository.dataItemRunning().triggerSwitchAndGet("pref_camera_ubifocus_key"));
    }

    public void configGroupSwitch(int i) {
        boolean state = getState(i, "pref_camera_groupshot_mode_key");
        if (1 == i) {
            trackGroupChanged(state);
        }
        Camera2Module camera2Module = (Camera2Module) getBaseModule();
        if (state) {
            if (!isBeautyPanelShow()) {
                updateTipMessage(4, R.string.hint_groupshot, 2);
            }
            closeMutexElement(SupportedConfigFactory.CLOSE_BY_GROUP, 193, 194, 196, 201);
        } else {
            restoreAllMutexElement(SupportedConfigFactory.CLOSE_BY_GROUP);
            hideTipMessage(R.string.hint_groupshot);
        }
        camera2Module.onSharedPreferenceChanged();
        getBaseModule().updatePreferenceInWorkThread(42, 34, 30);
    }

    private boolean isBeautyPanelShow() {
        MiBeautyProtocol miBeautyProtocol = (MiBeautyProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(194);
        if (miBeautyProtocol != null) {
            return miBeautyProtocol.isBeautyPanelShow();
        }
        return false;
    }

    public void configScene(int i) {
        ManuallyAdjust manuallyAdjust = (ManuallyAdjust) ModeCoordinatorImpl.getInstance().getAttachProtocol(181);
        if (getState(i, "pref_camera_scenemode_setting_key")) {
            manuallyAdjust.setManuallyVisible(2, 1, new ManuallyListener() {
                public void onManuallyDataChanged(ComponentData componentData, String str, String str2, boolean z) {
                    ConfigChangeImpl.this.getBaseModule().onSharedPreferenceChanged();
                    ConfigChangeImpl.this.getBaseModule().updatePreferenceInWorkThread(4);
                }
            });
        } else {
            manuallyAdjust.setManuallyVisible(2, i == 1 ? 2 : 3, null);
        }
        getBaseModule().onSharedPreferenceChanged();
        getBaseModule().updatePreferenceInWorkThread(4);
    }

    private void closeVideoFast() {
        DataItemGlobal dataItemGlobal = (DataItemGlobal) DataRepository.provider().dataGlobal();
        if (dataItemGlobal.getCurrentMode() == 169) {
            DataItemRunning dataItemRunning = DataRepository.dataItemRunning();
            dataItemGlobal.setCurrentMode(162);
            dataItemRunning.switchOff("pref_video_speed_fast_key");
        }
    }

    public void configVideoFast() {
        DataItemGlobal dataItemGlobal = (DataItemGlobal) DataRepository.provider().dataGlobal();
        DataItemRunning dataItemRunning = DataRepository.dataItemRunning();
        int currentMode = dataItemGlobal.getCurrentMode();
        if (currentMode != 169) {
            dataItemGlobal.setCurrentMode(169);
            CameraStatUtil.trackVideoModeChanged(CameraSettings.VIDEO_SPEED_FAST);
            dataItemRunning.switchOff("pref_video_speed_slow_key");
            dataItemRunning.switchOff("pref_video_speed_hfr_key");
            dataItemRunning.switchOff("pref_camera_auto_zoom");
            closeMutexElement(SupportedConfigFactory.CLOSE_BY_VIDEO, 239);
            if (CameraSettings.isUltraWideConfigOpen(currentMode)) {
                CameraSettings.setUltraWideConfig(currentMode, false);
            }
            this.mActivity.onModeSelected(StartControl.create(169).setViewConfigType(2).setNeedBlurAnimation(true).setNeedReConfigureCamera(true));
            updateTipMessage(4, R.string.hint_fast_motion, 2);
            return;
        }
        hideTipMessage(R.string.hint_fast_motion);
        dataItemRunning.switchOff("pref_video_speed_fast_key");
        dataItemGlobal.setCurrentMode(162);
        CameraStatUtil.trackVideoModeChanged("normal");
        this.mActivity.onModeSelected(StartControl.create(162).setViewConfigType(2).setNeedBlurAnimation(true).setNeedReConfigureCamera(true));
    }

    public void configVideoSlow() {
        DataItemGlobal dataItemGlobal = (DataItemGlobal) DataRepository.provider().dataGlobal();
        DataItemRunning dataItemRunning = DataRepository.dataItemRunning();
        if (dataItemGlobal.getCurrentMode() != 168) {
            dataItemGlobal.setCurrentMode(168);
            CameraStatUtil.trackVideoModeChanged(CameraSettings.VIDEO_SPEED_SLOW);
            dataItemRunning.switchOff("pref_video_speed_fast_key");
            dataItemRunning.switchOff("pref_video_speed_hfr_key");
            closeMutexElement(SupportedConfigFactory.CLOSE_BY_VIDEO, 239);
            this.mActivity.onModeSelected(StartControl.create(168).setViewConfigType(2).setNeedBlurAnimation(true).setNeedReConfigureCamera(true));
            updateTipMessage(4, R.string.hint_slow_motion, 2);
            return;
        }
        hideTipMessage(R.string.hint_slow_motion);
        dataItemRunning.switchOff("pref_video_speed_slow_key");
        dataItemGlobal.setCurrentMode(162);
        CameraStatUtil.trackVideoModeChanged("normal");
        this.mActivity.onModeSelected(StartControl.create(162).setViewConfigType(2).setNeedBlurAnimation(true).setNeedReConfigureCamera(true));
    }

    public void configVideoHFR() {
        DataItemGlobal dataItemGlobal = (DataItemGlobal) DataRepository.provider().dataGlobal();
        DataItemRunning dataItemRunning = DataRepository.dataItemRunning();
        if (dataItemGlobal.getCurrentMode() != 170) {
            dataItemGlobal.setCurrentMode(170);
            CameraStatUtil.trackVideoModeChanged(CameraSettings.VIDEO_SPEED_HFR);
            dataItemRunning.switchOff("pref_video_speed_fast_key");
            dataItemRunning.switchOff("pref_video_speed_slow_key");
            closeMutexElement(SupportedConfigFactory.CLOSE_BY_VIDEO, 239);
            this.mActivity.onModeSelected(StartControl.create(170).setViewConfigType(2).setNeedBlurAnimation(true).setNeedReConfigureCamera(true));
            return;
        }
        dataItemRunning.switchOff("pref_video_speed_hfr_key");
        dataItemGlobal.setCurrentMode(162);
        CameraStatUtil.trackVideoModeChanged("normal");
        this.mActivity.onModeSelected(StartControl.create(162).setViewConfigType(2).setNeedBlurAnimation(true).setNeedReConfigureCamera(true));
    }

    public void configMagicMirrorSwitch(int i) {
        boolean state = getState(i, "pref_camera_magic_mirror_key");
        if (1 == i) {
            trackMagicMirrorChanged(state);
        }
        ((MainContentProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(166)).setShowMagicMirror(state);
        getBaseModule().updatePreferenceInWorkThread(39);
        Camera2Proxy cameraDevice;
        if (state) {
            cameraDevice = getBaseModule().getCameraDevice();
            if (cameraDevice != null) {
                String string = getBaseModule().getResources().getString(R.string.face_score_info);
                cameraDevice.setFaceWaterMarkEnable(true);
                cameraDevice.setFaceWaterMarkFormat(string);
                return;
            }
            return;
        }
        cameraDevice = getBaseModule().getCameraDevice();
        if (cameraDevice != null) {
            cameraDevice.setFaceWaterMarkEnable(false);
        }
    }

    public void configRawSwitch() {
    }

    public void configPortraitSwitch(int i) {
        getBaseModule().onSharedPreferenceChanged();
    }

    public void configGenderAgeSwitch(int i) {
        boolean state = getState(i, "pref_camera_show_gender_age_key");
        if (1 == i) {
            trackGenderAgeChanged(state);
        }
        ((MainContentProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(166)).setShowGenderAndAge(state);
        getBaseModule().updatePreferenceInWorkThread(38);
        Camera2Proxy cameraDevice;
        if (state) {
            cameraDevice = getBaseModule().getCameraDevice();
            if (cameraDevice != null) {
                String string = getBaseModule().getResources().getString(R.string.face_age_info);
                cameraDevice.setFaceWaterMarkEnable(true);
                cameraDevice.setFaceWaterMarkFormat(string);
                return;
            }
            return;
        }
        cameraDevice = getBaseModule().getCameraDevice();
        if (cameraDevice != null) {
            cameraDevice.setFaceWaterMarkEnable(false);
        }
    }

    public void configFocusPeakSwitch(int i) {
        boolean state = getState(i, "pref_camera_peak_key");
        if (1 == i) {
            trackFocusPeakChanged(state);
        }
        if (!state) {
            EffectController.getInstance().setDrawPeaking(state);
        } else if ("manual".equals(CameraSettings.getFocusMode())) {
            EffectController.getInstance().setDrawPeaking(state);
        }
    }

    public void configDualWaterMarkSwitch() {
        boolean isDualCameraWaterMarkOpen = CameraSettings.isDualCameraWaterMarkOpen();
        CameraStatUtil.trackDualWaterMarkChanged(isDualCameraWaterMarkOpen ^ 1);
        if (isDualCameraWaterMarkOpen) {
            hideTipMessage(R.string.hunt_dual_water_mark);
            CameraSettings.setDualCameraWaterMarkOpen(false);
        } else {
            updateTipMessage(4, R.string.hunt_dual_water_mark, 2);
            CameraSettings.setDualCameraWaterMarkOpen(true);
        }
        getBaseModule().onSharedPreferenceChanged();
    }

    public void configBeautySwitch(int i) {
        boolean z;
        i = getBaseModule().getModuleIndex();
        if (i != 162) {
            switch (i) {
                case 168:
                case 169:
                case 170:
                    break;
                default:
                    z = false;
                    break;
            }
        }
        z = true;
        if (i == 163 || i == 165 || i == 171 || i == 161 || z) {
            ComponentConfigBeauty componentConfigBeauty = DataRepository.dataItemConfig().getComponentConfigBeauty();
            String nextValue = componentConfigBeauty.getNextValue(i);
            int equals = (BeautyConstant.LEVEL_CLOSE.equals(componentConfigBeauty.getComponentValue(i)) ^ 1) ^ (BeautyConstant.LEVEL_CLOSE.equals(nextValue) ^ 1);
            componentConfigBeauty.setComponentValue(i, nextValue);
            CameraStatUtil.trackBeautySwitchChanged(i, nextValue);
            if (equals != 0 && z) {
                if (i != 162) {
                    DataItemGlobal dataItemGlobal = (DataItemGlobal) DataRepository.provider().dataGlobal();
                    DataItemRunning dataItemRunning = DataRepository.dataItemRunning();
                    dataItemRunning.switchOff("pref_video_speed_fast_key");
                    dataItemRunning.switchOff("pref_video_speed_slow_key");
                    dataItemRunning.switchOff("pref_video_speed_hfr_key");
                    dataItemRunning.switchOff("pref_camera_auto_zoom");
                    dataItemGlobal.setCurrentMode(162);
                    DataRepository.getInstance().backUp().removeOtherVideoMode();
                    CameraStatUtil.trackVideoModeChanged("normal");
                }
                this.mActivity.onModeSelected(StartControl.create(162).setViewConfigType(2).setNeedBlurAnimation(true).setNeedReConfigureData(false).setNeedReConfigureCamera(true));
            } else if (equals == 0 || i != 161) {
                getBaseModule().updatePreferenceInWorkThread(13);
            } else {
                this.mActivity.onModeSelected(StartControl.create(161).setViewConfigType(2).setNeedBlurAnimation(true).setNeedReConfigureData(false).setNeedReConfigureCamera(true));
            }
        }
    }

    public void configLiveShotSwitch(int i) {
        if (DataRepository.dataItemFeature().fC()) {
            TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
            if (topAlert != null) {
                BaseModule baseModule = getBaseModule();
                if (baseModule != null && baseModule.getModuleIndex() == 163) {
                    Camera2Module camera2Module = (Camera2Module) baseModule;
                    if (i != 1) {
                        switch (i) {
                            case 3:
                            case 4:
                                if (CameraSettings.isLiveShotOn()) {
                                    CameraSettings.setLiveShotOn(false);
                                    camera2Module.stopLiveShot(false);
                                    break;
                                }
                                break;
                        }
                    }
                    boolean isLiveShotOn = CameraSettings.isLiveShotOn();
                    CameraSettings.setLiveShotOn(isLiveShotOn ^ 1);
                    if (isLiveShotOn) {
                        camera2Module.stopLiveShot(false);
                        topAlert.alertSwitchHint(1, (int) R.string.camera_liveshot_off_tip);
                    } else if (CameraSettings.isRearMenuUltraPixelPhotographyOn() || CameraSettings.isFrontMenuUltraPixelPhotographyOn()) {
                        Log.d(TAG, "Ignore #startLiveShot in ultra pixel photography mode");
                    } else {
                        camera2Module.startLiveShot();
                        topAlert.alertSwitchHint(1, (int) R.string.camera_liveshot_on_tip);
                    }
                    topAlert.updateConfigItem(206);
                }
            }
        }
    }

    private void configAiSceneSwitch(int i) {
        boolean aiSceneOpen = CameraSettings.getAiSceneOpen();
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("configAiSceneSwitch: ");
        stringBuilder.append(aiSceneOpen ^ 1);
        Log.d(str, stringBuilder.toString());
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        switch (i) {
            case 1:
                if (aiSceneOpen) {
                    this.mLastAiSceneStateOn = false;
                    topAlert.alertSwitchHint(1, (int) R.string.pref_camera_front_ai_scene_entry_off);
                    CameraSettings.setAiSceneOpen(false);
                    CameraStatUtil.trackPreferenceChange("pref_camera_ai_scene_mode_key", "off");
                    configMoon(false);
                } else {
                    this.mLastAiSceneStateOn = true;
                    topAlert.alertSwitchHint(1, (int) R.string.pref_camera_front_ai_scene_entry_on);
                    CameraSettings.setAiSceneOpen(true);
                    CameraStatUtil.trackPreferenceChange("pref_camera_ai_scene_mode_key", "on");
                }
                topAlert.updateConfigItem(201);
                if (CameraSettings.isGroupShotOn()) {
                    ((ConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(164)).configGroupSwitch(4);
                    topAlert.refreshExtraMenu();
                    break;
                }
                break;
            case 3:
                CameraSettings.setAiSceneOpen(false);
                topAlert.updateConfigItem(201);
                break;
        }
        getBaseModule().updatePreferenceTrampoline(36);
        getBaseModule().getCameraDevice().resumePreview();
        if (i == 1 && CameraSettings.isRearMenuUltraPixelPhotographyOn()) {
            configSwitchMenuUltraPixelPhotography(3);
        }
    }

    private void configVideoBokehSwitch(int i) {
        int i2;
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        DataItemConfig dataItemConfig = DataRepository.dataItemConfig();
        boolean isSwitchOn = dataItemConfig.isSwitchOn("pref_video_bokeh_key");
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("configVideoBokehSwitch: switchOn = ");
        stringBuilder.append(isSwitchOn ^ 1);
        Log.d(str, stringBuilder.toString());
        if (isSwitchOn) {
            dataItemConfig.switchOff("pref_video_bokeh_key");
            CameraStatUtil.trackPreferenceChange("pref_video_bokeh_key", "off");
        } else {
            dataItemConfig.switchOn("pref_video_bokeh_key");
            CameraStatUtil.trackPreferenceChange("pref_video_bokeh_key", "on");
        }
        topAlert.updateConfigItem(243);
        this.mActivity.onModeSelected(StartControl.create(getBaseModule().getModuleIndex()).setViewConfigType(2).setNeedBlurAnimation(true).setNeedReConfigureCamera(true).setNeedReConfigureData(false));
        if (isSwitchOn) {
            i2 = R.string.pref_camera_video_bokeh_off;
        } else {
            i2 = R.string.pref_camera_video_bokeh_on;
        }
        topAlert.alertSwitchHint(2, i2);
    }

    private boolean getState(int i, String str) {
        if (i == 2) {
            return DataRepository.dataItemRunning().isSwitchOn(str);
        }
        if (i != 4) {
            return DataRepository.dataItemRunning().triggerSwitchAndGet(str);
        }
        DataRepository.dataItemRunning().switchOff(str);
        return false;
    }

    public void configFPS960() {
        ComponentConfigSlowMotion componentConfigSlowMotion = DataRepository.dataItemConfig().getComponentConfigSlowMotion();
        String nextValue = componentConfigSlowMotion.getNextValue(172);
        componentConfigSlowMotion.setComponentValue(172, nextValue);
        this.mActivity.onModeSelected(StartControl.create(172).setViewConfigType(2).setNeedBlurAnimation(true).setNeedReConfigureData(false).setNeedReConfigureCamera(true));
        Map hashMap = new HashMap();
        hashMap.put(CameraStat.NEW_SLOW_MOTION_SWITCH_FPS, CameraStatUtil.slowMotionConfigToName(nextValue));
        CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_NEW_SLOW_MOTION, hashMap);
        BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
        if (bottomPopupTips == null) {
            return;
        }
        if (ComponentConfigSlowMotion.DATA_CONFIG_NEW_SLOW_MOTION_960.equals(nextValue)) {
            bottomPopupTips.showTips(9, R.string.fps960_toast, 4);
        } else {
            bottomPopupTips.hideTipImage();
        }
    }

    public void closeMutexElement(String str, int... iArr) {
        int[] iArr2 = new int[iArr.length];
        this.mRecordingMutexElements = iArr;
        int i = 0;
        boolean z = false;
        while (i < iArr.length) {
            int i2 = iArr[i];
            if (i2 == 196) {
                updateComponentFilter(true);
                iArr2[i] = 2;
            } else if (i2 == 201) {
                updateAiScene(true);
                iArr2[i] = 36;
            } else if (i2 == 206) {
                updateLiveShot(true);
                iArr2[i] = 49;
            } else if (i2 == 239) {
                updateComponentBeauty(true);
                iArr2[i] = 13;
            } else if (i2 != 251) {
                switch (i2) {
                    case 193:
                        updateComponentFlash(str, true);
                        iArr2[i] = 10;
                        break;
                    case 194:
                        updateComponentHdr(true);
                        iArr2[i] = 11;
                        break;
                    default:
                        throw new RuntimeException("unknown mutex element");
                }
            } else {
                z = closeComponentUltraPixelFront();
                iArr2[i] = 50;
            }
            i++;
        }
        BaseModule baseModule = getBaseModule();
        if (baseModule != null) {
            baseModule.updatePreferenceTrampoline(iArr2);
            baseModule.getCameraDevice().resumePreview();
            if (z) {
                baseModule.restartModule();
            }
        }
    }

    public void restoreAllMutexElement(String str) {
        if (this.mRecordingMutexElements != null) {
            int[] iArr = new int[this.mRecordingMutexElements.length];
            for (int i = 0; i < this.mRecordingMutexElements.length; i++) {
                int i2 = this.mRecordingMutexElements[i];
                if (i2 == 196) {
                    updateComponentFilter(false);
                    iArr[i] = 2;
                } else if (i2 == 201) {
                    updateAiScene(false);
                    iArr[i] = 36;
                } else if (i2 == 206) {
                    updateLiveShot(false);
                    iArr[i] = 49;
                } else if (i2 != 239) {
                    switch (i2) {
                        case 193:
                            updateComponentFlash(null, false);
                            iArr[i] = 10;
                            break;
                        case 194:
                            updateComponentHdr(false);
                            iArr[i] = 11;
                            break;
                        default:
                            throw new RuntimeException("unknown mutex element");
                    }
                } else {
                    updateComponentBeauty(false);
                    iArr[i] = 13;
                }
            }
            this.mRecordingMutexElements = null;
            getBaseModule().updatePreferenceInWorkThread(iArr);
        }
    }

    public void showCloseTip(int i, boolean z) {
        ((BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175)).showCloseTip(i, z);
    }

    private void updateComponentFlash(String str, boolean z) {
        ComponentConfigFlash componentFlash = DataRepository.dataItemConfig().getComponentFlash();
        int currentMode = DataRepository.dataItemGlobal().getCurrentMode();
        if (!componentFlash.isEmpty() && componentFlash.isClosed() != z) {
            if (!z || !componentFlash.getComponentValue(currentMode).equals("2") || !SupportedConfigFactory.CLOSE_BY_BURST_SHOOT.equals(str)) {
                componentFlash.setClosed(z);
                ((TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172)).updateConfigItem(193);
            }
        }
    }

    private void updateComponentHdr(boolean z) {
        ComponentConfigHdr componentHdr = DataRepository.dataItemConfig().getComponentHdr();
        DataRepository.dataItemGlobal().getCurrentMode();
        if (!componentHdr.isEmpty() && componentHdr.isClosed() != z) {
            componentHdr.setClosed(z);
            ((TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172)).updateConfigItem(194);
        }
    }

    private void updateComponentFilter(boolean z) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("updateComponentFilter: close = ");
        stringBuilder.append(z);
        Log.d(str, stringBuilder.toString());
        DataRepository.dataItemRunning().getComponentConfigFilter().setClosed(z, DataRepository.dataItemGlobal().getCurrentMode());
        ((TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172)).updateConfigItem(196);
        ActionProcessing actionProcessing = (ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162);
        if (actionProcessing.isShowFilterView()) {
            actionProcessing.filterUiChange();
            if (z) {
                actionProcessing.showOrHideFilterView();
                if (!Util.UI_DEBUG()) {
                    showCloseTip(1, false);
                }
            }
        }
    }

    private void updateComponentBeauty(boolean z) {
        int currentMode = DataRepository.dataItemGlobal().getCurrentMode();
        ComponentConfigBeauty componentConfigBeauty = DataRepository.dataItemConfig().getComponentConfigBeauty();
        if (!componentConfigBeauty.isEmpty() && componentConfigBeauty.isClosed(currentMode) != z) {
            componentConfigBeauty.setClosed(z, currentMode);
            if (CameraSettings.isSupportBeautyBody()) {
                ComponentConfigBeautyBody componentConfigBeautyBody = DataRepository.dataItemConfig().getComponentConfigBeautyBody();
                if (componentConfigBeautyBody.isClosed() != z) {
                    componentConfigBeautyBody.setClosed(z);
                } else {
                    return;
                }
            }
            ((BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175)).updateTipImage();
        }
    }

    private void updateAiScene(boolean z) {
        if (this.mLastAiSceneStateOn && CameraSettings.getAiSceneOpen() != (z ^ 1)) {
            CameraSettings.setAiSceneOpen(z ^ true);
            ((TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172)).updateConfigItem(201);
        }
    }

    private void updateLiveShot(boolean z) {
        if (DataRepository.dataItemFeature().fC()) {
            int currentMode = DataRepository.dataItemGlobal().getCurrentMode();
            if (currentMode == 163) {
                ComponentRunningLiveShot componentRunningLiveShot = DataRepository.dataItemRunning().getComponentRunningLiveShot();
                if (componentRunningLiveShot.isClosed(currentMode) != z) {
                    componentRunningLiveShot.setClosed(currentMode, z);
                    ((TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172)).updateConfigItem(206);
                }
            }
        }
    }

    private boolean closeComponentUltraPixelFront() {
        if (DataRepository.dataItemFeature().fQ() <= 0 || !CameraSettings.isFrontMenuUltraPixelPhotographyOn()) {
            return false;
        }
        CameraSettings.setFrontMenuUltraPixelPhotographyConfig(false);
        return true;
    }

    private void conflictWithFlashAndHdr() {
        DataItemRunning dataItemRunning = DataRepository.dataItemRunning();
        dataItemRunning.switchOff("pref_camera_hand_night_key");
        dataItemRunning.switchOff("pref_camera_groupshot_mode_key");
        dataItemRunning.switchOff("pref_camera_super_resolution_key");
        ((BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175)).directlyHideTips();
    }

    private void updateTipMessage(int i, @StringRes int i2, int i3) {
        ((BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175)).showTips(i, i2, i3);
    }

    private void hideTipMessage(@StringRes int i) {
        BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
        if (i <= 0 || bottomPopupTips.containTips(i)) {
            bottomPopupTips.directlyHideTips();
        }
    }

    private boolean isAlive() {
        return this.mActivity != null;
    }

    private void trackGradienterChanged(boolean z) {
        CameraStatUtil.trackConfigChange(CameraStat.KEY_GRADIENT_CHANGED, CameraStat.PARAM_GRADIENTER, z, true, false);
    }

    private void trackGroupChanged(boolean z) {
        CameraStatUtil.trackConfigChange(CameraStat.KEY_GROUP_SHOT_CHANGED, CameraStat.PARAM_GROUP_SHOT, z, false, true);
    }

    private void trackHHTChanged(boolean z) {
        CameraStatUtil.trackConfigChange(CameraStat.KEY_HHT_CHANGED, CameraStat.PARAM_HHT, z, true, false);
    }

    private void trackGenderAgeChanged(boolean z) {
        CameraStatUtil.trackConfigChange(CameraStat.KEY_GENDER_AGE_CHANGED, CameraStat.PARAM_GENDER_AGE, z, false, true);
    }

    private void trackMagicMirrorChanged(boolean z) {
        CameraStatUtil.trackConfigChange(CameraStat.KEY_MAGIC_MIRROR_CHANGED, CameraStat.PARAM_MAGIC_MIRROR, z, false, true);
    }

    private void trackFocusPeakChanged(boolean z) {
        CameraStatUtil.trackConfigChange(CameraStat.KEY_MANUAL_FOCUS_PEAK_CHANGED, CameraStat.PARAM_FOCUS_PEAK, z, false, false);
    }

    private void trackSuperResolutionChanged(boolean z) {
        CameraStatUtil.trackConfigChange(CameraStat.KEY_SUPER_RESOLUTION_CHANGED, CameraStat.PARAM_SUPER_RESOLUTION, z, false, false);
    }
}
