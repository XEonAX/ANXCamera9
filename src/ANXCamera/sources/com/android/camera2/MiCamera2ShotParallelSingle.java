package com.android.camera2;

import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraCaptureSession.CaptureCallback;
import android.hardware.camera2.CaptureRequest.Builder;
import android.media.Image;
import com.xiaomi.camera.core.ParallelTaskData;

public class MiCamera2ShotParallelSingle extends MiCamera2Shot<ParallelTaskData> {
    public MiCamera2ShotParallelSingle(MiCamera2 miCamera2) {
        super(miCamera2);
    }

    protected void prepare() {
    }

    protected void startShot() {
    }

    protected CaptureCallback generateCaptureCallback() {
        return null;
    }

    protected Builder generateRequestBuilder() throws CameraAccessException, IllegalStateException {
        return null;
    }

    protected void onImageReceived(Image image, int i) {
    }

    protected void notifyResultData(ParallelTaskData parallelTaskData) {
    }
}
