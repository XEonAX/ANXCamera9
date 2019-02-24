package miui.view.animation;

import android.view.animation.Interpolator;

public class QuadraticEaseInOutInterpolator implements Interpolator {
    public float getInterpolation(float f) {
        f *= 2.0f;
        if (f < 1.0f) {
            return (0.5f * f) * f;
        }
        f -= 1.0f;
        return -0.5f * ((f * (f - 2.0f)) - 1.0f);
    }
}
