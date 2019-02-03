package miui.view.animation;

import android.view.animation.Interpolator;

public class BackEaseInInterpolator implements Interpolator {
    private final float Od;

    public BackEaseInInterpolator() {
        this(0.0f);
    }

    public BackEaseInInterpolator(float f) {
        this.Od = f;
    }

    public float getInterpolation(float f) {
        float f2 = this.Od == 0.0f ? 1.70158f : this.Od;
        return (f * f) * (((1.0f + f2) * f) - f2);
    }
}
