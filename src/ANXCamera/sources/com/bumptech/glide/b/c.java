package com.bumptech.glide.b;

import android.support.annotation.ColorInt;
import java.util.ArrayList;
import java.util.List;

/* compiled from: GifHeader */
public class c {
    public static final int bA = 0;
    public static final int bB = -1;
    int bC = 0;
    b bD;
    final List<b> bE = new ArrayList();
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
        return this.bC;
    }

    public int getStatus() {
        return this.status;
    }
}
