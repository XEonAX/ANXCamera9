package com.android.camera.ui;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.Rect;
import android.graphics.RectF;
import android.hardware.camera2.params.MeteringRectangle;
import android.support.annotation.Nullable;
import android.util.AttributeSet;
import android.view.View;
import com.android.camera.ActivityBase;
import com.android.camera.CameraScreenNail;
import com.android.camera.Util;

public class AfRegionsView extends View implements Rotatable {
    private Rect mActiveArraySize;
    private Matrix mCamera2TranslateMatrix = new Matrix();
    protected int mCameraDisplayOrientation;
    private CameraScreenNail mCameraScreenNail;
    private Matrix mCanvasMatrix = new Matrix();
    private boolean mLightingOn;
    private Matrix mMatrix = new Matrix();
    private MeteringRectangle mMeteringRectangle;
    protected int mOrientation;
    private Paint mPaint;
    private RectF mRect = new RectF();
    private float mZoomValue;

    public AfRegionsView(Context context) {
        super(context);
        initView(context);
    }

    public AfRegionsView(Context context, @Nullable AttributeSet attributeSet) {
        super(context, attributeSet);
        initView(context);
    }

    public AfRegionsView(Context context, @Nullable AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        initView(context);
    }

    private void initView(Context context) {
        this.mPaint = new Paint();
        this.mPaint.setAntiAlias(true);
        this.mPaint.setColor(-16711936);
        this.mPaint.setStyle(Style.STROKE);
        this.mPaint.setStrokeWidth((float) Util.dpToPixel(1.0f));
        this.mCameraScreenNail = ((ActivityBase) context).getCameraScreenNail();
    }

    public void setAfRegionRect(MeteringRectangle[] meteringRectangleArr, Rect rect, float f) {
        if (meteringRectangleArr != null) {
            this.mMeteringRectangle = meteringRectangleArr[0];
            this.mActiveArraySize = rect;
            this.mZoomValue = f;
            prepareMatrix();
            postInvalidate();
        }
    }

    public void setLightingOn(boolean z) {
        this.mLightingOn = z;
    }

    public void setCameraDisplayOrientation(int i) {
        this.mCameraDisplayOrientation = i;
    }

    public void clear() {
        this.mMeteringRectangle = null;
        postInvalidate();
    }

    private void prepareMatrix() {
        int height;
        this.mCamera2TranslateMatrix.reset();
        this.mMatrix.reset();
        this.mCanvasMatrix.reset();
        Util.scaleCamera2Matrix(this.mCamera2TranslateMatrix, this.mActiveArraySize, this.mZoomValue);
        int renderHeight = this.mCameraScreenNail.getRenderHeight();
        if (this.mCameraDisplayOrientation == 90 || this.mCameraDisplayOrientation == 270) {
            height = (this.mActiveArraySize.height() * renderHeight) / this.mActiveArraySize.width();
        } else {
            height = (this.mActiveArraySize.width() * renderHeight) / this.mActiveArraySize.height();
        }
        Util.prepareMatrix(this.mMatrix, false, this.mCameraDisplayOrientation, height, renderHeight, getWidth() / 2, getHeight() / 2, this.mActiveArraySize.width(), this.mActiveArraySize.height());
        if (!this.mLightingOn) {
            this.mMatrix.postRotate((float) this.mOrientation);
            this.mCanvasMatrix.postRotate((float) this.mOrientation);
        }
    }

    public void transToViewRect(Rect rect, RectF rectF) {
        rectF.set(rect);
        this.mCamera2TranslateMatrix.mapRect(rectF);
        this.mMatrix.mapRect(rectF);
    }

    protected void onDraw(Canvas canvas) {
        if (this.mMeteringRectangle != null) {
            canvas.save();
            if (!this.mLightingOn) {
                canvas.rotate((float) (-this.mOrientation));
            }
            transToViewRect(this.mMeteringRectangle.getRect(), this.mRect);
            canvas.drawRect(this.mRect, this.mPaint);
            canvas.restore();
        }
    }

    public void setOrientation(int i, boolean z) {
        this.mOrientation = i;
        invalidate();
    }
}
