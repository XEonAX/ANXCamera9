package com.android.camera2;

import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraCaptureSession.CaptureCallback;
import android.hardware.camera2.CaptureRequest.Builder;
import android.media.Image;
import android.os.Handler;
import com.android.camera.Thumbnail;
import com.android.camera.log.Log;
import com.android.camera2.Camera2Proxy.PictureCallback;
import com.xiaomi.camera.core.ParallelTaskData;

public abstract class MiCamera2Shot<T> {
    protected static final long DEFAULT_TASK_DATA_TIMESTAMP = 0;
    private static final int SHUTTER_FRAMENUM_CAPTUREING = 1;
    private static final int SHUTTER_FRAMENUM_NONE = 0;
    private static final int SHUTTER_FRAMENUM_SHUTTERED = 2;
    protected Handler mCameraHandler;
    protected boolean mDeparted;
    protected MiCamera2 mMiCamera;
    protected int mPreviewThumbnailHash = -1;
    private int mShutterFrameNum;

    protected abstract CaptureCallback generateCaptureCallback();

    protected abstract Builder generateRequestBuilder() throws CameraAccessException, IllegalStateException;

    protected abstract void notifyResultData(T t);

    protected abstract void onImageReceived(Image image, int i);

    protected abstract void prepare();

    protected abstract void startSessionCapture();

    public MiCamera2Shot(MiCamera2 miCamera2) {
        this.mMiCamera = miCamera2;
        this.mCameraHandler = miCamera2.getCameraHandler();
        this.mShutterFrameNum = 0;
    }

    protected final void startShot() {
        prepare();
        startSessionCapture();
        this.mShutterFrameNum = 1;
    }

    protected final void onPreviewThumbnailReceived(Thumbnail thumbnail) {
        this.mPreviewThumbnailHash = thumbnail.hashCode();
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

    public boolean onPreviewComing() {
        if (this.mShutterFrameNum == 0) {
            return false;
        }
        if (this.mShutterFrameNum >= 2) {
            return true;
        }
        this.mShutterFrameNum++;
        if (this.mShutterFrameNum != 2) {
            return false;
        }
        this.mShutterFrameNum = 2;
        PictureCallback pictureCallback = this.mMiCamera.getPictureCallback();
        if (pictureCallback != null) {
            pictureCallback.onCaptureShutter();
        }
        return true;
    }
}
