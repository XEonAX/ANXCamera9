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
    protected void onMeasure(int r6, int r7) {
        /*
        r5 = this;
        r0 = r5.mOrientation;
        r1 = 270; // 0x10e float:3.78E-43 double:1.334E-321;
        r2 = 180; // 0xb4 float:2.52E-43 double:8.9E-322;
        r3 = 90;
        r4 = 0;
        if (r0 == 0) goto L_0x0026;
    L_0x000c:
        if (r0 == r3) goto L_0x0014;
    L_0x000e:
        if (r0 == r2) goto L_0x0026;
    L_0x0010:
        if (r0 == r1) goto L_0x0014;
    L_0x0012:
        r6 = r4;
        goto L_0x0038;
    L_0x0014:
        r0 = r5.mChild;
        r5.measureChild(r0, r7, r6);
        r6 = r5.mChild;
        r4 = r6.getMeasuredHeight();
        r6 = r5.mChild;
        r6 = r6.getMeasuredWidth();
        goto L_0x0038;
    L_0x0026:
        r0 = r5.mChild;
        r5.measureChild(r0, r6, r7);
        r6 = r5.mChild;
        r4 = r6.getMeasuredWidth();
        r6 = r5.mChild;
        r6 = r6.getMeasuredHeight();
    L_0x0038:
        r5.setMeasuredDimension(r4, r6);
        r7 = r5.mOrientation;
        r0 = 0;
        if (r7 == 0) goto L_0x006c;
    L_0x0040:
        if (r7 == r3) goto L_0x0060;
    L_0x0042:
        if (r7 == r2) goto L_0x0053;
    L_0x0044:
        if (r7 == r1) goto L_0x0047;
    L_0x0046:
        goto L_0x0077;
    L_0x0047:
        r6 = r5.mChild;
        r7 = (float) r4;
        r6.setTranslationX(r7);
        r6 = r5.mChild;
        r6.setTranslationY(r0);
        goto L_0x0077;
    L_0x0053:
        r7 = r5.mChild;
        r0 = (float) r4;
        r7.setTranslationX(r0);
        r7 = r5.mChild;
        r6 = (float) r6;
        r7.setTranslationY(r6);
        goto L_0x0077;
    L_0x0060:
        r7 = r5.mChild;
        r7.setTranslationX(r0);
        r7 = r5.mChild;
        r6 = (float) r6;
        r7.setTranslationY(r6);
        goto L_0x0077;
    L_0x006c:
        r6 = r5.mChild;
        r6.setTranslationX(r0);
        r6 = r5.mChild;
        r6.setTranslationY(r0);
    L_0x0077:
        r6 = r5.mChild;
        r7 = r5.mOrientation;
        r7 = -r7;
        r7 = (float) r7;
        r6.setRotation(r7);
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.ui.RotateLayout.onMeasure(int, int):void");
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
