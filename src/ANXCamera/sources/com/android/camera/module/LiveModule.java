package com.android.camera.module;

import android.app.AlertDialog.Builder;
import android.content.ContentValues;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.SurfaceTexture;
import android.hardware.SensorEvent;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CaptureResult;
import android.location.Location;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.SystemClock;
import android.support.annotation.MainThread;
import android.util.Range;
import android.view.KeyEvent;
import android.view.Surface;
import android.view.View;
import android.widget.Toast;
import com.android.camera.BasePreferenceActivity;
import com.android.camera.CameraAppImpl;
import com.android.camera.CameraPreferenceActivity;
import com.android.camera.CameraSettings;
import com.android.camera.LocationManager;
import com.android.camera.R;
import com.android.camera.SensorStateManager.SensorStateListener;
import com.android.camera.Util;
import com.android.camera.constant.UpdateConstant;
import com.android.camera.data.DataRepository;
import com.android.camera.effect.EffectController;
import com.android.camera.effect.FaceAnalyzeInfo;
import com.android.camera.fragment.CtaNoticeFragment;
import com.android.camera.fragment.beauty.LiveBeautyFilterFragment.LiveFilterItem;
import com.android.camera.log.Log;
import com.android.camera.module.loader.FunctionParseAsdFace;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.android.camera.module.loader.camera2.FocusManager2;
import com.android.camera.module.loader.camera2.FocusManager2.Listener;
import com.android.camera.module.loader.camera2.FocusTask;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.BackStack;
import com.android.camera.protocol.ModeProtocol.CameraAction;
import com.android.camera.protocol.ModeProtocol.FullScreenProtocol;
import com.android.camera.protocol.ModeProtocol.LiveConfigChanges;
import com.android.camera.protocol.ModeProtocol.LiveVideoEditor;
import com.android.camera.protocol.ModeProtocol.MainContentProtocol;
import com.android.camera.protocol.ModeProtocol.OnFaceBeautyChangedProtocol;
import com.android.camera.protocol.ModeProtocol.RecordState;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera.storage.Storage;
import com.android.camera2.Camera2Proxy.CameraPreviewCallback;
import com.android.camera2.Camera2Proxy.FaceDetectionCallback;
import com.android.camera2.Camera2Proxy.FocusCallback;
import com.android.camera2.CameraCapabilities;
import com.android.camera2.CameraHardwareFace;
import com.mi.config.b;
import com.ss.android.medialib.TTRecorder.SlamDetectListener;
import com.ss.android.ttve.oauth.TEOAuthResult;
import io.reactivex.BackpressureStrategy;
import io.reactivex.Flowable;
import io.reactivex.FlowableEmitter;
import io.reactivex.FlowableOnSubscribe;
import io.reactivex.disposables.Disposable;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class LiveModule extends BaseModule implements Listener, CameraAction, OnFaceBeautyChangedProtocol, CameraPreviewCallback, FaceDetectionCallback, FocusCallback {
    private static final int BEAUTY_SWITCH = 8;
    private static final int FILTER_SWITCH = 2;
    private static final int STICKER_SWITCH = 4;
    private static final String TAG = LiveModule.class.getSimpleName();
    private boolean m3ALocked;
    private String mBaseFileName;
    private CtaNoticeFragment mCtaNoticeFragment;
    protected boolean mFaceDetectionEnabled;
    protected boolean mFaceDetectionStarted;
    private FocusManager2 mFocusManager;
    private MainHandler mHandler;
    private boolean mIsRecording = false;
    private LiveConfigChanges mLiveConfigChanges;
    private LiveVideoEditor mLiveVideoEditor;
    private Disposable mMetaDataDisposable;
    private FlowableEmitter<CaptureResult> mMetaDataFlowableEmitter;
    private int mOldOriginVolumeStream;
    private long mOnResumeTime;
    private int mQuality = 5;
    private boolean mSaved;
    protected SensorStateListener mSensorStateListener = new SensorStateListener() {
        public void onDeviceBecomeStable() {
            Log.v(LiveModule.TAG, "onDeviceBecomeStable");
        }

        public boolean isWorking() {
            return LiveModule.this.isAlive() && LiveModule.this.getCameraState() != 0;
        }

        public void onDeviceKeepMoving(double d) {
            if (!LiveModule.this.mMainProtocol.isEvAdjusted(true) && !LiveModule.this.mPaused && Util.isTimeout(System.currentTimeMillis(), LiveModule.this.mTouchFocusStartingTime, 3000) && !LiveModule.this.is3ALocked() && LiveModule.this.mFocusManager != null && LiveModule.this.mFocusManager.isNeedCancelAutoFocus() && !LiveModule.this.isVideoRecording()) {
                LiveModule.this.mFocusManager.onDeviceKeepMoving(d);
            }
        }

        public void onDeviceBeginMoving() {
        }

        public void onDeviceKeepStable() {
        }

        public void onDeviceOrientationChanged(float f, boolean z) {
        }

        public void notifyDevicePostureChanged() {
            LiveModule.this.mActivity.getEdgeShutterView().onDevicePostureChanged();
        }

        public void onDeviceRotationChanged(float[] fArr) {
            if (LiveModule.this.mLiveConfigChanges != null) {
                LiveModule.this.mLiveConfigChanges.onDeviceRotationChange(fArr);
            }
        }

        public void onSensorChanged(SensorEvent sensorEvent) {
            if (LiveModule.this.mLiveConfigChanges != null) {
                LiveModule.this.mLiveConfigChanges.onSensorChanged(sensorEvent);
            }
        }
    };
    protected boolean mShowFace = false;
    private long mTouchFocusStartingTime;

    private class MainHandler extends Handler {
        public MainHandler(Looper looper) {
            super(looper);
        }

        public void handleMessage(Message message) {
            int i = message.what;
            if (i == 2) {
                LiveModule.this.getWindow().clearFlags(128);
            } else if (i == 4) {
                LiveModule.this.checkActivityOrientation();
                if (SystemClock.uptimeMillis() - LiveModule.this.mOnResumeTime < 5000) {
                    LiveModule.this.mHandler.sendEmptyMessageDelayed(4, 100);
                }
            } else if (i == 9) {
                LiveModule.this.mMainProtocol.initializeFocusView(LiveModule.this);
            } else if (i == 17) {
                LiveModule.this.mHandler.removeMessages(17);
                LiveModule.this.mHandler.removeMessages(2);
                LiveModule.this.getWindow().addFlags(128);
                LiveModule.this.mHandler.sendEmptyMessageDelayed(2, (long) LiveModule.this.getScreenDelay());
            } else if (i != 31) {
                boolean z = true;
                if (i == 35) {
                    LiveModule liveModule = LiveModule.this;
                    boolean z2 = message.arg1 > 0;
                    if (message.arg2 <= 0) {
                        z = false;
                    }
                    liveModule.handleUpdateFaceView(z2, z);
                } else if (i == 51 && !LiveModule.this.mActivity.isActivityPaused()) {
                    LiveModule.this.mOpenCameraFail = true;
                    LiveModule.this.onCameraException();
                }
            } else {
                LiveModule.this.setOrientationParameter();
            }
        }
    }

    public void onBeautyChanged() {
        updatePreferenceTrampoline(13);
    }

    public void registerProtocol() {
        super.registerProtocol();
        ModeCoordinatorImpl.getInstance().attachProtocol(161, this);
        ModeCoordinatorImpl.getInstance().attachProtocol(167, this);
        ModeCoordinatorImpl.getInstance().attachProtocol(169, this);
        ModeCoordinatorImpl.getInstance().attachProtocol(167, this);
        ModeCoordinatorImpl.getInstance().attachProtocol(199, this);
        getActivity().getImplFactory().initAdditional(getActivity(), 164, 212);
    }

    public void unRegisterProtocol() {
        super.unRegisterProtocol();
        ModeCoordinatorImpl.getInstance().detachProtocol(161, this);
        ModeCoordinatorImpl.getInstance().detachProtocol(167, this);
        ModeCoordinatorImpl.getInstance().detachProtocol(169, this);
        ModeCoordinatorImpl.getInstance().detachProtocol(167, this);
        ModeCoordinatorImpl.getInstance().detachProtocol(199, this);
        getActivity().getImplFactory().detachAdditional();
    }

    public void unRegisterModulePersistProtocol() {
        super.unRegisterModulePersistProtocol();
        getActivity().getImplFactory().detachModulePersistent();
    }

    public void onCreate(int i, int i2) {
        super.onCreate(i, i2);
        this.mActivity.getSensorStateManager().setSensorStateListener(this.mSensorStateListener);
        this.mHandler = new MainHandler(this.mActivity.getMainLooper());
        onCameraOpened();
        this.mHandler.sendEmptyMessage(4);
        this.mHandler.sendEmptyMessage(31);
        this.mActivity.getSensorStateManager().setRotationVectorEnabled(true);
    }

    protected void onCameraOpened() {
        super.onCameraOpened();
        initializeFocusManager();
        updatePreferenceTrampoline(UpdateConstant.FUN_TYPES_INIT);
        switch (initLiveConfig()) {
            case FAIL:
            case EXPIRED:
            case NOT_MATCH:
                showAuthError();
                return;
            default:
                startPreview();
                if (DataRepository.dataItemGlobal().isFirstShowCTAConCollect()) {
                    this.mCtaNoticeFragment = CtaNoticeFragment.showCta(getActivity().getFragmentManager(), false, null);
                }
                this.mOnResumeTime = SystemClock.uptimeMillis();
                this.mHandler.sendEmptyMessage(4);
                this.mHandler.sendEmptyMessage(31);
                initMetaParser();
                return;
        }
    }

    private void showAuthError() {
        this.mHandler.post(new Runnable() {
            public void run() {
                Builder builder = new Builder(LiveModule.this.mActivity);
                builder.setTitle(R.string.live_error_title);
                builder.setMessage(R.string.live_error_message);
                builder.setCancelable(false);
                builder.setPositiveButton(R.string.live_error_confirm, new OnClickListener() {
                    public void onClick(DialogInterface dialogInterface, int i) {
                        LiveModule.this.mActivity.startActivity(new Intent("android.settings.DATE_SETTINGS"));
                    }
                });
                builder.setNegativeButton(R.string.snap_cancel, new OnClickListener() {
                    public void onClick(DialogInterface dialogInterface, int i) {
                    }
                });
                builder.show();
            }
        });
    }

    public void initializeCapabilities() {
        super.initializeCapabilities();
        this.mContinuousFocusSupported = Util.isSupported(4, this.mCameraCapabilities.getSupportedFocusModes());
        this.mMaxFaceCount = this.mCameraCapabilities.getMaxFaceCount();
    }

    private TEOAuthResult initLiveConfig() {
        this.mLiveConfigChanges = (LiveConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(201);
        this.mLiveVideoEditor = (LiveVideoEditor) ModeCoordinatorImpl.getInstance().getAttachProtocol(209);
        if (this.mLiveConfigChanges == null) {
            getActivity().getImplFactory().initModulePersistent(getActivity(), 201, 209);
            this.mLiveConfigChanges = (LiveConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(201);
            this.mLiveVideoEditor = (LiveVideoEditor) ModeCoordinatorImpl.getInstance().getAttachProtocol(209);
            this.mLiveConfigChanges.initResource();
        }
        return this.mLiveConfigChanges.getAuthResult();
    }

    private void initMetaParser() {
        this.mMetaDataDisposable = Flowable.create(new FlowableOnSubscribe<CaptureResult>() {
            public void subscribe(FlowableEmitter<CaptureResult> flowableEmitter) throws Exception {
                LiveModule.this.mMetaDataFlowableEmitter = flowableEmitter;
            }
        }, BackpressureStrategy.DROP).map(new FunctionParseAsdFace(this, isFrontCamera())).subscribe();
    }

    public void onPreviewLayoutChanged(Rect rect) {
        this.mActivity.onLayoutChange(rect);
        if (this.mFocusManager != null && this.mActivity.getCameraScreenNail() != null) {
            this.mFocusManager.setRenderSize(this.mActivity.getCameraScreenNail().getRenderWidth(), this.mActivity.getCameraScreenNail().getRenderHeight());
            this.mFocusManager.setPreviewSize(rect.width(), rect.height());
        }
    }

    public void onPreviewSizeChanged(int i, int i2) {
        if (this.mFocusManager != null) {
            this.mFocusManager.setPreviewSize(i, i2);
        }
    }

    protected void consumePreference(int... iArr) {
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
                case 43:
                case 50:
                    break;
                case 12:
                    setEvValue();
                    break;
                case 13:
                    updateBeauty();
                    break;
                case 14:
                    updateFocusMode();
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
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("no consumer for this updateType: ");
                    stringBuilder.append(i);
                    throw new RuntimeException(stringBuilder.toString());
            }
        }
    }

    private void updateBeauty() {
        float faceBeautyRatio = ((float) CameraSettings.getFaceBeautyRatio(CameraSettings.KEY_LIVE_SHRINK_FACE_RATIO, 40)) / 100.0f;
        float faceBeautyRatio2 = ((float) CameraSettings.getFaceBeautyRatio(CameraSettings.KEY_LIVE_ENLARGE_EYE_RATIO, 40)) / 100.0f;
        float faceBeautyRatio3 = ((float) CameraSettings.getFaceBeautyRatio(CameraSettings.KEY_LIVE_SMOOTH_STRENGTH, 40)) / 100.0f;
        if (faceBeautyRatio > 0.0f || faceBeautyRatio2 > 0.0f || faceBeautyRatio3 > 0.0f) {
            CameraSettings.setLiveBeautyStatus(true);
            if (this.mLiveConfigChanges != null) {
                this.mLiveConfigChanges.setBeautyFaceReshape(true, faceBeautyRatio2, faceBeautyRatio);
                this.mLiveConfigChanges.setBeautify(true, faceBeautyRatio3);
            }
        } else {
            CameraSettings.setLiveBeautyStatus(false);
            if (this.mLiveConfigChanges != null) {
                this.mLiveConfigChanges.setBeautyFaceReshape(false, faceBeautyRatio2, faceBeautyRatio);
                this.mLiveConfigChanges.setBeautify(false, faceBeautyRatio3);
            }
        }
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("shrinkFaceRatio->");
        stringBuilder.append(faceBeautyRatio);
        stringBuilder.append(",enlargEyeRatio->");
        stringBuilder.append(faceBeautyRatio2);
        stringBuilder.append(",smoothStrengthRatio->");
        stringBuilder.append(faceBeautyRatio3);
        Log.d(str, stringBuilder.toString());
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

    protected int getOperatingMode() {
        if (isEisOn()) {
            return 32772;
        }
        if (DataRepository.dataItemFeature().fg()) {
            return CameraCapabilities.SESSION_OPERATION_MODE_MCTF;
        }
        return 0;
    }

    public void onResume() {
        super.onResume();
        keepScreenOnAwhile();
    }

    public void onPause() {
        super.onPause();
        if (this.mFocusManager != null) {
            this.mFocusManager.removeMessages();
        }
        tryRemoveCountDownMessage();
        this.mActivity.getSensorStateManager().reset();
        resetScreenOn();
        closeCamera();
        if (this.mHandler != null) {
            this.mHandler.removeCallbacksAndMessages(null);
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

    public void onStop() {
        super.onStop();
        if (this.mHandler != null) {
            this.mHandler.removeCallbacksAndMessages(null);
        }
    }

    public void onDestroy() {
        super.onDestroy();
        if (this.mCtaNoticeFragment != null) {
            this.mCtaNoticeFragment.dismiss();
        }
        this.mHandler.post(-$$Lambda$LiveModule$QVM-tqWYbz8yPiLYvpxAglWLw-g.INSTANCE);
        if (this.mHandler != null) {
            this.mHandler.sendEmptyMessage(45);
        }
        this.mActivity.getSensorStateManager().setRotationVectorEnabled(false);
        this.mActivity.getSensorStateManager().setTTARSensorEnabled(false);
    }

    static /* synthetic */ void lambda$onDestroy$0() {
        MainContentProtocol mainContentProtocol = (MainContentProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(166);
        if (mainContentProtocol != null) {
            mainContentProtocol.setCenterHint(8, null, null, 0);
        }
    }

    public void closeCamera() {
        if (this.mMetaDataFlowableEmitter != null) {
            this.mMetaDataFlowableEmitter.onComplete();
        }
        if (this.mMetaDataDisposable != null) {
            this.mMetaDataDisposable.dispose();
        }
        if (this.mCamera2Device != null) {
            this.mCamera2Device.setFocusCallback(null);
            this.mCamera2Device.setErrorCallback(null);
            this.mCamera2Device = null;
        }
    }

    public void startPreview() {
        this.mCamera2Device.setFocusCallback(this);
        this.mCamera2Device.setMetaDataCallback(this);
        this.mCamera2Device.setErrorCallback(this.mErrorCallback);
        this.mCamera2Device.setPictureSize(this.mPictureSize);
        this.mCamera2Device.setPreviewSize(this.mPreviewSize);
        this.mQuality = Util.convertSizeToQuality(this.mPreviewSize);
        this.mSurfaceCreatedTimestamp = this.mActivity.getCameraScreenNail().getSurfaceCreatedTimestamp();
        Log.d(TAG, "LiveModule, startPreview");
        checkDisplayOrientation();
        this.mLiveConfigChanges.initPreview(this.mPreviewSize.width, this.mPreviewSize.height, isFrontCamera(), isFrontCamera() ? 270 : 90);
        this.mLiveVideoEditor.setEncodeSize(this.mPreviewSize.width, this.mPreviewSize.height);
        this.mLiveConfigChanges.startPreview(new Surface(this.mActivity.getCameraScreenNail().getSurfaceTexture()), new SlamDetectListener() {
            public void onSlam(boolean z) {
                if (z) {
                    Log.d(LiveModule.TAG, "onSlam open, register tt ar sensor");
                    LiveModule.this.mActivity.getSensorStateManager().setTTARSensorEnabled(true);
                    return;
                }
                Log.d(LiveModule.TAG, "onSlam close, unregister tt ar sensor");
                LiveModule.this.mActivity.getSensorStateManager().setTTARSensorEnabled(false);
            }
        });
        if (!isSelectingCapturedResult()) {
            this.mCamera2Device.startPreviewSession(new Surface(this.mLiveConfigChanges.getInputSurfaceTexture()), true, false, getOperatingMode(), false, this);
        }
    }

    public void pausePreview() {
        this.mCamera2Device.pausePreview();
        setCameraState(0);
    }

    public void resumePreview() {
        previewWhenSessionSuccess();
    }

    private void showPreview() {
        pausePreview();
        this.mSaved = false;
        ((FullScreenProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(196)).startLiveRecordPreview(genContentValues(2, 0, false));
    }

    private String createName(long j, int i) {
        if (i > 0) {
            return this.mBaseFileName;
        }
        this.mBaseFileName = new SimpleDateFormat(getString(R.string.video_file_name_format), Locale.ENGLISH).format(new Date(j));
        return this.mBaseFileName;
    }

    private ContentValues genContentValues(int i, int i2, boolean z) {
        String format;
        String stringBuilder;
        StringBuilder stringBuilder2;
        long currentTimeMillis = System.currentTimeMillis();
        String createName = createName(currentTimeMillis, i2);
        if (i2 > 0) {
            format = String.format(Locale.ENGLISH, "_%d", new Object[]{Integer.valueOf(i2)});
            StringBuilder stringBuilder3 = new StringBuilder();
            stringBuilder3.append(createName);
            stringBuilder3.append(format);
            createName = stringBuilder3.toString();
        }
        StringBuilder stringBuilder4 = new StringBuilder();
        stringBuilder4.append(createName);
        stringBuilder4.append(Util.convertOutputFormatToFileExt(i));
        format = stringBuilder4.toString();
        String convertOutputFormatToMimeType = Util.convertOutputFormatToMimeType(i);
        StringBuilder stringBuilder5;
        if (z) {
            stringBuilder5 = new StringBuilder();
            stringBuilder5.append(Storage.CAMERA_TEMP_DIRECTORY);
            stringBuilder5.append('/');
            stringBuilder5.append(format);
            stringBuilder = stringBuilder5.toString();
            stringBuilder2 = new StringBuilder();
            stringBuilder2.append(Storage.CAMERA_TEMP_DIRECTORY);
            stringBuilder2.append(File.separator);
            stringBuilder2.append(Storage.AVOID_SCAN_FILE_NAME);
            Util.createFile(new File(stringBuilder2.toString()));
        } else {
            stringBuilder5 = new StringBuilder();
            stringBuilder5.append(Storage.DIRECTORY);
            stringBuilder5.append('/');
            stringBuilder5.append(format);
            stringBuilder = stringBuilder5.toString();
        }
        String str = TAG;
        stringBuilder2 = new StringBuilder();
        stringBuilder2.append("genContentValues: path=");
        stringBuilder2.append(stringBuilder);
        Log.v(str, stringBuilder2.toString());
        ContentValues contentValues = new ContentValues(8);
        contentValues.put("title", createName);
        contentValues.put("_display_name", format);
        contentValues.put("datetaken", Long.valueOf(currentTimeMillis));
        contentValues.put("mime_type", convertOutputFormatToMimeType);
        contentValues.put("_data", stringBuilder);
        stringBuilder4 = new StringBuilder();
        stringBuilder4.append(Integer.toString(this.mPreviewSize.width));
        stringBuilder4.append("x");
        stringBuilder4.append(Integer.toString(this.mPreviewSize.height));
        contentValues.put("resolution", stringBuilder4.toString());
        Location currentLocation = LocationManager.instance().getCurrentLocation();
        if (!(currentLocation == null || (currentLocation.getLatitude() == 0.0d && currentLocation.getLongitude() == 0.0d))) {
            contentValues.put("latitude", Double.valueOf(currentLocation.getLatitude()));
            contentValues.put("longitude", Double.valueOf(currentLocation.getLongitude()));
        }
        return contentValues;
    }

    public void onShutterButtonClick(int i) {
        if (this.mLiveConfigChanges.isRecording() || this.mLiveConfigChanges.isRecordingPaused()) {
            stopVideoRecording(true, false);
            return;
        }
        startVideoRecording();
        BackStack backStack = (BackStack) ModeCoordinatorImpl.getInstance().getAttachProtocol(171);
        if (backStack != null) {
            backStack.handleBackStackFromShutter();
        }
    }

    @MainThread
    private void startVideoRecording() {
        keepScreenOn();
        RecordState recordState = (RecordState) ModeCoordinatorImpl.getInstance().getAttachProtocol(212);
        recordState.onPrepare();
        this.mLiveConfigChanges.onRecordStart();
        recordState.onStart();
        trackLiveRecordingParams();
        this.mIsRecording = true;
        this.mOldOriginVolumeStream = getActivity().getVolumeControlStream();
        getActivity().setVolumeControlStream(3);
    }

    private void trackLiveRecordingParams() {
        boolean z;
        boolean z2;
        boolean z3;
        int liveAllSwitchAllValue = CameraSettings.getLiveAllSwitchAllValue();
        String str = CameraSettings.getCurrentLiveMusic()[1];
        boolean z4 = !str.isEmpty();
        LiveFilterItem findLiveFilter = EffectController.getInstance().findLiveFilter(CameraAppImpl.getAndroidContext(), DataRepository.dataItemRunning().getLiveFilter());
        if (findLiveFilter.directoryName.isEmpty()) {
            z = false;
        } else {
            if ((liveAllSwitchAllValue & 2) == 0) {
                liveAllSwitchAllValue += 2;
            }
            z = true;
        }
        String currentLiveSticker = CameraSettings.getCurrentLiveSticker();
        if (currentLiveSticker.isEmpty()) {
            z2 = false;
        } else {
            if ((liveAllSwitchAllValue & 4) == 0) {
                liveAllSwitchAllValue += 4;
            }
            z2 = true;
        }
        String currentLiveSpeed = CameraSettings.getCurrentLiveSpeed();
        float faceBeautyRatio = ((float) CameraSettings.getFaceBeautyRatio(CameraSettings.KEY_LIVE_SHRINK_FACE_RATIO, 40)) / 100.0f;
        float faceBeautyRatio2 = ((float) CameraSettings.getFaceBeautyRatio(CameraSettings.KEY_LIVE_ENLARGE_EYE_RATIO, 40)) / 100.0f;
        float faceBeautyRatio3 = ((float) CameraSettings.getFaceBeautyRatio(CameraSettings.KEY_LIVE_SMOOTH_STRENGTH, 40)) / 100.0f;
        if (faceBeautyRatio > 0.0f || faceBeautyRatio2 > 0.0f || faceBeautyRatio3 > 0.0f) {
            if ((liveAllSwitchAllValue & 8) == 0) {
                liveAllSwitchAllValue += 8;
            }
            z3 = true;
        } else {
            z3 = false;
        }
        CameraStatUtil.trackLiveRecordingParams(z4, str, z, findLiveFilter.directoryName, z2, currentLiveSticker, currentLiveSpeed, z3, faceBeautyRatio, faceBeautyRatio2, faceBeautyRatio3, this.mQuality, isFrontCamera());
        CameraSettings.setLiveAllSwitchAddValue(liveAllSwitchAllValue);
    }

    public void stopVideoRecording(boolean z, boolean z2) {
        keepScreenOnAwhile();
        this.mLiveConfigChanges.onRecordPause();
        RecordState recordState = (RecordState) ModeCoordinatorImpl.getInstance().getAttachProtocol(212);
        if (this.mLiveConfigChanges.hasSegments()) {
            recordState.onPostPreview();
            trackLiveVideoParams();
            if (!z2) {
                showPreview();
                return;
            }
            return;
        }
        Log.d(TAG, "onFinish of no segments !!");
        this.mLiveConfigChanges.onRecordStop();
        recordState.onFinish();
    }

    private void trackLiveVideoParams() {
        int segments = this.mLiveConfigChanges.getSegments();
        float totalRecordingTime = (float) this.mLiveConfigChanges.getTotalRecordingTime();
        int liveAllSwitchAllValue = CameraSettings.getLiveAllSwitchAllValue();
        boolean z = true;
        boolean z2 = (liveAllSwitchAllValue & 2) != 0;
        boolean z3 = (liveAllSwitchAllValue & 4) != 0;
        if ((liveAllSwitchAllValue & 8) == 0) {
            z = false;
        }
        CameraSettings.setLiveAllSwitchAddValue(0);
        CameraStatUtil.trackLiveVideoParams(segments, totalRecordingTime / 1000.0f, z2, z3, z);
    }

    public void onPauseButtonClick() {
        RecordState recordState = (RecordState) ModeCoordinatorImpl.getInstance().getAttachProtocol(212);
        if (this.mLiveConfigChanges.isRecording()) {
            this.mLiveConfigChanges.onRecordPause();
            recordState.onPause();
            return;
        }
        trackLiveRecordingParams();
        this.mLiveConfigChanges.onRecordResume();
        recordState.onResume();
    }

    public void doReverse() {
        if (!this.mLiveConfigChanges.isRecording() && this.mLiveConfigChanges != null) {
            this.mLiveConfigChanges.onRecordReverse();
            if (!this.mLiveConfigChanges.hasSegments()) {
                stopVideoRecording(true, false);
            }
        }
    }

    public boolean onShutterButtonLongClick() {
        return false;
    }

    public void onShutterButtonFocus(boolean z, int i) {
    }

    public void onShutterButtonLongClickCancel(boolean z) {
    }

    public boolean isDoingAction() {
        FullScreenProtocol fullScreenProtocol = (FullScreenProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(196);
        return isVideoRecording() || (fullScreenProtocol != null && fullScreenProtocol.isLiveRecordPreviewShown());
    }

    public void onThumbnailClicked(View view) {
        if (!(isDoingAction() || this.mActivity.getThumbnailUpdater().getThumbnail() == null)) {
            this.mActivity.gotoGallery();
        }
    }

    public void onReviewDoneClicked() {
        this.mLiveConfigChanges.onRecordStop();
        ((RecordState) ModeCoordinatorImpl.getInstance().getAttachProtocol(212)).onFinish();
        getActivity().setVolumeControlStream(this.mOldOriginVolumeStream);
        this.mIsRecording = false;
        startSaveToLocal();
        if (this.mCamera2Device.isSessionReady()) {
            resumePreview();
        } else {
            startPreview();
        }
    }

    public void onReviewCancelClicked() {
        this.mLiveConfigChanges.onRecordStop();
        ((RecordState) ModeCoordinatorImpl.getInstance().getAttachProtocol(212)).onFinish();
        getActivity().setVolumeControlStream(this.mOldOriginVolumeStream);
        this.mIsRecording = false;
        if (this.mCamera2Device.isSessionReady()) {
            resumePreview();
        } else {
            startPreview();
        }
    }

    public boolean isSelectingCapturedResult() {
        FullScreenProtocol fullScreenProtocol = (FullScreenProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(196);
        return fullScreenProtocol != null && fullScreenProtocol.isLiveRecordPreviewShown();
    }

    public boolean isUnInterruptable() {
        return false;
    }

    private void initializeFocusManager() {
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

    public void onPreviewSessionSuccess(CameraCaptureSession cameraCaptureSession) {
        if (cameraCaptureSession != null && isAlive()) {
            this.mHandler.sendEmptyMessage(9);
            previewWhenSessionSuccess();
        }
    }

    public void onPreviewSessionFailed(CameraCaptureSession cameraCaptureSession) {
        this.mHandler.sendEmptyMessage(51);
    }

    public void onPreviewSessionClosed(CameraCaptureSession cameraCaptureSession) {
    }

    private void previewWhenSessionSuccess() {
        setCameraState(1);
        updatePreferenceInWorkThread(UpdateConstant.FUN_TYPES_ON_PREVIEW_SUCCESS);
    }

    public void onFocusStateChanged(FocusTask focusTask) {
        if (isCreated() && !isDeparted()) {
            switch (focusTask.getFocusTrigger()) {
                case 1:
                    Log.v(TAG, String.format(Locale.ENGLISH, "FocusTime=%1$dms focused=%2$b", new Object[]{Long.valueOf(focusTask.getElapsedTime()), Boolean.valueOf(focusTask.isSuccess())}));
                    if (!(this.mFocusManager.isFocusingSnapOnFinish() || getCameraState() == 3)) {
                        setCameraState(1);
                    }
                    this.mFocusManager.onFocusResult(focusTask);
                    this.mActivity.getSensorStateManager().reset();
                    if (focusTask.isSuccess() && this.m3ALocked) {
                        this.mCamera2Device.lockExposure(true);
                        break;
                    }
                case 2:
                case 3:
                    String str = null;
                    if (focusTask.isFocusing()) {
                        str = "onAutoFocusMoving start";
                    }
                    if (Util.sIsDumpLog && str != null) {
                        Log.v(TAG, str);
                    }
                    if ((getCameraState() != 3 || focusTask.getFocusTrigger() == 3) && !this.m3ALocked) {
                        this.mFocusManager.onFocusResult(focusTask);
                        break;
                    }
            }
        }
    }

    public void onOrientationChanged(int i, int i2) {
        setOrientation(i, i2);
    }

    private void setOrientation(int i, int i2) {
        if (i != -1) {
            this.mOrientation = i;
            checkActivityOrientation();
            if (this.mOrientationCompensation != i2) {
                this.mOrientationCompensation = i2;
                setOrientationParameter();
            }
        }
    }

    private void setOrientationParameter() {
        if (!(isDeparted() || this.mCamera2Device == null || this.mOrientation == -1)) {
            if (getCameraState() == 1) {
                updatePreferenceInWorkThread(35);
            } else {
                this.mCamera2Device.setDeviceOrientation(this.mOrientation);
            }
        }
    }

    public void checkDisplayOrientation() {
        if (isCreated()) {
            super.checkDisplayOrientation();
            if (this.mMainProtocol != null) {
                this.mMainProtocol.setCameraDisplayOrientation(this.mCameraDisplayOrientation);
            }
            if (this.mFocusManager != null) {
                this.mFocusManager.setDisplayOrientation(this.mCameraDisplayOrientation);
            }
        }
    }

    public void onSingleTapUp(int i, int i2) {
        if (!this.mPaused && this.mCamera2Device != null && this.mCamera2Device.isSessionReady() && isInTapableRect(i, i2) && getCameraState() != 3 && getCameraState() != 0) {
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

    protected void unlockAEAF() {
        Log.d(TAG, "unlockAEAF");
        this.m3ALocked = false;
        if (this.mAeLockSupported) {
            this.mCamera2Device.setAELock(false);
        }
        this.mFocusManager.setAeAwbLock(false);
    }

    protected void lockAEAF() {
        Log.d(TAG, "lockAEAF");
        if (this.mAeLockSupported) {
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

    private void updatePictureAndPreviewSize() {
        this.mPreviewSize = Util.getOptimalPreviewSize(this.mModuleIndex, this.mBogusCameraId, this.mCameraCapabilities.getSupportedOutputSize(SurfaceTexture.class), (double) CameraSettings.getPreviewAspectRatio(16, 9));
        updateCameraScreenNailSize(this.mPreviewSize.width, this.mPreviewSize.height);
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("previewSize: ");
        stringBuilder.append(this.mPreviewSize);
        Log.d(str, stringBuilder.toString());
        this.mPictureSize = this.mPreviewSize;
    }

    private void updateDeviceOrientation() {
        this.mCamera2Device.setDeviceOrientation(this.mOrientation);
    }

    public void updateFlashPreference() {
        setFlashMode(DataRepository.dataItemConfig().getComponentFlash().getComponentValue(this.mModuleIndex));
    }

    private void updateFocusMode() {
        setFocusMode(this.mFocusManager.setFocusMode(CameraSettings.getFocusMode()));
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

    private boolean isEisOn() {
        return isBackCamera();
    }

    private void updateVideoStabilization() {
        if (isDeviceAlive()) {
            if (isEisOn()) {
                Log.d(TAG, "videoStabilization: EIS");
                this.mCamera2Device.setEnableEIS(true);
                this.mCamera2Device.setEnableOIS(false);
                if (!this.mCameraCapabilities.isEISPreviewSupported()) {
                    this.mActivity.getCameraScreenNail().setVideoStabilizationCropped(true);
                }
            } else {
                Log.d(TAG, "videoStabilization: OIS");
                this.mCamera2Device.setEnableEIS(false);
                this.mCamera2Device.setEnableOIS(true);
                this.mActivity.getCameraScreenNail().setVideoStabilizationCropped(false);
            }
        }
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

    private void updateFpsRange() {
        this.mCamera2Device.setVideoFpsRange(new Range(Integer.valueOf(30), Integer.valueOf(30)));
        this.mCamera2Device.setFpsRange(new Range(Integer.valueOf(30), Integer.valueOf(30)));
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
            this.mCamera2Device.setAFRegions(this.mFocusManager.getFocusAreas(cropRegion, activeArraySize));
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

    public void startFocus() {
        if (isDeviceAlive() && isFrameAvailable()) {
            Log.v(TAG, "startFocus");
            if (this.mFocusAreaSupported) {
                this.mCamera2Device.startFocus(FocusTask.create(1), this.mModuleIndex);
            } else {
                this.mCamera2Device.resumePreview();
            }
        }
    }

    public void cancelFocus(boolean z) {
        if (isAlive() && isFrameAvailable() && getCameraState() != 0) {
            if (this.mCamera2Device != null) {
                if (z) {
                    this.mCamera2Device.setFocusMode(4);
                }
                this.mCamera2Device.cancelFocus(this.mModuleIndex);
            }
            if (getCameraState() != 3) {
                setCameraState(1);
            }
        }
    }

    public boolean onWaitingFocusFinished() {
        return false;
    }

    public boolean multiCapture() {
        return false;
    }

    /* JADX WARNING: Missing block: B:12:0x0025, code:
            return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void startFaceDetection() {
        if (this.mFaceDetectionEnabled && !this.mFaceDetectionStarted && isAlive() && this.mMaxFaceCount > 0 && this.mCamera2Device != null) {
            this.mFaceDetectionStarted = true;
            this.mCamera2Device.startFaceDetection();
            updateFaceView(this.mShowFace, true);
        }
    }

    public void stopFaceDetection(boolean z) {
        if (this.mFaceDetectionEnabled && this.mFaceDetectionStarted) {
            this.mFaceDetectionStarted = false;
            if (this.mCamera2Device != null) {
                this.mCamera2Device.stopFaceDetection();
            }
            this.mMainProtocol.setActiveIndicator(2);
            updateFaceView(false, z);
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

    public boolean isNeedMute() {
        return isVideoRecording();
    }

    private void updateFaceView(boolean z, boolean z2) {
        if (this.mHandler.hasMessages(35)) {
            this.mHandler.removeMessages(35);
        }
        this.mHandler.obtainMessage(35, z, z2).sendToTarget();
    }

    private void handleUpdateFaceView(boolean z, boolean z2) {
        boolean isFrontCamera = isFrontCamera();
        if (!z) {
            this.mMainProtocol.updateFaceView(z, z2, isFrontCamera, false, -1);
        } else if (this.mFaceDetectionStarted && 1 != this.mCamera2Device.getFocusMode()) {
            this.mMainProtocol.updateFaceView(z, true, isFrontCamera, true, this.mCameraDisplayOrientation);
        }
    }

    public void onFaceDetected(CameraHardwareFace[] cameraHardwareFaceArr, FaceAnalyzeInfo faceAnalyzeInfo) {
        if (isCreated() && cameraHardwareFaceArr != null) {
            if (b.gs() && cameraHardwareFaceArr.length > 0 && cameraHardwareFaceArr[0].faceType == CameraHardwareFace.CAMERA_META_DATA_T2T) {
                if (this.mObjectTrackingStarted) {
                    this.mMainProtocol.setFaces(3, cameraHardwareFaceArr, getActiveArraySize(), this.mZoomValue);
                }
            } else if (!this.mMainProtocol.setFaces(1, cameraHardwareFaceArr, getActiveArraySize(), this.mZoomValue)) {
            }
        }
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

    public boolean onBackPressed() {
        if (!isFrameAvailable() || this.mLiveConfigChanges == null) {
            return false;
        }
        if (!this.mLiveConfigChanges.isRecording() && !this.mLiveConfigChanges.isRecordingPaused()) {
            return super.onBackPressed();
        }
        long currentTimeMillis = System.currentTimeMillis();
        if (currentTimeMillis - this.mLastBackPressedTime > 3000) {
            this.mLastBackPressedTime = currentTimeMillis;
            Toast.makeText(this.mActivity, getString(R.string.record_back_pressed_hint), 0).show();
        } else {
            stopVideoRecording(true, false);
        }
        return true;
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
                if (!this.mIsRecording) {
                    if (i == 24 || i == 88) {
                        z = true;
                    }
                    if (handleVolumeKeyEvent(z, true, keyEvent.getRepeatCount())) {
                        return true;
                    }
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

    public boolean isVideoRecording() {
        return this.mLiveConfigChanges != null && this.mLiveConfigChanges.isRecording();
    }

    public boolean shouldReleaseLater() {
        return isVideoRecording() || isSelectingCapturedResult();
    }

    public void notifyError() {
        super.notifyError();
        if (currentIsMainThread()) {
            if (isVideoRecording()) {
                stopVideoRecording(true, true);
            }
            if (this.mPaused) {
                closeCamera();
            }
        }
    }

    public void startSaveToLocal() {
        if (!this.mSaved) {
            ContentValues saveContentValues = ((FullScreenProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(196)).getSaveContentValues();
            if (saveContentValues != null) {
                this.mSaved = true;
                getActivity().getImageSaver().addVideo(saveContentValues.getAsString("_data"), saveContentValues, true);
            }
        }
    }

    public void onHostStopAndNotifyActionStop() {
        onPauseButtonClick();
        doLaterReleaseIfNeed();
    }

    private void doLaterReleaseIfNeed() {
        if (this.mActivity != null && this.mActivity.isActivityPaused()) {
            this.mActivity.pause();
            this.mActivity.releaseAll(true, true);
        }
    }

    public void onNewUriArrived(final Uri uri, final String str) {
        super.onNewUriArrived(uri, str);
        if (isAlive()) {
            this.mHandler.post(new Runnable() {
                public void run() {
                    FullScreenProtocol fullScreenProtocol = (FullScreenProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(196);
                    if (fullScreenProtocol != null) {
                        String asString = fullScreenProtocol.getSaveContentValues().getAsString("title");
                        String access$500 = LiveModule.TAG;
                        StringBuilder stringBuilder = new StringBuilder();
                        stringBuilder.append("newUri: ");
                        stringBuilder.append(str);
                        stringBuilder.append(" | ");
                        stringBuilder.append(asString);
                        Log.d(access$500, stringBuilder.toString());
                        if (asString.equals(str)) {
                            fullScreenProtocol.onLiveSaveToLocalFinished(uri);
                        }
                    }
                }
            });
        }
    }
}
