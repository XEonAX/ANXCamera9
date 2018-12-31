package com.android.camera.panorama;

public class Camera1Image extends CaptureImage {
    private final int mHeight;
    private final int mWidth;

    public Camera1Image(byte[] bArr, int i, int i2) {
        super(bArr);
        this.mWidth = i;
        this.mHeight = i2;
    }

    public String getImageFormat() {
        return PanoramaGP3ImageFormat.YVU420_SEMIPLANAR;
    }

    public int getWidth() {
        return this.mWidth;
    }

    public int getHeight() {
        return this.mHeight;
    }
}
