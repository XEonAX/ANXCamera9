package com.android.camera.ui;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff.Mode;
import android.graphics.PorterDuffXfermode;
import android.support.annotation.ColorInt;
import android.support.annotation.Nullable;
import android.support.v4.view.ViewCompat;
import android.util.AttributeSet;
import android.widget.ImageView;
import com.android.camera.ui.drawable.PanoramaArrowAnimateDrawable;

public class ColorImageView extends ImageView {
    private boolean isNeedTransparent = true;
    private int mColor;
    private Paint mPaint;

    public ColorImageView(Context context) {
        super(context);
        init();
    }

    public ColorImageView(Context context, @Nullable AttributeSet attributeSet) {
        super(context, attributeSet);
        init();
    }

    public ColorImageView(Context context, @Nullable AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        init();
    }

    private void init() {
        ViewCompat.setLayerType(this, 2, null);
        this.mPaint = new Paint();
        this.mPaint.setAntiAlias(true);
        this.mPaint.setXfermode(new PorterDuffXfermode(Mode.SRC_IN));
        this.mPaint.setColor(0);
    }

    public void setColor(@ColorInt int i) {
        this.mColor = i;
        this.mPaint.setColor(i);
    }

    public void setColorAndRefresh(@ColorInt int i) {
        setColor(i);
        invalidate();
    }

    protected void onDraw(Canvas canvas) {
        if (this.isNeedTransparent && this.mColor == 0) {
            super.onDraw(canvas);
            return;
        }
        int saveLayer = canvas.saveLayer(PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, (float) getWidth(), (float) getHeight(), null, 31);
        super.onDraw(canvas);
        canvas.drawPaint(this.mPaint);
        canvas.restoreToCount(saveLayer);
    }

    public void setIsNeedTransparent(boolean z) {
        this.isNeedTransparent = z;
        invalidate();
    }
}
