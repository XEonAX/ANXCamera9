package miui.view.animation;

import android.view.animation.Interpolator;

public class CirclularEaseInInterpolator implements Interpolator {
    public float getInterpolation(float f) {
        return -((float) (Math.sqrt((double) (1.0f - (f * f))) - 1.0d));
    }
}
