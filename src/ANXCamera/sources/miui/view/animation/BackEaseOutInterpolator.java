package miui.view.animation;

import android.view.animation.Interpolator;

public class BackEaseOutInterpolator implements Interpolator {
    private final float Od;

    public BackEaseOutInterpolator() {
        this(0.0f);
    }

    public BackEaseOutInterpolator(float f) {
        this.Od = f;
    }

    public float getInterpolation(float f) {
        float f2 = this.Od == 0.0f ? 1.70158f : this.Od;
        f -= 1.0f;
        return ((f * f) * (((f2 + 1.0f) * f) + f2)) + 1.0f;
    }
}
