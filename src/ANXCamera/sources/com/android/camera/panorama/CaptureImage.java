package com.android.camera.panorama;

import android.media.Image;

public abstract class CaptureImage {
    private long mExposureTime;
    protected Image mImage;
    private long mImageTimeStamp;
    private byte[] mRaw;
    private long mRollingShutterSkew;
    private int mSensitivity;
    private long mSensorTimeStamp;

    public abstract int getHeight();

    public abstract String getImageFormat();

    public abstract int getWidth();

    public Image image() {
        return this.mImage;
    }

    public byte[] raw() {
        return (byte[]) this.mRaw.clone();
    }

    public CaptureImage(Image image) {
        this.mImage = image;
        this.mRaw = new byte[0];
        this.mImageTimeStamp = image != null ? image.getTimestamp() : System.nanoTime();
        setSensitivity(0);
        setExposureTime(0);
        setRollingShutterSkew(0);
        setSensorTimeStamp(0);
    }

    CaptureImage(byte[] bArr) {
        if (bArr != null) {
            this.mRaw = (byte[]) bArr.clone();
        }
        this.mImage = null;
        this.mImageTimeStamp = System.nanoTime();
        setSensitivity(0);
        setExposureTime(0);
        setRollingShutterSkew(0);
        setSensorTimeStamp(0);
    }

    public void close() {
        if (this.mImage != null) {
            this.mImage.close();
            this.mImage = null;
        }
        this.mRaw = new byte[0];
    }

    public long getTimestamp() {
        return this.mImageTimeStamp;
    }

    public void setSensitivity(int i) {
        this.mSensitivity = i;
    }

    public int getSensitivity() {
        return this.mSensitivity;
    }

    public void setExposureTime(long j) {
        this.mExposureTime = j;
    }

    public long getExposureTime() {
        return this.mExposureTime;
    }

    public void setRollingShutterSkew(long j) {
        this.mRollingShutterSkew = j;
    }

    public long getRollingShutterSkew() {
        return this.mRollingShutterSkew;
    }

    public void setSensorTimeStamp(long j) {
        this.mSensorTimeStamp = j;
    }

    public long getSensorTimeStamp() {
        return this.mSensorTimeStamp;
    }
}
