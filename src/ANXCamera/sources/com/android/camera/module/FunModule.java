package com.android.camera.module;

import android.content.ContentValues;
import android.content.Intent;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.SurfaceTexture;
import android.hardware.camera2.CameraCaptureSession;
import android.os.CountDownTimer;
import android.os.SystemClock;
import android.provider.MiuiSettings.ScreenEffect;
import android.support.annotation.MainThread;
import android.telephony.TelephonyManager;
import android.util.Range;
import android.view.Surface;
import com.android.camera.AutoLockManager;
import com.android.camera.CameraSettings;
import com.android.camera.CameraSize;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.constant.AutoFocus;
import com.android.camera.constant.UpdateConstant;
import com.android.camera.constant.UpdateConstant.UpdateType;
import com.android.camera.data.DataRepository;
import com.android.camera.effect.EffectController;
import com.android.camera.effect.draw_mode.DrawExtTexAttribute;
import com.android.camera.log.Log;
import com.android.camera.module.encoder.MediaAudioEncoder;
import com.android.camera.module.encoder.MediaEncoder;
import com.android.camera.module.encoder.MediaEncoder.MediaEncoderListener;
import com.android.camera.module.encoder.MediaMuxerWrapper;
import com.android.camera.module.encoder.MediaVideoEncoder;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.BackStack;
import com.android.camera.protocol.ModeProtocol.FilterProtocol;
import com.android.camera.protocol.ModeProtocol.RecordState;
import com.android.camera.protocol.ModeProtocol.StickerProtocol;
import com.android.camera.protocol.ModeProtocol.TopAlert;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera.storage.Storage;
import com.android.camera.ui.PopupManager;
import com.android.camera.ui.V6CameraGLSurfaceView;
import com.android.camera2.CameraCapabilities;
import com.android.gallery3d.ui.GLCanvasImpl;
import java.io.FileDescriptor;
import java.util.ArrayList;

public class FunModule extends VideoBase implements FilterProtocol, StickerProtocol {
    private static final int FRAME_RATE = 30;
    private static final long START_OFFSET_MS = 450;
    private V6CameraGLSurfaceView mCameraView;
    private CountDownTimer mCountDownTimer;
    private MediaMuxerWrapper mLastMuxer;
    private MediaAudioEncoder mMediaAudioEncoder;
    private final MediaEncoderListener mMediaEncoderListener;
    private MediaVideoEncoder mMediaVideoEncoder;
    private MediaMuxerWrapper mMuxer;
    private ArrayList<SaveVideoTask> mPendingSaveTaskList;
    private int mQuality;
    private long mRequestStartTime;

    private final class SaveVideoTask {
        public ContentValues contentValues;
        public String videoPath;

        public SaveVideoTask(String str, ContentValues contentValues) {
            this.videoPath = str;
            this.contentValues = contentValues;
        }
    }

    public FunModule() {
        super(FunModule.class.getSimpleName());
        this.mPendingSaveTaskList = new ArrayList();
        this.mMediaEncoderListener = new MediaEncoderListener() {
            public void onPrepared(MediaEncoder mediaEncoder) {
                String str = VideoBase.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onPrepared: encoder=");
                stringBuilder.append(mediaEncoder);
                Log.v(str, stringBuilder.toString());
            }

            public void onStopped(MediaEncoder mediaEncoder, boolean z) {
                String str = VideoBase.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onStopped: encoder=");
                stringBuilder.append(mediaEncoder);
                Log.v(str, stringBuilder.toString());
                if (z) {
                    FunModule.this.executeSaveTask(true);
                }
            }
        };
        this.mOutputFormat = 2;
    }

    public void registerProtocol() {
        super.registerProtocol();
        ModeCoordinatorImpl.getInstance().attachProtocol(161, this);
        ModeCoordinatorImpl.getInstance().attachProtocol(167, this);
        ModeCoordinatorImpl.getInstance().attachProtocol(165, this);
        ModeCoordinatorImpl.getInstance().attachProtocol(178, this);
        ModeCoordinatorImpl.getInstance().attachProtocol(169, this);
        ModeCoordinatorImpl.getInstance().attachProtocol(199, this);
        getActivity().getImplFactory().initAdditional(getActivity(), 164, 212);
    }

    public void unRegisterProtocol() {
        super.unRegisterProtocol();
        ModeCoordinatorImpl.getInstance().detachProtocol(161, this);
        ModeCoordinatorImpl.getInstance().detachProtocol(167, this);
        ModeCoordinatorImpl.getInstance().detachProtocol(165, this);
        ModeCoordinatorImpl.getInstance().detachProtocol(178, this);
        ModeCoordinatorImpl.getInstance().detachProtocol(169, this);
        ModeCoordinatorImpl.getInstance().detachProtocol(199, this);
        getActivity().getImplFactory().detachAdditional();
    }

    public void onPreviewLayoutChanged(Rect rect) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("onPreviewLayoutChanged: ");
        stringBuilder.append(rect);
        Log.v(str, stringBuilder.toString());
        this.mActivity.onLayoutChange(rect);
        if (this.mFocusManager != null) {
            this.mFocusManager.setRenderSize(this.mActivity.getCameraScreenNail().getRenderWidth(), this.mActivity.getCameraScreenNail().getRenderHeight());
            this.mFocusManager.setPreviewSize(rect.width(), rect.height());
        }
    }

    public void onFilterChanged(int i, int i2) {
        updatePreferenceTrampoline(2);
        this.mMainProtocol.updateEffectViewVisible();
    }

    public void onStickerChanged(String str) {
        String str2 = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("onStickerChanged: ");
        stringBuilder.append(str);
        Log.v(str2, stringBuilder.toString());
        if (this.mCameraView != null) {
            GLCanvasImpl gLCanvas = this.mCameraView.getGLCanvas();
            if (gLCanvas instanceof GLCanvasImpl) {
                gLCanvas.setSticker(str);
            }
        }
    }

    public void onCreate(int i, int i2) {
        super.onCreate(i, i2);
        changeConflictPreference();
        setCaptureIntent(this.mActivity.getCameraIntentManager().isVideoCaptureIntent());
        this.mActivity.getSensorStateManager().setSensorStateListener(this.mSensorStateListener);
        this.mCameraView = this.mActivity.getGLView();
        enableCameraControls(false);
        this.mTelephonyManager = (TelephonyManager) this.mActivity.getSystemService("phone");
        this.mVideoFocusMode = AutoFocus.LEGACY_CONTINUOUS_VIDEO;
        onCameraOpened();
    }

    protected void onCameraOpened() {
        super.onCameraOpened();
        readVideoPreferences();
        initializeFocusManager();
        updatePreferenceTrampoline(UpdateConstant.FUN_TYPES_INIT);
        startPreview();
    }

    public void onShutterButtonFocus(boolean z, int i) {
    }

    public void onShutterButtonClick(int i) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("onShutterButtonClick  isRecording=");
        stringBuilder.append(this.mMediaRecorderRecording);
        stringBuilder.append(" inStartingFocusRecording=");
        stringBuilder.append(this.mInStartingFocusRecording);
        Log.v(str, stringBuilder.toString());
        this.mInStartingFocusRecording = false;
        this.mLastBackPressedTime = 0;
        if (isIgnoreTouchEvent()) {
            Log.w(TAG, "onShutterButtonClick: ignore touch event");
        } else if (!isFrontCamera() || !this.mActivity.isScreenSlideOff()) {
            RecordState recordState = (RecordState) ModeCoordinatorImpl.getInstance().getAttachProtocol(212);
            if (this.mMediaRecorderRecording) {
                stopVideoRecording(true, false);
            } else {
                recordState.onPrepare();
                if (checkCallingState()) {
                    this.mActivity.getScreenHint().updateHint();
                    if (Storage.isLowStorageAtLastPoint()) {
                        recordState.onFailed();
                        return;
                    }
                    setTriggerMode(i);
                    enableCameraControls(false);
                    playCameraSound(2);
                    this.mRequestStartTime = System.currentTimeMillis();
                    if (this.mFocusManager.canRecord()) {
                        startVideoRecording();
                    } else {
                        Log.v(TAG, "wait for autoFocus");
                        this.mInStartingFocusRecording = true;
                    }
                } else {
                    recordState.onFailed();
                }
            }
        }
    }

    public void onSharedPreferenceChanged() {
        if (!this.mPaused && this.mCamera2Device != null) {
            readVideoPreferences();
        }
    }

    protected void readVideoPreferences() {
        this.mMaxVideoDurationInMs = 15450;
    }

    protected void resizeForPreviewAspectRatio() {
        if (((this.mCameraCapabilities.getSensorOrientation() - Util.getDisplayRotation(this.mActivity)) + ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT) % 180 == 0) {
            this.mMainProtocol.setPreviewAspectRatio(((float) this.mPreviewSize.height) / ((float) this.mPreviewSize.width));
        } else {
            this.mMainProtocol.setPreviewAspectRatio(((float) this.mPreviewSize.width) / ((float) this.mPreviewSize.height));
        }
    }

    public void onPause() {
        super.onPause();
        waitStereoSwitchThread();
        releaseResources();
        updateStereoSettings(false);
        closeVideoFileDescriptor();
        this.mActivity.getSensorStateManager().reset();
        stopFaceDetection(true);
        resetScreenOn();
        this.mHandler.removeCallbacksAndMessages(null);
        if (!this.mActivity.isActivityPaused() && !CameraSettings.isStereoModeOn()) {
            PopupManager.getInstance(this.mActivity).notifyShowPopup(null, 1);
        }
    }

    public void onStop() {
        super.onStop();
        EffectController.getInstance().setCurrentSticker(null);
    }

    public void onDestroy() {
        super.onDestroy();
        this.mHandler.sendEmptyMessage(45);
    }

    private void setVideoSize(int i, int i2) {
        if (this.mCameraDisplayOrientation % 180 == 0) {
            this.mVideoSize = new CameraSize(i, i2);
        } else {
            this.mVideoSize = new CameraSize(i2, i);
        }
    }

    public void startPreview() {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("startPreview: ");
        stringBuilder.append(this.mPreviewing);
        Log.d(str, stringBuilder.toString());
        if (isDeviceAlive()) {
            checkDisplayOrientation();
            setVideoSize(this.mPreviewSize.width, this.mPreviewSize.height);
            this.mQuality = Util.convertSizeToQuality(this.mPreviewSize);
            this.mCamera2Device.setPictureSize(this.mPreviewSize);
            this.mCamera2Device.setErrorCallback(this.mErrorCallback);
            this.mSurfaceCreatedTimestamp = this.mActivity.getCameraScreenNail().getSurfaceCreatedTimestamp();
            this.mCamera2Device.startPreviewSession(new Surface(this.mActivity.getCameraScreenNail().getSurfaceTexture()), false, false, getOperatingMode(), false, this);
            this.mFocusManager.resetFocused();
            this.mPreviewing = true;
        }
    }

    public void pausePreview() {
        Log.v(TAG, "pausePreview");
        this.mPreviewing = false;
        if (this.mCamera2Device != null) {
            this.mCamera2Device.pausePreview();
        }
        if (this.mFocusManager != null) {
            this.mFocusManager.resetFocused();
        }
    }

    public void resumePreview() {
        Log.v(TAG, "resumePreview");
        this.mPreviewing = true;
        if (this.mCamera2Device != null) {
            this.mCamera2Device.resumePreview();
        }
    }

    @MainThread
    protected void onPreviewStart() {
        if (this.mPreviewing) {
            this.mMainProtocol.initializeFocusView(this);
            onShutterButtonFocus(true, 3);
        }
    }

    private boolean initializeRecorder() {
        if (this.mCamera2Device == null) {
            Log.e(TAG, "initializeRecorder: null camera");
            return false;
        }
        String convertToFilePath;
        Log.v(TAG, "initializeRecorder");
        closeVideoFileDescriptor();
        if (isCaptureIntent()) {
            parseIntent(this.mActivity.getIntent());
        }
        if (this.mVideoFileDescriptor != null) {
            convertToFilePath = convertToFilePath(this.mVideoFileDescriptor.getFileDescriptor());
        } else {
            this.mCurrentVideoValues = genContentValues(this.mOutputFormat, -1);
            this.mCurrentVideoFilename = this.mCurrentVideoValues.getAsString("_data");
            convertToFilePath = this.mCurrentVideoFilename;
        }
        this.mOrientationCompensationAtRecordStart = this.mOrientationCompensation;
        try {
            releaseLastMediaRecorder();
            this.mMuxer = new MediaMuxerWrapper(convertToFilePath);
            this.mMediaVideoEncoder = new MediaVideoEncoder(getActivity().getGLView().getEGLContext14(), this.mMuxer, this.mMediaEncoderListener, this.mVideoSize.width, this.mVideoSize.height);
            this.mMediaAudioEncoder = new MediaAudioEncoder(this.mMuxer, this.mMediaEncoderListener);
            this.mMuxer.prepare();
            convertToFilePath = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("rotation: ");
            stringBuilder.append(this.mOrientationCompensation);
            Log.d(convertToFilePath, stringBuilder.toString());
            this.mMuxer.setOrientationHint(this.mOrientationCompensation);
            return true;
        } catch (Throwable e) {
            Log.e(TAG, "initializeRecorder: ", e);
            return false;
        }
    }

    private String convertToFilePath(FileDescriptor fileDescriptor) {
        return null;
    }

    private void releaseLastMediaRecorder() {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("releaseLastMediaRecorder ");
        stringBuilder.append(this.mLastMuxer != null);
        Log.d(str, stringBuilder.toString());
        if (this.mLastMuxer != null) {
            this.mLastMuxer.join();
            this.mLastMuxer = null;
        }
    }

    private void releaseMediaRecorder() {
        Log.v(TAG, "releaseMediaRecorder");
        if (this.mMuxer != null) {
            this.mLastMuxer = this.mMuxer;
            cleanupEmptyFile();
        }
    }

    private void addSaveTask(String str, ContentValues contentValues) {
        SaveVideoTask saveVideoTask = new SaveVideoTask(str, contentValues);
        synchronized (this) {
            this.mPendingSaveTaskList.add(saveVideoTask);
        }
    }

    private void executeSaveTask(boolean z) {
        synchronized (this) {
            while (!this.mPendingSaveTaskList.isEmpty()) {
                SaveVideoTask saveVideoTask = (SaveVideoTask) this.mPendingSaveTaskList.remove(0);
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("executeSaveTask: ");
                stringBuilder.append(saveVideoTask.videoPath);
                Log.d(str, stringBuilder.toString());
                this.mActivity.getImageSaver().addVideo(saveVideoTask.videoPath, saveVideoTask.contentValues, true);
                if (z) {
                    break;
                }
            }
            doLaterReleaseIfNeed();
        }
    }

    protected void startVideoRecording() {
        Log.v(TAG, "startVideoRecording");
        this.mCurrentVideoUri = null;
        silenceSounds();
        if (startRecorder()) {
            ((RecordState) ModeCoordinatorImpl.getInstance().getAttachProtocol(212)).onStart();
            Log.v(TAG, "startVideoRecording process done");
            onStartRecorderSucceed();
            return;
        }
        onStartRecorderFail();
    }

    private boolean startRecorder() {
        if (initializeRecorder()) {
            long currentTimeMillis = START_OFFSET_MS - (System.currentTimeMillis() - this.mRequestStartTime);
            if (currentTimeMillis < 0) {
                currentTimeMillis = 0;
            }
            boolean startRecording = this.mMuxer.startRecording(currentTimeMillis);
            if (!startRecording) {
                this.mMuxer.stopRecording();
                showConfirmMessage(R.string.confirm_recording_fail_title, R.string.confirm_recording_fail_recorder_busy_alert);
                releaseMediaRecorder();
            }
            return startRecording;
        }
        Log.e(TAG, "fail to initialize recorder");
        return false;
    }

    private void onStartRecorderFail() {
        enableCameraControls(true);
        this.mAudioManager.abandonAudioFocus(null);
        restoreMusicSound();
        RecordState recordState = (RecordState) ModeCoordinatorImpl.getInstance().getAttachProtocol(212);
        if (recordState != null) {
            recordState.onFailed();
        }
    }

    private void onStartRecorderSucceed() {
        enableCameraControls(true);
        this.mActivity.sendBroadcast(new Intent(VideoBase.START_VIDEO_RECORDING_ACTION));
        this.mMediaRecorderRecording = true;
        this.mRecordingStartTime = SystemClock.uptimeMillis();
        this.mTelephonyManager.listen(this.mPhoneStateListener, 32);
        Log.v(TAG, "listen call state");
        updateRecordingTime();
        keepScreenOn();
        AutoLockManager.getInstance(this.mActivity).removeMessage();
        trackGeneralInfo(1, false);
    }

    public void stopVideoRecording(boolean z, boolean z2) {
        if (this.mInStartingFocusRecording) {
            this.mInStartingFocusRecording = false;
            ((RecordState) ModeCoordinatorImpl.getInstance().getAttachProtocol(212)).onFinish();
        }
        if (this.mMediaRecorderRecording) {
            if (is3ALocked()) {
                unlockAEAF();
            }
            this.mMediaRecorderRecording = false;
            long uptimeMillis = SystemClock.uptimeMillis() - this.mRecordingStartTime;
            this.mMuxer.stopRecording();
            if (!this.mPaused) {
                playCameraSound(3);
            }
            releaseMediaRecorder();
            int i = this.mCurrentVideoFilename == null ? 1 : false;
            if (i == 0 && uptimeMillis < 1000) {
                deleteVideoFile(this.mCurrentVideoFilename);
                i = 1;
            }
            if (i == 0) {
                addSaveTask(this.mCurrentVideoFilename, this.mCurrentVideoValues);
            }
            this.mActivity.sendBroadcast(new Intent(VideoBase.STOP_VIDEO_RECORDING_ACTION));
            this.mTelephonyManager.listen(this.mPhoneStateListener, 0);
            Log.v(TAG, "listen none");
            animateHold();
            if (this.mCountDownTimer != null) {
                this.mCountDownTimer.cancel();
            }
            ((RecordState) ModeCoordinatorImpl.getInstance().getAttachProtocol(212)).onFinish();
            if (this.mCamera2Device != null) {
                CameraStatUtil.trackVideoRecorded(isFrontCamera(), CameraSettings.VIDEO_MODE_FUN, this.mQuality, this.mCamera2Device.getFlashMode(), 30, 0, this.mBeautyValues, uptimeMillis);
            }
            if (!(z2 || AutoFocus.LEGACY_CONTINUOUS_VIDEO.equals(this.mVideoFocusMode))) {
                this.mMainProtocol.clearFocusView(2);
                setVideoFocusMode(AutoFocus.LEGACY_CONTINUOUS_VIDEO, false);
                updatePreferenceInWorkThread(14);
            }
            this.mAudioManager.abandonAudioFocus(null);
            restoreMusicSound();
            keepScreenOnAwhile();
            AutoLockManager.getInstance(this.mActivity).hibernateDelayed();
        }
    }

    protected void updateRecordingTime() {
        super.updateRecordingTime();
        if (this.mMediaRecorderRecording) {
            if (this.mCountDownTimer != null) {
                this.mCountDownTimer.cancel();
            }
            this.mCountDownTimer = new CountDownTimer((long) this.mMaxVideoDurationInMs, 1000) {
                public void onTick(long j) {
                    String millisecondToTimeString = Util.millisecondToTimeString((j + 950) - FunModule.START_OFFSET_MS, false);
                    TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
                    if (topAlert != null) {
                        topAlert.updateRecordingTime(millisecondToTimeString);
                    }
                }

                public void onFinish() {
                    FunModule.this.stopVideoRecording(true, false);
                }
            };
            this.mCountDownTimer.start();
        }
    }

    private void updateVideoStabilization() {
        if (!isDeviceAlive()) {
            return;
        }
        if (CameraSettings.isVideoBokehOn() && isFrontCamera()) {
            Log.d(TAG, "videoStabilization: disabled EIS and OIS when VIDEO_BOKEH is opened");
            this.mCamera2Device.setEnableEIS(false);
            this.mCamera2Device.setEnableOIS(false);
            this.mActivity.getCameraScreenNail().setVideoStabilizationCropped(false);
            return;
        }
        this.mCamera2Device.setEnableEIS(false);
        this.mCamera2Device.setEnableOIS(true);
        this.mActivity.getCameraScreenNail().setVideoStabilizationCropped(false);
    }

    private void updateUltraWideLDC() {
        this.mCamera2Device.setUltraWideLDC(shouldApplyUltraWideLDC());
    }

    private boolean shouldApplyUltraWideLDC() {
        if (CameraSettings.shouldUltraWideVideoLDCBeVisibleInMode(this.mModuleIndex) && this.mActualCameraId == Camera2DataContainer.getInstance().getUltraWideCameraId()) {
            return CameraSettings.isUltraWideVideoLDCEnabled();
        }
        return false;
    }

    public void onSingleTapUp(int i, int i2) {
        if (!this.mPaused && this.mCamera2Device != null && this.mCamera2Device.isSessionReady() && !this.mSnapshotInProgress && isInTapableRect(i, i2)) {
            if (!isFrameAvailable()) {
                Log.w(TAG, "onSingleTapUp: frame not available");
            } else if ((!isFrontCamera() || !this.mActivity.isScreenSlideOff()) && !((BackStack) ModeCoordinatorImpl.getInstance().getAttachProtocol(171)).handleBackStackFromTapDown(i, i2)) {
                this.mMainProtocol.setFocusViewType(true);
                this.mTouchFocusStartingTime = System.currentTimeMillis();
                Point point = new Point(i, i2);
                mapTapCoordinate(point);
                unlockAEAF();
                this.mFocusManager.onSingleTapUp(point.x, point.y);
            }
        }
    }

    public boolean isNeedHapticFeedback() {
        return this.mMediaRecorderRecording ^ 1;
    }

    public boolean isNeedMute() {
        return this.mMediaRecorderRecording;
    }

    private void releaseResources() {
        closeCamera();
        releaseMediaRecorder();
        releaseLastMediaRecorder();
    }

    public void consumePreference(@UpdateType int... iArr) {
        for (int i : iArr) {
            switch (i) {
                case 1:
                    updatePictureAndPreviewSize();
                    break;
                case 2:
                    updateFilter();
                    break;
                case 3:
                    updateFocusArea();
                    break;
                case 5:
                    updateFace();
                    break;
                case 9:
                    updateAntiBanding(CameraSettings.getAntiBanding());
                    break;
                case 10:
                    updateFlashPreference();
                    break;
                case 11:
                case 20:
                case 30:
                case 34:
                case 42:
                    break;
                case 12:
                    setEvValue();
                    break;
                case 13:
                    updateBeauty();
                    break;
                case 14:
                    updateVideoFocusMode();
                    break;
                case 19:
                    updateFpsRange();
                    break;
                case 24:
                    setZoomRatio(getZoomValue());
                    break;
                case 25:
                    focusCenter();
                    break;
                case 29:
                    updateExposureMeteringMode();
                    break;
                case 31:
                    updateVideoStabilization();
                    break;
                case 35:
                    updateDeviceOrientation();
                    break;
                case 47:
                    updateUltraWideLDC();
                    break;
                default:
                    if (!DEBUG) {
                        String str = TAG;
                        StringBuilder stringBuilder = new StringBuilder();
                        stringBuilder.append("no consumer for this updateType: ");
                        stringBuilder.append(i);
                        Log.w(str, stringBuilder.toString());
                        break;
                    }
                    StringBuilder stringBuilder2 = new StringBuilder();
                    stringBuilder2.append("no consumer for this updateType: ");
                    stringBuilder2.append(i);
                    throw new RuntimeException(stringBuilder2.toString());
            }
        }
    }

    private void updatePictureAndPreviewSize() {
        this.mPreviewSize = Util.getOptimalPreviewSize(this.mModuleIndex, this.mBogusCameraId, this.mCameraCapabilities.getSupportedOutputSize(SurfaceTexture.class), (double) CameraSettings.getPreviewAspectRatio(16, 9));
        updateCameraScreenNailSize(this.mPreviewSize.width, this.mPreviewSize.height);
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("previewSize: ");
        stringBuilder.append(this.mPreviewSize);
        Log.d(str, stringBuilder.toString());
    }

    private void updateFilter() {
        int shaderEffect = CameraSettings.getShaderEffect();
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("updateFilter: 0x");
        stringBuilder.append(Integer.toHexString(shaderEffect));
        Log.v(str, stringBuilder.toString());
        EffectController.getInstance().setEffect(shaderEffect);
    }

    private void updateFpsRange() {
        this.mCamera2Device.setVideoFpsRange(new Range(Integer.valueOf(30), Integer.valueOf(30)));
        this.mCamera2Device.setFpsRange(new Range(Integer.valueOf(30), Integer.valueOf(30)));
    }

    protected int getOperatingMode() {
        if (CameraSettings.isVideoBokehOn() && isFrontCamera()) {
            return 32770;
        }
        if (this.mCameraCapabilities.isSupportVideoBeauty() && isBeautyOn()) {
            return CameraCapabilities.SESSION_OPERATION_MODE_VIDEO_BEAUTY;
        }
        if (DataRepository.dataItemFeature().ff()) {
            return CameraCapabilities.SESSION_OPERATION_MODE_MCTF;
        }
        return 0;
    }

    public void onPreviewSessionSuccess(CameraCaptureSession cameraCaptureSession) {
        super.onPreviewSessionSuccess(cameraCaptureSession);
        if (isCreated()) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("onPreviewSessionSuccess: ");
            stringBuilder.append(cameraCaptureSession);
            Log.d(str, stringBuilder.toString());
            this.mFaceDetectionEnabled = false;
            updatePreferenceInWorkThread(UpdateConstant.FUN_TYPES_ON_PREVIEW_SUCCESS);
            return;
        }
        Log.w(TAG, "onPreviewSessionSuccess: module is not ready");
    }

    public void onSurfaceTextureUpdated(DrawExtTexAttribute drawExtTexAttribute) {
        MediaVideoEncoder mediaVideoEncoder;
        synchronized (this) {
            mediaVideoEncoder = this.mMediaVideoEncoder;
            boolean z = this.mMediaRecorderRecording;
        }
        if (mediaVideoEncoder != null && z) {
            mediaVideoEncoder.frameAvailableSoon(drawExtTexAttribute);
        }
    }
}
