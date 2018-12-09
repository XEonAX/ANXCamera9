package com.android.camera.ui;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;
import android.widget.SeekBar;
import android.widget.SeekBar.OnSeekBarChangeListener;
import com.android.camera.R;
import com.android.camera.ui.drawable.PanoramaArrowAnimateDrawable;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

public class SeekBarCompat extends SeekBar implements OnTouchListener, OnSeekBarChangeListener {
    public static final int CENTER_SEEKBAR = 2;
    public static final int NORMAL_SEEKBAR = 1;
    private static final String TAG = SeekBarCompat.class.getSimpleName();
    private boolean mCenterMode;
    private Paint mCenterPointPain;
    private Drawable mCenterProgressBgDrawable;
    private int mCenterProgressColor;
    private Paint mCenterProgressPaint;
    private RectF mCenterProgressRectF;
    private int mCenterProgressStrokeWidth;
    private OnSeekBarCompatTouchListener mOnSeekBarCompatTouchListener;
    private OnSeekBarCompatChangeListener mSeekBarCompatChangeListener;
    private float mX;

    public interface OnSeekBarCompatChangeListener {
        void onProgressChanged(SeekBar seekBar, int i, boolean z);

        void onStartTrackingTouch(SeekBar seekBar);

        void onStopTrackingTouch(SeekBar seekBar);
    }

    public interface OnSeekBarCompatTouchListener {
        boolean onTouch(View view, MotionEvent motionEvent);
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface SeekBarMode {
    }

    public SeekBarCompat(Context context) {
        this(context, null);
    }

    public SeekBarCompat(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.mCenterProgressStrokeWidth = 2;
        this.mCenterProgressColor = -1;
        setOnSeekBarChangeListener(this);
        setOnTouchListener(this);
    }

    protected synchronized void onDraw(Canvas canvas) {
        if (this.mCenterMode) {
            if (!(this.mCenterProgressBgDrawable == null || this.mCenterProgressBgDrawable == getProgressDrawable())) {
                setProgressDrawable(this.mCenterProgressBgDrawable);
            }
            int height = getHeight() / 2;
            this.mCenterProgressRectF = new RectF();
            float width = ((float) getWidth()) / 2.0f;
            this.mCenterProgressRectF.left = width;
            int progress = getProgress();
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("current progress:");
            stringBuilder.append(progress);
            Log.d(str, stringBuilder.toString());
            if (progress == getMax() / 2) {
                this.mCenterProgressRectF.right = width;
            } else {
                if (this.mX == PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO) {
                    this.mX = (float) (getThumb().getBounds().left + (getThumb().getBounds().width() / 2));
                }
                this.mCenterProgressRectF.right = clamp(this.mX);
            }
            float f = (float) height;
            this.mCenterProgressRectF.top = f - (((float) this.mCenterProgressStrokeWidth) / 2.0f);
            this.mCenterProgressRectF.bottom = f + (((float) this.mCenterProgressStrokeWidth) / 2.0f);
            canvas.drawRoundRect(this.mCenterProgressRectF, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, this.mCenterProgressPaint);
            canvas.drawCircle((float) (getWidth() / 2), (float) (getHeight() / 2), (float) getResources().getDimensionPixelSize(R.dimen.beauty_seek_bar_point_radius), this.mCenterPointPain);
            this.mX = PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO;
        }
        super.onDraw(canvas);
    }

    private float clamp(float f) {
        if (getProgress() > getMax() / 2) {
            f = (float) getThumb().getBounds().left;
            if (f < ((float) (getWidth() / 2))) {
                f = (float) (getWidth() / 2);
            }
        }
        if (getProgress() < getMax() / 2) {
            f = (float) getThumb().getBounds().right;
            if (f > ((float) (getWidth() / 2))) {
                f = (float) (getWidth() / 2);
            }
        }
        if (f < ((float) getPaddingLeft())) {
            return (float) getLeft();
        }
        if (f > ((float) (getWidth() - getPaddingRight()))) {
            return (float) (getWidth() - getPaddingRight());
        }
        return f;
    }

    public void setCenterSeekbarMode(boolean z) {
        this.mCenterMode = z;
        if (this.mCenterMode) {
            this.mCenterProgressBgDrawable = getResources().getDrawable(R.drawable.center_seekbar_style);
            this.mCenterProgressPaint = new Paint();
            this.mCenterProgressPaint.setStrokeWidth((float) this.mCenterProgressStrokeWidth);
            this.mCenterProgressPaint.setColor(this.mCenterProgressColor);
            this.mCenterProgressPaint.setAntiAlias(true);
            this.mCenterPointPain = new Paint();
            this.mCenterPointPain.setStyle(Style.FILL);
            this.mCenterPointPain.setColor(-1);
            this.mCenterPointPain.setAntiAlias(true);
            invalidate();
        }
    }

    public void setOnSeekBarChangeListener(OnSeekBarCompatChangeListener onSeekBarCompatChangeListener) {
        this.mSeekBarCompatChangeListener = onSeekBarCompatChangeListener;
    }

    public boolean onTouch(View view, MotionEvent motionEvent) {
        if (this.mCenterMode) {
            this.mX = motionEvent.getX();
            invalidate();
        }
        if (this.mOnSeekBarCompatTouchListener != null) {
            return this.mOnSeekBarCompatTouchListener.onTouch(view, motionEvent);
        }
        return false;
    }

    public void setOnSeekBarCompatTouchListener(OnSeekBarCompatTouchListener onSeekBarCompatTouchListener) {
        this.mOnSeekBarCompatTouchListener = onSeekBarCompatTouchListener;
    }

    public void onProgressChanged(SeekBar seekBar, int i, boolean z) {
        if (this.mSeekBarCompatChangeListener != null) {
            if (this.mCenterMode) {
                i -= getMax() / 2;
            }
            this.mSeekBarCompatChangeListener.onProgressChanged(seekBar, i, z);
        }
    }

    public void onStartTrackingTouch(SeekBar seekBar) {
        if (this.mSeekBarCompatChangeListener != null) {
            this.mSeekBarCompatChangeListener.onStartTrackingTouch(seekBar);
        }
    }

    public void onStopTrackingTouch(SeekBar seekBar) {
        if (this.mSeekBarCompatChangeListener != null) {
            this.mSeekBarCompatChangeListener.onStopTrackingTouch(seekBar);
        }
    }

    public boolean isCenterSeekBarMode() {
        return this.mCenterMode;
    }

    public synchronized void setProgress(int i) {
        if (this.mCenterMode) {
            super.setProgress(i + (getMax() / 2));
        } else {
            super.setProgress(i);
        }
    }
}
