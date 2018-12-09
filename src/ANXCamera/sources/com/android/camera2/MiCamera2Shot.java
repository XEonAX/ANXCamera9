package com.android.camera2;

import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraCaptureSession.CaptureCallback;
import android.hardware.camera2.CaptureRequest.Builder;
import android.media.Image;
import android.os.Handler;
import com.android.camera2.Camera2Proxy.PictureCallback;
import com.xiaomi.camera.core.ParallelTaskData;

public abstract class MiCamera2Shot<T> {
    protected static final String TAG = MiCamera2Shot.class.getSimpleName();
    protected Handler mCameraHandler;
    protected boolean mDeparted;
    protected MiCamera2 mMiCamera;

    protected abstract CaptureCallback generateCaptureCallback();

    protected abstract Builder generateRequestBuilder() throws CameraAccessException, IllegalStateException;

    protected abstract void notifyResultData(T t);

    protected abstract void onImageReceived(Image image, int i);

    protected abstract void prepare();

    protected abstract void startShot();

    public MiCamera2Shot(MiCamera2 miCamera2) {
        this.mMiCamera = miCamera2;
        this.mCameraHandler = miCamera2.getCameraHandler();
        prepare();
    }

    protected final void makeClobber() {
        this.mDeparted = true;
    }

    protected final ParallelTaskData generateParallelTaskData(long j) {
        PictureCallback pictureCallback = this.mMiCamera.getPictureCallback();
        if (pictureCallback == null) {
            return null;
        }
        return pictureCallback.onCaptureStart(j, this.mMiCamera.getCameraConfigs().getShotType(), this.mMiCamera.getCameraConfigs().getShotPath());
    }

    protected boolean isInQcfaMode() {
        return this.mMiCamera.getCapabilities().isSupportedQcfa() && this.mMiCamera.getCapabilities().getOperatingMode() == 32775;
    }
}
