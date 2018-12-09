package com.android.camera2;

import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CameraCaptureSession.CaptureCallback;
import android.hardware.camera2.CaptureFailure;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.CaptureRequest.Builder;
import android.hardware.camera2.TotalCaptureResult;
import android.media.Image;
import android.media.ImageReader;
import android.support.annotation.NonNull;
import com.android.camera.CameraSettings;
import com.android.camera.Util;
import com.android.camera.log.Log;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.android.camera2.Camera2Proxy.PictureCallback;
import com.ss.android.ttve.common.TEDefine;
import com.xiaomi.camera.base.PerformanceTracker;
import com.xiaomi.camera.core.ParallelCallback;
import com.xiaomi.camera.core.ParallelTaskData;

public class MiCamera2ShotNormal extends MiCamera2Shot<ParallelTaskData> {
    private ParallelTaskData mCurrentParallelTaskData;
    private boolean mFastShutter;
    private boolean mHasDepth;
    private boolean mIsIntent;

    public MiCamera2ShotNormal(MiCamera2 miCamera2) {
        super(miCamera2);
    }

    protected void prepare() {
        this.mHasDepth = CameraSettings.needDepth();
        int shotType = this.mMiCamera.getCameraConfigs().getShotType();
        if (shotType != -2) {
            if (shotType != 2) {
            }
        } else {
            this.mIsIntent = true;
        }
    }

    protected void startShot() {
        try {
            CaptureCallback generateCaptureCallback = generateCaptureCallback();
            Builder generateRequestBuilder = generateRequestBuilder();
            PerformanceTracker.trackPictureCapture(0);
            this.mMiCamera.getCaptureSession().capture(generateRequestBuilder.build(), generateCaptureCallback, this.mCameraHandler);
        } catch (CameraAccessException e) {
            e.printStackTrace();
            Log.e(TAG, "Cannot capture a still picture");
            this.mMiCamera.notifyOnError(e.getReason());
        } catch (Throwable e2) {
            Log.e(TAG, "Failed to capture a still picture, IllegalState", e2);
            this.mMiCamera.notifyOnError(256);
        }
    }

    protected CaptureCallback generateCaptureCallback() {
        return new CaptureCallback() {
            public void onCaptureStarted(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, long j, long j2) {
                super.onCaptureStarted(cameraCaptureSession, captureRequest, j, j2);
                if (MiCamera2ShotNormal.this.mCurrentParallelTaskData == null) {
                    MiCamera2ShotNormal.this.mCurrentParallelTaskData = MiCamera2ShotNormal.this.generateParallelTaskData(j);
                }
            }

            public void onCaptureCompleted(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, @NonNull TotalCaptureResult totalCaptureResult) {
                String str = MiCamera2Shot.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onCaptureCompleted: ");
                stringBuilder.append(totalCaptureResult.getFrameNumber());
                Log.d(str, stringBuilder.toString());
                MiCamera2ShotNormal.this.mMiCamera.onCapturePictureFinished(true);
            }

            public void onCaptureFailed(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, @NonNull CaptureFailure captureFailure) {
                super.onCaptureFailed(cameraCaptureSession, captureRequest, captureFailure);
                String str = MiCamera2Shot.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("Capture a still picture failed ");
                stringBuilder.append(String.valueOf(captureFailure.getReason()));
                Log.e(str, stringBuilder.toString());
                MiCamera2ShotNormal.this.mMiCamera.onCapturePictureFinished(false);
            }
        };
    }

    protected Builder generateRequestBuilder() throws CameraAccessException, IllegalStateException {
        Builder createCaptureRequest = this.mMiCamera.getCameraDevice().createCaptureRequest(2);
        ImageReader photoImageReader = this.mMiCamera.getPhotoImageReader();
        createCaptureRequest.addTarget(photoImageReader.getSurface());
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("captureStillPicture: size=");
        stringBuilder.append(photoImageReader.getWidth());
        stringBuilder.append("x");
        stringBuilder.append(photoImageReader.getHeight());
        Log.d(str, stringBuilder.toString());
        if (!isInQcfaMode() || Camera2DataContainer.getInstance().getBokehFrontCameraId() == this.mMiCamera.getId()) {
            createCaptureRequest.addTarget(this.mMiCamera.getPreviewSurface());
        }
        if (this.mHasDepth) {
            createCaptureRequest.addTarget(this.mMiCamera.getDepthImageReader().getSurface());
            createCaptureRequest.addTarget(this.mMiCamera.getPortraitRawImageReader().getSurface());
        }
        createCaptureRequest.set(CaptureRequest.CONTROL_AF_MODE, (Integer) this.mMiCamera.getPreviewRequestBuilder().get(CaptureRequest.CONTROL_AF_MODE));
        this.mMiCamera.applySettingsForCapture(createCaptureRequest, 3);
        PerformanceTracker.trackPictureCapture(0);
        return createCaptureRequest;
    }

    protected void onImageReceived(Image image, int i) {
        if (this.mCurrentParallelTaskData == null) {
            this.mCurrentParallelTaskData = generateParallelTaskData(image.getTimestamp());
        }
        PictureCallback pictureCallback = this.mMiCamera.getPictureCallback();
        if (pictureCallback == null || this.mCurrentParallelTaskData == null) {
            image.close();
            return;
        }
        byte[] firstPlane = Util.getFirstPlane(image);
        image.close();
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("JpegPictureCallback#onPictureTaken data ");
        stringBuilder.append(firstPlane == null ? TEDefine.FACE_BEAUTY_NULL : Integer.valueOf(firstPlane.length));
        Log.d(str, stringBuilder.toString());
        this.mCurrentParallelTaskData.fillJpegData(firstPlane, i);
        if (this.mCurrentParallelTaskData.isJpegDataReady()) {
            if (this.mIsIntent) {
                notifyResultData(this.mCurrentParallelTaskData);
                pictureCallback.onPictureTakenFinished(true);
            } else {
                pictureCallback.onPictureTakenFinished(true);
                notifyResultData(this.mCurrentParallelTaskData);
            }
        }
    }

    protected void notifyResultData(ParallelTaskData parallelTaskData) {
        long currentTimeMillis = System.currentTimeMillis();
        ParallelCallback parallelCallback = this.mMiCamera.getParallelCallback();
        if (parallelCallback != null) {
            parallelCallback.onParallelProcessFinish(this.mCurrentParallelTaskData);
            long currentTimeMillis2 = System.currentTimeMillis() - currentTimeMillis;
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("mJpegCallbackFinishTime = ");
            stringBuilder.append(currentTimeMillis2);
            stringBuilder.append("ms");
            Log.d(str, stringBuilder.toString());
        }
    }
}
