package com.android.camera2;

import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CameraCaptureSession.CaptureCallback;
import android.hardware.camera2.CaptureFailure;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.CaptureRequest.Builder;
import android.media.Image;
import android.support.annotation.NonNull;
import com.android.camera.Util;
import com.android.camera.log.Log;
import com.android.camera2.Camera2Proxy.PictureCallback;
import java.util.Locale;

public class MiCamera2ShotBurst extends MiCamera2Shot<byte[]> {
    private int mBurstNum;

    public MiCamera2ShotBurst(MiCamera2 miCamera2, int i) {
        super(miCamera2);
        this.mBurstNum = i;
    }

    protected void prepare() {
        this.mMiCamera.setAWBLock(true);
    }

    protected void startShot() {
        Log.d(TAG, "captureBurstPictures");
        this.mMiCamera.pausePreview();
        try {
            this.mMiCamera.getCaptureSession().setRepeatingRequest(generateRequestBuilder().build(), generateCaptureCallback(), this.mCameraHandler);
        } catch (CameraAccessException e) {
            e.printStackTrace();
            this.mMiCamera.notifyOnError(e.getReason());
        } catch (Throwable e2) {
            Log.e(TAG, "Failed to capture burst, IllegalState", e2);
            this.mMiCamera.notifyOnError(256);
        }
    }

    protected CaptureCallback generateCaptureCallback() {
        return new CaptureCallback() {
            public void onCaptureFailed(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, @NonNull CaptureFailure captureFailure) {
                super.onCaptureFailed(cameraCaptureSession, captureRequest, captureFailure);
                Log.e(MiCamera2Shot.TAG, String.format(Locale.ENGLISH, "captureBurst onCaptureFailed %d", new Object[]{Integer.valueOf(captureFailure.getReason())}));
            }

            public void onCaptureSequenceCompleted(@NonNull CameraCaptureSession cameraCaptureSession, int i, long j) {
                Log.e(MiCamera2Shot.TAG, "captureBurst onCaptureSequenceCompleted");
                MiCamera2ShotBurst.this.mMiCamera.setAWBLock(false);
                MiCamera2ShotBurst.this.mMiCamera.resumePreview();
                PictureCallback pictureCallback = MiCamera2ShotBurst.this.mMiCamera.getPictureCallback();
                if (pictureCallback != null) {
                    pictureCallback.onPictureTakenFinished(true);
                }
            }

            public void onCaptureSequenceAborted(@NonNull CameraCaptureSession cameraCaptureSession, int i) {
                super.onCaptureSequenceAborted(cameraCaptureSession, i);
                Log.e(MiCamera2Shot.TAG, "captureBurst onCaptureSequenceAborted");
                MiCamera2ShotBurst.this.mMiCamera.setAWBLock(false);
                MiCamera2ShotBurst.this.mMiCamera.resumePreview();
                PictureCallback pictureCallback = MiCamera2ShotBurst.this.mMiCamera.getPictureCallback();
                if (pictureCallback != null) {
                    pictureCallback.onPictureTakenFinished(false);
                }
            }
        };
    }

    protected Builder generateRequestBuilder() throws CameraAccessException, IllegalStateException {
        Builder createCaptureRequest = this.mMiCamera.getCameraDevice().createCaptureRequest(2);
        createCaptureRequest.set(CaptureRequest.CONTROL_CAPTURE_INTENT, Integer.valueOf(2));
        createCaptureRequest.addTarget(this.mMiCamera.getPhotoImageReader().getSurface());
        createCaptureRequest.addTarget(this.mMiCamera.getPreviewSurface());
        this.mMiCamera.applySettingsForCapture(createCaptureRequest, 4);
        return createCaptureRequest;
    }

    protected void onImageReceived(Image image, int i) {
        PictureCallback pictureCallback = this.mMiCamera.getPictureCallback();
        if (pictureCallback == null) {
            image.close();
        } else if (!pictureCallback.onPictureTakenImageConsumed(image)) {
            byte[] firstPlane = Util.getFirstPlane(image);
            image.close();
            notifyResultData(firstPlane);
        }
    }

    protected void notifyResultData(byte[] bArr) {
        this.mMiCamera.getPictureCallback().onPictureTaken(bArr);
    }
}
