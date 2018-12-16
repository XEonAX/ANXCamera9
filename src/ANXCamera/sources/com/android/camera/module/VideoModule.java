package com.android.camera.module;

import android.annotation.SuppressLint;
import android.content.ContentValues;
import android.content.Intent;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.SurfaceTexture;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.utils.SurfaceUtils;
import android.location.Location;
import android.media.CamcorderProfile;
import android.media.CameraProfile;
import android.media.MediaCodec;
import android.media.MediaRecorder;
import android.media.MediaRecorder.OnErrorListener;
import android.media.MediaRecorder.OnInfoListener;
import android.net.Uri;
import android.os.Build.VERSION;
import android.os.CountDownTimer;
import android.os.ParcelFileDescriptor;
import android.os.SystemClock;
import android.os.SystemProperties;
import android.provider.MiuiSettings.ScreenEffect;
import android.support.annotation.MainThread;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import android.util.Range;
import android.util.Size;
import android.view.Surface;
import android.widget.Toast;
import com.android.camera.AutoLockManager;
import com.android.camera.Camera;
import com.android.camera.CameraIntentManager.CameraExtras;
import com.android.camera.CameraSettings;
import com.android.camera.CameraSize;
import com.android.camera.Exif;
import com.android.camera.FileCompat;
import com.android.camera.LocationManager;
import com.android.camera.R;
import com.android.camera.ThermalDetector;
import com.android.camera.ToastUtils;
import com.android.camera.Util;
import com.android.camera.constant.AutoFocus;
import com.android.camera.constant.GlobalConstant;
import com.android.camera.constant.UpdateConstant;
import com.android.camera.constant.UpdateConstant.UpdateType;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.config.ComponentConfigSlowMotion;
import com.android.camera.data.provider.DataProvider.ProviderEditor;
import com.android.camera.effect.EffectController;
import com.android.camera.effect.FilterInfo;
import com.android.camera.fragment.top.FragmentTopAlert;
import com.android.camera.lib.compatibility.util.CompatibilityUtils;
import com.android.camera.log.Log;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.ActionProcessing;
import com.android.camera.protocol.ModeProtocol.BackStack;
import com.android.camera.protocol.ModeProtocol.TopAlert;
import com.android.camera.statistic.CameraStat;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera.statistic.ScenarioTrackUtil;
import com.android.camera.storage.Storage;
import com.android.camera.ui.ObjectView.ObjectViewListener;
import com.android.camera.ui.PopupManager;
import com.android.camera.ui.RotateTextToast;
import com.android.camera2.Camera2Proxy.PictureCallbackWrapper;
import com.android.camera2.Camera2Proxy.VideoRecordStateCallback;
import com.android.camera2.CameraCapabilities;
import com.mi.config.b;
import com.ss.android.medialib.Result.Error;
import com.ss.android.ugc.effectmanager.link.model.configuration.LinkSelectorConfiguration;
import io.reactivex.Single;
import io.reactivex.SingleEmitter;
import io.reactivex.SingleOnSubscribe;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.functions.Consumer;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.CountDownLatch;
import miui.reflect.Method;

public class VideoModule extends VideoBase implements OnErrorListener, OnInfoListener, ObjectViewListener, VideoRecordStateCallback {
    private static final HashMap<String, Integer> HEVC_VIDEO_ENCODER_BITRATE = new HashMap();
    private static final int MAX_DURATION_4K = 480000;
    private static final int RESET_VIDEO_AUTO_FOCUS_TIME = 3000;
    public static final Size SIZE_1080 = new Size(1920, ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_END_DEAULT);
    public static final Size SIZE_720 = new Size(1280, Util.LIMIT_SURFACE_WIDTH);
    private static final long START_OFFSET_MS = 450;
    private static final int VIDEO_HFR_FRAME_RATE_120 = 120;
    private static final int VIDEO_HFR_FRAME_RATE_240 = 240;
    public static final long VIDEO_MAX_SINGLE_FILE_SIZE = 3670016000L;
    public static final long VIDEO_MIN_SINGLE_FILE_SIZE = Math.min(8388608, Storage.LOW_STORAGE_THRESHOLD);
    private static final int VIDEO_NORMAL_FRAME_RATE = 30;
    private boolean mCaptureTimeLapse;
    private CountDownTimer mCountDownTimer;
    private volatile int mCurrentFileNumber;
    private boolean mFovcEnabled;
    private int mFrameRate;
    private int mHfrFPSLower;
    private int mHfrFPSUpper;
    private final Object mLock = new Object();
    private MediaRecorder mMediaRecorder;
    private boolean mMediaRecorderPostProcessing;
    private boolean mMediaRecorderWorking;
    private String mNextVideoFileName;
    private ContentValues mNextVideoValues;
    private long mPauseClickTime = 0;
    private volatile boolean mPendingStopRecorder;
    private CamcorderProfile mProfile;
    private int mQuality = 5;
    private boolean mQuickCapture;
    private Surface mRecorderSurface;
    private String mRecordingTime;
    private boolean mRecordingTimeCountsDown;
    private String mSlowModeFps;
    private boolean mSnapshotInProgress;
    private String mSpeed = "normal";
    private boolean mSplitWhenReachMaxSize;
    private CountDownLatch mStopRecorderDone;
    private int mTimeBetweenTimeLapseFrameCaptureMs = 0;
    private TopAlert mTopAlert;
    private long mVideoRecordTime = 0;
    private long mVideoRecordedDuration;

    private final class JpegPictureCallback extends PictureCallbackWrapper {
        Location mLocation;

        public JpegPictureCallback(Location location) {
            this.mLocation = location;
        }

        public void onPictureTaken(byte[] bArr) {
            Log.v(VideoBase.TAG, "onPictureTaken");
            VideoModule.this.mSnapshotInProgress = false;
            if (!VideoModule.this.mPaused) {
                storeImage(bArr, this.mLocation);
            }
        }

        private void storeImage(byte[] bArr, Location location) {
            long currentTimeMillis = System.currentTimeMillis();
            byte[] bArr2 = bArr;
            Location location2 = location;
            VideoModule.this.mActivity.getImageSaver().addImage(bArr2, VideoModule.this.needImageThumbnail(12), Util.createJpegName(currentTimeMillis), null, System.currentTimeMillis(), null, location2, VideoModule.this.mPictureSize.width, VideoModule.this.mPictureSize.height, null, Exif.getOrientation(bArr), false, false, true, false, false, null, null);
        }
    }

    static {
        HEVC_VIDEO_ENCODER_BITRATE.put("3840x2160:30", Integer.valueOf(38500000));
        HEVC_VIDEO_ENCODER_BITRATE.put("1920x1080:30", Integer.valueOf(15400000));
        HEVC_VIDEO_ENCODER_BITRATE.put("1280x720:30", Integer.valueOf(10780000));
        HEVC_VIDEO_ENCODER_BITRATE.put("720x480:30", Integer.valueOf(1379840));
    }

    public VideoModule() {
        super(VideoModule.class.getSimpleName());
    }

    public void registerProtocol() {
        super.registerProtocol();
        ModeCoordinatorImpl.getInstance().attachProtocol(161, this);
        ModeCoordinatorImpl.getInstance().attachProtocol(167, this);
        ModeCoordinatorImpl.getInstance().attachProtocol(169, this);
        ModeCoordinatorImpl.getInstance().attachProtocol(199, this);
        getActivity().getImplFactory().initAdditional(getActivity(), 164);
    }

    public void unRegisterProtocol() {
        super.unRegisterProtocol();
        ModeCoordinatorImpl.getInstance().detachProtocol(161, this);
        ModeCoordinatorImpl.getInstance().detachProtocol(167, this);
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
        if (this.mFocusManager != null && this.mActivity.getCameraScreenNail() != null) {
            this.mActivity.getCameraScreenNail().setRenderArea(rect);
            this.mFocusManager.setRenderSize(this.mActivity.getCameraScreenNail().getRenderWidth(), this.mActivity.getCameraScreenNail().getRenderHeight());
            this.mFocusManager.setPreviewSize(rect.width(), rect.height());
        }
    }

    public List<String> getSupportedSettingKeys() {
        List<String> arrayList = new ArrayList();
        if (isBackCamera()) {
            arrayList.add("pref_video_speed_fast_key");
            if (b.ge()) {
                arrayList.add("pref_video_speed_slow_key");
            }
        }
        return arrayList;
    }

    public void onCreate(int i, int i2) {
        super.onCreate(i, i2);
        changeConflictPreference();
        setCaptureIntent(this.mActivity.getCameraIntentManager().isVideoCaptureIntent());
        EffectController.getInstance().setEffect(FilterInfo.FILTER_ID_NONE);
        this.mActivity.getSensorStateManager().setSensorStateListener(this.mSensorStateListener);
        this.mQuickCapture = this.mActivity.getCameraIntentManager().isQuickCapture().booleanValue();
        this.mMainProtocol.setObjectViewListener(this);
        enableCameraControls(false);
        this.mTelephonyManager = (TelephonyManager) this.mActivity.getSystemService("phone");
        this.mVideoFocusMode = AutoFocus.LEGACY_CONTINUOUS_VIDEO;
        initRecorderSurface();
        onCameraOpened();
    }

    protected void onCameraOpened() {
        super.onCameraOpened();
        updateBeauty();
        readVideoPreferences();
        initializeFocusManager();
        updatePreferenceTrampoline(UpdateConstant.VIDEO_TYPES_INIT);
        if (!initializeRecorder()) {
            startPreviewSession();
        } else if (isHFRMode() || isSlowMode() || ModuleManager.isVideoNewSlowMotion()) {
            startHighSpeedRecordSession();
        } else {
            startRecordSession();
        }
    }

    private void initRecorderSurface() {
        this.mRecorderSurface = MediaCodec.createPersistentInputSurface();
    }

    private void releaseRecorderSurface() {
        if (this.mRecorderSurface != null) {
            this.mRecorderSurface.release();
        }
    }

    public boolean onBackPressed() {
        if (!isCreated()) {
            return false;
        }
        if (this.mPaused || this.mActivity.isActivityPaused()) {
            return true;
        }
        if (this.mStereoSwitchThread != null) {
            return false;
        }
        if (this.mMediaRecorderRecording) {
            long currentTimeMillis = System.currentTimeMillis();
            if (isFPS960() && this.mMediaRecorderPostProcessing) {
                return true;
            }
            if (currentTimeMillis - this.mLastBackPressedTime > 3000) {
                this.mLastBackPressedTime = currentTimeMillis;
                ToastUtils.showToast(this.mActivity, (int) R.string.record_back_pressed_hint);
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

    public void onShutterButtonFocus(boolean z, int i) {
    }

    public void onShutterButtonClick(int i) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("onShutterButtonClick isRecording=");
        stringBuilder.append(this.mMediaRecorderRecording);
        stringBuilder.append(" inStartingFocusRecording=");
        stringBuilder.append(this.mInStartingFocusRecording);
        Log.v(str, stringBuilder.toString());
        this.mInStartingFocusRecording = false;
        this.mLastBackPressedTime = 0;
        if (isIgnoreTouchEvent()) {
            Log.w(TAG, "onShutterButtonClick: ignore touch event");
        } else if (!isFrontCamera() || !this.mActivity.isScreenSlideOff()) {
            BackStack backStack = (BackStack) ModeCoordinatorImpl.getInstance().getAttachProtocol(171);
            if (backStack != null) {
                backStack.handleBackStackFromShutter();
            }
            if (this.mMediaRecorderRecording) {
                stopVideoRecording(true, false);
            } else if (checkCallingState()) {
                this.mActivity.getScreenHint().updateHint();
                if (Storage.isLowStorageAtLastPoint()) {
                    ((ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162)).processingFailed();
                    return;
                }
                setTriggerMode(i);
                enableCameraControls(false);
                playCameraSound(2);
                this.mTopAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
                resetUI();
                if (this.mFocusManager.canRecord()) {
                    startVideoRecording();
                } else {
                    Log.v(TAG, "wait for autoFocus");
                    this.mInStartingFocusRecording = true;
                    this.mHandler.sendEmptyMessageDelayed(55, 3000);
                }
            } else {
                ((ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162)).processingFailed();
            }
        }
    }

    private void resetUI() {
        if (!(CameraSettings.isVideoBokehOn() || this.mTopAlert == null)) {
            this.mTopAlert.updateRecordingTime(Util.millisecondToTimeString(0, false));
        }
    }

    private void startPreviewAfterRecord() {
        if (isDeviceAlive() && !this.mActivity.isActivityPaused()) {
            unlockAEAF();
            if (!isCaptureIntent()) {
                if (isHFRMode() || isSlowMode() || ModuleManager.isVideoNewSlowMotion()) {
                    this.mCamera2Device.startHighSpeedRecordPreview();
                } else {
                    this.mCamera2Device.startRecordPreview();
                }
            }
        }
    }

    /* JADX WARNING: Missing block: B:13:0x0065, code:
            return;
     */
    public void onSharedPreferenceChanged() {
        /*
        r8 = this;
        r0 = r8.mPaused;
        if (r0 != 0) goto L_0x0065;
    L_0x0004:
        r0 = r8.mActivity;
        r0 = r0.isActivityPaused();
        if (r0 == 0) goto L_0x000d;
    L_0x000c:
        goto L_0x0065;
    L_0x000d:
        r0 = r8.mCamera2Device;
        if (r0 != 0) goto L_0x0012;
    L_0x0011:
        return;
    L_0x0012:
        r0 = r8.mProfile;
        r0 = r0.videoFrameWidth;
        r1 = r8.mProfile;
        r1 = r1.videoFrameHeight;
        r8.readVideoPreferences();
        r2 = r8.mProfile;
        r2 = r2.videoFrameWidth;
        if (r2 != r0) goto L_0x0029;
    L_0x0023:
        r2 = r8.mProfile;
        r2 = r2.videoFrameHeight;
        if (r2 == r1) goto L_0x0064;
    L_0x0029:
        r2 = TAG;
        r3 = java.util.Locale.ENGLISH;
        r4 = "profile size changed [%d %d]->[%d %d]";
        r5 = 4;
        r5 = new java.lang.Object[r5];
        r0 = java.lang.Integer.valueOf(r0);
        r6 = 0;
        r5[r6] = r0;
        r0 = java.lang.Integer.valueOf(r1);
        r1 = 1;
        r5[r1] = r0;
        r0 = 2;
        r7 = r8.mProfile;
        r7 = r7.videoFrameWidth;
        r7 = java.lang.Integer.valueOf(r7);
        r5[r0] = r7;
        r0 = 3;
        r7 = r8.mProfile;
        r7 = r7.videoFrameHeight;
        r7 = java.lang.Integer.valueOf(r7);
        r5[r0] = r7;
        r0 = java.lang.String.format(r3, r4, r5);
        com.android.camera.log.Log.d(r2, r0);
        r0 = new int[r1];
        r0[r6] = r1;
        r8.updatePreferenceTrampoline(r0);
    L_0x0064:
        return;
    L_0x0065:
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.module.VideoModule.onSharedPreferenceChanged():void");
    }

    protected void readVideoPreferences() {
        String str;
        int videoQuality = CameraSettings.getVideoQuality();
        try {
            videoQuality = getActivity().getCameraIntentManager().getVideoQuality() > 0 ? 1 : 0;
        } catch (RuntimeException e) {
        }
        this.mSpeed = DataRepository.dataItemRunning().getVideoSpeed();
        if (ModuleManager.isVideoNewSlowMotion()) {
            this.mSpeed = CameraSettings.VIDEO_MODE_960;
        } else {
            this.mSlowModeFps = null;
        }
        this.mTimeBetweenTimeLapseFrameCaptureMs = 0;
        this.mCaptureTimeLapse = false;
        if (CameraSettings.VIDEO_SPEED_FAST.equals(this.mSpeed)) {
            this.mTimeBetweenTimeLapseFrameCaptureMs = Integer.parseInt(DataRepository.dataItemGlobal().getString(CameraSettings.KEY_VIDEO_TIME_LAPSE_FRAME_INTERVAL, getString(R.string.pref_video_time_lapse_frame_interval_default)));
            this.mCaptureTimeLapse = this.mTimeBetweenTimeLapseFrameCaptureMs != 0;
            if (this.mCaptureTimeLapse) {
                videoQuality += 1000;
                if (videoQuality < 1000 || videoQuality > 1008) {
                    videoQuality += Error.SYN_INIT_FAILED;
                    this.mCaptureTimeLapse = false;
                    forceToNormalMode();
                    RotateTextToast.getInstance(this.mActivity).show(R.string.time_lapse_error, this.mOrientation);
                }
            }
            this.mQuality = videoQuality % 1000;
        } else {
            int i = 120;
            if (isHFRMode() || isSlowMode()) {
                String hfrSetting = getHfrSetting();
                String[] split = hfrSetting.split(":");
                if (isSlowMode()) {
                    this.mQuality = convertSizeToQuality(split[0]);
                } else {
                    videoQuality = Math.max(Math.min(videoQuality, 6), 5);
                    this.mQuality = videoQuality;
                }
                if (this.mQuality == -1) {
                    str = TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("invalid hfr setting: ");
                    stringBuilder.append(hfrSetting);
                    Log.e(str, stringBuilder.toString());
                    forceToNormalMode();
                    this.mQuality = videoQuality;
                } else {
                    Size size;
                    videoQuality = this.mQuality;
                    if (6 == videoQuality) {
                        size = new Size(1920, ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_END_DEAULT);
                    } else {
                        size = new Size(1280, Util.LIMIT_SURFACE_WIDTH);
                    }
                    int parseInt = Util.parseInt(split[1], 120);
                    if (isHFRMode()) {
                        List supportedHFRVideoFPSList = this.mCameraCapabilities.getSupportedHFRVideoFPSList(size);
                        if (!supportedHFRVideoFPSList.contains(Integer.valueOf(120))) {
                            i = ((Integer) supportedHFRVideoFPSList.get(0)).intValue();
                        }
                    } else {
                        i = parseInt;
                    }
                    updateHfrFPSRange(size, i);
                }
            } else if (ModuleManager.isVideoNewSlowMotion()) {
                this.mQuality = 6;
                Size size2 = SIZE_1080;
                int newSlowMotionIQ = CameraSettings.getNewSlowMotionIQ();
                if (newSlowMotionIQ == 5) {
                    size2 = SIZE_720;
                    this.mQuality = newSlowMotionIQ;
                }
                this.mSlowModeFps = DataRepository.dataItemConfig().getComponentConfigSlowMotion().getComponentValue(172);
                if (isFPS120()) {
                    updateHfrFPSRange(size2, 120);
                } else {
                    if (!CameraSettings.getSupportedHfrSettings(0).contains(CameraSettings.SIZE_FPS_1080_240)) {
                        size2 = SIZE_720;
                        this.mQuality = 5;
                        newSlowMotionIQ = 5;
                    }
                    updateHfrFPSRange(size2, 240);
                    if (isFPS960()) {
                        showFPS960Hint();
                    }
                }
                videoQuality = newSlowMotionIQ;
            } else {
                if (this.mCameraCapabilities.isSupportVideoBeauty() && isBeautyOn()) {
                    videoQuality = Math.min(videoQuality, 6);
                }
                this.mQuality = videoQuality;
            }
        }
        if (!(this.mProfile == null || this.mProfile.quality % 1000 == this.mQuality)) {
            stopObjectTracking(false);
        }
        this.mProfile = fetchProfile(this.mBogusCameraId, videoQuality);
        this.mProfile.videoCodec = CameraSettings.getVideoEncoder();
        this.mOutputFormat = this.mProfile.fileFormat;
        String str2 = TAG;
        Locale locale = Locale.ENGLISH;
        str = "frameRate=%d profileSize=%dx%d codec=%d";
        Object[] objArr = new Object[4];
        objArr[0] = Integer.valueOf(getHSRValue() > 0 ? getHSRValue() : this.mProfile.videoFrameRate);
        objArr[1] = Integer.valueOf(this.mProfile.videoFrameWidth);
        objArr[2] = Integer.valueOf(this.mProfile.videoFrameHeight);
        objArr[3] = Integer.valueOf(this.mProfile.videoCodec);
        Log.d(str2, String.format(locale, str, objArr));
        if (isHFRMode() || isSlowMode() || ModuleManager.isVideoNewSlowMotion()) {
            this.mFrameRate = this.mHfrFPSUpper;
        } else {
            this.mFrameRate = this.mProfile.videoFrameRate;
        }
        if (isFPS960()) {
            this.mMaxVideoDurationInMs = 2000;
            return;
        }
        try {
            this.mMaxVideoDurationInMs = this.mActivity.getCameraIntentManager().getVideoDurationTime() * 1000;
        } catch (RuntimeException e2) {
            if (!CameraSettings.is4KHigherVideoQuality(this.mQuality) || this.mCaptureTimeLapse) {
                this.mMaxVideoDurationInMs = 0;
            } else {
                this.mMaxVideoDurationInMs = MAX_DURATION_4K;
            }
        }
        if (this.mMaxVideoDurationInMs != 0 && this.mMaxVideoDurationInMs < 1000) {
            this.mMaxVideoDurationInMs = 1000;
        }
    }

    public void showFPS960Hint() {
        this.mHandler.sendEmptyMessage(54);
    }

    private boolean isFPS120() {
        return ComponentConfigSlowMotion.DATA_CONFIG_NEW_SLOW_MOTION_120.equals(this.mSlowModeFps);
    }

    private boolean isFPS240() {
        return ComponentConfigSlowMotion.DATA_CONFIG_NEW_SLOW_MOTION_240.equals(this.mSlowModeFps);
    }

    private boolean isFPS960() {
        return ComponentConfigSlowMotion.DATA_CONFIG_NEW_SLOW_MOTION_960.equals(this.mSlowModeFps);
    }

    private String getHfrSetting() {
        String hfrSetting = CameraSettings.getHfrSetting();
        ArrayList supportedHfrSettings = CameraSettings.getSupportedHfrSettings(this.mBogusCameraId);
        if (supportedHfrSettings == null || supportedHfrSettings.contains(hfrSetting)) {
            return hfrSetting;
        }
        return (String) supportedHfrSettings.get(0);
    }

    private void updateHfrFPSRange(Size size, int i) {
        Range range = null;
        for (Range range2 : this.mCameraCapabilities.getSupportedHighSpeedVideoFPSRange(size)) {
            if (((Integer) range2.getUpper()).intValue() == i && (range == null || ((Integer) range.getLower()).intValue() < ((Integer) range2.getLower()).intValue())) {
                range = range2;
            }
        }
        this.mHfrFPSLower = ((Integer) range.getLower()).intValue();
        this.mHfrFPSUpper = ((Integer) range.getUpper()).intValue();
    }

    private void forceToNormalMode() {
        ProviderEditor editor = DataRepository.dataItemConfig().editor();
        editor.putString(CameraSettings.KEY_VIDEO_SPEED, "normal");
        editor.apply();
        this.mSpeed = "normal";
    }

    private boolean isSlowMode() {
        return CameraSettings.VIDEO_SPEED_SLOW.equals(this.mSpeed);
    }

    private boolean isHFRMode() {
        return CameraSettings.VIDEO_SPEED_HFR.equals(this.mSpeed);
    }

    private boolean isNormalMode() {
        return "normal".equals(this.mSpeed);
    }

    private int getHSRValue() {
        int i;
        String string = DataRepository.dataItemConfig().getString(CameraSettings.KEY_CAMERA_HSR_VALUE, null);
        if (string == null || string.equals("off") || isBeautyOn() || CameraSettings.isVideoBokehOn()) {
            i = 0;
        } else {
            i = 1;
        }
        if (i != 0) {
            return Integer.parseInt(string);
        }
        return 0;
    }

    /* JADX WARNING: Removed duplicated region for block: B:12:0x0028  */
    /* JADX WARNING: Removed duplicated region for block: B:16:0x0041  */
    /* JADX WARNING: Removed duplicated region for block: B:14:0x003f  */
    /* JADX WARNING: Removed duplicated region for block: B:12:0x0028  */
    /* JADX WARNING: Removed duplicated region for block: B:16:0x0041  */
    /* JADX WARNING: Removed duplicated region for block: B:14:0x003f  */
    private int convertSizeToQuality(java.lang.String r5) {
        /*
        r4 = this;
        r0 = r5.hashCode();
        r1 = -1719904874; // 0xffffffff997c5596 float:-1.30453786E-23 double:NaN;
        r2 = -1;
        if (r0 == r1) goto L_0x001a;
    L_0x000a:
        r1 = 802059049; // 0x2fce7329 float:3.7553008E-10 double:3.96269822E-315;
        if (r0 == r1) goto L_0x0010;
    L_0x000f:
        goto L_0x0024;
    L_0x0010:
        r0 = "1920x1080";
        r0 = r5.equals(r0);
        if (r0 == 0) goto L_0x0024;
    L_0x0018:
        r0 = 0;
        goto L_0x0025;
    L_0x001a:
        r0 = "1280x720";
        r0 = r5.equals(r0);
        if (r0 == 0) goto L_0x0024;
    L_0x0022:
        r0 = 1;
        goto L_0x0025;
    L_0x0024:
        r0 = r2;
    L_0x0025:
        switch(r0) {
            case 0: goto L_0x0041;
            case 1: goto L_0x003f;
            default: goto L_0x0028;
        };
    L_0x0028:
        r0 = TAG;
        r1 = new java.lang.StringBuilder;
        r1.<init>();
        r3 = "unexpected hfr video size ";
        r1.append(r3);
        r1.append(r5);
        r5 = r1.toString();
        com.android.camera.log.Log.e(r0, r5);
        return r2;
    L_0x003f:
        r5 = 5;
        return r5;
    L_0x0041:
        r5 = 6;
        return r5;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.module.VideoModule.convertSizeToQuality(java.lang.String):int");
    }

    protected CamcorderProfile fetchProfile(int i, int i2) {
        return CamcorderProfile.get(i, i2);
    }

    protected void resizeForPreviewAspectRatio() {
        if (((this.mCameraCapabilities.getSensorOrientation() - Util.getDisplayRotation(this.mActivity)) + ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT) % 180 == 0) {
            this.mMainProtocol.setPreviewAspectRatio(((float) this.mVideoSize.height) / ((float) this.mVideoSize.width));
        } else {
            this.mMainProtocol.setPreviewAspectRatio(((float) this.mVideoSize.width) / ((float) this.mVideoSize.height));
        }
    }

    public void onPause() {
        super.onPause();
        if (this.mFovcEnabled && this.mCamera2Device != null) {
            this.mCamera2Device.notifyVideoStreamEnd();
        }
        waitStereoSwitchThread();
        stopObjectTracking(false);
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
        this.mHandler.removeCallbacksAndMessages(null);
        exitSavePowerMode();
    }

    public void onDestroy() {
        super.onDestroy();
        releaseRecorderSurface();
        this.mHandler.sendEmptyMessage(45);
    }

    private void startRecordSession() {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("startRecordSession: mode=");
        stringBuilder.append(this.mSpeed);
        Log.d(str, stringBuilder.toString());
        if (isDeviceAlive()) {
            checkDisplayOrientation();
            this.mCamera2Device.setErrorCallback(this.mErrorCallback);
            this.mCamera2Device.setPictureSize(this.mPreviewSize);
            this.mCamera2Device.setVideoSnapshotSize(this.mPictureSize);
            int operatingMode = getOperatingMode();
            Log.d(TAG, String.format("startRecordSession: operatingMode = 0x%x", new Object[]{Integer.valueOf(operatingMode)}));
            this.mSurfaceCreatedTimestamp = this.mActivity.getCameraScreenNail().getSurfaceCreatedTimestamp();
            this.mCamera2Device.startRecordSession(new Surface(this.mActivity.getCameraScreenNail().getSurfaceTexture()), this.mRecorderSurface, true, operatingMode, this);
            this.mFocusManager.resetFocused();
            this.mPreviewing = true;
        }
    }

    private void startHighSpeedRecordSession() {
        Log.d(TAG, "startHighSpeedRecordSession");
        if (isDeviceAlive()) {
            checkDisplayOrientation();
            this.mCamera2Device.setErrorCallback(this.mErrorCallback);
            this.mCamera2Device.setPictureSize(this.mPreviewSize);
            this.mSurfaceCreatedTimestamp = this.mActivity.getCameraScreenNail().getSurfaceCreatedTimestamp();
            this.mCamera2Device.startHighSpeedRecordSession(new Surface(this.mActivity.getCameraScreenNail().getSurfaceTexture()), this.mRecorderSurface, new Range(Integer.valueOf(this.mHfrFPSLower), Integer.valueOf(this.mHfrFPSUpper)), this);
            this.mFocusManager.resetFocused();
            showSurfaceInfo(this.mRecorderSurface);
        }
    }

    private void startPreviewSession() {
        Log.d(TAG, "startPreviewSession");
        if (isDeviceAlive()) {
            checkDisplayOrientation();
            this.mCamera2Device.setFocusCallback(this);
            this.mCamera2Device.setErrorCallback(this.mErrorCallback);
            this.mCamera2Device.setPictureSize(this.mPreviewSize);
            Surface surface = new Surface(this.mActivity.getCameraScreenNail().getSurfaceTexture());
            this.mSurfaceCreatedTimestamp = this.mActivity.getCameraScreenNail().getSurfaceCreatedTimestamp();
            this.mCamera2Device.startPreviewSession(surface, false, false, 0, this);
        }
    }

    public void startPreview() {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("startPreview: previewing=");
        stringBuilder.append(this.mPreviewing);
        Log.v(str, stringBuilder.toString());
        checkDisplayOrientation();
        this.mPreviewing = true;
    }

    public void pausePreview() {
        Log.v(TAG, "pausePreview");
        this.mPreviewing = false;
        if (currentIsMainThread()) {
            stopObjectTracking(false);
        }
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
            updateMutexModePreference();
            onShutterButtonFocus(true, 3);
            startVideoRecordingIfNeeded();
        }
    }

    private void startVideoRecordingIfNeeded() {
        if (this.mActivity.getCameraIntentManager().checkCallerLegality()) {
            if (this.mActivity.getCameraIntentManager().isOpenOnly()) {
                this.mActivity.getIntent().removeExtra(CameraExtras.TIMER_DURATION_SECONDS);
            } else {
                this.mActivity.getIntent().removeExtra(CameraExtras.CAMERA_OPEN_ONLY);
                int timerDurationSeconds = this.mActivity.getCameraIntentManager().getTimerDurationSeconds();
                if (timerDurationSeconds > 60) {
                    Log.e(TAG, "Caller delivered a wrong duration time large as 60s!");
                    return;
                }
                this.mHandler.postDelayed(new Runnable() {
                    public void run() {
                        VideoModule.this.onShutterButtonClick(VideoModule.this.getTriggerMode());
                    }
                }, timerDurationSeconds == -1 ? 1500 : (long) (timerDurationSeconds * 1000));
            }
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:56:0x0156  */
    /* JADX WARNING: Removed duplicated region for block: B:56:0x0156  */
    private boolean initializeRecorder() {
        /*
        r11 = this;
        r0 = TAG;
        r1 = "initializeRecorder>>";
        com.android.camera.log.Log.d(r0, r1);
        r0 = java.lang.System.currentTimeMillis();
        r2 = r11.getActivity();
        r3 = 0;
        if (r2 != 0) goto L_0x001a;
    L_0x0012:
        r0 = TAG;
        r1 = "initializeRecorder: null host";
        com.android.camera.log.Log.w(r0, r1);
        return r3;
    L_0x001a:
        r11.closeVideoFileDescriptor();
        r11.cleanupEmptyFile();
        r2 = r11.isCaptureIntent();
        if (r2 == 0) goto L_0x002f;
    L_0x0026:
        r2 = r11.mActivity;
        r2 = r2.getIntent();
        r11.parseIntent(r2);
    L_0x002f:
        r2 = r11.mVideoFileDescriptor;
        if (r2 != 0) goto L_0x004b;
    L_0x0033:
        r2 = r11.mOutputFormat;
        r4 = r11.mCurrentFileNumber;
        r5 = r11.isFPS960();
        r2 = r11.genContentValues(r2, r4, r5);
        r11.mCurrentVideoValues = r2;
        r2 = r11.mCurrentVideoValues;
        r4 = "_data";
        r2 = r2.getAsString(r4);
        r11.mCurrentVideoFilename = r2;
    L_0x004b:
        r2 = r11.mStopRecorderDone;
        if (r2 == 0) goto L_0x007c;
    L_0x004f:
        r4 = java.lang.System.currentTimeMillis();
        r2 = r11.mStopRecorderDone;	 Catch:{ InterruptedException -> 0x005d }
        r6 = 1000; // 0x3e8 float:1.401E-42 double:4.94E-321;
        r8 = java.util.concurrent.TimeUnit.MILLISECONDS;	 Catch:{ InterruptedException -> 0x005d }
        r2.await(r6, r8);	 Catch:{ InterruptedException -> 0x005d }
        goto L_0x0061;
    L_0x005d:
        r2 = move-exception;
        r2.printStackTrace();
    L_0x0061:
        r2 = TAG;
        r6 = new java.lang.StringBuilder;
        r6.<init>();
        r7 = "initializeRecorder: waitTime=";
        r6.append(r7);
        r7 = java.lang.System.currentTimeMillis();
        r7 = r7 - r4;
        r6.append(r7);
        r4 = r6.toString();
        com.android.camera.log.Log.d(r2, r4);
    L_0x007c:
        r4 = java.lang.System.currentTimeMillis();
        r2 = r11.mLock;
        monitor-enter(r2);
        r6 = r11.mMediaRecorder;	 Catch:{ all -> 0x017b }
        if (r6 != 0) goto L_0x0090;
    L_0x0088:
        r4 = new android.media.MediaRecorder;	 Catch:{ all -> 0x017b }
        r4.<init>();	 Catch:{ all -> 0x017b }
        r11.mMediaRecorder = r4;	 Catch:{ all -> 0x017b }
        goto L_0x00b4;
    L_0x0090:
        r6 = r11.mMediaRecorder;	 Catch:{ all -> 0x017b }
        r6.reset();	 Catch:{ all -> 0x017b }
        r6 = DEBUG;	 Catch:{ all -> 0x017b }
        if (r6 == 0) goto L_0x00b4;
    L_0x0099:
        r6 = TAG;	 Catch:{ all -> 0x017b }
        r7 = new java.lang.StringBuilder;	 Catch:{ all -> 0x017b }
        r7.<init>();	 Catch:{ all -> 0x017b }
        r8 = "initializeRecorder: t1=";
        r7.append(r8);	 Catch:{ all -> 0x017b }
        r8 = java.lang.System.currentTimeMillis();	 Catch:{ all -> 0x017b }
        r8 = r8 - r4;
        r7.append(r8);	 Catch:{ all -> 0x017b }
        r4 = r7.toString();	 Catch:{ all -> 0x017b }
        com.android.camera.log.Log.v(r6, r4);	 Catch:{ all -> 0x017b }
    L_0x00b4:
        monitor-exit(r2);	 Catch:{ all -> 0x017b }
        r2 = 0;
        r4 = 1;
        r5 = r11.mMediaRecorder;	 Catch:{ Exception -> 0x0131 }
        r11.setupRecorder(r5);	 Catch:{ Exception -> 0x0131 }
        r5 = r11.mVideoFileDescriptor;	 Catch:{ Exception -> 0x0131 }
        if (r5 == 0) goto L_0x00cc;
    L_0x00c0:
        r5 = r11.mMediaRecorder;	 Catch:{ Exception -> 0x0131 }
        r6 = r11.mVideoFileDescriptor;	 Catch:{ Exception -> 0x0131 }
        r6 = r6.getFileDescriptor();	 Catch:{ Exception -> 0x0131 }
        r5.setOutputFile(r6);	 Catch:{ Exception -> 0x0131 }
        goto L_0x00ea;
    L_0x00cc:
        r5 = com.android.camera.storage.Storage.isUseDocumentMode();	 Catch:{ Exception -> 0x0131 }
        if (r5 != 0) goto L_0x00da;
    L_0x00d2:
        r5 = r11.mMediaRecorder;	 Catch:{ Exception -> 0x0131 }
        r6 = r11.mCurrentVideoFilename;	 Catch:{ Exception -> 0x0131 }
        r5.setOutputFile(r6);	 Catch:{ Exception -> 0x0131 }
        goto L_0x00ea;
    L_0x00da:
        r5 = r11.mCurrentVideoFilename;	 Catch:{ Exception -> 0x0131 }
        r5 = com.android.camera.FileCompat.getParcelFileDescriptor(r5, r4);	 Catch:{ Exception -> 0x0131 }
        r2 = r11.mMediaRecorder;	 Catch:{ Exception -> 0x012c, all -> 0x0129 }
        r6 = r5.getFileDescriptor();	 Catch:{ Exception -> 0x012c, all -> 0x0129 }
        r2.setOutputFile(r6);	 Catch:{ Exception -> 0x012c, all -> 0x0129 }
        r2 = r5;
    L_0x00ea:
        r5 = r11.mMediaRecorder;	 Catch:{ Exception -> 0x0131 }
        r6 = r11.mRecorderSurface;	 Catch:{ Exception -> 0x0131 }
        r5.setInputSurface(r6);	 Catch:{ Exception -> 0x0131 }
        r5 = java.lang.System.currentTimeMillis();	 Catch:{ Exception -> 0x0131 }
        r7 = r11.mMediaRecorder;	 Catch:{ Exception -> 0x0131 }
        r7.prepare();	 Catch:{ Exception -> 0x0131 }
        r7 = r11.mMediaRecorder;	 Catch:{ Exception -> 0x0131 }
        r7.setOnErrorListener(r11);	 Catch:{ Exception -> 0x0131 }
        r7 = r11.mMediaRecorder;	 Catch:{ Exception -> 0x0131 }
        r7.setOnInfoListener(r11);	 Catch:{ Exception -> 0x0131 }
        r7 = DEBUG;	 Catch:{ Exception -> 0x0131 }
        if (r7 == 0) goto L_0x0123;
    L_0x0108:
        r7 = TAG;	 Catch:{ Exception -> 0x0131 }
        r8 = new java.lang.StringBuilder;	 Catch:{ Exception -> 0x0131 }
        r8.<init>();	 Catch:{ Exception -> 0x0131 }
        r9 = "initializeRecorder: t2=";
        r8.append(r9);	 Catch:{ Exception -> 0x0131 }
        r9 = java.lang.System.currentTimeMillis();	 Catch:{ Exception -> 0x0131 }
        r9 = r9 - r5;
        r8.append(r9);	 Catch:{ Exception -> 0x0131 }
        r5 = r8.toString();	 Catch:{ Exception -> 0x0131 }
        com.android.camera.log.Log.v(r7, r5);	 Catch:{ Exception -> 0x0131 }
    L_0x0123:
        com.android.camera.Util.closeSilently(r2);
        r3 = r4;
        goto L_0x0152;
    L_0x0129:
        r0 = move-exception;
        r2 = r5;
        goto L_0x0177;
    L_0x012c:
        r4 = move-exception;
        r2 = r5;
        goto L_0x0132;
    L_0x012f:
        r0 = move-exception;
        goto L_0x0177;
    L_0x0131:
        r4 = move-exception;
    L_0x0132:
        r5 = TAG;	 Catch:{ all -> 0x012f }
        r6 = new java.lang.StringBuilder;	 Catch:{ all -> 0x012f }
        r6.<init>();	 Catch:{ all -> 0x012f }
        r7 = "prepare failed for ";
        r6.append(r7);	 Catch:{ all -> 0x012f }
        r7 = r11.mCurrentVideoFilename;	 Catch:{ all -> 0x012f }
        r6.append(r7);	 Catch:{ all -> 0x012f }
        r6 = r6.toString();	 Catch:{ all -> 0x012f }
        com.android.camera.log.Log.e(r5, r6, r4);	 Catch:{ all -> 0x012f }
        r11.releaseMediaRecorder();	 Catch:{ all -> 0x012f }
        com.android.camera.Util.closeSilently(r2);
    L_0x0152:
        r2 = DEBUG;
        if (r2 == 0) goto L_0x015b;
    L_0x0156:
        r2 = r11.mRecorderSurface;
        r11.showSurfaceInfo(r2);
    L_0x015b:
        r2 = TAG;
        r4 = new java.lang.StringBuilder;
        r4.<init>();
        r5 = "initializeRecorder<<time=";
        r4.append(r5);
        r5 = java.lang.System.currentTimeMillis();
        r5 = r5 - r0;
        r4.append(r5);
        r0 = r4.toString();
        com.android.camera.log.Log.d(r2, r0);
        return r3;
    L_0x0177:
        com.android.camera.Util.closeSilently(r2);
        throw r0;
    L_0x017b:
        r0 = move-exception;
        monitor-exit(r2);	 Catch:{ all -> 0x017b }
        throw r0;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.module.VideoModule.initializeRecorder():boolean");
    }

    private void showSurfaceInfo(Surface surface) {
        boolean isValid = surface.isValid();
        boolean isSurfaceForHwVideoEncoder = SurfaceUtils.isSurfaceForHwVideoEncoder(surface);
        Size surfaceSize = SurfaceUtils.getSurfaceSize(surface);
        int surfaceFormat = SurfaceUtils.getSurfaceFormat(surface);
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("showSurfaceInfo: ");
        stringBuilder.append(surface);
        stringBuilder.append("|");
        stringBuilder.append(isValid);
        stringBuilder.append("|");
        stringBuilder.append(surfaceSize);
        stringBuilder.append("|");
        stringBuilder.append(surfaceFormat);
        stringBuilder.append("|");
        stringBuilder.append(isSurfaceForHwVideoEncoder);
        Log.d(str, stringBuilder.toString());
    }

    private void setupRecorder(MediaRecorder mediaRecorder) throws FileNotFoundException {
        int hevcVideoEncoderBitRate;
        int normalVideoFrameRate;
        boolean isNormalMode = isNormalMode();
        boolean isHFRMode = isHFRMode();
        boolean z = isNormalMode || isHFRMode || isFPS120() || isFPS240();
        mediaRecorder.setVideoSource(2);
        if (z) {
            mediaRecorder.setAudioSource(5);
        }
        mediaRecorder.setOutputFormat(this.mProfile.fileFormat);
        mediaRecorder.setVideoEncoder(this.mProfile.videoCodec);
        mediaRecorder.setVideoSize(this.mProfile.videoFrameWidth, this.mProfile.videoFrameHeight);
        int hSRValue = getHSRValue();
        if (hSRValue > 0) {
            mediaRecorder.setVideoFrameRate(hSRValue);
        } else {
            mediaRecorder.setVideoFrameRate(this.mProfile.videoFrameRate);
        }
        String str;
        StringBuilder stringBuilder;
        if (5 == this.mProfile.videoCodec) {
            hevcVideoEncoderBitRate = getHevcVideoEncoderBitRate(this.mProfile);
            str = TAG;
            stringBuilder = new StringBuilder();
            stringBuilder.append("H265 bitrate: ");
            stringBuilder.append(hevcVideoEncoderBitRate);
            Log.d(str, stringBuilder.toString());
        } else {
            hevcVideoEncoderBitRate = this.mProfile.videoBitRate;
            str = TAG;
            stringBuilder = new StringBuilder();
            stringBuilder.append("H264 bitrate: ");
            stringBuilder.append(hevcVideoEncoderBitRate);
            Log.d(str, stringBuilder.toString());
        }
        mediaRecorder.setVideoEncodingBitRate(hevcVideoEncoderBitRate);
        if (z) {
            mediaRecorder.setAudioEncodingBitRate(this.mProfile.audioBitRate);
            mediaRecorder.setAudioChannels(this.mProfile.audioChannels);
            mediaRecorder.setAudioSamplingRate(this.mProfile.audioSampleRate);
            mediaRecorder.setAudioEncoder(this.mProfile.audioCodec);
        }
        if (this.mCaptureTimeLapse) {
            mediaRecorder.setCaptureRate(1000.0d / ((double) this.mTimeBetweenTimeLapseFrameCaptureMs));
        } else if (!isNormalMode) {
            if (isHFRMode || ModuleManager.isVideoNewSlowMotion()) {
                mediaRecorder.setVideoFrameRate(this.mFrameRate);
                if (VERSION.SDK_INT < 28) {
                    normalVideoFrameRate = (int) ((((long) hevcVideoEncoderBitRate) * ((long) this.mFrameRate)) / ((long) getNormalVideoFrameRate()));
                } else {
                    normalVideoFrameRate = ((this.mFrameRate / getNormalVideoFrameRate()) / 2) * hevcVideoEncoderBitRate;
                }
                mediaRecorder.setVideoEncodingBitRate(normalVideoFrameRate);
            }
            mediaRecorder.setCaptureRate((double) this.mFrameRate);
        } else if (hSRValue > 0) {
            mediaRecorder.setVideoFrameRate(hSRValue);
            mediaRecorder.setCaptureRate((double) hSRValue);
        }
        mediaRecorder.setMaxDuration(this.mMaxVideoDurationInMs);
        Location currentLocation = LocationManager.instance().getCurrentLocation();
        if (currentLocation != null) {
            mediaRecorder.setLocation((float) currentLocation.getLatitude(), (float) currentLocation.getLongitude());
        }
        normalVideoFrameRate = SystemProperties.getInt("camera.debug.video_max_size", 0);
        long recorderMaxFileSize = getRecorderMaxFileSize(normalVideoFrameRate);
        if (recorderMaxFileSize > 0) {
            String str2 = TAG;
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("maxFileSize=");
            stringBuilder2.append(recorderMaxFileSize);
            Log.v(str2, stringBuilder2.toString());
            mediaRecorder.setMaxFileSize(recorderMaxFileSize);
            if (recorderMaxFileSize > VIDEO_MAX_SINGLE_FILE_SIZE) {
                setParameterExtra(mediaRecorder, "param-use-64bit-offset=1");
            }
        }
        if (!DataRepository.dataItemFeature().fi() || (normalVideoFrameRate <= 0 && recorderMaxFileSize != VIDEO_MAX_SINGLE_FILE_SIZE)) {
            setSplitWhenReachMaxSize(false);
        } else {
            setSplitWhenReachMaxSize(true);
        }
        if (isFPS240()) {
            try {
                setParameterExtra(mediaRecorder, "video-param-i-frames-interval=0.033");
            } catch (Throwable e) {
                Log.e(TAG, e.getMessage(), e);
            }
        }
        mediaRecorder.setOrientationHint(getRecorderOrientationHint());
        this.mOrientationCompensationAtRecordStart = this.mOrientationCompensation;
    }

    private void setParameterExtra(MediaRecorder mediaRecorder, String str) {
        Class[] clsArr = new Class[]{MediaRecorder.class};
        Method method = Util.getMethod(clsArr, "setParameter", "(Ljava/lang/String;)V");
        if (method != null) {
            method.invoke(clsArr[0], mediaRecorder, str);
        }
    }

    private int getHevcVideoEncoderBitRate(CamcorderProfile camcorderProfile) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(camcorderProfile.videoFrameWidth);
        stringBuilder.append("x");
        stringBuilder.append(camcorderProfile.videoFrameHeight);
        stringBuilder.append(":");
        stringBuilder.append(camcorderProfile.videoFrameRate);
        String stringBuilder2 = stringBuilder.toString();
        if (HEVC_VIDEO_ENCODER_BITRATE.containsKey(stringBuilder2)) {
            return ((Integer) HEVC_VIDEO_ENCODER_BITRATE.get(stringBuilder2)).intValue();
        }
        String str = TAG;
        StringBuilder stringBuilder3 = new StringBuilder();
        stringBuilder3.append("no pre-defined bitrate for ");
        stringBuilder3.append(stringBuilder2);
        Log.d(str, stringBuilder3.toString());
        return camcorderProfile.videoBitRate;
    }

    private long getRecorderMaxFileSize(int i) {
        long leftSpace = Storage.getLeftSpace() - Storage.LOW_STORAGE_THRESHOLD;
        if (i > 0) {
            long j = (long) i;
            if (j < leftSpace) {
                leftSpace = j;
            }
        }
        if (leftSpace > VIDEO_MAX_SINGLE_FILE_SIZE && DataRepository.dataItemFeature().fi()) {
            leftSpace = VIDEO_MAX_SINGLE_FILE_SIZE;
        } else if (leftSpace < VIDEO_MIN_SINGLE_FILE_SIZE) {
            leftSpace = VIDEO_MIN_SINGLE_FILE_SIZE;
        }
        if (this.mIntentRequestSize <= 0 || this.mIntentRequestSize >= leftSpace) {
            return leftSpace;
        }
        return this.mIntentRequestSize;
    }

    private void setSplitWhenReachMaxSize(boolean z) {
        this.mSplitWhenReachMaxSize = z;
    }

    private boolean isSplitWhenReachMaxSize() {
        return this.mSplitWhenReachMaxSize;
    }

    private int getRecorderOrientationHint() {
        int sensorOrientation = this.mCameraCapabilities.getSensorOrientation();
        if (this.mOrientation == -1) {
            return sensorOrientation;
        }
        if (isFrontCamera()) {
            return ((sensorOrientation - this.mOrientation) + ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT) % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT;
        }
        return (sensorOrientation + this.mOrientation) % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT;
    }

    private void releaseMediaRecorder() {
        MediaRecorder mediaRecorder;
        Log.v(TAG, "releaseRecorder");
        synchronized (this.mLock) {
            mediaRecorder = this.mMediaRecorder;
            this.mMediaRecorder = null;
        }
        if (mediaRecorder != null) {
            cleanupEmptyFile();
            long currentTimeMillis = System.currentTimeMillis();
            mediaRecorder.reset();
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("releaseRecorder: t1=");
            stringBuilder.append(System.currentTimeMillis() - currentTimeMillis);
            Log.v(str, stringBuilder.toString());
            currentTimeMillis = System.currentTimeMillis();
            mediaRecorder.release();
            str = TAG;
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("releaseRecorder: t2=");
            stringBuilder2.append(System.currentTimeMillis() - currentTimeMillis);
            Log.v(str, stringBuilder2.toString());
        }
    }

    public void onError(MediaRecorder mediaRecorder, int i, int i2) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("MediaRecorder error. what=");
        stringBuilder.append(i);
        stringBuilder.append(" extra=");
        stringBuilder.append(i2);
        Log.e(str, stringBuilder.toString());
        if (i == 1 || i == 100) {
            if (this.mMediaRecorderRecording) {
                stopVideoRecording(true, false);
            }
            this.mActivity.getScreenHint().updateHint();
        }
    }

    public void onInfo(MediaRecorder mediaRecorder, int i, int i2) {
        String str;
        StringBuilder stringBuilder;
        if (this.mMediaRecorderRecording) {
            String str2;
            StringBuilder stringBuilder2;
            switch (i) {
                case 800:
                    stopVideoRecording(true, false);
                    break;
                case 801:
                    str2 = TAG;
                    stringBuilder2 = new StringBuilder();
                    stringBuilder2.append("reached max size. fileNumber=");
                    stringBuilder2.append(this.mCurrentFileNumber);
                    Log.w(str2, stringBuilder2.toString());
                    stopVideoRecording(true, false);
                    if (!this.mActivity.getScreenHint().isScreenHintVisible()) {
                        Toast.makeText(this.mActivity, R.string.video_reach_size_limit, 1).show();
                        break;
                    }
                    break;
                case 802:
                    boolean isSplitWhenReachMaxSize = isSplitWhenReachMaxSize();
                    str2 = TAG;
                    stringBuilder2 = new StringBuilder();
                    stringBuilder2.append("max file size is approaching. split: ");
                    stringBuilder2.append(isSplitWhenReachMaxSize);
                    Log.d(str2, stringBuilder2.toString());
                    if (isSplitWhenReachMaxSize) {
                        this.mCurrentFileNumber++;
                        ContentValues genContentValues = genContentValues(this.mOutputFormat, this.mCurrentFileNumber);
                        str2 = genContentValues.getAsString("_data");
                        String str3 = TAG;
                        stringBuilder2 = new StringBuilder();
                        stringBuilder2.append("nextVideoPath: ");
                        stringBuilder2.append(str2);
                        Log.d(str3, stringBuilder2.toString());
                        if (setNextOutputFile(str2)) {
                            this.mNextVideoValues = genContentValues;
                            this.mNextVideoFileName = str2;
                            break;
                        }
                    }
                    break;
                case 803:
                    Log.d(TAG, "next output file started");
                    onMaxFileSizeReached();
                    this.mCurrentVideoValues = this.mNextVideoValues;
                    this.mCurrentVideoFilename = this.mNextVideoFileName;
                    this.mNextVideoValues = null;
                    this.mNextVideoFileName = null;
                    break;
                default:
                    str = TAG;
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("onInfo what : ");
                    stringBuilder.append(i);
                    Log.w(str, stringBuilder.toString());
                    break;
            }
            return;
        }
        str = TAG;
        stringBuilder = new StringBuilder();
        stringBuilder.append("onInfo: ignore event ");
        stringBuilder.append(i);
        Log.w(str, stringBuilder.toString());
    }

    private boolean setNextOutputFile(String str) {
        if (TextUtils.isEmpty(str)) {
            Log.w(TAG, "setNextOutputFile, filePath is empty");
            return false;
        }
        ParcelFileDescriptor parcelFileDescriptor;
        try {
            parcelFileDescriptor = FileCompat.getParcelFileDescriptor(str, true);
            boolean nextOutputFile = CompatibilityUtils.setNextOutputFile(this.mMediaRecorder, parcelFileDescriptor.getFileDescriptor());
            if (parcelFileDescriptor != null) {
                parcelFileDescriptor.close();
            }
            return nextOutputFile;
        } catch (Throwable th) {
            String str2 = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("open file failed, filePath ");
            stringBuilder.append(str);
            Log.d(str2, stringBuilder.toString(), th);
            return false;
        } catch (Throwable th2) {
            r2.addSuppressed(th2);
        }
    }

    private void onMaxFileSizeReached() {
        if (this.mCurrentVideoFilename != null) {
            saveVideo(this.mCurrentVideoFilename, this.mCurrentVideoValues, false, false);
            this.mCurrentVideoValues = null;
            this.mCurrentVideoFilename = null;
        }
    }

    private Uri saveVideo(String str, ContentValues contentValues, boolean z, boolean z2) {
        if (this.mActivity != null) {
            String str2 = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("saveVideo: path=");
            stringBuilder.append(str);
            stringBuilder.append(" isFinal=");
            stringBuilder.append(z);
            Log.w(str2, stringBuilder.toString());
            if (z2) {
                return this.mActivity.getImageSaver().addVideoSync(str, contentValues, false);
            }
            this.mActivity.getImageSaver().addVideo(str, contentValues, z);
        } else {
            String str3 = TAG;
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("saveVideo: failed to save ");
            stringBuilder2.append(str);
            Log.w(str3, stringBuilder2.toString());
        }
        return null;
    }

    protected void startVideoRecording() {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("startVideoRecording: mode=");
        stringBuilder.append(this.mSpeed);
        Log.v(str, stringBuilder.toString());
        if (isDeviceAlive()) {
            ScenarioTrackUtil.trackStartVideoRecordStart(this.mSpeed, isFrontCamera());
            this.mCurrentFileNumber = isCaptureIntent() ? -1 : 0;
            silenceSounds();
            if (startRecorder()) {
                ((ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162)).processingStart();
                updatePreferenceTrampoline(UpdateConstant.VIDEO_TYPES_RECORD);
                if (isHFRMode() || isSlowMode() || ModuleManager.isVideoNewSlowMotion()) {
                    this.mCamera2Device.startHighSpeedRecording();
                } else {
                    this.mCamera2Device.startRecording();
                }
                Log.v(TAG, "startVideoRecording process done");
                ScenarioTrackUtil.trackStartVideoRecordEnd();
                onStartRecorderSucceed();
                ThermalDetector.getInstance().startWatch();
                return;
            }
            onStartRecorderFail();
        }
    }

    private boolean startRecorder() {
        if (!initializeRecorder()) {
            return false;
        }
        try {
            this.mMediaRecorder.start();
            this.mMediaRecorderWorking = true;
            return true;
        } catch (Throwable e) {
            Log.e(TAG, "could not start recorder", e);
            if (e instanceof IllegalStateException) {
                showConfirmMessage(R.string.confirm_recording_fail_title, R.string.confirm_recording_fail_recorder_busy_alert);
            }
            return false;
        }
    }

    private void onStartRecorderFail() {
        enableCameraControls(true);
        releaseMediaRecorder();
        this.mAudioManager.abandonAudioFocus(null);
        restoreMusicSound();
        ((ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162)).processingFailed();
    }

    private void onStartRecorderSucceed() {
        if (!isFPS960()) {
            enableCameraControls(true);
        }
        this.mActivity.sendBroadcast(new Intent(VideoBase.START_VIDEO_RECORDING_ACTION));
        this.mMediaRecorderWorking = true;
        this.mMediaRecorderRecording = true;
        this.mMediaRecorderRecordingPaused = false;
        this.mRecordingStartTime = SystemClock.uptimeMillis();
        this.mPauseClickTime = SystemClock.uptimeMillis();
        this.mRecordingTime = "";
        this.mTelephonyManager.listen(this.mPhoneStateListener, 32);
        Log.v(TAG, "listen call state");
        if (CameraSettings.isVideoBokehOn()) {
            countDownForVideoBokeh();
        } else {
            updateRecordingTime();
        }
        keepScreenOn();
        AutoLockManager.getInstance(this.mActivity).removeMessage();
        trackGeneralInfo(1, false);
        keepPowerSave();
    }

    private void countDownForVideoBokeh() {
        if (this.mMediaRecorderRecording) {
            if (this.mCountDownTimer != null) {
                this.mCountDownTimer.cancel();
            }
            this.mCountDownTimer = new CountDownTimer(30450, 1000) {
                public void onTick(long j) {
                    String millisecondToTimeString = Util.millisecondToTimeString((j + 950) - VideoModule.START_OFFSET_MS, false);
                    if (VideoModule.this.mTopAlert != null) {
                        VideoModule.this.mTopAlert.updateRecordingTime(millisecondToTimeString);
                    }
                }

                public void onFinish() {
                    VideoModule.this.stopVideoRecording(true, false);
                }
            };
            this.mCountDownTimer.start();
        }
    }

    public void stopVideoRecording(boolean z, boolean z2) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("stopVideoRecording>>");
        stringBuilder.append(this.mMediaRecorderRecording);
        stringBuilder.append("|");
        stringBuilder.append(z);
        stringBuilder.append("|");
        stringBuilder.append(this.mMediaRecorderPostProcessing);
        Log.v(str, stringBuilder.toString());
        if (this.mMediaRecorderRecording && (!isFPS960() || !this.mMediaRecorderPostProcessing)) {
            long currentTimeMillis = System.currentTimeMillis();
            if (isFPS960()) {
                this.mMediaRecorderPostProcessing = true;
            } else {
                this.mMediaRecorderRecording = false;
            }
            enableCameraControls(false);
            if (this.mCamera2Device != null) {
                this.mCamera2Device.stopRecording(z ? null : this);
            }
            if (this.mCountDownTimer != null && CameraSettings.isVideoBokehOn()) {
                this.mCountDownTimer.cancel();
            }
            if (!isFPS960()) {
                ((ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162)).processingFinish();
            }
            if (!(this.mCamera2Device == null || ModuleManager.isVideoNewSlowMotion())) {
                CameraStatUtil.trackVideoRecorded(isFrontCamera(), this.mSpeed, this.mQuality, this.mCamera2Device.getFlashMode(), this.mFrameRate, this.mTimeBetweenTimeLapseFrameCaptureMs, this.mBeautyValues, this.mVideoRecordTime);
            }
            this.mVideoRecordTime = 0;
            if (z) {
                stopRecorder();
                startPreviewAfterRecord();
            } else {
                this.mPendingStopRecorder = true;
                this.mHandler.sendEmptyMessageDelayed(46, 300);
            }
            AutoLockManager.getInstance(this.mActivity).hibernateDelayed();
            exitSavePowerMode();
            String str2 = TAG;
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("stopVideoRecording<<time=");
            stringBuilder2.append(System.currentTimeMillis() - currentTimeMillis);
            Log.v(str2, stringBuilder2.toString());
        }
    }

    protected void onWaitStopCallbackTimeout() {
        stopRecorder();
        startPreviewAfterRecord();
    }

    private boolean isActivityResumed() {
        Camera activity = getActivity();
        return (activity == null || activity.isActivityPaused()) ? false : true;
    }

    @SuppressLint({"CheckResult"})
    private void stopRecorder() {
        this.mPendingStopRecorder = false;
        this.mHandler.removeMessages(46);
        Single.create(new SingleOnSubscribe<Boolean>() {
            public void subscribe(SingleEmitter<Boolean> singleEmitter) throws Exception {
                VideoModule.this.mStopRecorderDone = new CountDownLatch(1);
                long currentTimeMillis = System.currentTimeMillis();
                ScenarioTrackUtil.trackStopVideoRecordStart(VideoModule.this.mSpeed, VideoModule.this.isFrontCamera());
                try {
                    VideoModule.this.mMediaRecorder.setOnErrorListener(null);
                    VideoModule.this.mMediaRecorder.setOnInfoListener(null);
                    VideoModule.this.mMediaRecorder.stop();
                } catch (Throwable e) {
                    Log.e(VideoBase.TAG, "failed to stop media recorder", e);
                    if (VideoModule.this.mCurrentVideoFilename != null) {
                        VideoModule.this.deleteVideoFile(VideoModule.this.mCurrentVideoFilename);
                        VideoModule.this.mCurrentVideoFilename = null;
                    }
                }
                if (!(VideoModule.this.mPaused || VideoModule.this.mActivity.isActivityPaused())) {
                    VideoModule.this.playCameraSound(3);
                }
                VideoModule.this.releaseMediaRecorder();
                VideoModule.this.mStopRecorderDone.countDown();
                String str = VideoBase.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("releaseTime=");
                stringBuilder.append(System.currentTimeMillis() - currentTimeMillis);
                Log.d(str, stringBuilder.toString());
                currentTimeMillis = SystemClock.uptimeMillis() - VideoModule.this.mRecordingStartTime;
                if (VideoModule.this.mCamera2Device != null && ModuleManager.isVideoNewSlowMotion() && (VideoModule.this.isFPS120() || VideoModule.this.isFPS240())) {
                    CameraStatUtil.trackNewSlowMotionVideoRecorded(VideoModule.this.isFPS120() ? CameraSettings.VIDEO_MODE_120 : CameraSettings.VIDEO_MODE_240, VideoModule.this.mQuality, VideoModule.this.mCamera2Device.getFlashMode(), VideoModule.this.mFrameRate, currentTimeMillis / 1000);
                }
                if (VideoModule.this.mCurrentVideoFilename != null && VideoModule.this.isFPS960()) {
                    if (FragmentTopAlert.HINT_DELAY_TIME - currentTimeMillis > 100 || !VideoModule.this.isActivityResumed()) {
                        str = VideoBase.TAG;
                        stringBuilder = new StringBuilder();
                        stringBuilder.append("uncomplete video.=");
                        stringBuilder.append(currentTimeMillis);
                        Log.d(str, stringBuilder.toString());
                        VideoModule.this.deleteVideoFile(VideoModule.this.mCurrentVideoFilename);
                        VideoModule.this.mCurrentVideoFilename = null;
                        CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_FPS960_TOO_SHORT);
                    } else {
                        ActionProcessing actionProcessing = (ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162);
                        if (actionProcessing != null) {
                            actionProcessing.processingPostAction();
                        }
                        currentTimeMillis = System.currentTimeMillis();
                        str = VideoModule.this.postProcessVideo(VideoModule.this.mCurrentVideoFilename);
                        String str2 = VideoBase.TAG;
                        StringBuilder stringBuilder2 = new StringBuilder();
                        stringBuilder2.append("processTime=");
                        stringBuilder2.append(System.currentTimeMillis() - currentTimeMillis);
                        Log.d(str2, stringBuilder2.toString());
                        if (str == null) {
                            VideoModule.this.mCurrentVideoFilename = null;
                            VideoModule.this.mCurrentVideoValues = null;
                            CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_FPS960_PROCESS_FAILED);
                        } else {
                            VideoModule.this.mCurrentVideoFilename = str;
                            VideoModule.this.mCurrentVideoValues.put("_data", str);
                            CameraStatUtil.trackNewSlowMotionVideoRecorded(CameraSettings.VIDEO_MODE_960, VideoModule.this.mQuality, VideoModule.this.mCamera2Device.getFlashMode(), 960, 10);
                        }
                    }
                }
                singleEmitter.onSuccess(Boolean.TRUE);
            }
        }).subscribeOn(GlobalConstant.sCameraSetupScheduler).observeOn(AndroidSchedulers.mainThread()).subscribe(new Consumer<Boolean>() {
            public void accept(Boolean bool) throws Exception {
                VideoModule.this.onMediaRecorderReleased();
            }
        });
    }

    private void onMediaRecorderReleased() {
        String str;
        Log.d(TAG, "onMediaRecorderReleased>>");
        long currentTimeMillis = System.currentTimeMillis();
        this.mAudioManager.abandonAudioFocus(null);
        restoreMusicSound();
        if (isCaptureIntent() && !this.mPaused) {
            if (this.mCurrentVideoUri == null && this.mCurrentVideoFilename != null) {
                this.mCurrentVideoUri = saveVideo(this.mCurrentVideoFilename, this.mCurrentVideoValues, true, true);
                str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onMediaRecorderReleased: outputUri=");
                stringBuilder.append(this.mCurrentVideoUri);
                Log.d(str, stringBuilder.toString());
            }
            boolean z = this.mCurrentVideoUri != null;
            if (this.mQuickCapture) {
                doReturnToCaller(z);
            } else if (z) {
                showAlert();
            }
        }
        if (this.mCurrentVideoFilename != null) {
            if (!isCaptureIntent()) {
                saveVideo(this.mCurrentVideoFilename, this.mCurrentVideoValues, true, false);
            }
            this.mCurrentVideoFilename = null;
            this.mCurrentVideoValues = null;
        } else if (!(this.mPaused || this.mActivity.isActivityPaused())) {
            this.mActivity.getThumbnailUpdater().getLastThumbnail();
        }
        if (isFPS960()) {
            AndroidSchedulers.mainThread().scheduleDirect(new Runnable() {
                public void run() {
                    ActionProcessing actionProcessing = (ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162);
                    if (actionProcessing != null) {
                        actionProcessing.processingFinish();
                    }
                }
            });
        }
        this.mActivity.sendBroadcast(new Intent(VideoBase.STOP_VIDEO_RECORDING_ACTION));
        this.mTelephonyManager.listen(this.mPhoneStateListener, 0);
        Log.v(TAG, "listen none");
        enableCameraControls(true);
        if (!AutoFocus.LEGACY_CONTINUOUS_VIDEO.equals(this.mVideoFocusMode)) {
            this.mFocusManager.resetFocusStateIfNeeded();
            if (!(this.mPaused || this.mActivity.isActivityPaused())) {
                this.mMainProtocol.clearFocusView(2);
                setVideoFocusMode(AutoFocus.LEGACY_CONTINUOUS_VIDEO, false);
                updatePreferenceInWorkThread(14);
            }
        }
        keepScreenOnAwhile();
        str = TAG;
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append("onMediaRecorderReleased<<time=");
        stringBuilder2.append(System.currentTimeMillis() - currentTimeMillis);
        Log.d(str, stringBuilder2.toString());
        ScenarioTrackUtil.trackStopVideoRecordEnd();
        doLaterReleaseIfNeed();
        if (isFPS960()) {
            this.mMediaRecorderPostProcessing = false;
            this.mMediaRecorderRecording = false;
        }
        this.mMediaRecorderWorking = false;
        this.mHandler.post(new Runnable() {
            public void run() {
                VideoModule.this.handlePendingScreenSlide();
            }
        });
        ThermalDetector.getInstance().stopWatch();
    }

    protected void doLaterReleaseIfNeed() {
        super.doLaterReleaseIfNeed();
        if (isFPS960() && !this.mActivity.isActivityPaused() && this.mActivity.getCameraScreenNail().getSurfaceCreatedTimestamp() != this.mSurfaceCreatedTimestamp) {
            restartModule();
        }
    }

    /* JADX WARNING: Missing block: B:12:0x0048, code:
            if (r3 == null) goto L_0x004a;
     */
    private java.lang.String postProcessVideo(java.lang.String r8) {
        /*
        r7 = this;
        r0 = 0;
        if (r8 != 0) goto L_0x0004;
    L_0x0003:
        return r0;
        r1 = new java.io.File;
        r1.<init>(r8);
        r2 = new java.io.File;
        r3 = new java.lang.StringBuilder;
        r3.<init>();
        r3.append(r8);
        r8 = ".bak";
        r3.append(r8);
        r8 = r3.toString();
        r2.<init>(r8);
        r8 = new java.io.File;
        r3 = com.android.camera.storage.Storage.DIRECTORY;
        r4 = r1.getName();
        r8.<init>(r3, r4);
        r3 = 0;
        r4 = r1.getAbsolutePath();	 Catch:{ Throwable -> 0x005a }
        r5 = r2.getAbsolutePath();	 Catch:{ Throwable -> 0x005a }
        r4 = com.miui.extravideo.interpolation.VideoInterpolator.doDecodeAndEncodeSync(r4, r5);	 Catch:{ Throwable -> 0x005a }
        if (r4 == 0) goto L_0x0048;
    L_0x003a:
        r4 = r1.delete();	 Catch:{ Throwable -> 0x005a }
        if (r4 == 0) goto L_0x0048;
    L_0x0040:
        r4 = r2.renameTo(r8);	 Catch:{ Throwable -> 0x005a }
        if (r4 == 0) goto L_0x0048;
    L_0x0046:
        r3 = 1;
    L_0x0048:
        if (r3 != 0) goto L_0x0063;
    L_0x004a:
        r4 = TAG;
        r5 = "960fps processing failed. delete the files.";
        com.android.camera.log.Log.e(r4, r5);
        r1.delete();
        r2.delete();
        goto L_0x0063;
    L_0x0058:
        r8 = move-exception;
        goto L_0x006b;
    L_0x005a:
        r4 = move-exception;
        r5 = TAG;	 Catch:{ all -> 0x0058 }
        r6 = "960fps processing failed.";
        com.android.camera.log.Log.e(r5, r6, r4);	 Catch:{ all -> 0x0058 }
        goto L_0x004a;
    L_0x0063:
        if (r3 == 0) goto L_0x006a;
    L_0x0065:
        r0 = r8.getAbsolutePath();
    L_0x006a:
        return r0;
        r0 = TAG;
        r3 = "960fps processing failed. delete the files.";
        com.android.camera.log.Log.e(r0, r3);
        r1.delete();
        r2.delete();
        throw r8;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.module.VideoModule.postProcessVideo(java.lang.String):java.lang.String");
    }

    protected void updateRecordingTime() {
        super.updateRecordingTime();
        if (this.mMediaRecorderRecording && !isFPS960() && !CameraSettings.isVideoBokehOn()) {
            boolean z;
            long max;
            String millisecondToTimeString;
            long uptimeMillis = SystemClock.uptimeMillis() - this.mRecordingStartTime;
            if (this.mMediaRecorderRecordingPaused) {
                uptimeMillis = this.mVideoRecordedDuration;
            }
            if (this.mMaxVideoDurationInMs == 0 || uptimeMillis < ((long) (this.mMaxVideoDurationInMs - LinkSelectorConfiguration.MS_OF_ONE_MIN))) {
                z = false;
            } else {
                z = true;
            }
            if (z) {
                max = Math.max(0, ((long) this.mMaxVideoDurationInMs) - uptimeMillis) + 999;
            } else {
                max = uptimeMillis;
            }
            long j = 1000;
            if (isNormalMode() || isHFRMode()) {
                this.mVideoRecordTime = max / 1000;
                millisecondToTimeString = Util.millisecondToTimeString(max, false);
            } else {
                double d;
                long j2;
                if (CameraSettings.VIDEO_SPEED_FAST.equals(this.mSpeed)) {
                    d = (double) this.mTimeBetweenTimeLapseFrameCaptureMs;
                    j2 = (long) d;
                } else if (isSlowMode() && isShowHFRDuration()) {
                    d = 1000.0d / ((double) this.mFrameRate);
                    j2 = (long) ((1000 * getNormalVideoFrameRate()) / this.mFrameRate);
                } else {
                    j2 = 1000;
                    d = 0.0d;
                }
                if (d != 0.0d) {
                    millisecondToTimeString = Util.millisecondToTimeString(getSpeedRecordVideoLength(uptimeMillis, d), CameraSettings.VIDEO_SPEED_FAST.equals(this.mSpeed));
                    if (millisecondToTimeString.equals(this.mRecordingTime)) {
                        j = (long) d;
                    }
                } else {
                    millisecondToTimeString = Util.millisecondToTimeString(max, false);
                }
                j = j2;
            }
            if (this.mTopAlert != null) {
                this.mTopAlert.updateRecordingTime(millisecondToTimeString);
            }
            this.mRecordingTime = millisecondToTimeString;
            if (this.mRecordingTimeCountsDown != z) {
                this.mRecordingTimeCountsDown = z;
            }
            long j3 = 500;
            if (!this.mMediaRecorderRecordingPaused) {
                j3 = j - (uptimeMillis % j);
            }
            this.mHandler.sendEmptyMessageDelayed(42, j3);
        }
    }

    protected boolean isShowHFRDuration() {
        return true;
    }

    protected int getNormalVideoFrameRate() {
        if (isHFRMode() || isSlowMode() || this.mProfile == null) {
            return 30;
        }
        return this.mProfile.videoFrameRate;
    }

    private long getSpeedRecordVideoLength(long j, double d) {
        if (d == 0.0d) {
            return 0;
        }
        return (long) (((((double) j) / d) / ((double) getNormalVideoFrameRate())) * 1000.0d);
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
        if (isEisOn()) {
            Log.d(TAG, "videoStabilization: EIS");
            this.mCamera2Device.setEnableEIS(true);
            this.mCamera2Device.setEnableOIS(false);
            this.mActivity.getCameraScreenNail().setVideoStabilizationCropped(true);
        } else {
            Log.d(TAG, "videoStabilization: OIS");
            this.mCamera2Device.setEnableEIS(false);
            this.mCamera2Device.setEnableOIS(true);
            this.mActivity.getCameraScreenNail().setVideoStabilizationCropped(false);
        }
    }

    private static boolean isSupport4KUHDEIS() {
        return DataRepository.dataItemFeature().isSupport4KUHDEIS();
    }

    private boolean isEisOn() {
        return this.mQuality != 0 && ((!CameraSettings.is4KHigherVideoQuality(this.mQuality) || isSupport4KUHDEIS()) && isBackCamera() && !isBeautyOn() && CameraSettings.isMovieSolidOn() && getHSRValue() != 60 && isNormalMode());
    }

    private void setJpegQuality() {
        if (isDeviceAlive()) {
            int jpegEncodingQualityParameter = CameraProfile.getJpegEncodingQualityParameter(this.mBogusCameraId, 2);
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("jpegQuality=");
            stringBuilder.append(jpegEncodingQualityParameter);
            Log.d(str, stringBuilder.toString());
            this.mCamera2Device.setJpegQuality(jpegEncodingQualityParameter);
        }
    }

    private void updateMutexModePreference() {
        if ("on".equals(DataRepository.dataItemConfig().getComponentHdr().getComponentValue(this.mModuleIndex))) {
            this.mMutexModePicker.setMutexMode(2);
        }
    }

    public void onSingleTapUp(int i, int i2) {
        if (!this.mPaused && this.mCamera2Device != null && this.mCamera2Device.isSessionReady() && !this.mSnapshotInProgress && isInTapableRect(i, i2)) {
            if (!isFrameAvailable()) {
                Log.w(TAG, "onSingleTapUp: frame not available");
            } else if ((!isFrontCamera() || !this.mActivity.isScreenSlideOff()) && !((BackStack) ModeCoordinatorImpl.getInstance().getAttachProtocol(171)).handleBackStackFromTapDown(i, i2)) {
                if (this.mObjectTrackingStarted) {
                    stopObjectTracking(false);
                }
                unlockAEAF();
                this.mMainProtocol.setFocusViewType(true);
                this.mTouchFocusStartingTime = System.currentTimeMillis();
                Point point = new Point(i, i2);
                mapTapCoordinate(point);
                this.mFocusManager.onSingleTapUp(point.x, point.y);
            }
        }
    }

    public boolean isNeedHapticFeedback() {
        return !this.mMediaRecorderRecording || this.mMediaRecorderRecordingPaused;
    }

    public boolean isNeedMute() {
        return super.isNeedMute() || this.mObjectTrackingStarted || (this.mMediaRecorderRecording && !this.mMediaRecorderRecordingPaused);
    }

    public boolean onGestureTrack(RectF rectF, boolean z) {
        if (this.mInStartingFocusRecording || !isBackCamera() || !b.gg() || CameraSettings.is4KHigherVideoQuality(this.mQuality) || isCaptureIntent()) {
            return false;
        }
        return initializeObjectTrack(rectF, z);
    }

    private boolean initializeObjectTrack(RectF rectF, boolean z) {
        mapTapCoordinate(rectF);
        stopObjectTracking(false);
        return this.mMainProtocol.initializeObjectTrack(rectF, z);
    }

    /* JADX WARNING: Missing block: B:24:0x00a0, code:
            return false;
     */
    public boolean takeVideoSnapShoot() {
        /*
        r4 = this;
        r0 = r4.mPaused;
        r1 = 0;
        if (r0 != 0) goto L_0x00a0;
    L_0x0005:
        r0 = r4.mActivity;
        r0 = r0.isActivityPaused();
        if (r0 != 0) goto L_0x00a0;
    L_0x000d:
        r0 = r4.mSnapshotInProgress;
        if (r0 != 0) goto L_0x00a0;
    L_0x0011:
        r0 = r4.mMediaRecorderRecording;
        if (r0 != 0) goto L_0x0017;
    L_0x0015:
        goto L_0x00a0;
    L_0x0017:
        r0 = r4.isDeviceAlive();
        if (r0 != 0) goto L_0x001e;
    L_0x001d:
        return r1;
    L_0x001e:
        r0 = com.android.camera.storage.Storage.isLowStorageAtLastPoint();
        r2 = 1;
        if (r0 == 0) goto L_0x0031;
    L_0x0025:
        r0 = TAG;
        r3 = "capture: low storage";
        com.android.camera.log.Log.w(r0, r3);
        r4.stopVideoRecording(r2, r1);
        return r1;
    L_0x0031:
        r0 = r4.mActivity;
        r0 = r0.getImageSaver();
        r0 = r0.isBusy();
        if (r0 == 0) goto L_0x0051;
    L_0x003d:
        r0 = TAG;
        r2 = "capture: ImageSaver is full";
        com.android.camera.log.Log.w(r0, r2);
        r0 = r4.mActivity;
        r0 = com.android.camera.ui.RotateTextToast.getInstance(r0);
        r2 = 2131427758; // 0x7f0b01ae float:1.8477141E38 double:1.053065232E-314;
        r0.show(r2, r1);
        return r1;
    L_0x0051:
        r0 = r4.mBogusCameraId;
        r1 = r4.mOrientation;
        r0 = com.android.camera.Util.getJpegRotation(r0, r1);
        r1 = r4.mCamera2Device;
        r1.setJpegRotation(r0);
        r0 = com.android.camera.LocationManager.instance();
        r0 = r0.getCurrentLocation();
        r1 = r4.mCamera2Device;
        r1.setGpsLocation(r0);
        r4.setJpegQuality();
        r4.updateFrontMirror();
        r1 = com.mi.config.b.gK();
        if (r1 == 0) goto L_0x0078;
    L_0x0077:
        goto L_0x0085;
    L_0x0078:
        r1 = r4.mActivity;
        r1 = r1.getCameraScreenNail();
        r3 = r4.getCameraRotation();
        r1.animateCapture(r3);
    L_0x0085:
        r1 = TAG;
        r3 = "capture: start";
        com.android.camera.log.Log.v(r1, r3);
        r1 = r4.mCamera2Device;
        r3 = new com.android.camera.module.VideoModule$JpegPictureCallback;
        r3.<init>(r0);
        r1.captureVideoSnapshot(r3);
        r4.mSnapshotInProgress = r2;
        r0 = r4.isFrontCamera();
        com.android.camera.statistic.CameraStatUtil.trackVideoSnapshot(r0);
        return r2;
    L_0x00a0:
        return r1;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.module.VideoModule.takeVideoSnapShoot():boolean");
    }

    public void startObjectTracking() {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("startObjectTracking: started=");
        stringBuilder.append(this.mObjectTrackingStarted);
        Log.d(str, stringBuilder.toString());
    }

    public void onObjectStable() {
    }

    public void stopObjectTracking(boolean z) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("stopObjectTracking: started=");
        stringBuilder.append(this.mObjectTrackingStarted);
        Log.d(str, stringBuilder.toString());
    }

    public void onPauseButtonClick() {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("onPauseButtonClick: isRecordingPaused=");
        stringBuilder.append(this.mMediaRecorderRecordingPaused);
        stringBuilder.append(" isRecording=");
        stringBuilder.append(this.mMediaRecorderRecording);
        Log.d(str, stringBuilder.toString());
        long currentTimeMillis = System.currentTimeMillis();
        if (this.mMediaRecorderRecording && currentTimeMillis - this.mPauseClickTime >= 500) {
            this.mPauseClickTime = currentTimeMillis;
            ActionProcessing actionProcessing = (ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162);
            if (this.mMediaRecorderRecordingPaused) {
                try {
                    if (VERSION.SDK_INT >= 24) {
                        CompatibilityUtils.resumeMediaRecorder(this.mMediaRecorder);
                    } else {
                        this.mMediaRecorder.start();
                    }
                    this.mRecordingStartTime = SystemClock.uptimeMillis() - this.mVideoRecordedDuration;
                    this.mVideoRecordedDuration = 0;
                    this.mMediaRecorderRecordingPaused = false;
                    this.mHandler.removeMessages(42);
                    this.mRecordingTime = "";
                    updateRecordingTime();
                    actionProcessing.processingResume();
                } catch (Throwable e) {
                    Log.e(TAG, "failed to resume media recorder", e);
                    releaseMediaRecorder();
                    actionProcessing.processingFinish();
                }
            } else {
                pauseVideoRecording();
                CameraStatUtil.trackPauseVideoRecording(isFrontCamera());
                actionProcessing.processingPause();
            }
            Log.d(TAG, "onPauseButtonClick");
        }
    }

    private void pauseVideoRecording() {
        Log.d(TAG, "pauseVideoRecording");
        if (this.mMediaRecorderRecording && !this.mMediaRecorderRecordingPaused) {
            try {
                pauseMediaRecorder(this.mMediaRecorder);
            } catch (IllegalStateException e) {
                Log.e(TAG, "failed to pause media recorder");
            }
            this.mVideoRecordedDuration = SystemClock.uptimeMillis() - this.mRecordingStartTime;
            this.mMediaRecorderRecordingPaused = true;
            this.mHandler.removeMessages(42);
            updateRecordingTime();
        }
    }

    protected void pauseMediaRecorder(MediaRecorder mediaRecorder) {
        CompatibilityUtils.pauseMediaRecorder(mediaRecorder);
    }

    private void releaseResources() {
        closeCamera();
        releaseMediaRecorder();
    }

    public void consumePreference(@UpdateType int... iArr) {
        for (int i : iArr) {
            if (i == 1) {
                updatePictureAndPreviewSize();
            } else if (i == 3) {
                updateFocusArea();
            } else if (i == 5) {
                updateFace();
            } else if (i == 40) {
                updateFrontMirror();
            } else if (i != 42) {
                switch (i) {
                    case 9:
                        String str;
                        if (b.ge() && (isHFRMode() || isSlowMode())) {
                            str = "0";
                        } else {
                            str = CameraSettings.getAntiBanding();
                        }
                        updateAntiBanding(str);
                        break;
                    case 10:
                        updateFlashPreference();
                        break;
                    case 11:
                        continue;
                    case 12:
                        setEvValue();
                        break;
                    case 13:
                        updateBeauty();
                        break;
                    case 14:
                        updateVideoFocusMode();
                        break;
                    default:
                        switch (i) {
                            case 19:
                                updateFpsRange();
                                break;
                            case 20:
                                continue;
                            default:
                                switch (i) {
                                    case 24:
                                        setZoomRatio(getZoomValue());
                                        break;
                                    case 25:
                                        focusCenter();
                                        break;
                                    default:
                                        switch (i) {
                                            case 29:
                                                updateExposureMeteringMode();
                                                break;
                                            case 30:
                                                continue;
                                            case 31:
                                                updateVideoStabilization();
                                                break;
                                            default:
                                                switch (i) {
                                                    case 33:
                                                        if (this.mCamera2Device == null) {
                                                            break;
                                                        }
                                                        this.mCamera2Device.setVideoSnapshotSize(this.mPictureSize);
                                                        break;
                                                    case 34:
                                                        continue;
                                                    case 35:
                                                        updateDeviceOrientation();
                                                        break;
                                                    default:
                                                        if (!DEBUG) {
                                                            String str2 = TAG;
                                                            StringBuilder stringBuilder = new StringBuilder();
                                                            stringBuilder.append("no consumer for this updateType: ");
                                                            stringBuilder.append(i);
                                                            Log.w(str2, stringBuilder.toString());
                                                            break;
                                                        }
                                                        StringBuilder stringBuilder2 = new StringBuilder();
                                                        stringBuilder2.append("no consumer for this updateType: ");
                                                        stringBuilder2.append(i);
                                                        throw new RuntimeException(stringBuilder2.toString());
                                                }
                                        }
                                }
                        }
                }
            } else {
                continue;
            }
        }
    }

    private void updateFrontMirror() {
        boolean z = isFrontCamera() && CameraSettings.isFrontMirror();
        this.mCamera2Device.setFrontMirror(z);
    }

    private void updatePictureAndPreviewSize() {
        int i;
        int i2;
        double d = ((double) this.mProfile.videoFrameWidth) / ((double) this.mProfile.videoFrameHeight);
        CameraSize optimalVideoSnapshotPictureSize = Util.getOptimalVideoSnapshotPictureSize(this.mCameraCapabilities.getSupportedOutputSize(MediaRecorder.class), d, this.mProfile.videoFrameWidth, this.mProfile.videoFrameHeight);
        this.mVideoSize = optimalVideoSnapshotPictureSize;
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("videoSize: ");
        stringBuilder.append(optimalVideoSnapshotPictureSize.toString());
        Log.d(str, stringBuilder.toString());
        int i3 = Integer.MAX_VALUE;
        if (b.gD()) {
            i3 = optimalVideoSnapshotPictureSize.width;
            i = optimalVideoSnapshotPictureSize.height;
        } else {
            i = Integer.MAX_VALUE;
        }
        CameraSize optimalVideoSnapshotPictureSize2 = Util.getOptimalVideoSnapshotPictureSize(this.mCameraCapabilities.getSupportedOutputSize(256), d, i3, i);
        this.mPictureSize = optimalVideoSnapshotPictureSize2;
        String str2 = TAG;
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append("pictureSize: ");
        stringBuilder2.append(optimalVideoSnapshotPictureSize2);
        Log.d(str2, stringBuilder2.toString());
        if (optimalVideoSnapshotPictureSize.width > Util.sWindowHeight || optimalVideoSnapshotPictureSize.width < Util.LIMIT_SURFACE_WIDTH) {
            i = Util.sWindowHeight;
            i2 = Util.sWindowWidth;
        } else {
            i = optimalVideoSnapshotPictureSize.width;
            i2 = optimalVideoSnapshotPictureSize.height;
        }
        this.mPreviewSize = Util.getOptimalVideoSnapshotPictureSize(this.mCameraCapabilities.getSupportedOutputSize(SurfaceTexture.class), d, i, i2);
        String str3 = TAG;
        StringBuilder stringBuilder3 = new StringBuilder();
        stringBuilder3.append("previewSize: ");
        stringBuilder3.append(this.mPreviewSize);
        Log.d(str3, stringBuilder3.toString());
        updateCameraScreenNailSize(this.mPreviewSize.width, this.mPreviewSize.height);
    }

    protected boolean enableFaceDetection() {
        return (isHFRMode() || isSlowMode() || ModuleManager.isVideoNewSlowMotion() || !DataRepository.dataItemGlobal().getBoolean(CameraSettings.KEY_FACE_DETECTION, getResources().getBoolean(R.bool.pref_camera_facedetection_default))) ? false : true;
    }

    protected boolean isZoomEnabled() {
        if (isFPS960() && this.mMediaRecorderRecording) {
            return false;
        }
        return super.isZoomEnabled();
    }

    private void updateFpsRange() {
        if (isDeviceAlive()) {
            String str;
            StringBuilder stringBuilder;
            if (isHFRMode() || isSlowMode() || ModuleManager.isVideoNewSlowMotion()) {
                str = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("mHfrFPSLower = ");
                stringBuilder.append(this.mHfrFPSLower);
                stringBuilder.append(", mHfrFPSUpper = ");
                stringBuilder.append(this.mHfrFPSUpper);
                Log.d(str, stringBuilder.toString());
                this.mCamera2Device.setVideoFpsRange(new Range(Integer.valueOf(this.mHfrFPSLower), Integer.valueOf(this.mHfrFPSUpper)));
            } else {
                Range[] supportedFpsRange = this.mCameraCapabilities.getSupportedFpsRange();
                int i = 0;
                Range range = supportedFpsRange[0];
                int length = supportedFpsRange.length;
                while (i < length) {
                    Range range2 = supportedFpsRange[i];
                    int hSRValue = getHSRValue();
                    if (hSRValue == 60) {
                        range = new Range(Integer.valueOf(hSRValue), Integer.valueOf(hSRValue));
                        break;
                    }
                    if (((Integer) range.getUpper()).intValue() < ((Integer) range2.getUpper()).intValue() || (range.getUpper() == range2.getUpper() && ((Integer) range.getLower()).intValue() < ((Integer) range2.getLower()).intValue())) {
                        range = range2;
                    }
                    i++;
                }
                str = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("bestRange = ");
                stringBuilder.append(range);
                Log.d(str, stringBuilder.toString());
                this.mCamera2Device.setFpsRange(range);
                this.mCamera2Device.setVideoFpsRange(range);
            }
        }
    }

    public void onPreviewSessionSuccess(CameraCaptureSession cameraCaptureSession) {
        super.onPreviewSessionSuccess(cameraCaptureSession);
        if (isCreated()) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("onPreviewSessionSuccess: session=");
            stringBuilder.append(cameraCaptureSession);
            Log.d(str, stringBuilder.toString());
            this.mFaceDetectionEnabled = false;
            updatePreferenceInWorkThread(UpdateConstant.VIDEO_TYPES_ON_PREVIEW_SUCCESS);
            enableCameraControls(true);
            return;
        }
        Log.w(TAG, "onPreviewSessionSuccess: module is not ready");
        enableCameraControls(true);
    }

    public void onPreviewSessionFailed(CameraCaptureSession cameraCaptureSession) {
        super.onPreviewSessionFailed(cameraCaptureSession);
        enableCameraControls(true);
    }

    public void onVideoRecordStopped() {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("onVideoRecordStopped: ");
        stringBuilder.append(this.mPendingStopRecorder);
        Log.d(str, stringBuilder.toString());
        if (this.mPendingStopRecorder) {
            stopRecorder();
            startPreviewAfterRecord();
        }
    }

    private boolean needImageThumbnail(int i) {
        if (i != 12) {
            return true;
        }
        return false;
    }

    public void onUserInteraction() {
        super.onUserInteraction();
        if (this.mMediaRecorderRecording) {
            keepPowerSave();
        }
    }

    protected boolean isAEAFLockSupported() {
        return (this.mMediaRecorderRecording && isFPS960()) ? false : true;
    }

    public boolean isPostProcessing() {
        return this.mMediaRecorderPostProcessing;
    }

    public boolean isUnInterruptable() {
        if (!(super.isUnInterruptable() || isNormalMode() || this.mMediaRecorder == null || !this.mMediaRecorderWorking)) {
            this.mUnInterruptableReason = "recorder release";
        }
        return this.mUnInterruptableReason != null;
    }

    protected int getOperatingMode() {
        boolean isFrontCamera = isFrontCamera();
        int i = CameraCapabilities.SESSION_OPERATION_MODE_VIDEO_BEAUTY;
        boolean z = false;
        if (!isFrontCamera) {
            int i2 = 61456;
            if (!(this.mCameraCapabilities.isSupportVideoBeauty() && isBeautyOn())) {
                if (this.mQuality == 0) {
                    i = 0;
                } else {
                    if (isEisOn()) {
                        i2 = 32772;
                    }
                    i = i2;
                }
            }
            if (CameraSettings.isFovcEnabled()) {
                if (i != 0) {
                    z = true;
                }
                this.mFovcEnabled = z;
            }
            if (getHSRValue() == 60) {
                return CameraCapabilities.SESSION_OPERATION_MODE_HSR_60;
            }
            return i;
        } else if (CameraSettings.isVideoBokehOn()) {
            return 32770;
        } else {
            if (this.mCameraCapabilities.isSupportVideoBeauty()) {
                return CameraCapabilities.SESSION_OPERATION_MODE_VIDEO_BEAUTY;
            }
            return 0;
        }
    }
}
