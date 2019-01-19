package com.android.camera.ui.drawable.snap;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.PorterDuff.Mode;
import android.graphics.PorterDuffXfermode;
import android.graphics.RectF;
import android.support.v4.view.ViewCompat;
import com.android.camera.Util;
import com.android.camera.constant.ColorConstant;
import com.android.camera.ui.drawable.CameraPaintBase;
import java.util.ArrayList;
import java.util.List;

public class CameraSnapPaintCircle extends CameraPaintBase {
    public boolean isInBeautyMode;
    private RectF mArcRectF;
    private int mBeautyColor = ColorConstant.COLOR_COMMON_SELECTED_BEAUTY;
    private boolean mNeedRing = false;
    private boolean mNoNeedArc;
    private Paint mOffsetPaint;
    private float mRingWidth;
    private List<Float> mSegmentRatios;
    private List<Long> mSegmentTimes;
    private float mSpaceAngle = 3.0f;

    public CameraSnapPaintCircle(Context context) {
        super(context);
    }

    protected void initPaint(Context context) {
        this.mPaint.setAntiAlias(true);
        this.mPaint.setStyle(Style.STROKE);
        this.mPaint.setStrokeWidth((float) Util.dpToPixel(1.0f));
        this.mArcRectF = new RectF();
        this.mOffsetPaint = new Paint();
        this.mOffsetPaint.setAntiAlias(true);
        this.mOffsetPaint.setStyle(Style.STROKE);
        this.mOffsetPaint.setStrokeWidth((float) Util.dpToPixel(1.0f));
        this.mOffsetPaint.setColor(ViewCompat.MEASURED_STATE_MASK);
        this.mOffsetPaint.setXfermode(new PorterDuffXfermode(Mode.CLEAR));
    }

    public void resetRecordingState() {
        super.resetRecordingState();
        setNeedSplit(false);
    }

    public void setRingVisible(int i) {
        this.mNeedRing = i == 0;
    }

    public void setNeedSplit(boolean z) {
        this.mNoNeedArc = z ^ 1;
        this.mSpaceAngle = z ? 1.5f : 0.0f;
    }

    public void updateValue(float f) {
        super.updateValue(f);
        this.mRingWidth = this.mCurrentWidthPercent + ((0.4f * this.mCurrentWidthPercent) * f);
    }

    protected void draw(Canvas canvas) {
        if (this.mNoNeedArc) {
            this.isRecording = false;
        }
        if (this.isRecording) {
            float f = this.mBaseRadius * this.mCurrentWidthPercent;
            float f2 = this.mMiddleX - f;
            float f3 = this.mMiddleY - f;
            float f4 = this.mMiddleX + f;
            float f5 = this.mMiddleY + f;
            this.mPaint.setAlpha(this.isInBeautyMode ? this.mCurrentAlpha : ALPHA_HINT);
            this.mArcRectF.set(f2, f3, f4, f5);
            canvas.drawArc(this.mArcRectF, -90.0f, 360.0f, false, this.mPaint);
            this.mPaint.setAlpha(ALPHA_OPAQUE);
            if (this.isInBeautyMode) {
                this.mPaint.setColor(this.mBeautyColor);
            }
            canvas.drawArc(this.mArcRectF, -90.0f + (this.isClockwise ? 0.0f : this.timeAngle), Math.max(0.0f, this.isClockwise ? this.timeAngle : 360.0f - this.timeAngle), false, this.mPaint);
            this.mPaint.setColor(this.mCurrentColor);
            this.mOffsetPaint.setStrokeWidth(this.mPaint.getStrokeWidth() + 1.0f);
            if (this.timeAngle != 0.0f) {
                drawOffset(canvas, 0.0f);
                drawOffset(canvas, this.timeAngle);
            }
            if (this.mSegmentRatios != null) {
                for (Float floatValue : this.mSegmentRatios) {
                    drawOffset(canvas, floatValue.floatValue());
                }
            }
        } else if (this.mNeedRing) {
            this.mPaint.setAlpha(ALPHA_OUTSTANDING);
            canvas.drawCircle(this.mMiddleX, this.mMiddleY, this.mBaseRadius * this.mRingWidth, this.mPaint);
            this.mPaint.setAlpha(this.mCurrentAlpha);
        } else {
            canvas.drawCircle(this.mMiddleX, this.mMiddleY, this.mBaseRadius * this.mCurrentWidthPercent, this.mPaint);
        }
    }

    private void drawOffset(Canvas canvas, float f) {
        canvas.drawArc(this.mArcRectF, (-90.0f + f) - this.mSpaceAngle, this.mSpaceAngle * 2.0f, false, this.mOffsetPaint);
    }

    private void drawElapsedArc(Canvas canvas, float f, float f2) {
        Canvas canvas2 = canvas;
        canvas2.drawArc(this.mArcRectF, this.mSpaceAngle + (-90.0f + f), (f2 - f) - this.mSpaceAngle, false, this.mPaint);
    }

    public void addSegmentNow(long j) {
        if (this.mSegmentRatios == null) {
            this.mSegmentRatios = new ArrayList();
        }
        this.mSegmentRatios.add(Float.valueOf(this.timeAngle));
        if (this.mSegmentTimes == null) {
            this.mSegmentTimes = new ArrayList();
        }
        this.mSegmentTimes.add(Long.valueOf(j));
    }

    public void clearSegments() {
        if (this.mSegmentRatios != null) {
            this.mSegmentRatios.clear();
        }
    }

    public List<Float> getSegmentRatios() {
        return this.mSegmentRatios;
    }

    public long removeLastSegmentAndGetLastTime() {
        if (this.mSegmentRatios.isEmpty()) {
            return 0;
        }
        this.mSegmentRatios.remove(this.mSegmentRatios.size() - 1);
        this.mSegmentTimes.remove(this.mSegmentTimes.size() - 1);
        if (this.mSegmentRatios.isEmpty()) {
            this.timeAngle = 0.0f;
            return 0;
        }
        this.timeAngle = ((Float) this.mSegmentRatios.get(this.mSegmentRatios.size() - 1)).floatValue();
        if (this.mSegmentTimes.isEmpty()) {
            return 0;
        }
        return ((Long) this.mSegmentTimes.get(this.mSegmentTimes.size() - 1)).longValue();
    }

    public boolean hasSegments() {
        return (this.mSegmentRatios == null || this.mSegmentRatios.isEmpty()) ? false : true;
    }
}
