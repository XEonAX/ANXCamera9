package com.android.gallery3d.ui;

import android.graphics.RectF;

public interface ScreenNail {
    void draw(GLCanvas gLCanvas, int i, int i2, int i3, int i4);

    void draw(GLCanvas gLCanvas, RectF rectF, RectF rectF2);

    int getHeight();

    int getWidth();

    void noDraw();

    void recycle();
}
