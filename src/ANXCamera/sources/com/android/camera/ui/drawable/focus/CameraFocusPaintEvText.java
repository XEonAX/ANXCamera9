package com.android.camera.ui.drawable.focus;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint.Align;
import android.graphics.Paint.Style;
import com.android.camera.R;
import com.android.camera.ui.drawable.CameraPaintBase;
import com.android.camera.ui.drawable.PanoramaArrowAnimateDrawable;
import java.util.Locale;

public class CameraFocusPaintEvText extends CameraPaintBase {
    private final int mDefaultPaintAlpha = 192;
    private final int mDefaultPaintColor;
    private final int mDefaultTextSize;
    private int mEvTextMargin;
    private float mEvValue;

    public CameraFocusPaintEvText(Context context) {
        super(context);
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(R.style.SettingStatusBarText, new int[]{16842901, 16842904});
        this.mDefaultPaintColor = obtainStyledAttributes.getColor(obtainStyledAttributes.getIndex(1), -1);
        this.mDefaultTextSize = obtainStyledAttributes.getDimensionPixelSize(obtainStyledAttributes.getIndex(0), 0);
        obtainStyledAttributes.recycle();
        this.mEvTextMargin = context.getResources().getDimensionPixelSize(R.dimen.focus_view_ev_text_margin);
    }

    public void setEvValue(float f) {
        this.mEvValue = f;
    }

    protected void initPaint(Context context) {
        this.mPaint.setColor(this.mDefaultPaintColor);
        this.mPaint.setStyle(Style.FILL);
        this.mPaint.setTextSize((float) this.mDefaultTextSize);
        this.mPaint.setTextAlign(Align.LEFT);
        this.mPaint.setAntiAlias(true);
        this.mPaint.setAlpha(192);
    }

    public void resetPaint() {
        initPaint(null);
    }

    protected void draw(Canvas canvas) {
        if (this.mEvValue != PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO) {
            String format = String.format(Locale.ENGLISH, "%s %.1f", new Object[]{this.mEvValue < PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO ? "-" : "+", Float.valueOf(Math.abs(this.mEvValue))});
            canvas.drawText(format, (this.mMiddleX - (this.mPaint.measureText(format) / 2.0f)) - (this.mPaint.measureText(r0) / 2.0f), (this.mMiddleY - ((float) CameraFocusAnimateDrawable.BIG_RADIUS)) - ((float) this.mEvTextMargin), this.mPaint);
        }
    }
}
