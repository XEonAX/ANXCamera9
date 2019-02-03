package com.xiaomi.engine;

import android.media.Image;
import android.os.Parcelable;
import android.util.Log;

public class FrameData {
    private static final String TAG = FrameData.class.getSimpleName();
    private Image mBufferImage;
    private Parcelable mCaptureResultMetadataNative;
    private long mFrameNumber;
    private FrameStatusCallback mFrameStatusCallback;
    private int mImageFlag;
    private int mSequenceId;

    public interface FrameStatusCallback {
        void onFrameImageClosed(Image image);
    }

    public FrameData(int i, int i2, long j, Parcelable parcelable, Image image) {
        this.mImageFlag = i;
        this.mSequenceId = i2;
        this.mFrameNumber = j;
        this.mCaptureResultMetadataNative = parcelable;
        this.mBufferImage = image;
    }

    public void release() {
        if (this.mBufferImage != null) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("release: close Image: ");
            stringBuilder.append(this.mBufferImage);
            Log.d(str, stringBuilder.toString());
            this.mBufferImage.close();
            if (this.mFrameStatusCallback != null) {
                this.mFrameStatusCallback.onFrameImageClosed(this.mBufferImage);
            }
        }
    }

    public int getImageFlag() {
        return this.mImageFlag;
    }

    public void setImageFlag(int i) {
        this.mImageFlag = i;
    }

    public long getFrameNumber() {
        return this.mFrameNumber;
    }

    public void setFrameNumber(long j) {
        this.mFrameNumber = j;
    }

    public int getSequenceId() {
        return this.mSequenceId;
    }

    public void setSequenceId(int i) {
        this.mSequenceId = i;
    }

    public Parcelable getCaptureResultMetaDataNative() {
        return this.mCaptureResultMetadataNative;
    }

    public void setCaptureResultMetaDataNative(Parcelable parcelable) {
        this.mCaptureResultMetadataNative = parcelable;
    }

    public Image getBufferImage() {
        return this.mBufferImage;
    }

    public void setBufferImage(Image image) {
        this.mBufferImage = image;
    }

    public FrameStatusCallback getFrameCallback() {
        return this.mFrameStatusCallback;
    }

    public void setFrameCallback(FrameStatusCallback frameStatusCallback) {
        this.mFrameStatusCallback = frameStatusCallback;
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("FrameData{ mImageFlag=");
        stringBuilder.append(this.mImageFlag);
        stringBuilder.append(", mFrameNumber=");
        stringBuilder.append(this.mFrameNumber);
        stringBuilder.append(", mCaptureResultMetadataNative=");
        stringBuilder.append(this.mCaptureResultMetadataNative);
        stringBuilder.append(", mBufferImage=");
        stringBuilder.append(this.mBufferImage);
        stringBuilder.append('}');
        return stringBuilder.toString();
    }
}
