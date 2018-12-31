package com.bumptech.glide.b;

import android.support.annotation.ColorInt;
import java.util.ArrayList;
import java.util.List;

/* compiled from: GifHeader */
public class c {
    public static final int bA = -1;
    public static final int bz = 0;
    int bB = 0;
    b bC;
    final List<b> bD = new ArrayList();
    @ColorInt
    int bgColor;
    int bgIndex;
    @ColorInt
    int[] gct = null;
    boolean gctFlag;
    int gctSize;
    int height;
    int loopCount = -1;
    int pixelAspect;
    int status = 0;
    int width;

    public int getHeight() {
        return this.height;
    }

    public int getWidth() {
        return this.width;
    }

    public int V() {
        return this.bB;
    }

    public int getStatus() {
        return this.status;
    }
}
