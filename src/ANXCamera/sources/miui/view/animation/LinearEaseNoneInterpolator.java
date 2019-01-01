package miui.view.animation;

import android.view.animation.Interpolator;

public class LinearEaseNoneInterpolator implements Interpolator {
    public float getInterpolation(float f) {
        return f;
    }
}
