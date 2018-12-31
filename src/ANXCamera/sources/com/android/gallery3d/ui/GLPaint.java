package com.android.gallery3d.ui;

import com.android.camera.ui.drawable.PanoramaArrowAnimateDrawable;

public class GLPaint {
    private int mColor = 0;
    private float mLineWidth = 1.0f;

    public void setColor(int i) {
        this.mColor = i;
    }

    public int getColor() {
        return this.mColor;
    }

    public void setLineWidth(float f) {
        Utils.assertTrue(f >= PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO);
        this.mLineWidth = f;
    }

    public float getLineWidth() {
        return this.mLineWidth;
    }
}
