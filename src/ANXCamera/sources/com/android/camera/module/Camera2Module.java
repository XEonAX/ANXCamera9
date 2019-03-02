package com.android.camera.module;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.Intent;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.SurfaceTexture;
import android.hardware.SensorEvent;
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
import android.provider.MiuiSettings.ScreenEffect;
import android.text.TextUtils;
import android.util.Range;
import android.util.Size;
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
import com.android.camera.effect.FaceAnalyzeInfo;
import com.android.camera.effect.FilterInfo;
import com.android.camera.effect.draw_mode.DrawExtTexAttribute;
import com.android.camera.effect.renders.DualWatermarkParam;
import com.android.camera.effect.renders.SnapshotEffectRender;
import com.android.camera.fragment.beauty.BeautyParameters;
import com.android.camera.fragment.beauty.BeautyValues;
import com.android.camera.fragment.top.FragmentTopAlert;
import com.android.camera.log.Log;
import com.android.camera.module.loader.FunctionParseAiScene;
import com.android.camera.module.loader.FunctionParseAsdFace;
import com.android.camera.module.loader.FunctionParseAsdHdr;
import com.android.camera.module.loader.FunctionParseAsdScene;
import com.android.camera.module.loader.FunctionParseAsdUltraWide;
import com.android.camera.module.loader.FunctionParseBeautyBodySlimCount;
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
import com.android.camera.protocol.ModeProtocol.MainContentProtocol;
import com.android.camera.protocol.ModeProtocol.OnFaceBeautyChangedProtocol;
import com.android.camera.protocol.ModeProtocol.RecordState;
import com.android.camera.protocol.ModeProtocol.SnapShotIndicator;
import com.android.camera.protocol.ModeProtocol.TopAlert;
import com.android.camera.protocol.ModeProtocol.TopConfigProtocol;
import com.android.camera.statistic.CameraStat;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera.statistic.ScenarioTrackUtil;
import com.android.camera.storage.Storage;
import com.android.camera.ui.ObjectView.ObjectViewListener;
import com.android.camera.ui.RotateTextToast;
import com.android.camera2.Camera2Proxy;
import com.android.camera2.Camera2Proxy.BeautyBodySlimCountCallback;
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
import com.android.zxing.PreviewDecodeManager;
import com.google.lens.sdk.LensApi;
import com.google.lens.sdk.LensApi.LensAvailabilityCallback;
import com.mi.config.b;
import com.oneplus.camera.R;
import com.xiaomi.camera.base.CameraDeviceUtil;
import com.xiaomi.camera.base.Constants;
import com.xiaomi.camera.base.PerformanceTracker;
import com.xiaomi.camera.core.ParallelTaskData;
import com.xiaomi.camera.core.ParallelTaskDataParameter;
import com.xiaomi.camera.core.ParallelTaskDataParameter.Builder;
import com.xiaomi.camera.core.PictureInfo;
import com.xiaomi.camera.liveshot.CircularMediaRecorder;
import com.xiaomi.engine.BufferFormat;
import com.xiaomi.engine.GraphDescriptorBean;
import io.reactivex.BackpressureStrategy;
import io.reactivex.Completable;
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
import io.reactivex.functions.Action;
import io.reactivex.functions.Consumer;
import io.reactivex.functions.Function;
import java.io.Closeable;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.ref.WeakReference;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.TimeUnit;

@TargetApi(21)
public class Camera2Module extends BaseModule implements Listener, CameraAction, CameraModuleSpecial, FaceBeautyProtocol, FilterProtocol, OnFaceBeautyChangedProtocol, TopConfigProtocol, ObjectViewListener, BeautyBodySlimCountCallback, CameraMetaDataCallback, CameraPreviewCallback, FaceDetectionCallback, FocusCallback, HDRCheckerCallback, PictureCallback, ScreenLightCallback, UltraWideCheckCallback {
    private static final int BURST_SHOOTING_DELAY = 0;
    private static final long CAPTURE_DURATION_THRESHOLD = 8000;
    private static final int REQUEST_CROP = 1000;
    private static final String TAG = Camera2Module.class.getSimpleName();
    private static boolean mIsBeautyFrontOn = false;
    private static final String sTempCropFilename = "crop-temp";
    private volatile boolean isDetectedInHDR;
    private volatile boolean isResetFromMutex = false;
    private boolean isSilhouette;
    private boolean m3ALocked;
    private int mAFEndLogTimes;
    private Disposable mAiSceneDisposable;
    private boolean mAiSceneEnabled;
    private FlowableEmitter<CaptureResult> mAiSceneFlowableEmitter;
    private String mAlgorithmName;
    private BeautyValues mBeautyValues;
    private boolean mBlockQuickShot = (CameraSettings.isCameraQuickShotEnable() ^ true);
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
    private boolean mEnableParallelSession;
    private boolean mEnabledPreviewThumbnail;
    private boolean mEnteringMoonMode;
    private boolean mFaceDetectionEnabled;
    private boolean mFaceDetectionStarted;
    private FocusManager2 mFocusManager;
    private FunctionParseAiScene mFunctionParseAiScene;
    private MainHandler mHandler;
    private boolean mHasAiSceneFilterEffect;
    private boolean mHdrCheckEnabled;
    private boolean mIsBeautyBodySlimOn;
    private boolean mIsCurrentTaskIsParallel;
    private boolean mIsGenderAgeOn;
    private boolean mIsGradienterOn;
    private boolean mIsImageCaptureIntent;
    private boolean mIsLensServiceBound = false;
    private boolean mIsMagicMirrorOn;
    private boolean mIsMicrophoneEnabled = true;
    private boolean mIsMoonMode;
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
    private boolean mPendingMultiCapture;
    private boolean mQuickCapture;
    private boolean mQuickShotAnimateEnable = false;
    private int mReceivedJpegCallbackNum = 0;
    private Uri mSaveUri;
    private String mSceneMode;
    private SensorStateListener mSensorStateListener = new SensorStateListener() {
        public void onDeviceBecomeStable() {
        }

        public boolean isWorking() {
            return Camera2Module.this.isAlive() && Camera2Module.this.getCameraState() != 0;
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
                Camera2Module.this.mHandler.obtainMessage(33, roundOrientation, (Util.getDisplayRotation(Camera2Module.this.mActivity) + roundOrientation) % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT).sendToTarget();
            }
        }

        public void notifyDevicePostureChanged() {
        }

        public void onDeviceRotationChanged(float[] fArr) {
        }

        public void onSensorChanged(SensorEvent sensorEvent) {
        }
    };
    private ServiceStatusListener mServiceStatusListener;
    private int mShootOrientation;
    private float mShootRotation;
    private boolean mShouldDoMFNR;
    private long mShutterCallbackTime;
    private long mShutterLag;
    private Disposable mSuperNightDisposable;
    private final Consumer<Integer> mSuperNightEventConsumer = new SuperNightEventConsumer(this, null);
    private int mTotalJpegCallbackNum = 1;
    private boolean mUpdateImageTitle = false;
    private CameraSize mVideoSize;
    private boolean mVolumeLongPress = false;
    private boolean mWaitingSuperNightResult;

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
                if (!(this.mSavedJpegCallbackNum != 1 || Camera2Module.this.mMultiSnapStopRequest || Camera2Module.this.mMutexModePicker.isUbiFocus())) {
                    Camera2Module.this.mActivity.getImageSaver().updateImage(getBurstShotTitle(), this.mPressDownTitle);
                }
                if (Storage.isLowStorageAtLastPoint()) {
                    if (!Camera2Module.this.mMutexModePicker.isUbiFocus() && Camera2Module.this.mMultiSnapStatus) {
                        Camera2Module.this.trackGeneralInfo(this.mSavedJpegCallbackNum, true);
                        Camera2Module.this.trackPictureTaken(this.mSavedJpegCallbackNum, true, this.mLocation != null, Camera2Module.this.getCurrentAiSceneName(), Camera2Module.this.mEnteringMoonMode, Camera2Module.this.mIsMoonMode);
                        Camera2Module.this.stopMultiSnap();
                    }
                    return;
                }
                Camera2Module.access$1004(Camera2Module.this);
                if (Camera2Module.this.mActivity.getImageSaver().isSaveQueueFull()) {
                    String access$500 = Camera2Module.TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("CaptureBurst queue full and drop ");
                    stringBuilder.append(Camera2Module.this.mReceivedJpegCallbackNum);
                    Log.e(access$500, stringBuilder.toString());
                    this.mDropped = true;
                    if (Camera2Module.this.mReceivedJpegCallbackNum >= Camera2Module.this.mTotalJpegCallbackNum) {
                        Camera2Module.this.mActivity.getThumbnailUpdater().getLastThumbnailUncached();
                    }
                } else {
                    int i;
                    int width;
                    int height;
                    this.mSavedJpegCallbackNum++;
                    if (!Camera2Module.this.mMutexModePicker.isUbiFocus()) {
                        Camera2Module.this.playCameraSound(4);
                    }
                    Camera2Module.this.mBurstEmitter.onNext(Integer.valueOf(this.mSavedJpegCallbackNum));
                    boolean z = Camera2Module.this.mMutexModePicker.isUbiFocus() && Camera2Module.this.mReceivedJpegCallbackNum <= Camera2Module.this.mTotalJpegCallbackNum;
                    if (z) {
                        i = 0;
                    } else {
                        i = Exif.getOrientation(bArr);
                    }
                    if ((Camera2Module.this.mJpegRotation + i) % 180 == 0) {
                        width = Camera2Module.this.mPictureSize.getWidth();
                        height = Camera2Module.this.mPictureSize.getHeight();
                    } else {
                        width = Camera2Module.this.mPictureSize.getHeight();
                        height = Camera2Module.this.mPictureSize.getWidth();
                    }
                    int i2 = width;
                    int i3 = height;
                    String burstShotTitle = getBurstShotTitle();
                    boolean z2 = Camera2Module.this.mMutexModePicker.isUbiFocus() && Camera2Module.this.mReceivedJpegCallbackNum == Camera2Module.this.mTotalJpegCallbackNum - 1;
                    if (!(Camera2Module.this.mMutexModePicker.isUbiFocus() && Camera2Module.this.mReceivedJpegCallbackNum == Camera2Module.this.mTotalJpegCallbackNum)) {
                        boolean z3 = Camera2Module.this.mReceivedJpegCallbackNum != 1 && (Camera2Module.this.mReceivedJpegCallbackNum == Camera2Module.this.mTotalJpegCallbackNum || Camera2Module.this.mMultiSnapStopRequest || this.mDropped);
                        boolean z4 = false;
                        Camera2Module.this.mActivity.getImageSaver().addImage(bArr, z3, burstShotTitle, null, System.currentTimeMillis(), null, this.mLocation, i2, i3, null, i, z, z2, true, false, false, null, Camera2Module.this.getPictureInfo(), -1);
                        this.mDropped = z4;
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

    private final class JpegRepeatingCaptureCallback extends PictureCallbackWrapper {
        String mBurstShotTitle;
        private boolean mDropped;
        ParallelTaskDataParameter mParallelParameter;
        String mPressDownTitle;

        private JpegRepeatingCaptureCallback() {
            this.mParallelParameter = null;
        }

        /* synthetic */ JpegRepeatingCaptureCallback(Camera2Module camera2Module, AnonymousClass1 anonymousClass1) {
            this();
        }

        private String getBurstShotTitle() {
            String stringBuilder;
            if (Camera2Module.this.mUpdateImageTitle && this.mBurstShotTitle != null && Camera2Module.this.mReceivedJpegCallbackNum == 1) {
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
                stringBuilder3.append(Camera2Module.this.mReceivedJpegCallbackNum - 1);
                stringBuilder = stringBuilder3.toString();
            } else {
                StringBuilder stringBuilder4 = new StringBuilder();
                stringBuilder4.append("_BURST");
                stringBuilder4.append(Camera2Module.this.mReceivedJpegCallbackNum);
                stringBuilder = stringBuilder4.toString();
            }
            stringBuilder2.append(stringBuilder);
            return stringBuilder2.toString();
        }

        /* JADX WARNING: Removed duplicated region for block: B:35:0x00aa  */
        /* JADX WARNING: Removed duplicated region for block: B:34:0x00a5  */
        /* JADX WARNING: Removed duplicated region for block: B:39:0x00f3  */
        /* JADX WARNING: Removed duplicated region for block: B:38:0x00f1  */
        /* JADX WARNING: Removed duplicated region for block: B:49:0x0141  */
        /* JADX WARNING: Removed duplicated region for block: B:48:0x0135  */
        /* JADX WARNING: Removed duplicated region for block: B:53:0x0151  */
        /* JADX WARNING: Removed duplicated region for block: B:52:0x014c  */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        public ParallelTaskData onCaptureStart(ParallelTaskData parallelTaskData, CameraSize cameraSize) {
            if (!Camera2Module.this.mIsCurrentTaskIsParallel || Camera2Module.this.mPaused || Camera2Module.this.mReceivedJpegCallbackNum >= Camera2Module.this.mTotalJpegCallbackNum || !Camera2Module.this.mMultiSnapStatus) {
                return null;
            }
            boolean z = true;
            if (Camera2Module.this.mReceivedJpegCallbackNum == 1 && !Camera2Module.this.mMultiSnapStopRequest) {
                if (!Camera2Module.this.is3ALocked()) {
                    Camera2Module.this.mFocusManager.onShutter();
                }
                if (!Camera2Module.this.mMutexModePicker.isUbiFocus()) {
                    Camera2Module.this.mActivity.getImageSaver().updateImage(getBurstShotTitle(), this.mPressDownTitle);
                }
            }
            if (tryCheckNeedStop()) {
                Log.d(Camera2Module.TAG, "onMultiSnapCaptureStart: need stop multi capture, return null");
                return null;
            }
            if (this.mParallelParameter == null) {
                List arrayList;
                Size toSizeObject;
                Builder jpegRotation;
                float access$2500;
                if (CameraSettings.isAgeGenderAndMagicMirrorWaterOpen()) {
                    Collection faceWaterMarkInfos = ((MainContentProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(166)).getFaceWaterMarkInfos();
                    if (!(faceWaterMarkInfos == null || faceWaterMarkInfos.isEmpty())) {
                        arrayList = new ArrayList(faceWaterMarkInfos);
                        if (Camera2Module.this.mOutPutSize != null) {
                            toSizeObject = cameraSize.toSizeObject();
                        } else {
                            toSizeObject = Camera2Module.this.mOutPutSize.toSizeObject();
                        }
                        jpegRotation = new Builder(Camera2Module.this.mPreviewSize.toSizeObject(), cameraSize.toSizeObject(), toSizeObject).setHasDualWaterMark(CameraSettings.isDualCameraWaterMarkOpen()).setMirror(Camera2Module.this.isFrontMirror()).setLightingPattern(CameraSettings.getPortraitLightingPattern()).setFilterId(EffectController.getInstance().getEffectForSaving(false)).setOrientation(-1 != Camera2Module.this.mOrientation ? 0 : Camera2Module.this.mOrientation).setJpegRotation(Camera2Module.this.mJpegRotation);
                        access$2500 = (CameraSettings.isGradienterOn() || Camera2Module.this.mShootRotation != -1.0f) ? Camera2Module.this.mShootRotation : 0.0f;
                        this.mParallelParameter = jpegRotation.setShootRotation(access$2500).setShootOrientation(Camera2Module.this.mShootOrientation).setLocation(Camera2Module.this.mLocation == null ? new Location(Camera2Module.this.mLocation) : null).setTimeWaterMarkString(CameraSettings.isTimeWaterMarkOpen() ? Util.getTimeWatermark() : null).setFaceWaterMarkList(arrayList).setAgeGenderAndMagicMirrorWater(CameraSettings.isAgeGenderAndMagicMirrorWaterOpen()).setFrontCamera(Camera2Module.this.isFrontCamera()).setBokehFrontCamera(Camera2Module.this.isBokehFrontCamera()).setAlgorithmName(Camera2Module.this.mAlgorithmName).setPictureInfo(Camera2Module.this.getPictureInfo()).setSuffix(Camera2Module.this.getSuffix()).setGradienterOn(Camera2Module.this.mIsGradienterOn).setTiltShiftMode(Camera2Module.getTiltShiftMode()).setSaveGroupshotPrimitive(false).setDualWatermarkParam(Camera2Module.this.getDualWaterMarkParam()).setJpegQuality(BaseModule.getJpegQuality(true)).build();
                    }
                }
                arrayList = null;
                if (Camera2Module.this.mOutPutSize != null) {
                }
                if (-1 != Camera2Module.this.mOrientation) {
                }
                jpegRotation = new Builder(Camera2Module.this.mPreviewSize.toSizeObject(), cameraSize.toSizeObject(), toSizeObject).setHasDualWaterMark(CameraSettings.isDualCameraWaterMarkOpen()).setMirror(Camera2Module.this.isFrontMirror()).setLightingPattern(CameraSettings.getPortraitLightingPattern()).setFilterId(EffectController.getInstance().getEffectForSaving(false)).setOrientation(-1 != Camera2Module.this.mOrientation ? 0 : Camera2Module.this.mOrientation).setJpegRotation(Camera2Module.this.mJpegRotation);
                if (CameraSettings.isGradienterOn()) {
                }
                if (Camera2Module.this.mLocation == null) {
                }
                if (CameraSettings.isTimeWaterMarkOpen()) {
                }
                this.mParallelParameter = jpegRotation.setShootRotation(access$2500).setShootOrientation(Camera2Module.this.mShootOrientation).setLocation(Camera2Module.this.mLocation == null ? new Location(Camera2Module.this.mLocation) : null).setTimeWaterMarkString(CameraSettings.isTimeWaterMarkOpen() ? Util.getTimeWatermark() : null).setFaceWaterMarkList(arrayList).setAgeGenderAndMagicMirrorWater(CameraSettings.isAgeGenderAndMagicMirrorWaterOpen()).setFrontCamera(Camera2Module.this.isFrontCamera()).setBokehFrontCamera(Camera2Module.this.isBokehFrontCamera()).setAlgorithmName(Camera2Module.this.mAlgorithmName).setPictureInfo(Camera2Module.this.getPictureInfo()).setSuffix(Camera2Module.this.getSuffix()).setGradienterOn(Camera2Module.this.mIsGradienterOn).setTiltShiftMode(Camera2Module.getTiltShiftMode()).setSaveGroupshotPrimitive(false).setDualWatermarkParam(Camera2Module.this.getDualWaterMarkParam()).setJpegQuality(BaseModule.getJpegQuality(true)).build();
            }
            parallelTaskData.fillParameter(this.mParallelParameter);
            if (Camera2Module.this.mActivity.getImageSaver().isSaveQueueFull()) {
                String access$500 = Camera2Module.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onCaptureStart queue full and drop ");
                stringBuilder.append(Camera2Module.this.mReceivedJpegCallbackNum);
                Log.e(access$500, stringBuilder.toString());
                this.mDropped = true;
                if (Camera2Module.this.mReceivedJpegCallbackNum >= Camera2Module.this.mTotalJpegCallbackNum) {
                    Camera2Module.this.mActivity.getThumbnailUpdater().getLastThumbnailUncached();
                }
            } else {
                Camera2Module.access$1004(Camera2Module.this);
                if (!Camera2Module.this.mMutexModePicker.isUbiFocus()) {
                    Camera2Module.this.playCameraSound(4);
                }
                String access$5002 = Camera2Module.TAG;
                StringBuilder stringBuilder2 = new StringBuilder();
                stringBuilder2.append("onCaptureStart: mReceivedJpegCallbackNum = ");
                stringBuilder2.append(Camera2Module.this.mReceivedJpegCallbackNum);
                Log.d(access$5002, stringBuilder2.toString());
                Camera2Module.this.mBurstEmitter.onNext(Integer.valueOf(Camera2Module.this.mReceivedJpegCallbackNum));
                if (!Camera2Module.this.mMutexModePicker.isUbiFocus() && Camera2Module.this.mReceivedJpegCallbackNum <= Camera2Module.this.mTotalJpegCallbackNum) {
                    access$5002 = Storage.generateFilepath(getBurstShotTitle());
                    String access$5003 = Camera2Module.TAG;
                    StringBuilder stringBuilder3 = new StringBuilder();
                    stringBuilder3.append("onCaptureStart: savePath = ");
                    stringBuilder3.append(access$5002);
                    Log.d(access$5003, stringBuilder3.toString());
                    parallelTaskData.setSavePath(access$5002);
                    if (!(Camera2Module.this.mReceivedJpegCallbackNum == Camera2Module.this.mTotalJpegCallbackNum || Camera2Module.this.mMultiSnapStopRequest || this.mDropped)) {
                        z = false;
                    }
                    parallelTaskData.setNeedThumbnail(z);
                    Camera2Module.this.beginParallelProcess(parallelTaskData, false);
                    this.mDropped = false;
                    if (Camera2Module.this.mReceivedJpegCallbackNum >= Camera2Module.this.mTotalJpegCallbackNum || Camera2Module.this.mMultiSnapStopRequest || this.mDropped) {
                        Camera2Module.this.stopMultiSnap();
                    }
                    return parallelTaskData;
                }
            }
            parallelTaskData = null;
            Camera2Module.this.stopMultiSnap();
            return parallelTaskData;
        }

        private boolean tryCheckNeedStop() {
            if (!Storage.isLowStorageAtLastPoint()) {
                return false;
            }
            if (!Camera2Module.this.mMutexModePicker.isUbiFocus() && Camera2Module.this.mMultiSnapStatus) {
                Camera2Module.this.trackGeneralInfo(Camera2Module.this.mReceivedJpegCallbackNum, true);
                Camera2Module.this.trackPictureTaken(Camera2Module.this.mReceivedJpegCallbackNum, true, Camera2Module.this.mLocation != null, Camera2Module.this.getCurrentAiSceneName(), Camera2Module.this.mEnteringMoonMode, Camera2Module.this.mIsMoonMode);
                Camera2Module.this.stopMultiSnap();
            }
            return true;
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
                                                Log.w(Camera2Module.TAG, "Oops, capture timeout later release timeout!");
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
                                                switch (i) {
                                                    case 56:
                                                        if (Camera2Module.this.mMainProtocol != null && Camera2Module.this.mMainProtocol.isFaceExists(1) && Camera2Module.this.mMainProtocol.isFocusViewVisible() && 4 == Camera2Module.this.mCamera2Device.getFocusMode()) {
                                                            Camera2Module.this.mMainProtocol.clearFocusView(7);
                                                            break;
                                                        }
                                                    case 57:
                                                        PreviewDecodeManager.getInstance().reset();
                                                        break;
                                                    default:
                                                        StringBuilder stringBuilder = new StringBuilder();
                                                        stringBuilder.append("no consumer for this message: ");
                                                        stringBuilder.append(message.what);
                                                        throw new RuntimeException(stringBuilder.toString());
                                                }
                                        }
                                        break;
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

    private static class SuperNightEventConsumer implements Consumer<Integer> {
        private final WeakReference<Camera2Module> mCamera2ModuleRef;

        /* synthetic */ SuperNightEventConsumer(Camera2Module camera2Module, AnonymousClass1 anonymousClass1) {
            this(camera2Module);
        }

        private SuperNightEventConsumer(Camera2Module camera2Module) {
            this.mCamera2ModuleRef = new WeakReference(camera2Module);
        }

        public void accept(Integer num) throws Exception {
            Camera2Module camera2Module = (Camera2Module) this.mCamera2ModuleRef.get();
            if (camera2Module != null && camera2Module.isAlive()) {
                int intValue = num.intValue();
                if (intValue == 300) {
                    Log.d(Camera2Module.TAG, "SuperNight: show capture instruction hint");
                    BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
                    if (bottomPopupTips != null) {
                        bottomPopupTips.showTips(11, R.string.super_night_toast, 4);
                    }
                } else if (intValue == 2000) {
                    Log.d(Camera2Module.TAG, "SuperNight: trigger shutter animation, sound and post saving");
                    camera2Module.mWaitingSuperNightResult = true;
                    camera2Module.animateCapture();
                    camera2Module.playCameraSound(0);
                    RecordState recordState = (RecordState) ModeCoordinatorImpl.getInstance().getAttachProtocol(212);
                    if (recordState != null) {
                        recordState.onPostSavingStart();
                    }
                }
            }
        }
    }

    static /* synthetic */ int access$1004(Camera2Module camera2Module) {
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
        if (b.hP()) {
            ModeCoordinatorImpl.getInstance().attachProtocol(185, this);
        }
        ModeCoordinatorImpl.getInstance().attachProtocol(199, this);
        getActivity().getImplFactory().initAdditional(getActivity(), 164, 174);
        if (getModuleIndex() == 173) {
            getActivity().getImplFactory().initAdditional(getActivity(), 212);
        }
    }

    public void unRegisterProtocol() {
        super.unRegisterProtocol();
        ModeCoordinatorImpl.getInstance().detachProtocol(161, this);
        ModeCoordinatorImpl.getInstance().detachProtocol(169, this);
        ModeCoordinatorImpl.getInstance().detachProtocol(165, this);
        ModeCoordinatorImpl.getInstance().detachProtocol(193, this);
        ModeCoordinatorImpl.getInstance().detachProtocol(195, this);
        if (b.hP()) {
            ModeCoordinatorImpl.getInstance().detachProtocol(185, this);
        }
        ModeCoordinatorImpl.getInstance().detachProtocol(199, this);
        getActivity().getImplFactory().detachAdditional();
    }

    public boolean scanQRCodeEnabled() {
        return (!CameraSettings.isScanQRCode(this.mActivity) || this.mModuleIndex != 163 || this.mIsImageCaptureIntent || !CameraSettings.isBackCamera() || this.mMultiSnapStatus || CameraSettings.isStereoModeOn() || CameraSettings.isPortraitModeBackOn() || (DataRepository.dataItemFeature().gd() && CameraSettings.isRearMenuUltraPixelPhotographyOn())) ? false : true;
    }

    public void startFocus() {
        if (isDeviceAlive() && isFrameAvailable()) {
            if (this.mFocusOrAELockSupported) {
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
        if (isBlockSnap() || !isAlive()) {
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
            if (isParallelSessionEnable()) {
                this.mCamera2Device.setShotType(9);
                this.mCamera2Device.captureBurstPictures(this.mTotalJpegCallbackNum, new JpegRepeatingCaptureCallback(this, null), this.mActivity.getImageSaver());
            } else {
                this.mCamera2Device.setShotType(3);
                this.mCamera2Device.captureBurstPictures(this.mTotalJpegCallbackNum, new JpegQuickPictureCallback(LocationManager.instance().getCurrentLocation()), this.mActivity.getImageSaver());
            }
            return true;
        }
    }

    private void stopMultiSnap() {
        Log.d(TAG, "stopMultiSnap: start");
        this.mHandler.removeMessages(49);
        if (this.mMultiSnapStatus) {
            int i;
            this.mLastCaptureTime = System.currentTimeMillis();
            this.mMultiSnapStatus = false;
            this.mCamera2Device.captureAbortBurst();
            if (this.mMutexModePicker.isUbiFocus()) {
                i = 1;
            } else {
                i = this.mReceivedJpegCallbackNum;
            }
            boolean isUbiFocus = this.mMutexModePicker.isUbiFocus() ^ 1;
            trackGeneralInfo(i, isUbiFocus);
            trackPictureTaken(i, isUbiFocus, this.mLocation != null, getCurrentAiSceneName(), this.mEnteringMoonMode, this.mIsMoonMode);
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
                this.mCircularMediaRecorder = new CircularMediaRecorder(this.mVideoSize.width, this.mVideoSize.height, getActivity().getGLView().getEGLContext14(), this.mIsMicrophoneEnabled);
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
        if (!DataRepository.dataItemFeature().fE() || this.mModuleIndex != 163) {
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

    /* JADX WARNING: Removed duplicated region for block: B:37:0x0083 A:{RETURN} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private boolean isTriggerQcfaModeChange(boolean z, boolean z2) {
        if (!this.mCameraCapabilities.isSupportedQcfa()) {
            return false;
        }
        if ((this.mModuleIndex == 171 && isBokehFrontCamera()) || DataRepository.dataItemFeature().fS() > 0) {
            return false;
        }
        boolean isFaceBeautyOn = BeautyParameters.isFaceBeautyOn();
        String componentValue;
        if (z) {
            if (mIsBeautyFrontOn != isFaceBeautyOn) {
                if (isFaceBeautyOn && this.mOperatingMode == 32775) {
                    return true;
                }
                componentValue = DataRepository.dataItemConfig().getComponentHdr().getComponentValue(this.mModuleIndex);
                if (!isFaceBeautyOn && componentValue.equals("off") && this.mOperatingMode == 32773) {
                    return true;
                }
                return false;
            }
        } else if (z2 && !isFaceBeautyOn) {
            componentValue = DataRepository.dataItemConfig().getComponentHdr().getComponentValue(this.mModuleIndex);
            if ((this.mOperatingMode == 32773 && componentValue.equals("off")) || (this.mOperatingMode == 32775 && !componentValue.equals("off"))) {
                return true;
            }
        }
        return false;
    }

    private void onBeautyParameterChanged() {
        if (isTriggerQcfaModeChange(true, false)) {
            restartModule();
        } else if (b.hW()) {
            updatePreferenceInWorkThread(13, 34, 42);
        } else {
            updatePreferenceInWorkThread(13);
        }
        mIsBeautyFrontOn = BeautyParameters.isFaceBeautyOn();
        this.mIsBeautyBodySlimOn = CameraSettings.isBeautyBodySlimOn();
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
        if ((isFrontCamera() && ModuleManager.isCapture()) || !this.mAiSceneEnabled) {
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
        boolean z = isFrontCamera() && !isBokehFrontCamera() && ModuleManager.isPortraitModule() && b.hC();
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
        this.mHandler.post(-$$Lambda$Camera2Module$6MhBAG8t9gKD6JetAb6jENHe1rY.INSTANCE);
    }

    static /* synthetic */ void lambda$hideSceneSelector$0() {
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        if (topAlert != null) {
            topAlert.alertAiSceneSelector(8);
        }
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
        if (b.hP()) {
            onBeautyChanged();
        }
    }

    public void onBeautyChanged() {
        onBeautyParameterChanged();
    }

    /* JADX WARNING: Missing block: B:16:0x0034, code:
            return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void startFaceDetection() {
        if (!(!this.mFaceDetectionEnabled || this.mFaceDetectionStarted || this.mActivity == null || this.mActivity.isActivityPaused() || !isAlive() || this.mMaxFaceCount <= 0 || this.mCamera2Device == null)) {
            this.mFaceDetectionStarted = true;
            this.mMainProtocol.setActiveIndicator(1);
            this.mCamera2Device.startFaceDetection();
            updateFaceView(true, true);
        }
    }

    public void stopFaceDetection(boolean z) {
        if (this.mFaceDetectionEnabled && this.mFaceDetectionStarted) {
            if (!(b.isMTKPlatform() && (getCameraState() == 3 || getCameraState() == 0))) {
                this.mCamera2Device.stopFaceDetection();
            }
            this.mFaceDetectionStarted = false;
            this.mMainProtocol.setActiveIndicator(2);
            updateFaceView(false, z);
        }
    }

    /* JADX WARNING: Missing block: B:30:0x0079, code:
            return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void onFaceDetected(CameraHardwareFace[] cameraHardwareFaceArr, FaceAnalyzeInfo faceAnalyzeInfo) {
        if (isAlive() && this.mActivity.getCameraScreenNail().getFrameAvailableFlag() && cameraHardwareFaceArr != null) {
            if (b.gH() && cameraHardwareFaceArr.length > 0 && cameraHardwareFaceArr[0].faceType == CameraHardwareFace.CAMERA_META_DATA_T2T) {
                if (this.mObjectTrackingStarted) {
                    this.mMainProtocol.setFaces(3, cameraHardwareFaceArr, getActiveArraySize(), this.mZoomValue);
                }
            } else if (this.mMainProtocol.setFaces(1, cameraHardwareFaceArr, getActiveArraySize(), this.mZoomValue)) {
                if (this.mIsPortraitLightingOn) {
                    this.mMainProtocol.lightingDetectFace(cameraHardwareFaceArr);
                }
                if (!this.mMainProtocol.isFaceExists(1) || !this.mMainProtocol.isFocusViewVisible()) {
                    this.mHandler.removeMessages(56);
                } else if (!this.mHandler.hasMessages(56)) {
                    this.mHandler.sendEmptyMessage(56);
                }
            }
        }
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

    public void playFocusSound(int i) {
        playCameraSound(i);
    }

    public boolean isNeedMute() {
        return CameraSettings.isLiveShotOn();
    }

    public void startObjectTracking() {
    }

    public void onObjectStable() {
    }

    private int getCountDownTimes(int i) {
        int timerDurationSeconds;
        if (this.mBroadcastIntent != null) {
            timerDurationSeconds = CameraIntentManager.getInstance(this.mBroadcastIntent).getTimerDurationSeconds();
        } else {
            timerDurationSeconds = this.mActivity.getCameraIntentManager().getTimerDurationSeconds();
        }
        if (timerDurationSeconds != -1) {
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
        } else if (i != 100 || !CameraSettings.isHandGestureOpen()) {
            return CameraSettings.getCountDownTimes();
        } else {
            i = CameraSettings.getCountDownTimes();
            if (i == 0) {
                i = 3;
            }
            return i;
        }
    }

    /* JADX WARNING: Missing block: B:17:0x0037, code:
            return false;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private boolean checkShutterCondition() {
        if (isBlockSnap() || isIgnoreTouchEvent() || Storage.isLowStorageAtLastPoint()) {
            return false;
        }
        if (isFrontCamera() && this.mActivity.isScreenSlideOff()) {
            return false;
        }
        BackStack backStack = (BackStack) ModeCoordinatorImpl.getInstance().getAttachProtocol(171);
        if (backStack != null) {
            backStack.handleBackStackFromShutter();
        }
        return true;
    }

    public void onShutterButtonClick(int i) {
        int countDownTimes = getCountDownTimes(i);
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
        boolean z = true;
        this.mTotalJpegCallbackNum = 1;
        this.mReceivedJpegCallbackNum = 0;
        this.mCaptureStartTime = System.currentTimeMillis();
        ScenarioTrackUtil.trackCaptureTimeStart(isFrontCamera(), this.mModuleIndex);
        this.mLastCaptureTime = this.mCaptureStartTime;
        setCameraState(3);
        this.mJpegRotation = Util.getJpegRotation(this.mBogusCameraId, this.mOrientation);
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("prepareNormalCapture: mOrientation = ");
        stringBuilder.append(this.mOrientation);
        stringBuilder.append(", mJpegRotation = ");
        stringBuilder.append(this.mJpegRotation);
        Log.d(str, stringBuilder.toString());
        this.mCamera2Device.setJpegRotation(this.mJpegRotation);
        Location currentLocation = LocationManager.instance().getCurrentLocation();
        this.mCamera2Device.setGpsLocation(currentLocation);
        this.mLocation = currentLocation;
        updateFrontMirror();
        updateBeauty();
        updateShotDetermine();
        Camera2Proxy camera2Proxy = this.mCamera2Device;
        stringBuilder = new StringBuilder();
        stringBuilder.append(Util.createJpegName(System.currentTimeMillis()));
        stringBuilder.append(getSuffix());
        String generateFilepath = Storage.generateFilepath(stringBuilder.toString());
        if (this.mMultiSnapStatus || !this.mIsCurrentTaskIsParallel) {
            z = false;
        }
        camera2Proxy.setShotSavePath(generateFilepath, z);
        if (this.mModuleIndex == 173 || this.mModuleIndex == 167 || this.mModuleIndex == 171 || this.mMutexModePicker.isHdr()) {
            this.mQuickShotAnimateEnable = false;
        } else {
            this.mQuickShotAnimateEnable = CameraSettings.isCameraQuickShotAnimateEnable();
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
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("startNormalCapture mode -> ");
        stringBuilder.append(i);
        Log.d(str, stringBuilder.toString());
        prepareNormalCapture();
        if (!CameraSettings.isGroupShotOn() || isParallelSessionEnable()) {
            this.mHandler.sendEmptyMessageDelayed(50, calculateTimeout(this.mModuleIndex));
            this.mCamera2Device.takePicture(this, this.mActivity.getImageSaver());
            if (needQuickShot()) {
                Log.d(TAG, "startNormalCapture force set CameraStateConstant.IDLE");
                setCameraState(1);
                enableCameraControls(true);
                return;
            }
            return;
        }
        this.mCamera2Device.captureGroupShotPictures(this, this.mActivity.getImageSaver(), this.mTotalJpegCallbackNum, this.mActivity);
        this.mBlockQuickShot = true;
    }

    private boolean needQuickShot() {
        boolean z;
        if (this.mBlockQuickShot || !CameraSettings.isCameraQuickShotEnable() || (!this.mIsCurrentTaskIsParallel && (!(this.mModuleIndex == 163 || this.mModuleIndex == 165) || this.mZoomValue != 1.0f || CameraSettings.isFrontCamera() || this.mMutexModePicker.isHdr() || this.mCamera2Device.isNeedFlashOn() || CameraSettings.isRearMenuUltraPixelPhotographyOn() || CameraSettings.isLiveShotOn() || (this.mBeautyValues != null && CameraSettings.isFaceBeautyOn(this.mBeautyValues.mBeautyLevel))))) {
            z = false;
        } else {
            z = true;
        }
        if (!z) {
            this.mBlockQuickShot = true;
        }
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("needQuickShot bRet:");
        stringBuilder.append(z);
        Log.d(str, stringBuilder.toString());
        return z;
    }

    private long calculateTimeout(int i) {
        long j = CAPTURE_DURATION_THRESHOLD;
        if (i == 167) {
            return (Long.parseLong(getManualValue(CameraSettings.KEY_QC_EXPOSURETIME, getString(R.string.pref_camera_exposuretime_default))) / 1000000) + CAPTURE_DURATION_THRESHOLD;
        }
        if (i == 173) {
            j = 16000;
        }
        return j;
    }

    private void prepareMultiCapture() {
        Log.d(TAG, "prepareMultiCapture");
        this.mMultiSnapStatus = true;
        this.mMultiSnapStopRequest = false;
        Util.clearMemoryLimit();
        prepareNormalCapture();
        CameraCapabilities cameraCapabilities = this.mCameraCapabilities;
        this.mTotalJpegCallbackNum = CameraCapabilities.getBurstShootCount();
        this.mHandler.removeMessages(49);
        if (!is3ALocked()) {
            this.mFocusManager.onShutter();
        }
    }

    private void prepareSuperNight() {
        if (this.mModuleIndex == 173) {
            RecordState recordState = (RecordState) ModeCoordinatorImpl.getInstance().getAttachProtocol(212);
            recordState.onPrepare();
            recordState.onStart();
            this.mSuperNightDisposable = Observable.just(Integer.valueOf(300), Integer.valueOf(2000)).flatMap(new Function<Integer, ObservableSource<Integer>>() {
                public ObservableSource<Integer> apply(Integer num) throws Exception {
                    return Observable.just(num).delaySubscription((long) num.intValue(), TimeUnit.MILLISECONDS);
                }
            }).doOnDispose(new Action() {
                public void run() throws Exception {
                    Log.d(Camera2Module.TAG, "SuperNight: force trigger shutter animation, sound and post saving");
                    AndroidSchedulers.mainThread().scheduleDirect(new Runnable() {
                        public void run() {
                            try {
                                Camera2Module.this.mSuperNightEventConsumer.accept(Integer.valueOf(2000));
                            } catch (Exception e) {
                            }
                        }
                    });
                }
            }).observeOn(AndroidSchedulers.mainThread()).subscribe(this.mSuperNightEventConsumer);
        }
    }

    public void onBeautyBodySlimCountChange(final boolean z) {
        this.mHandler.post(new Runnable() {
            public void run() {
                TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
                if (topAlert != null) {
                    if (z) {
                        topAlert.alertAiDetectTipHint(0, R.string.beauty_body_slim_count_tip, FunctionParseBeautyBodySlimCount.TIP_TIME);
                    } else {
                        topAlert.alertAiDetectTipHint(8, R.string.beauty_body_slim_count_tip, 0);
                    }
                }
            }
        });
    }

    public boolean isBeautyBodySlimCountDetectStarted() {
        return this.mIsBeautyBodySlimOn;
    }

    private DualWatermarkParam getDualWaterMarkParam() {
        return new DualWatermarkParam(CameraSettings.isDualCameraWaterMarkOpen(), CameraSettings.getDualCameraWaterMarkFilePathVendor(), CameraSettings.getResourceFloat(R.dimen.dualcamera_watermark_size_ratio, 0.0f), CameraSettings.getResourceFloat(R.dimen.dualcamera_watermark_padding_x_ratio, 0.0f), CameraSettings.getResourceFloat(R.dimen.dualcamera_watermark_padding_y_ratio, 0.0f));
    }

    private static String getTiltShiftMode() {
        if (CameraSettings.isTiltShiftOn()) {
            return DataRepository.dataItemRunning().getComponentRunningTiltValue().getComponentValue(160);
        }
        return null;
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
            onSingleTapUp(i, i2, true);
            if (this.m3ALockSupported) {
                lockAEAF();
            }
            this.mMainProtocol.performHapticFeedback(0);
        }
    }

    public boolean onShutterButtonLongClick() {
        if (isDoingAction() || this.mIsImageCaptureIntent) {
            return false;
        }
        if (!CameraSettings.isBurstShootingEnable() || !ModuleManager.isCameraModule() || this.mIsImageCaptureIntent || CameraSettings.isGroupShotOn() || CameraSettings.isGradienterOn() || CameraSettings.isTiltShiftOn() || DataRepository.dataItemRunning().isSwitchOn("pref_camera_hand_night_key") || CameraSettings.isStereoModeOn() || CameraSettings.isPortraitModeBackOn() || !isBackCamera() || this.mMultiSnapStatus || this.mHandler.hasMessages(24) || this.mPendingMultiCapture || isUltraWideBackCamera() || CameraSettings.isRearMenuUltraPixelPhotographyOn()) {
            this.mLongPressedAutoFocus = true;
            this.mMainProtocol.setFocusViewType(false);
            this.mFocusManager.requestAutoFocus();
            this.mActivity.getScreenHint().updateHint();
            return false;
        }
        BackStack backStack = (BackStack) ModeCoordinatorImpl.getInstance().getAttachProtocol(171);
        if (backStack != null) {
            backStack.handleBackStackFromShutter();
        }
        if (b.gV()) {
            this.mUpdateImageTitle = true;
        }
        this.mPendingMultiCapture = true;
        this.mFocusManager.doMultiSnap(true);
        return true;
    }

    public void onShutterButtonLongClickCancel(boolean z) {
        Log.d(TAG, "onShutterButtonLongClickCancel: start");
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
        if (this.mPaused || this.isZooming || isKeptBitmapTexture() || this.mMultiSnapStatus || getCameraState() == 0 || getCameraState() == 3) {
            return true;
        }
        return (this.mCamera2Device != null && this.mCamera2Device.isCaptureBusy(true)) || isParallelQueueFull() || isInCountDown();
    }

    public boolean isBlockSnap() {
        return this.mPaused || this.isZooming || isKeptBitmapTexture() || this.mMultiSnapStatus || getCameraState() == 0 || getCameraState() == 3 || ((this.mCamera2Device != null && this.mCamera2Device.isCaptureBusy(this.mMutexModePicker.isHdr())) || isParallelQueueFull() || isInCountDown());
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
                    Camera2Module.this.playCameraSound(7);
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
                        Camera2Module.this.playCameraSound(5);
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
                        topAlert.reInitAlert(true);
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
            this.mHandler.post(new Runnable() {
                public void run() {
                    Log.d(Camera2Module.TAG, "run: hide delay number in main thread");
                    Camera2Module.this.mMainProtocol.hideDelayNumber();
                }
            });
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
        if (isSelectingCapturedResult()) {
            this.mActivity.getCameraScreenNail().releaseBitmapIfNeeded();
            hidePostCaptureAlert();
            return;
        }
        this.mActivity.setResult(0, new Intent());
        this.mActivity.finish();
    }

    public boolean isSelectingCapturedResult() {
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
        if (!isFrameAvailable()) {
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
        if (!isSelectingCapturedResult()) {
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
        if (z && CameraSettings.isCameraSoundOpen()) {
            this.mActivity.loadCameraSound(1);
            this.mActivity.loadCameraSound(0);
            this.mActivity.loadCameraSound(4);
            this.mActivity.loadCameraSound(5);
            this.mActivity.loadCameraSound(7);
        }
        if (z && this.mCamera2Device != null) {
            this.mCamera2Device.releaseFakeSurfaceIfNeed();
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
                        String access$500 = Camera2Module.TAG;
                        StringBuilder stringBuilder = new StringBuilder();
                        stringBuilder.append("Unknown error when pause LensAPI->");
                        stringBuilder.append(e.getMessage());
                        Log.d(access$500, stringBuilder.toString());
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

    public void onHostStopAndNotifyActionStop() {
        boolean z;
        super.onHostStopAndNotifyActionStop();
        if (this.mSuperNightDisposable == null || this.mSuperNightDisposable.isDisposed()) {
            z = false;
        } else {
            z = true;
            this.mSuperNightDisposable.dispose();
        }
        if (z || this.mWaitingSuperNightResult) {
            this.mWaitingSuperNightResult = false;
            RecordState recordState = (RecordState) ModeCoordinatorImpl.getInstance().getAttachProtocol(212);
            if (recordState != null) {
                recordState.onPostSavingFinish();
            }
            doLaterReleaseIfNeed();
        }
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
                if (isTextureExpired()) {
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
        if (scanQRCodeEnabled() || b.fT()) {
            PreviewDecodeManager.getInstance().quit();
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
            if (scanQRCodeEnabled() || b.fT()) {
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

    public void updatePreviewSurface() {
        if (this.mMainProtocol != null) {
            this.mMainProtocol.initEffectCropView();
        }
        checkDisplayOrientation();
        this.mSurfaceCreatedTimestamp = this.mActivity.getCameraScreenNail().getSurfaceCreatedTimestamp();
        if (this.mPreviewSize != null) {
            updateCameraScreenNailSize(this.mPreviewSize.width, this.mPreviewSize.height);
        }
        if (this.mCamera2Device != null) {
            this.mCamera2Device.updateDeferPreviewSession(new Surface(this.mActivity.getCameraScreenNail().getSurfaceTexture()));
        }
    }

    public void startPreview() {
        if (this.mCamera2Device != null) {
            Surface surface;
            this.mCamera2Device.setFocusCallback(this);
            this.mCamera2Device.setMetaDataCallback(this);
            this.mCamera2Device.setScreenLightCallback(this);
            this.mCamera2Device.setErrorCallback(this.mErrorCallback);
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("startPreview: ");
            stringBuilder.append(this.mPictureSize);
            Log.d(str, stringBuilder.toString());
            this.mCamera2Device.setPictureSize(this.mPictureSize);
            if (this.mEnableParallelSession) {
                this.mCamera2Device.setSubPictureSize(getSubPictureSize(35, isFrontCamera()));
            }
            if (this.mEnableParallelSession && isEnableQcfa()) {
                Log.d(TAG, "[QCFA] startPreview: set qcfa enable");
                this.mCamera2Device.setQcfaEnable(true);
            } else {
                Log.d(TAG, "[QCFA] startPreview: set qcfa disable");
                this.mCamera2Device.setQcfaEnable(false);
            }
            this.mSurfaceCreatedTimestamp = this.mActivity.getCameraScreenNail().getSurfaceCreatedTimestamp();
            boolean scanQRCodeEnabled = scanQRCodeEnabled();
            if (scanQRCodeEnabled) {
                PreviewDecodeManager.getInstance().init(this.mBogusCameraId, 0);
            }
            boolean z = b.fT() && isFrontCamera() && (this.mModuleIndex == 163 || this.mModuleIndex == 171);
            if (z) {
                PreviewDecodeManager.getInstance().init(this.mBogusCameraId, 1);
            }
            boolean z2 = scanQRCodeEnabled || z;
            SurfaceTexture surfaceTexture = this.mActivity.getCameraScreenNail().getSurfaceTexture();
            if (surfaceTexture != null) {
                surface = new Surface(surfaceTexture);
            } else {
                surface = null;
            }
            this.mCamera2Device.startPreviewSession(surface, z2, isNeedRawStream(), getOperatingMode(), this.mEnableParallelSession, this, PreviewDecodeManager.getInstance().getHandler());
        }
    }

    private void configParallelSession() {
        StringBuilder stringBuilder;
        GraphDescriptorBean graphDescriptorBean;
        if (isPortraitMode()) {
            int i;
            if (isDualFrontCamera() || isDualCamera()) {
                i = 2;
            } else {
                i = 1;
            }
            String str = TAG;
            stringBuilder = new StringBuilder();
            stringBuilder.append("configParallelSession: inputStreamNum = ");
            stringBuilder.append(i);
            Log.d(str, stringBuilder.toString());
            graphDescriptorBean = new GraphDescriptorBean(32770, i, true, CameraDeviceUtil.getCameraCombinationMode(this.mActualCameraId));
        } else {
            graphDescriptorBean = new GraphDescriptorBean(0, 1, true, CameraDeviceUtil.getCameraCombinationMode(this.mActualCameraId));
        }
        String str2 = TAG;
        stringBuilder = new StringBuilder();
        stringBuilder.append("[QCFA] configParallelSession: mPictureSize = ");
        stringBuilder.append(this.mPictureSize);
        Log.d(str2, stringBuilder.toString());
        str2 = TAG;
        stringBuilder = new StringBuilder();
        stringBuilder.append("[QCFA] configParallelSession: mOutPutSize = ");
        stringBuilder.append(this.mOutPutSize);
        Log.d(str2, stringBuilder.toString());
        BufferFormat bufferFormat = new BufferFormat(this.mPictureSize.width, this.mPictureSize.height, 35, graphDescriptorBean);
        LocalBinder localBinder = AlgoConnector.getInstance().getLocalBinder(true);
        localBinder.configCaptureSession(bufferFormat);
        localBinder.setImageSaver(this.mActivity.getImageSaver());
        localBinder.setJpegOutputSize(this.mOutPutSize.width, this.mOutPutSize.height);
    }

    private boolean isNeedRawStream() {
        if (ModuleManager.isManualModule() && CameraSettings.isEnableDNG()) {
            for (CameraSize cameraSize : this.mCameraCapabilities.getSupportedOutputSize(37)) {
                if (cameraSize.width == this.mPictureSize.width && cameraSize.height == this.mPictureSize.height) {
                    return true;
                }
            }
        }
        return false;
    }

    private boolean isEnableQcfa() {
        return this.mCameraCapabilities.isSupportedQcfa() && isFrontCamera() && (getModuleIndex() == 163 || getModuleIndex() == 165);
    }

    protected int getOperatingMode() {
        if (!isParallelSessionEnable()) {
            int i = 32769;
            int i2;
            if (isFrontCamera()) {
                mIsBeautyFrontOn = BeautyParameters.isFaceBeautyOn();
                if (isPortraitMode() && DataRepository.dataItemFeature().fb()) {
                    if (!isBokehFrontCamera()) {
                        i2 = 33009;
                        i = i2;
                        i = 32775;
                    }
                } else if (!(isPortraitMode() && isBokehFrontCamera())) {
                    if (!this.mCameraCapabilities.isSupportedQcfa() || mIsBeautyFrontOn || !"off".equals(DataRepository.dataItemConfig().getComponentHdr().getComponentValue(this.mModuleIndex)) || DataRepository.dataItemFeature().fS() > 0) {
                        i2 = 32773;
                        i = i2;
                        if (this.mModuleIndex == 163 && CameraSettings.isFrontMenuUltraPixelPhotographyOn() && CameraSettings.isFrontSupportedUltraPixelPhotography(this.mCameraCapabilities)) {
                            i = 32775;
                        }
                    } else {
                        i = 32775;
                        i = 32775;
                    }
                }
                i = 32770;
                i = 32775;
            } else {
                i2 = getModuleIndex();
                if (i2 != 163) {
                    if (i2 == 167) {
                        i = (CameraSettings.isUltraPixelPhotographyOn() && CameraSettings.isSupportedUltraPixelPhotography(this.mCameraCapabilities)) ? CameraCapabilities.SESSION_OPERATION_MODE_PROFESSIONAL_ULTRA_PIXEL_PHOTOGRAPHY : 32771;
                    } else if (i2 == 171) {
                        i = 32770;
                    } else if (i2 == 173) {
                        i = CameraCapabilities.SESSION_OPERATION_MODE_SUPER_NIGHT;
                    }
                } else if (CameraSettings.isRearMenuUltraPixelPhotographyOn() && CameraSettings.isSupportedUltraPixelPhotography(this.mCameraCapabilities)) {
                    i = CameraCapabilities.SESSION_OPERATION_MODE_NORMAL_ULTRA_PIXEL_PHOTOGRAPHY;
                }
            }
            this.mOperatingMode = i;
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("getOperatingMode: ");
            stringBuilder.append(String.format("operatingMode = 0x%x", new Object[]{Integer.valueOf(i)}));
            Log.d(str, stringBuilder.toString());
            return i;
        } else if (isEnableQcfa()) {
            Log.d(TAG, "getOperatingMode: SESSION_OPERATION_MODE_ALGO_UP_QCFA");
            return CameraCapabilities.SESSION_OPERATION_MODE_ALGO_UP_QCFA;
        } else if (171 != getModuleIndex()) {
            Log.d(TAG, "getOperatingMode: SESSION_OPERATION_MODE_ALGO_UP_SAT");
            return CameraCapabilities.SESSION_OPERATION_MODE_ALGO_UP_SAT;
        } else if (!isFrontCamera() || isDualFrontCamera()) {
            Log.d(TAG, "getOperatingMode: SESSION_OPERATION_MODE_ALGO_UP_DUAL_BOKEH");
            return 36864;
        } else {
            Log.d(TAG, "getOperatingMode: SESSION_OPERATION_MODE_ALGO_UP_SINGLE_BOKEH");
            return CameraCapabilities.SESSION_OPERATION_MODE_ALGO_UP_SINGLE_BOKEH;
        }
    }

    public void onPreviewSessionSuccess(CameraCaptureSession cameraCaptureSession) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("onPreviewSessionSuccess: ");
        stringBuilder.append(Thread.currentThread().getName());
        Log.d(str, stringBuilder.toString());
        if (cameraCaptureSession != null && isAlive()) {
            if (!isKeptBitmapTexture()) {
                this.mHandler.sendEmptyMessage(9);
            }
            if (this.mEnableParallelSession) {
                configParallelSession();
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
        if (isTextureExpired() && retryOnceIfCameraError(this.mHandler)) {
            Log.d(TAG, "sessionFailed due to surfaceTexture expired, retry");
        } else {
            this.mHandler.sendEmptyMessage(51);
        }
    }

    public void onPreviewSessionClosed(CameraCaptureSession cameraCaptureSession) {
        Log.d(TAG, "onPreviewSessionClosed: ");
        setCameraState(0);
    }

    public void onFocusStateChanged(FocusTask focusTask) {
        if (isFrameAvailable()) {
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
        this.mBlockQuickShot = CameraSettings.isCameraQuickShotEnable() ^ 1;
    }

    private void resumePreviewInWorkThread() {
        updatePreferenceInWorkThread(new int[0]);
    }

    private boolean isParallelQueueFull() {
        boolean z = false;
        if (!this.mIsCurrentTaskIsParallel) {
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
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("isParallelQueueFull: isNeedWaitProcess:");
        stringBuilder.append(z);
        Log.w(str, stringBuilder.toString());
        return z;
    }

    private void beginParallelProcess(ParallelTaskData parallelTaskData, boolean z) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("algo begin: ");
        stringBuilder.append(parallelTaskData.getSavePath());
        stringBuilder.append(" | ");
        stringBuilder.append(Thread.currentThread().getName());
        Log.i(str, stringBuilder.toString());
        if (z && DbRepository.dbItemSaveTask().getItemByPath(parallelTaskData.getSavePath()) == null) {
            SaveTask saveTask = (SaveTask) DbRepository.dbItemSaveTask().generateItem(parallelTaskData.getTimestamp());
            saveTask.setPath(parallelTaskData.getSavePath());
            DbRepository.dbItemSaveTask().endItemAndInsert(saveTask, 0);
            String str2 = TAG;
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("beginParallelProcess endItemAndInsert end getSavePath:");
            stringBuilder2.append(parallelTaskData.getSavePath());
            Log.d(str2, stringBuilder2.toString());
        }
        if (this.mServiceStatusListener == null) {
            this.mServiceStatusListener = new ServiceStatusListener() {
                public void onImagePostProcessStart(ParallelTaskData parallelTaskData) {
                    if (!Camera2Module.this.mMultiSnapStatus) {
                        Camera2Module.this.onPictureTakenFinished(true);
                    }
                    PerformanceTracker.trackPictureCapture(1);
                    String access$500 = Camera2Module.TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("onImagePostProcessStart: ");
                    stringBuilder.append(parallelTaskData);
                    Log.d(access$500, stringBuilder.toString());
                    if (Camera2Module.this.mCamera2Device != null) {
                        Camera2Module.this.mCamera2Device.onParallelImagePostProcStart();
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
        if (this.mIsCurrentTaskIsParallel) {
            return true;
        }
        if (this.mIsPortraitLightingOn) {
            return false;
        }
        if (CameraSettings.isLiveShotOn()) {
            return true;
        }
        if (CameraSettings.isGradienterOn()) {
            return false;
        }
        if (CameraSettings.isPortraitModeBackOn()) {
            return true;
        }
        if (this.mModuleIndex == 167 || this.mModuleIndex == 173 || CameraSettings.showGenderAge() || CameraSettings.isMagicMirrorOn()) {
            return false;
        }
        if ((this.mCameraCapabilities != null && CameraSettings.isSupportedUltraPixelPhotography(this.mCameraCapabilities) && CameraSettings.isRearMenuUltraPixelPhotographyOn()) || CameraSettings.isFrontMenuUltraPixelPhotographyOn()) {
            return false;
        }
        if (this.mCamera2Device != null && this.mCamera2Device.isNeedPreviewThumbnail()) {
            z = true;
        }
        return z;
    }

    public void onPreviewPixelsRead(byte[] bArr, int i, int i2) {
        Object bitmapData;
        animateCapture();
        playCameraSound(0);
        Bitmap createBitmap = Bitmap.createBitmap(i, i2, Config.ARGB_8888);
        createBitmap.copyPixelsFromBuffer(ByteBuffer.wrap(bArr));
        boolean z = isFrontCamera() && !isFrontMirror();
        if (this.mIsCurrentTaskIsParallel) {
            if (z) {
                createBitmap = Util.flipBitmap(createBitmap);
                z = false;
            }
            bitmapData = Util.getBitmapData(createBitmap);
        } else {
            bitmapData = null;
        }
        int i3 = this.mShootOrientation - this.mDisplayRotation;
        if (isFrontCamera() && b.hL() && i3 % 180 == 0) {
            i3 = 0;
        }
        if (isAlive() && isDeviceAlive()) {
            Thumbnail createThumbnail = Thumbnail.createThumbnail(null, createBitmap, i3, z);
            createThumbnail.startWaitingForUri();
            this.mActivity.getThumbnailUpdater().setThumbnail(createThumbnail, true, true);
            this.mCamera2Device.onPreviewThumbnailReceived(createThumbnail);
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("onPreviewPixelsRead: ");
            stringBuilder.append(bitmapData);
            stringBuilder.append("--");
            stringBuilder.append(this.mIsCurrentTaskIsParallel);
            Log.d(str, stringBuilder.toString());
            if (bitmapData != null && this.mIsCurrentTaskIsParallel) {
                str = this.mCamera2Device.getParallelShotSavePath();
                ParallelTaskData parallelTaskData = new ParallelTaskData(System.currentTimeMillis(), -1, str);
                parallelTaskData.fillJpegData(bitmapData, 0);
                if (DbRepository.dbItemSaveTask().getItemByPath(str) == null) {
                    SaveTask saveTask = (SaveTask) DbRepository.dbItemSaveTask().generateItem(parallelTaskData.getTimestamp());
                    saveTask.setPath(parallelTaskData.getSavePath());
                    DbRepository.dbItemSaveTask().endItemAndInsert(saveTask, 0);
                    String str2 = TAG;
                    StringBuilder stringBuilder2 = new StringBuilder();
                    stringBuilder2.append("onPreviewPixelsRead endItemAndInsert end getSavePath:");
                    stringBuilder2.append(str);
                    Log.d(str2, stringBuilder2.toString());
                }
                this.mActivity.getImageSaver().onParallelProcessFinish(parallelTaskData);
            }
        }
    }

    public void onSurfaceTextureUpdated(DrawExtTexAttribute drawExtTexAttribute) {
        if (this.mCircularMediaRecorder != null) {
            this.mCircularMediaRecorder.onSurfaceTextureUpdated(drawExtTexAttribute);
        }
        if (this.mQuickShotAnimateEnable && this.mCamera2Device != null) {
            this.mCamera2Device.onPreviewComing();
        }
    }

    public void onSurfaceTextureReleased() {
        Log.d(TAG, "onSurfaceTextureReleased: no further preview frame will be available");
    }

    protected boolean isAutoRestartInNonZSL() {
        return false;
    }

    private void updateAlgorithmName() {
        String str;
        if (b.ic()) {
            str = null;
        } else if (this.mCamera2Device.isBokehEnabled()) {
            if (DataRepository.dataItemFeature().fO() > 0) {
                str = Util.ALGORITHM_NAME_SOFT_PORTRAIT_ENCRYPTED;
            } else {
                str = Util.ALGORITHM_NAME_SOFT_PORTRAIT;
            }
        } else if (isPortraitMode()) {
            str = "portrait";
        } else {
            str = this.mMutexModePicker.getAlgorithmName();
        }
        this.mAlgorithmName = str;
    }

    /* JADX WARNING: Removed duplicated region for block: B:25:0x007c  */
    /* JADX WARNING: Removed duplicated region for block: B:24:0x0077  */
    /* JADX WARNING: Removed duplicated region for block: B:29:0x00bd  */
    /* JADX WARNING: Removed duplicated region for block: B:28:0x00bb  */
    /* JADX WARNING: Removed duplicated region for block: B:38:0x00f1  */
    /* JADX WARNING: Removed duplicated region for block: B:46:0x0188  */
    /* JADX WARNING: Removed duplicated region for block: B:49:0x0191  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public ParallelTaskData onCaptureStart(ParallelTaskData parallelTaskData, CameraSize cameraSize) {
        String str = null;
        if (isDeparted()) {
            Log.w(TAG, "onCaptureStart: departed");
            return null;
        }
        List arrayList;
        String str2;
        StringBuilder stringBuilder;
        Size toSizeObject;
        boolean z;
        Builder jpegRotation;
        float f;
        String str3;
        StringBuilder stringBuilder2;
        if (CameraSettings.isLiveShotOn()) {
            startLiveShotAnimation();
        }
        if (!this.mQuickShotAnimateEnable || (CameraSettings.isGroupShotOn() && !isParallelSessionEnable())) {
            onShutter();
        }
        if (CameraSettings.isAgeGenderAndMagicMirrorWaterOpen()) {
            Collection faceWaterMarkInfos = ((MainContentProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(166)).getFaceWaterMarkInfos();
            if (!(faceWaterMarkInfos == null || faceWaterMarkInfos.isEmpty())) {
                arrayList = new ArrayList(faceWaterMarkInfos);
                str2 = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("onCaptureStart: ");
                stringBuilder.append(cameraSize.width);
                stringBuilder.append("x");
                stringBuilder.append(cameraSize.height);
                Log.d(str2, stringBuilder.toString());
                if (this.mOutPutSize != null) {
                    toSizeObject = cameraSize.toSizeObject();
                } else {
                    toSizeObject = this.mOutPutSize.toSizeObject();
                }
                z = false;
                jpegRotation = new Builder(this.mPreviewSize.toSizeObject(), cameraSize.toSizeObject(), toSizeObject).setHasDualWaterMark(CameraSettings.isDualCameraWaterMarkOpen()).setMirror(isFrontMirror()).setLightingPattern(CameraSettings.getPortraitLightingPattern()).setFilterId(EffectController.getInstance().getEffectForSaving(false)).setOrientation(-1 != this.mOrientation ? 0 : this.mOrientation).setJpegRotation(this.mJpegRotation);
                f = (CameraSettings.isGradienterOn() || this.mShootRotation != -1.0f) ? this.mShootRotation : 0.0f;
                jpegRotation = jpegRotation.setShootRotation(f).setShootOrientation(this.mShootOrientation).setLocation(this.mLocation);
                if (CameraSettings.isTimeWaterMarkOpen()) {
                    str = Util.getTimeWatermark();
                }
                parallelTaskData.fillParameter(jpegRotation.setTimeWaterMarkString(str).setFaceWaterMarkList(arrayList).setAgeGenderAndMagicMirrorWater(CameraSettings.isAgeGenderAndMagicMirrorWaterOpen()).setFrontCamera(isFrontCamera()).setBokehFrontCamera(isBokehFrontCamera()).setAlgorithmName(this.mAlgorithmName).setPictureInfo(getPictureInfo()).setSuffix(getSuffix()).setGradienterOn(this.mIsGradienterOn).setTiltShiftMode(getTiltShiftMode()).setSaveGroupshotPrimitive(CameraSettings.isSaveGroushotPrimitiveOn()).setDualWatermarkParam(getDualWaterMarkParam()).setJpegQuality(BaseModule.getJpegQuality(false)).build());
                if (!(this.mQuickShotAnimateEnable || this.mEnabledPreviewThumbnail)) {
                    z = true;
                }
                parallelTaskData.setNeedThumbnail(z);
                parallelTaskData.setCurrentModuleIndex(this.mModuleIndex);
                str3 = TAG;
                stringBuilder2 = new StringBuilder();
                stringBuilder2.append("onCaptureStart: ");
                stringBuilder2.append(this.mIsCurrentTaskIsParallel);
                Log.d(str3, stringBuilder2.toString());
                if (this.mIsCurrentTaskIsParallel) {
                    beginParallelProcess(parallelTaskData, true);
                }
                if (CameraSettings.isHandGestureOpen()) {
                    Log.d(TAG, "send msg: reset hand gesture");
                    this.mHandler.removeMessages(57);
                    this.mHandler.sendEmptyMessageDelayed(57, 0);
                }
                return parallelTaskData;
            }
        }
        arrayList = null;
        str2 = TAG;
        stringBuilder = new StringBuilder();
        stringBuilder.append("onCaptureStart: ");
        stringBuilder.append(cameraSize.width);
        stringBuilder.append("x");
        stringBuilder.append(cameraSize.height);
        Log.d(str2, stringBuilder.toString());
        if (this.mOutPutSize != null) {
        }
        z = false;
        if (-1 != this.mOrientation) {
        }
        jpegRotation = new Builder(this.mPreviewSize.toSizeObject(), cameraSize.toSizeObject(), toSizeObject).setHasDualWaterMark(CameraSettings.isDualCameraWaterMarkOpen()).setMirror(isFrontMirror()).setLightingPattern(CameraSettings.getPortraitLightingPattern()).setFilterId(EffectController.getInstance().getEffectForSaving(false)).setOrientation(-1 != this.mOrientation ? 0 : this.mOrientation).setJpegRotation(this.mJpegRotation);
        if (CameraSettings.isGradienterOn()) {
        }
        jpegRotation = jpegRotation.setShootRotation(f).setShootOrientation(this.mShootOrientation).setLocation(this.mLocation);
        if (CameraSettings.isTimeWaterMarkOpen()) {
        }
        parallelTaskData.fillParameter(jpegRotation.setTimeWaterMarkString(str).setFaceWaterMarkList(arrayList).setAgeGenderAndMagicMirrorWater(CameraSettings.isAgeGenderAndMagicMirrorWaterOpen()).setFrontCamera(isFrontCamera()).setBokehFrontCamera(isBokehFrontCamera()).setAlgorithmName(this.mAlgorithmName).setPictureInfo(getPictureInfo()).setSuffix(getSuffix()).setGradienterOn(this.mIsGradienterOn).setTiltShiftMode(getTiltShiftMode()).setSaveGroupshotPrimitive(CameraSettings.isSaveGroushotPrimitiveOn()).setDualWatermarkParam(getDualWaterMarkParam()).setJpegQuality(BaseModule.getJpegQuality(false)).build());
        z = true;
        parallelTaskData.setNeedThumbnail(z);
        parallelTaskData.setCurrentModuleIndex(this.mModuleIndex);
        str3 = TAG;
        stringBuilder2 = new StringBuilder();
        stringBuilder2.append("onCaptureStart: ");
        stringBuilder2.append(this.mIsCurrentTaskIsParallel);
        Log.d(str3, stringBuilder2.toString());
        if (this.mIsCurrentTaskIsParallel) {
        }
        if (CameraSettings.isHandGestureOpen()) {
        }
        return parallelTaskData;
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
            if (this.mIsCurrentTaskIsParallel || (this.mQuickShotAnimateEnable && this.mModuleIndex != 173)) {
                this.mEnabledPreviewThumbnail = true;
                this.mActivity.getCameraScreenNail().requestReadPixels();
            } else if (this.mReceivedJpegCallbackNum == 0) {
                if (enablePreviewAsThumbnail()) {
                    this.mEnabledPreviewThumbnail = true;
                    this.mActivity.getCameraScreenNail().requestReadPixels();
                } else if (this.mModuleIndex != 173) {
                    updateThumbProgress(false);
                    animateCapture();
                    playCameraSound(0);
                }
            }
        }
    }

    public void onCaptureShutter() {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("onCaptureShutter getCameraState():");
        stringBuilder.append(getCameraState());
        stringBuilder.append(", mIsCurrentTaskIsParallel:");
        stringBuilder.append(this.mIsCurrentTaskIsParallel);
        Log.d(str, stringBuilder.toString());
        onShutter();
    }

    public boolean onPictureTakenImageConsumed(Image image) {
        return false;
    }

    public void onPictureTaken(byte[] bArr) {
    }

    public void onPictureTakenFinished(boolean z) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("onPictureTakenFinished: succeed = ");
        stringBuilder.append(z);
        Log.d(str, stringBuilder.toString());
        if (z) {
            trackGeneralInfo(1, false);
            trackPictureTaken(1, false, this.mLocation != null, getCurrentAiSceneName(), this.mEnteringMoonMode, this.mIsMoonMode);
            long currentTimeMillis = System.currentTimeMillis() - this.mCaptureStartTime;
            CameraStatUtil.trackTakePictureCost(currentTimeMillis, isFrontCamera(), this.mModuleIndex);
            if (this.mModuleIndex == 171 && DataRepository.dataItemFeature().isSupportBokehAdjust()) {
                CameraStatUtil.trackBokehTaken();
            }
            ScenarioTrackUtil.trackCaptureTimeEnd();
            String str2 = TAG;
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("mCaptureStartTime(from onShutterButtonClick start to jpegCallback finished) = ");
            stringBuilder2.append(currentTimeMillis);
            stringBuilder2.append("ms");
            Log.d(str2, stringBuilder2.toString());
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
        this.mReceivedJpegCallbackNum++;
        if (!isKeptBitmapTexture() && !this.mMultiSnapStatus && this.mBlockQuickShot && (!CameraSettings.isGroupShotOn() || (CameraSettings.isGroupShotOn() && z))) {
            setCameraState(1);
            enableCameraControls(true);
            this.mBlockQuickShot = false;
        }
        this.mHandler.removeMessages(50);
        if (this.mModuleIndex == 173) {
            this.mWaitingSuperNightResult = false;
            if (!(this.mSuperNightDisposable == null || this.mSuperNightDisposable.isDisposed())) {
                this.mSuperNightDisposable.dispose();
            }
            Completable.fromAction(new Action() {
                public void run() {
                    RecordState recordState = (RecordState) ModeCoordinatorImpl.getInstance().getAttachProtocol(212);
                    if (recordState != null) {
                        recordState.onPostSavingFinish();
                    }
                }
            }).subscribeOn(AndroidSchedulers.mainThread()).subscribe();
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
                this.mActivity.setResult(-1, new Intent("inline-data").putExtra("data", Util.rotate(Util.makeBitmap(storedJpegData, 51200), Exif.getOrientation(storedJpegData))));
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
        if (this.mEnableParallelSession && isPortraitMode()) {
            Util.saveCameraCalibrationToFile(this.mCameraCapabilities.getCameraCalibrationData(), getCalibrationDataFileName(this.mActualCameraId));
        }
        if (!isKeptBitmapTexture()) {
            startPreview();
        }
        initMetaParser();
        if (b.gO()) {
            initAiSceneParser();
        }
        this.mOnResumeTime = SystemClock.uptimeMillis();
        this.mHandler.sendEmptyMessage(4);
        this.mHandler.sendEmptyMessage(31);
    }

    private String getCalibrationDataFileName(int i) {
        if (isFrontCamera()) {
            return "front_dual_camera_caldata.bin";
        }
        if (i == Camera2DataContainer.getInstance().getUltraWideBokehCameraId()) {
            return "back_dual_camera_caldata_wu.bin";
        }
        return "back_dual_camera_caldata.bin";
    }

    public void initializeCapabilities() {
        super.initializeCapabilities();
        this.mContinuousFocusSupported = Util.isSupported(4, this.mCameraCapabilities.getSupportedFocusModes());
        this.mMaxFaceCount = this.mCameraCapabilities.getMaxFaceCount();
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
                case 50:
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
                    updateDecodePreview();
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

    /* JADX WARNING: Removed duplicated region for block: B:17:0x003a  */
    /* JADX WARNING: Removed duplicated region for block: B:13:0x0032  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void updateShotDetermine() {
        boolean fb;
        int i;
        String str;
        StringBuilder stringBuilder;
        int i2;
        boolean z = false;
        if (this.mModuleIndex == 171) {
            if (!isBackCamera()) {
                fb = DataRepository.dataItemFeature().fb();
            } else if (b.hV() || DataRepository.dataItemFeature().fa()) {
                fb = true;
            }
            i = 8;
            if (this.mIsImageCaptureIntent) {
                this.mEnableParallelSession = false;
                int i3 = this.mModuleIndex;
                if (i3 == 163 || i3 == 165) {
                    this.mEnableParallelSession = isParallelSessionEnable();
                    if (!this.mEnableParallelSession) {
                        i = CameraSettings.isLiveShotOn();
                    } else if (!shouldDoMultiFrameCapture()) {
                        i = 5;
                    }
                    str = TAG;
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("enableParallel=");
                    stringBuilder.append(this.mEnableParallelSession);
                    stringBuilder.append(" shotType=");
                    stringBuilder.append(i);
                    Log.d(str, stringBuilder.toString());
                    this.mCamera2Device.setShotType(i);
                    this.mIsCurrentTaskIsParallel = Constants.isParallelEnabled(i);
                } else if (i3 == 171) {
                    this.mEnableParallelSession = isParallelSessionEnable();
                    if (!this.mEnableParallelSession) {
                        if (fb) {
                            z = true;
                        }
                        i = z;
                    } else if (!shouldDoMultiFrameCapture()) {
                        if (isDualFrontCamera() || isDualCamera()) {
                            if (fb) {
                                i2 = 6;
                            }
                        } else if (fb) {
                            i2 = 7;
                        }
                        i = 5;
                    }
                    str = TAG;
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("enableParallel=");
                    stringBuilder.append(this.mEnableParallelSession);
                    stringBuilder.append(" shotType=");
                    stringBuilder.append(i);
                    Log.d(str, stringBuilder.toString());
                    this.mCamera2Device.setShotType(i);
                    this.mIsCurrentTaskIsParallel = Constants.isParallelEnabled(i);
                } else {
                    return;
                }
            } else if (fb) {
                i2 = -3;
            } else {
                i2 = -2;
            }
            i = i2;
            str = TAG;
            stringBuilder = new StringBuilder();
            stringBuilder.append("enableParallel=");
            stringBuilder.append(this.mEnableParallelSession);
            stringBuilder.append(" shotType=");
            stringBuilder.append(i);
            Log.d(str, stringBuilder.toString());
            this.mCamera2Device.setShotType(i);
            this.mIsCurrentTaskIsParallel = Constants.isParallelEnabled(i);
        }
        fb = false;
        i = 8;
        if (this.mIsImageCaptureIntent) {
        }
        i = i2;
        str = TAG;
        stringBuilder = new StringBuilder();
        stringBuilder.append("enableParallel=");
        stringBuilder.append(this.mEnableParallelSession);
        stringBuilder.append(" shotType=");
        stringBuilder.append(i);
        Log.d(str, stringBuilder.toString());
        this.mCamera2Device.setShotType(i);
        this.mIsCurrentTaskIsParallel = Constants.isParallelEnabled(i);
    }

    private boolean isParallelSessionEnable() {
        return (!CameraSettings.isCameraParallelProcessEnable() || getModuleIndex() == 173 || getModuleIndex() == 167 || this.mIsImageCaptureIntent) ? false : true;
    }

    private boolean shouldDoMultiFrameCapture() {
        boolean z = this.mMutexModePicker.isHdr() || this.mShouldDoMFNR || this.mMutexModePicker.isSuperResolution() || CameraSettings.isGroupShotOn();
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("shouldDoMultiFrameCapture: ");
        stringBuilder.append(z);
        Log.d(str, stringBuilder.toString());
        return z;
    }

    private void updatePictureAndPreviewSize() {
        CameraSize bestPictureSize = getBestPictureSize(this.mCameraCapabilities.getSupportedOutputSize(this.mEnableParallelSession ? 35 : 256));
        this.mPictureSize = bestPictureSize;
        this.mPreviewSize = Util.getOptimalPreviewSize(this.mModuleIndex, this.mBogusCameraId, this.mCameraCapabilities.getSupportedOutputSize(SurfaceTexture.class), (double) CameraSettings.getPreviewAspectRatio(bestPictureSize.width, bestPictureSize.height));
        this.mCamera2Device.setPreviewSize(this.mPreviewSize);
        this.mCamera2Device.setPreviewFormat(35);
        if (this.mEnableParallelSession) {
            List supportedOutputSize = this.mCameraCapabilities.getSupportedOutputSize(256);
            if (this.mModuleIndex == 165) {
                this.mOutPutSize = PictureSizeManager.getBestSquareSize(supportedOutputSize);
                if (this.mOutPutSize.getWidth() == 0) {
                    int i = bestPictureSize.width > bestPictureSize.height ? bestPictureSize.height : bestPictureSize.width;
                    throw new RuntimeException(String.format(Locale.ENGLISH, "size %dx%d is not supported!", new Object[]{Integer.valueOf(i), Integer.valueOf(i)}));
                }
            }
            this.mOutPutSize = PictureSizeManager.getBestPictureSize(supportedOutputSize);
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("outputSize: ");
            stringBuilder.append(this.mOutPutSize);
            Log.v(str, stringBuilder.toString());
        }
        Log.d(TAG, String.format(Locale.ENGLISH, "updateSize: %dx%d %dx%d", new Object[]{Integer.valueOf(bestPictureSize.width), Integer.valueOf(bestPictureSize.height), Integer.valueOf(this.mPreviewSize.width), Integer.valueOf(this.mPreviewSize.height)}));
        updateCameraScreenNailSize(this.mPreviewSize.width, this.mPreviewSize.height);
        checkDisplayOrientation();
        setVideoSize(this.mPreviewSize.width, this.mPreviewSize.height);
    }

    private CameraSize getSubPictureSize(int i, boolean z) {
        int auxFrontCameraId;
        if (z) {
            auxFrontCameraId = Camera2DataContainer.getInstance().getAuxFrontCameraId();
        } else {
            auxFrontCameraId = Camera2DataContainer.getInstance().getAuxCameraId();
        }
        CameraSize maxPictureSize = getMaxPictureSize(auxFrontCameraId, i);
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(z ? "frontSubSize: " : "backSubSize: ");
        stringBuilder.append(maxPictureSize);
        Log.d(str, stringBuilder.toString());
        return maxPictureSize;
    }

    private CameraSize getMaxPictureSize(int i, int i2) {
        CameraCapabilities capabilities = Camera2DataContainer.getInstance().getCapabilities(i);
        if (capabilities != null) {
            return PictureSizeManager.getBestPictureSize(capabilities.getSupportedOutputSize(i2));
        }
        return null;
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
        if (DataRepository.dataItemFeature().fj() && CameraSettings.isBackCamera() && i == 25) {
            Log.d(TAG, "supportAi30: AI 3.0 back camera in HUMAN SCENE not apply filter!");
            return;
        }
        if (CameraSettings.isFrontCamera() || isPortraitMode()) {
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
        if (isFrontCamera() && isTriggerQcfaModeChange(false, true)) {
            this.mHandler.sendEmptyMessage(44);
        }
    }

    private void updatePortraitLighting() {
        String valueOf = String.valueOf(CameraSettings.getPortraitLightingPattern());
        this.mIsPortraitLightingOn = valueOf.equals("0") ^ 1;
        this.mCamera2Device.setPortraitLighting(Integer.parseInt(valueOf));
        setLightingEffect();
    }

    private void updateEyeLight() {
        if (isFrontCamera() && DataRepository.dataItemFeature().fw()) {
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
                            topAlert.alertTopHint(0, (int) R.string.eye_light);
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
                topAlert.disableMenuItem(194);
                if (flashModeByScene != null) {
                    topAlert.disableMenuItem(193);
                } else {
                    topAlert.enableMenuItem(193);
                }
                topAlert.hideExtraMenu();
            }
        } else if (topAlert != null) {
            topAlert.enableMenuItem(193, 194);
        }
        updatePreferenceInWorkThread(11, 10);
    }

    private void updateBeauty() {
        if (this.mModuleIndex == 163 || this.mModuleIndex == 165 || this.mModuleIndex == 171) {
            if (this.mBeautyValues == null) {
                this.mBeautyValues = new BeautyValues();
            }
            this.mBeautyValues.mBeautyLevel = CameraSettings.getFaceBeautyCloseValue();
            if (!DataRepository.dataItemConfig().getComponentConfigBeauty().isClosed(this.mModuleIndex)) {
                CameraSettings.initBeautyValues(this.mBeautyValues, b.hP());
                if (this.mCurrentAiScene == 25 && BeautyConstant.LEVEL_CLOSE.equals(this.mBeautyValues.mBeautyLevel)) {
                    this.mBeautyValues.mBeautyLevel = BeautyConstant.LEVEL_LOW;
                    Log.d(TAG, String.format(Locale.ENGLISH, "Human scene mode detected, auto set beauty level from %s to %s", new Object[]{BeautyConstant.LEVEL_CLOSE, this.mBeautyValues.mBeautyLevel}));
                }
            }
            if (DataRepository.dataItemFeature().isSupportBeautyBody()) {
                CameraSettings.initBeautyBody(this.mBeautyValues);
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
        String focusMode;
        if (this.mIsMoonMode) {
            focusMode = this.mFocusManager.setFocusMode("manual");
        } else {
            focusMode = this.mFocusManager.setFocusMode(CameraSettings.getFocusMode());
        }
        setFocusMode(focusMode);
        if (CameraSettings.isFocusModeSwitching() && isBackCamera()) {
            CameraSettings.setFocusModeSwitching(false);
            this.mFocusManager.resetFocusStateIfNeeded();
        }
        if (focusMode.equals("manual")) {
            float minimumFocusDistance = (this.mCameraCapabilities.getMinimumFocusDistance() * ((float) CameraSettings.getFocusPosition())) / 1000.0f;
            if (this.mIsMoonMode) {
                minimumFocusDistance = 0.0f;
            }
            this.mCamera2Device.setFocusDistance(minimumFocusDistance);
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
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void updateFace() {
        boolean z;
        boolean z2;
        if (this.mMultiSnapStatus || this.mMutexModePicker.isUbiFocus()) {
            z = false;
        } else if (CameraSettings.isMagicMirrorOn() || CameraSettings.isPortraitModeBackOn() || CameraSettings.isGroupShotOn() || CameraSettings.showGenderAge()) {
            z = true;
            z2 = z;
            if (this.mMainProtocol != null) {
                MainContentProtocol mainContentProtocol = this.mMainProtocol;
                z2 = (z && z2) ? false : true;
                mainContentProtocol.setSkipDrawFace(z2);
            }
            if (z) {
                if (!this.mFaceDetectionEnabled) {
                    this.mFaceDetectionEnabled = true;
                    startFaceDetection();
                    return;
                }
                return;
            } else if (this.mFaceDetectionEnabled) {
                stopFaceDetection(true);
                this.mFaceDetectionEnabled = false;
                return;
            } else {
                return;
            }
        } else {
            z = DataRepository.dataItemGlobal().getBoolean(CameraSettings.KEY_FACE_DETECTION, getResources().getBoolean(R.bool.pref_camera_facedetection_default));
            if (CameraSettings.isGradienterOn() || CameraSettings.isTiltShiftOn()) {
                z2 = false;
                if (this.mMainProtocol != null) {
                }
                if (z) {
                }
            }
        }
        z2 = true;
        if (this.mMainProtocol != null) {
        }
        if (z) {
        }
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

    private boolean enableFrontMFNR() {
        return b.hW() && (this.mOperatingMode == 32773 || (DataRepository.dataItemFeature().gb() && this.mOperatingMode == CameraCapabilities.SESSION_OPERATION_MODE_ALGO_UP_QCFA));
    }

    private void updateMfnr(boolean z) {
        boolean z2 = false;
        if (!isUseSwMfnr() && z && this.mModuleIndex != 167 && ((!b.qT || isDualCamera()) && this.mMutexModePicker.isNormal() && !CameraSettings.isGroupShotOn() && ((!isFrontCamera() || enableFrontMFNR()) && (DataRepository.dataItemFeature().eW() || this.mZoomValue == 1.0f || isUltraWideBackCamera())))) {
            z2 = true;
        }
        if (this.mCamera2Device != null) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("setMfnr to ");
            stringBuilder.append(z2);
            Log.d(str, stringBuilder.toString());
            this.mCamera2Device.setMfnr(z2);
        }
    }

    private boolean isUseSwMfnr() {
        boolean z = false;
        if (CameraSettings.isGroupShotOn()) {
            Log.d(TAG, "GroupShot is on");
            return false;
        } else if (isUltraWideBackCamera()) {
            Log.d(TAG, "SwMfnr force off for ultra wide camera");
            return false;
        } else {
            boolean isMfnrSatEnable = CameraSettings.isMfnrSatEnable();
            if (isMfnrSatEnable) {
                boolean eY = DataRepository.dataItemFeature().eY();
                if (!eY) {
                    Log.d(TAG, "SwMfnr is not supported");
                    return false;
                } else if (!this.mMutexModePicker.isNormal()) {
                    Log.d(TAG, "Mutex mode is not normal");
                    return false;
                } else if (!DataRepository.dataItemFeature().eZ() || this.mModuleIndex == 167 || this.mModuleIndex == 173) {
                    if (isFrontCamera() && !isDualFrontCamera() && b.hW() && (this.mOperatingMode == 32773 || Util.UI_DEBUG())) {
                        z = true;
                    }
                    String str = TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("isUseSwMfnr: supportSwMfnr = ");
                    stringBuilder.append(eY);
                    stringBuilder.append(", isFrontCamera = ");
                    stringBuilder.append(isFrontCamera());
                    stringBuilder.append(", isMfnrEnabled = ");
                    stringBuilder.append(isMfnrSatEnable);
                    stringBuilder.append(", result = ");
                    stringBuilder.append(z);
                    Log.d(str, stringBuilder.toString());
                    return z;
                } else {
                    Log.d(TAG, "For the devices does not have hardware MFNR, use software MFNR");
                    return true;
                }
            }
            Log.d(TAG, "Mfnr not enabled");
            return false;
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
        if (!isFrontCamera() && this.mModuleIndex != 173) {
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
                } else if (CameraSettings.isGroupShotOn()) {
                    if (this.mMutexModePicker.isSuperResolution()) {
                        this.mMutexModePicker.resetMutexMode();
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
            if (b.id()) {
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
        if (!CameraSettings.shouldNormalWideLDCBeVisibleInMode(this.mModuleIndex) || this.mActualCameraId == Camera2DataContainer.getInstance().getUltraWideCameraId() || CameraSettings.isRearMenuUltraPixelPhotographyOn() || CameraSettings.isUltraPixelPhotographyOn()) {
            return false;
        }
        return CameraSettings.isNormalWideLDCEnabled();
    }

    private void updateUltraWideLDC() {
        this.mCamera2Device.setUltraWideLDC(shouldApplyUltraWideLDC());
    }

    private boolean shouldApplyUltraWideLDC() {
        if (CameraSettings.shouldUltraWideLDCBeVisibleInMode(this.mModuleIndex) && this.mActualCameraId == Camera2DataContainer.getInstance().getUltraWideCameraId()) {
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

    private void updateDecodePreview() {
        if (scanQRCodeEnabled() || b.fT()) {
            if (scanQRCodeEnabled()) {
                PreviewDecodeManager.getInstance().setPreviewSize(this.mPreviewSize.width, this.mPreviewSize.height);
            }
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("updateDecodePreview: PreviewDecodeManager mPreviewSize = ");
            stringBuilder.append(this.mPreviewSize);
            Log.d(str, stringBuilder.toString());
            this.mCamera2Device.startPreviewCallback(PreviewDecodeManager.getInstance().getPreviewCallback());
            PreviewDecodeManager.getInstance().startDecode();
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
        if (this.mMultiSnapStatus || this.mModuleIndex == 165 || CameraSettings.isGradienterOn() || CameraSettings.getShaderEffect() != FilterInfo.FILTER_ID_NONE || this.mHasAiSceneFilterEffect || CameraSettings.isTiltShiftOn() || DataRepository.dataItemFeature().fg()) {
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

    /* JADX WARNING: Missing block: B:52:0x0115, code:
            return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void onSingleTapUp(int i, int i2, boolean z) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("onSingleTapUp mPaused: ");
        stringBuilder.append(this.mPaused);
        stringBuilder.append("; mCamera2Device: ");
        stringBuilder.append(this.mCamera2Device);
        stringBuilder.append("; isInCountDown: ");
        stringBuilder.append(isInCountDown());
        stringBuilder.append("; getCameraState: ");
        stringBuilder.append(getCameraState());
        stringBuilder.append("; mMultiSnapStatus: ");
        stringBuilder.append(this.mMultiSnapStatus);
        stringBuilder.append("; Camera2Module: ");
        stringBuilder.append(this);
        Log.v(str, stringBuilder.toString());
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        if (!this.mPaused && this.mCamera2Device != null && this.mCamera2Device.isSessionReady() && this.mCamera2Device.isPreviewReady() && isInTapableRect(i, i2) && getCameraState() != 3 && getCameraState() != 4 && getCameraState() != 0 && !isInCountDown() && !this.mMultiSnapStatus && ((!this.mIsMoonMode || topAlert.isExtraMenuShowing()) && isFrameAvailable())) {
            if ((!isFrontCamera() || !this.mActivity.isScreenSlideOff()) && !((BackStack) ModeCoordinatorImpl.getInstance().getAttachProtocol(171)).handleBackStackFromTapDown(i, i2)) {
                tryRemoveCountDownMessage();
                if ((this.mFocusAreaSupported || this.mMeteringAreaSupported) && !this.mMutexModePicker.isUbiFocus()) {
                    if (this.mObjectTrackingStarted) {
                        stopObjectTracking(true);
                    }
                    this.mMainProtocol.setFocusViewType(true);
                    Point point = new Point(i, i2);
                    mapTapCoordinate(point);
                    unlockAEAF();
                    setCameraState(2);
                    this.mFocusManager.onSingleTapUp(point.x, point.y, z);
                    if (!this.mFocusAreaSupported && this.mMeteringAreaSupported) {
                        this.mActivity.getSensorStateManager().reset();
                    }
                }
            }
        }
    }

    private void unlockAEAF() {
        Log.d(TAG, "unlockAEAF");
        this.m3ALocked = false;
        if (this.mAeLockSupported) {
            this.mCamera2Device.unlockExposure();
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

    public void onHanGestureSwitched(boolean z) {
        if (z) {
            PreviewDecodeManager.getInstance().init(this.mBogusCameraId, 1);
            PreviewDecodeManager.getInstance().startDecode();
            return;
        }
        PreviewDecodeManager.getInstance().stopDecode(1);
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
        return (getCameraState() == 3 || this.mMutexModePicker.isUbiFocus() || CameraSettings.isStereoModeOn() || CameraSettings.isPortraitModeBackOn() || isFrontCamera() || this.mCamera2Device == null || this.mCamera2Device.isCaptureBusy(true) || CameraSettings.isRearMenuUltraPixelPhotographyOn() || CameraSettings.isUltraPixelPhotographyOn()) ? false : true;
    }

    public void onScaleEnd() {
        super.onScaleEnd();
        boolean isRearMenuUltraPixelPhotographyOn = CameraSettings.isRearMenuUltraPixelPhotographyOn();
        boolean isUltraPixelPhotographyOn = CameraSettings.isUltraPixelPhotographyOn();
        if (isRearMenuUltraPixelPhotographyOn || isUltraPixelPhotographyOn) {
            BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
            if (bottomPopupTips != null) {
                bottomPopupTips.showTips(15, R.string.zoom_no_support_tip_48M, 1);
            }
        }
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
            if (!b.isMTKPlatform() || b.gM()) {
                i = 1;
            } else {
                i = 5;
            }
            return i;
        } else if (b.gE() && ComponentConfigHdr.HDR_VALUE_LIVE.equals(str)) {
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
        if (!(this.mFocusAreaSupported || !this.mMeteringAreaSupported || this.mFocusOrAELockSupported) || 5 == focusMode || focusMode == 0) {
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
            String scanResult = PreviewDecodeManager.getInstance().getScanResult();
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
            PreviewDecodeManager.getInstance().resetScanResult();
        }
    }

    protected void sendOpenFailMessage() {
        this.mHandler.sendEmptyMessage(10);
    }

    public void onPreviewMetaDataUpdate(CaptureResult captureResult) {
        if (captureResult != null) {
            super.onPreviewMetaDataUpdate(captureResult);
            boolean z = false;
            if (DataRepository.dataItemFeature().gb()) {
                this.mShouldDoMFNR = false;
            } else {
                Integer num = (Integer) captureResult.get(CaptureResult.SENSOR_SENSITIVITY);
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onPreviewMetaDataUpdate: iso = ");
                stringBuilder.append(num);
                Log.c(str, stringBuilder.toString());
                if (num != null && num.intValue() >= 800 && isFrontCamera()) {
                    z = true;
                }
                this.mShouldDoMFNR = z;
            }
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
            if (!"1".equals(componentValue) && !ComponentConfigFlash.FLASH_VALUE_SCREEN_LIGHT_ON.equals(componentValue) && !"2".equals(componentValue)) {
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
                Log.d(TAG, "enterAsdScene(): turn off HDR as FLASH has higher priority than HDR");
                onHDRSceneChanged(false);
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
                                            if (!DataRepository.dataItemFeature().eU()) {
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
                                                case 37:
                                                    this.mCurrentAiScene = i;
                                                    break;
                                                case 35:
                                                    if (showMoonMode(false)) {
                                                        topAlert.setAiSceneImageLevel(i);
                                                        this.mCamera2Device.setASD(true);
                                                        trackAISceneChanged(this.mModuleIndex, i);
                                                        this.mCurrentAiScene = i;
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
        if (!this.mEnteringMoonMode) {
            return;
        }
        if ((this.mCurrentAiScene == 10 || this.mCurrentAiScene == 35) && i != this.mCurrentAiScene) {
            TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
            if (topAlert != null) {
                topAlert.alertMoonModeSelector(i2, false);
                if (i2 != 0) {
                    this.mEnteringMoonMode = false;
                }
            }
            updateMoon(false);
            if (this.mMutexModePicker.isSuperResolution()) {
                this.mCamera2Device.setSuperResolution(true);
            }
        }
    }

    private boolean showMoonMode(boolean z) {
        if (CameraSettings.isUltraWideConfigOpen(getModuleIndex())) {
            return false;
        }
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        if (topAlert == null) {
            return false;
        }
        this.mEnteringMoonMode = true;
        topAlert.alertMoonModeSelector(0, z);
        if (z) {
            updateMoon(true);
        } else {
            updateMoonNight();
        }
        return true;
    }

    public void updateMoonNight() {
        this.mIsMoonMode = false;
        checkCloseMoonMode(10, 0);
        ((ConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(164)).closeMutexElement(SupportedConfigFactory.CLOSE_BY_AI, 193);
        setFlashMode("0");
        updateMfnr(true);
        updateOIS();
        setAiSceneEffect(10);
        this.mCurrentAiScene = 10;
        resumePreviewInWorkThread();
    }

    public void updateMoon(boolean z) {
        if (z) {
            this.mIsMoonMode = true;
            this.mCamera2Device.setSuperResolution(false);
            updateFocusMode();
            this.mCurrentAiScene = 35;
            this.mCamera2Device.setASDScene(35);
            resumePreviewInWorkThread();
            initializeZoomForSetting();
        } else if (this.mIsMoonMode) {
            this.mIsMoonMode = false;
            setFocusMode(this.mFocusManager.setFocusMode(CameraSettings.getFocusMode()));
            this.mCamera2Device.setASDScene(-35);
            initializeZoomForCapabilities();
            if (this.mZoomValue > 10.0f) {
                onZoomValueChanged(10.0f);
            }
        }
        DualController dualController = (DualController) ModeCoordinatorImpl.getInstance().getAttachProtocol(182);
        if (dualController != null) {
            dualController.hideSlideView();
        }
    }

    /* JADX WARNING: Missing block: B:11:0x002a, code:
            return false;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private boolean shouldChangeAiScene(int i) {
        if (isDoingAction() || !isAlive() || this.mCurrentDetectedScene == i || System.currentTimeMillis() - this.mLastChangeSceneTime <= 300) {
            return false;
        }
        this.mCurrentDetectedScene = i;
        this.mLastChangeSceneTime = System.currentTimeMillis();
        return true;
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
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void resetAsdSceneInHdrOrFlashChange() {
        if (b.hU() && isFrontCamera() && this.mCurrentAsdScene != -1 && this.mCurrentAsdScene == 9) {
            this.mHandler.post(new Runnable() {
                public void run() {
                    Camera2Module.this.consumeAsdSceneResult(-1);
                }
            });
        }
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
                String access$500 = Camera2Module.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("stopScreenLight: protocol = ");
                stringBuilder.append(fullScreenProtocol);
                stringBuilder.append(", mHandler = ");
                stringBuilder.append(Camera2Module.this.mHandler);
                Log.d(access$500, stringBuilder.toString());
                if (fullScreenProtocol != null) {
                    fullScreenProtocol.hideScreenLight();
                }
            }
        });
    }

    protected void trackModeCustomInfo(int i) {
        if (this.mModuleIndex == 167) {
            trackManualInfo(i);
        } else if (this.mModuleIndex == 163) {
            if (isFaceBeautyOn(this.mBeautyValues)) {
                trackBeautyInfo(i, isFrontCamera(), new BeautyValues(this.mBeautyValues));
            }
            CameraStatUtil.trackUltraWidePictureTaken();
        } else if (this.mModuleIndex == 165) {
            CameraStatUtil.trackUltraWidePictureTaken();
        }
    }

    private void trackManualInfo(int i) {
        CameraStatUtil.trackPictureTakenInManual(i, getManualValue(CameraSettings.KEY_WHITE_BALANCE, getString(R.string.pref_camera_whitebalance_default)), getManualValue(CameraSettings.KEY_QC_EXPOSURETIME, getString(R.string.pref_camera_exposuretime_default)), getManualValue(CameraSettings.KEY_QC_ISO, getString(R.string.pref_camera_iso_default)), this.mModuleIndex);
        CameraStatUtil.trackUltraWideManualTaken(this.mModuleIndex);
    }

    private boolean isFaceBeautyOn(BeautyValues beautyValues) {
        boolean z = false;
        if (beautyValues == null) {
            return false;
        }
        if (!b.hP()) {
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
        if (isPortraitMode()) {
            pictureInfo.setAiEnabled(this.mAiSceneEnabled);
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

    public void onUltraWideChanged(boolean z, int i) {
        this.mHandler.post(new -$$Lambda$Camera2Module$UmAlEOsqA318KwmuR5DTsdoQjPQ(this, z, i));
    }

    public static /* synthetic */ void lambda$onUltraWideChanged$1(Camera2Module camera2Module, boolean z, int i) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("isOpenUltraWide: ");
        stringBuilder.append(z);
        stringBuilder.append("; type: ");
        stringBuilder.append(i);
        Log.d(str, stringBuilder.toString());
        BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
        if (bottomPopupTips != null) {
            if (!z) {
                bottomPopupTips.directlyHideTips();
            } else if (171 != camera2Module.getModuleIndex()) {
                if (i == 2) {
                    camera2Module.trackAISceneChanged(camera2Module.mModuleIndex, 36);
                }
                bottomPopupTips.showTips(14, R.string.ultra_wide_recommend_tip_hint, 7);
            }
        }
    }

    public boolean isUltraWideDetectStarted() {
        return true;
    }

    public void reShowMoon() {
        if (this.mEnteringMoonMode) {
            showMoonMode(this.mIsMoonMode);
        }
    }
}
