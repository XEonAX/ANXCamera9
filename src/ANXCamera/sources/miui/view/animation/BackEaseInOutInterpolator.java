package miui.view.animation;

import android.view.animation.Interpolator;

public class BackEaseInOutInterpolator implements Interpolator {
    private final float Od;

    public BackEaseInOutInterpolator() {
        this(0.0f);
    }

    public BackEaseInOutInterpolator(float f) {
        this.Od = f;
    }

    public float getInterpolation(float f) {
        float f2 = this.Od == 0.0f ? 1.70158f : this.Od;
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
