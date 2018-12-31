package com.android.camera2;

import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CameraCaptureSession.CaptureCallback;
import android.hardware.camera2.CaptureFailure;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.CaptureRequest.Builder;
import android.hardware.camera2.CaptureResult;
import android.hardware.camera2.TotalCaptureResult;
import android.hardware.camera2.utils.SurfaceUtils;
import android.media.Image;
import android.support.annotation.NonNull;
import android.util.Size;
import android.view.Surface;
import com.android.camera.CameraSize;
import com.android.camera.log.Log;
import com.android.camera.module.ModuleManager;
import com.android.camera.parallel.AlgoConnector;
import com.android.camera2.Camera2Proxy.PictureCallback;
import com.xiaomi.camera.base.CameraDeviceUtil;
import com.xiaomi.camera.base.PerformanceTracker;
import com.xiaomi.camera.core.ParallelTaskData;
import com.xiaomi.engine.BufferFormat;
import com.xiaomi.engine.GraphDescriptorBean;
import java.util.Locale;

public class MiCamera2ShotParallelStill extends MiCamera2Shot<ParallelTaskData> {
    private static final String TAG = "ParallelStill";
    private int mAlgoType;
    private CameraSize mCapturedImageSize;
    private CaptureResult mPreviewCaptureResult;
    private boolean mShouldDoQcfaCapture;
    private CaptureResult mStillCaptureResult;

    public MiCamera2ShotParallelStill(@NonNull MiCamera2 miCamera2, @NonNull CaptureResult captureResult) {
        super(miCamera2);
        this.mPreviewCaptureResult = captureResult;
    }

    protected void prepare() {
        boolean z = false;
        this.mAlgoType = 0;
        Integer num = (Integer) this.mPreviewCaptureResult.get(CaptureResult.SENSOR_SENSITIVITY);
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("[QCFA] prepare: iso=");
        stringBuilder.append(num);
        Log.d(str, stringBuilder.toString());
        if (!(!this.mMiCamera.isQcfaEnable() || num == null || num.intValue() > 300 || this.mMiCamera.getCameraConfigs().isHDREnabled() || this.mMiCamera.isFrontBeautyOn())) {
            z = true;
        }
        this.mShouldDoQcfaCapture = z;
        if (this.mShouldDoQcfaCapture) {
            this.mAlgoType = 6;
        }
    }

    protected void startSessionCapture() {
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
            long mCaptureTimestamp = -1;

            public void onCaptureStarted(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, long j, long j2) {
                super.onCaptureStarted(cameraCaptureSession, captureRequest, j, j2);
                PictureCallback pictureCallback = MiCamera2ShotParallelStill.this.mMiCamera.getPictureCallback();
                if (pictureCallback != null) {
                    ParallelTaskData onCaptureStart = pictureCallback.onCaptureStart(new ParallelTaskData(j, MiCamera2ShotParallelStill.this.mMiCamera.getCameraConfigs().getShotType(), MiCamera2ShotParallelStill.this.mMiCamera.getCameraConfigs().getShotPath()), MiCamera2ShotParallelStill.this.mCapturedImageSize);
                    if (onCaptureStart != null) {
                        onCaptureStart.setAlgoType(MiCamera2ShotParallelStill.this.mAlgoType);
                        onCaptureStart.setBurstNum(1);
                        this.mCaptureTimestamp = j;
                        AlgoConnector.getInstance().getLocalBinder().onCaptureStarted(onCaptureStart);
                    }
                }
            }

            public void onCaptureCompleted(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, @NonNull TotalCaptureResult totalCaptureResult) {
                String str = MiCamera2ShotParallelStill.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onCaptureCompleted: frameNumber=");
                stringBuilder.append(totalCaptureResult.getFrameNumber());
                Log.d(str, stringBuilder.toString());
                MiCamera2ShotParallelStill.this.mMiCamera.onCapturePictureFinished(true);
                MiCamera2ShotParallelStill.this.mStillCaptureResult = totalCaptureResult;
                AlgoConnector.getInstance().getLocalBinder().onCaptureCompleted(CameraDeviceUtil.getCustomCaptureResult(MiCamera2ShotParallelStill.this.mStillCaptureResult), true);
            }

            public void onCaptureFailed(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, @NonNull CaptureFailure captureFailure) {
                super.onCaptureFailed(cameraCaptureSession, captureRequest, captureFailure);
                String str = MiCamera2ShotParallelStill.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onCaptureFailed: reason=");
                stringBuilder.append(captureFailure.getReason());
                Log.e(str, stringBuilder.toString());
                MiCamera2ShotParallelStill.this.mMiCamera.onCapturePictureFinished(false);
                if (this.mCaptureTimestamp != -1) {
                    AlgoConnector.getInstance().getLocalBinder().onCaptureFailed(this.mCaptureTimestamp, captureFailure.getReason());
                }
            }
        };
    }

    protected Builder generateRequestBuilder() throws CameraAccessException, IllegalStateException {
        Builder createCaptureRequest = this.mMiCamera.getCameraDevice().createCaptureRequest(2);
        Surface surface;
        String str;
        StringBuilder stringBuilder;
        if (this.mMiCamera.isQcfaEnable()) {
            int size = this.mMiCamera.getRemoteSurfaceList().size();
            CameraSize pictureSize = this.mMiCamera.getPictureSize();
            Surface surface2 = null;
            int i = size;
            surface = null;
            for (Surface surface3 : this.mMiCamera.getRemoteSurfaceList()) {
                Size surfaceSize = SurfaceUtils.getSurfaceSize(surface3);
                if (pictureSize.getWidth() == surfaceSize.getWidth() && pictureSize.getHeight() == surfaceSize.getHeight()) {
                    i--;
                    surface2 = surface3;
                } else if (pictureSize.getWidth() / 2 == surfaceSize.getWidth() && pictureSize.getHeight() / 2 == surfaceSize.getHeight()) {
                    i--;
                    surface = surface3;
                }
            }
            if (surface2 == null || surface == null || i != 0) {
                StringBuilder stringBuilder2 = new StringBuilder();
                stringBuilder2.append("There is some wrong when QCFA opened! \n");
                stringBuilder2.append(String.format(Locale.ENGLISH, "qcfaLargerSurface = %s; qcfaSmallerSurface = %s; surfaceList size = %s", new Object[]{surface2, surface, Integer.valueOf(i)}));
                throw new RuntimeException(stringBuilder2.toString());
            }
            if (this.mShouldDoQcfaCapture) {
                surface = surface2;
            }
            Size surfaceSize2 = SurfaceUtils.getSurfaceSize(surface);
            str = TAG;
            stringBuilder = new StringBuilder();
            stringBuilder.append("[QCFA] generateRequestBuilder: surface :");
            stringBuilder.append(surfaceSize2);
            Log.e(str, stringBuilder.toString());
            configParallelSession(surfaceSize2);
            createCaptureRequest.addTarget(surface);
        } else {
            for (Surface surface4 : this.mMiCamera.getRemoteSurfaceList()) {
                str = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("add surface ");
                stringBuilder.append(surface4);
                stringBuilder.append(" to capture request");
                Log.d(str, stringBuilder.toString());
                createCaptureRequest.addTarget(surface4);
            }
            this.mCapturedImageSize = this.mMiCamera.getPictureSize();
            createCaptureRequest.addTarget(this.mMiCamera.getPreviewSurface());
        }
        createCaptureRequest.set(CaptureRequest.CONTROL_AF_MODE, (Integer) this.mMiCamera.getPreviewRequestBuilder().get(CaptureRequest.CONTROL_AF_MODE));
        this.mMiCamera.applySettingsForCapture(createCaptureRequest, 3);
        return createCaptureRequest;
    }

    protected void onImageReceived(Image image, int i) {
    }

    protected void notifyResultData(ParallelTaskData parallelTaskData) {
    }

    private void configParallelSession(Size size) {
        GraphDescriptorBean graphDescriptorBean;
        if (ModuleManager.isPortraitModule()) {
            graphDescriptorBean = new GraphDescriptorBean(32770, 2, true, this.mMiCamera.isFacingFront());
        } else {
            graphDescriptorBean = new GraphDescriptorBean(0, 1, true, this.mMiCamera.isFacingFront());
        }
        int width = size.getWidth();
        int height = size.getHeight();
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("[QCFA] configParallelSession: pictureSize = ");
        stringBuilder.append(size);
        Log.d(str, stringBuilder.toString());
        AlgoConnector.getInstance().getLocalBinder().configCaptureSession(new BufferFormat(width, height, 35, graphDescriptorBean));
        this.mCapturedImageSize = new CameraSize(size);
    }
}
