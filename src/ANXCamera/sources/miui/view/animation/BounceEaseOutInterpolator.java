package miui.view.animation;

import android.view.animation.Interpolator;

public class BounceEaseOutInterpolator implements Interpolator {
    public float getInterpolation(float f) {
        double d = (double) f;
        if (d < 0.36363636363636365d) {
            return (7.5625f * f) * f;
        }
        if (d < 0.7272727272727273d) {
            f = (float) (d - 0.5454545454545454d);
            return ((7.5625f * f) * f) + 0.75f;
        } else if (d < 0.9090909090909091d) {
            f = (float) (d - 0.8181818181818182d);
            return ((7.5625f * f) * f) + 0.9375f;
        } else {
            f = (float) (d - 0.9545454545454546d);
            return ((7.5625f * f) * f) + 0.984375f;
        }
    }
}
