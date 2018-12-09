package com.android.camera.animation;

import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import android.view.animation.AnimationSet;
import android.view.animation.TranslateAnimation;
import com.android.camera.ui.drawable.PanoramaArrowAnimateDrawable;

public class FragmentAnimationFactory {
    public static Animation wrapperAnimation(AnimationListener animationListener, int... iArr) {
        AnimationListener animationListener2 = animationListener;
        int[] iArr2 = iArr;
        Animation animationSet = new AnimationSet(true);
        int length = iArr2.length;
        int i = 0;
        int i2 = 0;
        while (i < length) {
            Animation alphaAnimation;
            switch (iArr2[i]) {
                case 161:
                    alphaAnimation = new AlphaAnimation(PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, 1.0f);
                    break;
                case 162:
                    alphaAnimation = new AlphaAnimation(1.0f, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO);
                    break;
                case 167:
                    Animation translateAnimation = new TranslateAnimation(1, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, 1, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, 1, 1.0f, 1, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO);
                    break;
                case 168:
                    Animation translateAnimation2 = new TranslateAnimation(1, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, 1, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, 1, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, 1, 1.0f);
                    break;
                default:
                    return null;
            }
            if (animationListener2 != null && i2 == 0) {
                alphaAnimation.setAnimationListener(animationListener2);
                i2 = true;
            }
            alphaAnimation.setDuration(200);
            alphaAnimation.setInterpolator(AnimationDelegate.DEFAULT_INTERPOLATOR);
            animationSet.addAnimation(alphaAnimation);
            i++;
        }
        return animationSet;
    }

    public static Animation wrapperAnimation(int... iArr) {
        return wrapperAnimation(null, iArr);
    }
}
