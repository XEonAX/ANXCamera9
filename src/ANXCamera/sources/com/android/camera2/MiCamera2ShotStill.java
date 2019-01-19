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
import com.android.camera.Util;
import com.android.camera.log.Log;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.android.camera2.Camera2Proxy.PictureCallback;
import com.ss.android.ttve.common.TEDefine;
import com.xiaomi.camera.base.PerformanceTracker;
import com.xiaomi.camera.core.ParallelCallback;
import com.xiaomi.camera.core.ParallelTaskData;

public class MiCamera2ShotStill extends MiCamera2Shot<ParallelTaskData> {
    private static final String TAG = MiCamera2ShotStill.class.getSimpleName();
    private ParallelTaskData mCurrentParallelTaskData;
    private boolean mHasDepth;
    private boolean mIsIntent;

    public MiCamera2ShotStill(MiCamera2 miCamera2) {
        super(miCamera2);
    }

    protected void prepare() {
        int shotType = this.mMiCamera.getCameraConfigs().getShotType();
        if (shotType != 2) {
            switch (shotType) {
                case -3:
                    this.mHasDepth = true;
                    this.mIsIntent = true;
                    return;
                case -2:
                    this.mIsIntent = true;
                    return;
                default:
                    return;
            }
        }
        this.mHasDepth = true;
    }

    protected void startSessionCapture() {
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
                if (MiCamera2ShotStill.this.mCurrentParallelTaskData == null) {
                    MiCamera2ShotStill.this.mCurrentParallelTaskData = MiCamera2ShotStill.this.generateParallelTaskData(j);
                }
            }

            public void onCaptureCompleted(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, @NonNull TotalCaptureResult totalCaptureResult) {
                String access$100 = MiCamera2ShotStill.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onCaptureCompleted: ");
                stringBuilder.append(totalCaptureResult.getFrameNumber());
                Log.d(access$100, stringBuilder.toString());
                MiCamera2ShotStill.this.mMiCamera.onCapturePictureFinished(true);
            }

            public void onCaptureFailed(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, @NonNull CaptureFailure captureFailure) {
                super.onCaptureFailed(cameraCaptureSession, captureRequest, captureFailure);
                String access$100 = MiCamera2ShotStill.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onCaptureFailed: reason=");
                stringBuilder.append(captureFailure.getReason());
                Log.e(access$100, stringBuilder.toString());
                MiCamera2ShotStill.this.mMiCamera.onCapturePictureFinished(false);
            }
        };
    }

    protected Builder generateRequestBuilder() throws CameraAccessException, IllegalStateException {
        Builder createCaptureRequest = this.mMiCamera.getCameraDevice().createCaptureRequest(2);
        ImageReader photoImageReader = this.mMiCamera.getPhotoImageReader();
        createCaptureRequest.addTarget(photoImageReader.getSurface());
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("size=");
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
        return createCaptureRequest;
    }

    protected void onImageReceived(Image image, int i) {
        if (this.mCurrentParallelTaskData == null) {
            Log.w(TAG, "onImageReceived: image arrived first");
            this.mCurrentParallelTaskData = generateParallelTaskData(image.getTimestamp());
        }
        PictureCallback pictureCallback = this.mMiCamera.getPictureCallback();
        if (pictureCallback == null || this.mCurrentParallelTaskData == null) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("onImageReceived: some wrong happened when image received: callback = ");
            stringBuilder.append(pictureCallback);
            stringBuilder.append(" mCurrentParallelTaskData = ");
            stringBuilder.append(this.mCurrentParallelTaskData);
            Log.w(str, stringBuilder.toString());
            image.close();
            return;
        }
        byte[] firstPlane = Util.getFirstPlane(image);
        String str2 = TAG;
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append("onImageReceived: dataLen=");
        stringBuilder2.append(firstPlane == null ? TEDefine.FACE_BEAUTY_NULL : Integer.valueOf(firstPlane.length));
        stringBuilder2.append(" timeStamp=");
        stringBuilder2.append(image.getTimestamp());
        stringBuilder2.append(" holder=");
        stringBuilder2.append(hashCode());
        Log.d(str2, stringBuilder2.toString());
        image.close();
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
        ParallelCallback parallelCallback = this.mMiCamera.getParallelCallback();
        if (parallelCallback != null) {
            long currentTimeMillis = System.currentTimeMillis();
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
