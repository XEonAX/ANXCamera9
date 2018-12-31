package com.android.camera.ui;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import com.android.camera.ui.drawable.PanoramaArrowAnimateDrawable;

public class RotateLayout extends ViewGroup implements Rotatable {
    private static final String TAG = "RotateLayout";
    protected View mChild;
    private int mOrientation;

    public RotateLayout(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        setBackgroundResource(17170445);
    }

    protected void onFinishInflate() {
        this.mChild = getChildAt(0);
        this.mChild.setPivotX(PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO);
        this.mChild.setPivotY(PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO);
    }

    protected void onLayout(boolean z, int i, int i2, int i3, int i4) {
        i3 -= i;
        i4 -= i2;
        int i5 = this.mOrientation;
        if (i5 != 0) {
            if (i5 != 90) {
                if (i5 != 180) {
                    if (i5 != 270) {
                        return;
                    }
                }
            }
            this.mChild.layout(0, 0, i4, i3);
            return;
        }
        this.mChild.layout(0, 0, i3, i4);
    }

    /* JADX WARNING: Removed duplicated region for block: B:16:0x006c  */
    /* JADX WARNING: Removed duplicated region for block: B:10:0x0040  */
    /* JADX WARNING: Removed duplicated region for block: B:10:0x0040  */
    /* JADX WARNING: Removed duplicated region for block: B:16:0x006c  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    protected void onMeasure(int i, int i2) {
        int i3 = this.mOrientation;
        int i4 = 0;
        if (i3 != 0) {
            if (i3 != 90) {
                if (i3 != 180) {
                    if (i3 != 270) {
                        i = 0;
                        setMeasuredDimension(i4, i);
                        i2 = this.mOrientation;
                        if (i2 == 0) {
                            this.mChild.setTranslationX(PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO);
                            this.mChild.setTranslationY(PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO);
                        } else if (i2 == 90) {
                            this.mChild.setTranslationX(PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO);
                            this.mChild.setTranslationY((float) i);
                        } else if (i2 == 180) {
                            this.mChild.setTranslationX((float) i4);
                            this.mChild.setTranslationY((float) i);
                        } else if (i2 == 270) {
                            this.mChild.setTranslationX((float) i4);
                            this.mChild.setTranslationY(PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO);
                        }
                        this.mChild.setRotation((float) (-this.mOrientation));
                    }
                }
            }
            measureChild(this.mChild, i2, i);
            i4 = this.mChild.getMeasuredHeight();
            i = this.mChild.getMeasuredWidth();
            setMeasuredDimension(i4, i);
            i2 = this.mOrientation;
            if (i2 == 0) {
            }
            this.mChild.setRotation((float) (-this.mOrientation));
        }
        measureChild(this.mChild, i, i2);
        i4 = this.mChild.getMeasuredWidth();
        i = this.mChild.getMeasuredHeight();
        setMeasuredDimension(i4, i);
        i2 = this.mOrientation;
        if (i2 == 0) {
        }
        this.mChild.setRotation((float) (-this.mOrientation));
    }

    public boolean shouldDelayChildPressedState() {
        return false;
    }

    public void setOrientation(int i, boolean z) {
        i %= 360;
        if (this.mOrientation != i) {
            this.mOrientation = i;
            requestLayout();
        }
    }

    public int getCurrentOrientation() {
        return this.mOrientation;
    }
}
