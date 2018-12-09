package com.android.camera.animation.type;

import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewPropertyAnimatorCompat;
import android.view.View;
import com.android.camera.ui.drawable.PanoramaArrowAnimateDrawable;

public class TranslateYAlphaOutOnSubscribe extends BaseOnSubScribe {
    private int mDistanceY;

    public TranslateYAlphaOutOnSubscribe(View view, int i) {
        super(view);
        this.mDistanceY = i;
    }

    protected ViewPropertyAnimatorCompat getAnimation() {
        BaseOnSubScribe.setAnimateViewVisible(this.mAniView, 0);
        return ViewCompat.animate(this.mAniView).translationY((float) this.mDistanceY).alpha(PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO);
    }

    public static void directSetResult(View view, int i) {
        BaseOnSubScribe.setAnimateViewVisible(view, 0);
        ViewCompat.setTranslationY(view, (float) i);
    }
}
