package com.android.camera.animation.type;

import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewPropertyAnimatorCompat;
import android.view.View;
import com.android.camera.ui.drawable.PanoramaArrowAnimateDrawable;

public class SlideInOnSubscribe extends BaseOnSubScribe {
    private int mGravity;

    public SlideInOnSubscribe(View view, int i) {
        super(view);
        this.mGravity = i;
    }

    protected ViewPropertyAnimatorCompat getAnimation() {
        int i = 0;
        BaseOnSubScribe.setAnimateViewVisible(this.mAniView, 0);
        int max = Math.max(this.mAniView.getWidth(), this.mAniView.getLayoutParams().width);
        int max2 = Math.max(this.mAniView.getHeight(), this.mAniView.getLayoutParams().height);
        int i2 = this.mGravity;
        if (i2 == 3) {
            max = -max;
        } else if (i2 != 5) {
            max = i2 != 48 ? i2 != 80 ? 0 : max2 : -max2;
            ViewCompat.setTranslationX(this.mAniView, (float) i);
            ViewCompat.setTranslationY(this.mAniView, (float) max);
            ViewCompat.setAlpha(this.mAniView, 1.0f);
            return ViewCompat.animate(this.mAniView).translationX(PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO).translationY(PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO);
        }
        i = max;
        max = 0;
        ViewCompat.setTranslationX(this.mAniView, (float) i);
        ViewCompat.setTranslationY(this.mAniView, (float) max);
        ViewCompat.setAlpha(this.mAniView, 1.0f);
        return ViewCompat.animate(this.mAniView).translationX(PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO).translationY(PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO);
    }

    public static void directSetResult(View view, int i) {
        ViewCompat.setTranslationX(view, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO);
        ViewCompat.setTranslationY(view, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO);
        ViewCompat.setAlpha(view, 1.0f);
        BaseOnSubScribe.setAnimateViewVisible(view, 0);
    }
}
