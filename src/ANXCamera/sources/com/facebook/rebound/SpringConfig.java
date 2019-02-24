package com.facebook.rebound;

public class SpringConfig {
    public static SpringConfig defaultConfig = fromOrigamiTensionAndFriction(40.0d, 7.0d);
    public double friction;
    public double tension;

    public SpringConfig(double d, double d2) {
        this.tension = d;
        this.friction = d2;
    }

    public static SpringConfig fromOrigamiTensionAndFriction(double d, double d2) {
        return new SpringConfig(OrigamiValueConverter.tensionFromOrigamiValue(d), OrigamiValueConverter.frictionFromOrigamiValue(d2));
    }

    public static SpringConfig fromBouncinessAndSpeed(double d, double d2) {
        BouncyConversion bouncyConversion = new BouncyConversion(d2, d);
        return fromOrigamiTensionAndFriction(bouncyConversion.getBouncyTension(), bouncyConversion.getBouncyFriction());
    }
}
