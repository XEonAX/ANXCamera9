package com.android.camera.ui.drawable.lighting;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.PorterDuff.Mode;
import android.graphics.PorterDuffXfermode;
import com.android.camera.ui.drawable.CameraPaintBase;
import com.android.camera.ui.drawable.PanoramaArrowAnimateDrawable;

public class LightingPaintMask extends CameraPaintBase {
    private int mHeight;
    private int mWidth;
    private PorterDuffXfermode porterDuffXfermode;

    public LightingPaintMask(Context context) {
        super(context);
    }

    public void setData(int i, int i2) {
        this.mWidth = i;
        this.mHeight = i2;
    }

    protected void initPaint(Context context) {
        this.mPaint.setAntiAlias(true);
        this.porterDuffXfermode = new PorterDuffXfermode(Mode.CLEAR);
    }

    protected void draw(Canvas canvas) {
        this.mPaint.reset();
        this.mPaint.setColor(Color.argb(this.mCurrentAlpha, 0, 0, 0));
        canvas.drawRect(PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, (float) this.mWidth, (float) this.mHeight, this.mPaint);
        this.mPaint.setXfermode(new PorterDuffXfermode(Mode.CLEAR));
        canvas.drawCircle(this.mMiddleX, this.mMiddleY, this.mBaseRadius * this.mCurrentWidthPercent, this.mPaint);
    }
}
