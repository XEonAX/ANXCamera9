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
    private int mStreamIndex;

    public interface FrameStatusCallback {
        void onFrameImageClosed(Image image);
    }

    public FrameData(int i, long j, Parcelable parcelable, Image image) {
        this.mStreamIndex = i;
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

    public int getStreamIndex() {
        return this.mStreamIndex;
    }

    public void setStreamIndex(int i) {
        this.mStreamIndex = i;
    }

    public long getFrameNumber() {
        return this.mFrameNumber;
    }

    public void setFrameNumber(long j) {
        this.mFrameNumber = j;
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
        stringBuilder.append("FrameData{ mStreamIndex=");
        stringBuilder.append(this.mStreamIndex);
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
