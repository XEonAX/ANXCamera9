package com.android.camera2.autozoom;

import android.graphics.RectF;

public class AutoZoomTracker {
    private int id;
    private RectF mBounds;

    public AutoZoomTracker(int i, RectF rectF) {
        this.id = i;
        this.mBounds = rectF;
    }

    public int getId() {
        return this.id;
    }

    public RectF getBounds() {
        return this.mBounds;
    }
}
