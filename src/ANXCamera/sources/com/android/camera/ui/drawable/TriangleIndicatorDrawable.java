package com.android.camera.ui.drawable;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.Path;
import android.graphics.drawable.Drawable;

public class TriangleIndicatorDrawable extends Drawable {
    private int mHeight;
    private Paint mPaint = new Paint();
    private Path mPath = new Path();
    private int mWidth;

    public TriangleIndicatorDrawable() {
        this.mPaint.setStyle(Style.FILL);
        this.mPaint.setColor(-1);
        this.mPaint.setAntiAlias(true);
    }

    public int getWidth() {
        return this.mWidth;
    }

    public void setWidth(int i) {
        this.mWidth = i;
    }

    public int getHeight() {
        return this.mHeight;
    }

    public void setHeight(int i) {
        this.mHeight = i;
    }

    public void draw(Canvas canvas) {
        int i = this.mWidth;
        int i2 = this.mHeight;
        this.mPath.reset();
        this.mPath.moveTo(0.0f, (float) ((-i2) / 2));
        this.mPath.lineTo((float) i, 0.0f);
        this.mPath.lineTo(0.0f, (float) (i2 / 2));
        this.mPath.close();
        canvas.drawPath(this.mPath, this.mPaint);
    }

    public void setAlpha(int i) {
    }

    public void setColorFilter(ColorFilter colorFilter) {
    }

    public int getOpacity() {
        return -1;
    }

    public int getIntrinsicWidth() {
        return this.mWidth;
    }

    public int getIntrinsicHeight() {
        return this.mHeight;
    }
}
