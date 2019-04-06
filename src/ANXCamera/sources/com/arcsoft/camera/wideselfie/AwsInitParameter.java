package com.arcsoft.camera.wideselfie;

public class AwsInitParameter {
    private int a;
    private int b;
    private int c;
    public float cameraViewAngleForHeight;
    public float cameraViewAngleForWidth;
    public int changeDirectionThumbThreshold;
    public boolean convertNV21;
    private int d;
    private int e;
    private int f;
    public int guideStableBarThumbHeight;
    public int guideStopBarThumbHeight;
    public int maxResultWidth;
    public int mode;
    public int progressBarThumbHeight;
    public float progressBarThumbHeightCropRatio;
    public float resultAngleForHeight;
    public float resultAngleForWidth;
    public int thumbnailHeight;
    public int thumbnailWidth;

    private AwsInitParameter() {
    }

    public static AwsInitParameter getDefaultInitParams(int i, int i2, int i3, int i4) {
        AwsInitParameter awsInitParameter = new AwsInitParameter();
        awsInitParameter.a = 0;
        awsInitParameter.mode = 64;
        awsInitParameter.cameraViewAngleForHeight = 42.9829f;
        awsInitParameter.cameraViewAngleForWidth = 55.3014f;
        awsInitParameter.resultAngleForWidth = 180.0f;
        awsInitParameter.resultAngleForHeight = 180.0f;
        awsInitParameter.changeDirectionThumbThreshold = 120;
        awsInitParameter.b = i3;
        awsInitParameter.c = i;
        awsInitParameter.d = i2;
        awsInitParameter.e = awsInitParameter.b;
        awsInitParameter.thumbnailWidth = awsInitParameter.c;
        awsInitParameter.thumbnailHeight = awsInitParameter.d;
        awsInitParameter.f = i4;
        if (i4 == 90 || i4 == 270) {
            awsInitParameter.maxResultWidth = 0;
            awsInitParameter.progressBarThumbHeight = i / 10;
            awsInitParameter.guideStopBarThumbHeight = (int) (((double) i) * 0.303d);
        } else {
            awsInitParameter.maxResultWidth = 0;
            awsInitParameter.progressBarThumbHeight = i2 / 8;
            awsInitParameter.guideStopBarThumbHeight = awsInitParameter.progressBarThumbHeight / 2;
        }
        awsInitParameter.guideStableBarThumbHeight = 5;
        awsInitParameter.progressBarThumbHeightCropRatio = 0.0f;
        awsInitParameter.convertNV21 = false;
        return awsInitParameter;
    }

    public int getBufferSize() {
        return this.a;
    }

    public int getDeviceOrientation() {
        return this.f;
    }

    public int getFullImageHeight() {
        return this.d;
    }

    public int getFullImageWidth() {
        return this.c;
    }

    public int getSrcFormat() {
        return this.b;
    }

    public int getThumbForamt() {
        return this.e;
    }

    public int getThumbnailHeight() {
        return this.thumbnailHeight;
    }

    public int getThumbnailWidth() {
        return this.thumbnailWidth;
    }
}
