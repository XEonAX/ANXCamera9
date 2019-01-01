package com.android.camera.animation.type;

import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewPropertyAnimatorCompat;
import android.view.View;

public class SlideOutOnSubscribe extends BaseOnSubScribe {
    private int mGravity;

    public SlideOutOnSubscribe(View view, int i) {
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
            ViewCompat.setTranslationX(this.mAniView, 0.0f);
            ViewCompat.setTranslationY(this.mAniView, 0.0f);
            ViewCompat.setAlpha(this.mAniView, 1.0f);
            return ViewCompat.animate(this.mAniView).translationX((float) i).translationY((float) max);
        }
        i = max;
        max = 0;
        ViewCompat.setTranslationX(this.mAniView, 0.0f);
        ViewCompat.setTranslationY(this.mAniView, 0.0f);
        ViewCompat.setAlpha(this.mAniView, 1.0f);
        return ViewCompat.animate(this.mAniView).translationX((float) i).translationY((float) max);
    }

    protected void onAnimationEnd() {
        super.onAnimationEnd();
        BaseOnSubScribe.setAnimateViewVisible(this.mAniView, this.mTargetGone ? 8 : 4);
    }

    public static void directSetResult(View view, int i) {
        int max = Math.max(view.getWidth(), view.getLayoutParams().width);
        int max2 = Math.max(view.getHeight(), view.getLayoutParams().height);
        int i2 = 0;
        if (i == 3) {
            max = -max;
        } else if (i != 5) {
            if (i == 48) {
                max2 = -max2;
            } else if (i != 80) {
                max2 = 0;
            }
            ViewCompat.setTranslationX(view, (float) i2);
            ViewCompat.setTranslationY(view, (float) max2);
            ViewCompat.setAlpha(view, 1.0f);
            BaseOnSubScribe.setAnimateViewVisible(view, 4);
        }
        max2 = 0;
        i2 = max;
        ViewCompat.setTranslationX(view, (float) i2);
        ViewCompat.setTranslationY(view, (float) max2);
        ViewCompat.setAlpha(view, 1.0f);
        BaseOnSubScribe.setAnimateViewVisible(view, 4);
    }
}
