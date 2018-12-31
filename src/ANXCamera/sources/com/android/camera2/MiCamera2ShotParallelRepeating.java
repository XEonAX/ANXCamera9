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
import com.android.camera2.compat.MiCameraCompat;
import com.xiaomi.camera.base.CameraDeviceUtil;
import com.xiaomi.camera.base.PerformanceTracker;
import com.xiaomi.camera.core.ParallelTaskData;

public class MiCamera2ShotParallelRepeating extends MiCamera2Shot<byte[]> {
    private static final String TAG = "ParallelRepeating";
    private int mBurstNum;
    private CaptureResult mRepeatingCaptureResult;

    public MiCamera2ShotParallelRepeating(MiCamera2 miCamera2, int i) {
        super(miCamera2);
        this.mBurstNum = i;
    }

    protected void prepare() {
        this.mMiCamera.setAWBLock(true);
    }

    protected void startSessionCapture() {
        Log.d(TAG, "startSessionCapture");
        PerformanceTracker.trackPictureCapture(0);
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
            long mCaptureTimestamp = -1;

            public void onCaptureStarted(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, long j, long j2) {
                super.onCaptureStarted(cameraCaptureSession, captureRequest, j, j2);
                String str = MiCamera2ShotParallelRepeating.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onCaptureStarted: ");
                stringBuilder.append(j);
                Log.d(str, stringBuilder.toString());
                PictureCallback pictureCallback = MiCamera2ShotParallelRepeating.this.mMiCamera.getPictureCallback();
                if (pictureCallback != null) {
                    ParallelTaskData onCaptureStart = pictureCallback.onCaptureStart(new ParallelTaskData(j, MiCamera2ShotParallelRepeating.this.mMiCamera.getCameraConfigs().getShotType(), MiCamera2ShotParallelRepeating.this.mMiCamera.getCameraConfigs().getShotPath()), MiCamera2ShotParallelRepeating.this.mMiCamera.getPictureSize());
                    if (onCaptureStart != null) {
                        onCaptureStart.setAlgoType(4);
                        onCaptureStart.setBurstNum(1);
                        this.mCaptureTimestamp = j;
                        AlgoConnector.getInstance().getLocalBinder().onCaptureStarted(onCaptureStart);
                    }
                }
            }

            public void onCaptureCompleted(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, @NonNull TotalCaptureResult totalCaptureResult) {
                super.onCaptureCompleted(cameraCaptureSession, captureRequest, totalCaptureResult);
                String str = MiCamera2ShotParallelRepeating.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onCaptureCompleted: ");
                stringBuilder.append(totalCaptureResult.getFrameNumber());
                Log.d(str, stringBuilder.toString());
                MiCamera2ShotParallelRepeating.this.mRepeatingCaptureResult = totalCaptureResult;
                AlgoConnector.getInstance().getLocalBinder().onCaptureCompleted(CameraDeviceUtil.getCustomCaptureResult(MiCamera2ShotParallelRepeating.this.mRepeatingCaptureResult), true);
            }

            public void onCaptureFailed(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, @NonNull CaptureFailure captureFailure) {
                super.onCaptureFailed(cameraCaptureSession, captureRequest, captureFailure);
                String str = MiCamera2ShotParallelRepeating.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onCaptureFailed: ");
                stringBuilder.append(captureFailure.getReason());
                Log.e(str, stringBuilder.toString());
                MiCamera2ShotParallelRepeating.this.onRepeatingEnd(false);
                if (this.mCaptureTimestamp != -1) {
                    AlgoConnector.getInstance().getLocalBinder().onCaptureFailed(this.mCaptureTimestamp, captureFailure.getReason());
                }
            }

            public void onCaptureSequenceCompleted(@NonNull CameraCaptureSession cameraCaptureSession, int i, long j) {
                String str = MiCamera2ShotParallelRepeating.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onCaptureSequenceCompleted: sequenceId=");
                stringBuilder.append(i);
                stringBuilder.append(" frameNumber=");
                stringBuilder.append(j);
                Log.d(str, stringBuilder.toString());
                MiCamera2ShotParallelRepeating.this.onRepeatingEnd(true);
            }

            public void onCaptureSequenceAborted(@NonNull CameraCaptureSession cameraCaptureSession, int i) {
                super.onCaptureSequenceAborted(cameraCaptureSession, i);
                String str = MiCamera2ShotParallelRepeating.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onCaptureSequenceAborted: ");
                stringBuilder.append(i);
                Log.w(str, stringBuilder.toString());
                MiCamera2ShotParallelRepeating.this.onRepeatingEnd(false);
            }
        };
    }

    protected Builder generateRequestBuilder() throws CameraAccessException, IllegalStateException {
        Builder createCaptureRequest = this.mMiCamera.getCameraDevice().createCaptureRequest(2);
        for (Surface surface : this.mMiCamera.getRemoteSurfaceList()) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("add surface ");
            stringBuilder.append(surface);
            stringBuilder.append(" to capture request");
            Log.d(str, stringBuilder.toString());
            createCaptureRequest.addTarget(surface);
        }
        createCaptureRequest.addTarget(this.mMiCamera.getPreviewSurface());
        if (!isInQcfaMode() || Camera2DataContainer.getInstance().getBokehFrontCameraId() == this.mMiCamera.getId()) {
            createCaptureRequest.addTarget(this.mMiCamera.getPreviewSurface());
        }
        createCaptureRequest.set(CaptureRequest.CONTROL_AF_MODE, (Integer) this.mMiCamera.getPreviewRequestBuilder().get(CaptureRequest.CONTROL_AF_MODE));
        this.mMiCamera.applySettingsForCapture(createCaptureRequest, 3);
        MiCameraCompat.applyMfnrEnable(createCaptureRequest, false);
        return createCaptureRequest;
    }

    protected void onImageReceived(Image image, int i) {
    }

    protected void notifyResultData(byte[] bArr) {
    }

    private void onRepeatingEnd(boolean z) {
        this.mMiCamera.setAWBLock(false);
        this.mMiCamera.resumePreview();
        PictureCallback pictureCallback = this.mMiCamera.getPictureCallback();
        if (pictureCallback != null) {
            pictureCallback.onPictureTakenFinished(z);
        }
    }
}
