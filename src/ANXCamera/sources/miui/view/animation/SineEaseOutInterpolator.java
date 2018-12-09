package miui.view.animation;

import android.view.animation.Interpolator;

public class SineEaseOutInterpolator implements Interpolator {
    public float getInterpolation(float f) {
        return (float) Math.sin(((double) f) * 1.5707963267948966d);
    }
}
