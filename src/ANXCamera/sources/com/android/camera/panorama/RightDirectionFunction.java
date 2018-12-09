package com.android.camera.panorama;

import android.util.Size;

public class RightDirectionFunction extends DirectionFunction {
    public RightDirectionFunction(int i, int i2, int i3, int i4, int i5, int i6) {
        super(i, i2, i3, i4, i5, i6);
        this.mDirection = 1;
    }

    public Size getPreviewSize() {
        return getHorizontalPreviewSize();
    }

    public boolean enabled() {
        return true;
    }
}
