package com.android.camera.module;

import android.app.AlertDialog;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.hardware.SensorEvent;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CaptureResult;
import android.location.Location;
import android.media.AudioManager;
import android.net.Uri;
import android.os.Handler;
import android.os.Message;
import android.os.ParcelFileDescriptor;
import android.os.SystemClock;
import android.provider.MiuiSettings.ScreenEffect;
import android.telephony.PhoneStateListener;
import android.telephony.TelephonyManager;
import android.view.KeyEvent;
import android.view.View;
import android.widget.Toast;
import com.android.camera.BasePreferenceActivity;
import com.android.camera.CameraPreferenceActivity;
import com.android.camera.CameraSettings;
import com.android.camera.CameraSize;
import com.android.camera.ChangeManager;
import com.android.camera.FileCompat;
import com.android.camera.LocationManager;
import com.android.camera.OnClickAttr;
import com.android.camera.R;
import com.android.camera.RotateDialogController;
import com.android.camera.SensorStateManager.SensorStateListener;
import com.android.camera.ThermalDetector;
import com.android.camera.Thumbnail;
import com.android.camera.Util;
import com.android.camera.constant.AutoFocus;
import com.android.camera.constant.BeautyConstant;
import com.android.camera.data.DataRepository;
import com.android.camera.effect.EffectController;
import com.android.camera.effect.FaceAnalyzeInfo;
import com.android.camera.fragment.beauty.BeautyParameters;
import com.android.camera.fragment.beauty.BeautyValues;
import com.android.camera.log.Log;
import com.android.camera.module.loader.FunctionParseAsdFace;
import com.android.camera.module.loader.camera2.FocusManager2;
import com.android.camera.module.loader.camera2.FocusManager2.Listener;
import com.android.camera.module.loader.camera2.FocusTask;
import com.android.camera.permission.PermissionManager;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.BackStack;
import com.android.camera.protocol.ModeProtocol.BaseDelegate;
import com.android.camera.protocol.ModeProtocol.CameraAction;
import com.android.camera.protocol.ModeProtocol.OnFaceBeautyChangedProtocol;
import com.android.camera.protocol.ModeProtocol.PlayVideoProtocol;
import com.android.camera.protocol.ModeProtocol.RecordState;
import com.android.camera.statistic.CameraStat;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera.storage.Storage;
import com.android.camera2.Camera2Proxy.CameraPreviewCallback;
import com.android.camera2.Camera2Proxy.FaceDetectionCallback;
import com.android.camera2.Camera2Proxy.FocusCallback;
import com.android.camera2.CameraHardwareFace;
import com.mi.config.b;
import io.reactivex.BackpressureStrategy;
import io.reactivex.Flowable;
import io.reactivex.FlowableEmitter;
import io.reactivex.FlowableOnSubscribe;
import io.reactivex.disposables.Disposable;
import java.io.File;
import java.io.FileNotFoundException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public abstract class VideoBase extends BaseModule implements Listener, CameraAction, OnFaceBeautyChangedProtocol, PlayVideoProtocol, CameraPreviewCallback, FaceDetectionCallback, FocusCallback {
    protected static final int FILE_NUMBER_SINGLE = -1;
    private static final boolean HOLD_WHEN_SAVING_VIDEO = false;
    private static final int MILLIS_PER_MINUTE = 60000;
    private static final int MIN_BACK_RECORDING_MINUTE = 20;
    private static final int MIN_FRONT_RECORDING_MINUTE = 10;
    private static final boolean SHOW_FACE_VIEW = false;
    public static final String START_VIDEO_RECORDING_ACTION = "com.android.camera.action.start_video_recording";
    public static final String STOP_VIDEO_RECORDING_ACTION = "com.android.camera.action.stop_video_recording";
    protected static String TAG;
    private boolean m3ALocked;
    protected AudioManager mAudioManager;
    protected String mBaseFileName;
    protected BeautyValues mBeautyValues;
    protected CameraCaptureSession mCurrentSession;
    protected String mCurrentVideoFilename;
    protected Uri mCurrentVideoUri;
    protected ContentValues mCurrentVideoValues;
    private AlertDialog mDialog;
    protected boolean mFaceDetectionEnabled;
    protected boolean mFaceDetectionStarted;
    protected FocusManager2 mFocusManager;
    protected Handler mHandler;
    protected boolean mInStartingFocusRecording;
    protected long mIntentRequestSize;
    protected boolean mIsBeautyFrontOn;
    private boolean mIsSessionReady;
    private boolean mIsVideoCaptureIntent;
    protected int mMaxVideoDurationInMs;
    protected volatile boolean mMediaRecorderRecording;
    protected boolean mMediaRecorderRecordingPaused;
    private int mMessageId;
    private Disposable mMetaDataDisposable;
    private FlowableEmitter<CaptureResult> mMetaDataFlowableEmitter;
    protected long mOnResumeTime;
    protected int mOrientationCompensationAtRecordStart;
    protected int mOriginalMusicVolume;
    protected int mOutputFormat;
    protected final PhoneStateListener mPhoneStateListener = new PhoneStateListener() {
        public void onCallStateChanged(int i, String str) {
            if (i == 2 && VideoBase.this.mMediaRecorderRecording) {
                Log.w(VideoBase.TAG, "CALL_STATE_OFFHOOK");
                VideoBase.this.onStop();
            }
            super.onCallStateChanged(i, str);
        }
    };
    protected boolean mPreviewing;
    protected long mRecordingStartTime;
    protected boolean mSavePowerMode;
    protected SensorStateListener mSensorStateListener = new SensorStateListener() {
        public void onDeviceBecomeStable() {
            Log.v(VideoBase.TAG, "onDeviceBecomeStable");
        }

        public boolean isWorking() {
            return VideoBase.this.isAlive() && VideoBase.this.mPreviewing;
        }

        public void onDeviceKeepMoving(double d) {
            if (!VideoBase.this.mMainProtocol.isEvAdjusted(true) && !VideoBase.this.mPaused && Util.isTimeout(System.currentTimeMillis(), VideoBase.this.mTouchFocusStartingTime, 3000) && !VideoBase.this.is3ALocked() && VideoBase.this.mFocusManager != null && VideoBase.this.mFocusManager.isNeedCancelAutoFocus() && !VideoBase.this.isVideoRecording()) {
                VideoBase.this.mFocusManager.onDeviceKeepMoving(d);
            }
        }

        public void onDeviceBeginMoving() {
        }

        public void onDeviceKeepStable() {
        }

        public void onDeviceOrientationChanged(float f, boolean z) {
        }

        public void notifyDevicePostureChanged() {
            VideoBase.this.mActivity.getEdgeShutterView().onDevicePostureChanged();
        }

        public void onDeviceRotationChanged(float[] fArr) {
        }

        public void onSensorChanged(SensorEvent sensorEvent) {
        }
    };
    protected boolean mSnapshotInProgress;
    protected StereoSwitchThread mStereoSwitchThread;
    protected TelephonyManager mTelephonyManager;
    private int mTitleId;
    protected long mTouchFocusStartingTime;
    protected ParcelFileDescriptor mVideoFileDescriptor;
    protected String mVideoFocusMode;
    protected CameraSize mVideoSize;

    private class MainHandler extends Handler {
        private MainHandler() {
        }

        /* synthetic */ MainHandler(VideoBase videoBase, AnonymousClass1 anonymousClass1) {
            this();
        }

        public void handleMessage(Message message) {
            if (!VideoBase.this.isCreated()) {
                removeCallbacksAndMessages(null);
            } else if (VideoBase.this.getActivity() != null) {
                boolean z = false;
                switch (message.what) {
                    case 2:
                        break;
                    case 4:
                        if (!(Util.getDisplayRotation(VideoBase.this.mActivity) == VideoBase.this.mDisplayRotation || VideoBase.this.mMediaRecorderRecording)) {
                            VideoBase.this.startPreview();
                        }
                        if (SystemClock.uptimeMillis() - VideoBase.this.mOnResumeTime < 5000) {
                            VideoBase.this.mHandler.sendEmptyMessageDelayed(4, 100);
                            break;
                        }
                        break;
                    case 9:
                        VideoBase.this.onPreviewStart();
                        VideoBase.this.mStereoSwitchThread = null;
                        break;
                    case 10:
                        VideoBase.this.stopVideoRecording(true, false);
                        VideoBase.this.mOpenCameraFail = true;
                        VideoBase.this.onCameraException();
                        break;
                    case 17:
                        VideoBase.this.mHandler.removeMessages(17);
                        VideoBase.this.mHandler.removeMessages(2);
                        VideoBase.this.getWindow().addFlags(128);
                        VideoBase.this.mHandler.sendEmptyMessageDelayed(2, (long) VideoBase.this.getScreenDelay());
                        break;
                    case 35:
                        VideoBase videoBase = VideoBase.this;
                        boolean z2 = message.arg1 > 0;
                        if (message.arg2 > 0) {
                            z = true;
                        }
                        videoBase.handleUpdateFaceView(z2, z);
                        break;
                    case 40:
                        if (CameraSettings.isStereoModeOn()) {
                            VideoBase.this.updateTipMessage(6, R.string.dual_camera_use_hint, 2);
                            break;
                        }
                        break;
                    case 42:
                        VideoBase.this.updateRecordingTime();
                        break;
                    case 43:
                        VideoBase.this.restoreMusicSound();
                        break;
                    case 45:
                        VideoBase.this.setActivity(null);
                        break;
                    case 46:
                        VideoBase.this.onWaitStopCallbackTimeout();
                        break;
                    case 51:
                        VideoBase.this.stopVideoRecording(true, false);
                        if (!VideoBase.this.mActivity.isActivityPaused()) {
                            VideoBase.this.mOpenCameraFail = true;
                            VideoBase.this.onCameraException();
                            break;
                        }
                        break;
                    case 52:
                        VideoBase.this.enterSavePowerMode();
                        break;
                    case 54:
                        VideoBase.this.updateTipMessage(9, R.string.fps960_toast, 4);
                        break;
                    case 55:
                        Log.e(VideoBase.TAG, "autoFocus timeout!");
                        VideoBase.this.mFocusManager.resetFocused();
                        VideoBase.this.onWaitingFocusFinished();
                        break;
                    default:
                        StringBuilder stringBuilder;
                        if (!BaseModule.DEBUG) {
                            String str = VideoBase.TAG;
                            stringBuilder = new StringBuilder();
                            stringBuilder.append("no consumer for this message: ");
                            stringBuilder.append(message.what);
                            Log.e(str, stringBuilder.toString());
                            break;
                        }
                        stringBuilder = new StringBuilder();
                        stringBuilder.append("no consumer for this message: ");
                        stringBuilder.append(message.what);
                        throw new RuntimeException(stringBuilder.toString());
                }
                VideoBase.this.getWindow().clearFlags(128);
            }
        }
    }

    protected class StereoSwitchThread extends Thread {
        private volatile boolean mCancelled;

        protected StereoSwitchThread() {
        }

        public void cancel() {
            this.mCancelled = true;
        }

        public void run() {
            VideoBase.this.closeCamera();
            if (!this.mCancelled) {
                VideoBase.this.openCamera();
                if (VideoBase.this.hasCameraException()) {
                    VideoBase.this.onCameraException();
                } else if (!this.mCancelled) {
                    CameraSettings.resetZoom();
                    CameraSettings.resetExposure();
                    VideoBase.this.onCameraOpened();
                    VideoBase.this.readVideoPreferences();
                    VideoBase.this.resizeForPreviewAspectRatio();
                    if (!this.mCancelled) {
                        VideoBase.this.startPreview();
                        VideoBase.this.onPreviewStart();
                        VideoBase.this.mHandler.sendEmptyMessage(9);
                    }
                }
            }
        }
    }

    protected void onCameraOpened() {
        super.onCameraOpened();
        this.mIsBeautyFrontOn = BeautyParameters.isFaceBeautyOn();
        initMetaParser();
    }

    private void initMetaParser() {
        this.mMetaDataDisposable = Flowable.create(new FlowableOnSubscribe<CaptureResult>() {
            public void subscribe(FlowableEmitter<CaptureResult> flowableEmitter) throws Exception {
                VideoBase.this.mMetaDataFlowableEmitter = flowableEmitter;
            }
        }, BackpressureStrategy.DROP).map(new FunctionParseAsdFace(this, isFrontCamera())).subscribe();
    }

    public void onPause() {
        super.onPause();
    }

    private void handleUpdateFaceView(boolean z, boolean z2) {
        boolean isFrontCamera = isFrontCamera();
        if (!z) {
            this.mMainProtocol.updateFaceView(z, z2, isFrontCamera, false, -1);
        } else if (this.mFaceDetectionStarted && this.mCamera2Device != null && 1 != this.mCamera2Device.getFocusMode()) {
            this.mMainProtocol.updateFaceView(z, true, isFrontCamera, true, this.mCameraDisplayOrientation);
        }
    }

    public VideoBase(String str) {
        TAG = str;
        this.mHandler = new MainHandler(this, null);
    }

    protected void initializeCapabilities() {
        super.initializeCapabilities();
        this.mContinuousFocusSupported = Util.isSupported(3, this.mCameraCapabilities.getSupportedFocusModes());
    }

    public void onPreviewSizeChanged(int i, int i2) {
        Log.v(TAG, String.format(Locale.ENGLISH, "onPreviewSizeChanged: %dx%d", new Object[]{Integer.valueOf(i), Integer.valueOf(i2)}));
        if (this.mFocusManager != null) {
            this.mFocusManager.setPreviewSize(i, i2);
        }
    }

    public void onResume() {
        super.onResume();
        if (!isVideoRecording() && !this.mOpenCameraFail && !this.mCameraDisabled && PermissionManager.checkCameraLaunchPermissions()) {
            updateStereoSettings(true);
            if (!this.mPreviewing) {
                startPreview();
            }
            this.mHandler.sendEmptyMessage(9);
            keepScreenOnAwhile();
            onSettingsBack();
            if (this.mPreviewing) {
                this.mOnResumeTime = SystemClock.uptimeMillis();
                this.mHandler.sendEmptyMessageDelayed(4, 100);
            }
        }
    }

    public void setFrameAvailable(boolean z) {
        super.setFrameAvailable(z);
        if (z && CameraSettings.isCameraSoundOpen()) {
            this.mActivity.loadCameraSound(1);
            this.mActivity.loadCameraSound(0);
            this.mActivity.loadCameraSound(2);
            this.mActivity.loadCameraSound(3);
        }
    }

    public boolean isCaptureIntent() {
        return this.mIsVideoCaptureIntent;
    }

    protected void setCaptureIntent(boolean z) {
        this.mIsVideoCaptureIntent = z;
    }

    protected void parseIntent(Intent intent) {
        if (intent.getExtras() != null) {
            this.mIntentRequestSize = this.mActivity.getCameraIntentManager().getRequestSize();
            Uri extraSavedUri = this.mActivity.getCameraIntentManager().getExtraSavedUri();
            if (extraSavedUri != null) {
                try {
                    this.mVideoFileDescriptor = this.mContentResolver.openFileDescriptor(extraSavedUri, "rw");
                    this.mCurrentVideoUri = extraSavedUri;
                    String str = TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("parseIntent: outputUri=");
                    stringBuilder.append(extraSavedUri);
                    Log.d(str, stringBuilder.toString());
                } catch (FileNotFoundException e) {
                    Log.e(TAG, e.getMessage());
                }
            }
        }
    }

    public void checkDisplayOrientation() {
        if (isCreated()) {
            super.checkDisplayOrientation();
            if (this.mFocusManager != null) {
                this.mFocusManager.setDisplayOrientation(this.mCameraDisplayOrientation);
            }
            if (this.mCamera2Device != null) {
                this.mCamera2Device.setDisplayOrientation(this.mCameraDisplayOrientation);
            }
            this.mMainProtocol.setCameraDisplayOrientation(this.mCameraDisplayOrientation);
        }
    }

    public void onUserInteraction() {
        super.onUserInteraction();
        if (!this.mMediaRecorderRecording) {
            keepScreenOnAwhile();
        }
    }

    protected void keepScreenOnAwhile() {
        this.mHandler.sendEmptyMessageDelayed(17, 1000);
    }

    protected void keepScreenOn() {
        this.mHandler.removeMessages(17);
        this.mHandler.removeMessages(2);
        this.mHandler.removeMessages(52);
        getWindow().addFlags(128);
    }

    protected void resetScreenOn() {
        this.mHandler.removeMessages(17);
        this.mHandler.removeMessages(2);
        this.mHandler.removeMessages(52);
    }

    protected void keepPowerSave() {
        Log.d(TAG, "keepPowerSave");
        exitSavePowerMode();
        this.mHandler.sendEmptyMessageDelayed(52, 1500000);
    }

    protected void enterSavePowerMode() {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("currentBrightness: ");
        stringBuilder.append(this.mActivity.getCurrentBrightness());
        Log.d(str, stringBuilder.toString());
        if (this.mActivity != null && this.mActivity.getCurrentBrightness() == 255) {
            Log.d(TAG, "enterSavePowerMode");
            this.mHandler.post(new Runnable() {
                public void run() {
                    if (VideoBase.this.mActivity != null) {
                        VideoBase.this.mActivity.setWindowBrightness(81);
                        VideoBase.this.mSavePowerMode = true;
                    }
                }
            });
        }
    }

    protected void exitSavePowerMode() {
        this.mHandler.removeMessages(52);
        if (this.mSavePowerMode) {
            Log.d(TAG, "exitSavePowerMode");
            this.mHandler.post(new Runnable() {
                public void run() {
                    if (VideoBase.this.mActivity != null) {
                        VideoBase.this.mActivity.restoreWindowBrightness();
                        VideoBase.this.mSavePowerMode = false;
                    }
                }
            });
        }
    }

    public void onWindowFocusChanged(boolean z) {
        super.onWindowFocusChanged(z);
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("onWindowFocusChanged: ");
        stringBuilder.append(z);
        Log.d(str, stringBuilder.toString());
        if (!this.mMediaRecorderRecording) {
            return;
        }
        if (z) {
            keepPowerSave();
        } else {
            exitSavePowerMode();
        }
    }

    protected void performVolumeKeyClicked(String str, int i, boolean z) {
        if (i == 0 && z) {
            restoreBottom();
            if (isIgnoreTouchEvent()) {
                Log.w(TAG, "ignore volume key");
                return;
            }
            onShutterButtonClick(20);
        }
    }

    public boolean onKeyDown(int i, KeyEvent keyEvent) {
        if (this.mPaused) {
            return true;
        }
        boolean z = false;
        if (!isFrameAvailable()) {
            return false;
        }
        switch (i) {
            case 24:
            case 25:
            case 87:
            case 88:
                if (i == 24 || i == 88) {
                    z = true;
                }
                if (handleVolumeKeyEvent(z, true, keyEvent.getRepeatCount())) {
                    return true;
                }
                break;
            case 27:
            case 66:
                if (keyEvent.getRepeatCount() == 0) {
                    restoreBottom();
                    if (!Util.isFingerPrintKeyEvent(keyEvent)) {
                        onShutterButtonClick(40);
                    } else if (CameraSettings.isFingerprintCaptureEnable()) {
                        onShutterButtonClick(30);
                    }
                    return true;
                }
                break;
            case Util.KEYCODE_SLIDE_ON /*700*/:
                if (isVideoRecording() && !isPostProcessing()) {
                    if (isBackCamera()) {
                        stopVideoRecording(true, false);
                        break;
                    }
                    return false;
                }
            case Util.KEYCODE_SLIDE_OFF /*701*/:
                if (isVideoRecording() && !isPostProcessing()) {
                    if (isFrontCamera()) {
                        stopVideoRecording(true, false);
                        break;
                    }
                    return false;
                }
        }
        return super.onKeyDown(i, keyEvent);
    }

    public boolean onKeyUp(int i, KeyEvent keyEvent) {
        if (i != 4) {
            if (i == 27 || i == 66) {
                return true;
            }
        } else if (((BackStack) ModeCoordinatorImpl.getInstance().getAttachProtocol(171)).handleBackStackFromKeyBack()) {
            return true;
        }
        return super.onKeyUp(i, keyEvent);
    }

    public boolean isVideoRecording() {
        return this.mMediaRecorderRecording;
    }

    public boolean shouldReleaseLater() {
        return this.mInStartingFocusRecording || isVideoRecording() || isSelectingCapturedResult();
    }

    public void notifyError() {
        if (currentIsMainThread() && isVideoRecording() && !isPostProcessing()) {
            stopVideoRecording(true, false);
        }
        super.notifyError();
    }

    public void onHostStopAndNotifyActionStop() {
        if (this.mInStartingFocusRecording) {
            this.mInStartingFocusRecording = false;
            RecordState recordState = (RecordState) ModeCoordinatorImpl.getInstance().getAttachProtocol(212);
            if (recordState != null) {
                recordState.onFinish();
            }
        }
        if (isVideoRecording() && !isPostProcessing() && isCameraSessionReady()) {
            stopVideoRecording(true, true);
        }
    }

    public void stopVideoRecording(boolean z, boolean z2) {
    }

    protected void onWaitStopCallbackTimeout() {
    }

    protected void updateRecordingTime() {
        if (isThermalThreshold() && !"0".equals(CameraSettings.getFlashMode(this.mModuleIndex))) {
            ThermalDetector.getInstance().onThermalNotification();
        }
    }

    public void closeCamera() {
        Log.v(TAG, "closeCamera");
        this.mPreviewing = false;
        this.mSnapshotInProgress = false;
        if (this.mMetaDataFlowableEmitter != null) {
            this.mMetaDataFlowableEmitter.onComplete();
        }
        if (this.mMetaDataDisposable != null) {
            this.mMetaDataDisposable.dispose();
        }
        if (this.mCamera2Device != null) {
            this.mCamera2Device.setFocusCallback(null);
            this.mCamera2Device.setErrorCallback(null);
            unlockAEAF();
            this.mCamera2Device = null;
        }
    }

    public boolean onBackPressed() {
        if (!isFrameAvailable() || this.mStereoSwitchThread != null) {
            return false;
        }
        if (this.mMediaRecorderRecording) {
            long currentTimeMillis = System.currentTimeMillis();
            if (currentTimeMillis - this.mLastBackPressedTime > 3000) {
                this.mLastBackPressedTime = currentTimeMillis;
                Toast.makeText(this.mActivity, getString(R.string.record_back_pressed_hint), 0).show();
            } else {
                stopVideoRecording(true, false);
            }
            return true;
        } else if (CameraSettings.isStereoModeOn()) {
            return true;
        } else {
            return super.onBackPressed();
        }
    }

    protected void onSettingsBack() {
        ChangeManager changeManager = CameraSettings.sCameraChangeManager;
        if (changeManager.check(3)) {
            changeManager.clear(3);
            restorePreferences();
        } else if (changeManager.check(1)) {
            changeManager.clear(1);
            onSharedPreferenceChanged();
        }
    }

    private void restorePreferences() {
        if (isZoomSupported()) {
            setZoomValue(1.0f);
        }
        onSharedPreferenceChanged();
    }

    protected boolean isZoomEnabled() {
        return (CameraSettings.isStereoModeOn() || CameraSettings.isFrontCamera() || CameraSettings.isVideoBokehOn()) ? false : true;
    }

    protected void readVideoPreferences() {
    }

    public void onNewIntent() {
        changeConflictPreference();
        setCaptureIntent(this.mActivity.getCameraIntentManager().isVideoCaptureIntent());
    }

    public void playVideo() {
        startPlayVideoActivity();
    }

    private void startPlayVideoActivity() {
        Intent intent = new Intent("android.intent.action.VIEW");
        intent.setDataAndType(this.mCurrentVideoUri, Util.convertOutputFormatToMimeType(this.mOutputFormat));
        intent.setFlags(1);
        try {
            this.mActivity.startActivity(intent);
        } catch (Throwable e) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("failed to view video ");
            stringBuilder.append(this.mCurrentVideoUri);
            Log.e(str, stringBuilder.toString(), e);
        }
    }

    public void onShutterButtonClick(int i) {
    }

    public boolean onShutterButtonLongClick() {
        Log.v(TAG, "onShutterButtonLongClick");
        return false;
    }

    public void onShutterButtonFocus(boolean z, int i) {
    }

    public void onShutterButtonLongClickCancel(boolean z) {
        onShutterButtonFocus(false, 2);
    }

    public boolean isDoingAction() {
        return this.mMediaRecorderRecording && !this.mMediaRecorderRecordingPaused;
    }

    public boolean isUnInterruptable() {
        this.mUnInterruptableReason = null;
        if (isPostProcessing()) {
            this.mUnInterruptableReason = "post process";
        }
        return this.mUnInterruptableReason != null;
    }

    @OnClickAttr
    public void onThumbnailClicked(View view) {
        if (!this.mMediaRecorderRecording && this.mActivity.getThumbnailUpdater().getThumbnail() != null) {
            this.mActivity.gotoGallery();
        }
    }

    @OnClickAttr
    public void onReviewPlayClicked(View view) {
        startPlayVideoActivity();
    }

    @OnClickAttr
    public void onReviewDoneClicked() {
        doReturnToCaller(true);
    }

    @OnClickAttr
    public void onReviewCancelClicked() {
        if (isSelectingCapturedResult()) {
            deleteCurrentVideo();
            hideAlert();
            return;
        }
        stopVideoRecording(true, false);
        doReturnToCaller(false);
    }

    public boolean isSelectingCapturedResult() {
        if (isCaptureIntent() && ((BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160)).getActiveFragment(R.id.bottom_action) == 4083) {
            return true;
        }
        return false;
    }

    private Bitmap getReviewBitmap() {
        Bitmap createVideoThumbnailBitmap;
        if (this.mVideoFileDescriptor != null) {
            createVideoThumbnailBitmap = Thumbnail.createVideoThumbnailBitmap(this.mVideoFileDescriptor.getFileDescriptor(), this.mDisplayRect.width());
        } else if (this.mCurrentVideoFilename != null) {
            createVideoThumbnailBitmap = Thumbnail.createVideoThumbnailBitmap(this.mCurrentVideoFilename, this.mDisplayRect.width());
        } else {
            createVideoThumbnailBitmap = null;
        }
        if (createVideoThumbnailBitmap != null) {
            return Util.rotateAndMirror(createVideoThumbnailBitmap, -this.mOrientationCompensationAtRecordStart, isFrontCamera());
        }
        return createVideoThumbnailBitmap;
    }

    protected void showAlert() {
        pausePreview();
        this.mMainProtocol.showReviewViews(getReviewBitmap());
        enableCameraControls(false);
        ((BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160)).delegateEvent(6);
    }

    private void hideAlert() {
        if (this.mCamera2Device.isSessionReady()) {
            resumePreview();
        } else {
            startPreview();
        }
        this.mMainProtocol.hideReviewViews();
        enableCameraControls(true);
        ((BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160)).delegateEvent(6);
    }

    protected void doReturnToCaller(boolean z) {
        int i;
        Intent intent = new Intent();
        if (z) {
            i = -1;
            intent.setData(this.mCurrentVideoUri);
            intent.setFlags(1);
        } else {
            i = 0;
        }
        this.mActivity.setResult(i, intent);
        this.mActivity.finish();
    }

    protected int getCameraRotation() {
        return ((this.mOrientationCompensation - this.mDisplayRotation) + ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT) % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT;
    }

    protected ContentValues genContentValues(int i, int i2) {
        return genContentValues(i, i2, false, true);
    }

    protected ContentValues genContentValues(int i, int i2, boolean z, boolean z2) {
        String format;
        StringBuilder stringBuilder;
        String stringBuilder2;
        long currentTimeMillis = System.currentTimeMillis();
        String createName = createName(currentTimeMillis, i2);
        if (i2 > 0) {
            format = String.format(Locale.ENGLISH, "_%d", new Object[]{Integer.valueOf(i2)});
            stringBuilder = new StringBuilder();
            stringBuilder.append(createName);
            stringBuilder.append(format);
            createName = stringBuilder.toString();
        }
        StringBuilder stringBuilder3 = new StringBuilder();
        stringBuilder3.append(createName);
        stringBuilder3.append(Util.convertOutputFormatToFileExt(i));
        format = stringBuilder3.toString();
        String convertOutputFormatToMimeType = Util.convertOutputFormatToMimeType(i);
        StringBuilder stringBuilder4;
        if (z) {
            stringBuilder4 = new StringBuilder();
            stringBuilder4.append(Storage.generatePrimaryTempFile());
            stringBuilder4.append('/');
            stringBuilder4.append(format);
            stringBuilder2 = stringBuilder4.toString();
            stringBuilder = new StringBuilder();
            stringBuilder.append(Storage.generatePrimaryTempFile());
            stringBuilder.append(File.separator);
            stringBuilder.append(Storage.AVOID_SCAN_FILE_NAME);
            Util.createFile(new File(stringBuilder.toString()));
        } else if (z2) {
            stringBuilder4 = new StringBuilder();
            stringBuilder4.append(Storage.DIRECTORY);
            stringBuilder4.append('/');
            stringBuilder4.append(format);
            stringBuilder2 = stringBuilder4.toString();
        } else {
            stringBuilder2 = Storage.generatePrimaryDirectoryPath();
            Util.mkdirs(new File(stringBuilder2), 511, -1, -1);
            if (Util.isPathExist(stringBuilder2)) {
                stringBuilder2 = Storage.generatePrimaryFilepath(format);
            } else {
                stringBuilder4 = new StringBuilder();
                stringBuilder4.append(Storage.DIRECTORY);
                stringBuilder4.append('/');
                stringBuilder4.append(format);
                stringBuilder2 = stringBuilder4.toString();
            }
        }
        String str = TAG;
        stringBuilder = new StringBuilder();
        stringBuilder.append("genContentValues: path=");
        stringBuilder.append(stringBuilder2);
        Log.d(str, stringBuilder.toString());
        ContentValues contentValues = new ContentValues(8);
        contentValues.put("title", createName);
        contentValues.put("_display_name", format);
        contentValues.put("datetaken", Long.valueOf(currentTimeMillis));
        contentValues.put("mime_type", convertOutputFormatToMimeType);
        contentValues.put("_data", stringBuilder2);
        stringBuilder3 = new StringBuilder();
        stringBuilder3.append(Integer.toString(this.mVideoSize.width));
        stringBuilder3.append("x");
        stringBuilder3.append(Integer.toString(this.mVideoSize.height));
        contentValues.put("resolution", stringBuilder3.toString());
        Location currentLocation = LocationManager.instance().getCurrentLocation();
        if (!(currentLocation == null || (currentLocation.getLatitude() == 0.0d && currentLocation.getLongitude() == 0.0d))) {
            contentValues.put("latitude", Double.valueOf(currentLocation.getLatitude()));
            contentValues.put("longitude", Double.valueOf(currentLocation.getLongitude()));
        }
        return contentValues;
    }

    private String createName(long j, int i) {
        if (i > 0) {
            return this.mBaseFileName;
        }
        this.mBaseFileName = new SimpleDateFormat(getString(R.string.video_file_name_format), Locale.ENGLISH).format(new Date(j));
        return this.mBaseFileName;
    }

    protected void cleanupEmptyFile() {
        if (this.mCurrentVideoFilename != null) {
            File file = new File(this.mCurrentVideoFilename);
            String str;
            StringBuilder stringBuilder;
            if (!file.exists()) {
                str = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("no video file: ");
                stringBuilder.append(this.mCurrentVideoFilename);
                Log.d(str, stringBuilder.toString());
                this.mCurrentVideoFilename = null;
            } else if (file.length() == 0) {
                if (Storage.isUseDocumentMode()) {
                    FileCompat.deleteFile(this.mCurrentVideoFilename);
                } else {
                    file.delete();
                }
                str = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("delete empty video file: ");
                stringBuilder.append(this.mCurrentVideoFilename);
                Log.d(str, stringBuilder.toString());
                this.mCurrentVideoFilename = null;
            }
        }
    }

    protected void animateHold() {
    }

    protected void animateSlide() {
    }

    private void deleteCurrentVideo() {
        if (this.mCurrentVideoFilename != null) {
            deleteVideoFile(this.mCurrentVideoFilename);
            this.mCurrentVideoFilename = null;
            if (this.mCurrentVideoUri != null) {
                Util.safeDelete(this.mCurrentVideoUri, null, null);
                this.mCurrentVideoUri = null;
            }
        }
        this.mActivity.getScreenHint().updateHint();
    }

    protected void deleteVideoFile(String str) {
        String str2 = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("delete invalid video ");
        stringBuilder.append(str);
        Log.v(str2, stringBuilder.toString());
        if (!new File(str).delete()) {
            str2 = TAG;
            stringBuilder = new StringBuilder();
            stringBuilder.append("fail to delete ");
            stringBuilder.append(str);
            Log.v(str2, stringBuilder.toString());
        }
    }

    protected void openSettingActivity() {
        Intent intent = new Intent();
        intent.setClass(this.mActivity, CameraPreferenceActivity.class);
        intent.putExtra(BasePreferenceActivity.FROM_WHERE, this.mModuleIndex);
        intent.putExtra(":miui:starting_window_label", getResources().getString(R.string.pref_camera_settings_category));
        if (this.mActivity.startFromKeyguard()) {
            intent.putExtra("StartActivityWhenLocked", true);
        }
        this.mActivity.startActivity(intent);
        this.mActivity.setJumpFlag(2);
        CameraStatUtil.trackGotoSettings(this.mModuleIndex);
    }

    public void enterMutexMode(int i) {
        setZoomValue(1.0f);
        this.mSettingsOverrider.overrideSettings(CameraSettings.KEY_WHITE_BALANCE, null, CameraSettings.KEY_COLOR_EFFECT, null);
        onSharedPreferenceChanged();
    }

    public void exitMutexMode(int i) {
        this.mSettingsOverrider.restoreSettings();
        onSharedPreferenceChanged();
    }

    protected void closeVideoFileDescriptor() {
        if (this.mVideoFileDescriptor != null) {
            try {
                this.mVideoFileDescriptor.close();
            } catch (Throwable e) {
                Log.e(TAG, "fail to close fd", e);
            }
            this.mVideoFileDescriptor = null;
        }
    }

    protected void silenceSounds() {
        if (this.mAudioManager == null) {
            this.mAudioManager = (AudioManager) this.mActivity.getSystemService("audio");
        }
        this.mAudioManager.requestAudioFocus(null, 3, 2);
        this.mOriginalMusicVolume = this.mAudioManager.getStreamVolume(3);
        if (this.mOriginalMusicVolume != 0) {
            this.mAudioManager.setStreamMute(3, true);
            this.mHandler.sendEmptyMessageDelayed(43, 3000);
        }
    }

    protected void restoreMusicSound() {
        if (this.mOriginalMusicVolume != 0 && this.mAudioManager.getStreamVolume(3) == 0) {
            this.mAudioManager.setStreamMute(3, false);
        }
        this.mOriginalMusicVolume = 0;
        this.mHandler.removeMessages(43);
    }

    protected void updateVideoFocusMode() {
        if (this.mCamera2Device == null) {
            Log.e(TAG, "updateVideoFocusMode: null camera device");
            return;
        }
        int[] supportedFocusModes = this.mCameraCapabilities.getSupportedFocusModes();
        int convertToFocusMode = AutoFocus.convertToFocusMode(this.mVideoFocusMode);
        if (Util.isSupported(convertToFocusMode, supportedFocusModes)) {
            this.mCamera2Device.setFocusMode(convertToFocusMode);
            updateMotionFocusManager();
            updateFocusCallback();
        }
    }

    protected void updateMotionFocusManager() {
        this.mActivity.getSensorStateManager().setFocusSensorEnabled("auto".equals(this.mVideoFocusMode));
    }

    protected void updateFocusArea() {
        if (this.mCamera2Device == null) {
            Log.e(TAG, "updateFocusArea: null camera device");
            return;
        }
        Rect cropRegion = getCropRegion();
        Rect activeArraySize = getActiveArraySize();
        this.mActivity.getSensorStateManager().setFocusSensorEnabled(this.mFocusManager.getMeteringAreas(cropRegion, activeArraySize) != null);
        this.mCamera2Device.setAERegions(this.mFocusManager.getMeteringAreas(cropRegion, activeArraySize));
        if (this.mFocusAreaSupported) {
            this.mCamera2Device.setAFRegions(this.mFocusManager.getMeteringAreas(cropRegion, activeArraySize));
        } else {
            this.mCamera2Device.resumePreview();
        }
    }

    protected void updateFace() {
        boolean enableFaceDetection = enableFaceDetection();
        if (this.mMainProtocol != null) {
            this.mMainProtocol.setSkipDrawFace(enableFaceDetection ^ 1);
        }
        if (enableFaceDetection) {
            if (!this.mFaceDetectionEnabled) {
                this.mFaceDetectionEnabled = true;
                startFaceDetection();
            }
        } else if (this.mFaceDetectionEnabled) {
            stopFaceDetection(true);
            this.mFaceDetectionEnabled = false;
        }
    }

    protected boolean enableFaceDetection() {
        return DataRepository.dataItemGlobal().getBoolean(CameraSettings.KEY_FACE_DETECTION, getResources().getBoolean(R.bool.pref_camera_facedetection_default));
    }

    public void updateFlashPreference() {
        if (!(this.mMutexModePicker.isNormal() || this.mMutexModePicker.isSupportedFlashOn() || this.mMutexModePicker.isSupportedTorch())) {
            resetMutexModeManually();
        }
        setFlashMode(DataRepository.dataItemConfig().getComponentFlash().getComponentValue(this.mModuleIndex));
    }

    protected void initializeFocusManager() {
        Rect renderRect;
        this.mFocusManager = new FocusManager2(this.mCameraCapabilities, this, isFrontCamera(), this.mActivity.getMainLooper());
        if (this.mActivity.getCameraScreenNail() != null) {
            renderRect = this.mActivity.getCameraScreenNail().getRenderRect();
        } else {
            renderRect = null;
        }
        if (renderRect == null || renderRect.width() <= 0) {
            this.mFocusManager.setRenderSize(Util.sWindowWidth, Util.sWindowHeight);
            this.mFocusManager.setPreviewSize(Util.sWindowWidth, Util.sWindowHeight);
            return;
        }
        this.mFocusManager.setRenderSize(this.mActivity.getCameraScreenNail().getRenderWidth(), this.mActivity.getCameraScreenNail().getRenderHeight());
        this.mFocusManager.setPreviewSize(renderRect.width(), renderRect.height());
    }

    protected void switchMutexHDR() {
        if ("off".equals(DataRepository.dataItemConfig().getComponentHdr().getComponentValue(this.mModuleIndex))) {
            resetMutexModeManually();
        } else {
            this.mMutexModePicker.setMutexMode(2);
        }
    }

    public boolean isMeteringAreaOnly() {
        return (this.mFocusAreaSupported || !this.mMeteringAreaSupported || this.mFocusOrAELockSupported) ? false : true;
    }

    protected void startVideoRecording() {
    }

    protected void sendOpenFailMessage() {
        this.mHandler.sendEmptyMessage(10);
    }

    public boolean isCameraEnabled() {
        return this.mPreviewing;
    }

    private void onStereoModeChanged() {
        enableCameraControls(false);
        this.mActivity.getSensorStateManager().setFocusSensorEnabled(false);
        cancelFocus(false);
        this.mStereoSwitchThread = new StereoSwitchThread();
        this.mStereoSwitchThread.start();
    }

    protected void resizeForPreviewAspectRatio() {
    }

    protected void onPreviewStart() {
    }

    protected void waitStereoSwitchThread() {
        try {
            if (this.mStereoSwitchThread != null) {
                this.mStereoSwitchThread.cancel();
                this.mStereoSwitchThread.join();
                this.mStereoSwitchThread = null;
            }
        } catch (Throwable e) {
            Log.e(TAG, e.getMessage(), e);
        }
    }

    protected void updateStereoSettings(boolean z) {
        if (!CameraSettings.isStereoModeOn()) {
            return;
        }
        if (z) {
            this.mSettingsOverrider.overrideSettings(CameraSettings.KEY_VIDEOCAMERA_FLASH_MODE, String.valueOf(0));
            return;
        }
        this.mSettingsOverrider.restoreSettings();
    }

    protected boolean supportTouchFocus() {
        return isFrontCamera() ^ 1;
    }

    protected void setVideoFocusMode(String str, boolean z) {
        this.mVideoFocusMode = str;
        if (z) {
            updateVideoFocusMode();
        }
    }

    protected void updateFocusCallback() {
        if (this.mCamera2Device == null) {
            Log.e(TAG, "updateFocusCallback: null camera device");
        } else if (this.mContinuousFocusSupported) {
            if (AutoFocus.LEGACY_CONTINUOUS_VIDEO.equals(this.mVideoFocusMode)) {
                this.mCamera2Device.setFocusCallback(this);
            }
        } else {
            if (this.mAELockOnlySupported) {
                this.mCamera2Device.setFocusCallback(this);
            }
        }
    }

    protected void showConfirmMessage(int i, int i2) {
        if (this.mDialog != null && this.mDialog.isShowing()) {
            if (this.mTitleId != i && this.mMessageId != i2) {
                this.mDialog.dismiss();
            } else {
                return;
            }
        }
        this.mTitleId = i;
        this.mMessageId = i2;
        this.mDialog = RotateDialogController.showSystemAlertDialog(this.mActivity, this.mActivity.getString(i), this.mActivity.getString(i2), this.mActivity.getString(17039370), null, null, null);
    }

    protected boolean checkCallingState() {
        if (2 != this.mTelephonyManager.getCallState()) {
            return true;
        }
        showConfirmMessage(R.string.confirm_recording_fail_title, R.string.confirm_recording_fail_calling_alert);
        return false;
    }

    protected boolean isCameraSessionReady() {
        return this.mCamera2Device != null && this.mCamera2Device.isSessionReady();
    }

    protected boolean isSessionReady() {
        return this.mIsSessionReady;
    }

    protected void setSessionReady(boolean z) {
        this.mIsSessionReady = z;
    }

    public void onPreviewSessionSuccess(CameraCaptureSession cameraCaptureSession) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("onPreviewSessionSuccess: ");
        stringBuilder.append(cameraCaptureSession);
        Log.d(str, stringBuilder.toString());
        if (cameraCaptureSession != null && isAlive()) {
            this.mCurrentSession = cameraCaptureSession;
            setSessionReady(true);
        }
    }

    public void onPreviewSessionFailed(CameraCaptureSession cameraCaptureSession) {
        if (isTextureExpired() && retryOnceIfCameraError(this.mHandler)) {
            Log.d(TAG, "sessionFailed due to surfaceTexture expired, retry");
            return;
        }
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("onPreviewSessionFailed: ");
        stringBuilder.append(cameraCaptureSession);
        Log.d(str, stringBuilder.toString());
        if (this.mCurrentSession != null && this.mCurrentSession.equals(cameraCaptureSession)) {
            this.mCurrentSession = null;
            setSessionReady(false);
        }
        this.mHandler.sendEmptyMessage(51);
    }

    public void onPreviewSessionClosed(CameraCaptureSession cameraCaptureSession) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("onPreviewSessionClosed: ");
        stringBuilder.append(cameraCaptureSession);
        Log.d(str, stringBuilder.toString());
        if (this.mCurrentSession != null && this.mCurrentSession.equals(cameraCaptureSession)) {
            this.mCurrentSession = null;
            setSessionReady(false);
        }
    }

    public void startFocus() {
        if (isDeviceAlive() && isFrameAvailable()) {
            Log.v(TAG, "startFocus");
            if (this.mFocusOrAELockSupported) {
                setVideoFocusMode("auto", true);
                this.mCamera2Device.startFocus(FocusTask.create(1), this.mModuleIndex);
            } else {
                this.mCamera2Device.resumePreview();
            }
        }
    }

    public void cancelFocus(boolean z) {
        if (!isDeviceAlive()) {
            return;
        }
        if (isFrameAvailable()) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("cancelFocus: ");
            stringBuilder.append(z);
            Log.v(str, stringBuilder.toString());
            if (z) {
                setVideoFocusMode(AutoFocus.LEGACY_CONTINUOUS_VIDEO, true);
            }
            this.mCamera2Device.cancelFocus(this.mModuleIndex);
            return;
        }
        Log.e(TAG, "cancelFocus: frame not available");
    }

    public boolean onWaitingFocusFinished() {
        if (!isFrameAvailable()) {
            return false;
        }
        Log.v(TAG, CameraStat.CATEGORY_CAMERA);
        this.mHandler.removeMessages(55);
        if (!this.mInStartingFocusRecording) {
            return false;
        }
        this.mInStartingFocusRecording = false;
        startVideoRecording();
        return true;
    }

    public boolean multiCapture() {
        Log.v(TAG, "multiCapture");
        return false;
    }

    /* JADX WARNING: Missing block: B:12:0x0020, code:
            return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void startFaceDetection() {
        if (this.mFaceDetectionEnabled && !this.mFaceDetectionStarted && isAlive() && this.mMaxFaceCount > 0 && this.mCamera2Device != null) {
            this.mFaceDetectionStarted = true;
            this.mCamera2Device.startFaceDetection();
        }
    }

    public void stopFaceDetection(boolean z) {
        if (this.mFaceDetectionEnabled && this.mFaceDetectionStarted) {
            this.mFaceDetectionStarted = false;
            if (this.mCamera2Device != null) {
                this.mCamera2Device.stopFaceDetection();
            }
        }
    }

    private void updateFaceView(boolean z, boolean z2) {
        if (this.mHandler.hasMessages(35)) {
            this.mHandler.removeMessages(35);
        }
        this.mHandler.obtainMessage(35, z, z2).sendToTarget();
    }

    public void onFaceDetected(CameraHardwareFace[] cameraHardwareFaceArr, FaceAnalyzeInfo faceAnalyzeInfo) {
    }

    public boolean isFaceDetectStarted() {
        return this.mFaceDetectionStarted;
    }

    public boolean isUseFaceInfo() {
        return false;
    }

    public void onPreviewMetaDataUpdate(CaptureResult captureResult) {
        if (captureResult != null) {
            super.onPreviewMetaDataUpdate(captureResult);
            if (this.mMetaDataFlowableEmitter != null) {
                this.mMetaDataFlowableEmitter.onNext(captureResult);
            }
        }
    }

    public void stopObjectTracking(boolean z) {
    }

    public void notifyFocusAreaUpdate() {
        updatePreferenceTrampoline(3);
    }

    public void playFocusSound(int i) {
        playCameraSound(i);
    }

    public boolean isShowAeAfLockIndicator() {
        return this.m3ALocked;
    }

    public void onBroadcastReceived(Context context, Intent intent) {
        super.onBroadcastReceived(context, intent);
        if ("android.intent.action.MEDIA_EJECT".equals(intent.getAction()) && Storage.isCurrentStorageIsSecondary()) {
            Storage.switchToPhoneStorage();
            stopVideoRecording(true, false);
        }
    }

    public void onFocusStateChanged(FocusTask focusTask) {
        if (isCreated() && !isDeparted()) {
            switch (focusTask.getFocusTrigger()) {
                case 1:
                    String str = TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("focusTime=");
                    stringBuilder.append(focusTask.getElapsedTime());
                    stringBuilder.append("ms focused=");
                    stringBuilder.append(focusTask.isSuccess());
                    stringBuilder.append(" waitForRecording=");
                    stringBuilder.append(this.mFocusManager.isFocusingSnapOnFinish());
                    Log.v(str, stringBuilder.toString());
                    this.mMainProtocol.setFocusViewType(true);
                    this.mFocusManager.onFocusResult(focusTask);
                    this.mActivity.getSensorStateManager().reset();
                    if (focusTask.isSuccess() && this.m3ALocked) {
                        this.mCamera2Device.lockExposure(true);
                        break;
                    }
                case 2:
                    if (!(this.mMediaRecorderRecording || this.m3ALocked)) {
                        this.mFocusManager.onFocusResult(focusTask);
                        break;
                    }
            }
        }
    }

    protected void unlockAEAF() {
        Log.d(TAG, "unlockAEAF");
        this.m3ALocked = false;
        if (this.mAeLockSupported) {
            this.mCamera2Device.setAELock(false);
        }
        if (this.mFocusManager != null) {
            this.mFocusManager.setAeAwbLock(false);
        }
    }

    protected void lockAEAF() {
        Log.d(TAG, "lockAEAF");
        if (this.mAeLockSupported && this.mCamera2Device != null) {
            this.mCamera2Device.setAELock(true);
        }
        this.mFocusManager.setAeAwbLock(true);
        this.m3ALocked = true;
    }

    protected boolean is3ALocked() {
        return this.m3ALocked;
    }

    protected boolean isAEAFLockSupported() {
        return true;
    }

    public void onLongPress(int i, int i2) {
        if (isInTapableRect(i, i2)) {
            onSingleTapUp(i, i2, true);
            if (isAEAFLockSupported() && CameraSettings.isAEAFLockSupport()) {
                lockAEAF();
            }
            this.mMainProtocol.performHapticFeedback(0);
        }
    }

    protected void doLaterReleaseIfNeed() {
        if (this.mActivity != null && this.mActivity.isActivityPaused()) {
            Log.d(TAG, "doLaterRelease");
            this.mActivity.pause();
            this.mActivity.releaseAll(true, true);
        }
    }

    public void onOrientationChanged(int i, int i2) {
        if (!CameraSettings.isVideoBokehOn()) {
            super.onOrientationChanged(i, i2);
        } else if (i != -1) {
            this.mOrientation = i;
            EffectController.getInstance().setOrientation(Util.getShootOrientation(this.mActivity, this.mOrientation));
            checkActivityOrientation();
            if (this.mOrientationCompensation != i2) {
                this.mOrientationCompensation = i2;
                setOrientationParameter();
            }
        }
    }

    private void setOrientationParameter() {
        if (!(isDeparted() || this.mCamera2Device == null || this.mOrientation == -1)) {
            if (this.mPreviewing) {
                updatePreferenceInWorkThread(35);
            } else {
                this.mCamera2Device.setDeviceOrientation(this.mOrientation);
            }
        }
    }

    protected void updateDeviceOrientation() {
        this.mCamera2Device.setDeviceOrientation(this.mOrientation);
    }

    protected void updateBeauty() {
        if (this.mCameraCapabilities.isSupportVideoBeauty() && (this.mModuleIndex == 162 || this.mModuleIndex == 161)) {
            if (this.mBeautyValues == null) {
                this.mBeautyValues = new BeautyValues();
            }
            this.mBeautyValues.mBeautyLevel = CameraSettings.getFaceBeautyCloseValue();
            if (!DataRepository.dataItemConfig().getComponentConfigBeauty().isClosed(this.mModuleIndex)) {
                CameraSettings.initBeautyValues(this.mBeautyValues, b.hP());
            }
            if (!BeautyConstant.LEVEL_CLOSE.equals(this.mBeautyValues.mBeautyLevel)) {
                this.mCamera2Device.setBeautyValues(this.mBeautyValues);
            }
            return;
        }
        this.mBeautyValues = null;
    }

    protected boolean isBeautyOn() {
        return (this.mBeautyValues == null || BeautyConstant.LEVEL_CLOSE.equals(this.mBeautyValues.mBeautyLevel)) ? false : true;
    }

    private void onBeautyParameterChanged() {
        boolean isFaceBeautyOn = BeautyParameters.isFaceBeautyOn();
        if (this.mIsBeautyFrontOn != isFaceBeautyOn) {
            boolean isVideoBokehOn = CameraSettings.isVideoBokehOn();
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("onBeautyParameterChanged: isVideoBokehOn = ");
            stringBuilder.append(isVideoBokehOn);
            Log.d(str, stringBuilder.toString());
            restartModule();
        } else {
            updatePreferenceInWorkThread(13);
        }
        this.mIsBeautyFrontOn = isFaceBeautyOn;
    }

    public boolean isThermalThreshold() {
        boolean z = false;
        if (!this.mMediaRecorderRecording) {
            return false;
        }
        long uptimeMillis = (SystemClock.uptimeMillis() - this.mRecordingStartTime) / 60000;
        if (isFrontCamera()) {
            if (uptimeMillis >= 10) {
                z = true;
            }
            return z;
        }
        if (uptimeMillis >= 20) {
            z = true;
        }
        return z;
    }

    public void onBeautyChanged() {
        onBeautyParameterChanged();
    }
}
