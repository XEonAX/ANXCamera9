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
import com.android.camera.module.Camera2Module;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.android.camera2.Camera2Proxy.PictureCallback;
import com.ss.android.ttve.common.TEDefine;
import com.xiaomi.camera.base.PerformanceTracker;
import com.xiaomi.camera.core.ParallelCallback;
import com.xiaomi.camera.core.ParallelTaskData;
import com.xiaomi.camera.liveshot.CircularMediaRecorder;
import com.xiaomi.camera.liveshot.CircularMediaRecorder.VideoClipSavingCallback;

public class MiCamera2ShotLive extends MiCamera2Shot<ParallelTaskData> implements VideoClipSavingCallback {
    private static final String TAG = MiCamera2ShotLive.class.getSimpleName();
    private ParallelTaskData mCurrentParallelTaskData;

    public MiCamera2ShotLive(MiCamera2 miCamera2) {
        super(miCamera2);
    }

    protected void prepare() {
    }

    protected void startSessionCapture() {
        try {
            CaptureCallback generateCaptureCallback = generateCaptureCallback();
            Builder generateRequestBuilder = generateRequestBuilder();
            PerformanceTracker.trackPictureCapture(0);
            this.mMiCamera.getCaptureSession().capture(generateRequestBuilder.build(), generateCaptureCallback, this.mCameraHandler);
        } catch (Throwable e) {
            Log.e(TAG, "Cannot capture a still picture", e);
            this.mMiCamera.notifyOnError(e.getReason());
        } catch (Throwable e2) {
            Log.e(TAG, "Cannot capture a still picture", e2);
            this.mMiCamera.notifyOnError(256);
        }
    }

    protected CaptureCallback generateCaptureCallback() {
        return new CaptureCallback() {
            public void onCaptureStarted(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, long j, long j2) {
                String access$000 = MiCamera2ShotLive.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onCaptureStarted: frameNumber=");
                stringBuilder.append(j2);
                Log.d(access$000, stringBuilder.toString());
                super.onCaptureStarted(cameraCaptureSession, captureRequest, j, j2);
                if (MiCamera2ShotLive.this.mCurrentParallelTaskData == null) {
                    MiCamera2ShotLive.this.mCurrentParallelTaskData = MiCamera2ShotLive.this.generateParallelTaskData(j);
                }
                PictureCallback pictureCallback = MiCamera2ShotLive.this.mMiCamera.getPictureCallback();
                if (pictureCallback == null) {
                    return;
                }
                if (pictureCallback instanceof Camera2Module) {
                    CircularMediaRecorder circularMediaRecorder = ((Camera2Module) pictureCallback).getCircularMediaRecorder();
                    if (circularMediaRecorder != null) {
                        circularMediaRecorder.snapshot(-1, MiCamera2ShotLive.this);
                        return;
                    }
                    return;
                }
                throw new IllegalStateException("Please update the implementation of MiCamera2ShotLive");
            }

            public void onCaptureCompleted(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, @NonNull TotalCaptureResult totalCaptureResult) {
                String access$000 = MiCamera2ShotLive.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onCaptureCompleted: frameNumber=");
                stringBuilder.append(totalCaptureResult.getFrameNumber());
                Log.d(access$000, stringBuilder.toString());
                MiCamera2ShotLive.this.mMiCamera.onCapturePictureFinished(true);
            }

            public void onCaptureFailed(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, @NonNull CaptureFailure captureFailure) {
                super.onCaptureFailed(cameraCaptureSession, captureRequest, captureFailure);
                String access$000 = MiCamera2ShotLive.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onCaptureFailed: reason=");
                stringBuilder.append(String.valueOf(captureFailure.getReason()));
                Log.e(access$000, stringBuilder.toString());
                MiCamera2ShotLive.this.mMiCamera.onCapturePictureFinished(false);
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
        String str;
        if (pictureCallback == null || this.mCurrentParallelTaskData == null) {
            image.close();
            str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("onImageReceived: illegal argument ");
            stringBuilder.append(pictureCallback == null ? "callback" : "taskdata");
            Log.e(str, stringBuilder.toString());
            return;
        }
        byte[] firstPlane = Util.getFirstPlane(image);
        image.close();
        str = TAG;
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append("onImageReceived: dataLen=");
        stringBuilder2.append(firstPlane == null ? TEDefine.FACE_BEAUTY_NULL : Integer.valueOf(firstPlane.length));
        Log.d(str, stringBuilder2.toString());
        this.mCurrentParallelTaskData.fillJpegData(firstPlane, i);
        if (this.mCurrentParallelTaskData.isJpegDataReady()) {
            pictureCallback.onPictureTakenFinished(true);
            notifyResultData(this.mCurrentParallelTaskData);
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

    public void onVideoClipSavingCompleted(@NonNull byte[] bArr, long j) {
        PictureCallback pictureCallback = this.mMiCamera.getPictureCallback();
        if (pictureCallback != null && this.mCurrentParallelTaskData != null) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("onVideoClipSavingCompleted: video = ");
            stringBuilder.append(bArr.length);
            stringBuilder.append(", timestamp = ");
            stringBuilder.append(j);
            Log.d(str, stringBuilder.toString());
            this.mCurrentParallelTaskData.fillMp4Data(bArr, j);
            if (this.mCurrentParallelTaskData.isJpegDataReady()) {
                boolean z = bArr != null && bArr.length > 0;
                pictureCallback.onPictureTakenFinished(z);
                notifyResultData(this.mCurrentParallelTaskData);
            }
        }
    }

    public void onVideoClipSavingCancelled() {
        Log.d(TAG, "onVideoClipSavingCancelled: video = 0, timestamp = -1");
        onVideoClipSavingCompleted(new byte[0], -1);
    }

    public void onVideoClipSavingException(@NonNull Throwable th) {
        Log.d(TAG, "onVideoClipSavingException: video = 0, timestamp = -1");
        onVideoClipSavingCompleted(new byte[0], -1);
    }
}
