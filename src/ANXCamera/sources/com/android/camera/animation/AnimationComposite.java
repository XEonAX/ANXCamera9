package com.android.camera.animation;

import android.animation.ValueAnimator;
import android.animation.ValueAnimator.AnimatorUpdateListener;
import android.provider.MiuiSettings.ScreenEffect;
import android.support.annotation.Nullable;
import android.support.v4.view.ViewCompat;
import android.util.SparseArray;
import android.view.View;
import android.view.animation.LinearInterpolator;
import com.android.camera.animation.AnimationDelegate.AnimationResource;
import com.android.camera.data.DataRepository;
import com.android.camera.module.loader.StartControl;
import com.ss.android.vesdk.VEResult;
import io.reactivex.Completable;
import io.reactivex.Observable;
import io.reactivex.ObservableEmitter;
import io.reactivex.ObservableOnSubscribe;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.annotations.NonNull;
import io.reactivex.disposables.Disposable;
import io.reactivex.functions.Action;
import io.reactivex.functions.Consumer;
import java.util.ArrayList;
import java.util.List;

public class AnimationComposite implements Consumer<Integer> {
    private Disposable mAfterFrameArrivedDisposable = Observable.create(new ObservableOnSubscribe<Integer>() {
        public void subscribe(ObservableEmitter<Integer> observableEmitter) throws Exception {
            AnimationComposite.this.mAfterFrameArrivedEmitter = observableEmitter;
        }
    }).observeOn(AndroidSchedulers.mainThread()).subscribe((Consumer) this);
    private ObservableEmitter<Integer> mAfterFrameArrivedEmitter;
    private Disposable mAnimationDisposable;
    private int mCurrentDegree = 0;
    private int mOrientation = -1;
    private SparseArray<AnimationResource> mResourceSparseArray = new SparseArray();
    private ValueAnimator mRotationAnimator;
    private int mStartDegree = 0;
    private int mTargetDegree = 0;

    public void put(int i, AnimationResource animationResource) {
        this.mResourceSparseArray.put(i, animationResource);
    }

    public void remove(int i) {
        this.mResourceSparseArray.remove(i);
    }

    /* Code decompiled incorrectly, please refer to instructions dump. */
    public Disposable dispose(@Nullable Completable completable, @Nullable Action action, StartControl startControl) {
        Iterable arrayList = new ArrayList();
        if (completable != null) {
            arrayList.add(completable);
        }
        int i = startControl.mTargetMode;
        int i2 = 0;
        boolean z = startControl.mResetType == 2;
        AnimationResource animationResource;
        switch (startControl.mViewConfigType) {
            case 1:
                while (i2 < this.mResourceSparseArray.size()) {
                    animationResource = (AnimationResource) this.mResourceSparseArray.valueAt(i2);
                    if (animationResource.canProvide()) {
                        animationResource.provideAnimateElement(i, null, z);
                    }
                    i2++;
                }
                break;
            case 2:
                while (i2 < this.mResourceSparseArray.size()) {
                    animationResource = (AnimationResource) this.mResourceSparseArray.valueAt(i2);
                    if (animationResource.canProvide()) {
                        animationResource.provideAnimateElement(i, arrayList, z);
                    }
                    i2++;
                }
                break;
            case 3:
                while (i2 < this.mResourceSparseArray.size()) {
                    animationResource = (AnimationResource) this.mResourceSparseArray.valueAt(i2);
                    if (animationResource.canProvide() && animationResource.needViewClear()) {
                        animationResource.provideAnimateElement(i, null, z);
                    }
                    i2++;
                }
                break;
        }
        if (!(this.mAnimationDisposable == null || this.mAnimationDisposable.isDisposed())) {
            this.mAnimationDisposable.dispose();
        }
        if (action != null) {
            this.mAnimationDisposable = Completable.merge(arrayList).subscribe(action);
        } else {
            this.mAnimationDisposable = Completable.merge(arrayList).subscribe();
        }
        return this.mAnimationDisposable;
    }

    public void disposeRotation(int i) {
        int i2 = ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT;
        i = i >= 0 ? i % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT : (i % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT) + ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT;
        if (this.mOrientation != i) {
            int i3 = this.mOrientation != -1 ? 1 : 0;
            int i4 = i - this.mOrientation;
            if (i4 < 0) {
                i4 += ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT;
            }
            if (i4 > 180) {
                i4 += VEResult.TER_EGL_BAD_MATCH;
            }
            i4 = i4 <= 0 ? 1 : 0;
            this.mOrientation = i;
            if (this.mOrientation != 0 || this.mCurrentDegree != 0) {
                this.mTargetDegree = (360 - i) % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT;
                final List<View> arrayList = new ArrayList();
                for (int i5 = 0; i5 < this.mResourceSparseArray.size(); i5++) {
                    AnimationResource animationResource = (AnimationResource) this.mResourceSparseArray.valueAt(i5);
                    if (animationResource.canProvide()) {
                        animationResource.provideRotateItem(arrayList, this.mTargetDegree);
                    }
                }
                if (i3 == 0) {
                    this.mCurrentDegree = this.mTargetDegree;
                    for (View rotation : arrayList) {
                        ViewCompat.setRotation(rotation, (float) this.mTargetDegree);
                    }
                    return;
                }
                if (this.mRotationAnimator != null) {
                    this.mRotationAnimator.cancel();
                }
                this.mStartDegree = this.mCurrentDegree;
                if (i4 != 0) {
                    if (this.mStartDegree == ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT) {
                        i3 = 0;
                    } else {
                        i3 = this.mStartDegree;
                    }
                    if (this.mTargetDegree != 0) {
                        i2 = this.mTargetDegree;
                    }
                } else {
                    i3 = this.mStartDegree == 0 ? ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT : this.mStartDegree;
                    if (this.mTargetDegree == ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT) {
                        i2 = 0;
                    } else {
                        i2 = this.mTargetDegree;
                    }
                }
                this.mRotationAnimator = ValueAnimator.ofInt(new int[]{i3, i2});
                this.mRotationAnimator.setInterpolator(new LinearInterpolator());
                this.mRotationAnimator.removeAllUpdateListeners();
                this.mRotationAnimator.addUpdateListener(new AnimatorUpdateListener() {
                    public void onAnimationUpdate(ValueAnimator valueAnimator) {
                        AnimationComposite.this.mCurrentDegree = ((Integer) valueAnimator.getAnimatedValue()).intValue();
                        for (View rotation : arrayList) {
                            ViewCompat.setRotation(rotation, (float) AnimationComposite.this.mCurrentDegree);
                        }
                    }
                });
                this.mRotationAnimator.start();
            }
        }
    }

    public void setClickEnable(boolean z) {
        for (int i = 0; i < this.mResourceSparseArray.size(); i++) {
            AnimationResource animationResource = (AnimationResource) this.mResourceSparseArray.valueAt(i);
            if (animationResource.canProvide() && animationResource.isEnableClick() != z) {
                animationResource.setClickEnable(z);
            }
        }
    }

    public void notifyDataChanged(int i, int i2) {
        for (int i3 = 0; i3 < this.mResourceSparseArray.size(); i3++) {
            AnimationResource animationResource = (AnimationResource) this.mResourceSparseArray.valueAt(i3);
            if (animationResource.canProvide()) {
                animationResource.notifyDataChanged(i, i2);
            }
        }
    }

    public void notifyAfterFirstFrameArrived(int i) {
        if (this.mAfterFrameArrivedDisposable != null && !this.mAfterFrameArrivedDisposable.isDisposed()) {
            this.mAfterFrameArrivedEmitter.onNext(Integer.valueOf(i));
        }
    }

    public void destroy() {
        if (this.mResourceSparseArray != null) {
            this.mResourceSparseArray.clear();
            this.mResourceSparseArray = null;
        }
        if (this.mAfterFrameArrivedDisposable != null && !this.mAfterFrameArrivedDisposable.isDisposed()) {
            this.mAfterFrameArrivedEmitter.onComplete();
            this.mAfterFrameArrivedDisposable.dispose();
            this.mAfterFrameArrivedDisposable = null;
        }
    }

    public void accept(@NonNull Integer num) throws Exception {
        int i = 0;
        DataRepository.dataItemGlobal().setRetriedIfCameraError(false);
        while (i < this.mResourceSparseArray.size()) {
            AnimationResource animationResource = (AnimationResource) this.mResourceSparseArray.valueAt(i);
            if (animationResource.canProvide()) {
                if (!animationResource.isEnableClick()) {
                    animationResource.setClickEnable(true);
                }
                animationResource.notifyAfterFrameAvailable(num.intValue());
            }
            i++;
        }
    }
}
