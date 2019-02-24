package com.android.camera.fragment.beauty;

import android.support.v4.app.Fragment;
import com.android.camera.data.DataRepository;
import com.android.camera.fragment.beauty.BeautyParameters.Type;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.BaseDelegate;
import com.android.camera.protocol.ModeProtocol.BottomMenuProtocol;
import com.android.camera.protocol.ModeProtocol.BottomPopupTips;
import com.miui.filtersdk.beauty.BeautyParameterType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.List;

public class MiBeauty implements IBeautySettingBusiness {
    public static final int BACK_BEAUTY_MENU_TYPE = 162;
    public static final int FRONT_BEAUTY_MENU_TYPE = 161;
    public static final int LIVE_BEAUTY_MENU_TYPE = 163;
    public static final int LIVE_SPEED_MENU_TYPE = 165;
    public static final int LIVE_STICKER_MENU_TYPE = 164;
    public static final int NONE_MENU_TYPE = 160;
    public AbBeautyFragmentBusiness mBeautyBusiness;
    private BeautyFragmentManager mBeautyFragmentManager;
    private BeautySettingManager mBeautySettingManager;

    @Retention(RetentionPolicy.SOURCE)
    public @interface BeautyMenuType {
    }

    public MiBeauty() {
        switch (DataRepository.dataItemGlobal().getCurrentCameraId()) {
            case 0:
                this.mBeautyBusiness = new BackMainFragmentBusiness();
                break;
            case 1:
                this.mBeautyBusiness = new FrontFragmentBusiness();
                break;
        }
        this.mBeautyFragmentManager = new BeautyFragmentManager();
        this.mBeautySettingManager = new BeautySettingManager();
    }

    public List<Fragment> getCurrentShowFragmentList(int i) {
        return this.mBeautyFragmentManager.getBeautyFragmentBusiness(i).getCurrentShowFragmentList();
    }

    public boolean removeFragmentBeauty(int i) {
        return this.mBeautyBusiness.removeFragmentBeauty(i);
    }

    public void setCurrentBeautyType(int i) {
        this.mBeautyBusiness.setCurrentBeautyType(i);
    }

    public void setBeautyType(int i) {
        this.mBeautySettingManager.setBeautyType(i);
    }

    public int getBeautyType() {
        return this.mBeautySettingManager.getBeautyType();
    }

    public Object operate(Object obj) {
        return null;
    }

    public void setProgress(int i) {
        this.mBeautySettingManager.getCurrentBeautySettingBusiness().setProgress(i);
    }

    public int getProgress() {
        return this.mBeautySettingManager.getCurrentBeautySettingBusiness().getProgress();
    }

    public void resetBeauty() {
        this.mBeautySettingManager.getCurrentBeautySettingBusiness().resetBeauty();
    }

    public void setType(BeautyParameterType beautyParameterType) {
        this.mBeautySettingManager.getCurrentBeautySettingBusiness().setType(beautyParameterType);
    }

    public void setType(Type type) {
        this.mBeautySettingManager.getCurrentBeautySettingBusiness().setType(type);
    }

    public void setCurrentBeautyParameterType(CameraBeautyParameterType cameraBeautyParameterType) {
        this.mBeautySettingManager.getCurrentBeautySettingBusiness().setCurrentBeautyParameterType(cameraBeautyParameterType);
    }

    public List<Type> getTypeArray() {
        return this.mBeautySettingManager.getCurrentBeautySettingBusiness().getTypeArray();
    }

    public CameraBeautyParameterType getCurrentBeautyParameterType() {
        return this.mBeautySettingManager.getCurrentBeautySettingBusiness().getCurrentBeautyParameterType();
    }

    public static void showBeautyActionFromMode(int i) {
        BottomMenuProtocol bottomMenuProtocol = (BottomMenuProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(197);
        if (bottomMenuProtocol != null) {
            if (i != 174) {
                i = DataRepository.dataItemGlobal().getCurrentCameraId();
                if (i == 1) {
                    bottomMenuProtocol.onSwitchBeautyActionMenu(161);
                } else if (i == 0) {
                    bottomMenuProtocol.onSwitchBeautyActionMenu(162);
                }
            } else {
                bottomMenuProtocol.onSwitchBeautyActionMenu(163);
            }
            BaseDelegate baseDelegate = (BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160);
            if (baseDelegate != null) {
                baseDelegate.delegateEvent(2);
                BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
                if (bottomPopupTips != null) {
                    bottomPopupTips.directlyHideTips();
                    bottomPopupTips.setPortraitHintVisible(8);
                }
            }
        }
    }
}
