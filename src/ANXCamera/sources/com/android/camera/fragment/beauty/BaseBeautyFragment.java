package com.android.camera.fragment.beauty;

import android.support.annotation.NonNull;
import android.support.v4.app.Fragment;
import android.support.v4.view.ViewCompat;
import android.view.View;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import com.android.camera.ui.drawable.PanoramaArrowAnimateDrawable;
import miui.view.animation.QuinticEaseInInterpolator;
import miui.view.animation.QuinticEaseOutInterpolator;

public abstract class BaseBeautyFragment extends Fragment {
    protected abstract View getAnimateView();

    protected void enterAnim(@NonNull View view) {
        view.clearAnimation();
        view.setAlpha(PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO);
        ViewCompat.animate(view).setDuration(240).alpha(1.0f).setStartDelay(120).setInterpolator(new QuinticEaseOutInterpolator()).start();
    }

    protected void exitAnim(@NonNull View view) {
        view.clearAnimation();
        ViewCompat.animate(view).setDuration(120).alpha(PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO).setInterpolator(new QuinticEaseInInterpolator()).start();
    }

    public void setUserVisibleHint(boolean z) {
        super.setUserVisibleHint(z);
        if (z) {
            if (getAnimateView() != null) {
                enterAnim(getAnimateView());
            }
        } else if (getAnimateView() != null) {
            exitAnim(getAnimateView());
        }
    }

    public Animation onCreateAnimation(int i, boolean z, int i2) {
        if (z) {
            return super.onCreateAnimation(i, z, i2);
        }
        Animation alphaAnimation = new AlphaAnimation(1.0f, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO);
        alphaAnimation.setInterpolator(new QuinticEaseInInterpolator());
        alphaAnimation.setDuration(140);
        return alphaAnimation;
    }
}
