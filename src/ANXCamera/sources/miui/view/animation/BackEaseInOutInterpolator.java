package miui.view.animation;

import android.view.animation.Interpolator;

public class BackEaseInOutInterpolator implements Interpolator {
    private final float NS;

    public BackEaseInOutInterpolator() {
        this(0.0f);
    }

    public BackEaseInOutInterpolator(float f) {
        this.NS = f;
    }

    public float getInterpolation(float f) {
        float f2 = this.NS == 0.0f ? 1.70158f : this.NS;
        f *= 2.0f;
        if (f < 1.0f) {
            f2 = (float) (((double) f2) * 1.525d);
            return 0.5f * ((f * f) * (((1.0f + f2) * f) - f2));
        }
        f -= 2.0f;
        f2 = (float) (((double) f2) * 1.525d);
        return 0.5f * (((f * f) * (((1.0f + f2) * f) + f2)) + 2.0f);
    }
}
