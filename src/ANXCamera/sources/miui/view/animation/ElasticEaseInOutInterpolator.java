package miui.view.animation;

import android.view.animation.Interpolator;

public class ElasticEaseInOutInterpolator implements Interpolator {
    private final float NT;
    private final float NV;

    public ElasticEaseInOutInterpolator() {
        this(0.0f, 0.0f);
    }

    public ElasticEaseInOutInterpolator(float f, float f2) {
        this.NT = f;
        this.NV = f2;
    }

    public float getInterpolation(float f) {
        float f2 = this.NV;
        float f3 = this.NT;
        if (f == 0.0f) {
            return 0.0f;
        }
        f /= 0.5f;
        if (f == 2.0f) {
            return 1.0f;
        }
        float f4;
        if (f2 == 0.0f) {
            f2 = 0.45000002f;
        }
        if (f3 == 0.0f || f3 < 1.0f) {
            f4 = f2 / 4.0f;
            f3 = 1.0f;
        } else {
            f4 = (float) ((((double) f2) / 6.283185307179586d) * Math.asin((double) (1.0f / f3)));
        }
        if (f < 1.0f) {
            f -= 1.0f;
            return -0.5f * ((float) ((((double) f3) * Math.pow(2.0d, (double) (10.0f * f))) * Math.sin((((double) (f - f4)) * 6.283185307179586d) / ((double) f2))));
        }
        f -= 1.0f;
        return (float) ((((((double) f3) * Math.pow(2.0d, (double) (-10.0f * f))) * Math.sin((((double) (f - f4)) * 6.283185307179586d) / ((double) f2))) * 0.5d) + 1.0d);
    }
}
