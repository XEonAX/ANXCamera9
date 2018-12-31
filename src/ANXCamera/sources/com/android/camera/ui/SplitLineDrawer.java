package com.android.camera.ui;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.util.AttributeSet;
import android.view.View;

public class SplitLineDrawer extends View {
    private static final int BORDER = 1;
    private boolean mBottomVisible = true;
    private int mColumnCount;
    private int mLineColor = 872415231;
    private int mRowCount;
    private boolean mTopVisible = true;

    public SplitLineDrawer(Context context) {
        super(context);
    }

    public SplitLineDrawer(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
    }

    public SplitLineDrawer(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public void setBorderVisible(boolean z, boolean z2) {
        if (this.mTopVisible != z || this.mBottomVisible != z2) {
            this.mTopVisible = z;
            this.mBottomVisible = z2;
            invalidate();
        }
    }

    public void setLineColor(int i) {
        this.mLineColor = i;
    }

    public void initialize(int i, int i2) {
        this.mColumnCount = i2;
        this.mRowCount = i;
    }

    protected void onDraw(Canvas canvas) {
        int i;
        int i2;
        Paint paint = new Paint();
        paint.setColor(this.mLineColor);
        int width = getWidth() - 1;
        int height = getHeight() - 1;
        for (i = 1; i < this.mColumnCount; i++) {
            i2 = i * width;
            canvas.drawLine((float) (i2 / this.mColumnCount), 1.0f, (float) (i2 / this.mColumnCount), (float) (height - 1), paint);
        }
        int i3 = 1 ^ this.mBottomVisible;
        i = 0;
        while (i <= this.mRowCount) {
            if (!(i == 0 || i == this.mRowCount) || ((i == 0 && this.mTopVisible) || (i == this.mRowCount && this.mBottomVisible))) {
                i2 = i * height;
                canvas.drawLine((float) i3, (float) (i2 / this.mRowCount), (float) (width - i3), (float) (i2 / this.mRowCount), paint);
            }
            i++;
        }
        super.onDraw(canvas);
    }
}
