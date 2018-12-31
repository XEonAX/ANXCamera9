package com.android.camera.ui;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.support.annotation.Nullable;
import android.util.AttributeSet;
import android.view.View;
import android.view.View.MeasureSpec;
import com.android.camera.ui.drawable.lighting.LightingAnimateDrawable;

public class LightingView extends View implements Rotatable {
    private RectF faceViewRectF;
    private RectF focusRectF;
    private int mDisplayRectTopMargin;
    private int mHeight;
    private LightingAnimateDrawable mLightingAnimateDrawable;
    private int mRotation;
    private int mWidth;

    public LightingView(Context context) {
        super(context);
        initView(context);
    }

    public LightingView(Context context, @Nullable AttributeSet attributeSet) {
        super(context, attributeSet);
        initView(context);
    }

    public LightingView(Context context, @Nullable AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        initView(context);
    }

    private void initView(Context context) {
        this.mLightingAnimateDrawable = new LightingAnimateDrawable(context);
        this.mLightingAnimateDrawable.setCallback(this);
        this.faceViewRectF = new RectF();
        this.focusRectF = new RectF();
    }

    protected void onMeasure(int i, int i2) {
        if (MeasureSpec.getMode(i) != 1073741824) {
            super.onMeasure(i, i2);
            return;
        }
        this.mWidth = MeasureSpec.getSize(i);
        this.mHeight = MeasureSpec.getSize(i2);
        setMeasuredDimension(this.mWidth, this.mHeight);
        if (this.mLightingAnimateDrawable != null) {
            this.mLightingAnimateDrawable.setWidthHeight(this.mWidth, this.mHeight, this.mRotation);
            float max = (((float) Math.max(this.mWidth, this.mHeight)) / 2.0f) * 0.576f;
            float f = ((float) this.mWidth) / 2.0f;
            float f2 = (((float) this.mHeight) / 2.0f) * 0.8f;
            this.focusRectF.set(f - max, f2 - max, f + max, f2 + max);
        }
    }

    public RectF getFaceViewRectF() {
        return this.faceViewRectF;
    }

    public RectF getFocusRectF() {
        return this.focusRectF;
    }

    public void triggerAnimateStart() {
        this.mLightingAnimateDrawable.animateStart();
    }

    public void triggerAnimateSuccess() {
        this.mLightingAnimateDrawable.triggerSuccess();
    }

    public void triggerAnimateFocusing() {
        this.mLightingAnimateDrawable.triggerFocusing();
    }

    public void triggerAnimateExit() {
        this.mLightingAnimateDrawable.animateExit();
    }

    public void invalidateDrawable(Drawable drawable) {
        invalidate();
    }

    protected void onDraw(Canvas canvas) {
        this.mLightingAnimateDrawable.draw(canvas);
    }

    public void clear() {
        this.mLightingAnimateDrawable.clear();
    }

    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        this.mLightingAnimateDrawable.setCallback(null);
        this.mLightingAnimateDrawable.clear();
    }

    public void setRotation(int i) {
        this.mRotation = i;
    }

    public void setOrientation(int i, boolean z) {
        if (this.mRotation != i) {
            this.mRotation = i;
            if (this.mLightingAnimateDrawable != null) {
                this.mLightingAnimateDrawable.updateMiddleValue(this.mRotation);
            }
        }
    }
}
