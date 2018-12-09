package com.ss.android.vesdk;

import android.support.annotation.Keep;

@Keep
public interface VEStickerAnimator {
    float getDegree(int i);

    float getScaleX(int i);

    float getScaleY(int i);

    float getTransX(int i);

    float getTransY(int i);
}
