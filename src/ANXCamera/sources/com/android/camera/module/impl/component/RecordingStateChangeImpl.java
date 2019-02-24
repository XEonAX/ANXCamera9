package com.android.camera.module.impl.component;

import com.android.camera.ActivityBase;
import com.android.camera.data.DataRepository;
import com.android.camera.log.Log;
import com.android.camera.module.BaseModule;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.ActionProcessing;
import com.android.camera.protocol.ModeProtocol.BackStack;
import com.android.camera.protocol.ModeProtocol.BottomPopupTips;
import com.android.camera.protocol.ModeProtocol.DualController;
import com.android.camera.protocol.ModeProtocol.PanoramaProtocol;
import com.android.camera.protocol.ModeProtocol.RecordState;
import com.android.camera.protocol.ModeProtocol.TopAlert;

public class RecordingStateChangeImpl implements RecordState {
    private static final String TAG = "RecordingState";
    private ActivityBase mActivity;

    public static RecordingStateChangeImpl create(ActivityBase activityBase) {
        return new RecordingStateChangeImpl(activityBase);
    }

    public RecordingStateChangeImpl(ActivityBase activityBase) {
        this.mActivity = activityBase;
    }

    public void registerProtocol() {
        ModeCoordinatorImpl.getInstance().attachProtocol(212, this);
    }

    public void unRegisterProtocol() {
        this.mActivity = null;
        ModeCoordinatorImpl.getInstance().detachProtocol(212, this);
    }

    private BaseModule getBaseModule() {
        return (BaseModule) this.mActivity.getCurrentModule();
    }

    private int getCurrentModuleIndex() {
        return getBaseModule().getModuleIndex();
    }

    public void onPrepare() {
        ((BackStack) ModeCoordinatorImpl.getInstance().getAttachProtocol(171)).handleBackStackFromShutter();
        ActionProcessing actionProcessing = (ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162);
        actionProcessing.processingPrepare();
        if (actionProcessing.isShowFilterView()) {
            actionProcessing.showOrHideFilterView();
        }
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        topAlert.hideConfigMenu();
        int currentModuleIndex = getCurrentModuleIndex();
        if (currentModuleIndex != 166) {
            switch (currentModuleIndex) {
                case 173:
                case 174:
                    break;
                default:
                    if (!isFPS960()) {
                        topAlert.setRecordingTimeState(1);
                        break;
                    }
                    break;
            }
        }
        ((PanoramaProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(176)).setShootUI();
        if (DataRepository.dataItemFeature().fM()) {
            DualController dualController = (DualController) ModeCoordinatorImpl.getInstance().getAttachProtocol(182);
            if (dualController != null) {
                dualController.hideZoomButton();
                if (topAlert != null) {
                    topAlert.alertUpdateValue(2);
                }
            }
        }
        BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
        bottomPopupTips.hideTipImage();
        bottomPopupTips.hideLeftTipImage();
        bottomPopupTips.hideSpeedTipImage();
        bottomPopupTips.hideCenterTipImage();
        bottomPopupTips.directlyHideTips();
    }

    public void onStart() {
        Log.d(TAG, "onStart");
        ((ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162)).processingStart();
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        if (getCurrentModuleIndex() == 174) {
            topAlert.alertMusicClose(false);
        }
    }

    public void onPause() {
        Log.d(TAG, "onPause");
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        ((ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162)).processingPause();
        if (getCurrentModuleIndex() != 174) {
            topAlert.setRecordingTimeState(3);
            return;
        }
        ((BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175)).reInitTipImage();
        topAlert.disableMenuItem(225, 245);
        topAlert.showConfigMenu();
    }

    public void onResume() {
        Log.d(TAG, "onResume");
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        ((ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162)).processingResume();
        if (getCurrentModuleIndex() != 174) {
            topAlert.setRecordingTimeState(4);
            return;
        }
        topAlert.hideConfigMenu();
        BackStack backStack = (BackStack) ModeCoordinatorImpl.getInstance().getAttachProtocol(171);
        if (backStack != null) {
            backStack.handleBackStackFromShutter();
        }
        BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
        bottomPopupTips.hideTipImage();
        bottomPopupTips.hideLeftTipImage();
        bottomPopupTips.hideSpeedTipImage();
        bottomPopupTips.hideCenterTipImage();
    }

    public void onFinish() {
        Log.d(TAG, "onFinish");
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        topAlert.showConfigMenu();
        BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
        bottomPopupTips.reInitTipImage();
        bottomPopupTips.reConfigBottomTipOfUltraWide();
        ((ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162)).processingFinish();
        if (getCurrentModuleIndex() != 174) {
            topAlert.setRecordingTimeState(2);
            return;
        }
        topAlert.enableMenuItem(225, 245);
        topAlert.alertMusicClose(true);
    }

    public void onPostSavingStart() {
        Log.d(TAG, "onPostSaving");
        ActionProcessing actionProcessing = (ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162);
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        topAlert.showConfigMenu();
        ((BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175)).reInitTipImage();
        int currentModuleIndex = getCurrentModuleIndex();
        DualController dualController;
        if (currentModuleIndex == 166) {
            actionProcessing.processingFinish();
            actionProcessing.updateLoading(false);
            if (DataRepository.dataItemFeature().fM()) {
                dualController = (DualController) ModeCoordinatorImpl.getInstance().getAttachProtocol(182);
                if (dualController != null) {
                    dualController.showZoomButton();
                    if (topAlert != null) {
                        topAlert.clearAlertStatus();
                    }
                }
            }
            ((PanoramaProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(176)).resetShootUI();
        } else if (currentModuleIndex != 173) {
            topAlert.setRecordingTimeState(2);
            actionProcessing.processingPostAction();
        } else {
            actionProcessing.processingPostAction();
            dualController = (DualController) ModeCoordinatorImpl.getInstance().getAttachProtocol(182);
            if (dualController != null) {
                dualController.showZoomButton();
                if (topAlert != null) {
                    topAlert.clearAlertStatus();
                }
            }
            BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
            if (bottomPopupTips != null) {
                bottomPopupTips.hideTipImage();
            }
        }
    }

    public void onPostSavingFinish() {
        Log.d(TAG, "onPostSavingFinish");
        if (getCurrentModuleIndex() != 166) {
            ActionProcessing actionProcessing = (ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162);
            if (actionProcessing != null) {
                actionProcessing.processingFinish();
                return;
            }
            return;
        }
        PanoramaProtocol panoramaProtocol = (PanoramaProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(176);
        if (panoramaProtocol != null) {
            Log.d(TAG, "onPostExecute setDisplayPreviewBitmap null");
            panoramaProtocol.setDisplayPreviewBitmap(null);
            panoramaProtocol.showSmallPreview(false);
        }
    }

    public void onFailed() {
        Log.d(TAG, "onFailed");
        onFinish();
        ((ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162)).processingFailed();
    }

    public void onPostPreview() {
        Log.d(TAG, "onPostPreview");
        ((BackStack) ModeCoordinatorImpl.getInstance().getAttachProtocol(171)).handleBackStackFromShutter();
        ((TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172)).hideConfigMenu();
        ((ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162)).processingWorkspace(false);
    }

    public void onPostPreviewBack() {
        Log.d(TAG, "onPostPreviewBack");
        ((ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162)).processingWorkspace(true);
        ((BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175)).reInitTipImage();
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        topAlert.enableMenuItem(225, 245);
        topAlert.showConfigMenu();
    }

    private boolean isFPS960() {
        if (getCurrentModuleIndex() == 172 && DataRepository.dataItemFeature().fu()) {
            return DataRepository.dataItemConfig().getComponentConfigSlowMotion().isSlowMotionFps960();
        }
        return false;
    }
}
