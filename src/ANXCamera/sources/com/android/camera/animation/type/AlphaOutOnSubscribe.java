package com.android.camera.animation.type;

import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewPropertyAnimatorCompat;
import android.view.View;
import com.android.camera.ui.drawable.PanoramaArrowAnimateDrawable;

public class AlphaOutOnSubscribe extends BaseOnSubScribe {
    public AlphaOutOnSubscribe(View view) {
        super(view);
    }

    protected ViewPropertyAnimatorCompat getAnimation() {
        BaseOnSubScribe.setAnimateViewVisible(this.mAniView, 0);
        ViewCompat.setAlpha(this.mAniView, 1.0f);
        return ViewCompat.animate(this.mAniView).alpha(PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO);
    }

    protected void onAnimationEnd() {
        super.onAnimationEnd();
        BaseOnSubScribe.setAnimateViewVisible(this.mAniView, this.mTargetGone ? 8 : 4);
    }

    public static void directSetResult(View view) {
        BaseOnSubScribe.setAnimateViewVisible(view, 4);
    }
}
