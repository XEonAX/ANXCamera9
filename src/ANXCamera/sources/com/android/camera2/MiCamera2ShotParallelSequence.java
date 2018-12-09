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
import com.android.camera.parallel.AlgoConnector;
import com.android.camera2.Camera2Proxy.PictureCallback;
import com.android.camera2.compat.MiCameraCompat;
import com.ss.android.ttve.common.TEDefine;
import com.xiaomi.camera.base.CameraDeviceUtil;
import com.xiaomi.camera.core.ParallelTaskData;
import java.util.ArrayList;
import java.util.List;

public class MiCamera2ShotParallelSequence extends MiCamera2Shot<ParallelTaskData> {
    private int mAlgoType;
    private CaptureResult mCaptureResult;
    private boolean mFirstNum;
    private int[] mHdrCheckerEvValue;
    private int mSequenceNum;
    private List<CaptureRequest> requests = new ArrayList();

    public MiCamera2ShotParallelSequence(MiCamera2 miCamera2, CaptureResult captureResult) {
        super(miCamera2);
        this.mCaptureResult = captureResult;
    }

    protected void prepare() {
        this.mFirstNum = true;
        if (this.mMiCamera.getCameraConfigs().isHDREnabled()) {
            this.mAlgoType = 1;
        }
        if (this.mAlgoType != 2) {
            prepareHdr();
        } else {
            prepareClearShot();
        }
    }

    private void prepareHdr() {
        Byte[] hdrCheckerValues = CaptureResultParser.getHdrCheckerValues(this.mCaptureResult);
        if (hdrCheckerValues == null) {
            this.mSequenceNum = 3;
            this.mHdrCheckerEvValue = new int[]{-6, 0, 6};
            return;
        }
        int i = 0;
        this.mSequenceNum = hdrCheckerValues[0].byteValue();
        if (this.mSequenceNum <= 6) {
            this.mHdrCheckerEvValue = new int[this.mSequenceNum];
            if (this.mSequenceNum > 0 && this.mSequenceNum < 6) {
                while (i < this.mSequenceNum) {
                    int i2 = i + 1;
                    this.mHdrCheckerEvValue[i] = hdrCheckerValues[i2 * 4].byteValue();
                    i = i2;
                }
            }
            return;
        }
        throw new RuntimeException("wrong sequenceNum");
    }

    private void prepareClearShot() {
        this.mSequenceNum = 5;
    }

    private void applyAlgoParameter(Builder builder, int i, int i2) {
        if (i2 == 1) {
            applyHdrParameter(builder, i);
        }
    }

    private void applyHdrParameter(Builder builder, int i) {
        if (i <= this.mSequenceNum) {
            MiCameraCompat.applyHdrBracketMode(builder, (byte) 1);
            MiCameraCompat.applyMultiFrameInputNum(builder, i);
            builder.set(CaptureRequest.CONTROL_AE_EXPOSURE_COMPENSATION, Integer.valueOf(this.mHdrCheckerEvValue[i]));
            return;
        }
        throw new RuntimeException("wrong num");
    }

    protected void startShot() {
        try {
            CaptureCallback generateCaptureCallback = generateCaptureCallback();
            for (int i = 0; i < this.mSequenceNum; i++) {
                Builder generateRequestBuilder = generateRequestBuilder();
                applyAlgoParameter(generateRequestBuilder, i, this.mAlgoType);
                this.requests.add(generateRequestBuilder.build());
            }
            this.mMiCamera.getCaptureSession().captureBurst(this.requests, generateCaptureCallback, this.mCameraHandler);
        } catch (CameraAccessException e) {
            e.printStackTrace();
            Log.e(TAG, "Cannot  captureBurst");
            this.mMiCamera.notifyOnError(e.getReason());
        } catch (Throwable e2) {
            Log.e(TAG, "Failed to captureBurst, IllegalState", e2);
            this.mMiCamera.notifyOnError(256);
        }
    }

    protected CaptureCallback generateCaptureCallback() {
        return new CaptureCallback() {
            public void onCaptureStarted(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, long j, long j2) {
                String str = MiCamera2Shot.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("captureBurst onCaptureStarted mFirstNum:");
                stringBuilder.append(MiCamera2ShotParallelSequence.this.mFirstNum);
                Log.d(str, stringBuilder.toString());
                super.onCaptureStarted(cameraCaptureSession, captureRequest, j, j2);
                if (MiCamera2ShotParallelSequence.this.mFirstNum) {
                    PictureCallback pictureCallback = MiCamera2ShotParallelSequence.this.mMiCamera.getPictureCallback();
                    if (pictureCallback != null) {
                        pictureCallback.onCaptureStart(j, MiCamera2ShotParallelSequence.this.mMiCamera.getCameraConfigs().getShotType(), MiCamera2ShotParallelSequence.this.mMiCamera.getCameraConfigs().getShotPath());
                    }
                    MiCamera2ShotParallelSequence.this.mFirstNum = false;
                }
            }

            public void onCaptureCompleted(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, @NonNull TotalCaptureResult totalCaptureResult) {
                String str = MiCamera2Shot.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("captureBurst onCaptureCompleted: mBurstNum:");
                stringBuilder.append(MiCamera2ShotParallelSequence.this.mSequenceNum);
                stringBuilder.append(", result:");
                stringBuilder.append(totalCaptureResult == null ? TEDefine.FACE_BEAUTY_NULL : Long.valueOf(totalCaptureResult.getFrameNumber()));
                Log.d(str, stringBuilder.toString());
                CameraDeviceUtil.getCustomCaptureResult(totalCaptureResult);
                AlgoConnector.getInstance().getLocalBinder().onCaptureCompleted(null);
                MiCamera2ShotParallelSequence.this.mSequenceNum = MiCamera2ShotParallelSequence.this.mSequenceNum - 1;
                if (MiCamera2ShotParallelSequence.this.mSequenceNum == 0) {
                    MiCamera2ShotParallelSequence.this.mMiCamera.onCapturePictureFinished(true);
                }
            }

            public void onCaptureFailed(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, @NonNull CaptureFailure captureFailure) {
                super.onCaptureFailed(cameraCaptureSession, captureRequest, captureFailure);
                String str = MiCamera2Shot.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("captureBurst failed ");
                stringBuilder.append(String.valueOf(captureFailure.getReason()));
                Log.e(str, stringBuilder.toString());
                MiCamera2ShotParallelSequence.this.mMiCamera.onCapturePictureFinished(false);
            }
        };
    }

    protected Builder generateRequestBuilder() throws CameraAccessException, IllegalStateException {
        Builder createCaptureRequest = this.mMiCamera.getCameraDevice().createCaptureRequest(2);
        for (Surface addTarget : this.mMiCamera.getRemoteSurfaceList()) {
            createCaptureRequest.addTarget(addTarget);
        }
        createCaptureRequest.set(CaptureRequest.CONTROL_AE_MODE, Integer.valueOf(1));
        createCaptureRequest.addTarget(this.mMiCamera.getPreviewSurface());
        this.mMiCamera.applySettingsForCapture(createCaptureRequest, 3);
        createCaptureRequest.set(CaptureRequest.CONTROL_ENABLE_ZSL, Boolean.valueOf(false));
        return createCaptureRequest;
    }

    protected void onImageReceived(Image image, int i) {
    }

    protected void notifyResultData(ParallelTaskData parallelTaskData) {
    }
}
