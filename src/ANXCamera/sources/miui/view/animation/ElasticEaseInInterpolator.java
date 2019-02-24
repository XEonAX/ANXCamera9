package miui.view.animation;

import android.view.animation.Interpolator;

public class ElasticEaseInInterpolator implements Interpolator {
    private final float Oe;
    private final float Of;

    public ElasticEaseInInterpolator() {
        this(0.0f, 0.0f);
    }

    public ElasticEaseInInterpolator(float f, float f2) {
        this.Oe = f;
        this.Of = f2;
    }

    public float getInterpolation(float f) {
        float f2 = this.Of;
        float f3 = this.Oe;
        if (f == 0.0f) {
            return 0.0f;
        }
        if (f == 1.0f) {
            return 1.0f;
        }
        float f4;
        if (f2 == 0.0f) {
            f2 = 0.3f;
        }
        if (f3 == 0.0f || f3 < 1.0f) {
            f4 = f2 / 4.0f;
            f3 = 1.0f;
        } else {
            f4 = (float) ((((double) f2) / 6.283185307179586d) * Math.asin((double) (1.0f / f3)));
        }
        f -= 1.0f;
        return -((float) ((((double) f3) * Math.pow(2.0d, (double) (10.0f * f))) * Math.sin((((double) (f - f4)) * 6.283185307179586d) / ((double) f2))));
    }
}
