package miui.view.animation;

import android.view.animation.Interpolator;

public class CubicEaseInInterpolator implements Interpolator {
    public float getInterpolation(float f) {
        return (f * f) * f;
    }
}
