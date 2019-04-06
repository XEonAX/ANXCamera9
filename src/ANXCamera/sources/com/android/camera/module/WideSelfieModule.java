package com.android.camera.module;

import android.annotation.TargetApi;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.SurfaceTexture;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CaptureResult;
import android.location.Location;
import android.media.Image;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.AsyncTask.Status;
import android.os.Handler;
import android.os.Message;
import android.os.SystemClock;
import android.support.annotation.UiThread;
import android.text.format.DateFormat;
import android.view.KeyEvent;
import android.view.Surface;
import android.view.View;
import com.android.camera.AutoLockManager;
import com.android.camera.BasePreferenceActivity;
import com.android.camera.Camera;
import com.android.camera.CameraAppImpl;
import com.android.camera.CameraPreferenceActivity;
import com.android.camera.CameraScreenNail;
import com.android.camera.CameraSettings;
import com.android.camera.CameraSize;
import com.android.camera.ExifHelper;
import com.android.camera.LocationManager;
import com.android.camera.OnClickAttr;
import com.android.camera.PictureSizeManager;
import com.android.camera.R;
import com.android.camera.Thumbnail;
import com.android.camera.ToastUtils;
import com.android.camera.Util;
import com.android.camera.VibratorUtils;
import com.android.camera.beautyshot.BeautyShot;
import com.android.camera.constant.UpdateConstant;
import com.android.camera.constant.UpdateConstant.UpdateType;
import com.android.camera.data.DataRepository;
import com.android.camera.effect.EffectController;
import com.android.camera.effect.FaceAnalyzeInfo;
import com.android.camera.effect.FilterInfo;
import com.android.camera.fragment.beauty.BeautyValues;
import com.android.camera.log.Log;
import com.android.camera.module.loader.FunctionParseAsdFace;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.BackStack;
import com.android.camera.protocol.ModeProtocol.CameraAction;
import com.android.camera.protocol.ModeProtocol.OnFaceBeautyChangedProtocol;
import com.android.camera.protocol.ModeProtocol.RecordState;
import com.android.camera.protocol.ModeProtocol.WideSelfieProtocol;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera.storage.MediaProviderUtil;
import com.android.camera.storage.Storage;
import com.android.camera.wideselfie.WideSelfieConfig;
import com.android.camera.wideselfie.WideSelfieEngineWrapper;
import com.android.camera.wideselfie.WideSelfieEngineWrapper.WideSelfStateCallback;
import com.android.camera2.Camera2Proxy.CameraPreviewCallback;
import com.android.camera2.Camera2Proxy.FaceDetectionCallback;
import com.android.camera2.Camera2Proxy.PictureCallbackWrapper;
import com.android.camera2.CameraHardwareFace;
import com.arcsoft.camera.utils.d;
import com.mi.config.b;
import io.reactivex.BackpressureStrategy;
import io.reactivex.Flowable;
import io.reactivex.FlowableEmitter;
import io.reactivex.FlowableOnSubscribe;
import io.reactivex.disposables.Disposable;
import java.lang.ref.WeakReference;

@TargetApi(21)
public class WideSelfieModule extends BaseModule implements CameraAction, OnFaceBeautyChangedProtocol, WideSelfStateCallback, CameraPreviewCallback, FaceDetectionCallback {
    private static final int MIN_SHOOTING_TIME = 600;
    public static final int STOP_ROTATION_THRESHOLD = 60;
    private static final String TAG = "WideSelfieModule";
    private int MOVE_DISTANCE;
    private int MOVE_DISTANCE_VERTICAL;
    public int OFFSET_X_HINT_THRESHOLD;
    public int OFFSET_X_STOP_CAPTURE_THRESHOLD;
    public int OFFSET_Y_HINT_THRESHOLD;
    public int OFFSET_Y_STOP_CAPTURE_THRESHOLD;
    private BeautyValues mBeautyValues;
    private int mCaptureOrientation = -1;
    private final Object mDeviceLock = new Object();
    private boolean mFaceDetectionEnabled;
    private boolean mFaceDetectionStarted;
    private byte[] mFirstFrameNv21Data;
    private boolean mIsContinuousVibratoring = false;
    private volatile boolean mIsShooting = false;
    private int mJpegRotation;
    private int mLastMoveDirection = -1;
    private int mLastVibratorProgress;
    protected final Handler mMainHandler = new MainHandler(this, null);
    private int mMaxMoveWidth;
    private Disposable mMetaDataDisposable;
    private FlowableEmitter<CaptureResult> mMetaDataFlowableEmitter;
    private SaveOutputImageTask mSaveOutputImageTask;
    private long mShootingStartTime;
    private boolean mShowWarningToast;
    private int mStillPreviewWidth;
    private int mTargetFocusMode = 4;
    private int mToastOffsetY;
    private WideSelfieEngineWrapper mWideSelfEngine;

    public interface SaveStateCallback {
        void onSaveCompleted();
    }

    private class MainHandler extends Handler {
        private MainHandler() {
        }

        /* synthetic */ MainHandler(WideSelfieModule wideSelfieModule, AnonymousClass1 anonymousClass1) {
            this();
        }

        public void handleMessage(Message message) {
            if (message.what == 45) {
                Log.d(WideSelfieModule.TAG, "onMessage MSG_ABANDON_HANDLER setActivity null");
                WideSelfieModule.this.setActivity(null);
            }
            if (!WideSelfieModule.this.isCreated()) {
                removeCallbacksAndMessages(null);
            } else if (WideSelfieModule.this.getActivity() != null) {
                int i = message.what;
                if (i == 2) {
                    WideSelfieModule.this.getWindow().clearFlags(128);
                } else if (i != 17) {
                    boolean z = true;
                    if (i == 35) {
                        WideSelfieModule wideSelfieModule = WideSelfieModule.this;
                        boolean z2 = message.arg1 > 0;
                        if (message.arg2 <= 0) {
                            z = false;
                        }
                        wideSelfieModule.handleUpdateFaceView(z2, z);
                    } else if (i != 51) {
                        switch (i) {
                            case 9:
                                WideSelfieModule.this.initPreviewLayout();
                                WideSelfieModule.this.mActivity.getCameraScreenNail().setPreviewSize(WideSelfieModule.this.mPreviewSize.width, WideSelfieModule.this.mPreviewSize.height);
                                WideSelfieModule.this.mWideSelfEngine.setCameraParameter("1", WideSelfieModule.this.mPreviewSize.width, WideSelfieModule.this.mPreviewSize.height, WideSelfieModule.this.mPictureSize.width, WideSelfieModule.this.mPictureSize.height);
                                break;
                            case 10:
                                WideSelfieModule.this.mOpenCameraFail = true;
                                WideSelfieModule.this.onCameraException();
                                break;
                            default:
                                StringBuilder stringBuilder;
                                if (!BaseModule.DEBUG) {
                                    String str = WideSelfieModule.TAG;
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
                    } else if (!(WideSelfieModule.this.mActivity == null || WideSelfieModule.this.mActivity.isActivityPaused())) {
                        WideSelfieModule.this.mOpenCameraFail = true;
                        WideSelfieModule.this.onCameraException();
                    }
                } else {
                    WideSelfieModule.this.mMainHandler.removeMessages(17);
                    WideSelfieModule.this.mMainHandler.removeMessages(2);
                    WideSelfieModule.this.getWindow().addFlags(128);
                    WideSelfieModule.this.mMainHandler.sendEmptyMessageDelayed(2, (long) WideSelfieModule.this.getScreenDelay());
                }
            }
        }
    }

    private static class SaveOutputImageTask extends AsyncTask<Void, Integer, Integer> {
        private WeakReference<Camera> mActivityRef;
        private SaveStateCallback mCallback;
        private final String mFileName;
        private int mHeight;
        private byte[] mNv21Data;
        private int mOrientation;
        private int mWidth;

        public SaveOutputImageTask(Camera camera, byte[] bArr, int i, int i2, int i3, SaveStateCallback saveStateCallback) {
            this.mNv21Data = bArr;
            this.mWidth = i;
            this.mHeight = i2;
            this.mOrientation = i3;
            this.mCallback = saveStateCallback;
            this.mFileName = DateFormat.format(camera.getString(R.string.accessibility_intent_done_apply), System.currentTimeMillis()).toString();
            this.mActivityRef = new WeakReference(camera);
        }

        private void addImageAsApplication(String str, String str2, int i, int i2, int i3) {
            long currentTimeMillis = System.currentTimeMillis();
            Location currentLocation = LocationManager.instance().getCurrentLocation();
            ExifHelper.writeExifByFilePath(str, i3, currentLocation, currentTimeMillis);
            Uri addImageForGroupOrPanorama = Storage.addImageForGroupOrPanorama(CameraAppImpl.getAndroidContext(), str, i3, currentTimeMillis, currentLocation, i, i2);
            if (addImageForGroupOrPanorama == null) {
                String str3 = WideSelfieModule.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("insert MediaProvider failed, attempt to find uri by path, ");
                stringBuilder.append(str);
                Log.w(str3, stringBuilder.toString());
                addImageForGroupOrPanorama = MediaProviderUtil.getContentUriFromPath(CameraAppImpl.getAndroidContext(), str);
            }
            String str4 = WideSelfieModule.TAG;
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("addImageAsApplication uri = ");
            stringBuilder2.append(addImageForGroupOrPanorama);
            stringBuilder2.append(", path = ");
            stringBuilder2.append(str);
            Log.d(str4, stringBuilder2.toString());
            Camera camera = (Camera) this.mActivityRef.get();
            if (camera != null) {
                camera.getScreenHint().updateHint();
                if (addImageForGroupOrPanorama != null) {
                    camera.onNewUriArrived(addImageForGroupOrPanorama, str2);
                    Thumbnail createThumbnailFromUri = Thumbnail.createThumbnailFromUri(camera.getContentResolver(), addImageForGroupOrPanorama, false);
                    String str5 = WideSelfieModule.TAG;
                    StringBuilder stringBuilder3 = new StringBuilder();
                    stringBuilder3.append("addImageAsApplication Thumbnail = ");
                    stringBuilder3.append(createThumbnailFromUri);
                    Log.d(str5, stringBuilder3.toString());
                    Util.broadcastNewPicture(camera, addImageForGroupOrPanorama);
                    camera.getThumbnailUpdater().setThumbnail(createThumbnailFromUri, true, false);
                }
            }
        }

        private int getBeautyLevel() {
            String faceBeautifyValue = CameraSettings.getFaceBeautifyValue();
            try {
                return Integer.parseInt(faceBeautifyValue.split(":")[1]);
            } catch (NumberFormatException e) {
                String str = WideSelfieModule.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("getBeautyLevel error, beautyLevel = ");
                stringBuilder.append(faceBeautifyValue);
                Log.d(str, stringBuilder.toString());
                return 0;
            }
        }

        protected Integer doInBackground(Void... voidArr) {
            int beautyLevel = getBeautyLevel();
            if (beautyLevel > 0) {
                int i = beautyLevel - 1;
                String str = WideSelfieModule.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("beautyLevel ");
                stringBuilder.append(i);
                Log.d(str, stringBuilder.toString());
                BeautyShot beautyShot = new BeautyShot();
                long currentTimeMillis = System.currentTimeMillis();
                String str2 = WideSelfieModule.TAG;
                StringBuilder stringBuilder2 = new StringBuilder();
                stringBuilder2.append("beautyShot start  mWidth ");
                stringBuilder2.append(this.mWidth);
                stringBuilder2.append(", mHeight = ");
                stringBuilder2.append(this.mHeight);
                Log.d(str2, stringBuilder2.toString());
                beautyShot.init();
                beautyShot.process(this.mNv21Data, this.mWidth, this.mHeight, 270, 0, i);
                beautyShot.uninit();
                str = WideSelfieModule.TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("beautyShot end, time = ");
                stringBuilder.append(System.currentTimeMillis() - currentTimeMillis);
                Log.d(str, stringBuilder.toString());
            }
            byte[] b = d.b(this.mNv21Data, this.mWidth, this.mHeight);
            String generateFilepath = Storage.generateFilepath(this.mFileName);
            d.b(generateFilepath, b);
            addImageAsApplication(generateFilepath, this.mFileName, this.mWidth, this.mHeight, this.mOrientation);
            return null;
        }

        protected void onPostExecute(Integer num) {
            super.onPostExecute(num);
            if (this.mCallback != null) {
                this.mCallback.onSaveCompleted();
            }
        }

        protected void onPreExecute() {
            super.onPreExecute();
            Log.w(WideSelfieModule.TAG, "onPreExecute");
            RecordState recordState = (RecordState) ModeCoordinatorImpl.getInstance().getAttachProtocol(212);
            if (recordState == null) {
                Log.w(WideSelfieModule.TAG, "onPreExecute recordState is null");
            } else {
                recordState.onPostSavingStart();
            }
        }
    }

    private void doLaterReleaseIfNeed() {
        if (this.mActivity != null && this.mActivity.isActivityPaused()) {
            this.mActivity.pause();
            this.mActivity.releaseAll(true, true);
        }
    }

    private void handleUpdateFaceView(boolean z, boolean z2) {
        boolean isFrontCamera = isFrontCamera();
        if (!z) {
            this.mMainProtocol.updateFaceView(z, z2, isFrontCamera, false, -1);
        } else if (this.mFaceDetectionStarted && 1 != this.mCamera2Device.getFocusMode()) {
            this.mMainProtocol.updateFaceView(z, true, isFrontCamera, true, this.mCameraDisplayOrientation);
        }
    }

    private void initMetaParser() {
        this.mMetaDataDisposable = Flowable.create(new FlowableOnSubscribe<CaptureResult>() {
            public void subscribe(FlowableEmitter<CaptureResult> flowableEmitter) throws Exception {
                WideSelfieModule.this.mMetaDataFlowableEmitter = flowableEmitter;
            }
        }, BackpressureStrategy.DROP).map(new FunctionParseAsdFace(this, isFrontCamera())).subscribe();
    }

    private void initPreviewLayout() {
        if (isAlive()) {
            this.mActivity.getCameraScreenNail().setPreviewSize(this.mPreviewSize.width, this.mPreviewSize.height);
            CameraScreenNail cameraScreenNail = this.mActivity.getCameraScreenNail();
            int width = cameraScreenNail.getWidth();
            int height = cameraScreenNail.getHeight();
            int dimensionPixelSize = this.mActivity.getResources().getDimensionPixelSize(R.dimen.wide_selfie_thumbnail_border_size);
            width = (width * dimensionPixelSize) / height;
            WideSelfieProtocol wideSelfieProtocol = (WideSelfieProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(216);
            if (wideSelfieProtocol != null) {
                wideSelfieProtocol.initPreviewLayout(width, dimensionPixelSize, this.mPreviewSize.width, this.mPreviewSize.height);
                wideSelfieProtocol.resetShootUI();
            }
        }
    }

    private boolean isProcessingSaveTask() {
        return (this.mSaveOutputImageTask == null || this.mSaveOutputImageTask.getStatus() == Status.FINISHED) ? false : true;
    }

    private boolean isShootingTooShort() {
        return SystemClock.elapsedRealtime() - this.mShootingStartTime < 600;
    }

    private void keepScreenOnAwhile() {
        this.mMainHandler.sendEmptyMessageDelayed(17, 1000);
    }

    private void onSaveFinish() {
        Log.d(TAG, "onSaveFinish");
        this.mIsShooting = false;
        if (isAlive() && this.mCamera2Device != null) {
            enableCameraControls(true);
            if (this.mAeLockSupported) {
                this.mCamera2Device.setAELock(false);
            }
            if (this.mAwbLockSupported) {
                this.mCamera2Device.setAWBLock(false);
            }
            this.mCamera2Device.setFocusMode(this.mTargetFocusMode);
            startPreview();
            RecordState recordState = (RecordState) ModeCoordinatorImpl.getInstance().getAttachProtocol(212);
            if (recordState != null) {
                recordState.onPostSavingFinish();
            }
        }
    }

    private void resetScreenOn() {
        this.mMainHandler.removeMessages(17);
        this.mMainHandler.removeMessages(2);
    }

    private void setupCaptureParams() {
        if (this.mCamera2Device == null) {
            Log.e(TAG, "camera device is not ready");
            return;
        }
        this.mCamera2Device.setFocusMode(this.mTargetFocusMode);
        this.mCamera2Device.setZoomRatio(1.0f);
        this.mCamera2Device.setFlashMode(0);
        String antiBanding = CameraSettings.getAntiBanding();
        this.mCamera2Device.setAntiBanding(Integer.valueOf(antiBanding).intValue());
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("antiBanding=");
        stringBuilder.append(antiBanding);
        Log.d(str, stringBuilder.toString());
        this.mCamera2Device.setEnableZsl(true);
        this.mCamera2Device.setHHT(false);
        this.mCamera2Device.setEnableOIS(false);
        this.mCamera2Device.setTimeWaterMarkEnable(false);
        this.mCamera2Device.setFaceWaterMarkEnable(false);
    }

    @UiThread
    private void startSaveTask(byte[] bArr, int i, int i2) {
        if (this.mIsShooting) {
            Log.v(TAG, "startSaveTask");
            keepScreenOnAwhile();
            synchronized (this.mDeviceLock) {
                if (this.mCamera2Device != null) {
                    this.mCamera2Device.captureAbortBurst();
                }
            }
            if (this.mShowWarningToast) {
                bArr = this.mFirstFrameNv21Data;
                i = this.mPictureSize.width;
                i2 = this.mPictureSize.height;
            }
            this.mSaveOutputImageTask = new SaveOutputImageTask(this.mActivity, bArr, i, i2, this.mJpegRotation, new SaveStateCallback() {
                public void onSaveCompleted() {
                    Log.d(WideSelfieModule.TAG, "onSaveCompleted");
                    if (WideSelfieModule.this.mShowWarningToast) {
                        ToastUtils.showToast(WideSelfieModule.this.mActivity, WideSelfieModule.this.mActivity.getResources().getString(R.string.pref_camera_coloreffect_entry_light_tunnel), 80, 0, WideSelfieModule.this.mToastOffsetY);
                    }
                    WideSelfieModule.this.onSaveFinish();
                }
            });
            this.mSaveOutputImageTask.execute(new Void[0]);
            this.mIsShooting = false;
            return;
        }
        Log.w(TAG, "startSaveTask while not shooting");
    }

    private void stopWideSelfieShooting(boolean z, boolean z2) {
        this.mShowWarningToast = z2;
        if (z) {
            VibratorUtils.getInstance(this.mActivity).vibrate();
        }
        playCameraSound(3);
        this.mWideSelfEngine.stopCapture();
    }

    private void updateBeauty() {
        if (this.mBeautyValues == null) {
            this.mBeautyValues = new BeautyValues();
        }
        this.mBeautyValues.mBeautyLevel = CameraSettings.getFaceBeautyCloseValue();
        CameraSettings.initBeautyValues(this.mBeautyValues, b.jc());
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("updateBeauty(): ");
        stringBuilder.append(this.mBeautyValues);
        Log.d(str, stringBuilder.toString());
        this.mCamera2Device.setBeautyValues(this.mBeautyValues);
    }

    private void updateFaceView(boolean z, boolean z2) {
        if (this.mMainHandler.hasMessages(35)) {
            this.mMainHandler.removeMessages(35);
        }
        this.mMainHandler.obtainMessage(35, z, z2).sendToTarget();
    }

    private void updatePictureAndPreviewSize() {
        PictureSizeManager.initialize(this.mCameraCapabilities.getSupportedOutputSize(35), 0, 176, this.mBogusCameraId);
        CameraSize bestPictureSize = PictureSizeManager.getBestPictureSize();
        this.mPreviewSize = Util.getOptimalPreviewSize(this.mModuleIndex, this.mBogusCameraId, this.mCameraCapabilities.getSupportedOutputSize(SurfaceTexture.class), (double) CameraSettings.getPreviewAspectRatio(bestPictureSize.width, bestPictureSize.height));
        this.mPictureSize = bestPictureSize;
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("pictureSize= ");
        stringBuilder.append(bestPictureSize.width);
        stringBuilder.append("X");
        stringBuilder.append(bestPictureSize.height);
        stringBuilder.append(" previewSize=");
        stringBuilder.append(this.mPreviewSize.width);
        stringBuilder.append("X");
        stringBuilder.append(this.mPreviewSize.height);
        Log.d(str, stringBuilder.toString());
        updateCameraScreenNailSize(this.mPreviewSize.width, this.mPreviewSize.height);
    }

    public void closeCamera() {
        Log.d(TAG, "closeCamera: start");
        if (this.mMetaDataFlowableEmitter != null) {
            this.mMetaDataFlowableEmitter.onComplete();
        }
        if (this.mMetaDataDisposable != null) {
            this.mMetaDataDisposable.dispose();
        }
        synchronized (this.mDeviceLock) {
            setCameraState(0);
            if (this.mCamera2Device != null) {
                this.mCamera2Device.setErrorCallback(null);
                this.mCamera2Device.stopPreviewCallback(true);
                this.mCamera2Device = null;
            }
        }
        Log.d(TAG, "closeCamera: end");
    }

    public void consumePreference(@UpdateType int... iArr) {
        for (int i : iArr) {
            if (i == 1) {
                updatePictureAndPreviewSize();
            } else if (i == 5) {
                updateFace();
            } else if (i == 13) {
                updateBeauty();
            } else if (i == 24) {
                setZoomRatio(getZoomValue());
            } else if (i == 32) {
                setupCaptureParams();
            } else if (DEBUG) {
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("no consumer for this updateType: ");
                stringBuilder.append(i);
                throw new RuntimeException(stringBuilder.toString());
            } else {
                String str = TAG;
                StringBuilder stringBuilder2 = new StringBuilder();
                stringBuilder2.append("no consumer for this updateType: ");
                stringBuilder2.append(i);
                Log.w(str, stringBuilder2.toString());
            }
        }
    }

    protected boolean enableFaceDetection() {
        return DataRepository.dataItemGlobal().getBoolean(CameraSettings.KEY_FACE_DETECTION, getResources().getBoolean(R.bool.pref_camera_facedetection_default));
    }

    protected int getOperatingMode() {
        return 32776;
    }

    public boolean isDoingAction() {
        return isProcessingSaveTask();
    }

    public boolean isFaceDetectStarted() {
        return this.mFaceDetectionStarted;
    }

    public boolean isRecording() {
        return this.mIsShooting;
    }

    public boolean isUnInterruptable() {
        this.mUnInterruptableReason = null;
        if (this.mIsShooting) {
            this.mUnInterruptableReason = "shooting";
        }
        return this.mUnInterruptableReason != null;
    }

    public boolean isUseFaceInfo() {
        return false;
    }

    protected boolean isZoomEnabled() {
        return false;
    }

    protected void keepScreenOn() {
        this.mMainHandler.removeMessages(17);
        this.mMainHandler.removeMessages(2);
        getWindow().addFlags(128);
    }

    public boolean onBackPressed() {
        if (!this.mIsShooting) {
            return false;
        }
        if (!isProcessingSaveTask()) {
            playCameraSound(3);
            stopWideSelfieShooting(true, false);
        }
        return true;
    }

    public void onBeautyChanged() {
        if (b.jj()) {
            updatePreferenceInWorkThread(13, 34, 42);
            return;
        }
        updatePreferenceInWorkThread(13);
    }

    protected void onCameraOpened() {
        super.onCameraOpened();
        checkDisplayOrientation();
        updatePreferenceTrampoline(UpdateConstant.WIDESELFIE_TYPES_INIT);
        startPreviewSession();
        this.mMainHandler.sendEmptyMessage(9);
        initMetaParser();
        Log.v(TAG, "SetupCameraThread done");
    }

    public void onCreate(int i, int i2) {
        super.onCreate(i, i2);
        this.mStillPreviewWidth = WideSelfieConfig.getInstance(getActivity()).getStillPreviewWidth();
        this.OFFSET_X_HINT_THRESHOLD = 0;
        this.OFFSET_Y_HINT_THRESHOLD = this.mStillPreviewWidth / 4;
        this.OFFSET_X_STOP_CAPTURE_THRESHOLD = this.mStillPreviewWidth / 2;
        this.OFFSET_Y_STOP_CAPTURE_THRESHOLD = this.mStillPreviewWidth / 2;
        this.mToastOffsetY = this.mActivity.getResources().getDimensionPixelOffset(R.dimen.wide_selfie_progress_thumbnail_background_width_vertical);
        this.MOVE_DISTANCE = (WideSelfieConfig.getInstance(this.mActivity).getThumbBgWidth() - WideSelfieConfig.getInstance(this.mActivity).getStillPreviewWidth()) / 2;
        this.MOVE_DISTANCE_VERTICAL = (WideSelfieConfig.getInstance(this.mActivity).getThumbBgHeightVertical() - WideSelfieConfig.getInstance(this.mActivity).getStillPreviewHeight()) / 2;
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("MOVE_DISTANCE ");
        stringBuilder.append(this.MOVE_DISTANCE);
        stringBuilder.append(", MOVE_DISTANCE_VERTICAL =  ");
        stringBuilder.append(this.MOVE_DISTANCE_VERTICAL);
        Log.d(str, stringBuilder.toString());
        this.mWideSelfEngine = new WideSelfieEngineWrapper(this.mActivity.getApplicationContext(), this);
        EffectController.getInstance().setEffect(FilterInfo.FILTER_ID_NONE);
        onCameraOpened();
    }

    public void onDestroy() {
        super.onDestroy();
        this.mMainHandler.sendEmptyMessage(45);
        this.mWideSelfEngine.onDestroy();
    }

    public void onFaceDetected(CameraHardwareFace[] cameraHardwareFaceArr, FaceAnalyzeInfo faceAnalyzeInfo) {
        if (isCreated() && cameraHardwareFaceArr != null) {
            if (b.hW() && cameraHardwareFaceArr.length > 0 && cameraHardwareFaceArr[0].faceType == CameraHardwareFace.CAMERA_META_DATA_T2T) {
                if (this.mObjectTrackingStarted) {
                    this.mMainProtocol.setFaces(3, cameraHardwareFaceArr, getActiveArraySize(), this.mZoomValue);
                }
            } else if (!this.mMainProtocol.setFaces(1, cameraHardwareFaceArr, getActiveArraySize(), this.mZoomValue)) {
            }
        }
    }

    public void onHostStopAndNotifyActionStop() {
        if (this.mIsShooting) {
            RecordState recordState = (RecordState) ModeCoordinatorImpl.getInstance().getAttachProtocol(212);
            if (recordState != null) {
                recordState.onFinish();
            }
        }
        playCameraSound(3);
        stopWideSelfieShooting(false, false);
        doLaterReleaseIfNeed();
    }

    /* JADX WARNING: Removed duplicated region for block: B:21:0x003e A:{RETURN} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public boolean onKeyDown(int i, KeyEvent keyEvent) {
        if (this.mPaused) {
            return true;
        }
        boolean z = false;
        if (!isFrameAvailable()) {
            return false;
        }
        if (i == 27 || i == 66) {
            if (keyEvent.getRepeatCount() == 0) {
                if (!Util.isFingerPrintKeyEvent(keyEvent)) {
                    onShutterButtonClick(40);
                } else if (CameraSettings.isFingerprintCaptureEnable()) {
                    onShutterButtonClick(30);
                }
                return true;
            }
        } else if (i != Util.KEYCODE_SLIDE_ON) {
            switch (i) {
                case 23:
                    if (keyEvent.getRepeatCount() == 0) {
                        onShutterButtonClick(50);
                        return true;
                    }
                    break;
                case 24:
                case 25:
                    z = true;
                    if (handleVolumeKeyEvent(z, true, keyEvent.getRepeatCount(), keyEvent.getDevice().isExternal())) {
                    }
                    break;
                default:
                    switch (i) {
                        case 87:
                        case 88:
                            break;
                    }
                    if (i == 24 || i == 88) {
                        z = true;
                    }
                    if (handleVolumeKeyEvent(z, true, keyEvent.getRepeatCount(), keyEvent.getDevice().isExternal())) {
                        return true;
                    }
                    break;
            }
        } else if (this.mIsShooting) {
            stopWideSelfieShooting(false, false);
        }
        return super.onKeyDown(i, keyEvent);
    }

    public boolean onKeyUp(int i, KeyEvent keyEvent) {
        if (this.mPaused) {
            return true;
        }
        if (i != 4) {
            if (i == 27 || i == 66) {
                return true;
            }
        } else if (((BackStack) ModeCoordinatorImpl.getInstance().getAttachProtocol(171)).handleBackStackFromKeyBack()) {
            return true;
        }
        return super.onKeyUp(i, keyEvent);
    }

    @UiThread
    public void onMove(int i, int i2, Point point, Point point2, boolean z) {
        WideSelfieProtocol wideSelfieProtocol = (WideSelfieProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(216);
        if (wideSelfieProtocol == null) {
            VibratorUtils.getInstance(this.mActivity).cancel();
            return;
        }
        int i3 = point.x;
        int i4 = point.y;
        int i5 = 0;
        boolean z2 = Math.abs(i4) >= this.OFFSET_Y_STOP_CAPTURE_THRESHOLD || Math.abs(i3) >= (this.mJpegRotation % 180 == 90 ? this.OFFSET_X_STOP_CAPTURE_THRESHOLD : this.OFFSET_X_STOP_CAPTURE_THRESHOLD / 2);
        if (z || z2) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("stop shooting completed = ");
            stringBuilder.append(z);
            stringBuilder.append(", requestStop = ");
            stringBuilder.append(z2);
            Log.w(str, stringBuilder.toString());
            stopWideSelfieShooting(true, false);
            return;
        }
        if (Math.abs(i4) >= this.OFFSET_Y_HINT_THRESHOLD) {
            i = i4 < 0 ? R.string.pref_camera_coloreffect_entry_mosaic : R.string.pref_camera_coloreffect_entry_mirror;
            if (i != 0) {
                if (!this.mIsContinuousVibratoring) {
                    VibratorUtils.getInstance(this.mActivity).vibrate();
                    this.mIsContinuousVibratoring = true;
                }
                wideSelfieProtocol.updateHintText(i);
            }
            return;
        }
        if (this.mIsContinuousVibratoring) {
            VibratorUtils.getInstance(this.mActivity).cancel();
            this.mIsContinuousVibratoring = false;
        }
        if (i == -1) {
            wideSelfieProtocol.updateHintText(R.string.pref_camera_coloreffect_entry_small_face);
            return;
        }
        if ((i2 == 50 || i2 == 100) && this.mLastVibratorProgress != i2) {
            VibratorUtils.getInstance(this.mActivity).vibrate();
            this.mLastVibratorProgress = i2;
        }
        if (this.mJpegRotation % 180 == 90) {
            this.mMaxMoveWidth = Math.max(this.mMaxMoveWidth, Math.abs(point2.y));
            i2 = (i2 == 50 || i2 == 100) ? true : 0;
            if (i2 == 0 && this.mLastMoveDirection == 1 && i == 0) {
                wideSelfieProtocol.updateThumbBackgroudLayout(false, true, this.MOVE_DISTANCE - this.mMaxMoveWidth);
            } else if (i2 == 0 && this.mLastMoveDirection == 0 && i == 1) {
                wideSelfieProtocol.updateThumbBackgroudLayout(false, false, this.MOVE_DISTANCE - this.mMaxMoveWidth);
            }
        } else {
            this.mMaxMoveWidth = Math.max(this.mMaxMoveWidth, Math.abs(point2.x));
            i2 = (i2 == 50 || i2 == 100) ? true : 0;
            if (i2 == 0 && this.mLastMoveDirection == 1 && i == 0) {
                wideSelfieProtocol.updateThumbBackgroudLayout(true, true, this.MOVE_DISTANCE_VERTICAL - this.mMaxMoveWidth);
            } else if (i2 == 0 && this.mLastMoveDirection == 0 && i == 1) {
                wideSelfieProtocol.updateThumbBackgroudLayout(true, false, this.MOVE_DISTANCE_VERTICAL - this.mMaxMoveWidth);
            }
        }
        this.mLastMoveDirection = i;
        if (i == 1) {
            i5 = R.string.pref_camera_coloreffect_entry_long_face;
        } else if (i == 0) {
            i5 = R.string.pref_camera_coloreffect_entry_fisheye;
        }
        if (i5 != 0) {
            wideSelfieProtocol.updateHintText(i5);
        }
    }

    public void onNv21Available(byte[] bArr, int i, int i2) {
        Log.d(TAG, "onNv21Available");
        startSaveTask(bArr, i, i2);
    }

    public void onOrientationChanged(int i, int i2, int i3) {
        super.onOrientationChanged(i, i2, i3);
        if (this.mIsShooting) {
            i2 = Math.abs(this.mCaptureOrientation - i3);
            if (i2 > 180) {
                i2 = 360 - i2;
            }
            if (i2 >= 60) {
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onOrientationChanged stop shooting mCaptureOrientation ");
                stringBuilder.append(this.mCaptureOrientation);
                stringBuilder.append(", orientation = ");
                stringBuilder.append(i);
                stringBuilder.append(", realTimeOrientation = ");
                stringBuilder.append(i3);
                Log.w(str, stringBuilder.toString());
                stopWideSelfieShooting(false, true);
            }
        }
    }

    public void onPause() {
        super.onPause();
        this.mMainHandler.removeCallbacksAndMessages(null);
        closeCamera();
        resetScreenOn();
        this.mWideSelfEngine.pause();
    }

    public void onPreviewLayoutChanged(Rect rect) {
        this.mActivity.onLayoutChange(rect);
    }

    public void onPreviewMetaDataUpdate(CaptureResult captureResult) {
        if (captureResult != null) {
            super.onPreviewMetaDataUpdate(captureResult);
            if (this.mMetaDataFlowableEmitter != null) {
                this.mMetaDataFlowableEmitter.onNext(captureResult);
            }
        }
    }

    public void onPreviewSessionClosed(CameraCaptureSession cameraCaptureSession) {
    }

    public void onPreviewSessionFailed(CameraCaptureSession cameraCaptureSession) {
        if (isTextureExpired() && retryOnceIfCameraError(this.mMainHandler)) {
            Log.d(TAG, "sessionFailed due to surfaceTexture expired, retry");
        } else {
            this.mMainHandler.sendEmptyMessage(51);
        }
    }

    public void onPreviewSessionSuccess(CameraCaptureSession cameraCaptureSession) {
        if (cameraCaptureSession != null && isAlive()) {
            setCameraState(1);
            updatePreferenceInWorkThread(UpdateConstant.WIDESELFIE_ON_PREVIEW_SUCCESS);
        }
    }

    public void onPreviewSizeChanged(int i, int i2) {
    }

    public void onPreviewUpdate(byte[] bArr, int i, int i2, final Rect rect, final Rect rect2) {
        if (bArr != null) {
            final Bitmap rotateBitmap = d.rotateBitmap(d.a(bArr, i, i2), 90, true);
            this.mMainHandler.post(new Runnable() {
                public void run() {
                    WideSelfieProtocol wideSelfieProtocol = (WideSelfieProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(216);
                    if (wideSelfieProtocol != null) {
                        wideSelfieProtocol.updatePreviewBitmap(rotateBitmap, rect, rect2);
                    }
                }
            });
        }
    }

    public void onResume() {
        super.onResume();
        keepScreenOnAwhile();
        this.mWideSelfEngine.resume();
    }

    public void onReviewCancelClicked() {
    }

    public void onReviewDoneClicked() {
    }

    /* JADX WARNING: Missing block: B:26:0x0075, code:
            return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void onShutterButtonClick(int i) {
        if (!this.mPaused && getCameraState() != 0 && !isIgnoreTouchEvent() && !this.mActivity.isScreenSlideOff()) {
            if (isProcessingSaveTask()) {
                Log.w(TAG, "onShutterButtonClick return, isProcessingSaveTask");
                return;
            }
            setTriggerMode(i);
            if (!this.mIsShooting) {
                this.mActivity.getScreenHint().updateHint();
                if (Storage.isLowStorageAtLastPoint()) {
                    ((RecordState) ModeCoordinatorImpl.getInstance().getAttachProtocol(212)).onFailed();
                    return;
                }
                playCameraSound(2);
                startWideSelfieShooting();
                this.mWideSelfEngine.startCapture();
                this.mShootingStartTime = SystemClock.elapsedRealtime();
            } else if (isShootingTooShort()) {
                Log.w(TAG, "shooting is too short, ignore this click");
            } else {
                stopWideSelfieShooting(true, false);
            }
        }
    }

    public void onShutterButtonFocus(boolean z, int i) {
    }

    public boolean onShutterButtonLongClick() {
        return false;
    }

    public void onShutterButtonLongClickCancel(boolean z) {
        onShutterButtonFocus(false, 2);
    }

    public void onSingleTapUp(int i, int i2, boolean z) {
        if (!this.mPaused && this.mCamera2Device != null && this.mCamera2Device.isSessionReady() && isInTapableRect(i, i2)) {
            if (!isFrameAvailable()) {
                Log.w(TAG, "onSingleTapUp: frame not available");
            } else if ((!isFrontCamera() || !this.mActivity.isScreenSlideOff()) && !((BackStack) ModeCoordinatorImpl.getInstance().getAttachProtocol(171)).handleBackStackFromTapDown(i, i2)) {
                this.mMainProtocol.setFocusViewType(true);
            }
        }
    }

    public void onStop() {
        super.onStop();
    }

    @OnClickAttr
    public void onThumbnailClicked(View view) {
        if (!this.mPaused && !isProcessingSaveTask() && this.mActivity.getThumbnailUpdater().getThumbnail() != null) {
            this.mActivity.gotoGallery();
        }
    }

    public void onUserInteraction() {
        super.onUserInteraction();
        if (!this.mIsShooting) {
            keepScreenOnAwhile();
        }
    }

    public void onWideSelfCompleted() {
        Log.d(TAG, "onWideSelfCompleted");
    }

    protected void openSettingActivity() {
        Intent intent = new Intent();
        intent.setClass(this.mActivity, CameraPreferenceActivity.class);
        intent.putExtra(BasePreferenceActivity.FROM_WHERE, this.mModuleIndex);
        intent.putExtra(":miui:starting_window_label", getResources().getString(R.string.pref_camera_picturesize_entry_16_9));
        if (this.mActivity.startFromKeyguard()) {
            intent.putExtra("StartActivityWhenLocked", true);
        }
        this.mActivity.startActivity(intent);
        this.mActivity.setJumpFlag(2);
        CameraStatUtil.trackGotoSettings(this.mModuleIndex);
    }

    public void pausePreview() {
        Log.v(TAG, "pausePreview");
        this.mCamera2Device.pausePreview();
        setCameraState(0);
    }

    protected void performVolumeKeyClicked(String str, int i, boolean z) {
        if (i == 0 && z) {
            onShutterButtonClick(20);
        }
    }

    public void registerProtocol() {
        super.registerProtocol();
        ModeCoordinatorImpl.getInstance().attachProtocol(161, this);
        ModeCoordinatorImpl.getInstance().attachProtocol(199, this);
        getActivity().getImplFactory().initAdditional(getActivity(), 174, 164, 212);
    }

    public void requestRender() {
        WideSelfieProtocol wideSelfieProtocol = (WideSelfieProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(216);
        if (wideSelfieProtocol != null) {
            wideSelfieProtocol.requestRender();
        }
    }

    public void resumePreview() {
        Log.v(TAG, "resumePreview");
        this.mCamera2Device.resumePreview();
        setCameraState(1);
    }

    protected void sendOpenFailMessage() {
        this.mMainHandler.sendEmptyMessage(10);
    }

    public void setFrameAvailable(boolean z) {
        super.setFrameAvailable(z);
        if (z && CameraSettings.isCameraSoundOpen()) {
            Camera camera = this.mActivity;
            if (camera != null) {
                camera.loadCameraSound(2);
                camera.loadCameraSound(3);
            }
        }
    }

    public boolean shouldReleaseLater() {
        return isRecording();
    }

    /* JADX WARNING: Missing block: B:12:0x0023, code:
            return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void startFaceDetection() {
        if (this.mFaceDetectionEnabled && !this.mFaceDetectionStarted && isAlive() && this.mMaxFaceCount > 0 && this.mCamera2Device != null) {
            this.mFaceDetectionStarted = true;
            this.mCamera2Device.startFaceDetection();
            updateFaceView(true, true);
        }
    }

    public void startPreview() {
        synchronized (this.mDeviceLock) {
            if (this.mCamera2Device == null) {
                Log.w(TAG, "startPreview: camera has been closed");
                return;
            }
            checkDisplayOrientation();
            this.mCamera2Device.setDisplayOrientation(this.mCameraDisplayOrientation);
            if (this.mAeLockSupported) {
                this.mCamera2Device.setAELock(false);
            }
            if (this.mAwbLockSupported) {
                this.mCamera2Device.setAWBLock(false);
            }
            this.mCamera2Device.setFocusMode(this.mTargetFocusMode);
            this.mCamera2Device.resumePreview();
            setCameraState(1);
        }
    }

    public void startPreviewSession() {
        if (this.mCamera2Device == null) {
            Log.e(TAG, "startPreview: camera has been closed");
            return;
        }
        this.mCamera2Device.setDualCamWaterMarkEnable(false);
        this.mCamera2Device.setErrorCallback(this.mErrorCallback);
        this.mCamera2Device.setPreviewSize(this.mPreviewSize);
        this.mCamera2Device.setPictureSize(this.mPictureSize);
        this.mCamera2Device.setPictureMaxImages(3);
        this.mCamera2Device.setPictureFormat(35);
        this.mSurfaceCreatedTimestamp = this.mActivity.getCameraScreenNail().getSurfaceCreatedTimestamp();
        this.mCamera2Device.startPreviewSession(new Surface(this.mActivity.getCameraScreenNail().getSurfaceTexture()), true, false, getOperatingMode(), false, this);
    }

    public void startWideSelfieShooting() {
        if (isProcessingSaveTask()) {
            Log.e(TAG, "previous save task is on going");
            return;
        }
        this.mShowWarningToast = false;
        this.mFirstFrameNv21Data = null;
        this.mCaptureOrientation = this.mOrientation;
        this.mJpegRotation = Util.getJpegRotation(this.mBogusCameraId, this.mOrientation);
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("startWideSelfieShooting mJpegRotation = ");
        stringBuilder.append(this.mJpegRotation);
        Log.v(str, stringBuilder.toString());
        RecordState recordState = (RecordState) ModeCoordinatorImpl.getInstance().getAttachProtocol(212);
        recordState.onPrepare();
        this.mIsShooting = true;
        this.mLastVibratorProgress = -1;
        this.mLastMoveDirection = -1;
        this.mMaxMoveWidth = 0;
        this.mWideSelfEngine.setOrientation(this.mJpegRotation);
        synchronized (this.mDeviceLock) {
            if (this.mAeLockSupported) {
                this.mCamera2Device.setAELock(true);
            }
            if (this.mAwbLockSupported) {
                this.mCamera2Device.setAWBLock(true);
            }
            this.mCamera2Device.setGpsLocation(LocationManager.instance().getCurrentLocation());
            this.mCamera2Device.setFocusMode(1);
            this.mCamera2Device.setEnableZsl(true);
            this.mCamera2Device.setNeedPausePreview(false);
            this.mCamera2Device.setShotType(3);
            this.mCamera2Device.captureBurstPictures(100, new PictureCallbackWrapper() {
                public void onPictureTakenFinished(boolean z) {
                    String str = WideSelfieModule.TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("onPictureBurstFinished success = ");
                    stringBuilder.append(z);
                    Log.d(str, stringBuilder.toString());
                }

                public boolean onPictureTakenImageConsumed(Image image) {
                    String str = WideSelfieModule.TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("onPictureTaken>>image=");
                    stringBuilder.append(image);
                    Log.v(str, stringBuilder.toString());
                    if (image != null) {
                        byte[] dataFromImage = d.getDataFromImage(image, 2);
                        if (WideSelfieModule.this.mFirstFrameNv21Data == null) {
                            WideSelfieModule.this.mFirstFrameNv21Data = dataFromImage;
                        }
                        WideSelfieModule.this.mWideSelfEngine.onBurstCapture(dataFromImage);
                        image.close();
                    }
                    return true;
                }
            }, null);
        }
        recordState.onStart();
        keepScreenOn();
        AutoLockManager.getInstance(this.mActivity).removeMessage();
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

    public void unRegisterProtocol() {
        super.unRegisterProtocol();
        ModeCoordinatorImpl.getInstance().detachProtocol(161, this);
        ModeCoordinatorImpl.getInstance().detachProtocol(199, this);
        Camera camera = this.mActivity;
        if (camera != null) {
            camera.getImplFactory().detachAdditional();
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
}
