package miui.view.animation;

import android.view.animation.Interpolator;

public class BounceEaseInInterpolator implements Interpolator {
    public float getInterpolation(float f) {
        return 1.0f - new BounceEaseOutInterpolator().getInterpolation(1.0f - f);
    }
}
