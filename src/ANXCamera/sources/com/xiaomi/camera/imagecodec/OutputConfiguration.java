package com.xiaomi.camera.imagecodec;

public class OutputConfiguration {
    int mFormat;
    int mHeight;
    int mWidth;

    public OutputConfiguration(int i, int i2, int i3) {
        this.mWidth = i;
        this.mHeight = i2;
        this.mFormat = i3;
    }

    public int getWidth() {
        return this.mWidth;
    }

    public int getHeight() {
        return this.mHeight;
    }

    public int getFormat() {
        return this.mFormat;
    }

    public boolean equals(Object obj) {
        boolean z = true;
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof OutputConfiguration)) {
            return false;
        }
        OutputConfiguration outputConfiguration = (OutputConfiguration) obj;
        if (!(this.mWidth == outputConfiguration.mWidth && this.mHeight == outputConfiguration.mHeight)) {
            z = false;
        }
        return z;
    }
}
