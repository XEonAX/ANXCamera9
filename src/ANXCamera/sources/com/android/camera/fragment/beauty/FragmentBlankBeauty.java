package com.android.camera.fragment.beauty;

import android.view.View;
import android.view.animation.Animation;
import com.aeonax.camera.R;
import com.android.camera.fragment.BaseFragment;

@Deprecated
public class FragmentBlankBeauty extends BaseFragment {
    public static final int FRAGMENT_INFO = 4090;

    protected void initView(View view) {
    }

    protected int getLayoutResourceId() {
        return R.layout.fragment_blank_beauty;
    }

    public int getFragmentInto() {
        return 4090;
    }

    protected Animation provideEnterAnimation(int i) {
        return null;
    }

    protected Animation provideExitAnimation() {
        return null;
    }
}
