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
import android.view.MotionEvent;
import android.view.View;
import android.widget.HorizontalScrollView;
import com.android.camera.Util;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.ModeChangeController;
import com.oneplus.camera.R;

public class EdgeHorizonScrollView extends HorizontalScrollView {
    private float mDownX = -1.0f;
    private Paint mEdgePaint;
    private int mEdgeWidth;
    private boolean mIsRTL;
    private boolean mScrolled = false;

    public EdgeHorizonScrollView(Context context) {
        super(context);
        initView();
    }

    public EdgeHorizonScrollView(Context context, @Nullable AttributeSet attributeSet) {
        super(context, attributeSet);
        initView();
    }

    public EdgeHorizonScrollView(Context context, @Nullable AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        initView();
    }

    public void initView() {
        this.mIsRTL = Util.isLayoutRTL(getContext());
        this.mEdgeWidth = getResources().getDimensionPixelSize(R.dimen.mode_select_layout_edge);
        this.mEdgePaint = new Paint();
        this.mEdgePaint.setAntiAlias(true);
        this.mEdgePaint.setStyle(Style.FILL);
        this.mEdgePaint.setXfermode(new PorterDuffXfermode(Mode.DST_OUT));
        this.mEdgePaint.setShader(new LinearGradient(0.0f, 0.0f, 0.0f, (float) this.mEdgeWidth, new int[]{ViewCompat.MEASURED_STATE_MASK, -939524096, 0}, new float[]{0.0f, 0.2f, 1.0f}, TileMode.CLAMP));
        setFocusable(false);
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
        canvas2.drawRect(f5, 0.0f, f6, (float) this.mEdgeWidth, this.mEdgePaint);
        canvas2.restoreToCount(height);
        int save = canvas.save();
        canvas2.rotate(-90.0f, f3, f);
        canvas2.translate(0.0f, f4);
        canvas2.drawRect(f5, 0.0f, f6, (float) this.mEdgeWidth, this.mEdgePaint);
        canvas2.restoreToCount(save);
        canvas2.restoreToCount(saveLayer);
        return drawChild;
    }

    public boolean onTouchEvent(MotionEvent motionEvent) {
        switch (motionEvent.getAction()) {
            case 0:
                this.mDownX = motionEvent.getX();
                this.mScrolled = false;
                return true;
            case 1:
            case 3:
                this.mDownX = -1.0f;
                this.mScrolled = false;
                break;
            case 2:
                if (this.mDownX == -1.0f) {
                    this.mDownX = motionEvent.getX();
                }
                float x = motionEvent.getX() - this.mDownX;
                ModeChangeController modeChangeController = (ModeChangeController) ModeCoordinatorImpl.getInstance().getAttachProtocol(179);
                if (!this.mScrolled) {
                    if (x > ((float) Util.dpToPixel(17.0f)) && modeChangeController.canSwipeChangeMode()) {
                        modeChangeController.selectMode(3, 0);
                        this.mScrolled = true;
                    } else if (x < ((float) (-Util.dpToPixel(17.0f))) && modeChangeController.canSwipeChangeMode()) {
                        modeChangeController.selectMode(5, 0);
                        this.mScrolled = true;
                    }
                }
                return true;
        }
        return false;
    }
}
