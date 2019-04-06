package com.android.camera.ui;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.PorterDuff.Mode;
import android.graphics.PorterDuffXfermode;
import android.graphics.Shader.TileMode;
import android.support.annotation.Nullable;
import android.support.v4.view.ViewCompat;
import android.util.AttributeSet;
import android.view.View;
import android.widget.HorizontalScrollView;
import com.android.camera.R;
import com.android.camera.Util;

public class MimojiTypeHorizonScrollView extends HorizontalScrollView {
    private boolean mIsRTL;
    private Paint mPaint;
    private int mWidth;

    public MimojiTypeHorizonScrollView(Context context) {
        super(context);
        initView();
    }

    public MimojiTypeHorizonScrollView(Context context, @Nullable AttributeSet attributeSet) {
        super(context, attributeSet);
        initView();
    }

    public MimojiTypeHorizonScrollView(Context context, @Nullable AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        initView();
    }

    protected boolean drawChild(Canvas canvas, View view, long j) {
        Canvas canvas2 = canvas;
        int width = getWidth();
        int height = getHeight();
        float f = (float) height;
        int saveLayer = canvas2.saveLayer(0.0f, 0.0f, (float) Math.max(width, view.getWidth()), f, null, 31);
        boolean drawChild = super.drawChild(canvas, view, j);
        canvas2.translate(this.mIsRTL ? (float) Math.max(0, view.getWidth() - width) : 0.0f, 0.0f);
        float f2 = (float) width;
        float f3 = f2 / 2.0f;
        f /= 2.0f;
        float f4 = ((float) (height - width)) / 2.0f;
        height = canvas.save();
        canvas2.rotate(90.0f, f3, f);
        canvas2.translate(0.0f, f4);
        float f5 = 0.0f - f4;
        float f6 = f2 + f4;
        canvas2.drawRect(f5, 0.0f, f6, (float) this.mWidth, this.mPaint);
        canvas2.restoreToCount(height);
        int save = canvas.save();
        canvas2.rotate(-90.0f, f3, f);
        canvas2.translate(0.0f, f4);
        canvas2.drawRect(f5, 0.0f, f6, (float) this.mWidth, this.mPaint);
        canvas2.restoreToCount(save);
        canvas2.restoreToCount(saveLayer);
        return drawChild;
    }

    public void initView() {
        this.mIsRTL = Util.isLayoutRTL(getContext());
        this.mWidth = getResources().getDimensionPixelSize(R.dimen.mode_select_layout_edge);
        this.mPaint = new Paint();
        this.mPaint.setAntiAlias(true);
        this.mPaint.setStyle(Style.FILL);
        this.mPaint.setXfermode(new PorterDuffXfermode(Mode.DST_OUT));
        this.mPaint.setShader(new LinearGradient(0.0f, 0.0f, 0.0f, (float) this.mWidth, new int[]{ViewCompat.MEASURED_STATE_MASK, -939524096, 0}, new float[]{0.0f, 0.2f, 1.0f}, TileMode.CLAMP));
        setFocusable(false);
    }
}
