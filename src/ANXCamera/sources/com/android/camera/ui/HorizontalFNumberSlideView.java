package com.android.camera.ui;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.util.AttributeSet;
import com.aeonax.camera.R;

public class HorizontalFNumberSlideView extends HorizontalSlideView {
    private int mLineColorSelected;
    private float mLineSelectedHalfHeight;
    private int mLineWidth;
    private Paint mPaint;

    protected void init(Context context) {
        super.init(context);
        this.mLineColorSelected = context.getColor(R.color.bokeh_popup_line_color_selected);
        this.mLineSelectedHalfHeight = ((float) context.getResources().getDimensionPixelSize(R.dimen.bokeh_line_selected_height)) / 2.0f;
        this.mLineWidth = context.getResources().getDimensionPixelSize(R.dimen.bokeh_line_width);
        this.mPaint = new Paint();
        this.mPaint.setAntiAlias(true);
        this.mPaint.setStrokeWidth((float) this.mLineWidth);
        this.mPaint.setColor(this.mLineColorSelected);
    }

    public HorizontalFNumberSlideView(Context context) {
        super(context);
        init(context);
    }

    public HorizontalFNumberSlideView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        init(context);
    }

    public HorizontalFNumberSlideView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        init(context);
    }

    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        float f = this.mOriginX;
        float height = ((float) getHeight()) / 2.0f;
        canvas.save();
        canvas.translate(f, height);
        canvas.drawLine(0.0f, -this.mLineSelectedHalfHeight, 0.0f, this.mLineSelectedHalfHeight, this.mPaint);
        canvas.restore();
    }
}
