package com.android.camera.ui;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PaintFlagsDrawFilter;
import android.graphics.PorterDuff.Mode;
import android.graphics.PorterDuffXfermode;
import android.graphics.RectF;
import android.graphics.Xfermode;
import android.util.AttributeSet;
import android.widget.ImageView;
import com.android.camera.R;
import com.android.camera.ui.drawable.PanoramaArrowAnimateDrawable;

public class RoundImageView extends ImageView {
    private final PaintFlagsDrawFilter mDrawFilter;
    private Bitmap mMaskBitmap;
    private Paint mPaint;
    private float mRadius;
    private RectF mSrcRectF;
    private float mSrcSize;
    private Xfermode mXfermode;

    public RoundImageView(Context context) {
        this(context, null);
    }

    public RoundImageView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.mDrawFilter = new PaintFlagsDrawFilter(0, 3);
        this.mPaint = new Paint();
        this.mPaint.setColor(-16777216);
        this.mPaint.setAntiAlias(true);
        this.mSrcSize = getResources().getDimension(R.dimen.live_filter_item_size);
        this.mSrcRectF = new RectF(PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, this.mSrcSize, this.mSrcSize);
        this.mRadius = (float) getResources().getDimensionPixelSize(R.dimen.live_filter_item_corners_size);
        this.mXfermode = new PorterDuffXfermode(Mode.DST_IN);
        this.mMaskBitmap = Bitmap.createBitmap((int) this.mSrcSize, (int) this.mSrcSize, Config.ARGB_8888);
        Canvas canvas = new Canvas(this.mMaskBitmap);
        new Paint().setColor(-16777216);
        canvas.drawRoundRect(this.mSrcRectF, this.mRadius, this.mRadius, this.mPaint);
    }

    public void setRoundRadius(float f) {
        this.mRadius = f;
    }

    protected void onDraw(Canvas canvas) {
        int saveLayer = canvas.saveLayer(this.mSrcRectF, null, 31);
        super.onDraw(canvas);
        canvas.setDrawFilter(this.mDrawFilter);
        this.mPaint.setXfermode(this.mXfermode);
        canvas.drawBitmap(this.mMaskBitmap, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, this.mPaint);
        this.mPaint.setXfermode(null);
        canvas.restoreToCount(saveLayer);
    }
}
