package com.android.camera2;

import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraCaptureSession.CaptureCallback;
import android.hardware.camera2.CaptureRequest.Builder;
import android.media.Image;
import android.os.Handler;
import com.android.camera.log.Log;
import com.android.camera2.Camera2Proxy.PictureCallback;
import com.xiaomi.camera.core.ParallelTaskData;

public abstract class MiCamera2Shot<T> {
    protected Handler mCameraHandler;
    protected boolean mDeparted;
    protected MiCamera2 mMiCamera;

    protected abstract CaptureCallback generateCaptureCallback();

    protected abstract Builder generateRequestBuilder() throws CameraAccessException, IllegalStateException;

    protected abstract void notifyResultData(T t);

    protected abstract void onImageReceived(Image image, int i);

    protected abstract void prepare();

    protected abstract void startSessionCapture();

    public MiCamera2Shot(MiCamera2 miCamera2) {
        this.mMiCamera = miCamera2;
        this.mCameraHandler = miCamera2.getCameraHandler();
    }

    protected final void startShot() {
        prepare();
        startSessionCapture();
    }

    protected final void makeClobber() {
        this.mDeparted = true;
    }

    protected final ParallelTaskData generateParallelTaskData(long j) {
        PictureCallback pictureCallback = this.mMiCamera.getPictureCallback();
        if (pictureCallback != null) {
            return pictureCallback.onCaptureStart(new ParallelTaskData(j, this.mMiCamera.getCameraConfigs().getShotType(), this.mMiCamera.getCameraConfigs().getShotPath()), this.mMiCamera.getPictureSize());
        }
        Log.e(getClass().getSimpleName(), "null callback is not allowed!");
        return null;
    }

    protected boolean isInQcfaMode() {
        return this.mMiCamera.getCapabilities().isSupportedQcfa() && (this.mMiCamera.getCapabilities().getOperatingMode() == 32775 || this.mMiCamera.getCapabilities().getOperatingMode() == CameraCapabilities.SESSION_OPERATION_MODE_PROFESSIONAL_ULTRA_PIXEL_PHOTOGRAPHY);
    }
}
