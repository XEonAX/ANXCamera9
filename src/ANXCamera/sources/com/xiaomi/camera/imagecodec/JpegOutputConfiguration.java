package com.xiaomi.camera.imagecodec;

public class JpegOutputConfiguration {
    int mHeight;
    int mWidth;

    public JpegOutputConfiguration(int i, int i2) {
        this.mWidth = i;
        this.mHeight = i2;
    }

    public int getWidth() {
        return this.mWidth;
    }

    public int getHeight() {
        return this.mHeight;
    }

    public boolean equals(Object obj) {
        boolean z = true;
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof JpegOutputConfiguration)) {
            return false;
        }
        JpegOutputConfiguration jpegOutputConfiguration = (JpegOutputConfiguration) obj;
        if (!(this.mWidth == jpegOutputConfiguration.mWidth && this.mHeight == jpegOutputConfiguration.mHeight)) {
            z = false;
        }
        return z;
    }
}
