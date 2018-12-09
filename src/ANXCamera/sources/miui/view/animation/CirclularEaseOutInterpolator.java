package miui.view.animation;

import android.view.animation.Interpolator;

public class CirclularEaseOutInterpolator implements Interpolator {
    public float getInterpolation(float f) {
        f -= 1.0f;
        return (float) Math.sqrt((double) (1.0f - (f * f)));
    }
}
