package com.android.camera.animation.type;

import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewPropertyAnimatorCompat;
import android.view.View;
import com.android.camera.ui.drawable.PanoramaArrowAnimateDrawable;

public class AlphaInOnSubscribe extends BaseOnSubScribe {
    public AlphaInOnSubscribe(View view) {
        super(view);
    }

    protected ViewPropertyAnimatorCompat getAnimation() {
        BaseOnSubScribe.setAnimateViewVisible(this.mAniView, 0);
        ViewCompat.setAlpha(this.mAniView, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO);
        return ViewCompat.animate(this.mAniView).alpha(1.0f);
    }

    public static void directSetResult(View view) {
        ViewCompat.setAlpha(view, 1.0f);
        BaseOnSubScribe.setAnimateViewVisible(view, 0);
    }
}
