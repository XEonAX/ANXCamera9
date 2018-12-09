package miui.view.animation;

import android.view.animation.Interpolator;

public class BackEaseOutInterpolator implements Interpolator {
    private final float NS;

    public BackEaseOutInterpolator() {
        this(0.0f);
    }

    public BackEaseOutInterpolator(float f) {
        this.NS = f;
    }

    public float getInterpolation(float f) {
        float f2 = this.NS == 0.0f ? 1.70158f : this.NS;
        f -= 1.0f;
        return ((f * f) * (((f2 + 1.0f) * f) + f2)) + 1.0f;
    }
}
