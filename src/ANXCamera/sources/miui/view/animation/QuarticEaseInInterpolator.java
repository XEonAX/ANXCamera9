package miui.view.animation;

import android.view.animation.Interpolator;

public class QuarticEaseInInterpolator implements Interpolator {
    public float getInterpolation(float f) {
        return ((f * f) * f) * f;
    }
}
