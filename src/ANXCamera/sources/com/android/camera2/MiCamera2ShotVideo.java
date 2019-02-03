package com.android.camera2;

import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CameraCaptureSession.CaptureCallback;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.CaptureRequest.Builder;
import android.hardware.camera2.TotalCaptureResult;
import android.media.Image;
import android.media.ImageReader;
import android.support.annotation.NonNull;
import com.android.camera.Util;
import com.android.camera.log.Log;
import com.android.camera2.Camera2Proxy.PictureCallback;

public class MiCamera2ShotVideo extends MiCamera2Shot<byte[]> {
    private static final String TAG = MiCamera2ShotVideo.class.getSimpleName();

    public MiCamera2ShotVideo(MiCamera2 miCamera2) {
        super(miCamera2);
    }

    protected void prepare() {
    }

    protected void startSessionCapture() {
        try {
            Builder generateRequestBuilder = generateRequestBuilder();
            this.mMiCamera.getCaptureSession().capture(generateRequestBuilder.build(), generateCaptureCallback(), this.mCameraHandler);
        } catch (CameraAccessException e) {
            e.printStackTrace();
            Log.e(TAG, "Cannot capture a video snapshot");
            this.mMiCamera.notifyOnError(e.getReason());
        } catch (Throwable e2) {
            Log.e(TAG, "Failed to capture a video snapshot, IllegalState", e2);
            this.mMiCamera.notifyOnError(256);
        }
    }

    protected CaptureCallback generateCaptureCallback() {
        return new CaptureCallback() {
            public void onCaptureCompleted(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, @NonNull TotalCaptureResult totalCaptureResult) {
                String access$000 = MiCamera2ShotVideo.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onCaptureCompleted: ");
                stringBuilder.append(totalCaptureResult.getFrameNumber());
                Log.d(access$000, stringBuilder.toString());
            }
        };
    }

    protected Builder generateRequestBuilder() throws CameraAccessException, IllegalStateException {
        Builder createCaptureRequest;
        if (2 == this.mMiCamera.getCapabilities().getSupportedHardwareLevel()) {
            createCaptureRequest = this.mMiCamera.getCameraDevice().createCaptureRequest(2);
        } else {
            createCaptureRequest = this.mMiCamera.getCameraDevice().createCaptureRequest(4);
        }
        ImageReader videoSnapshotImageReader = this.mMiCamera.getVideoSnapshotImageReader();
        createCaptureRequest.addTarget(videoSnapshotImageReader.getSurface());
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("size=");
        stringBuilder.append(videoSnapshotImageReader.getWidth());
        stringBuilder.append("x");
        stringBuilder.append(videoSnapshotImageReader.getHeight());
        Log.d(str, stringBuilder.toString());
        if (this.mMiCamera.getPreviewSurface() != null) {
            createCaptureRequest.addTarget(this.mMiCamera.getPreviewSurface());
        }
        if (this.mMiCamera.getRecordSurface() != null) {
            createCaptureRequest.addTarget(this.mMiCamera.getRecordSurface());
        }
        this.mMiCamera.applySettingsForVideoShot(createCaptureRequest, 3);
        return createCaptureRequest;
    }

    protected void onImageReceived(Image image, int i) {
        byte[] firstPlane = Util.getFirstPlane(image);
        image.close();
        notifyResultData(firstPlane);
    }

    protected void notifyResultData(byte[] bArr) {
        PictureCallback pictureCallback = this.mMiCamera.getPictureCallback();
        if (pictureCallback != null) {
            pictureCallback.onPictureTaken(bArr);
        }
    }
}
