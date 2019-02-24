package miui.view.animation;

import android.view.animation.Interpolator;

public class CirclularEaseInOutInterpolator implements Interpolator {
    public float getInterpolation(float f) {
        f *= 2.0f;
        if (f < 1.0f) {
            return -0.5f * ((float) (Math.sqrt((double) (1.0f - (f * f))) - 1.0d));
        }
        f -= 2.0f;
        return 0.5f * ((float) (Math.sqrt((double) (1.0f - (f * f))) + 1.0d));
    }
}
