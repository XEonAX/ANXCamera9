package com.android.camera.ui.drawable.focus;

import android.animation.Animator;
import android.animation.Animator.AnimatorListener;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.ValueAnimator;
import android.animation.ValueAnimator.AnimatorUpdateListener;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Rect;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.support.annotation.IntRange;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.view.animation.PathInterpolator;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.ui.drawable.CameraPaintBase;
import miui.view.animation.CubicEaseInOutInterpolator;
import miui.view.animation.CubicEaseOutInterpolator;
import miui.view.animation.SineEaseInOutInterpolator;

public class CameraFocusAnimateDrawable extends Drawable implements Animatable {
    public static final int BIG_ALPHA = 205;
    public static int BIG_RADIUS = 0;
    public static final int CENTER_ALPHA = 240;
    public static int CENTER_BASE_RADIUS = 0;
    private static final float CENTER_DOWN_SMALL = 0.85f;
    private static final float CENTER_FOCUSING_BIG = 1.0f;
    private static final float CENTER_FOCUSING_SMALL = 0.95f;
    private static final float CIRCLE_DOWN_BIG = 1.1f;
    private static final float CIRCLE_DOWN_SMALL = 0.94f;
    private static final int LOCK_PAINT_COLOR = 16765730;
    private int mEvAdjustVisible;
    private ValueAnimator mFocusingAnimator;
    private boolean mIsTouchFocus;
    private float mMiddleX = -1.0f;
    private float mMiddleY = -1.0f;
    private CameraFocusPaintBigCircle mPaintBigCircle;
    private CameraFocusPaintCenterIndicator mPaintCenterIndicator;
    private CameraFocusPaintEvAdjust mPaintEvAdjust;
    private CameraFocusPaintEvText mPaintEvText;
    private ValueAnimator mResetCenterAnimator;
    private AnimatorSet mSuccessAnimatorSet;
    private int mSuccessFlag;
    private ValueAnimator mTouchDownAnimator;
    private int pendingState;

    public CameraFocusAnimateDrawable(Context context) {
        BIG_RADIUS = context.getResources().getDimensionPixelSize(R.dimen.focus_big_radius);
        CENTER_BASE_RADIUS = context.getResources().getDimensionPixelSize(R.dimen.focus_center_base_radius);
        this.mPaintBigCircle = new CameraFocusPaintBigCircle(context);
        this.mPaintEvAdjust = new CameraFocusPaintEvAdjust(context);
        this.mPaintEvText = new CameraFocusPaintEvText(context);
        this.mPaintCenterIndicator = new CameraFocusPaintCenterIndicator(context);
        this.mPaintBigCircle.setTargetValues(1.0f, -1, 205, (float) Util.dpToPixel(1.0f));
        this.mPaintEvAdjust.setTargetValues(1.0f, -1, CameraPaintBase.ALPHA_OPAQUE, (float) Util.dpToPixel(1.0f));
        this.mPaintEvText.setTargetValues(1.0f, -1, CameraPaintBase.ALPHA_OPAQUE, (float) Util.dpToPixel(1.0f));
        this.mPaintCenterIndicator.setTargetValues(1.0f, -1, 240, (float) Util.dpToPixel(1.3f));
        this.mPaintBigCircle.setResult();
        this.mPaintEvAdjust.setResult();
        this.mPaintEvText.setResult();
        this.mPaintCenterIndicator.setResult();
    }

    public void setIndicatorData(CameraIndicatorState cameraIndicatorState, Bitmap bitmap) {
        this.mPaintCenterIndicator.setIndicatorData(cameraIndicatorState, bitmap);
    }

    public void setLockIndicatorData(CameraIndicatorState cameraIndicatorState, Bitmap bitmap, Bitmap bitmap2) {
        this.mPaintCenterIndicator.setAEAFIndicatorData(cameraIndicatorState, bitmap, bitmap2);
    }

    public void setRtlAndDisplayRect(boolean z, Rect rect) {
        this.mPaintEvAdjust.setRtlAndDisplayRect(z, rect);
    }

    public void setOrientation(int i) {
        this.mPaintEvAdjust.setOrientation(i);
    }

    public void setCenter(int i, int i2) {
        float f = (float) i;
        this.mMiddleX = f;
        float f2 = (float) i2;
        this.mMiddleY = f2;
        this.mPaintBigCircle.setMiddle(f, f2, (float) BIG_RADIUS);
        this.mPaintEvAdjust.setMiddle(f, f2, (float) BIG_RADIUS);
        this.mPaintEvAdjust.setShowLine(false);
        this.mPaintEvAdjust.setVisible(8);
        this.mPaintEvText.setMiddle(f, f2, (float) BIG_RADIUS);
        this.mPaintCenterIndicator.setCenterFlag(1);
        this.mPaintCenterIndicator.setMiddle(f, f2, (float) CENTER_BASE_RADIUS);
    }

    public void reset() {
        this.mPaintEvAdjust.setShowLine(false);
        this.mPaintEvAdjust.setDistanceY(0.0f);
        this.mPaintEvAdjust.setEvValue(0.0f);
        this.mPaintEvText.setEvValue(0.0f);
    }

    public void setEvTextVisible(int i) {
        this.mPaintEvText.setVisible(i);
    }

    public void setEvAdjustVisible(int i) {
        this.mEvAdjustVisible = i;
        invalidateSelf();
    }

    public void start() {
    }

    public void stop() {
    }

    public boolean isRunning() {
        return this.mFocusingAnimator != null && this.mFocusingAnimator.isRunning();
    }

    public void draw(@NonNull Canvas canvas) {
        if (canvas != null && this.mMiddleX != -1.0f && this.mMiddleY != -1.0f) {
            canvas.save();
            this.mPaintBigCircle.drawCanvas(canvas);
            canvas.restore();
            canvas.save();
            this.mPaintCenterIndicator.drawCanvas(canvas);
            canvas.restore();
            if (this.mEvAdjustVisible != 8) {
                canvas.save();
                this.mPaintEvAdjust.drawCanvas(canvas);
                canvas.restore();
            }
            canvas.save();
            if (this.mSuccessFlag == 5) {
                this.mPaintEvText.setCurrentColor(LOCK_PAINT_COLOR);
                this.mPaintEvText.setCurrentAlpha(192);
            } else {
                this.mPaintEvText.resetPaint();
            }
            this.mPaintEvText.drawCanvas(canvas);
            canvas.restore();
        }
    }

    public void startTouchDownAnimation() {
        cancelFocusingAnimation();
        cancelSuccessAnimation();
        cancelResetCenter();
        this.pendingState = -1;
        if (isAnimatorRunning(this.mTouchDownAnimator)) {
            this.mTouchDownAnimator.cancel();
            this.mTouchDownAnimator = null;
        }
        this.mPaintBigCircle.setCurrentColor(-1).setTargetColor(-1);
        this.mPaintCenterIndicator.setCurrentColor(-1).setTargetColor(-1);
        this.mPaintEvAdjust.setCurrentColor(-1).setTargetColor(-1);
        this.mTouchDownAnimator = ValueAnimator.ofFloat(new float[]{0.0f, 1.0f});
        this.mTouchDownAnimator.setDuration(300);
        this.mTouchDownAnimator.setInterpolator(new CubicEaseOutInterpolator() {
            public float getInterpolation(float f) {
                f = super.getInterpolation(f);
                CameraFocusAnimateDrawable.this.mPaintBigCircle.updateValue(f);
                CameraFocusAnimateDrawable.this.mPaintCenterIndicator.updateValue(f);
                CameraFocusAnimateDrawable.this.invalidateSelf();
                return f;
            }
        });
        this.mTouchDownAnimator.addListener(new AnimatorListener() {
            public void onAnimationStart(Animator animator) {
                CameraFocusAnimateDrawable.this.mPaintBigCircle.setCurrentWidthPercent(CameraFocusAnimateDrawable.CIRCLE_DOWN_BIG).setTargetWidthPercent(CameraFocusAnimateDrawable.CIRCLE_DOWN_SMALL);
                CameraFocusAnimateDrawable.this.mPaintBigCircle.setCurrentAlpha(0).setTargetAlpha(205);
                CameraFocusAnimateDrawable.this.mPaintCenterIndicator.setCenterFlag(1);
                CameraFocusAnimateDrawable.this.mPaintCenterIndicator.setCurrentWidthPercent(CameraFocusAnimateDrawable.CENTER_DOWN_SMALL).setTargetWidthPercent(1.0f);
                CameraFocusAnimateDrawable.this.mPaintCenterIndicator.setCurrentAlpha(0).setTargetAlpha(255);
            }

            public void onAnimationEnd(Animator animator) {
                if (CameraFocusAnimateDrawable.this.mTouchDownAnimator != null) {
                    CameraFocusAnimateDrawable.this.mTouchDownAnimator.cancel();
                    CameraFocusAnimateDrawable.this.mTouchDownAnimator = null;
                }
                int access$300 = CameraFocusAnimateDrawable.this.pendingState;
                if (access$300 == 1) {
                    CameraFocusAnimateDrawable.this.startFocusSuccessAnimation(CameraFocusAnimateDrawable.this.mSuccessFlag, CameraFocusAnimateDrawable.this.mIsTouchFocus);
                } else if (access$300 != 3) {
                    CameraFocusAnimateDrawable.this.startFocusingAnimation();
                } else {
                    CameraFocusAnimateDrawable.this.startFocusFailAnimation();
                }
            }

            public void onAnimationCancel(Animator animator) {
            }

            public void onAnimationRepeat(Animator animator) {
            }
        });
        this.mTouchDownAnimator.start();
    }

    private void startFocusingAnimation() {
        cancelFocusingAnimation();
        this.mFocusingAnimator = ValueAnimator.ofFloat(new float[]{1.0f, CENTER_FOCUSING_SMALL});
        this.mFocusingAnimator.setInterpolator(new SineEaseInOutInterpolator());
        this.mFocusingAnimator.setDuration(200);
        this.mFocusingAnimator.setRepeatMode(2);
        this.mFocusingAnimator.setRepeatCount(-1);
        this.mFocusingAnimator.addUpdateListener(new AnimatorUpdateListener() {
            public void onAnimationUpdate(ValueAnimator valueAnimator) {
                CameraFocusAnimateDrawable.this.mPaintCenterIndicator.mCurrentWidthPercent = ((Float) valueAnimator.getAnimatedValue()).floatValue();
                CameraFocusAnimateDrawable.this.invalidateSelf();
            }
        });
        this.mFocusingAnimator.addListener(new AnimatorListener() {
            public void onAnimationStart(Animator animator) {
            }

            public void onAnimationEnd(Animator animator) {
                if (CameraFocusAnimateDrawable.this.mPaintCenterIndicator.mCurrentWidthPercent == 1.0f) {
                    CameraFocusAnimateDrawable.this.cancelFocusingAnimation();
                    int access$300 = CameraFocusAnimateDrawable.this.pendingState;
                    if (access$300 == 2) {
                        CameraFocusAnimateDrawable.this.startFocusSuccessAnimation(CameraFocusAnimateDrawable.this.mSuccessFlag, CameraFocusAnimateDrawable.this.mIsTouchFocus);
                    } else if (access$300 == 4) {
                        CameraFocusAnimateDrawable.this.startFocusFailAnimation();
                    }
                }
            }

            public void onAnimationCancel(Animator animator) {
            }

            public void onAnimationRepeat(Animator animator) {
            }
        });
        this.mFocusingAnimator.start();
    }

    public void startFocusSuccessAnimation(int i, boolean z) {
        cancelFocusingAnimation();
        this.mSuccessFlag = i;
        this.mIsTouchFocus = z;
        if (!this.mIsTouchFocus) {
            this.mSuccessFlag = 1;
        }
        if (isAnimatorRunning(this.mTouchDownAnimator)) {
            this.pendingState = 1;
        } else if (isAnimatorRunning(this.mFocusingAnimator)) {
            this.pendingState = 2;
        } else if (this.mPaintEvAdjust.getVisible() != 0) {
            if (this.mSuccessFlag == 2 || this.mSuccessFlag == 5) {
                this.mPaintCenterIndicator.setCenterFlag(this.mSuccessFlag);
            }
            if (this.mSuccessFlag == 5) {
                start3ALockSuccessAnimation();
            } else {
                startNormalFocusSuccessAnimation();
            }
        }
    }

    private void startNormalFocusSuccessAnimation() {
        if (this.mIsTouchFocus) {
            this.mPaintEvAdjust.setVisible(0);
        }
        this.mPaintEvAdjust.setStartOffsetY((float) Util.dpToPixel(2.5f));
        this.mPaintEvAdjust.setCurrentAlpha(0).setTargetAlpha(255);
        this.mPaintBigCircle.setTargetWidthPercent(1.0f);
        this.mPaintCenterIndicator.setTargetWidthPercent(CENTER_DOWN_SMALL);
        ValueAnimator ofFloat = ValueAnimator.ofFloat(new float[]{0.0f, 1.0f});
        ofFloat.setDuration(200);
        ofFloat.setInterpolator(new CubicEaseInOutInterpolator() {
            public float getInterpolation(float f) {
                f = super.getInterpolation(f);
                CameraFocusAnimateDrawable.this.mPaintBigCircle.updateValue(f);
                CameraFocusAnimateDrawable.this.mPaintCenterIndicator.updateValue(f);
                CameraFocusAnimateDrawable.this.mPaintEvAdjust.updateValue(f);
                CameraFocusAnimateDrawable.this.invalidateSelf();
                return f;
            }
        });
        ofFloat.addListener(new AnimatorListener() {
            public void onAnimationStart(Animator animator) {
            }

            public void onAnimationEnd(Animator animator) {
                CameraFocusAnimateDrawable.this.mPaintCenterIndicator.setCenterFlag(CameraFocusAnimateDrawable.this.mSuccessFlag);
                if (CameraFocusAnimateDrawable.this.mPaintEvAdjust.getEvValue() > 0.0f) {
                    CameraFocusAnimateDrawable.this.mPaintEvAdjust.setShowLine(true);
                }
                CameraFocusAnimateDrawable.this.invalidateSelf();
            }

            public void onAnimationCancel(Animator animator) {
            }

            public void onAnimationRepeat(Animator animator) {
            }
        });
        ofFloat.start();
    }

    private void start3ALockSuccessAnimation() {
        this.mSuccessAnimatorSet = new AnimatorSet();
        if (this.mIsTouchFocus) {
            this.mPaintEvAdjust.setVisible(0);
        }
        this.mPaintEvAdjust.setStartOffsetY((float) Util.dpToPixel(2.5f));
        this.mPaintEvAdjust.setCurrentAlpha(0).setTargetAlpha(255);
        ValueAnimator ofFloat = ValueAnimator.ofFloat(new float[]{0.0f, 1.0f});
        ofFloat.setDuration(200);
        ofFloat.addUpdateListener(new AnimatorUpdateListener() {
            public void onAnimationUpdate(ValueAnimator valueAnimator) {
                float floatValue = ((Float) valueAnimator.getAnimatedValue()).floatValue();
                CameraFocusAnimateDrawable.this.mPaintBigCircle.updateValue(floatValue);
                CameraFocusAnimateDrawable.this.mPaintCenterIndicator.updateValue(floatValue);
                CameraFocusAnimateDrawable.this.invalidateSelf();
            }
        });
        ofFloat.addListener(new AnimatorListenerAdapter() {
            public void onAnimationStart(Animator animator) {
                CameraFocusAnimateDrawable.this.mPaintCenterIndicator.setCenterFlag(1);
                CameraFocusAnimateDrawable.this.mPaintBigCircle.setCurrentWidthPercent(1.0f).setTargetWidthPercent(1.35f);
                CameraFocusAnimateDrawable.this.mPaintCenterIndicator.setCurrentWidthPercent(1.0f).setTargetWidthPercent(0.9f);
            }
        });
        ValueAnimator ofFloat2 = ValueAnimator.ofFloat(new float[]{0.0f, 1.0f});
        ofFloat2.setDuration(200);
        ofFloat2.setStartDelay(200);
        ofFloat2.addUpdateListener(new AnimatorUpdateListener() {
            public void onAnimationUpdate(ValueAnimator valueAnimator) {
                float floatValue = ((Float) valueAnimator.getAnimatedValue()).floatValue();
                CameraFocusAnimateDrawable.this.mPaintBigCircle.updateValue(floatValue);
                CameraFocusAnimateDrawable.this.mPaintCenterIndicator.updateValue(floatValue);
                CameraFocusAnimateDrawable.this.invalidateSelf();
            }
        });
        ofFloat2.addListener(new AnimatorListenerAdapter() {
            public void onAnimationStart(Animator animator) {
                CameraFocusAnimateDrawable.this.mPaintCenterIndicator.setCenterFlag(1);
                CameraFocusAnimateDrawable.this.mPaintBigCircle.setCurrentWidthPercent(1.35f).setTargetWidthPercent(1.0f);
                CameraFocusAnimateDrawable.this.mPaintCenterIndicator.setCurrentWidthPercent(0.9f).setTargetWidthPercent(0.5f);
                CameraFocusAnimateDrawable.this.mPaintCenterIndicator.setCurrentAlpha(255).setTargetAlpha(0);
            }
        });
        ValueAnimator ofFloat3 = ValueAnimator.ofFloat(new float[]{0.0f, 1.0f});
        ofFloat3.setDuration(300);
        ofFloat3.setStartDelay(400);
        ofFloat3.addUpdateListener(new AnimatorUpdateListener() {
            public void onAnimationUpdate(ValueAnimator valueAnimator) {
                float floatValue = ((Float) valueAnimator.getAnimatedValue()).floatValue();
                CameraFocusAnimateDrawable.this.mPaintCenterIndicator.updateValue(floatValue);
                CameraFocusAnimateDrawable.this.mPaintEvAdjust.updateValue(floatValue);
                CameraFocusAnimateDrawable.this.invalidateSelf();
            }
        });
        ofFloat3.addListener(new AnimatorListenerAdapter() {
            public void onAnimationStart(Animator animator) {
                CameraFocusAnimateDrawable.this.mPaintBigCircle.setCurrentColor(CameraFocusAnimateDrawable.LOCK_PAINT_COLOR).setTargetColor(CameraFocusAnimateDrawable.LOCK_PAINT_COLOR);
                CameraFocusAnimateDrawable.this.mPaintCenterIndicator.setCurrentColor(CameraFocusAnimateDrawable.LOCK_PAINT_COLOR).setTargetColor(CameraFocusAnimateDrawable.LOCK_PAINT_COLOR);
                CameraFocusAnimateDrawable.this.mPaintEvAdjust.setCurrentColor(CameraFocusAnimateDrawable.LOCK_PAINT_COLOR).setTargetColor(CameraFocusAnimateDrawable.LOCK_PAINT_COLOR);
                CameraFocusAnimateDrawable.this.mPaintCenterIndicator.setCenterFlag(5);
                CameraFocusAnimateDrawable.this.mPaintCenterIndicator.setCurrentWidthPercent(1.0f).setTargetWidthPercent(1.0f);
                CameraFocusAnimateDrawable.this.mPaintCenterIndicator.setCurrentAlpha(0).setTargetAlpha(255);
            }
        });
        this.mSuccessAnimatorSet.playTogether(new Animator[]{ofFloat, ofFloat2, ofFloat3});
        this.mSuccessAnimatorSet.setInterpolator(new PathInterpolator(0.25f, 0.1f, 0.25f, 0.1f));
        this.mSuccessAnimatorSet.addListener(new AnimatorListenerAdapter() {
            public void onAnimationEnd(Animator animator) {
                CameraFocusAnimateDrawable.this.mPaintCenterIndicator.setCenterFlag(CameraFocusAnimateDrawable.this.mSuccessFlag);
                if (CameraFocusAnimateDrawable.this.mPaintEvAdjust.getEvValue() > 0.0f) {
                    CameraFocusAnimateDrawable.this.mPaintEvAdjust.setShowLine(true);
                }
                CameraFocusAnimateDrawable.this.invalidateSelf();
                super.onAnimationEnd(animator);
            }
        });
        this.mSuccessAnimatorSet.start();
    }

    public void startFocusFailAnimation() {
        cancelFocusingAnimation();
        if (isAnimatorRunning(this.mTouchDownAnimator)) {
            this.pendingState = 3;
        } else if (isAnimatorRunning(this.mFocusingAnimator)) {
            this.pendingState = 4;
        } else {
            this.mPaintBigCircle.setTargetWidthPercent(1.0f).setTargetAlpha(0);
            this.mPaintCenterIndicator.setTargetWidthPercent(CENTER_FOCUSING_SMALL).setTargetAlpha(0);
            ValueAnimator ofFloat = ValueAnimator.ofFloat(new float[]{0.0f, 1.0f});
            ofFloat.setDuration(200);
            ofFloat.setInterpolator(new CubicEaseInOutInterpolator() {
                public float getInterpolation(float f) {
                    f = super.getInterpolation(f);
                    CameraFocusAnimateDrawable.this.mPaintBigCircle.updateValue(f);
                    CameraFocusAnimateDrawable.this.mPaintCenterIndicator.updateValue(f);
                    CameraFocusAnimateDrawable.this.invalidateSelf();
                    return f;
                }
            });
            ofFloat.start();
        }
    }

    public void setEvChanged(float f, float f2) {
        this.mPaintEvAdjust.setEvValue(f2);
        this.mPaintEvAdjust.setShowLine(true);
        this.mPaintEvAdjust.setDistanceY(f);
        this.mPaintEvText.setEvValue(f2);
        invalidateSelf();
    }

    public void cancelFocusingAnimation() {
        if (this.mFocusingAnimator != null && this.mFocusingAnimator.isRunning()) {
            this.mFocusingAnimator.cancel();
        }
        this.mFocusingAnimator = null;
    }

    private void cancelSuccessAnimation() {
        if (this.mSuccessAnimatorSet != null && this.mSuccessAnimatorSet.isRunning()) {
            this.mSuccessAnimatorSet.cancel();
        }
        this.mSuccessAnimatorSet = null;
    }

    public void resetCenter(final int i, int i2) {
        if (this.mResetCenterAnimator == null) {
            this.mResetCenterAnimator = ValueAnimator.ofInt(new int[]{240, 0});
            this.mResetCenterAnimator.setRepeatMode(2);
            this.mResetCenterAnimator.setRepeatCount(1);
            this.mResetCenterAnimator.setDuration(85);
            this.mResetCenterAnimator.setInterpolator(new CubicEaseOutInterpolator());
            this.mResetCenterAnimator.addUpdateListener(new AnimatorUpdateListener() {
                public void onAnimationUpdate(ValueAnimator valueAnimator) {
                    CameraFocusAnimateDrawable.this.mPaintCenterIndicator.setCurrentAlpha(((Integer) valueAnimator.getAnimatedValue()).intValue());
                    CameraFocusAnimateDrawable.this.invalidateSelf();
                }
            });
            this.mResetCenterAnimator.addListener(new AnimatorListener() {
                public void onAnimationStart(Animator animator) {
                }

                public void onAnimationEnd(Animator animator) {
                }

                public void onAnimationCancel(Animator animator) {
                    CameraFocusAnimateDrawable.this.mPaintCenterIndicator.setCurrentAlpha(240);
                }

                public void onAnimationRepeat(Animator animator) {
                    CameraFocusAnimateDrawable.this.mPaintCenterIndicator.setCenterFlag(i);
                }
            });
        }
        this.mResetCenterAnimator.setStartDelay((long) i2);
        this.mResetCenterAnimator.start();
    }

    public void cancelResetCenter() {
        if (this.mResetCenterAnimator != null && this.mResetCenterAnimator.isRunning()) {
            this.mResetCenterAnimator.cancel();
        }
    }

    private boolean isAnimatorRunning(Animator animator) {
        return animator != null && animator.isRunning();
    }

    public void setAlpha(@IntRange(from = 0, to = 255) int i) {
    }

    public void setColorFilter(@Nullable ColorFilter colorFilter) {
    }

    public int getOpacity() {
        return -1;
    }
}
