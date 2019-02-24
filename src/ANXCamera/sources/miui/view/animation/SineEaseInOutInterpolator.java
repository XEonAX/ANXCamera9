package miui.view.animation;

import android.view.animation.Interpolator;

public class SineEaseInOutInterpolator implements Interpolator {
    public float getInterpolation(float f) {
        return -0.5f * ((float) (Math.cos(3.141592653589793d * ((double) f)) - 1.0d));
    }
}
