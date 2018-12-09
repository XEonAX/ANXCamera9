package com.xiaomi.camera.imagecodec;

import android.support.annotation.NonNull;
import com.xiaomi.protocol.ICustomCaptureResult;

public class ReprocessData {
    private String mImageTag;
    private boolean mIsFrontCamera;
    private int mOutputHeight;
    private int mOutputWidth;
    private OnJpegAvailableListener mResultListener;
    private ICustomCaptureResult mTotalCaptureResult;
    private MiImage mYuvImage;

    public interface OnJpegAvailableListener {
        void onJpegAvailable(byte[] bArr, String str);
    }

    public ReprocessData(@NonNull MiImage miImage, @NonNull String str, @NonNull ICustomCaptureResult iCustomCaptureResult, boolean z, @NonNull OnJpegAvailableListener onJpegAvailableListener) {
        this(miImage, str, iCustomCaptureResult, z, miImage.getWidth(), miImage.getHeight(), onJpegAvailableListener);
    }

    public ReprocessData(@NonNull MiImage miImage, @NonNull String str, @NonNull ICustomCaptureResult iCustomCaptureResult, boolean z, int i, int i2, @NonNull OnJpegAvailableListener onJpegAvailableListener) {
        this.mYuvImage = miImage;
        this.mImageTag = str;
        this.mTotalCaptureResult = iCustomCaptureResult;
        this.mIsFrontCamera = z;
        if (i == 0) {
            i = miImage.getWidth();
        }
        this.mOutputWidth = i;
        if (i2 == 0) {
            i2 = miImage.getHeight();
        }
        this.mOutputHeight = i2;
        this.mResultListener = onJpegAvailableListener;
    }

    public MiImage getYuvImage() {
        return this.mYuvImage;
    }

    public ICustomCaptureResult getTotalCaptureResult() {
        return this.mTotalCaptureResult;
    }

    public OnJpegAvailableListener getResultListener() {
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
}
