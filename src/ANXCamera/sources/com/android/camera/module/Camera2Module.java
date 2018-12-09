package com.android.camera.module;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.Intent;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Rect;
import android.graphics.SurfaceTexture;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CaptureResult;
import android.location.Location;
import android.media.Image;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.SystemClock;
import android.text.TextUtils;
import android.util.Range;
import android.view.KeyEvent;
import android.view.Surface;
import android.view.View;
import com.android.camera.ActivityBase;
import com.android.camera.BasePreferenceActivity;
import com.android.camera.CameraIntentManager;
import com.android.camera.CameraIntentManager.CameraExtras;
import com.android.camera.CameraPreferenceActivity;
import com.android.camera.CameraSettings;
import com.android.camera.CameraSize;
import com.android.camera.Exif;
import com.android.camera.LocalParallelService.LocalBinder;
import com.android.camera.LocalParallelService.ServiceStatusListener;
import com.android.camera.LocationManager;
import com.android.camera.PictureSizeManager;
import com.android.camera.R;
import com.android.camera.SensorStateManager.SensorStateListener;
import com.android.camera.Thumbnail;
import com.android.camera.ToastUtils;
import com.android.camera.Util;
import com.android.camera.constant.BeautyConstant;
import com.android.camera.constant.CameraScene;
import com.android.camera.constant.EyeLightConstant;
import com.android.camera.constant.GlobalConstant;
import com.android.camera.constant.UpdateConstant;
import com.android.camera.constant.UpdateConstant.UpdateType;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.config.ComponentConfigFlash;
import com.android.camera.data.data.config.ComponentConfigHdr;
import com.android.camera.data.data.config.SupportedConfigFactory;
import com.android.camera.data.data.runing.ComponentRunningTiltValue;
import com.android.camera.data.data.runing.DataItemRunning;
import com.android.camera.db.DbRepository;
import com.android.camera.db.element.SaveTask;
import com.android.camera.effect.EffectController;
import com.android.camera.effect.FilterInfo;
import com.android.camera.effect.draw_mode.DrawExtTexAttribute;
import com.android.camera.effect.renders.SnapshotEffectRender;
import com.android.camera.fragment.beauty.BeautyParameters;
import com.android.camera.fragment.beauty.BeautyValues;
import com.android.camera.fragment.top.FragmentTopAlert;
import com.android.camera.fragment.top.FragmentTopConfig;
import com.android.camera.groupshot.GroupShot;
import com.android.camera.log.Log;
import com.android.camera.module.loader.FunctionParseAiScene;
import com.android.camera.module.loader.FunctionParseAsdFace;
import com.android.camera.module.loader.FunctionParseAsdHdr;
import com.android.camera.module.loader.FunctionParseAsdScene;
import com.android.camera.module.loader.FunctionParseAsdUltraWide;
import com.android.camera.module.loader.PredicateFilterAiScene;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.android.camera.module.loader.camera2.FocusManager2;
import com.android.camera.module.loader.camera2.FocusManager2.Listener;
import com.android.camera.module.loader.camera2.FocusTask;
import com.android.camera.parallel.AlgoConnector;
import com.android.camera.preferences.CameraSettingPreferences;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.ActionProcessing;
import com.android.camera.protocol.ModeProtocol.BackStack;
import com.android.camera.protocol.ModeProtocol.BaseDelegate;
import com.android.camera.protocol.ModeProtocol.BottomPopupTips;
import com.android.camera.protocol.ModeProtocol.CameraAction;
import com.android.camera.protocol.ModeProtocol.CameraModuleSpecial;
import com.android.camera.protocol.ModeProtocol.ConfigChanges;
import com.android.camera.protocol.ModeProtocol.DualController;
import com.android.camera.protocol.ModeProtocol.FaceBeautyProtocol;
import com.android.camera.protocol.ModeProtocol.FilterProtocol;
import com.android.camera.protocol.ModeProtocol.FullScreenProtocol;
import com.android.camera.protocol.ModeProtocol.OnFaceBeautyChangedProtocol;
import com.android.camera.protocol.ModeProtocol.SnapShotIndicator;
import com.android.camera.protocol.ModeProtocol.TopAlert;
import com.android.camera.protocol.ModeProtocol.TopConfigProtocol;
import com.android.camera.statistic.CameraStat;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera.statistic.ScenarioTrackUtil;
import com.android.camera.storage.Storage;
import com.android.camera.ui.ObjectView.ObjectViewListener;
import com.android.camera.ui.RotateTextToast;
import com.android.camera2.Camera2Proxy.CameraMetaDataCallback;
import com.android.camera2.Camera2Proxy.CameraPreviewCallback;
import com.android.camera2.Camera2Proxy.FaceDetectionCallback;
import com.android.camera2.Camera2Proxy.FocusCallback;
import com.android.camera2.Camera2Proxy.HDRCheckerCallback;
import com.android.camera2.Camera2Proxy.PictureCallback;
import com.android.camera2.Camera2Proxy.PictureCallbackWrapper;
import com.android.camera2.Camera2Proxy.ScreenLightCallback;
import com.android.camera2.Camera2Proxy.UltraWideCheckCallback;
import com.android.camera2.CameraCapabilities;
import com.android.camera2.CameraHardwareFace;
import com.android.zxing.QRCodeManager;
import com.google.android.apps.photos.api.PhotosOemApi;
import com.google.lens.sdk.LensApi;
import com.google.lens.sdk.LensApi.LensAvailabilityCallback;
import com.mi.config.b;
import com.ss.android.ttve.common.TEDefine;
import com.xiaomi.camera.base.PerformanceTracker;
import com.xiaomi.camera.core.ParallelTaskData;
import com.xiaomi.camera.core.PictureInfo;
import com.xiaomi.camera.liveshot.CircularMediaRecorder;
import com.xiaomi.engine.BufferFormat;
import com.xiaomi.engine.GraphDescriptorBean;
import io.reactivex.BackpressureStrategy;
import io.reactivex.Flowable;
import io.reactivex.FlowableEmitter;
import io.reactivex.FlowableOnSubscribe;
import io.reactivex.Observable;
import io.reactivex.ObservableEmitter;
import io.reactivex.ObservableOnSubscribe;
import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.disposables.Disposable;
import io.reactivex.functions.Consumer;
import io.reactivex.functions.Function;
import java.io.Closeable;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.TimeUnit;

@TargetApi(21)
public class Camera2Module extends BaseModule implements Listener, CameraAction, CameraModuleSpecial, FaceBeautyProtocol, FilterProtocol, OnFaceBeautyChangedProtocol, TopConfigProtocol, ObjectViewListener, CameraMetaDataCallback, CameraPreviewCallback, FaceDetectionCallback, FocusCallback, HDRCheckerCallback, PictureCallback, ScreenLightCallback, UltraWideCheckCallback {
    private static final int BURST_SHOOTING_DELAY = 0;
    private static final long CAPTURE_DURATION_THRESHOLD = 8000;
    private static final int GROUP_SHOT_GAP = 100;
    private static final int REQUEST_CROP = 1000;
    private static final String TAG = Camera2Module.class.getSimpleName();
    private static boolean mIsBeautyFrontOn = false;
    private static final String sTempCropFilename = "crop-temp";
    private volatile boolean isDetectedInHDR;
    private boolean isMicrophoneEnabled = true;
    private volatile boolean isResetFromMutex = false;
    private boolean isSilhouette;
    private boolean m3ALocked;
    private int mAFEndLogTimes;
    private Disposable mAiSceneDisposable;
    private boolean mAiSceneEnabled;
    private FlowableEmitter<CaptureResult> mAiSceneFlowableEmitter;
    private String mAlgorithmName;
    private BeautyValues mBeautyValues;
    private Intent mBroadcastIntent;
    private Disposable mBurstDisposable;
    private ObservableEmitter mBurstEmitter;
    private long mBurstNextDelayTime = 0;
    private long mBurstStartTime;
    private long mCaptureStartTime;
    private String mCaptureWaterMarkStr;
    private CircularMediaRecorder mCircularMediaRecorder = null;
    private final Object mCircularMediaRecorderStateLock = new Object();
    private Disposable mCountdownDisposable;
    private String mCropValue;
    private int mCurrentAiScene;
    private int mCurrentAsdScene = -1;
    private int mCurrentDetectedScene;
    private SnapshotEffectRender mEffectProcessor;
    private boolean mEnabledPreviewThumbnail;
    private boolean mFaceDetectionEnabled;
    private boolean mFaceDetectionStarted;
    private FocusManager2 mFocusManager;
    private FunctionParseAiScene mFunctionParseAiScene;
    private int mGroupFaceNum = 10;
    private GroupShot mGroupShot;
    private MainHandler mHandler;
    private boolean mHasAiSceneFilterEffect;
    private boolean mHdrCheckEnabled;
    private boolean mIsGenderAgeOn;
    private boolean mIsGradienterOn;
    private boolean mIsImageCaptureIntent;
    private boolean mIsLensServiceBound = false;
    private boolean mIsMagicMirrorOn;
    private boolean mIsParallelProcess;
    private boolean mIsPortraitLightingOn;
    private boolean mIsSaveCaptureImage;
    private int mJpegRotation;
    private boolean mKeepBitmapTexture;
    private long mLastCaptureTime;
    private long mLastChangeSceneTime = 0;
    private String mLastFlashMode;
    private LensApi mLensApi;
    private int mLensStatus = 1;
    private Location mLocation;
    private boolean mLongPressedAutoFocus;
    private Disposable mMetaDataDisposable;
    private FlowableEmitter<CaptureResult> mMetaDataFlowableEmitter;
    private boolean mMultiSnapStatus = false;
    private boolean mMultiSnapStopRequest = false;
    private boolean mNeedAutoFocus;
    private long mOnResumeTime;
    private int mOperatingMode;
    private String mParallelProcessingFilePath;
    private boolean mPendingMultiCapture;
    private boolean mQuickCapture;
    private int mReceivedJpegCallbackNum = 0;
    private Uri mSaveUri;
    private String mSceneMode;
    private SensorStateListener mSensorStateListener = new SensorStateListener() {
        public void onDeviceBecomeStable() {
        }

        public boolean isWorking() {
            return Camera2Module.this.getCameraState() != 0;
        }

        public void onDeviceKeepMoving(double d) {
            if (!Camera2Module.this.mPaused && Camera2Module.this.mFocusManager != null && !Camera2Module.this.mMultiSnapStatus && !Camera2Module.this.is3ALocked() && !Camera2Module.this.mMainProtocol.isEvAdjusted(true)) {
                Camera2Module.this.mFocusManager.onDeviceKeepMoving(d);
            }
        }

        public void onDeviceBeginMoving() {
            if (!Camera2Module.this.mPaused && CameraSettings.isEdgePhotoEnable()) {
                Camera2Module.this.mActivity.getEdgeShutterView().onDeviceMoving();
            }
        }

        public void onDeviceKeepStable() {
        }

        public void onDeviceOrientationChanged(float f, boolean z) {
            Camera2Module.this.mDeviceRotation = f;
            if (Camera2Module.this.getCameraState() != 3) {
                EffectController.getInstance().setDeviceRotation(Camera2Module.this.mActivity.getSensorStateManager().isDeviceLying(), Util.getShootRotation(Camera2Module.this.mActivity, Camera2Module.this.mDeviceRotation));
            }
            Camera2Module.this.mHandler.removeMessages(33);
            if (!Camera2Module.this.mPaused) {
                int roundOrientation = Util.roundOrientation(Math.round(f), Camera2Module.this.mOrientation);
                Camera2Module.this.mHandler.obtainMessage(33, roundOrientation, (Util.getDisplayRotation(Camera2Module.this.mActivity) + roundOrientation) % 360).sendToTarget();
            }
        }

        public void notifyDevicePostureChanged() {
        }
    };
    private ServiceStatusListener mServiceStatusListener;
    private int mShootOrientation;
    private float mShootRotation;
    private long mShutterCallbackTime;
    private long mShutterLag;
    private Disposable mSuperNightDisposable;
    private int mTotalJpegCallbackNum = 1;
    private boolean mUpdateImageTitle = false;
    private CameraSize mVideoSize;
    private boolean mVolumeLongPress = false;

    private final class JpegQuickPictureCallback extends PictureCallbackWrapper {
        String mBurstShotTitle;
        boolean mDropped;
        Location mLocation;
        String mPressDownTitle;
        int mSavedJpegCallbackNum;

        public JpegQuickPictureCallback(Location location) {
            this.mLocation = location;
        }

        private String getBurstShotTitle() {
            String stringBuilder;
            if (Camera2Module.this.mUpdateImageTitle && this.mBurstShotTitle != null && this.mSavedJpegCallbackNum == 1) {
                this.mPressDownTitle = this.mBurstShotTitle;
                this.mBurstShotTitle = null;
            }
            if (this.mBurstShotTitle == null) {
                long currentTimeMillis = System.currentTimeMillis();
                this.mBurstShotTitle = Util.createJpegName(currentTimeMillis);
                if (this.mBurstShotTitle.length() != 19) {
                    this.mBurstShotTitle = Util.createJpegName(currentTimeMillis + 1000);
                }
            }
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append(this.mBurstShotTitle);
            if (Camera2Module.this.mMutexModePicker.isUbiFocus()) {
                StringBuilder stringBuilder3 = new StringBuilder();
                stringBuilder3.append(Storage.UBIFOCUS_SUFFIX);
                stringBuilder3.append(this.mSavedJpegCallbackNum - 1);
                stringBuilder = stringBuilder3.toString();
            } else {
                StringBuilder stringBuilder4 = new StringBuilder();
                stringBuilder4.append("_BURST");
                stringBuilder4.append(this.mSavedJpegCallbackNum);
                stringBuilder = stringBuilder4.toString();
            }
            stringBuilder2.append(stringBuilder);
            return stringBuilder2.toString();
        }

        public void onPictureTaken(byte[] bArr) {
            if (!Camera2Module.this.mPaused && bArr != null && Camera2Module.this.mReceivedJpegCallbackNum < Camera2Module.this.mTotalJpegCallbackNum && Camera2Module.this.mMultiSnapStatus) {
                if (this.mSavedJpegCallbackNum == 1 && !Camera2Module.this.mMultiSnapStopRequest) {
                    if (!Camera2Module.this.is3ALocked()) {
                        Camera2Module.this.mFocusManager.onShutter();
                    }
                    if (!Camera2Module.this.mMutexModePicker.isUbiFocus()) {
                        Camera2Module.this.mActivity.getImageSaver().updateImage(getBurstShotTitle(), this.mPressDownTitle);
                    }
                }
                boolean z = false;
                int i;
                if (Storage.isLowStorageAtLastPoint()) {
                    if (!Camera2Module.this.mMutexModePicker.isUbiFocus() && Camera2Module.this.mMultiSnapStatus) {
                        Camera2Module.this.trackGeneralInfo(this.mSavedJpegCallbackNum, true);
                        Camera2Module camera2Module = Camera2Module.this;
                        i = this.mSavedJpegCallbackNum;
                        if (this.mLocation != null) {
                            z = true;
                        }
                        camera2Module.trackPictureTaken(i, true, z, Camera2Module.this.getCurrentAiSceneName());
                        Camera2Module.this.stopMultiSnap();
                    }
                    return;
                }
                Camera2Module.access$504(Camera2Module.this);
                if (Camera2Module.this.mActivity.getImageSaver().isSaveQueueFull()) {
                    String access$1500 = Camera2Module.TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("CaptureBurst queue full and drop ");
                    stringBuilder.append(Camera2Module.this.mReceivedJpegCallbackNum);
                    Log.e(access$1500, stringBuilder.toString());
                    this.mDropped = true;
                    if (Camera2Module.this.mReceivedJpegCallbackNum >= Camera2Module.this.mTotalJpegCallbackNum) {
                        Camera2Module.this.mActivity.getThumbnailUpdater().getLastThumbnailUncached();
                    }
                } else {
                    int i2;
                    int height;
                    this.mSavedJpegCallbackNum++;
                    if (!Camera2Module.this.mMutexModePicker.isUbiFocus()) {
                        Camera2Module.this.playSound(4);
                    }
                    Camera2Module.this.mBurstEmitter.onNext(Integer.valueOf(this.mSavedJpegCallbackNum));
                    boolean z2 = Camera2Module.this.mMutexModePicker.isUbiFocus() && Camera2Module.this.mReceivedJpegCallbackNum <= Camera2Module.this.mTotalJpegCallbackNum;
                    if (z2) {
                        i2 = 0;
                    } else {
                        i2 = Exif.getOrientation(bArr);
                    }
                    if ((Camera2Module.this.mJpegRotation + i2) % 180 == 0) {
                        i = Camera2Module.this.mPictureSize.getWidth();
                        height = Camera2Module.this.mPictureSize.getHeight();
                    } else {
                        i = Camera2Module.this.mPictureSize.getHeight();
                        height = Camera2Module.this.mPictureSize.getWidth();
                    }
                    int i3 = i;
                    int i4 = height;
                    String burstShotTitle = getBurstShotTitle();
                    boolean z3 = Camera2Module.this.mMutexModePicker.isUbiFocus() && Camera2Module.this.mReceivedJpegCallbackNum == Camera2Module.this.mTotalJpegCallbackNum - 1;
                    if (!(Camera2Module.this.mMutexModePicker.isUbiFocus() && Camera2Module.this.mReceivedJpegCallbackNum == Camera2Module.this.mTotalJpegCallbackNum)) {
                        boolean z4 = Camera2Module.this.mReceivedJpegCallbackNum != 1 && (Camera2Module.this.mReceivedJpegCallbackNum == Camera2Module.this.mTotalJpegCallbackNum || Camera2Module.this.mMultiSnapStopRequest || this.mDropped);
                        boolean z5 = false;
                        Camera2Module.this.mActivity.getImageSaver().addImage(bArr, z4, burstShotTitle, null, System.currentTimeMillis(), null, this.mLocation, i3, i4, null, i2, z2, z3, true, false, false, null, Camera2Module.this.getPictureInfo());
                        this.mDropped = z5;
                    }
                }
                if (Camera2Module.this.mReceivedJpegCallbackNum >= Camera2Module.this.mTotalJpegCallbackNum || Camera2Module.this.mMultiSnapStopRequest || this.mDropped) {
                    Camera2Module.this.stopMultiSnap();
                }
            }
        }

        public void onPictureTakenFinished(boolean z) {
            Camera2Module.this.stopMultiSnap();
            Camera2Module.this.mBurstEmitter.onComplete();
        }
    }

    private class MainHandler extends Handler {
        public MainHandler(Looper looper) {
            super(looper);
        }

        public void handleMessage(Message message) {
            if (!Camera2Module.this.isCreated()) {
                removeCallbacksAndMessages(null);
            } else if (Camera2Module.this.getActivity() != null) {
                int i = message.what;
                if (i == 2) {
                    Camera2Module.this.getWindow().clearFlags(128);
                } else if (i == 4) {
                    Camera2Module.this.checkActivityOrientation();
                    if (SystemClock.uptimeMillis() - Camera2Module.this.mOnResumeTime < 5000) {
                        Camera2Module.this.mHandler.sendEmptyMessageDelayed(4, 100);
                    }
                } else if (i == 17) {
                    Camera2Module.this.mHandler.removeMessages(17);
                    Camera2Module.this.mHandler.removeMessages(2);
                    Camera2Module.this.getWindow().addFlags(128);
                    Camera2Module.this.mHandler.sendEmptyMessageDelayed(2, (long) Camera2Module.this.getScreenDelay());
                } else if (i == 31) {
                    Camera2Module.this.setOrientationParameter();
                } else if (i != 33) {
                    boolean z = false;
                    if (i != 35) {
                        switch (i) {
                            case 9:
                                Camera2Module.this.mMainProtocol.initializeFocusView(Camera2Module.this);
                                Camera2Module.this.mMainProtocol.setObjectViewListener(Camera2Module.this);
                                break;
                            case 10:
                                Camera2Module.this.mOpenCameraFail = true;
                                Camera2Module.this.onCameraException();
                                break;
                            case 11:
                                break;
                            default:
                                switch (i) {
                                    case 44:
                                        Camera2Module.this.restartModule();
                                        break;
                                    case 45:
                                        Camera2Module.this.setActivity(null);
                                        break;
                                    default:
                                        switch (i) {
                                            case 48:
                                                Camera2Module.this.setCameraState(1);
                                                break;
                                            case 49:
                                                if (Camera2Module.this.isAlive()) {
                                                    Camera2Module.this.stopMultiSnap();
                                                    Camera2Module.this.mBurstEmitter.onComplete();
                                                    break;
                                                }
                                                return;
                                            case 50:
                                                Log.w(Camera2Module.TAG, "later release timeout!");
                                                Camera2Module.this.onPictureTakenFinished(false);
                                                break;
                                            case 51:
                                                if (!Camera2Module.this.mActivity.isActivityPaused()) {
                                                    Camera2Module.this.mOpenCameraFail = true;
                                                    Camera2Module.this.onCameraException();
                                                    break;
                                                }
                                                break;
                                            case 52:
                                                Camera2Module.this.onShutterButtonClick(Camera2Module.this.getTriggerMode());
                                                break;
                                            default:
                                                StringBuilder stringBuilder = new StringBuilder();
                                                stringBuilder.append("no consumer for this message: ");
                                                stringBuilder.append(message.what);
                                                throw new RuntimeException(stringBuilder.toString());
                                        }
                                }
                        }
                    }
                    Camera2Module camera2Module = Camera2Module.this;
                    boolean z2 = message.arg1 > 0;
                    if (message.arg2 > 0) {
                        z = true;
                    }
                    camera2Module.handleUpdateFaceView(z2, z);
                } else {
                    Camera2Module.this.setOrientation(message.arg1, message.arg2);
                }
            }
        }
    }

    static /* synthetic */ int access$504(Camera2Module camera2Module) {
        int i = camera2Module.mReceivedJpegCallbackNum + 1;
        camera2Module.mReceivedJpegCallbackNum = i;
        return i;
    }

    public void registerProtocol() {
        super.registerProtocol();
        ModeCoordinatorImpl.getInstance().attachProtocol(161, this);
        ModeCoordinatorImpl.getInstance().attachProtocol(169, this);
        ModeCoordinatorImpl.getInstance().attachProtocol(165, this);
        ModeCoordinatorImpl.getInstance().attachProtocol(193, this);
        ModeCoordinatorImpl.getInstance().attachProtocol(195, this);
        if (b.hp()) {
            ModeCoordinatorImpl.getInstance().attachProtocol(185, this);
        }
        ModeCoordinatorImpl.getInstance().attachProtocol(199, this);
        getActivity().getImplFactory().initAdditional(getActivity(), 164, 174);
    }

    public void unRegisterProtocol() {
        super.unRegisterProtocol();
        ModeCoordinatorImpl.getInstance().detachProtocol(161, this);
        ModeCoordinatorImpl.getInstance().detachProtocol(169, this);
        ModeCoordinatorImpl.getInstance().detachProtocol(165, this);
        ModeCoordinatorImpl.getInstance().detachProtocol(193, this);
        ModeCoordinatorImpl.getInstance().detachProtocol(195, this);
        if (b.hp()) {
            ModeCoordinatorImpl.getInstance().detachProtocol(185, this);
        }
        ModeCoordinatorImpl.getInstance().detachProtocol(199, this);
        getActivity().getImplFactory().detachAdditional();
    }

    public boolean scanQRCodeEnabled() {
        boolean z = false;
        if (this.mIsParallelProcess) {
            return false;
        }
        if (!(!CameraSettings.isScanQRCode(this.mActivity) || this.mModuleIndex != 163 || this.mIsImageCaptureIntent || !CameraSettings.isBackCamera() || this.mMultiSnapStatus || CameraSettings.isStereoModeOn() || CameraSettings.isPortraitModeBackOn())) {
            z = true;
        }
        return z;
    }

    public void startFocus() {
        if (isDeviceAlive() && isFrameAvailable()) {
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
        if (isDoingAction() || !isAlive()) {
            return false;
        }
        startNormalCapture(getTriggerMode());
        return true;
    }

    public boolean multiCapture() {
        if (isDoingAction() || !this.mPendingMultiCapture) {
            return false;
        }
        this.mPendingMultiCapture = false;
        this.mActivity.getScreenHint().updateHint();
        if (Storage.isLowStorageAtLastPoint()) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Not enough space or storage not ready. remaining=");
            stringBuilder.append(Storage.getLeftSpace());
            Log.i(str, stringBuilder.toString());
            return false;
        } else if (this.mActivity.getImageSaver().isBusy()) {
            Log.d(TAG, "ImageSaver is busy, wait for a moment!");
            RotateTextToast.getInstance(this.mActivity).show(R.string.toast_saving, 0);
            return false;
        } else {
            ((ConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(164)).closeMutexElement(SupportedConfigFactory.CLOSE_BY_BURST_SHOOT, 193, 194, 196, 239, 201, 206);
            prepareMultiCapture();
            Observable.create(new ObservableOnSubscribe<Integer>() {
                public void subscribe(ObservableEmitter<Integer> observableEmitter) throws Exception {
                    Camera2Module.this.mBurstEmitter = observableEmitter;
                }
            }).observeOn(AndroidSchedulers.mainThread()).map(new Function<Integer, Integer>() {
                public Integer apply(Integer num) throws Exception {
                    ((SnapShotIndicator) ModeCoordinatorImpl.getInstance().getAttachProtocol(184)).setSnapNumValue(num.intValue());
                    return num;
                }
            }).subscribe(new Observer<Integer>() {
                public void onSubscribe(Disposable disposable) {
                    Camera2Module.this.mBurstStartTime = System.currentTimeMillis();
                    Camera2Module.this.mBurstDisposable = disposable;
                }

                public void onNext(Integer num) {
                }

                public void onError(Throwable th) {
                }

                public void onComplete() {
                    ((SnapShotIndicator) ModeCoordinatorImpl.getInstance().getAttachProtocol(184)).setSnapNumVisible(false, true);
                    ((ConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(164)).restoreAllMutexElement(SupportedConfigFactory.CLOSE_BY_BURST_SHOOT);
                }
            });
            this.mBurstNextDelayTime = 0;
            this.mCamera2Device.setShotType(3);
            this.mCamera2Device.captureBurstPictures(this.mTotalJpegCallbackNum, new JpegQuickPictureCallback(LocationManager.instance().getCurrentLocation()), this.mActivity.getImageSaver());
            return true;
        }
    }

    private void stopMultiSnap() {
        this.mHandler.removeMessages(49);
        if (this.mMultiSnapStatus) {
            int i;
            this.mLastCaptureTime = System.currentTimeMillis();
            this.mMultiSnapStatus = false;
            Log.e(TAG, "burst: stopMultiSnap | ");
            this.mCamera2Device.captureAbortBurst();
            boolean z = true;
            if (this.mMutexModePicker.isUbiFocus()) {
                i = 1;
            } else {
                i = this.mReceivedJpegCallbackNum;
            }
            boolean isUbiFocus = this.mMutexModePicker.isUbiFocus() ^ true;
            trackGeneralInfo(i, isUbiFocus);
            if (this.mLocation == null) {
                z = false;
            }
            trackPictureTaken(i, isUbiFocus, z, getCurrentAiSceneName());
            animateCapture();
            this.mUpdateImageTitle = false;
            this.mHandler.sendEmptyMessageDelayed(48, 800);
        }
    }

    private void onFilterChanged() {
        updatePreferenceTrampoline(2);
        ((TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172)).updateConfigItem(196);
        this.mMainProtocol.updateEffectViewVisible();
    }

    public void onBroadcastReceived(Context context, Intent intent) {
        if (intent != null && isAlive()) {
            if (CameraIntentManager.ACTION_VOICE_CONTROL.equals(intent.getAction())) {
                Log.d(TAG, "on Receive voice control broadcast action intent");
                String voiceControlAction = CameraIntentManager.getInstance(intent).getVoiceControlAction();
                this.mBroadcastIntent = intent;
                Object obj = -1;
                if (voiceControlAction.hashCode() == 1270567718 && voiceControlAction.equals("CAPTURE")) {
                    obj = null;
                }
                if (obj == null) {
                    onShutterButtonClick(getTriggerMode());
                    this.mBroadcastIntent = null;
                }
                CameraIntentManager.removeInstance(intent);
            }
            super.onBroadcastReceived(context, intent);
        }
    }

    public int getGroupShotNum() {
        if (Util.isMemoryRich(this.mActivity)) {
            return getGroupShotMaxImage();
        }
        return 1;
    }

    public int getGroupShotMaxImage() {
        CameraHardwareFace[] faces = this.mMainProtocol.getFaces();
        return Util.clamp((faces != null ? faces.length : 0) + 1, 2, 4);
    }

    public void initGroupShot(int i) {
        if (this.mGroupShot == null || this.mGroupShot.isUsed()) {
            this.mGroupShot = new GroupShot();
        }
        if (this.mOrientation % 180 == 0 && b.hh()) {
            this.mGroupShot.initialize(i, this.mGroupFaceNum, this.mPictureSize.getHeight(), this.mPictureSize.getWidth(), this.mPreviewSize.height, this.mPreviewSize.width);
            return;
        }
        this.mGroupShot.initialize(i, this.mGroupFaceNum, this.mPictureSize.getWidth(), this.mPictureSize.getHeight(), this.mPreviewSize.width, this.mPreviewSize.height);
    }

    private void prepareGroupShot() {
        this.mTotalJpegCallbackNum = getGroupShotNum();
        initGroupShot(this.mTotalJpegCallbackNum);
        if (this.mGroupShot != null) {
            this.mGroupShot.attach_start(1);
        } else {
            this.mTotalJpegCallbackNum = 1;
        }
    }

    public CircularMediaRecorder getCircularMediaRecorder() {
        CircularMediaRecorder circularMediaRecorder;
        synchronized (this.mCircularMediaRecorderStateLock) {
            circularMediaRecorder = this.mCircularMediaRecorder;
        }
        return circularMediaRecorder;
    }

    public void startLiveShot() {
        synchronized (this.mCircularMediaRecorderStateLock) {
            if (this.mCircularMediaRecorder == null) {
                this.mCircularMediaRecorder = new CircularMediaRecorder(this.mVideoSize.width, this.mVideoSize.height, getActivity().getGLView().getEGLContext14(), this.isMicrophoneEnabled);
            }
            this.mCircularMediaRecorder.setOrientationHint(this.mOrientationCompensation);
            this.mCircularMediaRecorder.start();
        }
    }

    public void stopLiveShot(boolean z) {
        synchronized (this.mCircularMediaRecorderStateLock) {
            if (this.mCircularMediaRecorder != null) {
                this.mCircularMediaRecorder.stop();
                if (z) {
                    this.mCircularMediaRecorder.release();
                    this.mCircularMediaRecorder = null;
                }
            }
        }
    }

    private void updateLiveShot() {
        if (!DataRepository.dataItemFeature().fy() || this.mModuleIndex != 163) {
            return;
        }
        if (CameraSettings.isLiveShotOn()) {
            startLiveShot();
        } else {
            stopLiveShot(false);
        }
    }

    private void setVideoSize(int i, int i2) {
        if (this.mCameraDisplayOrientation % 180 == 0) {
            this.mVideoSize = new CameraSize(i, i2);
        } else {
            this.mVideoSize = new CameraSize(i2, i);
        }
    }

    private void startLiveShotAnimation() {
        synchronized (this.mCircularMediaRecorderStateLock) {
            if (!(this.mCircularMediaRecorder == null || this.mHandler == null)) {
                this.mHandler.post(new Runnable() {
                    public void run() {
                        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
                        if (topAlert != null) {
                            topAlert.startLiveShotAnimation();
                        }
                    }
                });
            }
        }
    }

    private void onBeautyParameterChanged() {
        boolean isFaceBeautyOn = BeautyParameters.isFaceBeautyOn();
        String componentValue = DataRepository.dataItemConfig().getComponentHdr().getComponentValue(this.mModuleIndex);
        if (this.mCameraCapabilities.isSupportedQcfa() && mIsBeautyFrontOn != isFaceBeautyOn && ((this.mModuleIndex != 171 || !isBokehFrontCamera()) && ((isFaceBeautyOn && this.mOperatingMode == 32775) || (!isFaceBeautyOn && componentValue.equals("off") && this.mOperatingMode == 32773)))) {
            restartModule();
        } else if (b.hw()) {
            updatePreferenceInWorkThread(13, 34, 42);
        } else {
            updatePreferenceInWorkThread(13);
        }
        mIsBeautyFrontOn = isFaceBeautyOn;
    }

    private void updateAiScene() {
        if (this.mFunctionParseAiScene != null) {
            this.mFunctionParseAiScene.resetScene();
        }
        this.mCurrentAiScene = 0;
        this.mAiSceneEnabled = CameraSettings.getAiSceneOpen();
        if (isFrontCamera() && this.mActivity.isScreenSlideOff()) {
            this.mAiSceneEnabled = false;
        }
        this.mCamera2Device.setASD(this.mAiSceneEnabled);
        if (isFrontCamera() || !this.mAiSceneEnabled) {
            this.mCamera2Device.setCameraAI30(this.mAiSceneEnabled);
        }
        setAiSceneEffect(0);
        if (this.mAiSceneEnabled) {
            this.mCamera2Device.setASDPeriod(300);
            return;
        }
        hideSceneSelector();
        updateHDRPreference();
        updateFlashPreference();
        updateBeauty();
    }

    private void updateBokeh() {
        boolean z = isFrontCamera() && !isBokehFrontCamera() && ModuleManager.isPortraitModule() && b.hb();
        this.mCamera2Device.setBokeh(z);
    }

    private void updateFaceScore() {
        this.mIsMagicMirrorOn = DataRepository.dataItemRunning().isSwitchOn("pref_camera_magic_mirror_key");
        this.mCamera2Device.setFaceScore(this.mIsMagicMirrorOn);
        if (EffectController.getInstance().hasEffect()) {
            prepareEffectProcessor(FilterInfo.FILTER_ID_NONE);
        }
    }

    private void updateFaceAgeAnalyze() {
        this.mIsGenderAgeOn = DataRepository.dataItemRunning().isSwitchOn("pref_camera_show_gender_age_key");
        boolean z = true;
        if (!this.mIsGenderAgeOn) {
            z = this.mBeautyValues != null ? true ^ CameraSettings.getFaceBeautyCloseValue().equals(this.mBeautyValues.mBeautyLevel) : false;
        }
        this.mCamera2Device.setFaceAgeAnalyze(z);
        if (EffectController.getInstance().hasEffect()) {
            prepareEffectProcessor(FilterInfo.FILTER_ID_NONE);
        }
    }

    private void updateFrontMirror() {
        boolean isFrontMirror;
        if (isFrontCamera()) {
            isFrontMirror = isFrontMirror();
        } else {
            isFrontMirror = false;
        }
        this.mCamera2Device.setFrontMirror(isFrontMirror);
    }

    private void hideSceneSelector() {
        this.mHandler.post(new Runnable() {
            public void run() {
                ((TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172)).alertAiSceneSelector(8);
            }
        });
    }

    public void onHDRSceneChanged(final boolean z) {
        if (this.isDetectedInHDR != z && !this.mPaused) {
            ComponentConfigHdr componentHdr = DataRepository.dataItemConfig().getComponentHdr();
            if (!componentHdr.isEmpty()) {
                if (!"auto".equals(componentHdr.getComponentValue(this.mModuleIndex))) {
                    return;
                }
                if (!z || (this.mZoomValue <= 1.0f && this.mCurrentAiScene != -1 && (this.mCamera2Device == null || !this.mCamera2Device.isNeedFlashOn()))) {
                    this.mHandler.post(new Runnable() {
                        public void run() {
                            ((TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172)).alertHDR(z ? 0 : 8, false, false);
                        }
                    });
                    if (z) {
                        if (this.mMutexModePicker.isNormal()) {
                            this.mMutexModePicker.setMutexMode(1);
                        }
                    } else if (this.mMutexModePicker.isMorphoHdr()) {
                        this.mMutexModePicker.resetMutexMode();
                    }
                    this.isDetectedInHDR = z;
                    String str = TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("onHDRSceneChanged: ");
                    stringBuilder.append(z);
                    Log.d(str, stringBuilder.toString());
                }
            }
        }
    }

    public boolean isHdrDetectStarted() {
        return this.mHdrCheckEnabled;
    }

    public void onFaceBeautySwitched(boolean z) {
        CameraSettings.setFaceBeautySwitch(z ? CameraSettings.KEY_FACE_BEAUTY_ADVANCED : "pref_camera_face_beauty_key");
        if (b.hp()) {
            onBeautyChanged();
        }
    }

    public void onBeautyChanged() {
        onBeautyParameterChanged();
    }

    /* JADX WARNING: Missing block: B:16:0x0034, code:
            return;
     */
    public void startFaceDetection() {
        /*
        r2 = this;
        r0 = r2.mFaceDetectionEnabled;
        if (r0 == 0) goto L_0x0034;
    L_0x0004:
        r0 = r2.mFaceDetectionStarted;
        if (r0 != 0) goto L_0x0034;
    L_0x0008:
        r0 = r2.mActivity;
        if (r0 == 0) goto L_0x0034;
    L_0x000c:
        r0 = r2.mActivity;
        r0 = r0.isActivityPaused();
        if (r0 != 0) goto L_0x0034;
    L_0x0014:
        r0 = r2.isAlive();
        if (r0 != 0) goto L_0x001b;
    L_0x001a:
        goto L_0x0034;
    L_0x001b:
        r0 = r2.mMaxFaceCount;
        if (r0 <= 0) goto L_0x0033;
    L_0x001f:
        r0 = r2.mCamera2Device;
        if (r0 == 0) goto L_0x0033;
    L_0x0023:
        r0 = 1;
        r2.mFaceDetectionStarted = r0;
        r1 = r2.mMainProtocol;
        r1.setActiveIndicator(r0);
        r1 = r2.mCamera2Device;
        r1.startFaceDetection();
        r2.updateFaceView(r0, r0);
    L_0x0033:
        return;
    L_0x0034:
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.module.Camera2Module.startFaceDetection():void");
    }

    public void stopFaceDetection(boolean z) {
        if (this.mFaceDetectionEnabled && this.mFaceDetectionStarted) {
            if (!(b.fZ() && (getCameraState() == 3 || getCameraState() == 0))) {
                this.mCamera2Device.stopFaceDetection();
            }
            this.mFaceDetectionStarted = false;
            this.mMainProtocol.setActiveIndicator(2);
            updateFaceView(false, z);
        }
    }

    /* JADX WARNING: Missing block: B:22:0x0054, code:
            return;
     */
    public void onFaceDetected(com.android.camera2.CameraHardwareFace[] r4, com.android.camera.effect.FaceAnalyzeInfo r5) {
        /*
        r3 = this;
        r5 = r3.isAlive();
        if (r5 == 0) goto L_0x0054;
    L_0x0006:
        r5 = r3.mActivity;
        r5 = r5.getCameraScreenNail();
        r5 = r5.getFrameAvailableFlag();
        if (r5 != 0) goto L_0x0013;
    L_0x0012:
        goto L_0x0054;
    L_0x0013:
        if (r4 != 0) goto L_0x0016;
    L_0x0015:
        return;
    L_0x0016:
        r5 = com.mi.config.b.gg();
        if (r5 == 0) goto L_0x003a;
    L_0x001c:
        r5 = r4.length;
        if (r5 <= 0) goto L_0x003a;
    L_0x001f:
        r5 = 0;
        r5 = r4[r5];
        r5 = r5.faceType;
        r0 = 64206; // 0xface float:8.9972E-41 double:3.1722E-319;
        if (r5 != r0) goto L_0x003a;
    L_0x0029:
        r5 = r3.mObjectTrackingStarted;
        if (r5 == 0) goto L_0x0053;
    L_0x002d:
        r5 = r3.mMainProtocol;
        r0 = 3;
        r1 = r3.getActiveArraySize();
        r2 = r3.mZoomValue;
        r5.setFaces(r0, r4, r1, r2);
        goto L_0x0053;
    L_0x003a:
        r5 = r3.mMainProtocol;
        r0 = 1;
        r1 = r3.getActiveArraySize();
        r2 = r3.mZoomValue;
        r5 = r5.setFaces(r0, r4, r1, r2);
        if (r5 != 0) goto L_0x004a;
    L_0x0049:
        return;
    L_0x004a:
        r5 = r3.mIsPortraitLightingOn;
        if (r5 == 0) goto L_0x0053;
    L_0x004e:
        r5 = r3.mMainProtocol;
        r5.lightingDetectFace(r4);
    L_0x0053:
        return;
    L_0x0054:
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.module.Camera2Module.onFaceDetected(com.android.camera2.CameraHardwareFace[], com.android.camera.effect.FaceAnalyzeInfo):void");
    }

    public boolean isFaceDetectStarted() {
        return this.mFaceDetectionStarted;
    }

    public boolean isUseFaceInfo() {
        return this.mIsGenderAgeOn || this.mIsMagicMirrorOn;
    }

    protected void updateFaceView(boolean z, boolean z2) {
        if (this.mHandler.hasMessages(35)) {
            this.mHandler.removeMessages(35);
        }
        this.mHandler.obtainMessage(35, z, z2).sendToTarget();
    }

    private void handleUpdateFaceView(boolean z, boolean z2) {
        boolean isFrontCamera = isFrontCamera();
        if (!z) {
            this.mMainProtocol.updateFaceView(z, z2, isFrontCamera, false, -1);
        } else if ((this.mFaceDetectionStarted || isFaceBeautyMode()) && 1 != this.mCamera2Device.getFocusMode()) {
            this.mMainProtocol.updateFaceView(z, true, isFrontCamera, true, this.mCameraDisplayOrientation);
        }
    }

    protected boolean isFaceBeautyMode() {
        return false;
    }

    public void stopObjectTracking(boolean z) {
    }

    public void notifyFocusAreaUpdate() {
        updatePreferenceTrampoline(3);
    }

    public void playSound(int i) {
        if (!CameraSettings.isLiveShotOn()) {
            playCameraSound(i);
        }
    }

    public void startObjectTracking() {
    }

    public void onObjectStable() {
    }

    private int getCountDownTimes() {
        int timerDurationSeconds;
        if (this.mBroadcastIntent != null) {
            timerDurationSeconds = CameraIntentManager.getInstance(this.mBroadcastIntent).getTimerDurationSeconds();
        } else {
            timerDurationSeconds = this.mActivity.getCameraIntentManager().getTimerDurationSeconds();
        }
        if (timerDurationSeconds == -1) {
            return CameraSettings.getCountDownTimes();
        }
        if (this.mBroadcastIntent != null) {
            this.mBroadcastIntent.removeExtra(CameraExtras.TIMER_DURATION_SECONDS);
        } else {
            this.mActivity.getIntent().removeExtra(CameraExtras.TIMER_DURATION_SECONDS);
        }
        if (timerDurationSeconds == 0) {
            return 0;
        }
        if (timerDurationSeconds != 5) {
            return 3;
        }
        return 5;
    }

    /* JADX WARNING: Missing block: B:17:0x0037, code:
            return false;
     */
    private boolean checkShutterCondition() {
        /*
        r2 = this;
        r0 = r2.isDoingAction();
        r1 = 0;
        if (r0 != 0) goto L_0x0037;
    L_0x0007:
        r0 = r2.isIgnoreTouchEvent();
        if (r0 == 0) goto L_0x000e;
    L_0x000d:
        goto L_0x0037;
    L_0x000e:
        r0 = com.android.camera.storage.Storage.isLowStorageAtLastPoint();
        if (r0 == 0) goto L_0x0015;
    L_0x0014:
        return r1;
    L_0x0015:
        r0 = r2.isFrontCamera();
        if (r0 == 0) goto L_0x0024;
    L_0x001b:
        r0 = r2.mActivity;
        r0 = r0.isScreenSlideOff();
        if (r0 == 0) goto L_0x0024;
    L_0x0023:
        return r1;
    L_0x0024:
        r0 = com.android.camera.protocol.ModeCoordinatorImpl.getInstance();
        r1 = 171; // 0xab float:2.4E-43 double:8.45E-322;
        r0 = r0.getAttachProtocol(r1);
        r0 = (com.android.camera.protocol.ModeProtocol.BackStack) r0;
        if (r0 == 0) goto L_0x0035;
    L_0x0032:
        r0.handleBackStackFromShutter();
    L_0x0035:
        r0 = 1;
        return r0;
    L_0x0037:
        return r1;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.module.Camera2Module.checkShutterCondition():boolean");
    }

    public void onShutterButtonClick(int i) {
        int countDownTimes = getCountDownTimes();
        if (countDownTimes > 0) {
            startCount(countDownTimes, i);
        } else if (checkShutterCondition()) {
            setTriggerMode(i);
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("onShutterButtonClick ");
            stringBuilder.append(String.valueOf(getCameraState()));
            Log.d(str, stringBuilder.toString());
            this.mFocusManager.prepareCapture(this.mNeedAutoFocus, 2);
            this.mFocusManager.doSnap();
            if (this.mFocusManager.isFocusingSnapOnFinish()) {
                enableCameraControls(false);
            }
        }
    }

    private void prepareNormalCapture() {
        Log.d(TAG, "prepareNormalCapture");
        initFlashAutoStateForTrack(this.mCamera2Device.isNeedFlashOn());
        this.mEnabledPreviewThumbnail = false;
        this.mTotalJpegCallbackNum = 1;
        this.mReceivedJpegCallbackNum = 0;
        this.mCaptureStartTime = System.currentTimeMillis();
        ScenarioTrackUtil.trackCaptureTimeStart(isFrontCamera(), this.mModuleIndex);
        this.mLastCaptureTime = this.mCaptureStartTime;
        setCameraState(3);
        this.mJpegRotation = Util.getJpegRotation(this.mBogusCameraId, this.mOrientation);
        this.mCamera2Device.setJpegRotation(this.mJpegRotation);
        Location currentLocation = LocationManager.instance().getCurrentLocation();
        this.mCamera2Device.setGpsLocation(currentLocation);
        this.mLocation = currentLocation;
        updateFrontMirror();
        updateBeauty();
        updateShotDetermine();
        if (this.mIsParallelProcess) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(Util.createJpegName(System.currentTimeMillis()));
            stringBuilder.append(getSuffix());
            this.mParallelProcessingFilePath = Storage.generateFilepath(stringBuilder.toString());
            this.mCamera2Device.setShotSavePath(this.mParallelProcessingFilePath);
        }
        setWaterMark();
        setPictureOrientation();
        updateJpegQuality();
        updateAlgorithmName();
        if (needShowThumbProgressImmediately()) {
            updateThumbProgress(false);
        }
        prepareSuperNight();
    }

    private void startNormalCapture(int i) {
        prepareNormalCapture();
        if (CameraSettings.isGroupShotOn()) {
            prepareGroupShot();
            this.mCamera2Device.captureGroupShotPictures(this, this.mActivity.getImageSaver(), this.mTotalJpegCallbackNum, this.mGroupShot);
            return;
        }
        long j;
        MainHandler mainHandler = this.mHandler;
        if (this.mModuleIndex == 173) {
            j = 16000;
        } else {
            j = CAPTURE_DURATION_THRESHOLD;
        }
        mainHandler.sendEmptyMessageDelayed(50, j);
        this.mCamera2Device.takePicture(this, this.mActivity.getImageSaver());
    }

    private void prepareMultiCapture() {
        this.mMultiSnapStatus = true;
        this.mMultiSnapStopRequest = false;
        Util.clearMemoryLimit();
        prepareNormalCapture();
        CameraCapabilities cameraCapabilities = this.mCameraCapabilities;
        this.mTotalJpegCallbackNum = CameraCapabilities.getBurstShootCount();
        this.mHandler.removeMessages(49);
    }

    private void prepareSuperNight() {
        if (this.mModuleIndex == 173) {
            ((ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162)).processingStart();
            this.mSuperNightDisposable = Observable.just(Integer.valueOf(300), Integer.valueOf(2000)).flatMap(new Function<Integer, ObservableSource<Integer>>() {
                public ObservableSource<Integer> apply(Integer num) throws Exception {
                    return Observable.just(num).delaySubscription((long) num.intValue(), TimeUnit.MILLISECONDS);
                }
            }).observeOn(AndroidSchedulers.mainThread()).subscribe(new Consumer<Integer>() {
                public void accept(Integer num) throws Exception {
                    if (Camera2Module.this.isAlive()) {
                        BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
                        int intValue = num.intValue();
                        if (intValue != 300) {
                            if (intValue == 2000) {
                                Camera2Module.this.animateCapture();
                                Camera2Module.this.playSound(0);
                                ((ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162)).processingPostAction();
                                DualController dualController = (DualController) ModeCoordinatorImpl.getInstance().getAttachProtocol(182);
                                if (dualController != null) {
                                    dualController.showZoomButton();
                                }
                                if (bottomPopupTips != null) {
                                    bottomPopupTips.hideTipImage();
                                }
                            }
                        } else if (bottomPopupTips != null) {
                            bottomPopupTips.showTips(11, R.string.super_night_toast, 4);
                        }
                    }
                }
            });
        }
    }

    private void animateCapture() {
        if (!this.mIsImageCaptureIntent) {
            this.mActivity.getCameraScreenNail().animateCapture(getCameraRotation());
        }
    }

    public void onShutterButtonFocus(boolean z, int i) {
    }

    public void onLongPress(int i, int i2) {
        if (isInTapableRect(i, i2)) {
            onSingleTapUp(i, i2);
            if (CameraSettings.isAEAFLockSupport()) {
                lockAEAF();
            }
            if (isSupportFocusShoot() && !is3ALocked()) {
                setTriggerMode(80);
                onShutterButtonClick(getTriggerMode());
            }
            this.mMainProtocol.performHapticFeedback(0);
        }
    }

    public boolean onShutterButtonLongClick() {
        if (isDoingAction() || this.mIsImageCaptureIntent) {
            return false;
        }
        BackStack backStack = (BackStack) ModeCoordinatorImpl.getInstance().getAttachProtocol(171);
        if (backStack != null) {
            backStack.handleBackStackFromShutter();
        }
        if (!CameraSettings.isBurstShootingEnable() || !ModuleManager.isCameraModule() || this.mIsImageCaptureIntent || CameraSettings.isGroupShotOn() || CameraSettings.isGradienterOn() || CameraSettings.isTiltShiftOn() || DataRepository.dataItemRunning().isSwitchOn("pref_camera_hand_night_key") || CameraSettings.isStereoModeOn() || CameraSettings.isPortraitModeBackOn() || !isBackCamera() || this.mMultiSnapStatus || this.mHandler.hasMessages(24) || this.mPendingMultiCapture) {
            this.mLongPressedAutoFocus = true;
            this.mMainProtocol.setFocusViewType(false);
            this.mFocusManager.requestAutoFocus();
            this.mActivity.getScreenHint().updateHint();
            return false;
        }
        if (b.gu()) {
            this.mUpdateImageTitle = true;
        }
        this.mPendingMultiCapture = true;
        this.mFocusManager.doMultiSnap(true);
        return true;
    }

    public void onShutterButtonLongClickCancel(boolean z) {
        this.mPendingMultiCapture = false;
        if (this.mMultiSnapStatus) {
            this.mHandler.sendEmptyMessageDelayed(49, FragmentTopAlert.HINT_DELAY_TIME);
        }
        this.mMultiSnapStopRequest = true;
        if (!this.mLongPressedAutoFocus) {
            return;
        }
        if (z) {
            onShutterButtonClick(10);
            return;
        }
        this.mLongPressedAutoFocus = false;
        this.mFocusManager.cancelLongPressedAutoFocus();
    }

    public boolean isDoingAction() {
        return this.mPaused || this.isZooming || isKeptBitmapTexture() || this.mMultiSnapStatus || getCameraState() == 0 || getCameraState() == 3 || isParallelQueueFull() || isInCountDown();
    }

    public boolean isUnInterruptable() {
        this.mUnInterruptableReason = null;
        if (isKeptBitmapTexture()) {
            this.mUnInterruptableReason = "bitmap cover";
        } else if (getCameraState() == 3) {
            this.mUnInterruptableReason = "snapshot";
        }
        return this.mUnInterruptableReason != null;
    }

    public void onThumbnailClicked(View view) {
        if (!(isDoingAction() || this.mActivity.getThumbnailUpdater().getThumbnail() == null)) {
            this.mActivity.gotoGallery();
        }
    }

    private void startCount(final int i, int i2) {
        if (checkShutterCondition()) {
            setTriggerMode(i2);
            tryRemoveCountDownMessage();
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("startCount: ");
            stringBuilder.append(i);
            Log.d(str, stringBuilder.toString());
            Observable.interval(1, TimeUnit.SECONDS).take((long) i).observeOn(AndroidSchedulers.mainThread()).subscribe(new Observer<Long>() {
                public void onSubscribe(Disposable disposable) {
                    Camera2Module.this.mCountdownDisposable = disposable;
                    Camera2Module.this.playSound(7);
                    TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
                    if (topAlert != null) {
                        topAlert.hideAlert();
                    }
                    Camera2Module.this.mMainProtocol.clearFocusView(7);
                    Camera2Module.this.mMainProtocol.showDelayNumber(i);
                }

                public void onNext(Long l) {
                    int intValue = i - (l.intValue() + 1);
                    if (intValue > 0) {
                        Camera2Module.this.playSound(5);
                        Camera2Module.this.mMainProtocol.showDelayNumber(intValue);
                    }
                }

                public void onError(Throwable th) {
                }

                public void onComplete() {
                    Camera2Module.this.tryRemoveCountDownMessage();
                    Camera2Module.this.onShutterButtonFocus(true, 3);
                    Camera2Module.this.startNormalCapture(Camera2Module.this.getTriggerMode());
                    Camera2Module.this.onShutterButtonFocus(false, 0);
                    TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
                    if (topAlert != null) {
                        topAlert.reInitAlert();
                    }
                }
            });
        }
    }

    private boolean isInCountDown() {
        return (this.mCountdownDisposable == null || this.mCountdownDisposable.isDisposed()) ? false : true;
    }

    public void tryRemoveCountDownMessage() {
        if (this.mCountdownDisposable != null && !this.mCountdownDisposable.isDisposed()) {
            this.mCountdownDisposable.dispose();
            this.mCountdownDisposable = null;
            this.mMainProtocol.hideDelayNumber();
        }
    }

    public boolean isKeptBitmapTexture() {
        return this.mKeepBitmapTexture;
    }

    public void onReviewDoneClicked() {
        doAttach();
    }

    public void onReviewCancelClicked() {
        this.mKeepBitmapTexture = false;
        if (isSelectingCapturedImage()) {
            this.mActivity.getCameraScreenNail().releaseBitmapIfNeeded();
            hidePostCaptureAlert();
            return;
        }
        this.mActivity.setResult(0, new Intent());
        this.mActivity.finish();
    }

    private boolean isSelectingCapturedImage() {
        boolean z = false;
        if (!this.mIsImageCaptureIntent) {
            return false;
        }
        BaseDelegate baseDelegate = (BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160);
        if (baseDelegate != null && baseDelegate.getActiveFragment(R.id.bottom_action) == 4083) {
            z = true;
        }
        return z;
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

    public void onFilterChanged(int i, int i2) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("onFilterChanged: category = ");
        stringBuilder.append(i);
        stringBuilder.append(", newIndex = ");
        stringBuilder.append(i2);
        Log.d(str, stringBuilder.toString());
        updatePreferenceTrampoline(2);
        this.mMainProtocol.updateEffectViewVisible();
    }

    public boolean onBackPressed() {
        if (!isCreated()) {
            return false;
        }
        tryRemoveCountDownMessage();
        if (this.mMultiSnapStatus) {
            onShutterButtonLongClickCancel(false);
            return true;
        }
        if (getCameraState() == 3) {
            long currentTimeMillis = System.currentTimeMillis();
            if (this.mModuleIndex == 173) {
                if (currentTimeMillis - this.mLastBackPressedTime > 3000) {
                    this.mLastBackPressedTime = currentTimeMillis;
                    ToastUtils.showToast(this.mActivity, (int) R.string.capture_back_pressed_hint);
                    return true;
                }
            } else if (currentTimeMillis - this.mLastCaptureTime < CAPTURE_DURATION_THRESHOLD) {
                return true;
            }
        }
        return super.onBackPressed();
    }

    public void onResume() {
        super.onResume();
        this.mHandler.removeMessages(50);
        this.mMainProtocol.initEffectCropView();
        if (!isSelectingCapturedImage()) {
            this.mKeepBitmapTexture = false;
            this.mActivity.getCameraScreenNail().releaseBitmapIfNeeded();
        }
        keepScreenOnAwhile();
        this.mActivity.runOnUiThread(new Runnable() {
            public void run() {
                if (Camera2Module.this.mLensApi != null && !Camera2Module.this.mIsLensServiceBound && !Camera2Module.this.mActivity.isActivityPaused()) {
                    Log.d(Camera2Module.TAG, "Bind Lens service: E");
                    Camera2Module.this.mLensApi.onResume();
                    Camera2Module.this.mIsLensServiceBound = true;
                    Log.d(Camera2Module.TAG, "Bind Lens service: X");
                }
            }
        });
    }

    public void setFrameAvailable(boolean z) {
        super.setFrameAvailable(z);
        if (CameraSettings.isCameraSoundOpen()) {
            this.mActivity.loadCameraSound(1);
            this.mActivity.loadCameraSound(0);
            this.mActivity.loadCameraSound(4);
            this.mActivity.loadCameraSound(5);
            this.mActivity.loadCameraSound(7);
        }
    }

    public void onPause() {
        super.onPause();
        stopLiveShot(true);
        if (this.mFocusManager != null) {
            this.mFocusManager.removeMessages();
        }
        resetGradienter();
        tryRemoveCountDownMessage();
        this.mActivity.getSensorStateManager().reset();
        this.mActivity.getSensorStateManager().setSensorStateListener(null);
        resetScreenOn();
        closeCamera();
        releaseEffectProcessor();
        this.mActivity.runOnUiThread(new Runnable() {
            public void run() {
                if (Camera2Module.this.mLensApi != null && Camera2Module.this.mIsLensServiceBound) {
                    Log.d(Camera2Module.TAG, "Unbind Lens service: E");
                    Camera2Module.this.mIsLensServiceBound = false;
                    try {
                        Camera2Module.this.mLensApi.onPause();
                    } catch (Exception e) {
                        String access$1500 = Camera2Module.TAG;
                        StringBuilder stringBuilder = new StringBuilder();
                        stringBuilder.append("Unknown error when pause LensAPI->");
                        stringBuilder.append(e.getMessage());
                        Log.d(access$1500, stringBuilder.toString());
                    }
                    Log.d(Camera2Module.TAG, "Unbind Lens service: X");
                }
            }
        });
        if (this.mHandler != null) {
            this.mHandler.removeCallbacksAndMessages(null);
        }
    }

    public void onStop() {
        super.onStop();
        if (this.mHandler != null) {
            this.mHandler.removeCallbacksAndMessages(null);
        }
    }

    public void onDestroy() {
        super.onDestroy();
        if (this.mHandler != null) {
            this.mHandler.sendEmptyMessage(45);
        }
    }

    private boolean isLaunchedByMainIntent() {
        Object action;
        if (this.mActivity != null) {
            Intent intent = this.mActivity.getIntent();
            if (intent != null) {
                action = intent.getAction();
                return "android.intent.action.MAIN".equals(action);
            }
        }
        action = null;
        return "android.intent.action.MAIN".equals(action);
    }

    public boolean shouldReleaseLater() {
        return !this.mIsImageCaptureIntent && getCameraState() == 3 && !this.mMultiSnapStatus && ((this.mHandler == null || !(this.mHandler.hasMessages(48) || this.mHandler.hasMessages(49))) && !this.mFocusManager.isFocusing() && (this.mModuleIndex != 167 || getManualValue(CameraSettings.KEY_QC_EXPOSURETIME, getString(R.string.pref_camera_exposuretime_default)).equals(getString(R.string.pref_camera_exposuretime_default))));
    }

    private void doLaterReleaseIfNeed() {
        if (this.mActivity != null) {
            if (this.mHandler != null) {
                this.mHandler.removeMessages(50);
            }
            if (this.mActivity.isActivityPaused()) {
                boolean z;
                if (this.mCamera2Device == null || !this.mCamera2Device.isSessionReady()) {
                    z = false;
                } else {
                    z = true;
                }
                if (z) {
                    Log.d(TAG, "doLaterRelease");
                } else {
                    Log.d(TAG, "doLaterRelease but session is closed");
                }
                this.mActivity.releaseAll(true, z);
            } else if (!isDeparted()) {
                this.mHandler.post(new Runnable() {
                    public void run() {
                        Camera2Module.this.handlePendingScreenSlide();
                    }
                });
                if (this.mActivity.getCameraScreenNail().getSurfaceCreatedTimestamp() != this.mSurfaceCreatedTimestamp) {
                    Log.d(TAG, "surfaceTexture expired, restartModule");
                    this.mHandler.post(new Runnable() {
                        public void run() {
                            Camera2Module.this.restartModule();
                        }
                    });
                }
            }
        }
    }

    public void onCreate(int i, int i2) {
        super.onCreate(i, i2);
        parseIntent();
        this.mHandler = new MainHandler(this.mActivity.getMainLooper());
        this.mActivity.getSensorStateManager().setSensorStateListener(this.mSensorStateListener);
        onCameraOpened();
        this.mLensApi = new LensApi(this.mActivity);
        this.mLensApi.checkLensAvailability(new LensAvailabilityCallback() {
            public void onAvailabilityStatusFetched(int i) {
                Camera2Module.this.mLensStatus = i;
                CameraSettings.setGoogleLensAvailability(Camera2Module.this.mLensStatus == 0);
            }
        });
    }

    private void parseIntent() {
        CameraIntentManager cameraIntentManager = this.mActivity.getCameraIntentManager();
        this.mIsImageCaptureIntent = cameraIntentManager.isImageCaptureIntent();
        if (this.mIsImageCaptureIntent) {
            this.mSaveUri = cameraIntentManager.getExtraSavedUri();
            this.mCropValue = cameraIntentManager.getExtraCropValue();
            this.mIsSaveCaptureImage = cameraIntentManager.getExtraShouldSaveCapture().booleanValue();
            this.mQuickCapture = cameraIntentManager.isQuickCapture().booleanValue();
        }
    }

    public void closeCamera() {
        setCameraState(0);
        if (scanQRCodeEnabled()) {
            QRCodeManager.getInstance().stopDecode();
            QRCodeManager.getInstance().quit();
        }
        if (this.mCamera2Device != null) {
            if (this.mBurstDisposable != null) {
                this.mBurstDisposable.dispose();
            }
            if (this.mMetaDataFlowableEmitter != null) {
                this.mMetaDataFlowableEmitter.onComplete();
            }
            if (this.mMetaDataDisposable != null) {
                this.mMetaDataDisposable.dispose();
            }
            if (this.mAiSceneFlowableEmitter != null) {
                this.mAiSceneFlowableEmitter.onComplete();
            }
            if (this.mAiSceneDisposable != null) {
                this.mAiSceneDisposable.dispose();
            }
            if (this.mSuperNightDisposable != null) {
                this.mSuperNightDisposable.dispose();
            }
            this.mCamera2Device.setScreenLightCallback(null);
            this.mCamera2Device.setMetaDataCallback(null);
            this.mCamera2Device.setErrorCallback(null);
            this.mCamera2Device.releaseCameraPreviewCallback(null);
            this.mCamera2Device.setFocusCallback(null);
            this.mCamera2Device.setASD(false);
            this.mMetaDataFlowableEmitter = null;
            if (scanQRCodeEnabled()) {
                this.mCamera2Device.stopPreviewCallback(true);
            }
            if (this.mFaceDetectionStarted) {
                this.mFaceDetectionStarted = false;
            }
            this.m3ALocked = false;
            this.mCamera2Device = null;
        }
        if (this.mFocusManager != null) {
            this.mFocusManager.setAeAwbLock(false);
            this.mFocusManager.destroy();
        }
    }

    public void startPreview() {
        if (this.mCamera2Device != null) {
            this.mCamera2Device.setFocusCallback(this);
            this.mCamera2Device.setMetaDataCallback(this);
            this.mCamera2Device.setScreenLightCallback(this);
            this.mCamera2Device.setErrorCallback(this.mErrorCallback);
            this.mCamera2Device.setPictureSize(this.mPictureSize);
            if (this.mIsParallelProcess) {
                if (isFrontCamera()) {
                    this.mCamera2Device.setSubPictureSize(this.mSubPictureSize);
                } else {
                    this.mCamera2Device.setSubPictureSize(this.mPictureSize);
                }
            }
            Surface surface = new Surface(this.mActivity.getCameraScreenNail().getSurfaceTexture());
            this.mSurfaceCreatedTimestamp = this.mActivity.getCameraScreenNail().getSurfaceCreatedTimestamp();
            boolean scanQRCodeEnabled = scanQRCodeEnabled();
            if (scanQRCodeEnabled) {
                QRCodeManager.getInstance().init();
            }
            this.mCamera2Device.startPreviewSession(surface, scanQRCodeEnabled, isNeedRawStream(), getOperatingMode(), this, QRCodeManager.getInstance().getHandler());
            if (this.mIsParallelProcess) {
                configParallelSession();
            }
        }
    }

    private void configParallelSession() {
        GraphDescriptorBean graphDescriptorBean;
        if (isPortraitMode()) {
            graphDescriptorBean = new GraphDescriptorBean(32770, 2, true, isFrontCamera());
        } else {
            graphDescriptorBean = new GraphDescriptorBean(0, 1, true, isFrontCamera());
        }
        AlgoConnector.getInstance().getLocalBinder().configCaptureSession(new BufferFormat(this.mPictureSize.width, this.mPictureSize.height, 35, graphDescriptorBean));
        AlgoConnector.getInstance().getLocalBinder().setImageSaver(this.mActivity.getImageSaver());
    }

    private boolean isNeedRawStream() {
        if (ModuleManager.isManualModule() && CameraSettings.isEnableDNG()) {
            for (CameraSize cameraSize : this.mCameraCapabilities.getSupportedOutputSize(37)) {
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("");
                stringBuilder.append(cameraSize.width);
                stringBuilder.append("x");
                stringBuilder.append(cameraSize.height);
                stringBuilder.append(" ");
                stringBuilder.append(this.mPictureSize.width);
                stringBuilder.append("x");
                stringBuilder.append(this.mPictureSize.height);
                Log.d(str, stringBuilder.toString());
                if (cameraSize.width == this.mPictureSize.width && cameraSize.height == this.mPictureSize.height) {
                    return true;
                }
            }
        }
        return false;
    }

    protected int getOperatingMode() {
        int i;
        if (this.mIsParallelProcess) {
            if (isPortraitMode()) {
                i = 36864;
            } else {
                i = CameraCapabilities.SESSION_OPERATION_MODE_ALGO_UP_SINGLE;
            }
            return i;
        }
        String str;
        StringBuilder stringBuilder;
        i = getModuleIndex();
        int i2 = 32775;
        if (isFrontCamera()) {
            mIsBeautyFrontOn = BeautyParameters.isFaceBeautyOn();
            if (i == 171 && DataRepository.dataItemFeature().eY()) {
                if (!isBokehFrontCamera()) {
                    i2 = 33009;
                    this.mOperatingMode = i2;
                    str = TAG;
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("getOperatingMode: ");
                    stringBuilder.append(String.format("operatingMode = 0x%x", new Object[]{Integer.valueOf(i2)}));
                    Log.d(str, stringBuilder.toString());
                    return i2;
                }
            } else if (!(i == 171 && isBokehFrontCamera())) {
                if (!(this.mCameraCapabilities.isSupportedQcfa() && !mIsBeautyFrontOn && "off".equals(DataRepository.dataItemConfig().getComponentHdr().getComponentValue(this.mModuleIndex)))) {
                    i2 = 32773;
                }
                this.mOperatingMode = i2;
                str = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("getOperatingMode: ");
                stringBuilder.append(String.format("operatingMode = 0x%x", new Object[]{Integer.valueOf(i2)}));
                Log.d(str, stringBuilder.toString());
                return i2;
            }
        }
        if (i != 167) {
            if (i != 171) {
                i2 = i != 173 ? 32769 : CameraCapabilities.SESSION_OPERATION_MODE_SUPER_NIGHT;
            }
        } else if (!(CameraSettings.isUltraPixelPhotographyOn() && this.mCameraCapabilities.isUltraPixelPhotographySupported())) {
            i2 = 32771;
        }
        this.mOperatingMode = i2;
        str = TAG;
        stringBuilder = new StringBuilder();
        stringBuilder.append("getOperatingMode: ");
        stringBuilder.append(String.format("operatingMode = 0x%x", new Object[]{Integer.valueOf(i2)}));
        Log.d(str, stringBuilder.toString());
        return i2;
        i2 = 32770;
        this.mOperatingMode = i2;
        str = TAG;
        stringBuilder = new StringBuilder();
        stringBuilder.append("getOperatingMode: ");
        stringBuilder.append(String.format("operatingMode = 0x%x", new Object[]{Integer.valueOf(i2)}));
        Log.d(str, stringBuilder.toString());
        return i2;
    }

    public void onPreviewSessionSuccess(CameraCaptureSession cameraCaptureSession) {
        Log.e("onPreviewSessionSuccess:", Thread.currentThread().getName());
        if (cameraCaptureSession != null && isAlive()) {
            if (!isKeptBitmapTexture()) {
                this.mHandler.sendEmptyMessage(9);
            }
            previewWhenSessionSuccess();
            if (this.mActivity.getCameraIntentManager().checkCallerLegality()) {
                if (this.mActivity.getCameraIntentManager().isOpenOnly()) {
                    this.mActivity.getIntent().removeExtra(CameraExtras.TIMER_DURATION_SECONDS);
                } else {
                    this.mActivity.getIntent().removeExtra(CameraExtras.CAMERA_OPEN_ONLY);
                    this.mHandler.sendEmptyMessageDelayed(52, 1000);
                }
            }
        }
    }

    private void previewWhenSessionSuccess() {
        setCameraState(1);
        this.mFaceDetectionEnabled = false;
        updatePreferenceInWorkThread(UpdateConstant.CAMERA_TYPES_ON_PREVIEW_SUCCESS);
        if (ModuleManager.isManualModule()) {
            updatePreferenceInWorkThread(UpdateConstant.CAMERA_TYPES_MANUALLY);
        }
    }

    public void onPreviewSessionFailed(CameraCaptureSession cameraCaptureSession) {
        this.mHandler.sendEmptyMessage(51);
    }

    public void onPreviewSessionClosed(CameraCaptureSession cameraCaptureSession) {
        Log.d(TAG, "onPreviewSessionClosed: ");
        setCameraState(0);
    }

    public void onFocusStateChanged(FocusTask focusTask) {
        if (isAlive()) {
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
                        this.mAFEndLogTimes = 0;
                    } else if (this.mAFEndLogTimes == 0) {
                        StringBuilder stringBuilder = new StringBuilder();
                        stringBuilder.append("onAutoFocusMoving end. result=");
                        stringBuilder.append(focusTask.isSuccess());
                        str = stringBuilder.toString();
                        this.mAFEndLogTimes++;
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

    public void pausePreview() {
        Log.v(TAG, "pausePreview");
        this.mCamera2Device.pausePreview();
        setCameraState(0);
    }

    public void resumePreview() {
        Log.v(TAG, "resumePreview");
        previewWhenSessionSuccess();
    }

    private void resumePreviewInWorkThread() {
        updatePreferenceInWorkThread(new int[0]);
    }

    private boolean isParallelQueueFull() {
        boolean z = false;
        if (!this.mIsParallelProcess) {
            return false;
        }
        if (this.mActivity.getImageSaver().isSaveQueueFull()) {
            Log.d(TAG, "isParallelQueueFull: ImageSaver queue is full");
            return true;
        }
        LocalBinder localBinder = AlgoConnector.getInstance().getLocalBinder();
        if (localBinder != null) {
            z = localBinder.needWaitProcess();
        } else {
            Log.w(TAG, "isParallelQueueFull: NOTICE: CHECK WHY BINDER IS NULL!");
        }
        return z;
    }

    private void beginParallelProcess(ParallelTaskData parallelTaskData) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(parallelTaskData.getSavePath());
        stringBuilder.append(" | ");
        stringBuilder.append(Thread.currentThread().getName());
        Log.e("algo begin:", stringBuilder.toString());
        SaveTask saveTask = (SaveTask) DbRepository.dbItemSaveTask().generateItem(System.currentTimeMillis());
        saveTask.setPath(parallelTaskData.getSavePath());
        DbRepository.dbItemSaveTask().endItemAndInsert(saveTask, 0);
        AlgoConnector.getInstance().getLocalBinder().onCaptureStart(parallelTaskData);
        if (this.mServiceStatusListener == null) {
            this.mServiceStatusListener = new ServiceStatusListener() {
                public void onImagePostProcessStart(ParallelTaskData parallelTaskData) {
                    Camera2Module.this.onPictureTakenFinished(true);
                    PerformanceTracker.trackPictureCapture(1);
                    String access$1500 = Camera2Module.TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("onImagePostProcessStart: ");
                    stringBuilder.append(parallelTaskData);
                    Log.d(access$1500, stringBuilder.toString());
                    if (parallelTaskData != null) {
                        Camera2Module.this.mActivity.getImageSaver().addUsedMemory(parallelTaskData.getProcessUsedMemorySize());
                        stringBuilder = new StringBuilder();
                        stringBuilder.append(parallelTaskData.getTimeStamp());
                        stringBuilder.append(" | ");
                        Log.e("algo start:", stringBuilder.toString());
                    }
                }
            };
            AlgoConnector.getInstance().setServiceStatusListener(this.mServiceStatusListener);
        }
    }

    private boolean enablePreviewAsThumbnail() {
        boolean z = false;
        if (!isAlive()) {
            return false;
        }
        if (this.mIsParallelProcess) {
            return true;
        }
        if (this.mIsPortraitLightingOn) {
            return false;
        }
        if (CameraSettings.isLiveShotOn()) {
            return true;
        }
        if (CameraSettings.isGradienterOn() || CameraSettings.isGroupShotOn()) {
            return false;
        }
        if (CameraSettings.isPortraitModeBackOn()) {
            return true;
        }
        if (this.mModuleIndex == 167 || this.mModuleIndex == 173 || CameraSettings.showGenderAge() || CameraSettings.isMagicMirrorOn()) {
            return false;
        }
        if (this.mCamera2Device != null && this.mCamera2Device.isNeedPreviewThumbnail()) {
            z = true;
        }
        return z;
    }

    public void onPreviewPixelsRead(byte[] bArr, int i, int i2) {
        byte[] bitmapData;
        animateCapture();
        int i3 = 0;
        playSound(0);
        Bitmap createBitmap = Bitmap.createBitmap(i, i2, Config.ARGB_8888);
        createBitmap.copyPixelsFromBuffer(ByteBuffer.wrap(bArr));
        boolean z = isFrontCamera() && !isFrontMirror();
        if (this.mIsParallelProcess) {
            if (z) {
                createBitmap = Util.flipBitmap(createBitmap);
                z = false;
            }
            bitmapData = Util.getBitmapData(createBitmap);
        } else {
            bitmapData = null;
        }
        int i4 = this.mShootOrientation - this.mDisplayRotation;
        if (!(isFrontCamera() && b.hk() && i4 % 180 == 0)) {
            i3 = i4;
        }
        if (isAlive()) {
            Thumbnail createThumbnail = Thumbnail.createThumbnail(null, createBitmap, i3, z);
            createThumbnail.startWaitingForUri();
            this.mActivity.getThumbnailUpdater().setThumbnail(createThumbnail, true, true);
            if (bitmapData != null && this.mIsParallelProcess) {
                ParallelTaskData parallelTaskData = new ParallelTaskData(System.currentTimeMillis(), -1, this.mParallelProcessingFilePath);
                parallelTaskData.fillJpegData(bitmapData, 1);
                this.mActivity.getImageSaver().onParallelProcessFinish(parallelTaskData);
            }
        }
    }

    public void onSurfaceTextureUpdated(DrawExtTexAttribute drawExtTexAttribute) {
        if (this.mCircularMediaRecorder != null) {
            this.mCircularMediaRecorder.onSurfaceTextureUpdated(drawExtTexAttribute);
        }
    }

    public void onSurfaceTextureReleased() {
        stopLiveShot(true);
    }

    protected boolean isAutoRestartInNonZSL() {
        return false;
    }

    private void updateAlgorithmName() {
        String str;
        if (b.hC()) {
            str = null;
        } else if (this.mCamera2Device.isBokehEnabled()) {
            str = Util.ALGORITHM_NAME_SOFT_PORTRAIT;
        } else if (this.mModuleIndex == 171) {
            str = "portrait";
        } else {
            str = this.mMutexModePicker.getAlgorithmName();
        }
        this.mAlgorithmName = str;
    }

    /* JADX WARNING: Removed duplicated region for block: B:14:0x0070  */
    /* JADX WARNING: Removed duplicated region for block: B:13:0x006e  */
    /* JADX WARNING: Removed duplicated region for block: B:23:0x0092  */
    /* JADX WARNING: Removed duplicated region for block: B:29:0x00ad  */
    /* JADX WARNING: Removed duplicated region for block: B:27:0x00a6  */
    /* JADX WARNING: Removed duplicated region for block: B:34:0x00bf  */
    /* JADX WARNING: Removed duplicated region for block: B:32:0x00b8  */
    /* JADX WARNING: Removed duplicated region for block: B:37:0x00e8  */
    public com.xiaomi.camera.core.ParallelTaskData onCaptureStart(long r31, int r33, java.lang.String r34) {
        /*
        r30 = this;
        r0 = r30;
        r1 = com.android.camera.CameraSettings.isLiveShotOn();
        if (r1 == 0) goto L_0x000b;
    L_0x0008:
        r30.startLiveShotAnimation();
    L_0x000b:
        r30.onShutter();
        r1 = com.android.camera.CameraSettings.isAgeGenderAndMagicMirrorWaterOpen();
        r2 = 0;
        if (r1 == 0) goto L_0x0036;
    L_0x0016:
        r1 = com.android.camera.protocol.ModeCoordinatorImpl.getInstance();
        r3 = 166; // 0xa6 float:2.33E-43 double:8.2E-322;
        r1 = r1.getAttachProtocol(r3);
        r1 = (com.android.camera.protocol.ModeProtocol.MainContentProtocol) r1;
        r1 = r1.getFaceWaterMarkInfos();
        if (r1 == 0) goto L_0x0036;
    L_0x0028:
        r3 = r1.isEmpty();
        if (r3 != 0) goto L_0x0036;
    L_0x002e:
        r3 = new java.util.ArrayList;
        r3.<init>(r1);
        r19 = r3;
        goto L_0x0038;
    L_0x0036:
        r19 = r2;
    L_0x0038:
        r1 = new com.xiaomi.camera.core.ParallelTaskData;
        r3 = r31;
        r5 = r33;
        r6 = r34;
        r1.<init>(r3, r5, r6);
        r5 = com.android.camera.CameraSettings.isDualCameraWaterMarkOpen();
        r6 = r30.isFrontMirror();
        r7 = com.android.camera.CameraSettings.getPortraitLightingPattern();
        r3 = r0.mPreviewSize;
        r8 = r3.width;
        r3 = r0.mPreviewSize;
        r9 = r3.height;
        r3 = r0.mPictureSize;
        r10 = r3.width;
        r3 = r0.mPictureSize;
        r11 = r3.height;
        r3 = com.android.camera.effect.EffectController.getInstance();
        r4 = 0;
        r12 = r3.getEffectForSaving(r4);
        r3 = -1;
        r13 = r0.mOrientation;
        if (r3 != r13) goto L_0x0070;
    L_0x006e:
        r13 = r4;
        goto L_0x0073;
    L_0x0070:
        r3 = r0.mOrientation;
        r13 = r3;
    L_0x0073:
        r14 = r0.mJpegRotation;
        r3 = com.android.camera.CameraSettings.isGradienterOn();
        if (r3 == 0) goto L_0x0085;
    L_0x007b:
        r3 = r0.mShootRotation;
        r4 = -1082130432; // 0xffffffffbf800000 float:-1.0 double:NaN;
        r3 = (r3 > r4 ? 1 : (r3 == r4 ? 0 : -1));
        if (r3 != 0) goto L_0x0085;
    L_0x0083:
        r3 = 0;
        goto L_0x0087;
    L_0x0085:
        r3 = r0.mShootRotation;
    L_0x0087:
        r15 = r3;
        r3 = r0.mShootOrientation;
        r4 = r0.mLocation;
        r16 = com.android.camera.CameraSettings.isTimeWaterMarkOpen();
        if (r16 == 0) goto L_0x0099;
    L_0x0092:
        r2 = com.android.camera.Util.getTimeWatermark();
    L_0x0096:
        r18 = r2;
        goto L_0x009a;
    L_0x0099:
        goto L_0x0096;
    L_0x009a:
        r20 = com.android.camera.CameraSettings.isAgeGenderAndMagicMirrorWaterOpen();
        r21 = r30.isFrontCamera();
        r2 = r0.mOutPutSize;
        if (r2 != 0) goto L_0x00ad;
    L_0x00a6:
        r2 = r0.mPictureSize;
        r2 = r2.width;
    L_0x00aa:
        r22 = r2;
        goto L_0x00b4;
    L_0x00ad:
        r2 = r0.mOutPutSize;
        r2 = r2.getWidth();
        goto L_0x00aa;
    L_0x00b4:
        r2 = r0.mOutPutSize;
        if (r2 != 0) goto L_0x00bf;
    L_0x00b8:
        r2 = r0.mPictureSize;
        r2 = r2.height;
    L_0x00bc:
        r23 = r2;
        goto L_0x00c6;
    L_0x00bf:
        r2 = r0.mOutPutSize;
        r2 = r2.getHeight();
        goto L_0x00bc;
    L_0x00c6:
        r24 = r30.isBokehFrontCamera();
        r2 = r0.mAlgorithmName;
        r26 = r30.getPictureInfo();
        r27 = r30.getSuffix();
        r29 = r4;
        r4 = r0.mEnabledPreviewThumbnail;
        r28 = r4 ^ 1;
        r17 = r29;
        r4 = r1;
        r16 = r3;
        r25 = r2;
        r4.fillParameter(r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r18, r19, r20, r21, r22, r23, r24, r25, r26, r27, r28);
        r2 = r0.mIsParallelProcess;
        if (r2 == 0) goto L_0x00eb;
    L_0x00e8:
        r0.beginParallelProcess(r1);
    L_0x00eb:
        return r1;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.module.Camera2Module.onCaptureStart(long, int, java.lang.String):com.xiaomi.camera.core.ParallelTaskData");
    }

    private void onShutter() {
        if (getCameraState() != 0) {
            this.mShutterCallbackTime = System.currentTimeMillis();
            this.mShutterLag = this.mShutterCallbackTime - this.mCaptureStartTime;
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("mShutterLag = ");
            stringBuilder.append(this.mShutterLag);
            stringBuilder.append("ms");
            Log.v(str, stringBuilder.toString());
            if (this.mReceivedJpegCallbackNum == 0) {
                if (enablePreviewAsThumbnail()) {
                    this.mEnabledPreviewThumbnail = true;
                    this.mActivity.getCameraScreenNail().requestReadPixels();
                } else if (this.mModuleIndex != 173) {
                    updateThumbProgress(false);
                    animateCapture();
                    playSound(0);
                }
            }
        }
    }

    public boolean onPictureTakenImageConsumed(Image image) {
        return false;
    }

    public void onPictureTaken(byte[] bArr) {
    }

    public void onPictureTakenFinished(boolean z) {
        if (z) {
            trackGeneralInfo(1, false);
            trackPictureTaken(1, false, this.mLocation != null, getCurrentAiSceneName());
            long currentTimeMillis = System.currentTimeMillis() - this.mCaptureStartTime;
            CameraStatUtil.trackTakePictureCost(currentTimeMillis, isFrontCamera(), this.mModuleIndex);
            ScenarioTrackUtil.trackCaptureTimeEnd();
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("mCaptureStartTime(from onShutterButtonClick start to jpegCallback finished) = ");
            stringBuilder.append(currentTimeMillis);
            stringBuilder.append("ms");
            Log.d(str, stringBuilder.toString());
            if (this.mIsImageCaptureIntent) {
                if (this.mQuickCapture) {
                    doAttach();
                } else if (isAlive()) {
                    this.mKeepBitmapTexture = true;
                    showPostCaptureAlert();
                }
            } else if (this.mLongPressedAutoFocus) {
                this.mLongPressedAutoFocus = false;
                this.mFocusManager.cancelLongPressedAutoFocus();
            }
        }
        if (!isKeptBitmapTexture()) {
            setCameraState(1);
            enableCameraControls(true);
        }
        this.mHandler.removeMessages(50);
        if (this.mModuleIndex == 173) {
            String str2 = TAG;
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("onPictureTakenFinished: succeed = ");
            stringBuilder2.append(z);
            Log.d(str2, stringBuilder2.toString());
            if (!(this.mSuperNightDisposable == null || this.mSuperNightDisposable.isDisposed())) {
                this.mSuperNightDisposable.dispose();
            }
            this.mHandler.post(new Runnable() {
                public void run() {
                    ((ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162)).processingFinish();
                }
            });
        }
        doLaterReleaseIfNeed();
    }

    private boolean isFrontMirror() {
        if (!isFrontCamera()) {
            return false;
        }
        if (CameraSettings.isLiveShotOn()) {
            return true;
        }
        return CameraSettings.isFrontMirror();
    }

    private void showPostCaptureAlert() {
        enableCameraControls(false);
        this.mFocusManager.removeMessages();
        stopFaceDetection(true);
        pausePreview();
        this.mMainProtocol.setEffectViewVisible(false);
        ((BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160)).delegateEvent(6);
        resetMetaDataManager();
    }

    private void hidePostCaptureAlert() {
        enableCameraControls(true);
        if (this.mCamera2Device.isSessionReady()) {
            resumePreview();
        } else {
            startPreview();
        }
        this.mMainProtocol.setEffectViewVisible(true);
        ((BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160)).delegateEvent(6);
    }

    private void doAttach() {
        Throwable th;
        if (!this.mPaused) {
            byte[] storedJpegData = this.mActivity.getImageSaver().getStoredJpegData();
            if (this.mIsSaveCaptureImage) {
                this.mActivity.getImageSaver().saveStoredData();
            }
            Closeable closeable = null;
            if (this.mCropValue != null) {
                try {
                    File fileStreamPath = this.mActivity.getFileStreamPath(sTempCropFilename);
                    fileStreamPath.delete();
                    FileOutputStream openFileOutput = this.mActivity.openFileOutput(sTempCropFilename, 0);
                    try {
                        openFileOutput.write(storedJpegData);
                        openFileOutput.close();
                        Uri fromFile = Uri.fromFile(fileStreamPath);
                        Util.closeSilently(null);
                        Bundle bundle = new Bundle();
                        if (ComponentRunningTiltValue.TILT_CIRCLE.equals(this.mCropValue)) {
                            bundle.putString("circleCrop", "true");
                        }
                        if (this.mSaveUri != null) {
                            bundle.putParcelable("output", this.mSaveUri);
                        } else {
                            bundle.putBoolean("return-data", true);
                        }
                        Intent intent = new Intent("com.android.camera.action.CROP");
                        intent.setData(fromFile);
                        intent.putExtras(bundle);
                        this.mActivity.startActivityForResult(intent, 1000);
                    } catch (FileNotFoundException e) {
                        closeable = openFileOutput;
                    } catch (IOException e2) {
                        closeable = openFileOutput;
                        try {
                            this.mActivity.setResult(0);
                            this.mActivity.finish();
                            Util.closeSilently(closeable);
                        } catch (Throwable th2) {
                            th = th2;
                            Util.closeSilently(closeable);
                            throw th;
                        }
                    } catch (Throwable th3) {
                        th = th3;
                        closeable = openFileOutput;
                        Util.closeSilently(closeable);
                        throw th;
                    }
                } catch (FileNotFoundException e3) {
                    this.mActivity.setResult(0);
                    this.mActivity.finish();
                    Util.closeSilently(closeable);
                } catch (IOException e4) {
                    this.mActivity.setResult(0);
                    this.mActivity.finish();
                    Util.closeSilently(closeable);
                }
            } else if (this.mSaveUri != null) {
                try {
                    Closeable openOutputStream = this.mContentResolver.openOutputStream(this.mSaveUri);
                    try {
                        openOutputStream.write(storedJpegData);
                        openOutputStream.close();
                        this.mActivity.setResult(-1);
                        this.mActivity.finish();
                        Util.closeSilently(openOutputStream);
                    } catch (Exception e5) {
                        th = e5;
                        closeable = openOutputStream;
                        try {
                            Log.e(TAG, "Exception when doAttach: ", th);
                            this.mActivity.finish();
                            Util.closeSilently(closeable);
                        } catch (Throwable th4) {
                            th = th4;
                            this.mActivity.finish();
                            Util.closeSilently(closeable);
                            throw th;
                        }
                    } catch (Throwable th5) {
                        th = th5;
                        closeable = openOutputStream;
                        this.mActivity.finish();
                        Util.closeSilently(closeable);
                        throw th;
                    }
                } catch (Exception e6) {
                    th = e6;
                    Log.e(TAG, "Exception when doAttach: ", th);
                    this.mActivity.finish();
                    Util.closeSilently(closeable);
                }
            } else {
                this.mActivity.setResult(-1, new Intent("inline-data").putExtra(PhotosOemApi.PATH_SPECIAL_TYPE_DATA, Util.rotate(Util.makeBitmap(storedJpegData, 51200), Exif.getOrientation(storedJpegData))));
                this.mActivity.finish();
            }
        }
    }

    protected void resetMetaDataManager() {
        CameraSettings.isSupportedMetadata();
    }

    protected void openSettingActivity() {
        Intent intent = new Intent();
        intent.setClass(this.mActivity, CameraPreferenceActivity.class);
        intent.putExtra(BasePreferenceActivity.FROM_WHERE, this.mModuleIndex);
        intent.putExtra(CameraPreferenceActivity.IS_IMAGE_CAPTURE_INTENT, this.mIsImageCaptureIntent);
        intent.putExtra(":miui:starting_window_label", getResources().getString(R.string.pref_camera_settings_category));
        if (this.mActivity.startFromKeyguard()) {
            intent.putExtra("StartActivityWhenLocked", true);
        }
        this.mActivity.startActivity(intent);
        this.mActivity.setJumpFlag(2);
        CameraStatUtil.trackGotoSettings(this.mModuleIndex);
    }

    protected void onCameraOpened() {
        super.onCameraOpened();
        initializeFocusManager();
        updatePreferenceTrampoline(UpdateConstant.CAMERA_TYPES_INIT);
        setPreviewFrameLayoutAspectRatio();
        if (this.mIsParallelProcess && isPortraitMode()) {
            Util.saveCameraCalibrationToFile(this.mCameraCapabilities.getCameraCalibrationData(), isFrontCamera());
        }
        if (!isKeptBitmapTexture()) {
            startPreview();
        }
        initMetaParser();
        if (b.gn()) {
            initAiSceneParser();
        }
        this.mOnResumeTime = SystemClock.uptimeMillis();
        this.mHandler.sendEmptyMessage(4);
        this.mHandler.sendEmptyMessage(31);
    }

    public void initializeCapabilities() {
        super.initializeCapabilities();
        this.mContinuousFocusSupported = Util.isSupported(4, this.mCameraCapabilities.getSupportedFocusModes());
        this.mMaxFaceCount = this.mCameraCapabilities.getMaxFaceCount();
    }

    private void setPreviewFrameLayoutAspectRatio() {
        if (this.mPreviewSize != null) {
            this.mMainProtocol.setPreviewAspectRatio(CameraSettings.getPreviewAspectRatio(this.mPreviewSize.width, this.mPreviewSize.height));
        }
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
                case 4:
                    updateScene();
                    break;
                case 5:
                    updateFace();
                    break;
                case 6:
                    updateWhiteBalance();
                    break;
                case 7:
                    updateJpegQuality();
                    break;
                case 8:
                    updateJpegThumbnailSize();
                    break;
                case 9:
                    updateAntiBanding(CameraSettings.getAntiBanding());
                    break;
                case 10:
                    updateFlashPreference();
                    break;
                case 11:
                    updateHDRPreference();
                    break;
                case 12:
                    setEvValue();
                    break;
                case 13:
                    updateBeauty();
                    updateEyeLight();
                    break;
                case 14:
                    updateFocusMode();
                    break;
                case 15:
                    updateISO();
                    break;
                case 16:
                    updateExposureTime();
                    break;
                case 19:
                    updateFpsRange();
                    break;
                case 20:
                    updateOIS();
                    break;
                case 21:
                    updateMute();
                    break;
                case 22:
                    updateZsl();
                    break;
                case 23:
                    updateQr();
                    break;
                case 24:
                    setZoomRatio(getZoomValue());
                    break;
                case 25:
                    focusCenter();
                    break;
                case 26:
                    updateContrast();
                    break;
                case 27:
                    updateSaturation();
                    break;
                case 28:
                    updateSharpness();
                    break;
                case 29:
                    updateExposureMeteringMode();
                    break;
                case 30:
                    updateSuperResolution();
                    break;
                case 34:
                    updateMfnr(CameraSettings.isMfnrSatEnable());
                    break;
                case 35:
                    updateDeviceOrientation();
                    break;
                case 36:
                    updateAiScene();
                    break;
                case 37:
                    updateBokeh();
                    break;
                case 38:
                    updateFaceAgeAnalyze();
                    break;
                case 39:
                    updateFaceScore();
                    break;
                case 40:
                    updateFrontMirror();
                    break;
                case 41:
                    updateOperatingMode();
                    break;
                case 42:
                    updateSwMfnr();
                    break;
                case 43:
                    updatePortraitLighting();
                    break;
                case 44:
                    updateShotDetermine();
                    break;
                case 45:
                    updateEyeLight();
                    break;
                case 46:
                    updateNormalWideLDC();
                    break;
                case 47:
                    updateUltraWideLDC();
                    break;
                case 48:
                    updateFNumber();
                    break;
                case 49:
                    updateLiveShot();
                    break;
                default:
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("no consumer for this updateType: ");
                    stringBuilder.append(i);
                    throw new RuntimeException(stringBuilder.toString());
            }
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:31:0x0066  */
    /* JADX WARNING: Removed duplicated region for block: B:31:0x0066  */
    private void updateShotDetermine() {
        /*
        r5 = this;
        r0 = r5.mIsImageCaptureIntent;
        r1 = 1;
        r2 = 0;
        if (r0 == 0) goto L_0x0009;
    L_0x0006:
        r0 = -2;
    L_0x0007:
        r2 = r0;
        goto L_0x005b;
    L_0x0009:
        r0 = com.android.camera.CameraSettings.isCameraParallelProcessEnable();
        r3 = r5.mModuleIndex;
        r4 = 163; // 0xa3 float:2.28E-43 double:8.05E-322;
        if (r3 == r4) goto L_0x0049;
    L_0x0013:
        r4 = 165; // 0xa5 float:2.31E-43 double:8.15E-322;
        if (r3 == r4) goto L_0x0049;
    L_0x0017:
        r4 = 171; // 0xab float:2.4E-43 double:8.45E-322;
        if (r3 == r4) goto L_0x001c;
    L_0x001b:
        return;
    L_0x001c:
        r3 = r5.isBackCamera();
        if (r3 == 0) goto L_0x0038;
    L_0x0022:
        r3 = com.mi.config.b.hv();
        if (r3 != 0) goto L_0x0035;
    L_0x0028:
        r3 = com.android.camera.data.DataRepository.dataItemFeature();
        r3 = r3.eX();
        if (r3 == 0) goto L_0x0033;
    L_0x0032:
        goto L_0x0035;
    L_0x0033:
        r3 = r2;
        goto L_0x0040;
        r3 = r1;
        goto L_0x0040;
    L_0x0038:
        r3 = com.android.camera.data.DataRepository.dataItemFeature();
        r3 = r3.eY();
    L_0x0040:
        if (r3 == 0) goto L_0x0048;
    L_0x0042:
        if (r0 == 0) goto L_0x0046;
    L_0x0044:
        r0 = 6;
        goto L_0x0007;
    L_0x0046:
        r0 = 2;
        goto L_0x0007;
    L_0x0048:
        goto L_0x005b;
    L_0x0049:
        r0 = com.android.camera.CameraSettings.isLiveShotOn();
        if (r0 == 0) goto L_0x0052;
        r2 = r1;
        goto L_0x005b;
    L_0x0052:
        r0 = com.android.camera.CameraSettings.isGroupShotOn();
        if (r0 == 0) goto L_0x0059;
    L_0x0058:
        goto L_0x005b;
    L_0x005b:
        r0 = r5.mCamera2Device;
        r0.setShotType(r2);
        r0 = com.xiaomi.camera.core.ShotConstant.isParallelEnabled(r2);
        if (r0 == 0) goto L_0x0068;
    L_0x0066:
        r5.mIsParallelProcess = r1;
    L_0x0068:
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.module.Camera2Module.updateShotDetermine():void");
    }

    private void updatePictureAndPreviewSize() {
        int i = this.mIsParallelProcess ? 35 : 256;
        CameraSize bestPictureSize = getBestPictureSize(this.mCameraCapabilities.getSupportedOutputSize(i));
        CameraSize optimalPreviewSize = Util.getOptimalPreviewSize(this.mModuleIndex, this.mBogusCameraId, this.mCameraCapabilities.getSupportedOutputSize(SurfaceTexture.class), (double) CameraSettings.getPreviewAspectRatio(bestPictureSize.width, bestPictureSize.height));
        this.mPictureSize = bestPictureSize;
        this.mPreviewSize = optimalPreviewSize;
        if (!optimalPreviewSize.equals(this.mCamera2Device.getPreviewSize())) {
            this.mCamera2Device.setPreviewSize(optimalPreviewSize);
        }
        this.mCamera2Device.setPreviewFormat(35);
        if (this.mIsParallelProcess) {
            int auxFrontCameraId = Camera2DataContainer.getInstance().getAuxFrontCameraId();
            if (auxFrontCameraId > 0) {
                CameraCapabilities capabilities = Camera2DataContainer.getInstance().getCapabilities(auxFrontCameraId);
                if (capabilities != null) {
                    this.mSubPictureSize = PictureSizeManager.getBestPictureSize(capabilities.getSupportedOutputSize(i));
                    String str = TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("subSize: ");
                    stringBuilder.append(this.mSubPictureSize == null ? TEDefine.FACE_BEAUTY_NULL : this.mSubPictureSize);
                    Log.d(str, stringBuilder.toString());
                }
            }
            this.mOutPutSize = PictureSizeManager.getBestPictureSize(this.mCameraCapabilities.getSupportedOutputSize(256));
        }
        Log.d(TAG, String.format(Locale.ENGLISH, "updateSize: %dx%d %dx%d", new Object[]{Integer.valueOf(bestPictureSize.width), Integer.valueOf(bestPictureSize.height), Integer.valueOf(this.mPreviewSize.width), Integer.valueOf(this.mPreviewSize.height)}));
        updateCameraScreenNailSize(this.mPreviewSize.width, this.mPreviewSize.height);
        checkDisplayOrientation();
        setVideoSize(this.mPreviewSize.width, this.mPreviewSize.height);
    }

    private void updateFilter() {
        setEffectFilter(CameraSettings.getShaderEffect());
    }

    private void setEffectFilter(int i) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("setEffectFilter: ");
        stringBuilder.append(i);
        Log.d(str, stringBuilder.toString());
        EffectController.getInstance().setEffect(i);
        if (this.mCircularMediaRecorder != null) {
            this.mCircularMediaRecorder.setFilterId(i);
        }
        if (EffectController.getInstance().hasEffect()) {
            prepareEffectProcessor(i);
        }
    }

    private void setAiSceneEffect(int i) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("setAiSceneEffect: ");
        stringBuilder.append(i);
        Log.d(str, stringBuilder.toString());
        if (DataRepository.dataItemFeature().ff() && CameraSettings.isBackCamera() && i == 25) {
            Log.d(TAG, "supportAi30: AI 3.0 back camera in HUMAN SCENE not apply filter!");
            return;
        }
        if (CameraSettings.isFrontCamera() || this.mModuleIndex == 171) {
            if (i != 0) {
                Log.d(TAG, "setAiSceneEffect: front camera or portrait mode nonsupport!");
                return;
            } else if (CameraSettings.getPortraitLightingPattern() != 0) {
                Log.d(TAG, "setAiSceneEffect: scene = 0 but portrait lighting is on...");
                return;
            }
        }
        ArrayList filterInfo = EffectController.getInstance().getFilterInfo(5);
        if (i < 0 || i > filterInfo.size()) {
            Log.e(TAG, "setAiSceneEffect: scene unknown!");
            return;
        }
        int shaderEffect = CameraSettings.getShaderEffect();
        if (FilterInfo.getCategory(shaderEffect) == 5 || shaderEffect == FilterInfo.FILTER_ID_NONE) {
            i = ((FilterInfo) filterInfo.get(i)).getId();
            EffectController.getInstance().setAiSceneEffect(i);
            this.mHasAiSceneFilterEffect = i != FilterInfo.FILTER_ID_NONE;
            if (EffectController.getInstance().hasEffect()) {
                prepareEffectProcessor(i);
            }
        }
    }

    private void setLightingEffect() {
        int shaderEffect = CameraSettings.getShaderEffect();
        if (FilterInfo.getCategory(shaderEffect) == 5 || shaderEffect == FilterInfo.FILTER_ID_NONE) {
            shaderEffect = CameraSettings.getPortraitLightingPattern();
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("setLightingEffect: ");
            stringBuilder.append(shaderEffect);
            Log.d(str, stringBuilder.toString());
            shaderEffect = ((FilterInfo) EffectController.getInstance().getFilterInfo(6).get(shaderEffect)).getId();
            EffectController.getInstance().setLightingEffect(shaderEffect);
            if (EffectController.getInstance().hasEffect()) {
                prepareEffectProcessor(shaderEffect);
            }
        }
    }

    private void prepareEffectProcessor(int i) {
        if (this.mEffectProcessor == null) {
            this.mEffectProcessor = new SnapshotEffectRender(this.mActivity, this.mIsImageCaptureIntent);
            this.mEffectProcessor.setImageSaver(this.mActivity.getImageSaver());
            this.mEffectProcessor.prepareEffectRender(i);
            this.mEffectProcessor.setQuality(BaseModule.getJpegQuality(this.mMultiSnapStatus));
        }
    }

    public void updateFlashPreference() {
        String componentValue = DataRepository.dataItemConfig().getComponentFlash().getComponentValue(this.mModuleIndex);
        String requestFlashMode = getRequestFlashMode();
        if (Util.parseInt(requestFlashMode, 0) != 0) {
            resetAiSceneInHdrOrFlashOn();
        }
        setFlashMode(requestFlashMode);
        if (!TextUtils.equals(componentValue, this.mLastFlashMode) && (Util.parseInt(componentValue, 0) == 103 || Util.parseInt(componentValue, 0) == 0)) {
            resetAsdSceneInHdrOrFlashChange();
        }
        this.mLastFlashMode = componentValue;
        stopObjectTracking(true);
    }

    public void updateHDRPreference() {
        ComponentConfigHdr componentHdr = DataRepository.dataItemConfig().getComponentHdr();
        if (!componentHdr.isEmpty()) {
            String componentValue = componentHdr.getComponentValue(this.mModuleIndex);
            if (this.mZoomValue > 1.0f && this.mMutexModePicker.isHdr() && "auto".equals(componentValue)) {
                onHDRSceneChanged(false);
            }
            updateHDR(componentValue);
            if ((!"off".equals(componentValue) || this.mAiSceneEnabled) && this.mZoomValue <= 1.0f) {
                resetAiSceneInHdrOrFlashOn();
                resetAsdSceneInHdrOrFlashChange();
                if ("auto".equals(componentValue)) {
                    this.mHdrCheckEnabled = true;
                } else {
                    this.mHdrCheckEnabled = false;
                }
                this.mCamera2Device.setHDRCheckerEnable(true);
            } else {
                this.mCamera2Device.setHDRCheckerEnable(false);
                this.mHdrCheckEnabled = false;
            }
        }
    }

    private void updateHDR(String str) {
        if ("auto".equals(str)) {
            this.isDetectedInHDR = false;
        }
        int mutexHdrMode = getMutexHdrMode(str);
        stopObjectTracking(true);
        if (mutexHdrMode != 0) {
            this.mMutexModePicker.setMutexMode(mutexHdrMode);
        } else if (this.mMutexModePicker.isHdr()) {
            resetMutexModeManually();
        }
        if (isFrontCamera() && this.mCameraCapabilities.isSupportedQcfa()) {
            updatePreferenceInWorkThread(41);
        }
    }

    private void updateOperatingMode() {
        String componentValue = DataRepository.dataItemConfig().getComponentHdr().getComponentValue(this.mModuleIndex);
        if (!BeautyParameters.isFaceBeautyOn()) {
            if ((this.mOperatingMode == 32773 && componentValue.equals("off")) || (this.mOperatingMode == 32775 && !componentValue.equals("off"))) {
                this.mHandler.sendEmptyMessage(44);
            }
        }
    }

    private void updatePortraitLighting() {
        String valueOf = String.valueOf(CameraSettings.getPortraitLightingPattern());
        this.mIsPortraitLightingOn = valueOf.equals("0") ^ 1;
        this.mCamera2Device.setPortraitLighting(Integer.parseInt(valueOf));
        setLightingEffect();
    }

    private void updateEyeLight() {
        if (isFrontCamera() && DataRepository.dataItemFeature().fq()) {
            String eyeLightType = isFaceBeautyOn(this.mBeautyValues) ? CameraSettings.getEyeLightType() : EyeLightConstant.OFF;
            final TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
            if (topAlert != null) {
                if (EyeLightConstant.OFF.equals(eyeLightType)) {
                    this.mHandler.post(new Runnable() {
                        public void run() {
                            topAlert.alertTopHint(8, 0);
                        }
                    });
                } else {
                    this.mHandler.post(new Runnable() {
                        public void run() {
                            topAlert.alertTopHint(0, R.string.eye_light);
                        }
                    });
                }
            }
            this.mCamera2Device.setEyeLight(Integer.parseInt(eyeLightType));
        }
    }

    private void updateFNumber() {
        this.mCamera2Device.setFNumber(CameraSettings.readFNumber());
    }

    private void updateFocusArea() {
        if (this.mActivity != null && !this.mActivity.isActivityPaused() && isAlive()) {
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
    }

    private void updateScene() {
        DataItemRunning dataItemRunning = DataRepository.dataItemRunning();
        if (this.mMutexModePicker.isSceneHdr()) {
            this.mSceneMode = CameraScene.HDR;
        } else if (dataItemRunning.isSwitchOn("pref_camera_scenemode_setting_key")) {
            this.mSceneMode = dataItemRunning.getComponentRunningSceneValue().getComponentValue(this.mModuleIndex);
        } else {
            this.mSceneMode = "0";
        }
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("sceneMode=");
        stringBuilder.append(this.mSceneMode);
        stringBuilder.append(" mutexMode=");
        stringBuilder.append(this.mMutexModePicker.getMutexMode());
        Log.d(str, stringBuilder.toString());
        if (!setSceneMode(this.mSceneMode)) {
            this.mSceneMode = "0";
        }
        this.mHandler.post(new Runnable() {
            public void run() {
                Camera2Module.this.updateSceneModeUI();
            }
        });
        if (!"0".equals(this.mSceneMode) && CameraScene.HDR.equals(this.mSceneMode)) {
        }
    }

    private void updateSceneModeUI() {
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        if (DataRepository.dataItemRunning().isSwitchOn("pref_camera_scenemode_setting_key")) {
            DataRepository.dataItemConfig().getComponentHdr().setComponentValue(163, "off");
            String flashModeByScene = CameraSettings.getFlashModeByScene(this.mSceneMode);
            if (topAlert != null) {
                topAlert.updateConfigItem(193, 194);
                topAlert.disableMenuItem(194);
                if (flashModeByScene != null) {
                    topAlert.disableMenuItem(193);
                } else {
                    topAlert.enableMenuItem(193);
                }
                topAlert.hideExtraMenu();
            }
        } else if (topAlert != null) {
            topAlert.enableMenuItem(new int[0]);
            topAlert.updateConfigItem(193, 194);
        }
        updatePreferenceInWorkThread(11, 10);
    }

    private void updateBeauty() {
        if (this.mModuleIndex == 163 || this.mModuleIndex == 165 || this.mModuleIndex == 171) {
            if (this.mBeautyValues == null) {
                this.mBeautyValues = new BeautyValues();
            }
            this.mBeautyValues.mBeautyLevel = CameraSettings.getFaceBeautyCloseValue();
            boolean isFaceExists = CameraSettings.isPortraitModeBackOn() ? CameraSettings.isCameraPortraitWithFaceBeauty() ? this.mMainProtocol.isFaceExists(1) : false : true;
            boolean isClosed = DataRepository.dataItemConfig().getComponentConfigBeauty().isClosed(this.mModuleIndex);
            if (isFaceExists && !isClosed) {
                CameraSettings.initBeautyValues(this.mBeautyValues, b.hp());
                if (this.mCurrentAiScene == 25 && BeautyConstant.LEVEL_CLOSE.equals(this.mBeautyValues.mBeautyLevel)) {
                    this.mBeautyValues.mBeautyLevel = BeautyConstant.LEVEL_LOW;
                    android.util.Log.d(TAG, String.format(Locale.ENGLISH, "Human scene mode detected, auto set beauty level from %s to %s", new Object[]{BeautyConstant.LEVEL_CLOSE, this.mBeautyValues.mBeautyLevel}));
                }
            }
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("updateBeauty(): ");
            stringBuilder.append(this.mBeautyValues);
            Log.d(str, stringBuilder.toString());
            this.mCamera2Device.setBeautyValues(this.mBeautyValues);
            updateFaceAgeAnalyze();
        }
    }

    private void updateFocusMode() {
        String focusMode = this.mFocusManager.setFocusMode(CameraSettings.getFocusMode());
        setFocusMode(focusMode);
        if (CameraSettings.isFocusModeSwitching() && isBackCamera()) {
            CameraSettings.setFocusModeSwitching(false);
            this.mFocusManager.resetFocusStateIfNeeded();
        }
        if (focusMode.equals("manual")) {
            this.mCamera2Device.setFocusDistance((this.mCameraCapabilities.getMinimumFocusDistance() * ((float) CameraSettings.getFocusPosition())) / 1000.0f);
        }
    }

    protected void focusCenter() {
    }

    private void updateFpsRange() {
        Range[] supportedFpsRange = this.mCameraCapabilities.getSupportedFpsRange();
        int i = 0;
        Range range = supportedFpsRange[0];
        int length = supportedFpsRange.length;
        while (i < length) {
            Range range2 = supportedFpsRange[i];
            if (((Integer) range.getUpper()).intValue() < ((Integer) range2.getUpper()).intValue() || (range.getUpper() == range2.getUpper() && ((Integer) range.getLower()).intValue() < ((Integer) range2.getLower()).intValue())) {
                range = range2;
            }
            i++;
        }
        if (b.qU && CameraSettings.isPortraitModeBackOn()) {
            this.mCamera2Device.setFpsRange(new Range(Integer.valueOf(30), Integer.valueOf(30)));
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:22:0x0058  */
    /* JADX WARNING: Removed duplicated region for block: B:32:0x0071  */
    /* JADX WARNING: Removed duplicated region for block: B:29:0x0067  */
    /* JADX WARNING: Removed duplicated region for block: B:22:0x0058  */
    /* JADX WARNING: Removed duplicated region for block: B:29:0x0067  */
    /* JADX WARNING: Removed duplicated region for block: B:32:0x0071  */
    private void updateFace() {
        /*
        r6 = this;
        r0 = r6.mMultiSnapStatus;
        r1 = 0;
        r2 = 1;
        if (r0 != 0) goto L_0x0051;
    L_0x0007:
        r0 = r6.mMutexModePicker;
        r0 = r0.isUbiFocus();
        if (r0 == 0) goto L_0x0010;
    L_0x000f:
        goto L_0x0051;
    L_0x0010:
        r0 = com.android.camera.CameraSettings.isMagicMirrorOn();
        if (r0 != 0) goto L_0x004d;
    L_0x0016:
        r0 = com.android.camera.CameraSettings.isPortraitModeBackOn();
        if (r0 != 0) goto L_0x004d;
    L_0x001c:
        r0 = com.android.camera.CameraSettings.isGroupShotOn();
        if (r0 != 0) goto L_0x004d;
    L_0x0022:
        r0 = com.android.camera.CameraSettings.showGenderAge();
        if (r0 == 0) goto L_0x0029;
    L_0x0028:
        goto L_0x004d;
    L_0x0029:
        r0 = com.android.camera.data.DataRepository.dataItemGlobal();
        r3 = "pref_camera_facedetection_key";
        r4 = r6.getResources();
        r5 = 2131689478; // 0x7f0f0006 float:1.9007973E38 double:1.0531945387E-314;
        r4 = r4.getBoolean(r5);
        r0 = r0.getBoolean(r3, r4);
        r3 = com.android.camera.CameraSettings.isGradienterOn();
        if (r3 != 0) goto L_0x004a;
    L_0x0044:
        r3 = com.android.camera.CameraSettings.isTiltShiftOn();
        if (r3 == 0) goto L_0x0053;
        r3 = r1;
        goto L_0x0054;
        r0 = r2;
        r3 = r0;
        goto L_0x0054;
        r0 = r1;
    L_0x0053:
        r3 = r2;
    L_0x0054:
        r4 = r6.mMainProtocol;
        if (r4 == 0) goto L_0x0065;
    L_0x0058:
        r4 = r6.mMainProtocol;
        if (r0 == 0) goto L_0x0061;
    L_0x005c:
        if (r3 != 0) goto L_0x005f;
    L_0x005e:
        goto L_0x0061;
    L_0x005f:
        r3 = r1;
        goto L_0x0062;
    L_0x0061:
        r3 = r2;
    L_0x0062:
        r4.setSkipDrawFace(r3);
    L_0x0065:
        if (r0 == 0) goto L_0x0071;
    L_0x0067:
        r0 = r6.mFaceDetectionEnabled;
        if (r0 != 0) goto L_0x007a;
    L_0x006b:
        r6.mFaceDetectionEnabled = r2;
        r6.startFaceDetection();
        goto L_0x007a;
    L_0x0071:
        r0 = r6.mFaceDetectionEnabled;
        if (r0 == 0) goto L_0x007a;
    L_0x0075:
        r6.stopFaceDetection(r2);
        r6.mFaceDetectionEnabled = r1;
    L_0x007a:
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.module.Camera2Module.updateFace():void");
    }

    private void updateJpegQuality() {
        this.mCamera2Device.setJpegQuality(BaseModule.getJpegQuality(this.mMultiSnapStatus));
    }

    private void updateOIS() {
        boolean z = isDualCamera() && this.mZoomValue > 1.0f;
        boolean isPortraitModeBackOn = CameraSettings.isPortraitModeBackOn();
        boolean z2 = this.mModuleIndex == 167 && Long.parseLong(getManualValue(CameraSettings.KEY_QC_EXPOSURETIME, getString(R.string.pref_camera_exposuretime_default))) > 1000000000;
        if (z || isPortraitModeBackOn || z2) {
            this.mCamera2Device.setEnableOIS(false);
        } else {
            this.mCamera2Device.setEnableOIS(true);
        }
    }

    private void updateMute() {
    }

    private void updateZsl() {
        this.mCamera2Device.setEnableZsl(this.mModuleIndex != 167);
    }

    private void updateMfnr(boolean z) {
        if (this.mModuleIndex == 167 || ((b.qT && !isDualCamera()) || !this.mMutexModePicker.isNormal() || !z || ((isFrontCamera() && !(b.hw() && this.mOperatingMode == 32773)) || !(DataRepository.dataItemFeature().eT() || this.mZoomValue == 1.0f || isUltraWideBackCamera())))) {
            z = false;
        } else {
            z = true;
        }
        if (isUseSwMfnr()) {
            z = false;
        }
        if (this.mCamera2Device != null) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("setMfnr to ");
            stringBuilder.append(z);
            Log.d(str, stringBuilder.toString());
            this.mCamera2Device.setMfnr(z);
        }
    }

    private boolean isUseSwMfnr() {
        boolean isMfnrSatEnable = CameraSettings.isMfnrSatEnable();
        boolean eV = DataRepository.dataItemFeature().eV();
        boolean z = false;
        if (CameraSettings.isGroupShotOn()) {
            Log.d(TAG, "GroupShot is on");
            return false;
        } else if (isUltraWideBackCamera()) {
            Log.d(TAG, "SwMfnr force off for ultra wide camera");
            return false;
        } else if (!isMfnrSatEnable) {
            Log.d(TAG, "Mfnr not enabled");
            return false;
        } else if (!eV) {
            Log.d(TAG, "SwMfnr is not supported");
            return false;
        } else if (!this.mMutexModePicker.isNormal()) {
            Log.d(TAG, "Mutex mode is not normal");
            return false;
        } else if (DataRepository.dataItemFeature().eW() && this.mModuleIndex != 167) {
            return true;
        } else {
            if (isFrontCamera() && !isDualFrontCamera() && b.hw() && (this.mOperatingMode == 32773 || Util.UI_DEBUG())) {
                z = true;
            }
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("isUseSwMfnr: supportSwMfnr = ");
            stringBuilder.append(eV);
            stringBuilder.append(", isFrontCamera = ");
            stringBuilder.append(isFrontCamera());
            stringBuilder.append(", isMfnrEnabled = ");
            stringBuilder.append(isMfnrSatEnable);
            stringBuilder.append(", result = ");
            stringBuilder.append(z);
            Log.d(str, stringBuilder.toString());
            return z;
        }
    }

    private void updateSwMfnr() {
        boolean isUseSwMfnr = isUseSwMfnr();
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("setSwMfnr to ");
        stringBuilder.append(isUseSwMfnr);
        Log.d(str, stringBuilder.toString());
        this.mCamera2Device.setSwMfnr(isUseSwMfnr);
    }

    private void updateSuperResolution() {
        if (!isFrontCamera()) {
            if (isUltraWideBackCamera()) {
                Log.d(TAG, "SR force off for ultra wide camera");
            } else if (CameraSettings.isSREnable()) {
                if (this.mZoomValue == 1.0f) {
                    if (!DataRepository.dataItemRunning().isSwitchOn("pref_camera_super_resolution_key")) {
                        if (this.mMutexModePicker.isSuperResolution()) {
                            this.mMutexModePicker.resetMutexMode();
                        } else if (this.mCamera2Device != null) {
                            this.mCamera2Device.setSuperResolution(false);
                        }
                    }
                } else if (this.mMutexModePicker.isNormal()) {
                    this.mMutexModePicker.setMutexMode(10);
                }
            }
        }
    }

    private void updateWhiteBalance() {
        setAWBMode(getManualValue(CameraSettings.KEY_WHITE_BALANCE, "1"));
    }

    private void updateISO() {
        String string = getString(R.string.pref_camera_iso_default);
        String manualValue = getManualValue(CameraSettings.KEY_QC_ISO, string);
        if (manualValue == null || manualValue.equals(string)) {
            this.mCamera2Device.setISO(0);
        } else {
            this.mCamera2Device.setISO(Math.min(Util.parseInt(manualValue, 0), this.mCameraCapabilities.getMaxIso()));
        }
        updateManualEvAdjust();
    }

    private void updateExposureTime() {
        this.mCamera2Device.setExposureTime(Long.parseLong(getManualValue(CameraSettings.KEY_QC_EXPOSURETIME, getString(R.string.pref_camera_exposuretime_default))));
        updateManualEvAdjust();
    }

    public void updateManualEvAdjust() {
        if (this.mModuleIndex == 167) {
            boolean equals;
            String manualValue = getManualValue(CameraSettings.KEY_QC_EXPOSURETIME, getString(R.string.pref_camera_exposuretime_default));
            String manualValue2 = getManualValue(CameraSettings.KEY_QC_ISO, getString(R.string.pref_camera_iso_default));
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("MODE_MANUAL: exposureTime = ");
            stringBuilder.append(manualValue);
            stringBuilder.append("iso = ");
            stringBuilder.append(manualValue2);
            Log.d(str, stringBuilder.toString());
            if (b.hD()) {
                equals = getString(R.string.pref_camera_exposuretime_default).equals(manualValue);
            } else if (getString(R.string.pref_camera_iso_default).equals(manualValue2) || getString(R.string.pref_camera_exposuretime_default).equals(manualValue)) {
                equals = true;
            } else {
                equals = false;
            }
            if (this.mHandler != null) {
                this.mHandler.post(new Runnable() {
                    public void run() {
                        Camera2Module.this.mMainProtocol.setEvAdjustable(equals);
                    }
                });
            }
            if (1 != this.mCamera2Device.getFocusMode() || !this.m3ALocked) {
                return;
            }
            if (!getString(R.string.pref_camera_exposuretime_default).equals(manualValue) || !getString(R.string.pref_camera_iso_default).equals(manualValue2)) {
                this.mActivity.runOnUiThread(new Runnable() {
                    public void run() {
                        Camera2Module.this.mFocusManager.cancelFocus();
                    }
                });
                unlockAEAF();
            }
        }
    }

    private void updateNormalWideLDC() {
        this.mCamera2Device.setNormalWideLDC(shouldApplyNormalWideLDC());
    }

    private boolean shouldApplyNormalWideLDC() {
        if ((this.mModuleIndex == 163 || this.mModuleIndex == 165 || this.mModuleIndex == 167) && this.mActualCameraId != Camera2DataContainer.getInstance().getUltraWideCameraId()) {
            return CameraSettings.isNormalWideLDCEnabled();
        }
        return false;
    }

    private void updateUltraWideLDC() {
        this.mCamera2Device.setUltraWideLDC(shouldApplyUltraWideLDC());
    }

    private boolean shouldApplyUltraWideLDC() {
        if ((this.mModuleIndex == 163 || this.mModuleIndex == 165 || this.mModuleIndex == 167) && this.mActualCameraId == Camera2DataContainer.getInstance().getUltraWideCameraId()) {
            return CameraSettings.isUltraWideLDCEnabled();
        }
        return false;
    }

    private void updateContrast() {
        this.mCamera2Device.setContrast(Integer.parseInt(CameraSettings.getContrast()));
    }

    private void updateSaturation() {
        this.mCamera2Device.setSaturation(Integer.parseInt(CameraSettings.getSaturation()));
    }

    private void updateSharpness() {
        this.mCamera2Device.setSharpness(Integer.parseInt(CameraSettings.getSharpness()));
    }

    private void updateQr() {
        if (scanQRCodeEnabled()) {
            QRCodeManager.getInstance().setPreviewSize(this.mPreviewSize.width, this.mPreviewSize.height);
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("updateQr: QRCodeManager mPreviewSize = ");
            stringBuilder.append(this.mPreviewSize);
            Log.d(str, stringBuilder.toString());
            this.mCamera2Device.startPreviewCallback(QRCodeManager.getInstance().getPreviewCallback());
            QRCodeManager.getInstance().startDecode();
        }
    }

    private void updateJpegThumbnailSize() {
        CameraSize jpegThumbnailSize = getJpegThumbnailSize();
        this.mCamera2Device.setJpegThumbnailSize(jpegThumbnailSize);
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("thumbnailSize=");
        stringBuilder.append(jpegThumbnailSize);
        Log.d(str, stringBuilder.toString());
    }

    private void updateDeviceOrientation() {
        this.mCamera2Device.setDeviceOrientation(this.mOrientation);
    }

    private boolean setSceneMode(String str) {
        int parseInt = Util.parseInt(str, -1);
        if (!Util.isSupported(parseInt, this.mCameraCapabilities.getSupportedSceneModes())) {
            return false;
        }
        String str2 = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("sceneMode=");
        stringBuilder.append(str);
        Log.d(str2, stringBuilder.toString());
        this.mCamera2Device.setSceneMode(parseInt);
        return true;
    }

    private String getSuffix() {
        if (this.mMutexModePicker.isNormal()) {
            return "";
        }
        return this.mMutexModePicker.getSuffix();
    }

    private String getRequestFlashMode() {
        if (isSupportSceneMode()) {
            Object flashModeByScene = CameraSettings.getFlashModeByScene(this.mSceneMode);
            if (!TextUtils.isEmpty(flashModeByScene)) {
                return flashModeByScene;
            }
        }
        if (!this.mMutexModePicker.isSupportedFlashOn() && !this.mMutexModePicker.isSupportedTorch()) {
            return "0";
        }
        String componentValue = DataRepository.dataItemConfig().getComponentFlash().getComponentValue(this.mModuleIndex);
        if (this.mCurrentAsdScene == 9) {
            if (componentValue.equals("3")) {
                return "2";
            }
            if (componentValue.equals(ComponentConfigFlash.FLASH_VALUE_SCREEN_LIGHT_AUTO)) {
                return ComponentConfigFlash.FLASH_VALUE_SCREEN_LIGHT_ON;
            }
        }
        return componentValue;
    }

    protected boolean isSupportSceneMode() {
        return false;
    }

    protected CameraSize getBestPictureSize(List<CameraSize> list) {
        PictureSizeManager.initialize(list, getMaxPictureSize());
        return PictureSizeManager.getBestPictureSize();
    }

    protected int getMaxPictureSize() {
        return 0;
    }

    private void setPictureOrientation() {
        this.mShootRotation = this.mActivity.getSensorStateManager().isDeviceLying() ? -1.0f : this.mDeviceRotation;
        this.mShootOrientation = this.mOrientation == -1 ? 0 : this.mOrientation;
    }

    private void setWaterMark() {
        if (this.mMultiSnapStatus || this.mModuleIndex == 165 || CameraSettings.isGradienterOn() || CameraSettings.getShaderEffect() != FilterInfo.FILTER_ID_NONE || this.mHasAiSceneFilterEffect || CameraSettings.isTiltShiftOn() || DataRepository.dataItemFeature().fc()) {
            this.mCamera2Device.setDualCamWaterMarkEnable(false);
            this.mCamera2Device.setTimeWaterMarkEnable(false);
            return;
        }
        if (CameraSettings.isDualCameraWaterMarkOpen()) {
            this.mCamera2Device.setDualCamWaterMarkEnable(true);
        } else {
            this.mCamera2Device.setDualCamWaterMarkEnable(false);
        }
        if (CameraSettings.isTimeWaterMarkOpen()) {
            this.mCamera2Device.setTimeWaterMarkEnable(true);
            this.mCaptureWaterMarkStr = Util.getTimeWatermark();
            this.mCamera2Device.setTimeWatermarkValue(this.mCaptureWaterMarkStr);
        } else {
            this.mCaptureWaterMarkStr = null;
            this.mCamera2Device.setTimeWaterMarkEnable(false);
        }
    }

    public void onOrientationChanged(int i, int i2) {
        if (!this.mIsGradienterOn) {
            setOrientation(i, i2);
        }
    }

    private void setOrientation(int i, int i2) {
        if (i != -1) {
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
        if (!isDeparted()) {
            if (!(this.mCamera2Device == null || this.mOrientation == -1)) {
                if (getCameraState() == 1) {
                    updatePreferenceInWorkThread(35);
                } else {
                    this.mCamera2Device.setDeviceOrientation(this.mOrientation);
                }
            }
            if (this.mCircularMediaRecorder != null) {
                this.mCircularMediaRecorder.setOrientationHint(this.mOrientationCompensation);
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

    /* JADX WARNING: Missing block: B:46:0x00f7, code:
            return;
     */
    public void onSingleTapUp(int r4, int r5) {
        /*
        r3 = this;
        r0 = TAG;
        r1 = new java.lang.StringBuilder;
        r1.<init>();
        r2 = "onSingleTapUp mPaused: ";
        r1.append(r2);
        r2 = r3.mPaused;
        r1.append(r2);
        r2 = "; mCamera2Device: ";
        r1.append(r2);
        r2 = r3.mCamera2Device;
        r1.append(r2);
        r2 = "; isInCountDown: ";
        r1.append(r2);
        r2 = r3.isInCountDown();
        r1.append(r2);
        r2 = "; getCameraState: ";
        r1.append(r2);
        r2 = r3.getCameraState();
        r1.append(r2);
        r2 = "; mMultiSnapStatus: ";
        r1.append(r2);
        r2 = r3.mMultiSnapStatus;
        r1.append(r2);
        r2 = "; Camera2Module: ";
        r1.append(r2);
        r1.append(r3);
        r1 = r1.toString();
        com.android.camera.log.Log.v(r0, r1);
        r0 = r3.mPaused;
        if (r0 != 0) goto L_0x00f7;
    L_0x0050:
        r0 = r3.mCamera2Device;
        if (r0 == 0) goto L_0x00f7;
    L_0x0054:
        r0 = r3.mCamera2Device;
        r0 = r0.isSessionReady();
        if (r0 == 0) goto L_0x00f7;
    L_0x005c:
        r0 = r3.isInTapableRect(r4, r5);
        if (r0 == 0) goto L_0x00f7;
    L_0x0062:
        r0 = r3.getCameraState();
        r1 = 3;
        if (r0 == r1) goto L_0x00f7;
    L_0x0069:
        r0 = r3.getCameraState();
        r1 = 4;
        if (r0 == r1) goto L_0x00f7;
    L_0x0070:
        r0 = r3.getCameraState();
        if (r0 == 0) goto L_0x00f7;
    L_0x0076:
        r0 = r3.isInCountDown();
        if (r0 != 0) goto L_0x00f7;
    L_0x007c:
        r0 = r3.mMultiSnapStatus;
        if (r0 == 0) goto L_0x0082;
    L_0x0080:
        goto L_0x00f7;
    L_0x0082:
        r0 = r3.isFrameAvailable();
        if (r0 != 0) goto L_0x0089;
    L_0x0088:
        return;
    L_0x0089:
        r0 = r3.isFrontCamera();
        if (r0 == 0) goto L_0x0098;
    L_0x008f:
        r0 = r3.mActivity;
        r0 = r0.isScreenSlideOff();
        if (r0 == 0) goto L_0x0098;
    L_0x0097:
        return;
    L_0x0098:
        r0 = com.android.camera.protocol.ModeCoordinatorImpl.getInstance();
        r1 = 171; // 0xab float:2.4E-43 double:8.45E-322;
        r0 = r0.getAttachProtocol(r1);
        r0 = (com.android.camera.protocol.ModeProtocol.BackStack) r0;
        r0 = r0.handleBackStackFromTapDown(r4, r5);
        if (r0 == 0) goto L_0x00ab;
    L_0x00aa:
        return;
    L_0x00ab:
        r3.tryRemoveCountDownMessage();
        r0 = r3.mFocusAreaSupported;
        if (r0 != 0) goto L_0x00b7;
    L_0x00b2:
        r0 = r3.mMeteringAreaSupported;
        if (r0 != 0) goto L_0x00b7;
    L_0x00b6:
        return;
    L_0x00b7:
        r0 = r3.mMutexModePicker;
        r0 = r0.isUbiFocus();
        if (r0 == 0) goto L_0x00c0;
    L_0x00bf:
        return;
    L_0x00c0:
        r0 = r3.mObjectTrackingStarted;
        r1 = 1;
        if (r0 == 0) goto L_0x00c8;
    L_0x00c5:
        r3.stopObjectTracking(r1);
    L_0x00c8:
        r0 = r3.mMainProtocol;
        r0.setFocusViewType(r1);
        r0 = new android.graphics.Point;
        r0.<init>(r4, r5);
        r3.mapTapCoordinate(r0);
        r3.unlockAEAF();
        r4 = 2;
        r3.setCameraState(r4);
        r4 = r3.mFocusManager;
        r5 = r0.x;
        r0 = r0.y;
        r4.onSingleTapUp(r5, r0);
        r4 = r3.mFocusAreaSupported;
        if (r4 != 0) goto L_0x00f6;
    L_0x00e9:
        r4 = r3.mMeteringAreaSupported;
        if (r4 == 0) goto L_0x00f6;
    L_0x00ed:
        r4 = r3.mActivity;
        r4 = r4.getSensorStateManager();
        r4.reset();
    L_0x00f6:
        return;
    L_0x00f7:
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.module.Camera2Module.onSingleTapUp(int, int):void");
    }

    private void unlockAEAF() {
        Log.d(TAG, "unlockAEAF");
        this.m3ALocked = false;
        if (this.mAeLockSupported) {
            this.mCamera2Device.lockExposure(false);
        }
        if (this.mFocusManager != null) {
            this.mFocusManager.setAeAwbLock(false);
        }
    }

    private void lockAEAF() {
        Log.d(TAG, "lockAEAF");
        if (this.mFocusManager != null) {
            this.mFocusManager.setAeAwbLock(true);
        }
        this.m3ALocked = true;
    }

    private boolean is3ALocked() {
        return this.m3ALocked;
    }

    public void onGradienterSwitched(boolean z) {
        this.mIsGradienterOn = z;
        this.mActivity.getSensorStateManager().setGradienterEnabled(z);
        updatePreferenceTrampoline(2, 5);
    }

    public void onTiltShiftSwitched(boolean z) {
        if (z) {
            resetEvValue();
        }
        this.mMainProtocol.initEffectCropView();
        updatePreferenceTrampoline(2, 5);
        this.mMainProtocol.updateEffectViewVisible();
        this.mMainProtocol.setEvAdjustable(z ^ 1);
    }

    public boolean onKeyDown(int i, KeyEvent keyEvent) {
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
                    if (!Util.isFingerPrintKeyEvent(keyEvent)) {
                        onShutterButtonClick(40);
                    } else if (CameraSettings.isFingerprintCaptureEnable()) {
                        onShutterButtonClick(30);
                    }
                }
                return true;
            case 80:
                if (keyEvent.getRepeatCount() == 0) {
                    onShutterButtonFocus(true, 1);
                }
                return true;
        }
        return super.onKeyDown(i, keyEvent);
    }

    public boolean onKeyUp(int i, KeyEvent keyEvent) {
        switch (i) {
            case 4:
                if (((BackStack) ModeCoordinatorImpl.getInstance().getAttachProtocol(171)).handleBackStackFromKeyBack()) {
                    return true;
                }
                break;
            case 24:
            case 25:
            case 87:
            case 88:
                boolean z = i == 24 || i == 88;
                if (handleVolumeKeyEvent(z, false, keyEvent.getRepeatCount())) {
                    return true;
                }
                break;
        }
        return super.onKeyUp(i, keyEvent);
    }

    protected void performVolumeKeyClicked(String str, int i, boolean z) {
        if (!this.mPaused && getCameraState() != 0) {
            if (!isDoingAction()) {
                restoreBottom();
            }
            if (i == 0) {
                if (z) {
                    onShutterButtonFocus(true, 1);
                    if (str.equals(getString(R.string.pref_camera_volumekey_function_entryvalue_timer))) {
                        startCount(2, 20);
                    } else {
                        onShutterButtonClick(20);
                    }
                } else {
                    onShutterButtonFocus(false, 0);
                    if (this.mVolumeLongPress) {
                        this.mVolumeLongPress = false;
                        onShutterButtonLongClickCancel(false);
                    }
                }
            } else if (z && !this.mVolumeLongPress) {
                this.mUpdateImageTitle = true;
                this.mVolumeLongPress = onShutterButtonLongClick();
                if (!this.mVolumeLongPress && this.mLongPressedAutoFocus) {
                    this.mVolumeLongPress = true;
                }
            }
        }
    }

    protected boolean isZoomEnabled() {
        return (getCameraState() == 3 || this.mMutexModePicker.isUbiFocus() || CameraSettings.isStereoModeOn() || CameraSettings.isPortraitModeBackOn() || isFrontCamera()) ? false : true;
    }

    private String getManualValue(String str, String str2) {
        CameraSettingPreferences instance = CameraSettingPreferences.instance();
        if (ModuleManager.isManualModule()) {
            return instance.getString(str, str2);
        }
        return str2;
    }

    private void resetGradienter() {
        if (CameraSettings.isGradienterOn()) {
            this.mActivity.getSensorStateManager().setGradienterEnabled(false);
        }
    }

    private void resetScreenOn() {
        if (this.mHandler != null) {
            this.mHandler.removeMessages(17);
            this.mHandler.removeMessages(2);
        }
    }

    private void keepScreenOnAwhile() {
        this.mHandler.sendEmptyMessageDelayed(17, 1000);
    }

    public void onUserInteraction() {
        super.onUserInteraction();
        if (!isDoingAction()) {
            keepScreenOnAwhile();
        }
    }

    private void releaseEffectProcessor() {
        if (this.mEffectProcessor != null) {
            this.mEffectProcessor.releaseIfNeeded();
            this.mEffectProcessor = null;
        }
    }

    protected boolean isDetectedHHT() {
        return false;
    }

    protected int getMutexHdrMode(String str) {
        if ("normal".equals(str)) {
            int i;
            if (!b.fZ() || b.gl()) {
                i = 1;
            } else {
                i = 5;
            }
            return i;
        } else if (b.gd() && ComponentConfigHdr.HDR_VALUE_LIVE.equals(str)) {
            return 2;
        } else {
            return 0;
        }
    }

    public boolean isShowCaptureButton() {
        return !this.mMutexModePicker.isBurstShoot() && isSupportFocusShoot();
    }

    public boolean isShowAeAfLockIndicator() {
        return this.m3ALocked;
    }

    public boolean isSupportFocusShoot() {
        return DataRepository.dataItemGlobal().isGlobalSwitchOn("pref_camera_focus_shoot_key");
    }

    public boolean isMeteringAreaOnly() {
        boolean z = false;
        if (this.mCamera2Device == null) {
            return false;
        }
        int focusMode = this.mCamera2Device.getFocusMode();
        if ((!this.mFocusAreaSupported && this.mMeteringAreaSupported) || 5 == focusMode || focusMode == 0) {
            z = true;
        }
        return z;
    }

    public void enterMutexMode(int i) {
        if (this.mCamera2Device == null) {
            Log.d(TAG, "enterMutexMode error, mCamera2Device is null");
            return;
        }
        if (i == 1) {
            this.mCamera2Device.setHDR(true);
        } else if (i == 3) {
            this.mCamera2Device.setHHT(true);
        } else if (i == 10) {
            this.mCamera2Device.setSuperResolution(true);
        }
        updateMfnr(CameraSettings.isMfnrSatEnable());
        updateSwMfnr();
    }

    public void exitMutexMode(int i) {
        if (i == 1) {
            this.mCamera2Device.setHDR(false);
            updateSuperResolution();
        } else if (i == 3) {
            this.mCamera2Device.setHHT(false);
        } else if (i == 10) {
            this.mCamera2Device.setSuperResolution(false);
        }
        updateMfnr(CameraSettings.isMfnrSatEnable());
        updateSwMfnr();
    }

    private boolean needShowThumbProgressImmediately() {
        return Long.parseLong(getManualValue(CameraSettings.KEY_QC_EXPOSURETIME, getString(R.string.pref_camera_exposuretime_default))) > 250000000 && this.mModuleIndex != 173;
    }

    private void updateThumbProgress(boolean z) {
        ActionProcessing actionProcessing = (ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162);
        if (actionProcessing != null) {
            actionProcessing.updateLoading(z);
        }
    }

    public void startAiLens() {
        this.mHandler.postDelayed(new Runnable() {
            public void run() {
                Camera2Module.this.startLensActivity();
            }
        }, 300);
    }

    private void startLensActivity() {
        if (!Util.isGlobalVersion()) {
            Log.d(TAG, "start ai lens");
            try {
                Intent intent = new Intent();
                intent.setAction("android.media.action.XIAOAI_CONTROL");
                intent.setPackage(CameraSettings.AI_LENS_PACKAGE);
                intent.putExtra("preview_width", this.mPreviewSize.width);
                intent.putExtra("preview_height", this.mPreviewSize.height);
                getActivity().startActivity(intent);
                getActivity().overridePendingTransition(R.anim.anim_fade_in, R.anim.anim_fade_out);
            } catch (Throwable e) {
                Log.e(TAG, "onClick: occur a exception", e);
            }
        } else if (this.mLensApi != null && this.mLensStatus == 0) {
            this.mLensApi.launchLensActivity(this.mActivity, 0);
        }
    }

    public void showQRCodeResult() {
        if (!this.mPaused) {
            String scanResult = QRCodeManager.getInstance().getScanResult();
            if (scanResult == null || scanResult.isEmpty()) {
                Log.e(TAG, "showQRCodeResult: get a null result!");
                return;
            }
            ActivityBase activityBase = this.mActivity;
            activityBase.dismissKeyguard();
            Intent intent = new Intent(Util.QRCODE_RECEIVER_ACTION);
            intent.addFlags(32);
            intent.setPackage("com.xiaomi.scanner");
            intent.putExtra("result", scanResult);
            activityBase.sendBroadcast(intent);
            activityBase.setJumpFlag(3);
        }
    }

    protected void sendOpenFailMessage() {
        this.mHandler.sendEmptyMessage(10);
    }

    public void onCameraMetaData(CaptureResult captureResult) {
        if (captureResult != null) {
            super.onCameraMetaData(captureResult);
            if (this.mMetaDataFlowableEmitter != null) {
                this.mMetaDataFlowableEmitter.onNext(captureResult);
            }
            if (!(this.mAiSceneFlowableEmitter == null || !this.mAiSceneEnabled || this.mCamera2Device == null)) {
                this.mAiSceneFlowableEmitter.onNext(captureResult);
            }
        }
    }

    private void initMetaParser() {
        this.mMetaDataDisposable = Flowable.create(new FlowableOnSubscribe<CaptureResult>() {
            public void subscribe(FlowableEmitter<CaptureResult> flowableEmitter) throws Exception {
                Camera2Module.this.mMetaDataFlowableEmitter = flowableEmitter;
            }
        }, BackpressureStrategy.DROP).observeOn(GlobalConstant.sCameraSetupScheduler).map(new FunctionParseAsdFace(this, isFrontCamera())).map(new FunctionParseAsdHdr(this)).map(new FunctionParseAsdUltraWide(this)).sample(500, TimeUnit.MILLISECONDS).observeOn(GlobalConstant.sCameraSetupScheduler).map(new FunctionParseAsdScene(this)).observeOn(AndroidSchedulers.mainThread()).onTerminateDetach().subscribe(new Consumer<Integer>() {
            public void accept(Integer num) {
                Camera2Module.this.consumeAsdSceneResult(num.intValue());
            }
        });
    }

    private void consumeAsdSceneResult(int i) {
        if (this.mCurrentAsdScene != i && !isDoingAction() && isAlive() && !this.mActivity.isActivityPaused()) {
            exitAsdScene(this.mCurrentAsdScene);
            enterAsdScene(i);
            this.mCurrentAsdScene = i;
        }
    }

    private void exitAsdScene(int i) {
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        if (i == 0) {
            String componentValue = DataRepository.dataItemConfig().getComponentFlash().getComponentValue(this.mModuleIndex);
            if (!"1".equals(componentValue) && !ComponentConfigFlash.FLASH_VALUE_SCREEN_LIGHT_ON.equals(componentValue)) {
                topAlert.alertFlash(8, false, false);
            }
        } else if (i != 9) {
            switch (i) {
                case 4:
                case 5:
                case 6:
                    if (!this.m3ALocked) {
                        hideTipMessage(0);
                        return;
                    }
                    return;
                case 7:
                    if (!this.m3ALocked) {
                        setPortraitSuccessHintVisible(8);
                        return;
                    }
                    return;
                default:
                    return;
            }
        } else {
            if (ComponentConfigFlash.FLASH_VALUE_SCREEN_LIGHT_AUTO.equals(DataRepository.dataItemConfig().getComponentFlash().getComponentValue(this.mModuleIndex))) {
                topAlert.alertFlash(8, false, false);
            }
            updatePreferenceInWorkThread(10);
        }
    }

    private void enterAsdScene(int i) {
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        if (i == 0) {
            topAlert.alertFlash(0, false, false);
        } else if (i != 9) {
            switch (i) {
                case 4:
                    if (!this.m3ALocked) {
                        updateTipMessage(6, R.string.portrait_mode_too_close_hint, 4);
                        return;
                    }
                    return;
                case 5:
                    if (!this.m3ALocked) {
                        updateTipMessage(6, R.string.portrait_mode_too_far_hint, 4);
                        return;
                    }
                    return;
                case 6:
                    if (!this.m3ALocked) {
                        updateTipMessage(6, R.string.portrait_mode_lowlight_hint, 4);
                        return;
                    }
                    return;
                case 7:
                    if (!this.m3ALocked) {
                        setPortraitSuccessHintVisible(0);
                        return;
                    }
                    return;
                default:
                    return;
            }
        } else {
            String componentValue = DataRepository.dataItemConfig().getComponentFlash().getComponentValue(this.mModuleIndex);
            if ("3".equals(componentValue)) {
                updatePreferenceInWorkThread(10);
            } else if (ComponentConfigFlash.FLASH_VALUE_SCREEN_LIGHT_AUTO.equals(componentValue)) {
                topAlert.alertFlash(0, false, false);
                updatePreferenceInWorkThread(10);
            }
        }
    }

    private boolean isPortraitSuccessHintShowing() {
        return ((BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175)).isPortraitHintVisible();
    }

    private void setPortraitSuccessHintVisible(int i) {
        ((BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175)).setPortraitHintVisible(i);
    }

    private void initAiSceneParser() {
        this.mFunctionParseAiScene = new FunctionParseAiScene(this.mModuleIndex);
        this.mAiSceneDisposable = Flowable.create(new FlowableOnSubscribe<CaptureResult>() {
            public void subscribe(FlowableEmitter<CaptureResult> flowableEmitter) throws Exception {
                Camera2Module.this.mAiSceneFlowableEmitter = flowableEmitter;
            }
        }, BackpressureStrategy.DROP).observeOn(GlobalConstant.sCameraSetupScheduler).map(this.mFunctionParseAiScene).filter(new PredicateFilterAiScene(this)).observeOn(AndroidSchedulers.mainThread()).subscribe(new Consumer<Integer>() {
            public void accept(Integer num) {
                Camera2Module.this.consumeAiSceneResult(num.intValue(), false);
            }
        });
    }

    private void consumeAiSceneResult(int i, boolean z) {
        if (this.mCurrentAiScene != i && !isDoingAction() && isAlive() && !this.mActivity.isActivityPaused()) {
            if (!z || !this.isResetFromMutex) {
                boolean z2 = false;
                if (!z) {
                    this.isResetFromMutex = false;
                }
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("consumeAiSceneResult: ");
                stringBuilder.append(i);
                stringBuilder.append("; isReset: ");
                stringBuilder.append(z);
                Log.d(str, stringBuilder.toString());
                TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
                ConfigChanges configChanges = (ConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(164);
                if (!isFrontCamera()) {
                    this.mCamera2Device.setCameraAI30(i == 25);
                }
                checkCloseMoonMode(i, 8);
                if (i != -1) {
                    int parseInt;
                    if (i == 1) {
                        parseInt = Integer.parseInt(CameraSettings.getSharpness());
                        if (parseInt < 6) {
                            parseInt++;
                        }
                        this.mCurrentAiScene = i;
                        configChanges.restoreAllMutexElement(SupportedConfigFactory.CLOSE_BY_AI);
                        this.mCamera2Device.setSharpness(parseInt);
                    } else if (i == 4) {
                        this.mCamera2Device.setContrast(Integer.parseInt(CameraSettings.getContrast()));
                        this.mCurrentAiScene = i;
                        configChanges.restoreAllMutexElement(SupportedConfigFactory.CLOSE_BY_AI);
                        updateSuperResolution();
                    } else if (i != 10) {
                        if (i != 15 && i != 19) {
                            switch (i) {
                                case 7:
                                case 8:
                                    this.mCurrentAiScene = i;
                                    configChanges.restoreAllMutexElement(SupportedConfigFactory.CLOSE_BY_AI);
                                    break;
                                default:
                                    switch (i) {
                                        case 25:
                                            trackAISceneChanged(this.mModuleIndex, 25);
                                            topAlert.setAiSceneImageLevel(25);
                                            topAlert.alertAiSceneSelector(8);
                                            setAiSceneEffect(25);
                                            this.mCurrentAiScene = i;
                                            configChanges.restoreAllMutexElement(SupportedConfigFactory.CLOSE_BY_AI);
                                            this.mCamera2Device.setASD(false);
                                            resumePreviewInWorkThread();
                                            return;
                                        case 26:
                                        case 27:
                                        case 28:
                                        case 29:
                                        case 30:
                                        case 31:
                                            if (!DataRepository.dataItemFeature().eS()) {
                                                configChanges.restoreAllMutexElement(SupportedConfigFactory.CLOSE_BY_AI);
                                                updatePreferenceInWorkThread(UpdateConstant.AI_SCENE_CONFIG);
                                                i = 0;
                                                break;
                                            }
                                            this.mCurrentAiScene = i;
                                            configChanges.restoreAllMutexElement(SupportedConfigFactory.CLOSE_BY_AI);
                                            break;
                                        default:
                                            switch (i) {
                                                case 34:
                                                case 36:
                                                    this.mCurrentAiScene = i;
                                                    break;
                                                case 35:
                                                    this.mCurrentAiScene = i;
                                                    if (showMoonMode()) {
                                                        topAlert.setAiSceneImageLevel(i);
                                                        this.mCamera2Device.setASD(true);
                                                        return;
                                                    }
                                                    break;
                                                default:
                                                    configChanges.restoreAllMutexElement(SupportedConfigFactory.CLOSE_BY_AI);
                                                    updatePreferenceInWorkThread(UpdateConstant.AI_SCENE_CONFIG);
                                                    break;
                                            }
                                    }
                            }
                        }
                        parseInt = Integer.parseInt(CameraSettings.getSharpness());
                        if (parseInt < 6) {
                            parseInt++;
                        }
                        this.mCamera2Device.setSharpness(parseInt);
                        this.mCurrentAiScene = i;
                        configChanges.restoreAllMutexElement(SupportedConfigFactory.CLOSE_BY_AI);
                    } else {
                        configChanges.closeMutexElement(SupportedConfigFactory.CLOSE_BY_AI, 193);
                        setFlashMode("0");
                        updateMfnr(true);
                        updateOIS();
                    }
                    z2 = true;
                    trackAISceneChanged(this.mModuleIndex, i);
                    topAlert.setAiSceneImageLevel(i);
                    topAlert.alertAiSceneSelector(8);
                    if (z2) {
                        setAiSceneEffect(i);
                    }
                    this.mCamera2Device.setASD(true);
                    if (!z) {
                        this.mCurrentAiScene = i;
                    }
                    updateBeauty();
                    resumePreviewInWorkThread();
                    return;
                }
                configChanges.closeMutexElement(SupportedConfigFactory.CLOSE_BY_AI, 193);
                topAlert.setAiSceneImageLevel(23);
                topAlert.alertHDR(8, false, false);
                topAlert.alertAiSceneSelector(0);
                applyBacklightEffect();
                this.mCamera2Device.setASD(false);
                resumePreviewInWorkThread();
                this.mCurrentAiScene = i;
            }
        }
    }

    public void updateBacklight() {
        if (!isDoingAction() && isAlive()) {
            this.isSilhouette = false;
            applyBacklightEffect();
            resumePreviewInWorkThread();
        }
    }

    public void updateSilhouette() {
        if (!isDoingAction() && isAlive()) {
            this.isSilhouette = true;
            trackAISceneChanged(this.mModuleIndex, 24);
            setAiSceneEffect(24);
            updateHDR("off");
            resumePreviewInWorkThread();
        }
    }

    private void checkCloseMoonMode(int i, int i2) {
        if (this.mCurrentAiScene == 35 && i != 35) {
            TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
            if (topAlert != null) {
                topAlert.alertMoonModeSelector(i2);
            }
            resetEvValue();
            setFocusMode(this.mFocusManager.setFocusMode(CameraSettings.getFocusMode()));
        }
    }

    private boolean showMoonMode() {
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        if (topAlert == null) {
            return false;
        }
        topAlert.alertMoonModeSelector(0);
        return true;
    }

    public void updateMoonNight() {
        checkCloseMoonMode(10, 0);
        ((ConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(164)).closeMutexElement(SupportedConfigFactory.CLOSE_BY_AI, 193);
        setFlashMode("0");
        updateMfnr(true);
        updateOIS();
        setAiSceneEffect(10);
        this.mCurrentAiScene = 10;
        resumePreviewInWorkThread();
    }

    public void updateMoon() {
        Range exposureCompensationRange = this.mCamera2Device.getCapabilities().getExposureCompensationRange();
        int i = -24;
        if (-24 < ((Integer) exposureCompensationRange.getLower()).intValue()) {
            i = ((Integer) exposureCompensationRange.getLower()).intValue();
        }
        this.mCamera2Device.setExposureCompensation(i);
        this.mCamera2Device.setAWBLock(true);
        String focusMode = this.mFocusManager.setFocusMode("manual");
        setFocusMode(focusMode);
        if (focusMode.equals("manual")) {
            this.mCamera2Device.setFocusDistance(0.0f);
        }
        this.mCurrentAiScene = 35;
        resumePreviewInWorkThread();
    }

    /* JADX WARNING: Missing block: B:11:0x002a, code:
            return false;
     */
    private boolean shouldChangeAiScene(int r7) {
        /*
        r6 = this;
        r0 = r6.isDoingAction();
        r1 = 0;
        if (r0 != 0) goto L_0x002a;
    L_0x0007:
        r0 = r6.isAlive();
        if (r0 != 0) goto L_0x000e;
    L_0x000d:
        goto L_0x002a;
    L_0x000e:
        r0 = r6.mCurrentDetectedScene;
        if (r0 == r7) goto L_0x0029;
    L_0x0012:
        r2 = java.lang.System.currentTimeMillis();
        r4 = r6.mLastChangeSceneTime;
        r2 = r2 - r4;
        r4 = 300; // 0x12c float:4.2E-43 double:1.48E-321;
        r0 = (r2 > r4 ? 1 : (r2 == r4 ? 0 : -1));
        if (r0 <= 0) goto L_0x0029;
    L_0x001f:
        r6.mCurrentDetectedScene = r7;
        r0 = java.lang.System.currentTimeMillis();
        r6.mLastChangeSceneTime = r0;
        r7 = 1;
        return r7;
    L_0x0029:
        return r1;
    L_0x002a:
        return r1;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.module.Camera2Module.shouldChangeAiScene(int):boolean");
    }

    private void resetAiSceneInHdrOrFlashOn() {
        if (this.mAiSceneEnabled && !this.isResetFromMutex && this.mCurrentAiScene != 0) {
            if (this.mCurrentAiScene == -1 || this.mCurrentAiScene == 10) {
                this.mHandler.post(new Runnable() {
                    public void run() {
                        Camera2Module.this.consumeAiSceneResult(0, true);
                        Camera2Module.this.isResetFromMutex = true;
                    }
                });
            }
        }
    }

    /* JADX WARNING: Missing block: B:10:0x0023, code:
            return;
     */
    private void resetAsdSceneInHdrOrFlashChange() {
        /*
        r2 = this;
        r0 = com.mi.config.b.hu();
        if (r0 == 0) goto L_0x0023;
    L_0x0006:
        r0 = r2.isFrontCamera();
        if (r0 == 0) goto L_0x0023;
    L_0x000c:
        r0 = r2.mCurrentAsdScene;
        r1 = -1;
        if (r0 != r1) goto L_0x0012;
    L_0x0011:
        goto L_0x0023;
    L_0x0012:
        r0 = r2.mCurrentAsdScene;
        r1 = 9;
        if (r0 != r1) goto L_0x0022;
    L_0x0018:
        r0 = r2.mHandler;
        r1 = new com.android.camera.module.Camera2Module$29;
        r1.<init>();
        r0.post(r1);
    L_0x0022:
        return;
    L_0x0023:
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.module.Camera2Module.resetAsdSceneInHdrOrFlashChange():void");
    }

    private void trackAISceneChanged(int i, int i2) {
        CameraStatUtil.trackAISceneChanged(i, i2, getResources());
    }

    private void applyBacklightEffect() {
        trackAISceneChanged(this.mModuleIndex, 23);
        setAiSceneEffect(23);
        updateHDR("normal");
        resetEvValue();
    }

    public void startScreenLight(final int i, final int i2) {
        if (!this.mPaused) {
            this.mHandler.post(new Runnable() {
                public void run() {
                    if (Camera2Module.this.mActivity != null) {
                        Camera2Module.this.mActivity.setWindowBrightness(i2);
                    }
                    FullScreenProtocol fullScreenProtocol = (FullScreenProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(196);
                    if (fullScreenProtocol != null) {
                        fullScreenProtocol.setScreenLightColor(i);
                        fullScreenProtocol.showScreenLight();
                    }
                }
            });
        }
    }

    public void stopScreenLight() {
        this.mHandler.post(new Runnable() {
            public void run() {
                if (Camera2Module.this.mActivity != null) {
                    Camera2Module.this.mActivity.restoreWindowBrightness();
                }
                FullScreenProtocol fullScreenProtocol = (FullScreenProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(196);
                String access$1500 = Camera2Module.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("stopScreenLight: protocol = ");
                stringBuilder.append(fullScreenProtocol);
                stringBuilder.append(", mHandler = ");
                stringBuilder.append(Camera2Module.this.mHandler);
                Log.d(access$1500, stringBuilder.toString());
                if (fullScreenProtocol != null) {
                    fullScreenProtocol.hideScreenLight();
                }
            }
        });
    }

    protected void trackModeCustomInfo(int i) {
        if (this.mModuleIndex == 167) {
            trackManualInfo(i);
        } else if (this.mModuleIndex == 163 && isFaceBeautyOn(this.mBeautyValues)) {
            trackBeautyInfo(i, isFrontCamera(), new BeautyValues(this.mBeautyValues));
        }
    }

    private void trackManualInfo(int i) {
        CameraStatUtil.trackPictureTakenInManual(i, getManualValue(CameraSettings.KEY_WHITE_BALANCE, getString(R.string.pref_camera_whitebalance_default)), getManualValue(CameraSettings.KEY_QC_EXPOSURETIME, getString(R.string.pref_camera_exposuretime_default)), getManualValue(CameraSettings.KEY_QC_ISO, getString(R.string.pref_camera_iso_default)), this.mModuleIndex);
    }

    private boolean isFaceBeautyOn(BeautyValues beautyValues) {
        boolean z = false;
        if (beautyValues == null) {
            return false;
        }
        if (!b.hp()) {
            return BeautyConstant.LEVEL_CLOSE.equals(beautyValues.mBeautyLevel) ^ true;
        }
        if (!CameraSettings.isAdvancedBeautyOn()) {
            return BeautyConstant.LEVEL_CLOSE.equals(beautyValues.mBeautyLevel) ^ true;
        }
        if (beautyValues.mBeautySkinSmooth > 0 || beautyValues.mBeautySkinColor > 0 || beautyValues.mBeautySlimFace > 0) {
            z = true;
        }
        return z;
    }

    private void trackBeautyInfo(int i, boolean z, BeautyValues beautyValues) {
        CameraStatUtil.trackBeautyInfo(i, z ? CameraStat.VALUE_FRONT_CAMERA : CameraStat.VALUE_BACK_CAMERA, beautyValues);
    }

    private void initFlashAutoStateForTrack(boolean z) {
        this.mFlashAutoModeState = null;
        String componentValue = DataRepository.dataItemConfig().getComponentFlash().getComponentValue(this.mModuleIndex);
        if (!componentValue.equals("3") && !componentValue.equals(ComponentConfigFlash.FLASH_VALUE_SCREEN_LIGHT_AUTO)) {
            return;
        }
        if (this.mCurrentAsdScene == 9 || z) {
            this.mFlashAutoModeState = CameraStatUtil.AUTO_ON;
        } else {
            this.mFlashAutoModeState = CameraStatUtil.AUTO_OFF;
        }
    }

    private PictureInfo getPictureInfo() {
        PictureInfo pictureInfo = new PictureInfo();
        pictureInfo.setFrontMirror(isFrontMirror());
        pictureInfo.setSensorType(isFrontCamera());
        pictureInfo.setBokehFrontCamera(isBokehFrontCamera());
        if (this.mModuleIndex == 171) {
            pictureInfo.setAiType(this.mCurrentAiScene);
        }
        pictureInfo.end();
        return pictureInfo;
    }

    private String getCurrentAiSceneName() {
        int i = this.mCurrentAiScene;
        if (this.mModuleIndex != 163 && this.mModuleIndex != 167) {
            return null;
        }
        String str = "off";
        if (!CameraSettings.getAiSceneOpen()) {
            return str;
        }
        String str2;
        str = "未知";
        if (i == -1) {
            i = this.isSilhouette ? 24 : 23;
        }
        TypedArray obtainTypedArray = getResources().obtainTypedArray(R.array.ai_scene_names);
        if (i < 0 || i >= obtainTypedArray.length()) {
            str2 = str;
        } else {
            str2 = obtainTypedArray.getString(i);
        }
        obtainTypedArray.recycle();
        return str2;
    }

    public void onUltraWideChanged(final boolean z) {
        this.mHandler.post(new Runnable() {
            public void run() {
                FragmentTopConfig fragmentTopConfig = (FragmentTopConfig) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
                if (fragmentTopConfig != null) {
                    fragmentTopConfig.alertAiDetectTipHint(z ? 0 : 8, R.string.ultra_wide_recommend_tip_hint, FragmentTopAlert.HINT_DELAY_TIME);
                }
            }
        });
    }

    public boolean isUltraWideDetectStarted() {
        return true;
    }
}
