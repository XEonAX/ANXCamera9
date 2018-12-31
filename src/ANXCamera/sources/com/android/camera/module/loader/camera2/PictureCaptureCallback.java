package com.android.camera.module.loader.camera2;

import android.annotation.TargetApi;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CameraCaptureSession.CaptureCallback;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.CaptureResult;
import android.hardware.camera2.TotalCaptureResult;
import android.support.annotation.NonNull;

@TargetApi(21)
public abstract class PictureCaptureCallback extends CaptureCallback {
    static final int STATE_CAPTURING = 5;
    static final int STATE_LOCKED = 2;
    static final int STATE_LOCKING = 1;
    static final int STATE_PRECAPTURE = 3;
    static final int STATE_PREVIEW = 0;
    static final int STATE_WAITING = 4;
    private int mState;

    public abstract void onPrecaptureRequired();

    public abstract void onReady();

    PictureCaptureCallback() {
    }

    void setState(int i) {
        this.mState = i;
    }

    public void onCaptureProgressed(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, @NonNull CaptureResult captureResult) {
        process(captureResult);
    }

    public void onCaptureCompleted(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, @NonNull TotalCaptureResult totalCaptureResult) {
        process(totalCaptureResult);
    }

    private void process(@NonNull CaptureResult captureResult) {
        int i = this.mState;
        Integer num;
        if (i != 1) {
            switch (i) {
                case 3:
                    num = (Integer) captureResult.get(CaptureResult.CONTROL_AE_STATE);
                    if (num == null || num.intValue() == 5 || num.intValue() == 4 || num.intValue() == 2) {
                        setState(4);
                        return;
                    }
                    return;
                case 4:
                    num = (Integer) captureResult.get(CaptureResult.CONTROL_AE_STATE);
                    if (num == null || num.intValue() != 5) {
                        setState(5);
                        onReady();
                        return;
                    }
                    return;
                default:
                    return;
            }
        }
        Integer num2 = (Integer) captureResult.get(CaptureResult.CONTROL_AF_STATE);
        if (num2 != null) {
            if (num2.intValue() == 4 || num2.intValue() == 5) {
                num = (Integer) captureResult.get(CaptureResult.CONTROL_AE_STATE);
                if (num == null || num.intValue() == 2) {
                    setState(5);
                    onReady();
                    return;
                }
                setState(2);
                onPrecaptureRequired();
            }
        }
    }
}
