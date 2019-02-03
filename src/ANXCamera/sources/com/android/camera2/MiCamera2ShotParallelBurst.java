package com.android.camera2;

import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CameraCaptureSession.CaptureCallback;
import android.hardware.camera2.CaptureFailure;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.CaptureRequest.Builder;
import android.hardware.camera2.CaptureResult;
import android.hardware.camera2.TotalCaptureResult;
import android.hardware.camera2.params.Face;
import android.hardware.camera2.utils.SurfaceUtils;
import android.support.annotation.NonNull;
import android.util.Size;
import android.view.Surface;
import com.android.camera.CameraAppImpl;
import com.android.camera.CameraSettings;
import com.android.camera.CameraSize;
import com.android.camera.Util;
import com.android.camera.log.Log;
import com.android.camera.parallel.AlgoConnector;
import com.android.camera2.Camera2Proxy.PictureCallback;
import com.android.camera2.compat.MiCameraCompat;
import com.xiaomi.camera.base.CameraDeviceUtil;
import com.xiaomi.camera.core.ParallelTaskData;
import com.xiaomi.protocol.ICustomCaptureResult;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

public class MiCamera2ShotParallelBurst extends MiCamera2ShotParallel<ParallelTaskData> {
    private static final String TAG = "ShotParallelBurst";
    private int mAlgoType = 0;
    private int mCompletedNum;
    private boolean mFirstNum;
    private int[] mHdrCheckerEvValue;
    private CaptureResult mPreviewCaptureResult;
    private int mSequenceNum;
    private boolean mShouldDoMFNR;
    private boolean mShouldDoQcfaCapture;
    private boolean mShouldDoSR;
    private List<CaptureRequest> requests = new ArrayList();

    public MiCamera2ShotParallelBurst(MiCamera2 miCamera2, CaptureResult captureResult) {
        super(miCamera2);
        this.mPreviewCaptureResult = captureResult;
    }

    protected void prepare() {
        this.mFirstNum = true;
        this.mShouldDoQcfaCapture = false;
        this.mShouldDoSR = this.mMiCamera.getCameraConfigs().isSuperResolutionEnabled();
        Integer num = (Integer) this.mPreviewCaptureResult.get(CaptureResult.SENSOR_SENSITIVITY);
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("prepare: preview iso = ");
        stringBuilder.append(num);
        Log.d(str, stringBuilder.toString());
        if (!this.mShouldDoSR) {
            boolean z = num != null && num.intValue() >= 800;
            this.mShouldDoMFNR = z;
            str = TAG;
            stringBuilder = new StringBuilder();
            stringBuilder.append("prepare: ISO=");
            stringBuilder.append(num);
            Log.d(str, stringBuilder.toString());
        }
        if (this.mMiCamera.getCameraConfigs().isHDREnabled()) {
            this.mAlgoType = 1;
            prepareHdr();
        } else if (CameraSettings.isGroupShotOn()) {
            this.mAlgoType = 5;
            prepareGroupShot();
        } else if (this.mShouldDoSR) {
            this.mAlgoType = 3;
            this.mSequenceNum = 5;
        } else if (this.mShouldDoMFNR) {
            this.mAlgoType = 2;
            prepareClearShot(num.intValue());
        } else {
            this.mAlgoType = 0;
            this.mSequenceNum = 1;
        }
        Log.d(TAG, String.format(Locale.ENGLISH, "prepare: algo=%d captureNum=%d doMFNR=%b doSR=%b", new Object[]{Integer.valueOf(this.mAlgoType), Integer.valueOf(this.mSequenceNum), Boolean.valueOf(this.mShouldDoMFNR), Boolean.valueOf(this.mShouldDoSR)}));
    }

    private void prepareHdr() {
        Log.d(TAG, "prepareHdr: start");
        Byte[] hdrCheckerValues = CaptureResultParser.getHdrCheckerValues(this.mPreviewCaptureResult);
        if (hdrCheckerValues != null && hdrCheckerValues.length >= 1) {
            int i = 0;
            if (hdrCheckerValues[0].byteValue() != (byte) 0) {
                this.mSequenceNum = hdrCheckerValues[0].byteValue();
                if (this.mSequenceNum <= 6) {
                    this.mHdrCheckerEvValue = new int[this.mSequenceNum];
                    if (this.mSequenceNum > 0 && this.mSequenceNum < 6) {
                        while (i < this.mSequenceNum) {
                            int i2 = i + 1;
                            this.mHdrCheckerEvValue[i] = hdrCheckerValues[i2 * 4].byteValue();
                            String str = TAG;
                            StringBuilder stringBuilder = new StringBuilder();
                            stringBuilder.append("prepareHdr: evValue[");
                            stringBuilder.append(i);
                            stringBuilder.append("]=");
                            stringBuilder.append(this.mHdrCheckerEvValue[i]);
                            Log.d(str, stringBuilder.toString());
                            i = i2;
                        }
                    }
                    return;
                }
                StringBuilder stringBuilder2 = new StringBuilder();
                stringBuilder2.append("wrong sequenceNum ");
                stringBuilder2.append(this.mSequenceNum);
                throw new RuntimeException(stringBuilder2.toString());
            }
        }
        this.mSequenceNum = 3;
        this.mHdrCheckerEvValue = new int[]{-6, 0, 6};
    }

    private void prepareGroupShot() {
        this.mSequenceNum = getGroupShotNum();
    }

    private void prepareClearShot(int i) {
        this.mSequenceNum = 5;
    }

    private int getGroupShotNum() {
        if (Util.isMemoryRich(CameraAppImpl.getAndroidContext())) {
            return getGroupShotMaxImage();
        }
        Log.w(TAG, "getGroupShotNum: low memory");
        return 2;
    }

    private int getGroupShotMaxImage() {
        Face[] faceArr = (Face[]) this.mPreviewCaptureResult.get(CaptureResult.STATISTICS_FACES);
        return Util.clamp((faceArr != null ? faceArr.length : 0) + 1, 2, 4);
    }

    private void applyAlgoParameter(Builder builder, int i, int i2) {
        switch (i2) {
            case 1:
                applyHdrParameter(builder, i);
                return;
            case 2:
                MiCameraCompat.applySwMfnrEnable(builder, this.mShouldDoMFNR);
                return;
            case 3:
                MiCameraCompat.applyMultiFrameInputNum(builder, this.mSequenceNum);
                return;
            default:
                return;
        }
    }

    private void applyHdrParameter(Builder builder, int i) {
        if (i <= this.mSequenceNum) {
            MiCameraCompat.applyHdrBracketMode(builder, (byte) 1);
            MiCameraCompat.applyMultiFrameInputNum(builder, this.mSequenceNum);
            builder.set(CaptureRequest.CONTROL_AE_EXPOSURE_COMPENSATION, Integer.valueOf(this.mHdrCheckerEvValue[i]));
            return;
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("wrong sequenceNum ");
        stringBuilder.append(i);
        throw new RuntimeException(stringBuilder.toString());
    }

    protected void startSessionCapture() {
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
            Log.e(TAG, "Cannot captureBurst");
            this.mMiCamera.notifyOnError(e.getReason());
        } catch (Throwable e2) {
            Log.e(TAG, "Failed to captureBurst, IllegalState", e2);
            this.mMiCamera.notifyOnError(256);
        }
    }

    protected CaptureCallback generateCaptureCallback() {
        return new CaptureCallback() {
            long captureTimestamp = -1;

            public void onCaptureStarted(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, long j, long j2) {
                String str = MiCamera2ShotParallelBurst.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onCaptureStarted: frameNumber=");
                stringBuilder.append(j2);
                stringBuilder.append(" isFirst=");
                stringBuilder.append(MiCamera2ShotParallelBurst.this.mFirstNum);
                Log.d(str, stringBuilder.toString());
                super.onCaptureStarted(cameraCaptureSession, captureRequest, j, j2);
                if (MiCamera2ShotParallelBurst.this.mFirstNum) {
                    PictureCallback pictureCallback = MiCamera2ShotParallelBurst.this.mMiCamera.getPictureCallback();
                    if (pictureCallback != null) {
                        ParallelTaskData onCaptureStart = pictureCallback.onCaptureStart(new ParallelTaskData(j, MiCamera2ShotParallelBurst.this.mMiCamera.getCameraConfigs().getShotType(), MiCamera2ShotParallelBurst.this.mMiCamera.getCameraConfigs().getShotPath()), MiCamera2ShotParallelBurst.this.mCapturedImageSize);
                        if (onCaptureStart != null) {
                            onCaptureStart.setAlgoType(MiCamera2ShotParallelBurst.this.mAlgoType);
                            onCaptureStart.setBurstNum(MiCamera2ShotParallelBurst.this.mSequenceNum);
                            this.captureTimestamp = j;
                            AlgoConnector.getInstance().getLocalBinder().onCaptureStarted(onCaptureStart);
                        }
                    }
                    MiCamera2ShotParallelBurst.this.mFirstNum = false;
                }
            }

            public void onCaptureCompleted(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, @NonNull TotalCaptureResult totalCaptureResult) {
                boolean z;
                MiCamera2ShotParallelBurst.this.mCompletedNum = MiCamera2ShotParallelBurst.this.mCompletedNum + 1;
                String str = MiCamera2ShotParallelBurst.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onCaptureCompleted: ");
                stringBuilder.append(MiCamera2ShotParallelBurst.this.mCompletedNum);
                stringBuilder.append("/");
                stringBuilder.append(MiCamera2ShotParallelBurst.this.mSequenceNum);
                Log.d(str, stringBuilder.toString());
                ICustomCaptureResult customCaptureResult = CameraDeviceUtil.getCustomCaptureResult(totalCaptureResult);
                if (MiCamera2ShotParallelBurst.this.mCompletedNum == 1) {
                    z = true;
                } else {
                    z = false;
                }
                AlgoConnector.getInstance().getLocalBinder().onCaptureCompleted(customCaptureResult, z);
                if (MiCamera2ShotParallelBurst.this.mSequenceNum == MiCamera2ShotParallelBurst.this.mCompletedNum) {
                    MiCamera2ShotParallelBurst.this.mMiCamera.onCapturePictureFinished(true);
                }
            }

            public void onCaptureFailed(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, @NonNull CaptureFailure captureFailure) {
                super.onCaptureFailed(cameraCaptureSession, captureRequest, captureFailure);
                String str = MiCamera2ShotParallelBurst.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onCaptureFailed: ");
                stringBuilder.append(captureFailure.getReason());
                Log.e(str, stringBuilder.toString());
                MiCamera2ShotParallelBurst.this.mMiCamera.onCapturePictureFinished(false);
                if (this.captureTimestamp != -1) {
                    AlgoConnector.getInstance().getLocalBinder().onCaptureFailed(this.captureTimestamp, captureFailure.getReason());
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
            stringBuilder.append("[QCFA] generateRequestBuilder: surface: ");
            stringBuilder.append(surfaceSize2);
            Log.e(str, stringBuilder.toString());
            createCaptureRequest.addTarget(surface);
            configParallelSession(surfaceSize2);
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
        createCaptureRequest.set(CaptureRequest.CONTROL_AE_MODE, Integer.valueOf(1));
        this.mMiCamera.applySettingsForCapture(createCaptureRequest, 3);
        createCaptureRequest.set(CaptureRequest.CONTROL_ENABLE_ZSL, Boolean.valueOf(false));
        return createCaptureRequest;
    }
}
