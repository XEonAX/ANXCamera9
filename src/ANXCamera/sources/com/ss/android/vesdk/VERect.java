package com.ss.android.vesdk;

import com.android.camera.Util;

public class VERect {
    public int height = 1280;
    public int width = Util.LIMIT_SURFACE_WIDTH;
    public int x = 0;
    public int y = 0;

    public VERect(int i, int i2, int i3, int i4) {
        this.x = i;
        this.y = i2;
        this.width = i3;
        this.height = i4;
    }
}
