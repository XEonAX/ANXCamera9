package com.android.camera2;

import android.content.Context;
import android.graphics.RectF;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CameraDevice;
import android.hardware.camera2.CaptureRequest.Builder;
import android.hardware.camera2.CaptureRequest.Key;
import android.hardware.camera2.CaptureResult;
import android.hardware.camera2.params.MeteringRectangle;
import android.location.Location;
import android.media.Image;
import android.media.ImageReader;
import android.os.Handler;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.Range;
import android.view.Surface;
import com.android.camera.CameraSize;
import com.android.camera.effect.FaceAnalyzeInfo;
import com.android.camera.fragment.beauty.BeautyValues;
import com.android.camera.module.loader.camera2.FocusTask;
import com.xiaomi.camera.core.ParallelCallback;
import com.xiaomi.camera.core.ParallelTaskData;

public abstract class Camera2Proxy {
    private final Object mCallbackLock = new Object();
    final int mCameraId;
    protected CameraErrorCallback mErrorCallback;
    private FocusCallback mFocusCallback;
    private CameraMetaDataCallback mMetadataCallback;
    private ParallelCallback mParallelCallback;
    private PictureCallback mPictureCallBack;
    private PreviewCallback mPreviewCallback;
    private PictureCallback mRawCallBack;
    private ScreenLightCallback mScreenLightCallback;

    public interface CameraErrorCallback {
        void onCameraError(Camera2Proxy camera2Proxy, int i);
    }

    public interface CameraMetaDataCallback {
        void onPreviewMetaDataUpdate(CaptureResult captureResult);
    }

    public interface PictureCallback {
        ParallelTaskData onCaptureStart(ParallelTaskData parallelTaskData, CameraSize cameraSize);

        void onPictureTaken(byte[] bArr);

        void onPictureTakenFinished(boolean z);

        boolean onPictureTakenImageConsumed(Image image);
    }

    public static class PictureCallbackWrapper implements PictureCallback {
        public ParallelTaskData onCaptureStart(ParallelTaskData parallelTaskData, CameraSize cameraSize) {
            return null;
        }

        public boolean onPictureTakenImageConsumed(Image image) {
            return false;
        }

        public void onPictureTaken(byte[] bArr) {
        }

        public void onPictureTakenFinished(boolean z) {
        }
    }

    public interface BeautyBodySlimCountCallback {
        boolean isBeautyBodySlimCountDetectStarted();

        void onBeautyBodySlimCountChange(boolean z);
    }

    public interface CameraPreviewCallback {
        void onPreviewSessionClosed(CameraCaptureSession cameraCaptureSession);

        void onPreviewSessionFailed(CameraCaptureSession cameraCaptureSession);

        void onPreviewSessionSuccess(CameraCaptureSession cameraCaptureSession);
    }

    public interface FaceDetectionCallback {
        boolean isFaceDetectStarted();

        boolean isUseFaceInfo();

        void onFaceDetected(CameraHardwareFace[] cameraHardwareFaceArr, FaceAnalyzeInfo faceAnalyzeInfo);
    }

    public interface FocusCallback {
        void onFocusStateChanged(FocusTask focusTask);
    }

    public interface HDRCheckerCallback {
        boolean isHdrDetectStarted();

        void onHDRSceneChanged(boolean z);
    }

    public interface ScreenLightCallback {
        void startScreenLight(int i, int i2);

        void stopScreenLight();
    }

    public interface UltraWideCheckCallback {
        boolean isUltraWideDetectStarted();

        void onUltraWideChanged(boolean z);
    }

    public interface VideoRecordStateCallback {
        void onVideoRecordStopped();
    }

    public interface PreviewCallback {
        void onPreviewFrame(Image image, Camera2Proxy camera2Proxy, int i);
    }

    public abstract void cancelContinuousShot();

    public abstract void cancelFocus(int i);

    public abstract void captureAbortBurst();

    public abstract void captureBurstPictures(int i, @NonNull PictureCallback pictureCallback, @NonNull ParallelCallback parallelCallback);

    public abstract void captureGroupShotPictures(@NonNull PictureCallback pictureCallback, @NonNull ParallelCallback parallelCallback, int i, Context context);

    public abstract void captureVideoSnapshot(PictureCallback pictureCallback);

    public abstract void close();

    public abstract void forceTurnFlashOffAndPausePreview();

    protected abstract CameraConfigs getCameraConfigs();

    protected abstract CameraDevice getCameraDevice();

    public abstract Handler getCameraHandler();

    public abstract CameraCapabilities getCapabilities();

    protected abstract CameraCaptureSession getCaptureSession();

    protected abstract ImageReader getDepthImageReader();

    public abstract int getExposureCompensation();

    public abstract int getFlashMode();

    public abstract int getFocusMode();

    protected abstract ImageReader getPhotoImageReader();

    public abstract int getPictureFormat();

    public abstract int getPictureMaxImages();

    public abstract CameraSize getPictureSize();

    protected abstract ImageReader getPortraitRawImageReader();

    public abstract int getPreviewFormat();

    public abstract int getPreviewMaxImages();

    protected abstract Builder getPreviewRequestBuilder();

    public abstract CameraSize getPreviewSize();

    protected abstract Surface getPreviewSurface();

    protected abstract Surface getRecordSurface();

    public abstract int getSceneMode();

    public abstract String getShotSavePath();

    protected abstract ImageReader getVideoSnapshotImageReader();

    public abstract float getZoomRatio();

    public abstract boolean isBokehEnabled();

    public abstract boolean isFacingFront();

    public abstract boolean isNeedFlashOn();

    public abstract boolean isNeedPreviewThumbnail();

    public abstract boolean isPreviewReady();

    public abstract boolean isQcfaEnable();

    public abstract boolean isSessionReady();

    public abstract void lockExposure(boolean z);

    public abstract void notifyVideoStreamEnd();

    public abstract void pausePreview();

    public abstract void releaseCameraPreviewCallback(@Nullable CameraPreviewCallback cameraPreviewCallback);

    public abstract void releasePictureCallback();

    public abstract void releasePreview();

    public abstract void resetConfigs();

    public abstract void resumePreview();

    public abstract void setAELock(boolean z);

    public abstract void setAERegions(MeteringRectangle[] meteringRectangleArr);

    public abstract void setAFRegions(MeteringRectangle[] meteringRectangleArr);

    public abstract void setASD(boolean z);

    public abstract void setASDPeriod(int i);

    public abstract void setASDScene(int i);

    public abstract void setAWBLock(boolean z);

    public abstract void setAWBMode(int i);

    public abstract void setAntiBanding(int i);

    public abstract void setAutoZoomMode(int i);

    public abstract void setAutoZoomScaleOffset(float f);

    public abstract void setAutoZoomStartCapture(float[] fArr);

    public abstract void setAutoZoomStopCapture(int i);

    public abstract void setBeautyValues(BeautyValues beautyValues);

    public abstract void setBokeh(boolean z);

    public abstract void setBurstShotSpeed(int i);

    public abstract void setCameraAI30(boolean z);

    public abstract void setColorEffect(int i);

    public abstract void setContrast(int i);

    public abstract void setCustomAWB(int i);

    public abstract void setDeviceOrientation(int i);

    public abstract void setDisplayOrientation(int i);

    public abstract void setDualCamWaterMarkEnable(boolean z);

    public abstract void setEnableEIS(boolean z);

    public abstract void setEnableOIS(boolean z);

    public abstract void setEnableZsl(boolean z);

    public abstract void setExposureCompensation(int i);

    public abstract void setExposureMeteringMode(int i);

    public abstract void setExposureTime(long j);

    public abstract void setEyeLight(int i);

    public abstract void setFNumber(String str);

    public abstract void setFaceAgeAnalyze(boolean z);

    public abstract void setFaceScore(boolean z);

    public abstract void setFaceWaterMarkEnable(boolean z);

    public abstract void setFaceWaterMarkFormat(String str);

    public abstract void setFlashMode(int i);

    public abstract void setFocusDistance(float f);

    public abstract void setFocusMode(int i);

    public abstract void setFpsRange(Range<Integer> range);

    public abstract void setFrontMirror(boolean z);

    public abstract void setGpsLocation(Location location);

    public abstract void setHDR(boolean z);

    public abstract void setHDRCheckerEnable(boolean z);

    public abstract void setHHT(boolean z);

    public abstract void setISO(int i);

    public abstract void setJpegQuality(int i);

    public abstract void setJpegRotation(int i);

    public abstract void setJpegThumbnailSize(CameraSize cameraSize);

    public abstract void setLensDirtyDetect(boolean z);

    public abstract void setMfnr(boolean z);

    public abstract void setNeedPausePreview(boolean z);

    public abstract void setNormalWideLDC(boolean z);

    public abstract void setOpticalZoomToTele(boolean z);

    public abstract void setOptimizedFlash(boolean z);

    public abstract void setPictureFormat(int i);

    public abstract void setPictureMaxImages(int i);

    public abstract void setPictureSize(CameraSize cameraSize);

    public abstract void setPortraitLighting(int i);

    public abstract void setPreviewFormat(int i);

    public abstract void setPreviewMaxImages(int i);

    public abstract void setPreviewSize(CameraSize cameraSize);

    public abstract void setQcfaEnable(boolean z);

    public abstract void setSaturation(int i);

    public abstract void setSceneMode(int i);

    public abstract void setSharpness(int i);

    public abstract void setShotSavePath(String str);

    public abstract void setShotType(int i);

    public abstract void setSubPictureSize(CameraSize cameraSize);

    public abstract void setSuperResolution(boolean z);

    public abstract void setSwMfnr(boolean z);

    public abstract void setTimeWaterMarkEnable(boolean z);

    public abstract void setTimeWatermarkValue(String str);

    public abstract void setUltraWideLDC(boolean z);

    public abstract <T> void setVendorSetting(Key<T> key, T t);

    public abstract void setVideoFpsRange(Range<Integer> range);

    public abstract void setVideoSnapshotSize(CameraSize cameraSize);

    public abstract void setZoomRatio(float f);

    public abstract void startFaceDetection();

    public abstract void startFocus(FocusTask focusTask, int i);

    public abstract void startHighSpeedRecordPreview();

    public abstract void startHighSpeedRecordSession(@NonNull Surface surface, @NonNull Surface surface2, Range<Integer> range, CameraPreviewCallback cameraPreviewCallback);

    public abstract void startHighSpeedRecording();

    public abstract void startObjectTrack(RectF rectF);

    public abstract void startPreviewCallback(@NonNull PreviewCallback previewCallback);

    public abstract void startPreviewSession(Surface surface, boolean z, boolean z2, int i, boolean z3, CameraPreviewCallback cameraPreviewCallback);

    public abstract void startPreviewSession(@Nullable Surface surface, boolean z, boolean z2, int i, boolean z3, CameraPreviewCallback cameraPreviewCallback, Handler handler);

    public abstract void startRecordPreview();

    public abstract void startRecordSession(@NonNull Surface surface, @NonNull Surface surface2, boolean z, int i, CameraPreviewCallback cameraPreviewCallback);

    public abstract void startRecording();

    public abstract void stopFaceDetection();

    public abstract void stopObjectTrack();

    public abstract void stopPreviewCallback(boolean z);

    public abstract void stopRecording(VideoRecordStateCallback videoRecordStateCallback);

    public abstract void takePicture(@NonNull PictureCallback pictureCallback, @NonNull ParallelCallback parallelCallback);

    public abstract void unlockExposure();

    public abstract boolean updateDeferPreviewSession(Surface surface);

    public Camera2Proxy(int i) {
        this.mCameraId = i;
    }

    public int getId() {
        return this.mCameraId;
    }

    public void setErrorCallback(@Nullable CameraErrorCallback cameraErrorCallback) {
        this.mErrorCallback = cameraErrorCallback;
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(super.toString());
        stringBuilder.append(" - cameraId=");
        stringBuilder.append(getId());
        return stringBuilder.toString();
    }

    protected void notifyOnError(int i) {
        if (this.mErrorCallback != null) {
            this.mErrorCallback.onCameraError(this, i);
        }
    }

    void setPictureCallback(PictureCallback pictureCallback) {
        synchronized (this.mCallbackLock) {
            this.mPictureCallBack = pictureCallback;
        }
    }

    PictureCallback getPictureCallback() {
        PictureCallback pictureCallback;
        synchronized (this.mCallbackLock) {
            pictureCallback = this.mPictureCallBack;
        }
        return pictureCallback;
    }

    void setPreviewCallback(PreviewCallback previewCallback) {
        synchronized (this.mCallbackLock) {
            this.mPreviewCallback = previewCallback;
        }
    }

    PreviewCallback getPreviewCallback() {
        PreviewCallback previewCallback;
        synchronized (this.mCallbackLock) {
            previewCallback = this.mPreviewCallback;
        }
        return previewCallback;
    }

    void setParallelCallback(ParallelCallback parallelCallback) {
        synchronized (this.mCallbackLock) {
            this.mParallelCallback = parallelCallback;
        }
    }

    ParallelCallback getParallelCallback() {
        ParallelCallback parallelCallback;
        synchronized (this.mCallbackLock) {
            parallelCallback = this.mParallelCallback;
        }
        return parallelCallback;
    }

    public void setScreenLightCallback(ScreenLightCallback screenLightCallback) {
        synchronized (this.mCallbackLock) {
            this.mScreenLightCallback = screenLightCallback;
        }
    }

    ScreenLightCallback getScreenLightCallback() {
        ScreenLightCallback screenLightCallback;
        synchronized (this.mCallbackLock) {
            screenLightCallback = this.mScreenLightCallback;
        }
        return screenLightCallback;
    }

    public void setFocusCallback(FocusCallback focusCallback) {
        synchronized (this.mCallbackLock) {
            this.mFocusCallback = focusCallback;
        }
    }

    FocusCallback getFocusCallback() {
        FocusCallback focusCallback;
        synchronized (this.mCallbackLock) {
            focusCallback = this.mFocusCallback;
        }
        return focusCallback;
    }

    public void setMetaDataCallback(CameraMetaDataCallback cameraMetaDataCallback) {
        synchronized (this.mCallbackLock) {
            this.mMetadataCallback = cameraMetaDataCallback;
        }
    }

    CameraMetaDataCallback getMetadataCallback() {
        CameraMetaDataCallback cameraMetaDataCallback;
        synchronized (this.mCallbackLock) {
            cameraMetaDataCallback = this.mMetadataCallback;
        }
        return cameraMetaDataCallback;
    }

    public void setRawCallBack(PictureCallback pictureCallback) {
        synchronized (this.mCallbackLock) {
            this.mRawCallBack = pictureCallback;
        }
    }

    public PictureCallback getRawCallBack() {
        PictureCallback pictureCallback;
        synchronized (this.mCallbackLock) {
            pictureCallback = this.mRawCallBack;
        }
        return pictureCallback;
    }
}
