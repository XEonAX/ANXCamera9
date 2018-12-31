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
        DualController dualController = (DualController) ModeCoordinatorImpl.getInstance().getAttachProtocol(182);
        if (dualController != null) {
            dualController.hideZoomButton();
        }
        BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
        bottomPopupTips.hideTipImage();
        bottomPopupTips.hideLeftTipImage();
        bottomPopupTips.hideSpeedTipImage();
        bottomPopupTips.hideCenterTipImage();
    }

    public void onStart() {
        ((ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162)).processingStart();
    }

    public void onPause() {
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        ((ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162)).processingPause();
        if (getCurrentModuleIndex() != 174) {
            topAlert.setRecordingTimeState(3);
            return;
        }
        ((BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175)).reInitTipImage();
        topAlert.setConfigItemVisible(225, 4, false);
        topAlert.showConfigMenu();
        topAlert.setConfigItemVisible(245, 8, false);
    }

    public void onResume() {
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
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        topAlert.showConfigMenu();
        ((BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175)).reInitTipImage();
        ((ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162)).processingFinish();
        if (getCurrentModuleIndex() != 174) {
            topAlert.setRecordingTimeState(2);
            return;
        }
        topAlert.setConfigItemVisible(225, 0, false);
        topAlert.setConfigItemVisible(245, 0, false);
    }

    public void onPostSavingStart() {
        ActionProcessing actionProcessing = (ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162);
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        topAlert.showConfigMenu();
        ((BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175)).reInitTipImage();
        int currentModuleIndex = getCurrentModuleIndex();
        DualController dualController;
        if (currentModuleIndex == 166) {
            actionProcessing.processingFinish();
            actionProcessing.updateLoading(false);
            dualController = (DualController) ModeCoordinatorImpl.getInstance().getAttachProtocol(182);
            if (dualController != null) {
                dualController.showZoomButton();
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
            }
            BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
            if (bottomPopupTips != null) {
                bottomPopupTips.hideTipImage();
            }
        }
    }

    public void onPostSavingFinish() {
        if (getCurrentModuleIndex() != 166) {
            ((ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162)).processingFinish();
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
        onFinish();
        ((ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162)).processingFailed();
    }

    public void onPostPreview() {
        ((BackStack) ModeCoordinatorImpl.getInstance().getAttachProtocol(171)).handleBackStackFromShutter();
        ((ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162)).processingWorkspace(false);
    }

    public void onPostPreviewBack() {
        ((ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162)).processingWorkspace(true);
        ((BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175)).reInitTipImage();
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        topAlert.setConfigItemVisible(225, 0, false);
        topAlert.showConfigMenu();
    }

    private boolean isFPS960() {
        if (getCurrentModuleIndex() == 172 && DataRepository.dataItemFeature().fr()) {
            return DataRepository.dataItemConfig().getComponentConfigSlowMotion().isSlowMotionFps960();
        }
        return false;
    }
}
