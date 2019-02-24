package com.android.camera.ui.drawable.lighting;

import android.animation.Animator;
import android.animation.Animator.AnimatorListener;
import android.animation.ValueAnimator;
import android.animation.ValueAnimator.AnimatorUpdateListener;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.drawable.Drawable;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.view.animation.PathInterpolator;
import com.android.camera.Util;
import com.android.camera.constant.ColorConstant;
import com.android.camera.data.DataRepository;
import com.android.camera.ui.drawable.PanoramaArrowAnimateDrawable;
import miui.view.animation.CubicEaseInOutInterpolator;
import miui.view.animation.SineEaseInOutInterpolator;

public class LightingAnimateDrawable extends Drawable {
    public static final float CENTER_FOCUSING_BIG = 0.576f;
    public static final float CENTER_FOCUSING_SMALL = 0.548f;
    private boolean isShown;
    private ValueAnimator mAlphaAnimator;
    private boolean mAnimateFocusDoing = false;
    private ValueAnimator mExitAnimator;
    private ValueAnimator mFocusingAnimator;
    private int mHeight;
    private float mMiddleHorizontalY;
    private float mMiddleVerticalY;
    private float mMiddleX;
    private LightingPaintCircle mPaintCircle;
    private LightingPaintMask mPaintMask;
    private ValueAnimator mStartAnimator;
    private int mTopMargin;
    private ValueAnimator mUpdateDegreeAnimator;
    private int mWidth;
    private int pendingState;

    public LightingAnimateDrawable(Context context) {
        this.mPaintMask = new LightingPaintMask(context);
        this.mPaintCircle = new LightingPaintCircle(context);
        this.mTopMargin = Util.getDisplayRect(context, 0).top;
    }

    public void draw(@NonNull Canvas canvas) {
        if (this.isShown && canvas != null) {
            int saveLayer = canvas.saveLayer(PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, (float) this.mWidth, (float) this.mHeight, null, 31);
            canvas.save();
            this.mPaintMask.drawCanvas(canvas);
            canvas.restore();
            canvas.save();
            this.mPaintCircle.drawCanvas(canvas);
            canvas.restore();
            canvas.restoreToCount(saveLayer);
        }
    }

    public void setAlpha(int i) {
    }

    public void setColorFilter(@Nullable ColorFilter colorFilter) {
    }

    public int getOpacity() {
        return -1;
    }

    public void setWidthHeight(int i, int i2, int i3) {
        this.mWidth = i;
        this.mHeight = i2;
        float f = (float) i;
        this.mMiddleX = f / 2.0f;
        this.mMiddleVerticalY = (((f * 1.33f) / 2.0f) * 0.8f) + ((float) Util.dpToPixel(24.0f));
        this.mMiddleHorizontalY = (((float) Math.min(this.mWidth, this.mHeight)) * 1.33f) / 2.0f;
        i = DataRepository.dataItemRunning().getUiStyle();
        if (Util.isLongRatioScreen && i == 3) {
            this.mMiddleVerticalY += (float) this.mTopMargin;
            this.mMiddleHorizontalY += (float) this.mTopMargin;
        }
        this.mPaintMask.setData(this.mWidth, this.mHeight);
        updateMiddleValue(i3);
    }

    public void updateMiddleValue(int i) {
        if (this.isShown) {
            animateMiddleChange(i);
        } else if (i == 90 || i == 270) {
            this.mPaintMask.setMiddle(this.mMiddleX, this.mMiddleHorizontalY, ((((float) Math.min(this.mWidth, this.mHeight)) * 1.33f) / 2.0f) / 1.15f);
            this.mPaintCircle.setMiddle(this.mMiddleX, this.mMiddleHorizontalY, ((((float) Math.min(this.mWidth, this.mHeight)) * 1.33f) / 2.0f) / 1.15f);
        } else {
            this.mPaintMask.setMiddle(this.mMiddleX, this.mMiddleVerticalY, (((float) Math.min(this.mWidth, this.mHeight)) * 1.33f) / 2.0f);
            this.mPaintCircle.setMiddle(this.mMiddleX, this.mMiddleVerticalY, (((float) Math.min(this.mWidth, this.mHeight)) * 1.33f) / 2.0f);
        }
    }

    private void animateMiddleChange(int i) {
        cancelAllAnimation();
        if (i == 90 || i == 270) {
            this.mPaintMask.setTargetMiddle(this.mMiddleX, this.mMiddleHorizontalY, ((((float) Math.min(this.mWidth, this.mHeight)) * 1.33f) / 2.0f) / 1.15f);
            this.mPaintCircle.setTargetMiddle(this.mMiddleX, this.mMiddleHorizontalY, ((((float) Math.min(this.mWidth, this.mHeight)) * 1.33f) / 2.0f) / 1.15f);
        } else {
            this.mPaintMask.setTargetMiddle(this.mMiddleX, this.mMiddleVerticalY, (((float) Math.min(this.mWidth, this.mHeight)) * 1.33f) / 2.0f);
            this.mPaintCircle.setTargetMiddle(this.mMiddleX, this.mMiddleVerticalY, (((float) Math.min(this.mWidth, this.mHeight)) * 1.33f) / 2.0f);
        }
        this.mUpdateDegreeAnimator = ValueAnimator.ofFloat(new float[]{PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, 1.0f});
        this.mUpdateDegreeAnimator.setDuration(300);
        this.mUpdateDegreeAnimator.setInterpolator(new PathInterpolator(0.25f, 0.1f, 0.25f, 1.0f));
        this.mUpdateDegreeAnimator.addUpdateListener(new AnimatorUpdateListener() {
            public void onAnimationUpdate(ValueAnimator valueAnimator) {
                float floatValue = ((Float) valueAnimator.getAnimatedValue()).floatValue();
                LightingAnimateDrawable.this.mPaintMask.updateValue(floatValue);
                LightingAnimateDrawable.this.mPaintCircle.updateValue(floatValue);
                LightingAnimateDrawable.this.invalidateSelf();
            }
        });
        this.mUpdateDegreeAnimator.addListener(new AnimatorListener() {
            public void onAnimationStart(Animator animator) {
            }

            public void onAnimationEnd(Animator animator) {
                if (LightingAnimateDrawable.this.isShown && !LightingAnimateDrawable.this.mAnimateFocusDoing) {
                    LightingAnimateDrawable.this.animateFocusing();
                }
            }

            public void onAnimationCancel(Animator animator) {
            }

            public void onAnimationRepeat(Animator animator) {
            }
        });
        this.mUpdateDegreeAnimator.start();
    }

    public void animateStart() {
        cancelAllAnimation();
        this.isShown = true;
        this.mPaintCircle.setVisible(8);
        this.mPaintMask.setCurrentWidthPercent(1.0f).setTargetWidthPercent(0.548f);
        this.mPaintMask.setTargetAlpha(114);
        this.mStartAnimator = ValueAnimator.ofFloat(new float[]{PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, 1.0f});
        this.mStartAnimator.setDuration(380);
        this.mStartAnimator.setInterpolator(new PathInterpolator(0.25f, 0.1f, 0.25f, 1.0f));
        this.mStartAnimator.addUpdateListener(new AnimatorUpdateListener() {
            public void onAnimationUpdate(ValueAnimator valueAnimator) {
                LightingAnimateDrawable.this.mPaintMask.updateValue(((Float) valueAnimator.getAnimatedValue()).floatValue());
                LightingAnimateDrawable.this.invalidateSelf();
            }
        });
        this.mStartAnimator.addListener(new AnimatorListener() {
            public void onAnimationStart(Animator animator) {
            }

            public void onAnimationEnd(Animator animator) {
                LightingAnimateDrawable.this.animateAlphaIn();
            }

            public void onAnimationCancel(Animator animator) {
            }

            public void onAnimationRepeat(Animator animator) {
            }
        });
        this.mStartAnimator.start();
    }

    public void animateAlphaIn() {
        this.mPaintCircle.setVisible(0);
        this.mPaintCircle.setCurrentWidthPercent(0.548f).setTargetWidthPercent(0.548f);
        this.mPaintCircle.setCurrentColor(-1).setTargetColor(-1);
        this.mPaintCircle.setCurrentAlpha(0).setTargetAlpha(255);
        this.mAlphaAnimator = ValueAnimator.ofFloat(new float[]{PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, 1.0f});
        this.mAlphaAnimator.setDuration(200);
        this.mAlphaAnimator.setInterpolator(new CubicEaseInOutInterpolator());
        this.mAlphaAnimator.addUpdateListener(new AnimatorUpdateListener() {
            public void onAnimationUpdate(ValueAnimator valueAnimator) {
                LightingAnimateDrawable.this.mPaintCircle.updateValue(((Float) valueAnimator.getAnimatedValue()).floatValue());
                LightingAnimateDrawable.this.invalidateSelf();
            }
        });
        this.mAlphaAnimator.addListener(new AnimatorListener() {
            public void onAnimationStart(Animator animator) {
            }

            public void onAnimationEnd(Animator animator) {
                LightingAnimateDrawable.this.triggerFocusing();
            }

            public void onAnimationCancel(Animator animator) {
            }

            public void onAnimationRepeat(Animator animator) {
            }
        });
        this.mAlphaAnimator.start();
    }

    private void animateFocusing() {
        this.mAnimateFocusDoing = true;
        this.pendingState = -1;
        this.mPaintCircle.setCurrentColor(-1).setTargetColor(-1);
        cancelAllAnimation();
        this.mFocusingAnimator = ValueAnimator.ofFloat(new float[]{0.548f, 0.576f});
        this.mFocusingAnimator.setInterpolator(new SineEaseInOutInterpolator());
        this.mFocusingAnimator.setDuration(600);
        this.mFocusingAnimator.setRepeatMode(2);
        this.mFocusingAnimator.setRepeatCount(-1);
        this.mFocusingAnimator.addUpdateListener(new AnimatorUpdateListener() {
            public void onAnimationUpdate(ValueAnimator valueAnimator) {
                float floatValue = ((Float) valueAnimator.getAnimatedValue()).floatValue();
                LightingAnimateDrawable.this.mPaintMask.mCurrentWidthPercent = floatValue;
                LightingAnimateDrawable.this.mPaintCircle.mCurrentWidthPercent = floatValue;
                LightingAnimateDrawable.this.invalidateSelf();
            }
        });
        this.mFocusingAnimator.addListener(new AnimatorListener() {
            public void onAnimationStart(Animator animator) {
                LightingAnimateDrawable.this.mAnimateFocusDoing = false;
            }

            public void onAnimationEnd(Animator animator) {
            }

            public void onAnimationCancel(Animator animator) {
            }

            public void onAnimationRepeat(Animator animator) {
                if (0.576f - LightingAnimateDrawable.this.mPaintCircle.mCurrentWidthPercent <= 0.02f && LightingAnimateDrawable.this.pendingState == 2) {
                    LightingAnimateDrawable.this.animateSuccess();
                }
            }
        });
        this.mFocusingAnimator.start();
    }

    public void triggerSuccess() {
        this.pendingState = 2;
    }

    public void triggerFocusing() {
        if (this.isShown && !this.mAnimateFocusDoing) {
            animateFocusing();
        }
    }

    public void animateSuccess() {
        cancelAllAnimation();
        this.mPaintCircle.setCurrentColor(-1).setTargetColor(ColorConstant.COLOR_COMMON_SELECTED);
        this.mPaintCircle.setCurrentWidthPercent(0.576f).setTargetWidthPercent(0.548f);
        this.mPaintMask.setCurrentWidthPercent(0.576f).setTargetWidthPercent(0.548f);
        ValueAnimator ofFloat = ValueAnimator.ofFloat(new float[]{PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, 1.0f});
        ofFloat.setInterpolator(new CubicEaseInOutInterpolator());
        ofFloat.setDuration(250);
        ofFloat.addUpdateListener(new AnimatorUpdateListener() {
            public void onAnimationUpdate(ValueAnimator valueAnimator) {
                float floatValue = ((Float) valueAnimator.getAnimatedValue()).floatValue();
                LightingAnimateDrawable.this.mPaintMask.updateValue(floatValue);
                LightingAnimateDrawable.this.mPaintCircle.updateValue(floatValue);
                LightingAnimateDrawable.this.invalidateSelf();
            }
        });
        ofFloat.start();
    }

    public void animateExit() {
        cancelAllAnimation();
        this.mPaintCircle.setVisible(8);
        this.mPaintMask.setTargetWidthPercent(1.5f);
        this.mPaintMask.setTargetAlpha(114);
        this.mExitAnimator = ValueAnimator.ofFloat(new float[]{PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, 1.0f});
        this.mExitAnimator.setDuration(200);
        this.mExitAnimator.setInterpolator(new PathInterpolator(0.25f, 0.1f, 0.25f, 1.0f));
        this.mExitAnimator.addUpdateListener(new AnimatorUpdateListener() {
            public void onAnimationUpdate(ValueAnimator valueAnimator) {
                LightingAnimateDrawable.this.mPaintMask.updateValue(((Float) valueAnimator.getAnimatedValue()).floatValue());
                LightingAnimateDrawable.this.invalidateSelf();
            }
        });
        this.mExitAnimator.addListener(new AnimatorListener() {
            public void onAnimationStart(Animator animator) {
            }

            public void onAnimationEnd(Animator animator) {
                LightingAnimateDrawable.this.isShown = false;
            }

            public void onAnimationCancel(Animator animator) {
            }

            public void onAnimationRepeat(Animator animator) {
            }
        });
        this.mExitAnimator.start();
    }

    private void cancelAllAnimation() {
        if (this.mStartAnimator != null && this.mStartAnimator.isRunning()) {
            this.mStartAnimator.cancel();
            this.mStartAnimator = null;
        }
        if (this.mAlphaAnimator != null && this.mAlphaAnimator.isRunning()) {
            this.mAlphaAnimator.cancel();
            this.mAlphaAnimator = null;
        }
        if (this.mFocusingAnimator != null && this.mFocusingAnimator.isRunning()) {
            this.mFocusingAnimator.cancel();
            this.mFocusingAnimator = null;
        }
        if (this.mExitAnimator != null && this.mExitAnimator.isRunning()) {
            this.mExitAnimator.cancel();
            this.mExitAnimator = null;
        }
        if (this.mUpdateDegreeAnimator != null && this.mUpdateDegreeAnimator.isRunning()) {
            this.mUpdateDegreeAnimator.cancel();
            this.mUpdateDegreeAnimator = null;
        }
    }

    public void clear() {
        this.isShown = false;
        cancelAllAnimation();
        invalidateSelf();
    }
}
