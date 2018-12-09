package com.android.camera.ui.drawable.snap;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint.Style;
import android.graphics.RectF;
import com.android.camera.ui.drawable.CameraPaintBase;

public class CameraSnapPaintRound extends CameraPaintBase {
    private static final float RECORDING_ROUND_WIDTH = 0.265f;
    public boolean isRecordingCircle;
    private float mCurrentRoundRectRadius;
    private RectF mRectF;
    private float mRoundingProgress = 1.0f;

    public CameraSnapPaintRound(Context context) {
        super(context);
    }

    public void resetRecordingState() {
        super.resetRecordingState();
        this.isRecordingCircle = false;
    }

    public void prepareRecord() {
        this.mCurrentRoundRectRadius = this.mCurrentWidthPercent;
        this.mRoundingProgress = 1.0f;
    }

    public void updateRecordValue(float f, boolean z) {
        if (z) {
            this.mRoundingProgress = 1.0f - (0.65f * f);
            this.mCurrentRoundRectRadius = this.mCurrentWidthPercent - ((this.mCurrentWidthPercent - RECORDING_ROUND_WIDTH) * f);
            return;
        }
        this.mRoundingProgress = 0.35f + (0.65f * f);
        this.mCurrentRoundRectRadius = RECORDING_ROUND_WIDTH + ((this.mCurrentWidthPercent - RECORDING_ROUND_WIDTH) * f);
    }

    protected void initPaint(Context context) {
        this.mPaint.setAntiAlias(true);
        this.mPaint.setStyle(Style.FILL);
        this.mRectF = new RectF();
    }

    protected void draw(Canvas canvas) {
        if (!this.isRecording) {
            canvas.drawCircle(this.mMiddleX, this.mMiddleY, this.mBaseRadius * this.mCurrentWidthPercent, this.mPaint);
        } else if (this.isRecordingCircle) {
            canvas.drawCircle(this.mMiddleX, this.mMiddleY, this.mBaseRadius * 0.55f, this.mPaint);
        } else {
            float f = this.mBaseRadius * this.mCurrentRoundRectRadius;
            float f2 = this.mMiddleY - f;
            this.mRectF.set(this.mMiddleX - f, f2, this.mMiddleX + f, this.mMiddleY + f);
            canvas.drawRoundRect(this.mRectF, this.mRoundingProgress * f, f * this.mRoundingProgress, this.mPaint);
        }
    }
}
