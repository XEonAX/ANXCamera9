package com.android.camera.ui;

import android.animation.Animator;
import android.animation.AnimatorInflater;
import android.animation.AnimatorListenerAdapter;
import android.animation.Keyframe;
import android.animation.ObjectAnimator;
import android.animation.PropertyValuesHolder;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.Point;
import android.graphics.PointF;
import android.graphics.RectF;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.animation.Interpolator;
import com.android.camera.CameraSettings;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.runing.ComponentRunningTiltValue;
import com.android.camera.effect.EffectController;
import com.mi.config.b;
import miui.view.animation.CubicEaseOutInterpolator;

public class V6EffectCropView extends View implements V6FunctionUI {
    private static final int ANIMATE_RADIUS = 2;
    private static final int ANIMATE_RANGE = 1;
    private static final int ANIMATE_START_RADIUS = (Util.sWindowHeight / 2);
    private static final int ANIMATE_START_RANGE = Util.sWindowHeight;
    private static final int ANIMATION_TIME = 600;
    private static final int CIRCLE_RESIZE_TOUCH_TOLERANCE = Util.dpToPixel(36.0f);
    private static final int CORNER_BALL_RADIUS = Util.dpToPixel(5.0f);
    private static final int DEFAULT_RADIUS = (Util.sWindowHeight / 6);
    private static final int DEFAULT_RANGE = (Util.sWindowHeight / 3);
    private static final int HIDE_TILT_SHIFT_MASK = 2;
    private static final int MIN_CROP_WIDTH_HEIGHT = Util.dpToPixel(64.0f);
    private static final float MIN_DIS_FOR_MOVE_POINT = ((float) (Util.dpToPixel(30.0f) * Util.dpToPixel(30.0f)));
    private static final int MIN_DIS_FOR_SLOPE = (Util.dpToPixel(10.0f) * Util.dpToPixel(10.0f));
    private static final int MIN_RANGE = Util.dpToPixel(20.0f);
    private static final int MOVE_BLOCK = 16;
    private static final int MOVE_BOTTOM = 8;
    private static final int MOVE_LEFT = 1;
    private static final int MOVE_POINT1 = 257;
    private static final int MOVE_POINT2 = 258;
    private static final int MOVE_RADIUS = 32;
    private static final int MOVE_RANGE = 260;
    private static final int MOVE_RIGHT = 4;
    private static final int MOVE_TOP = 2;
    private static final int SHOW_TILT_SHIFT_MASK = 1;
    private static final int TOUCH_TOLERANCE = Util.dpToPixel(18.0f);
    private Handler mAnimateHandler;
    private int mAnimateRadius = 0;
    private int mAnimateRangeWidth = 0;
    private HandlerThread mAnimateThread;
    private int mAnimationStartRadius;
    private int mAnimationStartRange;
    private long mAnimationStartTime;
    private long mAnimationTotalTime;
    private final Paint mBorderPaint = new Paint();
    private int mCenterLineSquare;
    private final Paint mCornerPaint;
    private final RectF mCropBounds = new RectF();
    private final RectF mDefaultCircleBounds = new RectF();
    private final RectF mDefaultRectBounds = new RectF();
    private final RectF mDisplayBounds = new RectF();
    private final PointF mEffectPoint1 = new PointF();
    private final PointF mEffectPoint2 = new PointF();
    private final RectF mEffectRect = new RectF(0.0f, 0.0f, 1.0f, 1.0f);
    private Interpolator mInterpolator = new CubicEaseOutInterpolator();
    private boolean mIsCircle;
    private boolean mIsInTapSlop;
    private boolean mIsRect;
    private double mLastMoveDis;
    private float mLastX;
    private float mLastY;
    private int mMaxRange;
    private int mMovingEdges;
    private float mNormalizedWidth = 0.0f;
    private final Point mPoint1 = new Point();
    private final Point mPoint2 = new Point();
    private int mRadius = 0;
    private int mRangeWidth = 0;
    private int mTapSlop;
    private boolean mTiltShiftMaskAlive;
    private ObjectAnimator mTiltShiftMaskFadeInAnimator;
    private ObjectAnimator mTiltShiftMaskFadeOutAnimator;
    private AnimatorListenerAdapter mTiltShiftMaskFadeOutListener = new AnimatorListenerAdapter() {
        public void onAnimationStart(Animator animator) {
            super.onAnimationStart(animator);
            if (V6EffectCropView.this.mTiltShiftMaskFadeOutAnimator.isRunning()) {
                V6EffectCropView.this.mTiltShiftMaskAlive = false;
            }
        }
    };
    private Handler mTiltShiftMaskHandler;
    private final Point mTouchCenter = new Point();
    private boolean mVisible;

    public V6EffectCropView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.mBorderPaint.setStyle(Style.STROKE);
        this.mBorderPaint.setColor(-1);
        this.mBorderPaint.setStrokeWidth((float) (b.isPad() ? 4 : 2));
        this.mCornerPaint = new Paint();
        this.mCornerPaint.setAntiAlias(true);
        this.mCornerPaint.setColor(-1);
        ViewConfiguration viewConfiguration = ViewConfiguration.get(context);
        this.mTapSlop = viewConfiguration.getScaledTouchSlop() * viewConfiguration.getScaledTouchSlop();
        this.mTiltShiftMaskFadeInAnimator = (ObjectAnimator) AnimatorInflater.loadAnimator(context, R.anim.tilt_shift_mask_fade_in);
        this.mTiltShiftMaskFadeOutAnimator = (ObjectAnimator) AnimatorInflater.loadAnimator(context, R.anim.tilt_shift_mask_fade_out);
        this.mTiltShiftMaskFadeInAnimator.setTarget(EffectController.getInstance());
        ObjectAnimator objectAnimator = this.mTiltShiftMaskFadeInAnimator;
        PropertyValuesHolder[] propertyValuesHolderArr = new PropertyValuesHolder[1];
        propertyValuesHolderArr[0] = PropertyValuesHolder.ofKeyframe(this.mTiltShiftMaskFadeInAnimator.getPropertyName(), new Keyframe[]{Keyframe.ofFloat(0.0f), Keyframe.ofFloat(0.3f, 1.0f), Keyframe.ofFloat(1.0f, 1.0f)});
        objectAnimator.setValues(propertyValuesHolderArr);
        this.mTiltShiftMaskFadeOutAnimator.setTarget(EffectController.getInstance());
        this.mTiltShiftMaskFadeOutAnimator.addListener(this.mTiltShiftMaskFadeOutListener);
    }

    protected void onSizeChanged(int i, int i2, int i3, int i4) {
        float f = (float) i;
        float f2 = (float) i2;
        this.mDisplayBounds.set(0.0f, 0.0f, f, f2);
        this.mDefaultRectBounds.set((float) ((3 * i) / 8), (float) ((3 * i2) / 8), (float) ((5 * i) / 8), (float) ((5 * i2) / 8));
        float f3 = (float) DEFAULT_RADIUS;
        f /= 2.0f;
        f2 /= 2.0f;
        this.mDefaultCircleBounds.set(f - f3, f2 - f3, f + f3, f2 + f3);
        this.mCropBounds.set(this.mIsRect ? this.mDefaultRectBounds : this.mDefaultCircleBounds);
        int i5 = i2 / 2;
        this.mPoint1.set(0, i5);
        this.mPoint2.set(i, i5);
        this.mMaxRange = (i2 * 2) / 3;
        this.mRangeWidth = this.mVisible ? DEFAULT_RANGE : ANIMATE_START_RANGE;
        onCropChange();
    }

    private void onCropChange() {
        float width = this.mDisplayBounds.width();
        float height = this.mDisplayBounds.height();
        this.mEffectRect.set(this.mCropBounds.left / width, this.mCropBounds.top / height, this.mCropBounds.right / width, this.mCropBounds.bottom / height);
        this.mEffectPoint1.set(((float) this.mPoint1.x) / width, ((float) this.mPoint1.y) / height);
        this.mEffectPoint2.set(((float) this.mPoint2.x) / width, ((float) this.mPoint2.y) / height);
        this.mCenterLineSquare = squareOfPoints(this.mPoint1, this.mPoint2);
        normalizeRangeWidth();
        EffectController.getInstance().setEffectAttribute(this.mEffectRect, this.mEffectPoint1, this.mEffectPoint2, this.mNormalizedWidth);
        if (this.mIsRect) {
            invalidate();
        }
    }

    private void normalizeRangeWidth() {
        Point computePointWithDistance = computePointWithDistance(this.mRangeWidth);
        this.mNormalizedWidth = (float) Math.sqrt((double) getSquareOfDistance(((float) computePointWithDistance.x) / this.mDisplayBounds.width(), ((float) computePointWithDistance.y) / this.mDisplayBounds.height(), this.mEffectPoint1, this.mEffectPoint2, false));
    }

    public void removeTiltShiftMask() {
        if (this.mTiltShiftMaskHandler != null) {
            this.mTiltShiftMaskHandler.removeMessages(1);
            this.mTiltShiftMaskHandler.removeMessages(2);
        }
    }

    private void showTiltShiftMask() {
        if (this.mTiltShiftMaskHandler != null) {
            this.mTiltShiftMaskHandler.sendEmptyMessage(1);
        }
    }

    private void hideTiltShiftMask() {
        if (this.mTiltShiftMaskHandler != null) {
            this.mTiltShiftMaskHandler.sendEmptyMessage(2);
        }
    }

    private void detectMovingEdges(float f, float f2) {
        int i = 0;
        this.mMovingEdges = 0;
        float abs;
        if (this.mIsRect) {
            float abs2;
            if (f2 <= this.mCropBounds.bottom + ((float) TOUCH_TOLERANCE) && this.mCropBounds.top - ((float) TOUCH_TOLERANCE) <= f2) {
                abs = Math.abs(f - this.mCropBounds.left);
                abs2 = Math.abs(f - this.mCropBounds.right);
                if (abs <= ((float) TOUCH_TOLERANCE) && abs < abs2) {
                    this.mMovingEdges |= 1;
                } else if (abs2 <= ((float) TOUCH_TOLERANCE)) {
                    this.mMovingEdges |= 4;
                }
            }
            if (f <= this.mCropBounds.right + ((float) TOUCH_TOLERANCE) && this.mCropBounds.left - ((float) TOUCH_TOLERANCE) <= f) {
                abs = Math.abs(f2 - this.mCropBounds.top);
                abs2 = Math.abs(f2 - this.mCropBounds.bottom);
                int i2 = abs <= ((float) TOUCH_TOLERANCE) ? 1 : 0;
                if (abs < abs2) {
                    i = 1;
                }
                if ((i & i2) != 0) {
                    this.mMovingEdges |= 2;
                } else if (abs2 <= ((float) TOUCH_TOLERANCE)) {
                    this.mMovingEdges |= 8;
                }
            }
            if (this.mCropBounds.contains(f, f2) && this.mMovingEdges == 0) {
                this.mMovingEdges = 16;
            }
        } else if (this.mIsCircle) {
            showTiltShiftMask();
            float width = (this.mCropBounds.width() + this.mCropBounds.height()) / 4.0f;
            float f3 = (((float) CIRCLE_RESIZE_TOUCH_TOLERANCE) + width) * (width + ((float) CIRCLE_RESIZE_TOUCH_TOLERANCE));
            float centerX = f - this.mCropBounds.centerX();
            abs = f2 - this.mCropBounds.centerY();
            centerX = (centerX * centerX) + (abs * abs);
            if (centerX > width * width && centerX <= f3) {
                this.mMovingEdges = 32;
            }
            if (this.mCropBounds.contains(f, f2) && this.mMovingEdges == 0) {
                this.mMovingEdges = 16;
            }
        } else {
            showTiltShiftMask();
            Point point = new Point((int) f, (int) f2);
            this.mTouchCenter.set((this.mPoint1.x + this.mPoint2.x) / 2, (this.mPoint1.y + this.mPoint2.y) / 2);
            if (MIN_DIS_FOR_MOVE_POINT < ((float) this.mCenterLineSquare) && squareOfPoints(point, this.mPoint1) < this.mCenterLineSquare / 16) {
                this.mMovingEdges = 257;
            } else if (MIN_DIS_FOR_MOVE_POINT >= ((float) this.mCenterLineSquare) || squareOfPoints(point, this.mPoint2) >= this.mCenterLineSquare / 16) {
                f = getSquareOfDistance(f, f2, new PointF(this.mPoint1), new PointF(this.mPoint2), false);
                if (f < ((float) ((this.mRangeWidth * this.mRangeWidth) / 9))) {
                    this.mMovingEdges = 16;
                    return;
                }
                this.mLastMoveDis = Math.sqrt((double) f);
                this.mMovingEdges = 260;
            } else {
                this.mMovingEdges = 258;
            }
        }
    }

    private void moveEdges(float f, float f2) {
        if (this.mMovingEdges == 16) {
            if (f > 0.0f) {
                f = Math.min(this.mDisplayBounds.right - this.mCropBounds.right, f);
            } else {
                f = Math.max(this.mDisplayBounds.left - this.mCropBounds.left, f);
            }
            if (f2 > 0.0f) {
                f2 = Math.min(this.mDisplayBounds.bottom - this.mCropBounds.bottom, f2);
            } else {
                f2 = Math.max(this.mDisplayBounds.top - this.mCropBounds.top, f2);
            }
            this.mCropBounds.offset(f, f2);
        } else {
            float f3 = (float) MIN_CROP_WIDTH_HEIGHT;
            float f4 = (float) MIN_CROP_WIDTH_HEIGHT;
            if ((this.mMovingEdges & 1) != 0) {
                this.mCropBounds.left = Math.min(this.mCropBounds.left + f, this.mCropBounds.right - f3);
            }
            if ((this.mMovingEdges & 2) != 0) {
                this.mCropBounds.top = Math.min(this.mCropBounds.top + f2, this.mCropBounds.bottom - f4);
            }
            if ((this.mMovingEdges & 4) != 0) {
                this.mCropBounds.right = Math.max(this.mCropBounds.right + f, this.mCropBounds.left + f3);
            }
            if ((this.mMovingEdges & 8) != 0) {
                this.mCropBounds.bottom = Math.max(this.mCropBounds.bottom + f2, this.mCropBounds.top + f4);
            }
            this.mCropBounds.intersect(this.mDisplayBounds);
        }
        onCropChange();
    }

    private void moveCircle(float f, float f2, float f3, float f4) {
        if (this.mMovingEdges == 16) {
            if (f3 > 0.0f) {
                f2 = Math.min(this.mDisplayBounds.right - this.mCropBounds.right, f3);
            } else {
                f2 = Math.max(this.mDisplayBounds.left - this.mCropBounds.left, f3);
            }
            if (f4 > 0.0f) {
                f = Math.min(this.mDisplayBounds.bottom - this.mCropBounds.bottom, f4);
            } else {
                f = Math.max(this.mDisplayBounds.top - this.mCropBounds.top, f4);
            }
            this.mCropBounds.offset(f2, f);
        } else {
            f3 = (float) (MIN_CROP_WIDTH_HEIGHT / 2);
            f4 = Math.min(this.mDisplayBounds.width(), this.mDisplayBounds.height()) / 2.0f;
            float centerX = this.mCropBounds.centerX();
            float centerY = this.mCropBounds.centerY();
            f -= centerX;
            f2 -= centerY;
            f = Math.min(f4, Math.max(f3, (float) Math.sqrt((double) ((f * f) + (f2 * f2)))));
            this.mCropBounds.set(centerX - f, centerY - f, centerX + f, centerY + f);
        }
        onCropChange();
    }

    private void moveCrop(float f, float f2, float f3, float f4) {
        if (this.mMovingEdges == 260) {
            double sqrt = Math.sqrt((double) getSquareOfDistance(f, f2, new PointF(this.mPoint1), new PointF(this.mPoint2), false));
            this.mRangeWidth = Util.clamp(this.mRangeWidth + ((int) (sqrt - this.mLastMoveDis)), MIN_RANGE, this.mMaxRange);
            this.mLastMoveDis = sqrt;
        } else if (this.mMovingEdges == 257 || this.mMovingEdges == 258) {
            computeCertenLineCrossPoints(this.mTouchCenter, new Point((int) f, (int) f2));
        } else if (this.mMovingEdges == 16) {
            int i = (int) f3;
            int i2 = (int) f4;
            computeCertenLineCrossPoints(new Point(this.mPoint1.x + i, this.mPoint1.y + i2), new Point(this.mPoint2.x + i, this.mPoint2.y + i2));
        }
        onCropChange();
    }

    public boolean onViewTouchEvent(MotionEvent motionEvent) {
        if (!this.mVisible) {
            return false;
        }
        if (isEnabled()) {
            float x = motionEvent.getX();
            float y = motionEvent.getY();
            int action = motionEvent.getAction() & 255;
            if (action != 5) {
                switch (action) {
                    case 0:
                        detectMovingEdges(x, y);
                        this.mIsInTapSlop = true;
                        this.mLastX = x;
                        this.mLastY = y;
                        break;
                    case 1:
                    case 3:
                        break;
                    case 2:
                        float f = x - this.mLastX;
                        float f2 = y - this.mLastY;
                        if (this.mIsInTapSlop && ((float) this.mTapSlop) < (f * f) + (f2 * f2)) {
                            this.mIsInTapSlop = false;
                        }
                        if (!this.mIsInTapSlop) {
                            if (this.mMovingEdges != 0) {
                                if (this.mIsRect) {
                                    moveEdges(x - this.mLastX, y - this.mLastY);
                                } else if (this.mIsCircle) {
                                    moveCircle(x, y, x - this.mLastX, y - this.mLastY);
                                } else {
                                    moveCrop(x, y, x - this.mLastX, y - this.mLastY);
                                }
                            }
                            this.mLastX = x;
                            this.mLastY = y;
                            break;
                        }
                        break;
                }
            }
            this.mMovingEdges = 0;
            hideTiltShiftMask();
            invalidate();
        }
        return true;
    }

    protected void onDraw(Canvas canvas) {
        if (this.mVisible && this.mIsRect) {
            canvas.drawRect(this.mCropBounds, this.mBorderPaint);
            canvas.drawCircle(this.mCropBounds.left, this.mCropBounds.top, (float) CORNER_BALL_RADIUS, this.mCornerPaint);
            canvas.drawCircle(this.mCropBounds.right, this.mCropBounds.top, (float) CORNER_BALL_RADIUS, this.mCornerPaint);
            canvas.drawCircle(this.mCropBounds.left, this.mCropBounds.bottom, (float) CORNER_BALL_RADIUS, this.mCornerPaint);
            canvas.drawCircle(this.mCropBounds.right, this.mCropBounds.bottom, (float) CORNER_BALL_RADIUS, this.mCornerPaint);
        }
    }

    private static boolean isTiltShift() {
        return CameraSettings.isTiltShiftOn();
    }

    private static boolean isCircle() {
        if (CameraSettings.isTiltShiftOn()) {
            return DataRepository.dataItemRunning().getComponentRunningTiltValue().getComponentValue(160).equals(ComponentRunningTiltValue.TILT_CIRCLE);
        }
        return false;
    }

    public void show() {
        if (EffectController.getInstance().isNeedRect(EffectController.getInstance().getEffectForPreview(false)) || isTiltShift()) {
            innerShow();
        }
    }

    private void innerShow() {
        int i = 1;
        boolean isTiltShift = isTiltShift() ^ true;
        boolean isCircle = isCircle();
        if (!this.mVisible || this.mIsRect != isTiltShift || this.mIsCircle != isCircle) {
            this.mVisible = true;
            this.mMovingEdges = 0;
            setVisibility(0);
            this.mIsRect = isTiltShift;
            this.mIsCircle = isCircle;
            if (isTiltShift()) {
                this.mPoint1.set(0, ((int) this.mDisplayBounds.height()) / 2);
                this.mPoint2.set((int) this.mDisplayBounds.width(), ((int) this.mDisplayBounds.height()) / 2);
                this.mRangeWidth = ANIMATE_START_RANGE;
                this.mRadius = ANIMATE_START_RADIUS;
                this.mAnimationStartTime = System.currentTimeMillis();
                this.mAnimationTotalTime = 600;
                this.mAnimateRangeWidth = DEFAULT_RANGE - this.mRangeWidth;
                this.mAnimationStartRange = this.mRangeWidth;
                this.mAnimateRadius = DEFAULT_RADIUS - this.mRadius;
                this.mAnimationStartRadius = this.mRadius;
                float centerX = this.mDefaultCircleBounds.centerX();
                float centerY = this.mDefaultCircleBounds.centerY();
                this.mCropBounds.set(centerX - ((float) this.mRadius), centerY - ((float) this.mRadius), centerX + ((float) this.mRadius), centerY + ((float) this.mRadius));
                showTiltShiftMask();
                if (this.mAnimateHandler != null) {
                    Handler handler = this.mAnimateHandler;
                    if (isCircle) {
                        i = 2;
                    }
                    handler.sendEmptyMessage(i);
                }
                invalidate();
            } else {
                this.mCropBounds.set(this.mDefaultRectBounds);
                setLayerType(2, null);
            }
            EffectController.getInstance().setInvertFlag(0);
            onCropChange();
        }
    }

    public void show(float f, float f2) {
        if (!this.mVisible) {
            this.mVisible = true;
            setVisibility(0);
            RectF rectF = this.mIsRect ? this.mDefaultRectBounds : this.mDefaultCircleBounds;
            this.mCropBounds.set(f - (rectF.width() / 2.0f), f2 - (rectF.height() / 2.0f), f + (rectF.width() / 2.0f), f2 + (rectF.height() / 2.0f));
            onCropChange();
        }
    }

    public boolean isVisible() {
        return this.mVisible;
    }

    public boolean isMoved() {
        return (this.mIsInTapSlop || this.mMovingEdges == 0) ? false : true;
    }

    public void hide() {
        if (this.mVisible) {
            this.mVisible = false;
            setVisibility(4);
            EffectController.getInstance().clearEffectAttribute();
            EffectController.getInstance().setInvertFlag(0);
        }
    }

    public void updateVisible() {
        if (EffectController.getInstance().isNeedRect(EffectController.getInstance().getEffectForPreview(false)) || isTiltShift()) {
            innerShow();
        } else {
            hide();
        }
    }

    public void updateVisible(int i) {
        if (EffectController.getInstance().isNeedRect(i)) {
            innerShow();
        } else {
            hide();
        }
    }

    public void onCreate() {
        initHandler();
    }

    public void onCameraOpen() {
    }

    public void onResume() {
    }

    public void onPause() {
        if (this.mAnimateHandler != null && this.mAnimateHandler.hasMessages(1)) {
            if (this.mAnimateHandler.hasMessages(1)) {
                this.mAnimateHandler.removeMessages(1);
                this.mRangeWidth = this.mAnimationStartRange + this.mAnimateRangeWidth;
            }
            if (this.mAnimateHandler.hasMessages(2)) {
                this.mAnimateHandler.removeMessages(2);
                this.mRadius = this.mAnimationStartRadius + this.mAnimateRadius;
            }
        }
    }

    public void enableControls(boolean z) {
    }

    private float getSquareOfDistance(float f, float f2, PointF pointF, PointF pointF2, boolean z) {
        PointF pointF3 = pointF;
        PointF pointF4 = pointF2;
        float f3 = pointF3.x;
        float f4 = pointF3.y;
        float f5 = pointF4.x;
        float f6 = pointF4.y;
        float f7;
        if (f3 == f5) {
            f7 = f - f3;
            return f7 * f7;
        } else if (f4 == f6) {
            f7 = f2 - f4;
            return f7 * f7;
        } else {
            float f8 = f5 - f3;
            float f9 = f - f3;
            float f10 = f6 - f4;
            float f11 = f2 - f4;
            float f12 = (f8 * f9) + (f10 * f11);
            if (z && ((double) f12) <= 0.0d) {
                return (f9 * f9) + (f11 * f11);
            }
            f9 = (f8 * f8) + (f10 * f10);
            if (!z || f12 < f9) {
                f12 /= f9;
                f7 = f - (f3 + (f8 * f12));
                f4 = (f4 + (f10 * f12)) - f2;
                return (f7 * f7) + (f4 * f4);
            }
            f7 = f - f5;
            float f13 = f2 - f6;
            return (f7 * f7) + (f13 * f13);
        }
    }

    private void computeCertenLineCrossPoints(Point point, Point point2) {
        if (squareOfPoints(point, point2) >= MIN_DIS_FOR_SLOPE) {
            int width = (int) this.mDisplayBounds.width();
            int height = (int) this.mDisplayBounds.height();
            int clamp;
            if (point.x == point2.x) {
                clamp = Util.clamp(point.x, 0, width);
                this.mPoint1.set(clamp, 0);
                this.mPoint2.set(clamp, height);
            } else if (point.y == point2.y) {
                clamp = Util.clamp(point.y, 0, height);
                this.mPoint1.set(0, clamp);
                this.mPoint2.set(width, clamp);
            } else {
                int i;
                Point[] pointArr = new Point[2];
                float f = ((float) (point2.y - point.y)) / ((float) (point2.x - point.x));
                int i2 = (int) (((float) point.x) - (((float) point.y) / f));
                if (i2 < 0 || i2 > width) {
                    i2 = 0;
                } else {
                    pointArr[0] = new Point(i2, 0);
                    i2 = 1;
                }
                int i3 = (int) (((float) point.x) + (((float) (height - point.y)) / f));
                if (i3 >= 0 && i3 <= width) {
                    i = i2 + 1;
                    pointArr[i2] = new Point(i3, height);
                    i2 = i;
                }
                i3 = (int) (((float) point.y) - (((float) point.x) * f));
                if (i3 >= 0 && i3 <= height && !isContained(pointArr, 0, i3)) {
                    i = i2 + 1;
                    pointArr[i2] = new Point(0, i3);
                    i2 = i;
                }
                clamp = (int) (((float) point.y) + (((float) (width - point.x)) * f));
                if (clamp >= 0 && clamp <= height && !isContained(pointArr, width, clamp)) {
                    height = i2 + 1;
                    pointArr[i2] = new Point(width, clamp);
                    i2 = height;
                }
                if (i2 == 1) {
                    clamp = i2 + 1;
                    pointArr[i2] = new Point(pointArr[0]);
                } else {
                    clamp = i2;
                }
                if (clamp == 2 && MIN_CROP_WIDTH_HEIGHT * MIN_CROP_WIDTH_HEIGHT <= squareOfPoints(pointArr[0], pointArr[1])) {
                    this.mPoint1.set(pointArr[0].x, pointArr[0].y);
                    this.mPoint2.set(pointArr[1].x, pointArr[1].y);
                }
            }
        }
    }

    private boolean isContained(Point[] pointArr, int i, int i2) {
        if (!(pointArr == null || pointArr.length == 0)) {
            for (Point point : pointArr) {
                if (point == null) {
                    return false;
                }
                if (point.x == i || point.y == i2) {
                    return true;
                }
            }
        }
        return false;
    }

    private Point computePointWithDistance(int i) {
        Point point = new Point();
        if (this.mPoint1.x == this.mPoint2.x) {
            point.set(this.mPoint1.x - i, this.mPoint1.y);
        } else if (this.mPoint1.y == this.mPoint2.y) {
            point.set(this.mPoint1.x, this.mPoint1.y - i);
        } else {
            float sqrt = (float) Math.sqrt((double) this.mCenterLineSquare);
            point.set(this.mPoint1.x + ((int) (((float) ((this.mPoint1.y - this.mPoint2.y) * i)) / sqrt)), this.mPoint1.y - ((int) (((float) ((this.mPoint1.x - this.mPoint2.x) * i)) / sqrt)));
        }
        return point;
    }

    private int squareOfPoints(Point point, Point point2) {
        int i = point.x - point2.x;
        int i2 = point.y - point2.y;
        return (i * i) + (i2 * i2);
    }

    private void initHandler() {
        if (this.mTiltShiftMaskHandler == null) {
            this.mTiltShiftMaskHandler = new Handler(Looper.getMainLooper()) {
                public void dispatchMessage(Message message) {
                    switch (message.what) {
                        case 1:
                            V6EffectCropView.this.mTiltShiftMaskFadeOutAnimator.cancel();
                            if (!V6EffectCropView.this.mTiltShiftMaskAlive) {
                                V6EffectCropView.this.mTiltShiftMaskAlive = true;
                                V6EffectCropView.this.mTiltShiftMaskFadeInAnimator.setupStartValues();
                                V6EffectCropView.this.mTiltShiftMaskFadeInAnimator.start();
                                return;
                            }
                            return;
                        case 2:
                            if (V6EffectCropView.this.mTiltShiftMaskFadeInAnimator.isRunning()) {
                                V6EffectCropView.this.mTiltShiftMaskFadeOutAnimator.setStartDelay(V6EffectCropView.this.mTiltShiftMaskFadeInAnimator.getDuration() - V6EffectCropView.this.mTiltShiftMaskFadeInAnimator.getCurrentPlayTime());
                            } else {
                                V6EffectCropView.this.mTiltShiftMaskFadeOutAnimator.setStartDelay(0);
                            }
                            if (V6EffectCropView.this.mTiltShiftMaskAlive) {
                                V6EffectCropView.this.mTiltShiftMaskFadeOutAnimator.start();
                                return;
                            }
                            return;
                        default:
                            return;
                    }
                }
            };
        }
        if (this.mAnimateHandler == null) {
            this.mAnimateThread = new HandlerThread("animateThread");
            this.mAnimateThread.start();
            this.mAnimateHandler = new Handler(this.mAnimateThread.getLooper()) {
                public void dispatchMessage(Message message) {
                    long currentTimeMillis = System.currentTimeMillis() - V6EffectCropView.this.mAnimationStartTime;
                    float f = 1.0f;
                    switch (message.what) {
                        case 1:
                            if (currentTimeMillis < 600) {
                                f = V6EffectCropView.this.mInterpolator.getInterpolation(((float) currentTimeMillis) / ((float) V6EffectCropView.this.mAnimationTotalTime));
                                sendEmptyMessageDelayed(1, 30);
                            } else {
                                V6EffectCropView.this.hideTiltShiftMask();
                            }
                            V6EffectCropView.this.mRangeWidth = V6EffectCropView.this.mAnimationStartRange + ((int) (((float) V6EffectCropView.this.mAnimateRangeWidth) * f));
                            V6EffectCropView.this.onCropChange();
                            return;
                        case 2:
                            if (currentTimeMillis < 600) {
                                f = V6EffectCropView.this.mInterpolator.getInterpolation(((float) currentTimeMillis) / ((float) V6EffectCropView.this.mAnimationTotalTime));
                                sendEmptyMessageDelayed(2, 30);
                            } else {
                                V6EffectCropView.this.hideTiltShiftMask();
                            }
                            float centerX = V6EffectCropView.this.mDefaultCircleBounds.centerX();
                            float centerY = V6EffectCropView.this.mDefaultCircleBounds.centerY();
                            V6EffectCropView.this.mRadius = V6EffectCropView.this.mAnimationStartRadius + ((int) (((float) V6EffectCropView.this.mAnimateRadius) * f));
                            V6EffectCropView.this.mCropBounds.set(centerX - ((float) V6EffectCropView.this.mRadius), centerY - ((float) V6EffectCropView.this.mRadius), centerX + ((float) V6EffectCropView.this.mRadius), centerY + ((float) V6EffectCropView.this.mRadius));
                            V6EffectCropView.this.onCropChange();
                            return;
                        default:
                            return;
                    }
                }
            };
        }
    }

    public void onDestroy() {
        if (this.mAnimateThread != null) {
            this.mAnimateThread.quit();
            this.mAnimateThread = null;
            this.mAnimateHandler = null;
        }
    }
}
