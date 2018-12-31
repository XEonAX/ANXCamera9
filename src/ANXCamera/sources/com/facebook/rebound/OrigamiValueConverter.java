package com.facebook.rebound;

public class OrigamiValueConverter {
    public static double tensionFromOrigamiValue(double d) {
        return d == 0.0d ? 0.0d : 194.0d + ((d - 30.0d) * 3.62d);
    }

    public static double origamiValueFromTension(double d) {
        return d == 0.0d ? 0.0d : 30.0d + ((d - 194.0d) / 3.62d);
    }

    public static double frictionFromOrigamiValue(double d) {
        return d == 0.0d ? 0.0d : 25.0d + ((d - 8.0d) * 3.0d);
    }

    public static double origamiValueFromFriction(double d) {
        return d == 0.0d ? 0.0d : 8.0d + ((d - 25.0d) / 3.0d);
    }
}
