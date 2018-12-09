package com.android.camera.ui;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ValueAnimator;
import android.animation.ValueAnimator.AnimatorUpdateListener;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Paint.Align;
import android.graphics.Paint.Cap;
import android.graphics.Paint.FontMetricsInt;
import android.graphics.Paint.Style;
import android.graphics.Rect;
import android.graphics.RectF;
import android.util.AttributeSet;
import android.view.View.MeasureSpec;
import android.widget.Checkable;
import android.widget.CompoundButton;
import com.android.camera.R;
import com.android.camera.constant.ColorConstant;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.CameraAction;
import miui.view.animation.QuarticEaseInOutInterpolator;

public class ToggleSwitch extends CompoundButton implements Checkable {
    private static final int DEFAULT_ANIMATION_DURATION = 300;
    private static final int DEFAULT_HEIGHT = 28;
    private static final float DEFAULT_SHADOW_RADIUS = 1.33f;
    private static final int DEFAULT_STROKE_WIDTH = 1;
    private static final int DEFAULT_SWITCH_BACKGROUND_COLOR = -2013265920;
    private static final int DEFAULT_SWITCH_STROKE_COLOR = -1275068417;
    private static final int DEFAULT_TEXT_OFF_COLOR = -1275068417;
    private static final int DEFAULT_TEXT_OFF_SHADOW_COLOR = -1090519040;
    private static final int DEFAULT_TEXT_ON_COLOR = -1;
    private static final int DEFAULT_TEXT_SIZE = 48;
    private static final int DEFAULT_THUMB_COLOR = -13391105;
    private static final int DEFAULT_THUMB_PADDING = 2;
    private static final int DEFAULT_THUMB_SHADOW_COLOR = 1291845632;
    private static final int DEFAULT_WIDTH = 54;
    private static final int SWITCH_OFF_POS = 0;
    private static final int SWITCH_ON_POS = 1;
    private static final String TAG = ToggleSwitch.class.getSimpleName();
    private boolean isMoving;
    private int mAnimDuration;
    private boolean mBroadcasting;
    private boolean mChecked;
    private float mCurrentPos;
    private OnCheckedChangeListener mOnCheckedChangeListener;
    private int mStrokeWidth;
    private int mSwitchBackgroundColor;
    private int mSwitchBackgroundStrokeColor;
    private String mTextOff;
    private int mTextOffColor;
    private int mTextOffShadowColor;
    private float mTextOffShadowRadius;
    private int mTextOffWidth;
    private String mTextOn;
    private int mTextOnColor;
    private int mTextOnWidth;
    private int mTextSize;
    private int mThumbColor;
    private int mThumbPadding;
    private int mThumbShadowColor;
    private float mThumbShadowRadius;
    private ValueAnimator mValueAnimator;
    private State state;

    public interface OnCheckedChangeListener {
        void onCheckedChanged(ToggleSwitch toggleSwitch, boolean z);
    }

    private enum State {
        SWITCHING_ANIM_OFF,
        SWITCHING_ANIM_ON,
        SWITCH_ON,
        SWITCH_OFF
    }

    public ToggleSwitch(Context context) {
        super(context);
        this.mTextOn = "ON";
        this.mTextOff = "OFF";
        this.mSwitchBackgroundColor = DEFAULT_SWITCH_BACKGROUND_COLOR;
        this.mSwitchBackgroundStrokeColor = ColorConstant.COLOR_COMMON_NORMAL;
        this.mStrokeWidth = dp2px(1.0f);
        this.mThumbColor = DEFAULT_THUMB_COLOR;
        this.mThumbShadowColor = DEFAULT_THUMB_SHADOW_COLOR;
        this.mThumbShadowRadius = dp2pxFloat(1.33f);
        this.mTextOffShadowColor = DEFAULT_TEXT_OFF_SHADOW_COLOR;
        this.mTextOffShadowRadius = dp2pxFloat(1.33f);
        this.mThumbPadding = dp2px(2.0f);
        this.mAnimDuration = 300;
        this.state = this.mChecked ? State.SWITCH_ON : State.SWITCH_OFF;
        setClickable(true);
    }

    public ToggleSwitch(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.mTextOn = "ON";
        this.mTextOff = "OFF";
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, R.styleable.ToggleSwitch);
        this.mSwitchBackgroundColor = obtainStyledAttributes.getColor(0, DEFAULT_SWITCH_BACKGROUND_COLOR);
        this.mSwitchBackgroundStrokeColor = obtainStyledAttributes.getColor(1, ColorConstant.COLOR_COMMON_NORMAL);
        this.mStrokeWidth = obtainStyledAttributes.getDimensionPixelSize(2, dp2px(1.0f));
        this.mThumbColor = obtainStyledAttributes.getColor(4, DEFAULT_THUMB_COLOR);
        this.mThumbShadowColor = obtainStyledAttributes.getColor(5, DEFAULT_THUMB_SHADOW_COLOR);
        this.mThumbShadowRadius = obtainStyledAttributes.getDimension(6, dp2pxFloat(1.33f));
        this.mThumbPadding = obtainStyledAttributes.getDimensionPixelSize(3, dp2px(2.0f));
        this.mTextOn = (String) obtainStyledAttributes.getText(7);
        this.mTextOff = (String) obtainStyledAttributes.getText(9);
        this.mTextOnColor = obtainStyledAttributes.getInteger(8, -1);
        this.mTextOffColor = obtainStyledAttributes.getInteger(10, ColorConstant.COLOR_COMMON_NORMAL);
        this.mTextOffShadowColor = obtainStyledAttributes.getColor(11, DEFAULT_TEXT_OFF_SHADOW_COLOR);
        this.mTextOffShadowRadius = obtainStyledAttributes.getDimension(13, dp2pxFloat(1.33f));
        this.mTextSize = obtainStyledAttributes.getDimensionPixelSize(12, 48);
        this.mAnimDuration = obtainStyledAttributes.getInteger(14, 300);
        this.mChecked = obtainStyledAttributes.getBoolean(15, false);
        obtainStyledAttributes.recycle();
        caculateTextWidth();
        this.state = this.mChecked ? State.SWITCH_ON : State.SWITCH_OFF;
        setClickable(true);
    }

    private void caculateTextWidth() {
        Rect rect = new Rect();
        Rect rect2 = new Rect();
        Paint paint = new Paint();
        paint.setTextSize((float) this.mTextSize);
        paint.getTextBounds(this.mTextOn, 0, this.mTextOn.length(), rect);
        paint.getTextBounds(this.mTextOff, 0, this.mTextOff.length(), rect2);
        this.mTextOnWidth = rect.width();
        this.mTextOffWidth = rect2.width();
    }

    public void onMeasure(int i, int i2) {
        int size = MeasureSpec.getSize(i);
        int size2 = MeasureSpec.getSize(i2);
        i = MeasureSpec.getMode(i);
        i2 = MeasureSpec.getMode(i2);
        int dp2px = (((dp2px(54.0f) + this.mTextOnWidth) + this.mTextOffWidth) + getPaddingLeft()) + getPaddingRight();
        int dp2px2 = (dp2px(28.0f) + getPaddingTop()) + getPaddingBottom();
        if (i != Integer.MIN_VALUE) {
            dp2px = Math.max(dp2px, size);
        }
        if (i2 != Integer.MIN_VALUE) {
            dp2px2 = Math.max(dp2px2, size2);
        }
        setMeasuredDimension(dp2px, dp2px2);
    }

    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        setLayerType(1, null);
        int width = getWidth();
        int height = getHeight();
        int paddingLeft = getPaddingLeft();
        int paddingTop = getPaddingTop();
        height = (height - paddingTop) - getPaddingBottom();
        canvas.translate((float) (paddingLeft + ((((width - paddingLeft) - getPaddingRight()) - getWidth()) / 2)), (float) (paddingTop + ((height - getHeight()) / 2)));
        switch (this.state) {
            case SWITCH_ON:
                drawSwitchOn(canvas);
                return;
            case SWITCH_OFF:
                drawSwitchOff(canvas);
                return;
            case SWITCHING_ANIM_ON:
                drawSwitchOnAnim(canvas);
                return;
            case SWITCHING_ANIM_OFF:
                drawSwitchOffAnim(canvas);
                return;
            default:
                return;
        }
    }

    private void drawSwitchOn(Canvas canvas) {
        drawRoundRect(canvas, this.mSwitchBackgroundColor, compBackgroundRoundRectAttr(), false);
        float[] compThumbRoundRectAttr = compThumbRoundRectAttr(1.0f);
        drawRoundRect(canvas, this.mThumbColor, compThumbRoundRectAttr, true);
        drawRoundRectStroke(canvas, this.mSwitchBackgroundStrokeColor);
        drawText(canvas, compThumbRoundRectAttr);
    }

    private void drawSwitchOff(Canvas canvas) {
        drawRoundRect(canvas, this.mSwitchBackgroundColor, compBackgroundRoundRectAttr(), false);
        float[] compThumbRoundRectAttr = compThumbRoundRectAttr(0.0f);
        drawRoundRect(canvas, this.mThumbColor, compThumbRoundRectAttr, true);
        drawRoundRectStroke(canvas, this.mSwitchBackgroundStrokeColor);
        drawText(canvas, compThumbRoundRectAttr);
    }

    private void drawSwitchOnAnim(Canvas canvas) {
        drawRoundRect(canvas, this.mSwitchBackgroundColor, compBackgroundRoundRectAttr(), false);
        drawRoundRectStroke(canvas, this.mSwitchBackgroundStrokeColor);
        float[] compThumbRoundRectAttr = compThumbRoundRectAttr(this.mCurrentPos);
        drawRoundRect(canvas, this.mThumbColor, compThumbRoundRectAttr, true);
        drawText(canvas, compThumbRoundRectAttr);
    }

    private void drawSwitchOffAnim(Canvas canvas) {
        drawRoundRect(canvas, this.mSwitchBackgroundColor, compBackgroundRoundRectAttr(), false);
        drawRoundRectStroke(canvas, this.mSwitchBackgroundStrokeColor);
        float[] compThumbRoundRectAttr = compThumbRoundRectAttr(1.0f - this.mCurrentPos);
        drawRoundRect(canvas, this.mThumbColor, compThumbRoundRectAttr, true);
        drawText(canvas, compThumbRoundRectAttr);
    }

    private void drawRoundRect(Canvas canvas, int i, float[] fArr, boolean z) {
        Paint paint = new Paint(1);
        paint.setStyle(Style.FILL);
        paint.setStrokeCap(Cap.SQUARE);
        RectF rectF = new RectF();
        paint.setColor(i);
        if (z) {
            paint.setShadowLayer(this.mThumbShadowRadius, 0.0f, 0.0f, this.mThumbShadowColor);
        }
        rectF.set(fArr[0], fArr[1], fArr[2], fArr[3]);
        canvas.drawRoundRect(rectF, fArr[4], fArr[4], paint);
    }

    private void drawText(Canvas canvas, float[] fArr) {
        Paint paint;
        if (this.mTextOff != null) {
            paint = new Paint(1);
            paint.setTextAlign(Align.LEFT);
            paint.setTextSize((float) this.mTextSize);
            FontMetricsInt fontMetricsInt = paint.getFontMetricsInt();
            int measuredHeight = (((getMeasuredHeight() - fontMetricsInt.bottom) + fontMetricsInt.top) / 2) - fontMetricsInt.top;
            if (this.mChecked) {
                paint.setColor(this.mTextOffColor);
                paint.setShadowLayer(this.mTextOffShadowRadius, 0.0f, 0.0f, this.mTextOffShadowColor);
            } else {
                paint.setColor(this.mTextOnColor);
            }
            canvas.drawText(this.mTextOff, ((((((float) getWidth()) * 0.5f) + (((float) this.mThumbPadding) / 2.0f)) + ((float) this.mStrokeWidth)) - ((float) this.mTextOffWidth)) * 0.5f, (float) measuredHeight, paint);
        }
        if (this.mTextOn != null) {
            paint = new Paint(1);
            paint.setTextAlign(Align.LEFT);
            paint.setTextSize((float) this.mTextSize);
            FontMetricsInt fontMetricsInt2 = paint.getFontMetricsInt();
            int measuredHeight2 = (((getMeasuredHeight() - fontMetricsInt2.bottom) + fontMetricsInt2.top) / 2) - fontMetricsInt2.top;
            if (this.mChecked) {
                paint.setColor(this.mTextOnColor);
            } else {
                paint.setColor(this.mTextOffColor);
                paint.setShadowLayer(this.mTextOffShadowRadius, 0.0f, 0.0f, this.mTextOffShadowColor);
            }
            canvas.drawText(this.mTextOn, (((((((float) getWidth()) * 3.0f) / 2.0f) - (((float) this.mThumbPadding) / 2.0f)) - ((float) this.mStrokeWidth)) - ((float) this.mTextOnWidth)) * 0.5f, (float) measuredHeight2, paint);
        }
    }

    private void drawRoundRectStroke(Canvas canvas, int i) {
        if (this.mStrokeWidth > 0) {
            int width = getWidth();
            float f = ((float) this.mStrokeWidth) / 2.0f;
            float f2 = ((float) width) - f;
            float f3 = ((float) this.mStrokeWidth) / 2.0f;
            float height = ((float) getHeight()) - f3;
            float f4 = (height - f3) * 0.5f;
            Paint paint = new Paint(1);
            paint.setStyle(Style.STROKE);
            paint.setColor(i);
            paint.setStrokeWidth((float) this.mStrokeWidth);
            RectF rectF = new RectF();
            rectF.set(f, f3, f2, height);
            canvas.drawRoundRect(rectF, f4, f4, paint);
        }
    }

    private float[] compBackgroundRoundRectAttr() {
        float width = ((float) getWidth()) - 0.0f;
        float height = ((((float) getHeight()) - 0.0f) - 0.0f) * 0.5f;
        return new float[]{0.0f, 0.0f, width, ((float) getHeight()) - 0.0f, height};
    }

    private float[] compThumbRoundRectAttr(float f) {
        float width = ((float) getWidth()) / 2.0f;
        width = ((width - ((float) this.mStrokeWidth)) - ((((float) this.mThumbPadding) * 3.0f) / 2.0f)) + ((((float) (this.mThumbPadding + this.mStrokeWidth)) * (1.0f - f)) + (((((float) this.mThumbPadding) / 2.0f) + width) * f));
        f = (float) (this.mThumbPadding + this.mStrokeWidth);
        float height = (((((float) (getHeight() - (this.mThumbPadding * 2))) + f) - ((float) (this.mStrokeWidth * 2))) - f) * 0.5f;
        return new float[]{r2, f, width, (((float) (getHeight() - (this.mThumbPadding * 2))) + f) - ((float) (this.mStrokeWidth * 2)), height};
    }

    public int dp2px(float f) {
        return (int) ((f * getResources().getDisplayMetrics().density) + 0.5f);
    }

    public float dp2pxFloat(float f) {
        return (f * getResources().getDisplayMetrics().density) + 0.5f;
    }

    public void setOnCheckedChangeListener(OnCheckedChangeListener onCheckedChangeListener) {
        this.mOnCheckedChangeListener = onCheckedChangeListener;
    }

    public void setChecked(boolean z) {
        if (!(this.isMoving || this.mChecked == z)) {
            this.mChecked = z;
            if (!this.mBroadcasting) {
                this.mBroadcasting = true;
                if (this.mOnCheckedChangeListener != null) {
                    this.mOnCheckedChangeListener.onCheckedChanged(this, this.mChecked);
                }
                this.mBroadcasting = false;
                if (this.mChecked) {
                    this.state = State.SWITCHING_ANIM_ON;
                } else {
                    this.state = State.SWITCHING_ANIM_OFF;
                }
                if (isAttachedToWindow() && isLaidOut()) {
                    animateToCheckedState();
                } else {
                    cancelPositionAnimator();
                    this.mCurrentPos = 0.0f;
                }
            }
        }
    }

    private void cancelPositionAnimator() {
        if (this.mValueAnimator != null) {
            this.mValueAnimator.cancel();
        }
    }

    private void animateToCheckedState() {
        this.mValueAnimator = ValueAnimator.ofFloat(new float[]{0.0f, 1.0f});
        this.mValueAnimator.setDuration((long) this.mAnimDuration);
        this.mValueAnimator.setInterpolator(new QuarticEaseInOutInterpolator());
        this.mValueAnimator.addUpdateListener(new AnimatorUpdateListener() {
            public void onAnimationUpdate(ValueAnimator valueAnimator) {
                ToggleSwitch.this.mCurrentPos = ((Float) valueAnimator.getAnimatedValue()).floatValue();
                ToggleSwitch.this.invalidate();
            }
        });
        this.mValueAnimator.addListener(new AnimatorListenerAdapter() {
            public void onAnimationStart(Animator animator) {
                super.onAnimationStart(animator);
                ToggleSwitch.this.isMoving = true;
            }

            public void onAnimationEnd(Animator animator) {
                super.onAnimationEnd(animator);
                ToggleSwitch.this.isMoving = false;
            }
        });
        if (!this.mValueAnimator.isRunning()) {
            this.mValueAnimator.start();
            this.mCurrentPos = 0.0f;
        }
    }

    public void setAnimDuration(int i) {
        this.mAnimDuration = i;
    }

    public boolean isChecked() {
        return this.mChecked;
    }

    public void toggle() {
        CameraAction cameraAction = (CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
        if (cameraAction == null || !cameraAction.isDoingAction()) {
            setChecked(this.mChecked ^ 1);
        }
    }

    public void setTextOnAndOff(String str, String str2) {
        this.mTextOn = str;
        this.mTextOff = str2;
        caculateTextWidth();
        requestLayout();
    }
}
