package com.android.camera.fragment.beauty;

import com.aeonax.camera.R;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.BaseDelegate;
import com.android.camera.protocol.ModeProtocol.BottomMenuProtocol;
import com.android.camera.protocol.ModeProtocol.MakeupProtocol;

public abstract class AbBeautyFragmentBusiness implements IBeautyFragmentBusiness {
    private int mCurrentBeautyType;

    public Object operate(Object obj) {
        return null;
    }

    public boolean removeFragmentBeauty(int i) {
        if (!BeautyParameters.isCurrentModeSupportVideoBeauty() && 3 == i) {
            return false;
        }
        BaseDelegate baseDelegate = (BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160);
        if (baseDelegate == null || baseDelegate.getActiveFragment(R.id.bottom_beauty) != 251) {
            return false;
        }
        baseDelegate.delegateEvent(10);
        ((BottomMenuProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(197)).onSwitchCameraActionMenu(0);
        if (BeautyParameters.sSupportSeekBarAdjustBeautyType.contains(Integer.valueOf(this.mCurrentBeautyType))) {
            MakeupProtocol makeupProtocol = (MakeupProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(180);
            if (makeupProtocol != null && makeupProtocol.isShow()) {
                baseDelegate.delegateEvent(3);
            }
        }
        return true;
    }

    public void setCurrentBeautyType(int i) {
        this.mCurrentBeautyType = i;
    }
}
