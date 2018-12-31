package com.ss.android.ttve.utils;

import android.animation.TimeInterpolator;
import android.content.Context;
import android.util.AttributeSet;

public class EaseBounceOutInterpolator implements TimeInterpolator {
    public EaseBounceOutInterpolator(Context context, AttributeSet attributeSet) {
    }

    public float getInterpolation(float f) {
        double d = (double) f;
        if (d < 0.36363636363636365d) {
            return (7.5625f * f) * f;
        }
        if (d < 0.7272727272727273d) {
            f -= 0.54545456f;
            return ((7.5625f * f) * f) + 0.75f;
        } else if (d < 0.9090909090909091d) {
            f -= 0.8181818f;
            return ((7.5625f * f) * f) + 0.9375f;
        } else {
            f -= 0.95454544f;
            return ((7.5625f * f) * f) + 0.984375f;
        }
    }
}
