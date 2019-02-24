package com.xiaomi.camera.imagecodec;

import android.media.Image;
import android.support.annotation.NonNull;
import com.xiaomi.protocol.ICustomCaptureResult;

public class ReprocessData {
    private static final int DEFAULT_JPEG_QUALITY = 100;
    private String mImageTag;
    private boolean mIsFrontCamera;
    private boolean mIsPoolImage;
    private int mJpegQuality;
    private int mOutputFormat;
    private int mOutputHeight;
    private int mOutputWidth;
    private OnDataAvailableListener mResultListener;
    private ICustomCaptureResult mTotalCaptureResult;
    private Image mYuvImage;

    public interface OnDataAvailableListener {
        void onJpegAvailable(byte[] bArr, String str);

        void onYuvAvailable(Image image, String str);
    }

    public ReprocessData(@NonNull Image image, @NonNull String str, @NonNull ICustomCaptureResult iCustomCaptureResult, boolean z, @NonNull OnDataAvailableListener onDataAvailableListener) {
        this(image, str, iCustomCaptureResult, z, image.getWidth(), image.getHeight(), onDataAvailableListener);
    }

    public ReprocessData(@NonNull Image image, @NonNull String str, @NonNull ICustomCaptureResult iCustomCaptureResult, boolean z, int i, int i2, @NonNull OnDataAvailableListener onDataAvailableListener) {
        this(image, str, iCustomCaptureResult, z, i, i2, 256, onDataAvailableListener);
    }

    public ReprocessData(@NonNull Image image, @NonNull String str, @NonNull ICustomCaptureResult iCustomCaptureResult, boolean z, int i, int i2, int i3, @NonNull OnDataAvailableListener onDataAvailableListener) {
        this.mYuvImage = image;
        this.mImageTag = str;
        this.mTotalCaptureResult = iCustomCaptureResult;
        this.mIsFrontCamera = z;
        if (i == 0) {
            i = image.getWidth();
        }
        this.mOutputWidth = i;
        if (i2 == 0) {
            i2 = image.getHeight();
        }
        this.mOutputHeight = i2;
        this.mOutputFormat = i3;
        this.mResultListener = onDataAvailableListener;
        this.mJpegQuality = 100;
    }

    public Image getYuvImage() {
        return this.mYuvImage;
    }

    public void setYuvImage(Image image) {
        this.mYuvImage = image;
    }

    public ICustomCaptureResult getTotalCaptureResult() {
        return this.mTotalCaptureResult;
    }

    public OnDataAvailableListener getResultListener() {
        return this.mResultListener;
    }

    public String getImageTag() {
        return this.mImageTag;
    }

    public boolean isFrontCamera() {
        return this.mIsFrontCamera;
    }

    public int getOutputWidth() {
        return this.mOutputWidth;
    }

    public int getOutputHeight() {
        return this.mOutputHeight;
    }

    public int getOutputFormat() {
        return this.mOutputFormat;
    }

    public boolean isImageFromPool() {
        return this.mIsPoolImage;
    }

    public void setImageFromPool(boolean z) {
        this.mIsPoolImage = z;
    }

    public int getJpegQuality() {
        return this.mJpegQuality;
    }

    public void setJpegQuality(int i) {
        if (i < 1 || i > 100) {
            this.mJpegQuality = 100;
        } else {
            this.mJpegQuality = i;
        }
    }
}
