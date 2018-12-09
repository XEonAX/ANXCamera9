package miui.view.animation;

import android.view.animation.Interpolator;

public class ExponentialEaseInInterpolator implements Interpolator {
    public float getInterpolation(float f) {
        return f == 0.0f ? 0.0f : (float) Math.pow(2.0d, (double) (10.0f * (f - 1.0f)));
    }
}
