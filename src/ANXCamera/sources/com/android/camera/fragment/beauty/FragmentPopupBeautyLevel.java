package com.android.camera.fragment.beauty;

import android.view.View;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.animation.Animation;
import com.android.camera.Util;
import com.android.camera.animation.FragmentAnimationFactory;
import com.android.camera.fragment.BaseFragment;
import com.oneplus.camera.R;

@Deprecated
public class FragmentPopupBeautyLevel extends BaseFragment {
    public static final int FRAGMENT_INFO = 4082;

    protected void initView(View view) {
        ((MarginLayoutParams) view.getLayoutParams()).bottomMargin = Util.getBottomHeight(getResources());
    }

    protected int getLayoutResourceId() {
        return R.layout.fragment_popup_beautylevel;
    }

    public int getFragmentInto() {
        return 4082;
    }

    protected Animation provideEnterAnimation(int i) {
        return FragmentAnimationFactory.wrapperAnimation(161);
    }

    protected Animation provideExitAnimation() {
        return FragmentAnimationFactory.wrapperAnimation(162);
    }
}
