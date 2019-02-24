package miui.view.animation;

import android.view.animation.Interpolator;

public class QuarticEaseOutInterpolator implements Interpolator {
    public float getInterpolation(float f) {
        f -= 1.0f;
        return -((((f * f) * f) * f) - 1.0f);
    }
}
