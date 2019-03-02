package com.android.camera.fragment.beauty;

import android.view.View;
import android.view.ViewGroup.MarginLayoutParams;
import com.android.camera.Util;
import com.android.camera.fragment.BaseFragment;
import com.android.camera.protocol.ModeProtocol.ModeCoordinator;
import com.oneplus.camera.R;

public class FragmentPopuEyeLightTip extends BaseFragment {
    public static final int FRAGMENT_INFO = 4089;

    protected void initView(View view) {
        ((MarginLayoutParams) view.getLayoutParams()).bottomMargin = Util.getBottomHeight(getResources()) + getResources().getDimensionPixelSize(R.dimen.beauty_fragment_height);
    }

    protected int getLayoutResourceId() {
        return R.layout.eye_light_popu_tip;
    }

    public int getFragmentInto() {
        return 4089;
    }

    protected void register(ModeCoordinator modeCoordinator) {
        super.register(modeCoordinator);
    }

    protected void unRegister(ModeCoordinator modeCoordinator) {
        super.unRegister(modeCoordinator);
    }
}
