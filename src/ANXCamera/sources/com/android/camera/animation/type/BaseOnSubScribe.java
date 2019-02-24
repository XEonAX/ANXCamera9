package com.android.camera.animation.type;

import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewPropertyAnimatorCompat;
import android.view.View;
import android.view.animation.Interpolator;
import com.android.camera.animation.AnimationDelegate;
import io.reactivex.Completable;
import io.reactivex.CompletableEmitter;
import io.reactivex.CompletableOnSubscribe;

public abstract class BaseOnSubScribe implements CompletableOnSubscribe {
    protected View mAniView;
    protected int mDurationTime = 300;
    private Interpolator mInterpolator;
    protected int mStartDelayTime;
    protected boolean mTargetGone;

    protected abstract ViewPropertyAnimatorCompat getAnimation();

    public BaseOnSubScribe(View view) {
        this.mAniView = view;
    }

    public BaseOnSubScribe setStartDelayTime(int i) {
        this.mStartDelayTime = i;
        return this;
    }

    public BaseOnSubScribe setDurationTime(int i) {
        this.mDurationTime = i;
        return this;
    }

    public BaseOnSubScribe setInterpolator(Interpolator interpolator) {
        this.mInterpolator = interpolator;
        return this;
    }

    public BaseOnSubScribe targetGone() {
        this.mTargetGone = true;
        return this;
    }

    public void subscribe(final CompletableEmitter completableEmitter) throws Exception {
        getAnimation().setStartDelay((long) this.mStartDelayTime).setDuration((long) this.mDurationTime).setInterpolator(this.mInterpolator != null ? this.mInterpolator : AnimationDelegate.DEFAULT_INTERPOLATOR).withEndAction(new Runnable() {
            public void run() {
                BaseOnSubScribe.this.onAnimationEnd();
                completableEmitter.onComplete();
            }
        }).start();
    }

    protected void onAnimationEnd() {
    }

    protected static final void setAnimateViewVisible(View view, int i) {
        ViewCompat.animate(view).cancel();
        if (view.getVisibility() != i) {
            view.setVisibility(i);
        }
    }

    public final void startAnimationImmediately() {
        Completable.create(this).subscribe();
    }
}
