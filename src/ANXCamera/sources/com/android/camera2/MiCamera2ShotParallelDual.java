package com.android.camera2;

import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CameraCaptureSession.CaptureCallback;
import android.hardware.camera2.CaptureFailure;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.CaptureRequest.Builder;
import android.hardware.camera2.CaptureResult;
import android.hardware.camera2.TotalCaptureResult;
import android.media.Image;
import android.support.annotation.NonNull;
import android.view.Surface;
import com.android.camera.log.Log;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.android.camera.parallel.AlgoConnector;
import com.android.camera2.Camera2Proxy.PictureCallback;
import com.xiaomi.camera.base.CameraDeviceUtil;
import com.xiaomi.camera.base.PerformanceTracker;
import com.xiaomi.camera.core.ParallelTaskData;
import com.xiaomi.protocol.ICustomCaptureResult;
import java.util.ArrayList;
import java.util.List;

public class MiCamera2ShotParallelDual extends MiCamera2Shot<ParallelTaskData> {
    private CaptureResult mStillCaptureResult;

    public MiCamera2ShotParallelDual(MiCamera2 miCamera2) {
        super(miCamera2);
    }

    protected void prepare() {
    }

    protected void startShot() {
        PerformanceTracker.trackPictureCapture(0);
        try {
            this.mMiCamera.getCaptureSession().capture(generateRequestBuilder().build(), generateCaptureCallback(), this.mCameraHandler);
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
                PictureCallback pictureCallback = MiCamera2ShotParallelDual.this.mMiCamera.getPictureCallback();
                if (pictureCallback != null) {
                    pictureCallback.onCaptureStart(j, MiCamera2ShotParallelDual.this.mMiCamera.getCameraConfigs().getShotType(), MiCamera2ShotParallelDual.this.mMiCamera.getCameraConfigs().getShotPath());
                }
            }

            public void onCaptureCompleted(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, @NonNull TotalCaptureResult totalCaptureResult) {
                String str = MiCamera2Shot.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onCaptureCompleted: ");
                stringBuilder.append(totalCaptureResult.getFrameNumber());
                Log.d(str, stringBuilder.toString());
                MiCamera2ShotParallelDual.this.mMiCamera.onCapturePictureFinished(true);
                MiCamera2ShotParallelDual.this.mStillCaptureResult = totalCaptureResult;
                ICustomCaptureResult customCaptureResult = CameraDeviceUtil.getCustomCaptureResult(MiCamera2ShotParallelDual.this.mStillCaptureResult);
                List arrayList = new ArrayList();
                arrayList.add(customCaptureResult);
                AlgoConnector.getInstance().getLocalBinder().onCaptureCompleted(arrayList);
            }

            public void onCaptureFailed(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, @NonNull CaptureFailure captureFailure) {
                super.onCaptureFailed(cameraCaptureSession, captureRequest, captureFailure);
                String str = MiCamera2Shot.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("Capture a still picture failed ");
                stringBuilder.append(String.valueOf(captureFailure.getReason()));
                Log.e(str, stringBuilder.toString());
                MiCamera2ShotParallelDual.this.mMiCamera.onCapturePictureFinished(false);
            }
        };
    }

    protected Builder generateRequestBuilder() throws CameraAccessException, IllegalStateException {
        Builder createCaptureRequest = this.mMiCamera.getCameraDevice().createCaptureRequest(2);
        for (Surface surface : this.mMiCamera.getRemoteSurfaceList()) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("captureStillPicture: add surface");
            stringBuilder.append(surface);
            stringBuilder.append("to capture request");
            Log.d(str, stringBuilder.toString());
            createCaptureRequest.addTarget(surface);
        }
        if (!isInQcfaMode() || Camera2DataContainer.getInstance().getBokehFrontCameraId() == this.mMiCamera.getId()) {
            createCaptureRequest.addTarget(this.mMiCamera.getPreviewSurface());
        }
        createCaptureRequest.set(CaptureRequest.CONTROL_AF_MODE, (Integer) this.mMiCamera.getPreviewRequestBuilder().get(CaptureRequest.CONTROL_AF_MODE));
        this.mMiCamera.applySettingsForCapture(createCaptureRequest, 3);
        PerformanceTracker.trackPictureCapture(0);
        return createCaptureRequest;
    }

    protected void onImageReceived(Image image, int i) {
    }

    protected void notifyResultData(ParallelTaskData parallelTaskData) {
    }
}
