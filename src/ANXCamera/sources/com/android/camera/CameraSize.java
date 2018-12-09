package com.android.camera;

import android.support.annotation.NonNull;

public class CameraSize implements Comparable<CameraSize> {
    public int height;
    public int width;

    public float getRatio() {
        return ((float) this.width) / ((float) this.height);
    }

    public CameraSize(int i, int i2) {
        this.width = i;
        this.height = i2;
    }

    public CameraSize parseSize(CameraSize cameraSize) {
        this.width = cameraSize.width;
        this.height = cameraSize.height;
        return this;
    }

    public int getWidth() {
        return this.width;
    }

    public int getHeight() {
        return this.height;
    }

    public boolean equals(Object obj) {
        boolean z = false;
        if (obj == null) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof CameraSize)) {
            return false;
        }
        CameraSize cameraSize = (CameraSize) obj;
        if (this.width == cameraSize.width && this.height == cameraSize.height) {
            z = true;
        }
        return z;
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(this.width);
        stringBuilder.append("x");
        stringBuilder.append(this.height);
        return stringBuilder.toString();
    }

    public int hashCode() {
        return this.height ^ ((this.width << 16) | (this.width >>> 16));
    }

    public int compareTo(@NonNull CameraSize cameraSize) {
        return (this.width * this.height) - (cameraSize.width * cameraSize.height);
    }

    public boolean isEmpty() {
        return this.width * this.height <= 0;
    }

    public int area() {
        return isEmpty() ? 0 : this.width * this.height;
    }
}
