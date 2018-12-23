package com.android.camera2;

import android.annotation.TargetApi;
import android.graphics.Rect;
import android.graphics.RectF;
import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CameraCaptureSession.CaptureCallback;
import android.hardware.camera2.CameraCaptureSession.StateCallback;
import android.hardware.camera2.CameraConstrainedHighSpeedCaptureSession;
import android.hardware.camera2.CameraDevice;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.CaptureRequest.Builder;
import android.hardware.camera2.CaptureRequest.Key;
import android.hardware.camera2.CaptureResult;
import android.hardware.camera2.TotalCaptureResult;
import android.hardware.camera2.impl.CameraDeviceImpl;
import android.hardware.camera2.impl.CameraMetadataNative;
import android.hardware.camera2.params.MeteringRectangle;
import android.hardware.camera2.params.OutputConfiguration;
import android.hardware.camera2.utils.SurfaceUtils;
import android.location.Location;
import android.media.Image;
import android.media.ImageReader;
import android.media.ImageReader.OnImageAvailableListener;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.RemoteException;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.Range;
import android.util.Rational;
import android.util.Size;
import android.view.Surface;
import com.android.camera.CameraSettings;
import com.android.camera.CameraSize;
import com.android.camera.Util;
import com.android.camera.constant.BeautyConstant;
import com.android.camera.constant.MiCaptureRequest;
import com.android.camera.constant.MiCaptureResult;
import com.android.camera.data.DataRepository;
import com.android.camera.fragment.beauty.BeautyValues;
import com.android.camera.groupshot.GroupShot;
import com.android.camera.lib.compatibility.util.CompatibilityUtils;
import com.android.camera.log.Log;
import com.android.camera.module.ModuleManager;
import com.android.camera.module.loader.camera2.FocusTask;
import com.android.camera.parallel.AlgoConnector;
import com.android.camera.statistic.CameraStat;
import com.android.camera2.Camera2Proxy.CameraMetaDataCallback;
import com.android.camera2.Camera2Proxy.CameraPreviewCallback;
import com.android.camera2.Camera2Proxy.FocusCallback;
import com.android.camera2.Camera2Proxy.PictureCallback;
import com.android.camera2.Camera2Proxy.PreviewCallback;
import com.android.camera2.Camera2Proxy.ScreenLightCallback;
import com.android.camera2.Camera2Proxy.VideoRecordStateCallback;
import com.android.camera2.compat.MiCameraCompat;
import com.mi.config.b;
import com.xiaomi.camera.core.ParallelCallback;
import com.xiaomi.camera.core.ShotConstant;
import com.xiaomi.protocol.IImageReaderParameterSets;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Objects;

@TargetApi(21)
public class MiCamera2 extends Camera2Proxy {
    private static final int MAX_IMAGE_BUFFER_SIZE = 5;
    private static final long MAX_REALTIME_EXPOSURE_TIME = 125000000;
    private static final int MSG_WAITING_AF_LOCK_TIMEOUT = 1;
    private static final String TAG = MiCamera2.class.getSimpleName();
    public static final MeteringRectangle[] ZERO_WEIGHT_3A_REGION = new MeteringRectangle[]{new MeteringRectangle(0, 0, 0, 0, 0)};
    private CameraDevice mCameraDevice;
    private Handler mCameraHandler;
    private Handler mCameraMainThreadHandler;
    private CameraCapabilities mCapabilities;
    private PictureCaptureCallback mCaptureCallback;
    private CameraCaptureSession mCaptureSession;
    private CaptureSessionStateCallback mCaptureSessionStateCallback;
    private CameraConfigs mConfigs = new CameraConfigs();
    private ImageReader mDepthReader;
    private int mDisplayOrientation;
    private Handler mHelperHandler;
    private Range<Integer> mHighSpeedFpsRange;
    private boolean mIsPreviewCallbackEnabled;
    private boolean mIsPreviewCallbackStarted;
    private int mLockRequestHashCode;
    private MiCamera2Shot mMiCamera2Shot;
    private List<Surface> mParalleCaptureSurfaceList;
    private volatile boolean mPendingNotifyVideoEnd;
    private ImageReader mPhotoImageReader;
    private ImageReader mPortraitRawImageReader;
    private int mPrecaptureRequestHashCode;
    private ImageReader mPreviewImageReader;
    private CaptureRequest mPreviewRequest;
    private Builder mPreviewRequestBuilder;
    private Surface mPreviewSurface;
    private TotalCaptureResult mPreviewTotalResult;
    private ImageReader mRawImageReader;
    private Surface mRecordSurface;
    private int mScreenLightColorTemperature;
    private int mSessionId;
    private boolean mToTele;
    private VideoRecordStateCallback mVideoRecordStateCallback;
    private int mVideoSessionId;
    private ImageReader mVideoSnapshotImageReader;

    private class CaptureSessionStateCallback extends StateCallback {
        private WeakReference<CameraPreviewCallback> mClientCb;
        private int mId;

        public CaptureSessionStateCallback(int i, CameraPreviewCallback cameraPreviewCallback) {
            this.mId = i;
            this.mClientCb = new WeakReference(cameraPreviewCallback);
        }

        public void setClientCb(CameraPreviewCallback cameraPreviewCallback) {
            this.mClientCb = new WeakReference(cameraPreviewCallback);
        }

        public void onConfigured(@NonNull CameraCaptureSession cameraCaptureSession) {
            if (this.mId == MiCamera2.this.mSessionId) {
                String access$000 = MiCamera2.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onConfigured: id=");
                stringBuilder.append(this.mId);
                stringBuilder.append(" session=");
                stringBuilder.append(cameraCaptureSession);
                Log.d(access$000, stringBuilder.toString());
                MiCamera2.this.mCaptureSession = cameraCaptureSession;
                if (MiCamera2.this.mPendingNotifyVideoEnd && this.mId == MiCamera2.this.mVideoSessionId) {
                    MiCamera2.this.notifyVideoStreamEnd();
                    MiCamera2.this.mPendingNotifyVideoEnd = false;
                }
                try {
                    if (ModuleManager.isVideoModule() || ModuleManager.isFastMotionModule() || ModuleManager.isSlowMotionModule() || ModuleManager.isFunModule() || ModuleManager.isVideoNewSlowMotion()) {
                        MiCamera2.this.applySettingsForVideo(MiCamera2.this.mPreviewRequestBuilder);
                    } else {
                        MiCamera2.this.applySettingsForPreview(MiCamera2.this.mPreviewRequestBuilder);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
                if (this.mClientCb != null) {
                    CameraPreviewCallback cameraPreviewCallback = (CameraPreviewCallback) this.mClientCb.get();
                    if (cameraPreviewCallback != null) {
                        cameraPreviewCallback.onPreviewSessionSuccess(cameraCaptureSession);
                    }
                }
            }
        }

        public void onConfigureFailed(@NonNull CameraCaptureSession cameraCaptureSession) {
            String access$000 = MiCamera2.TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("onConfigureFailed: id=");
            stringBuilder.append(this.mId);
            stringBuilder.append(" sessionId=");
            stringBuilder.append(MiCamera2.this.mSessionId);
            Log.e(access$000, stringBuilder.toString());
            if (this.mClientCb != null) {
                CameraPreviewCallback cameraPreviewCallback = (CameraPreviewCallback) this.mClientCb.get();
                if (cameraPreviewCallback != null) {
                    cameraPreviewCallback.onPreviewSessionFailed(cameraCaptureSession);
                }
            }
        }

        public void onClosed(@NonNull CameraCaptureSession cameraCaptureSession) {
            String access$000 = MiCamera2.TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("onClosed: id=");
            stringBuilder.append(this.mId);
            stringBuilder.append(" sessionId=");
            stringBuilder.append(MiCamera2.this.mSessionId);
            Log.e(access$000, stringBuilder.toString());
            if (this.mClientCb != null) {
                CameraPreviewCallback cameraPreviewCallback = (CameraPreviewCallback) this.mClientCb.get();
                if (cameraPreviewCallback != null) {
                    cameraPreviewCallback.onPreviewSessionClosed(cameraCaptureSession);
                }
            }
        }
    }

    private class HighSpeedCaptureSessionStateCallback extends StateCallback {
        private CameraPreviewCallback mClientCb;
        private int mId;

        public HighSpeedCaptureSessionStateCallback(int i, CameraPreviewCallback cameraPreviewCallback) {
            this.mId = i;
            this.mClientCb = cameraPreviewCallback;
        }

        public void setClientCb(CameraPreviewCallback cameraPreviewCallback) {
            this.mClientCb = cameraPreviewCallback;
        }

        public void onConfigured(@NonNull CameraCaptureSession cameraCaptureSession) {
            if (this.mId == MiCamera2.this.mSessionId) {
                String access$000 = MiCamera2.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onHighSpeedConfigured: id=");
                stringBuilder.append(this.mId);
                stringBuilder.append(" highSpeedSession=");
                stringBuilder.append(cameraCaptureSession);
                Log.d(access$000, stringBuilder.toString());
                MiCamera2.this.mCaptureSession = cameraCaptureSession;
                MiCamera2.this.applySettingsForVideo(MiCamera2.this.mPreviewRequestBuilder);
                MiCameraCompat.applyIsHfrPreview(MiCamera2.this.mPreviewRequestBuilder, true);
                if (this.mClientCb != null) {
                    this.mClientCb.onPreviewSessionSuccess(cameraCaptureSession);
                }
            }
        }

        public void onConfigureFailed(@NonNull CameraCaptureSession cameraCaptureSession) {
            String access$000 = MiCamera2.TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("onHighSpeedConfigureFailed: id=");
            stringBuilder.append(this.mId);
            stringBuilder.append(" sessionId=");
            stringBuilder.append(MiCamera2.this.mSessionId);
            Log.e(access$000, stringBuilder.toString());
            if (this.mId == MiCamera2.this.mSessionId) {
                MiCamera2.this.close();
            }
            if (this.mClientCb != null) {
                this.mClientCb.onPreviewSessionFailed(cameraCaptureSession);
            }
        }

        public void onClosed(@NonNull CameraCaptureSession cameraCaptureSession) {
            String access$000 = MiCamera2.TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("onHighSpeedClosed: ");
            stringBuilder.append(cameraCaptureSession);
            Log.d(access$000, stringBuilder.toString());
            if (MiCamera2.this.mCaptureSession != null && MiCamera2.this.mCaptureSession.equals(cameraCaptureSession)) {
                MiCamera2.this.mCaptureSession = null;
            }
            if (this.mClientCb != null) {
                this.mClientCb.onPreviewSessionClosed(cameraCaptureSession);
            }
        }
    }

    private class PictureCaptureCallback extends CaptureCallback {
        private FocusTask mAutoFocusTask;
        private CaptureResult mCurrentCaptureResult;
        private int mLastResultAFState = -1;
        private FocusTask mManuallyFocusTask;
        private int mState = 0;
        private FocusTask mTorchFocusTask;

        public void setState(int i) {
            String access$000 = MiCamera2.TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("setState: ");
            stringBuilder.append(i);
            Log.d(access$000, stringBuilder.toString());
            this.mState = i;
        }

        public int getState() {
            return this.mState;
        }

        public Integer getCurrentAEState() {
            if (getCurrentCaptureResult() == null) {
                return null;
            }
            return (Integer) getCurrentCaptureResult().get(CaptureResult.CONTROL_AE_STATE);
        }

        public int getCurrentColorTemperature() {
            if (getCurrentCaptureResult() == null) {
                Log.e(MiCamera2.TAG, "getCurrentColorTemperature: CaptureResult is null !!!");
                return 0;
            }
            AWBFrameControl aWBFrameControl = CaptureResultParser.getAWBFrameControl(getCurrentCaptureResult());
            if (aWBFrameControl != null) {
                return aWBFrameControl.getColorTemperature();
            }
            return 0;
        }

        public CaptureResult getCurrentCaptureResult() {
            return this.mCurrentCaptureResult;
        }

        public void setFocusTask(FocusTask focusTask) {
            this.mManuallyFocusTask = focusTask;
        }

        public void onCaptureProgressed(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, @NonNull CaptureResult captureResult) {
            process(captureResult);
        }

        public void onCaptureCompleted(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, @NonNull TotalCaptureResult totalCaptureResult) {
            if (totalCaptureResult.getFrameNumber() == 0 && this.mState == 0) {
                String access$000 = MiCamera2.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onCaptureCompleted Sequence: ");
                stringBuilder.append(totalCaptureResult.getSequenceId());
                stringBuilder.append(" first frame received");
                Log.d(access$000, stringBuilder.toString());
            }
            MiCamera2.this.mPreviewTotalResult = totalCaptureResult;
            process(totalCaptureResult);
        }

        private void process(@NonNull CaptureResult captureResult) {
            synchronized (MiCamera2.this.mCallbackLock) {
                if (MiCamera2.this.mVideoRecordStateCallback != null) {
                    Integer num = (Integer) captureResult.get(MiCaptureResult.VIDEO_RECORD_STATE);
                    if (num != null && 2 == num.intValue()) {
                        MiCamera2.this.mVideoRecordStateCallback.onVideoRecordStopped();
                        MiCamera2.this.mVideoRecordStateCallback = null;
                    }
                }
            }
            processAfResult(captureResult);
            this.mCurrentCaptureResult = captureResult;
            if (MiCamera2.this.mToTele && CaptureResultParser.getFastZoomResult(captureResult)) {
                Log.d(MiCamera2.TAG, "process: CaptureResultParser fast zoom...");
                MiCamera2.this.setOpticalZoomToTele(false);
                MiCamera2.this.resumePreview();
            }
            Integer num2;
            Integer num3;
            switch (this.mState) {
                case 0:
                    if ((captureResult instanceof TotalCaptureResult) && MiCamera2.this.mMetadataCallback != null) {
                        MiCamera2.this.mMetadataCallback.onCameraMetaData(captureResult);
                        return;
                    }
                    return;
                case 1:
                    if ((captureResult instanceof TotalCaptureResult) && MiCamera2.this.mMetadataCallback != null) {
                        MiCamera2.this.mMetadataCallback.onCameraMetaData(captureResult);
                        return;
                    }
                    return;
                case 2:
                    num2 = (Integer) captureResult.get(CaptureResult.CONTROL_AF_STATE);
                    if (num2 != null) {
                        if (4 == num2.intValue() || 5 == num2.intValue() || 2 == num2.intValue() || 6 == num2.intValue() || (MiCamera2.this.mLockRequestHashCode == captureResult.getRequest().hashCode() && num2.intValue() == 0)) {
                            if (MiCamera2.this.mLockRequestHashCode == captureResult.getRequest().hashCode() || MiCamera2.this.mLockRequestHashCode == 0) {
                                if (MiCamera2.this.mHelperHandler != null) {
                                    MiCamera2.this.mHelperHandler.removeMessages(1);
                                }
                                MiCamera2.this.runCaptureSequence();
                                return;
                            }
                            return;
                        } else if (MiCamera2.this.mLockRequestHashCode == captureResult.getRequest().hashCode()) {
                            MiCamera2.this.mLockRequestHashCode = 0;
                            return;
                        } else {
                            return;
                        }
                    }
                    return;
                case 3:
                    num3 = (Integer) captureResult.get(CaptureResult.CONTROL_AE_STATE);
                    if (num3 == null || num3.intValue() == 3) {
                        MiCamera2.this.runCaptureSequence();
                        return;
                    }
                    return;
                case 4:
                    num2 = (Integer) captureResult.get(CaptureResult.CONTROL_AE_STATE);
                    if (num2 == null || num2.intValue() == 5 || num2.intValue() == 4 || num2.intValue() == 2) {
                        if (MiCamera2.this.mPrecaptureRequestHashCode == captureResult.getRequest().hashCode() || MiCamera2.this.mPrecaptureRequestHashCode == 0) {
                            MiCamera2.this.lockExposure(true);
                            return;
                        }
                        return;
                    } else if (MiCamera2.this.mPrecaptureRequestHashCode == captureResult.getRequest().hashCode()) {
                        MiCamera2.this.mPrecaptureRequestHashCode = 0;
                        return;
                    } else {
                        return;
                    }
                case 7:
                    num3 = (Integer) captureResult.get(CaptureResult.FLASH_STATE);
                    if (num3 == null || num3.intValue() == 2) {
                        setState(6);
                        MiCamera2.this.captureStillPicture();
                        return;
                    }
                    return;
                case 8:
                    num3 = (Integer) captureResult.get(CaptureResult.FLASH_STATE);
                    if (num3 != null && 3 == num3.intValue()) {
                        MiCamera2.this.triggerPrecapture();
                        return;
                    }
                    return;
                default:
                    return;
            }
        }

        private void processAfResult(CaptureResult captureResult) {
            Integer num = (Integer) captureResult.get(CaptureResult.CONTROL_AF_STATE);
            if (num != null) {
                FocusCallback focusCallback;
                synchronized (MiCamera2.this.mCallbackLock) {
                    focusCallback = MiCamera2.this.mFocusCallback;
                }
                if (focusCallback != null && num.intValue() != this.mLastResultAFState) {
                    Log.d(MiCamera2.TAG, String.format(Locale.ENGLISH, "afState changed from %d to %d", new Object[]{Integer.valueOf(this.mLastResultAFState), Integer.valueOf(num.intValue())}));
                    this.mLastResultAFState = num.intValue();
                    Boolean isFocusLocked;
                    if (this.mManuallyFocusTask == null) {
                        if (isAutoFocusing(num).booleanValue()) {
                            this.mAutoFocusTask = FocusTask.create(2);
                            focusCallback.onFocusStateChanged(this.mAutoFocusTask);
                        } else {
                            isFocusLocked = isFocusLocked(num);
                            if (!(isFocusLocked == null || this.mAutoFocusTask == null)) {
                                this.mAutoFocusTask.setResult(isFocusLocked.booleanValue());
                                focusCallback.onFocusStateChanged(this.mAutoFocusTask);
                                this.mAutoFocusTask = null;
                            }
                        }
                    } else if (this.mAutoFocusTask != null) {
                        this.mAutoFocusTask = null;
                    } else {
                        isFocusLocked = isFocusLocked(num);
                        if (isFocusLocked != null) {
                            this.mManuallyFocusTask.setResult(isFocusLocked.booleanValue());
                            focusCallback.onFocusStateChanged(this.mManuallyFocusTask);
                            this.mManuallyFocusTask = null;
                            setState(0);
                        }
                    }
                }
            }
        }

        public void showAutoFocusStart() {
            FocusCallback focusCallback;
            synchronized (MiCamera2.this.mCallbackLock) {
                focusCallback = MiCamera2.this.mFocusCallback;
            }
            if (focusCallback != null) {
                this.mTorchFocusTask = FocusTask.create(3);
                focusCallback.onFocusStateChanged(this.mTorchFocusTask);
            }
        }

        public void showAutoFocusFinish(boolean z) {
            if (this.mTorchFocusTask != null) {
                FocusCallback focusCallback;
                synchronized (MiCamera2.this.mCallbackLock) {
                    focusCallback = MiCamera2.this.mFocusCallback;
                }
                if (focusCallback != null) {
                    this.mTorchFocusTask.setResult(z);
                    focusCallback.onFocusStateChanged(this.mTorchFocusTask);
                    this.mTorchFocusTask = null;
                }
            }
        }

        private Boolean isFocusLocked(Integer num) {
            int intValue = num.intValue();
            if (intValue != 2) {
                switch (intValue) {
                    case 4:
                        break;
                    case 5:
                    case 6:
                        return Boolean.FALSE;
                    default:
                        return null;
                }
            }
            return Boolean.TRUE;
        }

        private Boolean isAutoFocusing(Integer num) {
            int intValue = num.intValue();
            if (intValue == 1 || intValue == 3) {
                return Boolean.TRUE;
            }
            return Boolean.FALSE;
        }
    }

    public MiCamera2(CameraDevice cameraDevice, int i, CameraCapabilities cameraCapabilities, @NonNull Handler handler, @NonNull Handler handler2) {
        super(i);
        this.mCameraDevice = cameraDevice;
        this.mCapabilities = cameraCapabilities;
        this.mCameraHandler = handler;
        this.mCameraMainThreadHandler = handler2;
        initHelperHandler(this.mCameraHandler.getLooper());
        this.mCaptureCallback = new PictureCaptureCallback();
    }

    private void initHelperHandler(Looper looper) {
        this.mHelperHandler = new Handler(looper) {
            public void handleMessage(Message message) {
                if (message.what == 1) {
                    Log.e(MiCamera2.TAG, "waiting af lock timeOut");
                    MiCamera2.this.runCaptureSequence();
                }
            }
        };
    }

    public CameraCapabilities getCapabilities() {
        return this.mCapabilities;
    }

    protected CameraDevice getCameraDevice() {
        return this.mCameraDevice;
    }

    protected CameraCaptureSession getCaptureSession() {
        return this.mCaptureSession;
    }

    protected CameraConfigs getCameraConfigs() {
        return this.mConfigs;
    }

    protected Surface getPreviewSurface() {
        return this.mPreviewSurface;
    }

    protected Surface getRecordSurface() {
        return this.mRecordSurface;
    }

    protected ImageReader getPhotoImageReader() {
        return this.mPhotoImageReader;
    }

    protected ImageReader getDepthImageReader() {
        return this.mDepthReader;
    }

    protected ImageReader getPortraitRawImageReader() {
        return this.mPortraitRawImageReader;
    }

    protected ImageReader getVideoSnapshotImageReader() {
        return this.mVideoSnapshotImageReader;
    }

    protected Builder getPreviewRequestBuilder() {
        return this.mPreviewRequestBuilder;
    }

    protected List<Surface> getRemoteSurfaceList() {
        return this.mParalleCaptureSurfaceList;
    }

    private void preparePhotoImageReader(@NonNull CameraSize cameraSize, int i, int i2) {
        if (this.mPhotoImageReader != null) {
            this.mPhotoImageReader.close();
        }
        this.mPhotoImageReader = ImageReader.newInstance(cameraSize.getWidth(), cameraSize.getHeight(), i, i2);
        this.mPhotoImageReader.setOnImageAvailableListener(new OnImageAvailableListener() {
            public void onImageAvailable(ImageReader imageReader) {
                Log.d(MiCamera2.TAG, "onImageAvailable: main");
                Image acquireNextImage = imageReader.acquireNextImage();
                if (acquireNextImage != null && MiCamera2.this.mMiCamera2Shot != null) {
                    MiCamera2.this.mMiCamera2Shot.onImageReceived(acquireNextImage, 1);
                }
            }
        }, this.mCameraHandler);
    }

    private void preparePhotoImageReader() {
        preparePhotoImageReader(this.mConfigs.getPhotoSize(), this.mConfigs.getPhotoFormat(), this.mConfigs.getPhotoMaxImages());
    }

    private void preparePreviewImageReader() {
        preparePreviewImageReader(this.mConfigs.getPreviewSize(), this.mConfigs.getPreviewFormat(), this.mConfigs.getPreviewMaxImages(), null);
    }

    private void preparePreviewImageReader(@NonNull CameraSize cameraSize, int i, int i2, Handler handler) {
        if (this.mPreviewImageReader != null) {
            this.mPreviewImageReader.close();
        }
        this.mPreviewImageReader = ImageReader.newInstance(cameraSize.getWidth(), cameraSize.getHeight(), i, i2);
        ImageReader imageReader = this.mPreviewImageReader;
        OnImageAvailableListener anonymousClass3 = new OnImageAvailableListener() {
            public void onImageAvailable(ImageReader imageReader) {
                Image acquireNextImage = imageReader.acquireNextImage();
                if (acquireNextImage != null) {
                    PreviewCallback previewCallback = MiCamera2.this.getPreviewCallback();
                    if (previewCallback != null) {
                        previewCallback.onPreviewFrame(acquireNextImage, MiCamera2.this);
                    }
                    acquireNextImage.close();
                }
            }
        };
        if (handler == null) {
            handler = this.mCameraMainThreadHandler;
        }
        imageReader.setOnImageAvailableListener(anonymousClass3, handler);
    }

    private void prepareRawImageReader(@NonNull CameraSize cameraSize) {
        if (this.mRawImageReader != null) {
            this.mRawImageReader.close();
        }
        OnImageAvailableListener anonymousClass4 = new OnImageAvailableListener() {
            public void onImageAvailable(ImageReader imageReader) {
                Image acquireNextImage = imageReader.acquireNextImage();
                if (MiCamera2.this.mRawCallBack != null) {
                    byte[] firstPlane = Util.getFirstPlane(acquireNextImage);
                    if (firstPlane != null) {
                        MiCamera2.this.mRawCallBack.onPictureTaken(firstPlane);
                    }
                }
                acquireNextImage.close();
            }
        };
        this.mRawImageReader = ImageReader.newInstance(cameraSize.getWidth(), cameraSize.getHeight(), 37, 2);
        this.mRawImageReader.setOnImageAvailableListener(anonymousClass4, this.mCameraHandler);
    }

    private void prepareVideoSnapshotImageReader(CameraSize cameraSize) {
        if (this.mVideoSnapshotImageReader != null) {
            this.mVideoSnapshotImageReader.close();
        }
        OnImageAvailableListener anonymousClass5 = new OnImageAvailableListener() {
            public void onImageAvailable(ImageReader imageReader) {
                Image acquireNextImage = imageReader.acquireNextImage();
                if (acquireNextImage != null && MiCamera2.this.mMiCamera2Shot != null) {
                    MiCamera2.this.mMiCamera2Shot.onImageReceived(acquireNextImage, 1);
                }
            }
        };
        this.mVideoSnapshotImageReader = ImageReader.newInstance(cameraSize.getWidth(), cameraSize.getHeight(), 256, 2);
        this.mVideoSnapshotImageReader.setOnImageAvailableListener(anonymousClass5, this.mCameraHandler);
    }

    private void prepareDepthImageReader(CameraSize cameraSize) {
        if (this.mDepthReader != null) {
            this.mDepthReader.close();
        }
        OnImageAvailableListener anonymousClass6 = new OnImageAvailableListener() {
            public void onImageAvailable(ImageReader imageReader) {
                Image acquireNextImage = imageReader.acquireNextImage();
                if (acquireNextImage != null && MiCamera2.this.mMiCamera2Shot != null) {
                    MiCamera2.this.mMiCamera2Shot.onImageReceived(acquireNextImage, 3);
                }
            }
        };
        this.mDepthReader = ImageReader.newInstance(cameraSize.getWidth() / 2, cameraSize.getHeight() / 2, 540422489, 2);
        this.mDepthReader.setOnImageAvailableListener(anonymousClass6, this.mCameraHandler);
    }

    private void preparePortraitRawImageReader(CameraSize cameraSize) {
        if (this.mPortraitRawImageReader != null) {
            this.mPortraitRawImageReader.close();
        }
        OnImageAvailableListener anonymousClass7 = new OnImageAvailableListener() {
            public void onImageAvailable(ImageReader imageReader) {
                Image acquireNextImage = imageReader.acquireNextImage();
                if (acquireNextImage != null && MiCamera2.this.mMiCamera2Shot != null) {
                    MiCamera2.this.mMiCamera2Shot.onImageReceived(acquireNextImage, 2);
                }
            }
        };
        this.mPortraitRawImageReader = ImageReader.newInstance(cameraSize.getWidth(), cameraSize.getHeight(), 256, 2);
        this.mPortraitRawImageReader.setOnImageAvailableListener(anonymousClass7, this.mCameraHandler);
    }

    public void close() {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("E: close: cameraId = ");
        stringBuilder.append(getId());
        Log.d(str, stringBuilder.toString());
        if (this.mCameraDevice != null) {
            if (b.qT || b.qP) {
                try {
                    ((CameraDeviceImpl) this.mCameraDevice).flush();
                } catch (CameraAccessException e) {
                    e.printStackTrace();
                }
            }
            this.mCameraDevice.close();
        }
        if (this.mPhotoImageReader != null) {
            this.mPhotoImageReader.close();
        }
        if (this.mPreviewImageReader != null) {
            this.mPreviewImageReader.close();
        }
        if (this.mRawImageReader != null) {
            this.mRawImageReader.close();
        }
        if (this.mVideoSnapshotImageReader != null) {
            this.mVideoSnapshotImageReader.close();
        }
        if (this.mMiCamera2Shot != null) {
            this.mMiCamera2Shot.makeClobber();
            this.mMiCamera2Shot = null;
        }
        reset();
        str = TAG;
        stringBuilder = new StringBuilder();
        stringBuilder.append("X: close: cameraId = ");
        stringBuilder.append(getId());
        Log.d(str, stringBuilder.toString());
    }

    private void reset() {
        Log.v(TAG, "E: reset");
        this.mCameraDevice = null;
        this.mPreviewSurface = null;
        this.mRecordSurface = null;
        this.mCaptureSession = null;
        this.mSessionId = 0;
        this.mPhotoImageReader = null;
        this.mRawImageReader = null;
        this.mPreviewImageReader = null;
        this.mVideoSnapshotImageReader = null;
        this.mDepthReader = null;
        this.mPortraitRawImageReader = null;
        releaseCameraPreviewCallback(null);
        Log.v(TAG, "X: reset");
    }

    private List<Surface> prepareRemoteImageReader() {
        List arrayList = new ArrayList();
        arrayList.add(new IImageReaderParameterSets(this.mConfigs.getPhotoSize().getWidth(), this.mConfigs.getPhotoSize().getHeight(), 35, 5, 1));
        if (this.mConfigs.getShotType() == 6) {
            arrayList.add(new IImageReaderParameterSets(this.mConfigs.getSubPhotoSize().getWidth(), this.mConfigs.getSubPhotoSize().getHeight(), 35, 5, 0));
        }
        try {
            return AlgoConnector.getInstance().getLocalBinder().configCaptureOutputBuffer(arrayList);
        } catch (RemoteException e) {
            e.printStackTrace();
            return null;
        }
    }

    public void startPreviewSession(@Nullable Surface surface, boolean z, boolean z2, int i, CameraPreviewCallback cameraPreviewCallback) {
        startPreviewSession(surface, z, z2, i, cameraPreviewCallback, null);
    }

    public void startPreviewSession(@Nullable Surface surface, boolean z, boolean z2, int i, CameraPreviewCallback cameraPreviewCallback, Handler handler) {
        if (checkCameraDevice("startPreviewSession")) {
            Log.d(TAG, String.format(Locale.ENGLISH, "startPreviewSession: opMode=0x%x %b %b", new Object[]{Integer.valueOf(i), Boolean.valueOf(z), Boolean.valueOf(z2)}));
            this.mPreviewSurface = surface;
            this.mIsPreviewCallbackEnabled = z;
            this.mSessionId = genSessionId();
            ArrayList arrayList = new ArrayList();
            arrayList.add(this.mPreviewSurface);
            try {
                if (ShotConstant.isParallelEnabled(this.mConfigs.getShotType())) {
                    this.mParalleCaptureSurfaceList = prepareRemoteImageReader();
                    arrayList.addAll(this.mParalleCaptureSurfaceList);
                } else {
                    preparePhotoImageReader();
                    arrayList.add(this.mPhotoImageReader.getSurface());
                    if (CameraSettings.needDepth()) {
                        prepareDepthImageReader(this.mConfigs.getPhotoSize());
                        arrayList.add(this.mDepthReader.getSurface());
                        preparePortraitRawImageReader(this.mConfigs.getPhotoSize());
                        arrayList.add(this.mPortraitRawImageReader.getSurface());
                    }
                }
                this.mPreviewRequestBuilder = this.mCameraDevice.createCaptureRequest(1);
                this.mPreviewRequestBuilder.addTarget(surface);
                this.mCaptureSession = null;
                if (z) {
                    preparePreviewImageReader(this.mConfigs.getPreviewSize(), this.mConfigs.getPreviewFormat(), this.mConfigs.getPreviewMaxImages(), handler);
                    arrayList.add(this.mPreviewImageReader.getSurface());
                }
                if (z2) {
                    prepareRawImageReader(this.mConfigs.getPhotoSize());
                    arrayList.add(this.mRawImageReader.getSurface());
                }
                this.mCaptureSessionStateCallback = new CaptureSessionStateCallback(this.mSessionId, cameraPreviewCallback);
                List arrayList2 = new ArrayList(arrayList.size());
                Iterator it = arrayList.iterator();
                while (it.hasNext()) {
                    arrayList2.add(new OutputConfiguration((Surface) it.next()));
                }
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("startPreviewSession: operatingMode = ");
                stringBuilder.append(i);
                Log.d(str, stringBuilder.toString());
                this.mCameraDevice.createCustomCaptureSession(null, arrayList2, i, this.mCaptureSessionStateCallback, this.mCameraHandler);
            } catch (Throwable e) {
                Log.e(TAG, "Failed to start preview session", e);
                notifyOnError(e.getReason());
            } catch (Throwable e2) {
                Log.e(TAG, "Failed to start preview session, IllegalState", e2);
                notifyOnError(256);
            } catch (Throwable e22) {
                Log.e(TAG, "Failed to start preview session, IllegalArgument", e22);
                notifyOnError(256);
            }
        }
    }

    public void startRecordSession(@NonNull Surface surface, @NonNull Surface surface2, boolean z, int i, CameraPreviewCallback cameraPreviewCallback) {
        if (checkCameraDevice("startRecordSession")) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("startRecordSession: previewSurface=");
            stringBuilder.append(surface);
            stringBuilder.append(" recordSurface=");
            stringBuilder.append(surface2);
            Log.d(str, stringBuilder.toString());
            this.mPreviewSurface = surface;
            this.mRecordSurface = surface2;
            this.mSessionId = genSessionId();
            this.mVideoSessionId = this.mSessionId;
            try {
                this.mPreviewRequestBuilder = this.mCameraDevice.createCaptureRequest(3);
                this.mPreviewRequestBuilder.addTarget(this.mPreviewSurface);
                if (this.mConfigs.isEISEnabled()) {
                    this.mPreviewRequestBuilder.set(MiCaptureRequest.VIDEO_RECORD_CONTROL, Integer.valueOf(0));
                }
                this.mCaptureSession = null;
                List asList;
                if (z) {
                    prepareVideoSnapshotImageReader(this.mConfigs.getVideoSnapshotSize());
                    asList = Arrays.asList(new Surface[]{this.mPreviewSurface, this.mRecordSurface, this.mVideoSnapshotImageReader.getSurface()});
                } else {
                    asList = Arrays.asList(new Surface[]{this.mPreviewSurface, this.mRecordSurface});
                }
                List arrayList = new ArrayList(asList.size());
                for (Surface surface22 : asList) {
                    arrayList.add(new OutputConfiguration(surface22));
                }
                this.mCameraDevice.createCustomCaptureSession(null, arrayList, i, new CaptureSessionStateCallback(this.mSessionId, cameraPreviewCallback), this.mCameraHandler);
            } catch (Throwable e) {
                Log.e(TAG, "Failed to start recording session", e);
                notifyOnError(e.getReason());
            } catch (Throwable e2) {
                Log.e(TAG, "Failed to start recording session, IllegalState", e2);
                notifyOnError(256);
            }
        }
    }

    public void startHighSpeedRecordSession(@NonNull Surface surface, @NonNull Surface surface2, Range<Integer> range, CameraPreviewCallback cameraPreviewCallback) {
        if (checkCameraDevice("startHighSpeedRecordSession")) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("startHighSpeedRecordSession: previewSurface=");
            stringBuilder.append(surface);
            stringBuilder.append(" recordSurface=");
            stringBuilder.append(surface2);
            Log.d(str, stringBuilder.toString());
            this.mPreviewSurface = surface;
            this.mRecordSurface = surface2;
            this.mHighSpeedFpsRange = range;
            this.mSessionId = genSessionId();
            try {
                this.mPreviewRequestBuilder = this.mCameraDevice.createCaptureRequest(3);
                this.mPreviewRequestBuilder.addTarget(this.mPreviewSurface);
                this.mPreviewRequestBuilder.addTarget(this.mRecordSurface);
                this.mPreviewRequestBuilder.set(CaptureRequest.CONTROL_AE_TARGET_FPS_RANGE, this.mHighSpeedFpsRange);
                this.mCaptureSession = null;
                List<Surface> asList = Arrays.asList(new Surface[]{this.mPreviewSurface, this.mRecordSurface});
                if (((Integer) this.mHighSpeedFpsRange.getUpper()).intValue() == 120) {
                    List arrayList = new ArrayList();
                    for (Surface surface22 : asList) {
                        arrayList.add(new OutputConfiguration(surface22));
                    }
                    this.mCameraDevice.createCustomCaptureSession(null, arrayList, 32888, new HighSpeedCaptureSessionStateCallback(this.mSessionId, cameraPreviewCallback), this.mCameraHandler);
                } else {
                    this.mCameraDevice.createConstrainedHighSpeedCaptureSession(asList, new HighSpeedCaptureSessionStateCallback(this.mSessionId, cameraPreviewCallback), this.mCameraHandler);
                }
            } catch (Throwable e) {
                notifyOnError(-1);
                Log.e(TAG, "Failed to start high speed record session", e);
                close();
            }
        }
    }

    public void notifyVideoStreamEnd() {
        if (this.mCaptureSession == null) {
            Log.w(TAG, "notifyVideoStreamEnd: session is not ready");
            this.mPendingNotifyVideoEnd = true;
            return;
        }
        try {
            this.mCaptureSession.stopRepeating();
            Builder createCaptureRequest = this.mCameraDevice.createCaptureRequest(3);
            createCaptureRequest.addTarget(this.mPreviewSurface);
            applySettingsForVideo(createCaptureRequest);
            MiCameraCompat.applyVideoStreamState(createCaptureRequest, false);
            int capture = capture(createCaptureRequest.build(), this.mCaptureCallback, this.mCameraHandler);
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("notifyVideoStreamEnd: requestId=");
            stringBuilder.append(capture);
            Log.v(str, stringBuilder.toString());
        } catch (Throwable e) {
            Log.e(TAG, e.getMessage(), e);
            notifyOnError(e.getReason());
        }
    }

    public void startRecording() {
        if (checkCaptureSession("startRecording")) {
            try {
                Log.d(TAG, "E: startRecording");
                if (this.mConfigs.isEISEnabled()) {
                    setVideoRecordControl(1);
                }
                this.mPreviewRequestBuilder = this.mCameraDevice.createCaptureRequest(3);
                this.mPreviewRequestBuilder.addTarget(this.mPreviewSurface);
                this.mPreviewRequestBuilder.addTarget(this.mRecordSurface);
                applySettingsForVideo(this.mPreviewRequestBuilder);
                resumePreview();
                Log.d(TAG, "X: startRecording");
            } catch (Throwable e) {
                Log.e(TAG, "Failed to start recording", e);
                notifyOnError(e.getReason());
            } catch (Throwable e2) {
                Log.e(TAG, "Failed to start recording, IllegalState", e2);
                notifyOnError(256);
            }
        }
    }

    public void stopRecording(VideoRecordStateCallback videoRecordStateCallback) {
        if (checkCaptureSession("stopRecording")) {
            Log.d(TAG, "stopRecording");
            if (this.mConfigs.isEISEnabled()) {
                synchronized (this.mCallbackLock) {
                    this.mVideoRecordStateCallback = videoRecordStateCallback;
                }
                try {
                    setVideoRecordControl(2);
                } catch (CameraAccessException e) {
                    e.printStackTrace();
                    Log.e(TAG, "Failed to stop recording");
                    notifyOnError(e.getReason());
                } catch (Throwable e2) {
                    Log.e(TAG, "Failed to stop recording, IllegalState", e2);
                    notifyOnError(256);
                }
            }
        }
    }

    private void setVideoRecordControl(int i) throws CameraAccessException {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("setVideoRecordControl: ");
        stringBuilder.append(i);
        Log.d(str, stringBuilder.toString());
        Builder createCaptureRequest = this.mCameraDevice.createCaptureRequest(3);
        createCaptureRequest.addTarget(this.mPreviewSurface);
        createCaptureRequest.addTarget(this.mRecordSurface);
        applySettingsForVideo(createCaptureRequest);
        createCaptureRequest.set(MiCaptureRequest.VIDEO_RECORD_CONTROL, Integer.valueOf(i));
        capture(createCaptureRequest.build(), this.mCaptureCallback, this.mCameraHandler);
    }

    public void startHighSpeedRecording() {
        if (checkCaptureSession("startHighSpeedRecording")) {
            Log.d(TAG, "startHighSpeedRecording");
            MiCameraCompat.applyIsHfrPreview(this.mPreviewRequestBuilder, false);
            resumePreview();
        }
    }

    public void startRecordPreview() {
        if (checkCameraDevice("startRecordPreview")) {
            Log.d(TAG, "startRecordPreview");
            synchronized (this.mCallbackLock) {
                this.mVideoRecordStateCallback = null;
            }
            try {
                this.mPreviewRequestBuilder = this.mCameraDevice.createCaptureRequest(3);
                this.mPreviewRequestBuilder.addTarget(this.mPreviewSurface);
                if (this.mConfigs.isEISEnabled()) {
                    this.mPreviewRequestBuilder.set(MiCaptureRequest.VIDEO_RECORD_CONTROL, Integer.valueOf(0));
                }
                applySettingsForVideo(this.mPreviewRequestBuilder);
                resumePreview();
            } catch (Throwable e) {
                Log.e(TAG, "Failed to start record preview", e);
                notifyOnError(e.getReason());
            } catch (Throwable e2) {
                Log.e(TAG, "Failed to start record preview, IllegalState", e2);
                notifyOnError(256);
            }
        }
    }

    public void startHighSpeedRecordPreview() {
        if (checkCameraDevice("startHighSpeedRecordPreview")) {
            Log.d(TAG, "startHighSpeedRecordPreview");
            applySettingsForVideo(this.mPreviewRequestBuilder);
            MiCameraCompat.applyIsHfrPreview(this.mPreviewRequestBuilder, true);
            resumePreview();
        }
    }

    private void cancelSession() {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("cancelSession: id=");
        stringBuilder.append(getId());
        Log.d(str, stringBuilder.toString());
        try {
            this.mSessionId = genSessionId();
            if (this.mCaptureSession != null) {
                this.mCaptureSession.stopRepeating();
                this.mCaptureSession.abortCaptures();
                this.mCaptureSession.close();
                this.mCaptureSession = null;
            }
        } catch (Throwable e) {
            Log.e(TAG, "Failed to stop repeating session", e);
            notifyOnError(e.getReason());
        } catch (Throwable e2) {
            Log.e(TAG, "Failed to stop repeating, IllegalState", e2);
            notifyOnError(256);
        }
    }

    public void resumePreview() {
        if (checkCaptureSession("resumePreview")) {
            boolean z = this.mCaptureSession instanceof CameraConstrainedHighSpeedCaptureSession;
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("resumePreview: cameraId=");
            stringBuilder.append(getId());
            stringBuilder.append(" highSpeed=");
            stringBuilder.append(z);
            Log.v(str, stringBuilder.toString());
            if (z) {
                try {
                    this.mPreviewRequest = this.mPreviewRequestBuilder.build();
                    this.mCaptureSession.setRepeatingBurst(createHighSpeedRequestList(this.mPreviewRequest), this.mCaptureCallback, this.mCameraHandler);
                } catch (Throwable e) {
                    Log.e(TAG, "Failed to resume preview", e);
                    notifyOnError(e.getReason());
                } catch (Throwable e2) {
                    Log.e(TAG, "Failed to resume preview, IllegalState", e2);
                    notifyOnError(256);
                }
            } else {
                this.mPreviewRequest = this.mPreviewRequestBuilder.build();
                int repeatingRequest = this.mCaptureSession.setRepeatingRequest(this.mPreviewRequest, this.mCaptureCallback, this.mCameraHandler);
                str = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("repeating sequenceId: ");
                stringBuilder.append(repeatingRequest);
                Log.d(str, stringBuilder.toString());
            }
        }
    }

    public void pausePreview() {
        if (checkCaptureSession("pausePreview")) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("pausePreview: cameraId=");
            stringBuilder.append(getId());
            Log.v(str, stringBuilder.toString());
            try {
                this.mCaptureSession.stopRepeating();
            } catch (CameraAccessException e) {
                e.printStackTrace();
                Log.e(TAG, "Failed to pause preview");
                notifyOnError(e.getReason());
            } catch (Throwable e2) {
                Log.e(TAG, "Failed to pause preview, IllegalState", e2);
                notifyOnError(256);
            }
        }
    }

    public void releasePreview() {
        if (this.mCaptureSession != null) {
            if (this.mHelperHandler != null) {
                this.mHelperHandler.removeCallbacksAndMessages(null);
                this.mHelperHandler = null;
            }
            try {
                Log.v(TAG, "E: releasePreview");
                this.mCaptureSession.stopRepeating();
                this.mCaptureSession.close();
                this.mCaptureSession = null;
                Log.v(TAG, "X: releasePreview");
            } catch (CameraAccessException e) {
                e.printStackTrace();
                Log.e(TAG, "Failed to release preview");
                notifyOnError(e.getReason());
            } catch (Throwable e2) {
                Log.e(TAG, "Failed to release preview, IllegalState", e2);
                notifyOnError(256);
            }
        }
    }

    public void resetConfigs() {
        Log.v(TAG, "E: resetConfigs");
        if (this.mConfigs != null) {
            this.mConfigs = new CameraConfigs();
        }
        this.mSessionId = 0;
        releaseCameraPreviewCallback(null);
        Log.v(TAG, "X: resetConfigs");
    }

    public void startPreviewCallback(@NonNull PreviewCallback previewCallback) {
        if (checkCaptureSession("startPreviewCallback")) {
            Log.v(TAG, "startPreviewCallback");
            if (this.mIsPreviewCallbackEnabled) {
                setPreviewCallback(previewCallback);
                if (!this.mIsPreviewCallbackStarted) {
                    this.mIsPreviewCallbackStarted = true;
                    this.mPreviewRequestBuilder.addTarget(this.mPreviewImageReader.getSurface());
                    resumePreview();
                }
            }
        }
    }

    public void releaseCameraPreviewCallback(@Nullable CameraPreviewCallback cameraPreviewCallback) {
        if (this.mCaptureSessionStateCallback != null) {
            this.mCaptureSessionStateCallback.setClientCb(cameraPreviewCallback);
        }
    }

    public void releasePictureCallback() {
        setPictureCallback(null);
    }

    public void stopPreviewCallback(boolean z) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("stopPreviewCallback(): isRelease = ");
        stringBuilder.append(z);
        Log.v(str, stringBuilder.toString());
        if (this.mIsPreviewCallbackEnabled && this.mIsPreviewCallbackStarted && this.mPreviewImageReader != null) {
            this.mIsPreviewCallbackStarted = false;
            setPreviewCallback(null);
            Surface surface = this.mPreviewImageReader.getSurface();
            this.mPreviewRequestBuilder.removeTarget(surface);
            surface.release();
            if (!z && checkCaptureSession("stopPreviewCallback")) {
                resumePreview();
            }
        }
    }

    public void setShotType(int i) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("");
        stringBuilder.append(i);
        Log.e("algo setShotType: ", stringBuilder.toString());
        this.mConfigs.setShotType(i);
    }

    public void setShotSavePath(String str) {
        Log.e("algo setParallelPath: ", str);
        this.mConfigs.setShotPath(str);
    }

    public String getShotSavePath() {
        return this.mConfigs.getShotPath();
    }

    public void takePicture(@NonNull PictureCallback pictureCallback, @NonNull ParallelCallback parallelCallback) {
        Log.v(TAG, "takePicture");
        setPictureCallback(pictureCallback);
        setParallelCallback(parallelCallback);
        triggerCapture();
    }

    public void captureGroupShotPictures(@NonNull PictureCallback pictureCallback, @NonNull ParallelCallback parallelCallback, int i, GroupShot groupShot) {
        setPictureCallback(pictureCallback);
        setParallelCallback(parallelCallback);
        this.mMiCamera2Shot = new MiCamera2ShotGroup(this, i, groupShot);
        this.mMiCamera2Shot.startShot();
    }

    public void captureBurstPictures(int i, @NonNull PictureCallback pictureCallback, @NonNull ParallelCallback parallelCallback) {
        setPictureCallback(pictureCallback);
        setParallelCallback(parallelCallback);
        this.mMiCamera2Shot = new MiCamera2ShotBurst(this, i);
        this.mMiCamera2Shot.startShot();
    }

    public void captureAbortBurst() {
        Log.d(TAG, "captureAbortBurst");
        try {
            this.mCaptureSession.stopRepeating();
        } catch (CameraAccessException e) {
            e.printStackTrace();
            notifyOnError(e.getReason());
        } catch (Throwable e2) {
            Log.e(TAG, "Failed to abort burst, IllegalState", e2);
            notifyOnError(256);
        }
    }

    public void cancelFocus(int i) {
        if (checkCaptureSession("cancelFocus")) {
            if (1 == this.mCaptureCallback.getState()) {
                this.mCaptureCallback.setState(0);
            }
            try {
                Builder initFocusRequestBuilder = initFocusRequestBuilder(i);
                initFocusRequestBuilder.set(CaptureRequest.CONTROL_AF_MODE, Integer.valueOf(1));
                initFocusRequestBuilder.set(CaptureRequest.CONTROL_AF_TRIGGER, Integer.valueOf(2));
                applyZoomRatio(initFocusRequestBuilder);
                applyFlashMode(initFocusRequestBuilder, 1);
                applyAWBMode(initFocusRequestBuilder);
                applyCustomAWB(initFocusRequestBuilder);
                applyExposureCompensation(initFocusRequestBuilder, 1);
                applyAntiShake(initFocusRequestBuilder);
                if (ModuleManager.isCapture()) {
                    applyContrast(initFocusRequestBuilder);
                    applySaturation(initFocusRequestBuilder);
                    applySharpness(initFocusRequestBuilder);
                }
                if (ModuleManager.isManualModule()) {
                    applyIso(initFocusRequestBuilder, 1);
                    applyExposureTime(initFocusRequestBuilder, 1);
                }
                applyFpsRange(initFocusRequestBuilder);
                capture(initFocusRequestBuilder.build(), this.mCaptureCallback, this.mCameraHandler);
                this.mConfigs.setAERegions(null);
                this.mConfigs.setAFRegions(null);
                setAFModeToPreview(this.mConfigs.getFocusMode());
            } catch (CameraAccessException e) {
                e.printStackTrace();
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("cancelFocus: ");
                stringBuilder.append(e.getMessage());
                Log.e(str, stringBuilder.toString());
                notifyOnError(e.getReason());
            } catch (Throwable e2) {
                Log.e(TAG, "Failed to cancel focus, IllegalState", e2);
                notifyOnError(256);
            }
        }
    }

    private void setAFModeToPreview(int i) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("setAFModeToPreview: focusMode=");
        stringBuilder.append(i);
        Log.d(str, stringBuilder.toString());
        this.mPreviewRequestBuilder.set(CaptureRequest.CONTROL_AF_MODE, Integer.valueOf(i));
        this.mPreviewRequestBuilder.set(CaptureRequest.CONTROL_AF_TRIGGER, Integer.valueOf(0));
        applyAFRegions(this.mPreviewRequestBuilder);
        applyAERegions(this.mPreviewRequestBuilder);
        resumePreview();
    }

    public void startFaceDetection() {
        Log.v(TAG, "startFaceDetection");
        this.mConfigs.setFaceDetectionEnabled(true);
        applyFaceDetection(this.mPreviewRequestBuilder);
        resumePreview();
    }

    public void stopFaceDetection() {
        Log.v(TAG, "stopFaceDetection");
        this.mConfigs.setFaceDetectionEnabled(false);
        applyFaceDetection(this.mPreviewRequestBuilder);
        resumePreview();
    }

    public void startObjectTrack(RectF rectF) {
    }

    public void stopObjectTrack() {
    }

    private Builder initFocusRequestBuilder(int i) throws CameraAccessException {
        Builder createCaptureRequest;
        switch (i) {
            case 161:
            case 163:
            case 165:
            case 167:
            case 171:
            case 173:
            case 174:
                createCaptureRequest = this.mCameraDevice.createCaptureRequest(1);
                break;
            case 162:
            case 168:
            case 169:
            case 170:
            case 172:
                createCaptureRequest = this.mCameraDevice.createCaptureRequest(3);
                break;
            default:
                createCaptureRequest = null;
                break;
        }
        createCaptureRequest.addTarget(this.mPreviewSurface);
        if (this.mCaptureSession instanceof CameraConstrainedHighSpeedCaptureSession) {
            createCaptureRequest.addTarget(this.mRecordSurface);
            createCaptureRequest.set(CaptureRequest.CONTROL_AE_TARGET_FPS_RANGE, this.mHighSpeedFpsRange);
        }
        return createCaptureRequest;
    }

    public void startFocus(FocusTask focusTask, int i) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("startFocus: ");
        stringBuilder.append(i);
        Log.v(str, stringBuilder.toString());
        try {
            this.mCaptureCallback.setFocusTask(focusTask);
            this.mCaptureCallback.setState(1);
            Builder initFocusRequestBuilder = initFocusRequestBuilder(i);
            initFocusRequestBuilder.set(CaptureRequest.CONTROL_MODE, Integer.valueOf(1));
            addFocusCaptureKeysToRequest(initFocusRequestBuilder);
            initFocusRequestBuilder.set(CaptureRequest.CONTROL_AF_TRIGGER, Integer.valueOf(1));
            capture(initFocusRequestBuilder.build(), this.mCaptureCallback, this.mCameraHandler);
            this.mConfigs.setFocusMode(1);
            this.mPreviewRequestBuilder.set(CaptureRequest.CONTROL_MODE, Integer.valueOf(1));
            if (ModuleManager.isVideoModule() || ModuleManager.isFastMotionModule() || ModuleManager.isSlowMotionModule() || ModuleManager.isFunModule() || ModuleManager.isVideoNewSlowMotion()) {
                applySettingsForVideo(this.mPreviewRequestBuilder);
            } else {
                applySettingsForPreview(this.mPreviewRequestBuilder);
            }
            resumePreview();
        } catch (CameraAccessException e) {
            e.printStackTrace();
            Log.e(TAG, "Failed to start focus");
            notifyOnError(e.getReason());
        }
    }

    private void addFocusCaptureKeysToRequest(Builder builder) {
        applyAFRegions(builder);
        applyAERegions(builder);
        applyZoomRatio(builder);
        applyAWBMode(builder);
        applyCustomAWB(builder);
        applyExposureCompensation(builder, 1);
        applyAntiShake(builder);
        if (ModuleManager.isCapture()) {
            applyContrast(builder);
            applySaturation(builder);
            applySharpness(builder);
        }
        if (ModuleManager.isManualModule()) {
            applyIso(builder, 1);
            applyExposureTime(builder, 1);
        }
        builder.set(CaptureRequest.CONTROL_AF_MODE, Integer.valueOf(1));
        builder.set(CaptureRequest.CONTROL_AF_TRIGGER, Integer.valueOf(0));
        applyFlashMode(builder, 1);
        applyFpsRange(builder);
    }

    public boolean isSessionReady() {
        return this.mCaptureSession != null;
    }

    public void setPreviewSize(CameraSize cameraSize) {
        if (!Objects.equals(this.mConfigs.getPreviewSize(), cameraSize)) {
            this.mConfigs.setPreviewSize(cameraSize);
            if (this.mIsPreviewCallbackEnabled) {
                preparePreviewImageReader();
            }
        }
    }

    public CameraSize getPreviewSize() {
        return this.mConfigs.getPreviewSize();
    }

    public void setPreviewFormat(int i) {
        if (i != this.mConfigs.getPreviewFormat()) {
            this.mConfigs.setPreviewFormat(i);
            if (this.mIsPreviewCallbackEnabled) {
                preparePreviewImageReader();
            }
        }
    }

    public int getPreviewFormat() {
        return this.mConfigs.getPreviewFormat();
    }

    public void setPreviewMaxImages(int i) {
        if (i > this.mConfigs.getPreviewMaxImages()) {
            this.mConfigs.setPreviewMaxImages(i);
            if (this.mIsPreviewCallbackEnabled) {
                preparePreviewImageReader();
            }
        }
    }

    public int getPreviewMaxImages() {
        return this.mConfigs.getPreviewMaxImages();
    }

    public void setPictureSize(CameraSize cameraSize) {
        if (!Objects.equals(this.mConfigs.getPhotoSize(), cameraSize)) {
            this.mConfigs.setPhotoSize(cameraSize);
            preparePhotoImageReader();
        }
    }

    public CameraSize getPictureSize() {
        return this.mConfigs.getPhotoSize();
    }

    public void setSubPictureSize(CameraSize cameraSize) {
        if (!Objects.equals(this.mConfigs.getSubPhotoSize(), cameraSize)) {
            this.mConfigs.setSubPhotoSize(cameraSize);
        }
    }

    public void setPictureFormat(int i) {
        if (this.mConfigs.getPhotoFormat() != i) {
            this.mConfigs.setPhotoFormat(i);
            preparePhotoImageReader();
        }
    }

    public Handler getCameraHandler() {
        return this.mCameraHandler;
    }

    public int getPictureFormat() {
        return this.mConfigs.getPhotoFormat();
    }

    public void setPictureMaxImages(int i) {
        if (i > this.mConfigs.getPhotoMaxImages()) {
            this.mConfigs.setPhotoMaxImages(i);
            preparePhotoImageReader();
        }
    }

    public int getPictureMaxImages() {
        return this.mConfigs.getPhotoMaxImages();
    }

    public void setJpegThumbnailSize(CameraSize cameraSize) {
        this.mConfigs.setThumbnailSize(cameraSize);
    }

    public void setVideoSnapshotSize(CameraSize cameraSize) {
        this.mConfigs.setVideoSnapshotSize(cameraSize);
    }

    public void setJpegQuality(int i) {
        this.mConfigs.setJpegQuality(i);
    }

    public void setJpegRotation(int i) {
        this.mConfigs.setJpegRotation(i);
    }

    public void setZoomRatio(float f) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("setZoomRatio ");
        stringBuilder.append(f);
        Log.v(str, stringBuilder.toString());
        if (this.mConfigs.setZoomRatio(f)) {
            applyZoomRatio(this.mPreviewRequestBuilder);
        }
    }

    public float getZoomRatio() {
        return this.mConfigs.getZoomRatio();
    }

    public void setEnableZsl(boolean z) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("setEnableZsl ");
        stringBuilder.append(z);
        Log.v(str, stringBuilder.toString());
        this.mConfigs.setEnableZsl(z);
        applyZsl(this.mPreviewRequestBuilder);
    }

    public void setEnableOIS(boolean z) {
        if (this.mCapabilities.isSupportOIS()) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("setEnableOIS ");
            stringBuilder.append(z);
            Log.v(str, stringBuilder.toString());
            this.mConfigs.setEnableOIS(z);
            applyAntiShake(this.mPreviewRequestBuilder);
        }
    }

    public boolean isFacingFront() {
        return this.mCapabilities.getFacing() == 0;
    }

    public void setColorEffect(int i) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("setColorEffect: ");
        stringBuilder.append(i);
        Log.v(str, stringBuilder.toString());
        if (this.mConfigs.setColorEffect(i)) {
            applyColorEffect(this.mPreviewRequestBuilder);
        }
    }

    public void setSceneMode(int i) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("setSceneMode: ");
        stringBuilder.append(i);
        Log.v(str, stringBuilder.toString());
        if (this.mConfigs.setSceneMode(i)) {
            applySceneMode(this.mPreviewRequestBuilder);
        }
    }

    public void setNormalWideLDC(boolean z) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("setNormalWideLDC: ");
        stringBuilder.append(z);
        Log.v(str, stringBuilder.toString());
        if (this.mConfigs.setNormalWideLDCEnabled(z)) {
            applyNormalWideLDC(this.mPreviewRequestBuilder, 1);
        }
    }

    public void setUltraWideLDC(boolean z) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("setUltraWideLDC: ");
        stringBuilder.append(z);
        Log.v(str, stringBuilder.toString());
        if (this.mConfigs.setUltraWideLDCEnabled(z)) {
            applyUltraWideLDC(this.mPreviewRequestBuilder, 1);
        }
    }

    public void setContrast(int i) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("setContrast: ");
        stringBuilder.append(i);
        Log.v(str, stringBuilder.toString());
        if (this.mConfigs.setContrastLevel(i)) {
            applyContrast(this.mPreviewRequestBuilder);
        }
    }

    public void setSaturation(int i) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("setSaturation: ");
        stringBuilder.append(i);
        Log.v(str, stringBuilder.toString());
        if (this.mConfigs.setSaturationLevel(i)) {
            applySaturation(this.mPreviewRequestBuilder);
        }
    }

    public void setSharpness(int i) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("setSharpness: ");
        stringBuilder.append(i);
        Log.v(str, stringBuilder.toString());
        if (this.mConfigs.setSharpnessLevel(i)) {
            applySharpness(this.mPreviewRequestBuilder);
        }
    }

    public void setExposureMeteringMode(int i) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("setExposureMeteringMode: ");
        stringBuilder.append(i);
        Log.v(str, stringBuilder.toString());
        if (this.mConfigs.setExposureMeteringMode(i)) {
            applyExposureMeteringMode(this.mPreviewRequestBuilder);
        }
    }

    public int getSceneMode() {
        return this.mConfigs.getSceneMode();
    }

    public void setAntiBanding(int i) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("setAntiBanding: ");
        stringBuilder.append(i);
        Log.v(str, stringBuilder.toString());
        if (this.mConfigs.setAntiBanding(i)) {
            applyAntiBanding(this.mPreviewRequestBuilder);
        }
    }

    public void setOpticalZoomToTele(boolean z) {
        if (DataRepository.dataItemFeature().fn() && this.mCapabilities.isSupportFastZoomIn()) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("setOpticalZoomToTele: toTele = ");
            stringBuilder.append(z);
            Log.d(str, stringBuilder.toString());
            this.mToTele = z;
        }
        MiCameraCompat.applyStFastZoomIn(this.mPreviewRequestBuilder, z);
    }

    public void setEnableEIS(boolean z) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("setEnableEIS: ");
        stringBuilder.append(z);
        Log.v(str, stringBuilder.toString());
        if (this.mConfigs.setEnableEIS(z)) {
            applyAntiShake(this.mPreviewRequestBuilder);
        }
    }

    public void setASD(boolean z) {
        if (this.mConfigs.setAiSceneDetectEnable(z)) {
            applyAiSceneDetectEnable(this.mPreviewRequestBuilder);
        }
    }

    public void setCameraAI30(boolean z) {
        if (this.mConfigs.setCameraAi30Enable(z)) {
            applyCameraAi30Enable(this.mPreviewRequestBuilder);
        }
    }

    public void setASDPeriod(int i) {
        if (this.mConfigs.setAiSceneDetectPeriod(i)) {
            applyAiSceneDetectPeriod(this.mPreviewRequestBuilder);
        }
    }

    public void setHHT(boolean z) {
        if (this.mConfigs.setHHTEnabled(z)) {
            applyHHT(this.mPreviewRequestBuilder, 1);
        }
    }

    public void setHDR(boolean z) {
        if (this.mConfigs.setHDREnabled(z)) {
            applyHDR(this.mPreviewRequestBuilder, 1);
        }
    }

    public void setHDRCheckerEnable(boolean z) {
        if (this.mConfigs.setHDRCheckerEnabled(z)) {
            applyHDRCheckerEnable(this.mPreviewRequestBuilder, z, 1);
        }
    }

    public void setSuperResolution(boolean z) {
        if (this.mConfigs.setSuperResolutionEnabled(z)) {
            applySuperResolution(this.mPreviewRequestBuilder, 1);
        }
    }

    public void setMfnr(boolean z) {
        if (this.mConfigs.setMfnrEnabled(z)) {
            applyMfnr(this.mPreviewRequestBuilder, 1);
        }
    }

    public void setSwMfnr(boolean z) {
        if (this.mConfigs.setSwMfnrEnabled(z)) {
            applySwMfnr(this.mPreviewRequestBuilder, 1);
        }
    }

    public void setBokeh(boolean z) {
        if (this.mConfigs.setBokehEnabled(z)) {
            applyBokeh(this.mPreviewRequestBuilder, 1);
        }
    }

    public boolean isBokehEnabled() {
        return this.mConfigs.isBokehEnabled();
    }

    public void setLensDirtyDetect(boolean z) {
        if (this.mConfigs.setLensDirtyDetectEnabled(z)) {
            applyLensDirtyDetect(this.mPreviewRequestBuilder, 1);
        }
    }

    public void setPortraitLighting(int i) {
        if (this.mConfigs.setPortraitLightingPattern(i)) {
            applyPortraitLighting(this.mPreviewRequestBuilder, 1);
        }
    }

    public void setFaceAgeAnalyze(boolean z) {
        if (this.mConfigs.setFaceAgeAnalyzeEnabled(z)) {
            applyFaceAgeAnalyze(this.mPreviewRequestBuilder, 1);
        }
    }

    public void setFaceScore(boolean z) {
        if (this.mConfigs.setFaceScoreEnabled(z)) {
            applyFaceScore(this.mPreviewRequestBuilder, 1);
        }
    }

    public void setDualCamWaterMarkEnable(boolean z) {
        this.mConfigs.setDualCamWaterMarkEnable(z);
    }

    public void setTimeWaterMarkEnable(boolean z) {
        this.mConfigs.setTimeWaterMarkEnable(z);
    }

    public void setTimeWatermarkValue(String str) {
        this.mConfigs.setTimeWaterMarkValue(str);
    }

    public void setFaceWaterMarkEnable(boolean z) {
        this.mConfigs.setFaceWaterMarkEnable(z);
    }

    public void setFaceWaterMarkFormat(String str) {
        this.mConfigs.setFaceWaterMarkFormat(str);
    }

    public void setFpsRange(Range<Integer> range) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("setFpsRange: ");
        stringBuilder.append(range);
        Log.v(str, stringBuilder.toString());
        this.mConfigs.setPreviewFpsRange(range);
        applyFpsRange(this.mPreviewRequestBuilder);
    }

    public void setVideoFpsRange(Range<Integer> range) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("setVideoFpsRange: ");
        stringBuilder.append(range);
        Log.v(str, stringBuilder.toString());
        if (this.mConfigs.setVideoFpsRange(range)) {
            applyVideoFpsRange(this.mPreviewRequestBuilder);
        }
    }

    private int genSessionId() {
        int i = this.mSessionId + 1;
        this.mSessionId = i;
        if (i == Integer.MAX_VALUE) {
            this.mSessionId = 0;
        }
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("generateSessionId: id=");
        stringBuilder.append(this.mSessionId);
        Log.v(str, stringBuilder.toString());
        return this.mSessionId;
    }

    public void setDisplayOrientation(int i) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("setDisplayOrientation: ");
        stringBuilder.append(i);
        Log.v(str, stringBuilder.toString());
        this.mDisplayOrientation = i;
    }

    public void setDeviceOrientation(int i) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("setDeviceOrientation: ");
        stringBuilder.append(i);
        Log.v(str, stringBuilder.toString());
        if (this.mConfigs.setDeviceOrientation(i)) {
            applyDeviceOrientation(this.mPreviewRequestBuilder);
        }
    }

    public <T> void setVendorSetting(Key<T> key, T t) {
        if (this.mPreviewRequestBuilder != null) {
            this.mPreviewRequestBuilder.set(key, t);
        }
    }

    public void setExposureCompensation(int i) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("setExposureCompensation: ");
        stringBuilder.append(i);
        Log.v(str, stringBuilder.toString());
        if (this.mConfigs.setExposureCompensationIndex(i)) {
            applyExposureCompensation(this.mPreviewRequestBuilder, 1);
        }
    }

    public int getExposureCompensation() {
        return this.mConfigs.getExposureCompensationIndex();
    }

    public void setExposureTime(long j) {
        if (this.mConfigs.setExposureTime(j)) {
            applySceneMode(this.mPreviewRequestBuilder);
            applyExposureCompensation(this.mPreviewRequestBuilder, 1);
            applyIso(this.mPreviewRequestBuilder, 1);
            applyExposureTime(this.mPreviewRequestBuilder, 1);
        }
    }

    private long getExposureTime() {
        return this.mConfigs.getExposureTime();
    }

    public void setGpsLocation(Location location) {
        this.mConfigs.setGpsLocation(location);
    }

    public void setFocusCallback(FocusCallback focusCallback) {
        synchronized (this.mCallbackLock) {
            this.mFocusCallback = focusCallback;
        }
    }

    public void setMetaDataCallback(CameraMetaDataCallback cameraMetaDataCallback) {
        this.mMetadataCallback = cameraMetaDataCallback;
    }

    public void setScreenLightCallback(ScreenLightCallback screenLightCallback) {
        synchronized (this.mCallbackLock) {
            this.mScreenLightCallback = screenLightCallback;
        }
    }

    public void setAERegions(MeteringRectangle[] meteringRectangleArr) {
        Log.v(TAG, "setAERegions");
        if (this.mConfigs.setAERegions(meteringRectangleArr)) {
            applyAERegions(this.mPreviewRequestBuilder);
        }
    }

    public void setAFRegions(MeteringRectangle[] meteringRectangleArr) {
        Log.v(TAG, "setAFRegions");
        if (this.mConfigs.setAFRegions(meteringRectangleArr)) {
            applyAFRegions(this.mPreviewRequestBuilder);
        }
    }

    public void setAELock(boolean z) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("setAELock: ");
        stringBuilder.append(z);
        Log.v(str, stringBuilder.toString());
        if (this.mConfigs.setAELock(z)) {
            applyAELock(this.mPreviewRequestBuilder, z);
        }
    }

    public void setAWBLock(boolean z) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("setAWBLock: ");
        stringBuilder.append(z);
        Log.v(str, stringBuilder.toString());
        if (this.mConfigs.setAWBLock(z)) {
            applyAWBLock(this.mPreviewRequestBuilder, z);
        }
    }

    public void setAWBMode(int i) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("setAWBMode: ");
        stringBuilder.append(i);
        Log.v(str, stringBuilder.toString());
        if (this.mConfigs.setAWBMode(i)) {
            applyAWBMode(this.mPreviewRequestBuilder);
        }
    }

    public void setCustomAWB(int i) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("setCustomAWB: ");
        stringBuilder.append(i);
        Log.v(str, stringBuilder.toString());
        if (this.mConfigs.setCustomAWB(i)) {
            applyCustomAWB(this.mPreviewRequestBuilder);
        }
    }

    public void setISO(int i) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("setISO: ");
        stringBuilder.append(i);
        Log.v(str, stringBuilder.toString());
        if (this.mConfigs.setISO(i)) {
            applyExposureCompensation(this.mPreviewRequestBuilder, 1);
            applyIso(this.mPreviewRequestBuilder, 1);
            applyExposureTime(this.mPreviewRequestBuilder, 1);
        }
    }

    public void cancelContinuousShot() {
    }

    public void setBurstShotSpeed(int i) {
    }

    public void setFocusMode(int i) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("setFocusMode: ");
        stringBuilder.append(i);
        Log.v(str, stringBuilder.toString());
        if (this.mConfigs.setFocusMode(i)) {
            applyFocusMode(this.mPreviewRequestBuilder);
        }
    }

    public int getFocusMode() {
        return this.mConfigs.getFocusMode();
    }

    public void setFocusDistance(float f) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("setFocusDistance: ");
        stringBuilder.append(f);
        Log.v(str, stringBuilder.toString());
        if (this.mConfigs.setFocusDistance(f)) {
            applyFocusDistance(this.mPreviewRequestBuilder);
        }
    }

    public void setFlashMode(int i) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("setFlashMode: ");
        stringBuilder.append(i);
        Log.v(str, stringBuilder.toString());
        if (this.mConfigs.setFlashMode(i)) {
            applyFlashMode(this.mPreviewRequestBuilder, 1);
        }
    }

    public void setOptimizedFlash(boolean z) {
        this.mConfigs.setOptimizedFlash(z);
    }

    public int getFlashMode() {
        return this.mConfigs.getFlashMode();
    }

    private void triggerCapture() {
        if (isNeedFlashOn()) {
            this.mConfigs.setNeedFlash(true);
            if (needOptimizedFlash()) {
                this.mPreviewRequestBuilder.set(CaptureRequest.CONTROL_AE_MODE, Integer.valueOf(1));
                this.mPreviewRequestBuilder.set(CaptureRequest.FLASH_MODE, Integer.valueOf(2));
                applyAELock(this.mPreviewRequestBuilder, false);
                if (this.mCapabilities.isSupportSnapShotTorch()) {
                    MiCameraCompat.applySnapshotTorch(this.mPreviewRequestBuilder, true);
                }
                resumePreview();
                this.mCaptureCallback.setState(8);
                return;
            } else if (needScreenLight()) {
                this.mPreviewRequestBuilder.set(CaptureRequest.CONTROL_AE_MODE, Integer.valueOf(1));
                resumePreview();
                triggerPrecapture();
                return;
            } else {
                triggerPrecapture();
                return;
            }
        }
        this.mConfigs.setNeedFlash(false);
        captureStillPicture();
    }

    private void triggerPrecapture() {
        if (!this.mCapabilities.isAutoFocusSupported() || this.mConfigs.getFocusMode() == 0) {
            runPrecaptureSequence();
        } else {
            lockFocus();
        }
    }

    public boolean isNeedFlashOn() {
        boolean z = true;
        if (this.mConfigs.getFlashMode() == 1 || this.mConfigs.getFlashMode() == 101) {
            return true;
        }
        if (this.mConfigs.getFlashMode() != 3) {
            return false;
        }
        Integer currentAEState = this.mCaptureCallback.getCurrentAEState();
        if (currentAEState == null || currentAEState.intValue() != 4) {
            z = false;
        }
        return z;
    }

    public boolean isNeedPreviewThumbnail() {
        return !this.mConfigs.isHDREnabled() && (this.mConfigs.isMfnrEnabled() || this.mConfigs.isSwMfnrEnabled() || this.mConfigs.isSuperResolutionEnabled());
    }

    public void setBeautyValues(BeautyValues beautyValues) {
        this.mConfigs.setBeautyValues(beautyValues);
        applyBeautyValues(this.mPreviewRequestBuilder);
    }

    public void setEyeLight(int i) {
        if (this.mConfigs.setEyeLight(i)) {
            applyEyeLight(this.mPreviewRequestBuilder);
        }
    }

    public void setNeedPausePreview(boolean z) {
        this.mConfigs.setPausePreview(z);
    }

    public void setFrontMirror(boolean z) {
        this.mConfigs.setFrontMirror(z);
    }

    public void setFNumber(String str) {
        String str2 = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("setFNumber ");
        stringBuilder.append(str);
        stringBuilder.append(" for ");
        stringBuilder.append(this.mPreviewRequestBuilder);
        Log.d(str2, stringBuilder.toString());
        this.mConfigs.setFNumber(str);
        if (Util.UI_DEBUG()) {
            applyFNumber(this.mPreviewRequestBuilder);
        }
    }

    public void lockExposure(boolean z) {
        if (checkCaptureSession("lockExposure")) {
            this.mCaptureCallback.setState(z ? 3 : 1);
            applyAELock(this.mPreviewRequestBuilder, z);
            resumePreview();
        }
    }

    private void runCaptureSequence() {
        this.mCaptureCallback.showAutoFocusFinish(true);
        if (getExposureTime() > 0) {
            waitFlashClosed();
            return;
        }
        this.mCaptureCallback.setState(6);
        captureStillPicture();
    }

    /* JADX WARNING: Removed duplicated region for block: B:3:0x002e A:{ExcHandler: android.hardware.camera2.CameraAccessException (r0_4 'e' java.lang.Exception), Splitter: B:1:0x0007} */
    /* JADX WARNING: Missing block: B:3:0x002e, code:
            r0 = move-exception;
     */
    /* JADX WARNING: Missing block: B:4:0x002f, code:
            r0.printStackTrace();
            notifyOnError(-1);
     */
    /* JADX WARNING: Missing block: B:5:?, code:
            return;
     */
    private void runPrecaptureSequence() {
        /*
        r3 = this;
        r0 = TAG;
        r1 = "runPrecaptureSequence";
        com.android.camera.log.Log.v(r0, r1);
        r0 = r3.mCameraDevice;	 Catch:{ CameraAccessException -> 0x002e, CameraAccessException -> 0x002e }
        r1 = 1;
        r0 = r0.createCaptureRequest(r1);	 Catch:{ CameraAccessException -> 0x002e, CameraAccessException -> 0x002e }
        r1 = r3.mPreviewSurface;	 Catch:{ CameraAccessException -> 0x002e, CameraAccessException -> 0x002e }
        r0.addTarget(r1);	 Catch:{ CameraAccessException -> 0x002e, CameraAccessException -> 0x002e }
        r3.applySettingsForPrecapture(r0);	 Catch:{ CameraAccessException -> 0x002e, CameraAccessException -> 0x002e }
        r0 = r0.build();	 Catch:{ CameraAccessException -> 0x002e, CameraAccessException -> 0x002e }
        r1 = r0.hashCode();	 Catch:{ CameraAccessException -> 0x002e, CameraAccessException -> 0x002e }
        r3.mPrecaptureRequestHashCode = r1;	 Catch:{ CameraAccessException -> 0x002e, CameraAccessException -> 0x002e }
        r1 = r3.mCaptureCallback;	 Catch:{ CameraAccessException -> 0x002e, CameraAccessException -> 0x002e }
        r2 = 4;
        r1.setState(r2);	 Catch:{ CameraAccessException -> 0x002e, CameraAccessException -> 0x002e }
        r1 = r3.mCaptureCallback;	 Catch:{ CameraAccessException -> 0x002e, CameraAccessException -> 0x002e }
        r2 = r3.mCameraHandler;	 Catch:{ CameraAccessException -> 0x002e, CameraAccessException -> 0x002e }
        r3.capture(r0, r1, r2);	 Catch:{ CameraAccessException -> 0x002e, CameraAccessException -> 0x002e }
        goto L_0x0036;
    L_0x002e:
        r0 = move-exception;
        r0.printStackTrace();
        r0 = -1;
        r3.notifyOnError(r0);
    L_0x0036:
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera2.MiCamera2.runPrecaptureSequence():void");
    }

    private void applySettingsForPrecapture(Builder builder) {
        applyCommonSettings(builder, 1);
        applyFlashMode(builder, 6);
        builder.set(CaptureRequest.CONTROL_AE_PRECAPTURE_TRIGGER, Integer.valueOf(1));
    }

    private void waitFlashClosed() {
        this.mPreviewRequestBuilder.set(CaptureRequest.CONTROL_AE_MODE, Integer.valueOf(1));
        this.mPreviewRequestBuilder.set(CaptureRequest.FLASH_MODE, Integer.valueOf(0));
        resumePreview();
        this.mCaptureCallback.setState(7);
    }

    private void captureStillPicture() {
        if (checkCaptureSession(CameraStat.CATEGORY_CAMERA)) {
            MiCamera2Shot miCamera2Shot = null;
            switch (this.mConfigs.getShotType()) {
                case -2:
                case 0:
                case 2:
                    miCamera2Shot = new MiCamera2ShotNormal(this);
                    break;
                case 1:
                    miCamera2Shot = new MiCamera2ShotLive(this);
                    break;
                case 6:
                    miCamera2Shot = new MiCamera2ShotParallelDual(this);
                    break;
                case 7:
                    miCamera2Shot = new MiCamera2ShotParallelSequence(this, this.mCaptureCallback.getCurrentCaptureResult());
                    break;
            }
            this.mMiCamera2Shot = miCamera2Shot;
            this.mMiCamera2Shot.startShot();
        }
    }

    protected void onCapturePictureFinished(boolean z) {
        boolean isNeedFlash = this.mConfigs.isNeedFlash();
        this.mConfigs.setNeedFlash(false);
        this.mCaptureCallback.setState(0);
        applySettingsForPreview(this.mPreviewRequestBuilder);
        if (isNeedFlash) {
            resumePreview();
        }
        PictureCallback pictureCallback = getPictureCallback();
        if (!z && pictureCallback != null) {
            pictureCallback.onPictureTakenFinished(false);
        }
    }

    public void captureVideoSnapshot(PictureCallback pictureCallback) {
        setPictureCallback(pictureCallback);
        this.mMiCamera2Shot = new MiCamera2ShotVideo(this);
        this.mMiCamera2Shot.startShot();
    }

    /* JADX WARNING: Removed duplicated region for block: B:8:0x004f A:{ExcHandler: android.hardware.camera2.CameraAccessException (r0_9 'e' java.lang.Exception), Splitter: B:4:0x0010} */
    /* JADX WARNING: Missing block: B:8:0x004f, code:
            r0 = move-exception;
     */
    /* JADX WARNING: Missing block: B:9:0x0050, code:
            r0.printStackTrace();
            notifyOnError(-1);
     */
    private void lockFocus() {
        /*
        r4 = this;
        r0 = "lockFocus";
        r0 = r4.checkCaptureSession(r0);
        if (r0 != 0) goto L_0x0009;
    L_0x0008:
        return;
    L_0x0009:
        r0 = TAG;
        r1 = "lockFocus";
        com.android.camera.log.Log.v(r0, r1);
        r0 = r4.mCameraDevice;	 Catch:{ CameraAccessException -> 0x004f, CameraAccessException -> 0x004f }
        r1 = 1;
        r0 = r0.createCaptureRequest(r1);	 Catch:{ CameraAccessException -> 0x004f, CameraAccessException -> 0x004f }
        r2 = r4.mPreviewSurface;	 Catch:{ CameraAccessException -> 0x004f, CameraAccessException -> 0x004f }
        r0.addTarget(r2);	 Catch:{ CameraAccessException -> 0x004f, CameraAccessException -> 0x004f }
        r4.applySettingsForLockFocus(r0);	 Catch:{ CameraAccessException -> 0x004f, CameraAccessException -> 0x004f }
        r0 = r0.build();	 Catch:{ CameraAccessException -> 0x004f, CameraAccessException -> 0x004f }
        r2 = r0.hashCode();	 Catch:{ CameraAccessException -> 0x004f, CameraAccessException -> 0x004f }
        r4.mLockRequestHashCode = r2;	 Catch:{ CameraAccessException -> 0x004f, CameraAccessException -> 0x004f }
        r2 = r4.mCaptureCallback;	 Catch:{ CameraAccessException -> 0x004f, CameraAccessException -> 0x004f }
        r3 = 2;
        r2.setState(r3);	 Catch:{ CameraAccessException -> 0x004f, CameraAccessException -> 0x004f }
        r2 = r4.mCaptureCallback;	 Catch:{ CameraAccessException -> 0x004f, CameraAccessException -> 0x004f }
        r2.showAutoFocusStart();	 Catch:{ CameraAccessException -> 0x004f, CameraAccessException -> 0x004f }
        r2 = r4.mCaptureCallback;	 Catch:{ CameraAccessException -> 0x004f, CameraAccessException -> 0x004f }
        r3 = r4.mCameraHandler;	 Catch:{ CameraAccessException -> 0x004f, CameraAccessException -> 0x004f }
        r4.capture(r0, r2, r3);	 Catch:{ CameraAccessException -> 0x004f, CameraAccessException -> 0x004f }
        r4.setAFModeToPreview(r1);	 Catch:{ CameraAccessException -> 0x004f, CameraAccessException -> 0x004f }
        r0 = r4.mHelperHandler;	 Catch:{ CameraAccessException -> 0x004f, CameraAccessException -> 0x004f }
        if (r0 == 0) goto L_0x004e;
    L_0x0042:
        r0 = r4.mHelperHandler;	 Catch:{ CameraAccessException -> 0x004f, CameraAccessException -> 0x004f }
        r0.removeMessages(r1);	 Catch:{ CameraAccessException -> 0x004f, CameraAccessException -> 0x004f }
        r0 = r4.mHelperHandler;	 Catch:{ CameraAccessException -> 0x004f, CameraAccessException -> 0x004f }
        r2 = 3000; // 0xbb8 float:4.204E-42 double:1.482E-320;
        r0.sendEmptyMessageDelayed(r1, r2);	 Catch:{ CameraAccessException -> 0x004f, CameraAccessException -> 0x004f }
    L_0x004e:
        goto L_0x0057;
    L_0x004f:
        r0 = move-exception;
        r0.printStackTrace();
        r0 = -1;
        r4.notifyOnError(r0);
    L_0x0057:
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera2.MiCamera2.lockFocus():void");
    }

    private void applySettingsForLockFocus(Builder builder) {
        builder.set(CaptureRequest.CONTROL_AF_TRIGGER, Integer.valueOf(1));
        applyAFRegions(builder);
        applyAERegions(builder);
        applyCommonSettings(builder, 1);
        builder.set(CaptureRequest.CONTROL_AF_MODE, Integer.valueOf(1));
        if (needOptimizedFlash() || needScreenLight()) {
            applyFlashMode(builder, 6);
        }
    }

    private boolean needOptimizedFlash() {
        if (this.mConfigs.isNeedFlash() && (this.mConfigs.getFlashMode() == 1 || this.mConfigs.getFlashMode() == 3 || getExposureTime() > 0)) {
            return true;
        }
        return false;
    }

    private boolean needScreenLight() {
        return this.mConfigs.isNeedFlash() && this.mConfigs.getFlashMode() == 101;
    }

    private void unlockFocus() {
        if (checkCaptureSession("unlockFocus")) {
            Log.d(TAG, "unlockFocus");
            try {
                this.mPreviewRequestBuilder.set(CaptureRequest.CONTROL_AF_TRIGGER, Integer.valueOf(2));
                capture(this.mPreviewRequestBuilder.build(), this.mCaptureCallback, this.mCameraHandler);
                applyFocusMode(this.mPreviewRequestBuilder);
                applyFlashMode(this.mPreviewRequestBuilder, 1);
                applyAELock(this.mPreviewRequestBuilder, this.mConfigs.isAELocked());
                this.mPreviewRequestBuilder.set(CaptureRequest.CONTROL_AF_TRIGGER, Integer.valueOf(0));
                this.mPreviewRequestBuilder.set(CaptureRequest.CONTROL_AE_PRECAPTURE_TRIGGER, Integer.valueOf(0));
                this.mCaptureCallback.setState(0);
                resumePreview();
            } catch (CameraAccessException e) {
                e.printStackTrace();
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("unlockFocus: ");
                stringBuilder.append(e.getMessage());
                Log.e(str, stringBuilder.toString());
                notifyOnError(e.getReason());
            } catch (Throwable e2) {
                Log.e(TAG, "Failed to unlock focus, IllegalState", e2);
                notifyOnError(256);
            }
        }
    }

    private int capture(CaptureRequest captureRequest, CaptureCallback captureCallback, Handler handler) throws CameraAccessException {
        if (!(this.mCaptureSession instanceof CameraConstrainedHighSpeedCaptureSession)) {
            return this.mCaptureSession.capture(captureRequest, captureCallback, handler);
        }
        return this.mCaptureSession.captureBurst(createHighSpeedRequestList(captureRequest), captureCallback, handler);
    }

    private void applyAELock(Builder builder, boolean z) {
        if (builder != null) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("applyAELock: ");
            stringBuilder.append(z);
            Log.d(str, stringBuilder.toString());
            builder.set(CaptureRequest.CONTROL_AE_LOCK, Boolean.valueOf(z));
        }
    }

    private void applyAWBLock(Builder builder, boolean z) {
        if (builder != null) {
            builder.set(CaptureRequest.CONTROL_AWB_LOCK, Boolean.valueOf(z));
        }
    }

    private void applyAWBMode(Builder builder) {
        if (builder != null) {
            builder.set(CaptureRequest.CONTROL_AWB_MODE, Integer.valueOf(this.mConfigs.getAWBMode()));
        }
    }

    private void applyCustomAWB(Builder builder) {
        MiCameraCompat.applyCustomAWB(builder, this.mConfigs.getAwbCustomValue());
    }

    private void applyAERegions(Builder builder) {
        if (builder != null) {
            Object aERegions = this.mConfigs.getAERegions();
            if (aERegions != null) {
                builder.set(CaptureRequest.CONTROL_AE_REGIONS, aERegions);
            } else {
                builder.set(CaptureRequest.CONTROL_AE_REGIONS, ZERO_WEIGHT_3A_REGION);
            }
        }
    }

    private void applyAFRegions(Builder builder) {
        if (builder != null) {
            Object aFRegions = this.mConfigs.getAFRegions();
            if (aFRegions != null) {
                builder.set(CaptureRequest.CONTROL_AF_REGIONS, aFRegions);
            } else {
                builder.set(CaptureRequest.CONTROL_AF_REGIONS, ZERO_WEIGHT_3A_REGION);
            }
        }
    }

    private void applyAntiBanding(Builder builder) {
        if (builder != null) {
            builder.set(CaptureRequest.CONTROL_AE_ANTIBANDING_MODE, Integer.valueOf(this.mConfigs.getAntiBanding()));
        }
    }

    private void applyColorEffect(Builder builder) {
        if (builder != null) {
            builder.set(CaptureRequest.CONTROL_EFFECT_MODE, Integer.valueOf(this.mConfigs.getColorEffect()));
        }
    }

    private void applyExposureCompensation(Builder builder, int i) {
        if (builder != null) {
            String str;
            int exposureCompensationIndex = this.mConfigs.getExposureCompensationIndex();
            if (b.hD() && ModuleManager.isManualModule() && i == 1 && this.mConfigs.getISO() == 0 && this.mConfigs.getExposureTime() > MAX_REALTIME_EXPOSURE_TIME) {
                double log = Math.log((double) ((float) (((double) this.mConfigs.getExposureTime()) / 1.25E8d))) / Math.log(2.0d);
                str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("applyExposureCompensation: EV = ");
                stringBuilder.append(log);
                Log.d(str, stringBuilder.toString());
                Rational exposureCompensationRational = this.mCapabilities.getExposureCompensationRational();
                exposureCompensationIndex = Math.min((int) ((log * ((double) exposureCompensationRational.getDenominator())) / ((double) exposureCompensationRational.getNumerator())), this.mCapabilities.getMaxExposureCompensation());
            }
            str = TAG;
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("applyExposureCompensation: ");
            stringBuilder2.append(exposureCompensationIndex);
            Log.d(str, stringBuilder2.toString());
            builder.set(CaptureRequest.CONTROL_AE_EXPOSURE_COMPENSATION, Integer.valueOf(exposureCompensationIndex));
        }
    }

    private void applyFaceDetection(Builder builder) {
        if (builder != null) {
            int i;
            if (this.mConfigs.isFaceDetectionEnabled()) {
                i = 2;
            } else {
                i = 0;
            }
            builder.set(CaptureRequest.STATISTICS_FACE_DETECT_MODE, Integer.valueOf(i));
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:37:0x011a  */
    /* JADX WARNING: Removed duplicated region for block: B:23:0x0089  */
    /* JADX WARNING: Removed duplicated region for block: B:23:0x0089  */
    /* JADX WARNING: Removed duplicated region for block: B:37:0x011a  */
    /* JADX WARNING: Missing block: B:9:0x003d, code:
            if (com.android.camera.module.ModuleManager.isCapture() != false) goto L_0x0040;
     */
    /* JADX WARNING: Missing block: B:11:0x0043, code:
            r0 = 2;
     */
    /* JADX WARNING: Missing block: B:18:0x005e, code:
            if (com.android.camera.module.ModuleManager.isCapture() != false) goto L_0x0040;
     */
    /* JADX WARNING: Missing block: B:19:0x0061, code:
            if (r0 == 3) goto L_0x0056;
     */
    private void applyFlashMode(android.hardware.camera2.CaptureRequest.Builder r11, int r12) {
        /*
        r10 = this;
        r0 = TAG;
        r1 = new java.lang.StringBuilder;
        r1.<init>();
        r2 = "applyFlashMode: request = ";
        r1.append(r2);
        r1.append(r11);
        r2 = ", applyType = ";
        r1.append(r2);
        r1.append(r12);
        r1 = r1.toString();
        com.android.camera.log.Log.d(r0, r1);
        if (r11 != 0) goto L_0x0021;
    L_0x0020:
        return;
    L_0x0021:
        r0 = r10.mConfigs;
        r0 = r0.getFlashMode();
        r1 = 6;
        r2 = 2;
        r3 = 3;
        r4 = 0;
        r5 = 1;
        if (r12 == r3) goto L_0x0045;
    L_0x002f:
        if (r12 == r1) goto L_0x0032;
    L_0x0031:
        goto L_0x0064;
    L_0x0032:
        r6 = r10.needOptimizedFlash();
        if (r6 == 0) goto L_0x0064;
        r0 = com.android.camera.module.ModuleManager.isCapture();
        if (r0 == 0) goto L_0x0043;
    L_0x0040:
        r0 = r2;
        r6 = r5;
        goto L_0x0065;
    L_0x0043:
        r0 = r2;
        goto L_0x0064;
    L_0x0045:
        r6 = r10.needOptimizedFlash();
        if (r6 == 0) goto L_0x0061;
    L_0x004b:
        r6 = r10.getExposureTime();
        r8 = 0;
        r0 = (r6 > r8 ? 1 : (r6 == r8 ? 0 : -1));
        if (r0 <= 0) goto L_0x0059;
    L_0x0056:
        r0 = r4;
        r6 = r0;
        goto L_0x0065;
        r0 = com.android.camera.module.ModuleManager.isCapture();
        if (r0 == 0) goto L_0x0043;
    L_0x0060:
        goto L_0x0040;
    L_0x0061:
        if (r0 != r3) goto L_0x0064;
    L_0x0063:
        goto L_0x0056;
    L_0x0064:
        r6 = r4;
    L_0x0065:
        r7 = TAG;
        r8 = new java.lang.StringBuilder;
        r8.<init>();
        r9 = "applyFlashMode: flashMode = ";
        r8.append(r9);
        r8.append(r0);
        r9 = ", mScreenLightCallback = ";
        r8.append(r9);
        r9 = r10.mScreenLightCallback;
        r8.append(r9);
        r8 = r8.toString();
        com.android.camera.log.Log.d(r7, r8);
        r7 = 101; // 0x65 float:1.42E-43 double:5.0E-322;
        if (r0 == r7) goto L_0x011a;
    L_0x0089:
        r1 = 103; // 0x67 float:1.44E-43 double:5.1E-322;
        if (r0 == r1) goto L_0x00f9;
    L_0x008d:
        switch(r0) {
            case 0: goto L_0x00e5;
            case 1: goto L_0x00d1;
            case 2: goto L_0x00b2;
            case 3: goto L_0x009e;
            case 4: goto L_0x0092;
            default: goto L_0x0090;
        };
    L_0x0090:
        goto L_0x0191;
    L_0x0092:
        r12 = android.hardware.camera2.CaptureRequest.CONTROL_AE_MODE;
        r0 = 4;
        r0 = java.lang.Integer.valueOf(r0);
        r11.set(r12, r0);
        goto L_0x0191;
    L_0x009e:
        r12 = android.hardware.camera2.CaptureRequest.CONTROL_AE_MODE;
        r0 = java.lang.Integer.valueOf(r2);
        r11.set(r12, r0);
        r12 = android.hardware.camera2.CaptureRequest.FLASH_MODE;
        r0 = java.lang.Integer.valueOf(r5);
        r11.set(r12, r0);
        goto L_0x0191;
    L_0x00b2:
        r12 = r10.mCapabilities;
        r12 = r12.isSupportSnapShotTorch();
        if (r12 == 0) goto L_0x00bd;
    L_0x00ba:
        com.android.camera2.compat.MiCameraCompat.applySnapshotTorch(r11, r6);
    L_0x00bd:
        r12 = android.hardware.camera2.CaptureRequest.CONTROL_AE_MODE;
        r0 = java.lang.Integer.valueOf(r5);
        r11.set(r12, r0);
        r12 = android.hardware.camera2.CaptureRequest.FLASH_MODE;
        r0 = java.lang.Integer.valueOf(r2);
        r11.set(r12, r0);
        goto L_0x0191;
    L_0x00d1:
        r12 = android.hardware.camera2.CaptureRequest.CONTROL_AE_MODE;
        r0 = java.lang.Integer.valueOf(r3);
        r11.set(r12, r0);
        r12 = android.hardware.camera2.CaptureRequest.FLASH_MODE;
        r0 = java.lang.Integer.valueOf(r5);
        r11.set(r12, r0);
        goto L_0x0191;
    L_0x00e5:
        r12 = android.hardware.camera2.CaptureRequest.CONTROL_AE_MODE;
        r0 = java.lang.Integer.valueOf(r5);
        r11.set(r12, r0);
        r12 = android.hardware.camera2.CaptureRequest.FLASH_MODE;
        r0 = java.lang.Integer.valueOf(r4);
        r11.set(r12, r0);
        goto L_0x0191;
    L_0x00f9:
        r11 = TAG;
        r0 = new java.lang.StringBuilder;
        r0.<init>();
        r1 = "applyFlashMode: FLASH_MODE_SCREEN_LIGHT_AUTO applyType = ";
        r0.append(r1);
        r0.append(r12);
        r12 = r0.toString();
        com.android.camera.log.Log.d(r11, r12);
        r11 = r10.mScreenLightCallback;
        if (r11 == 0) goto L_0x0191;
    L_0x0113:
        r11 = r10.mScreenLightCallback;
        r11.stopScreenLight();
        goto L_0x0191;
    L_0x011a:
        r11 = r10.mScreenLightCallback;
        if (r11 == 0) goto L_0x0191;
    L_0x011e:
        if (r12 != r1) goto L_0x0128;
    L_0x0120:
        r11 = r10.mCaptureCallback;
        r11 = r11.getCurrentColorTemperature();
        r10.mScreenLightColorTemperature = r11;
    L_0x0128:
        r11 = "camera_screen_light_wb";
        r0 = r10.mScreenLightColorTemperature;
        r11 = android.os.SystemProperties.getInt(r11, r0);
        r11 = com.android.camera.Util.getScreenLightColor(r11);
        r0 = "camera_screen_light_brightness";
        r2 = 180; // 0xb4 float:2.52E-43 double:8.9E-322;
        r0 = android.os.SystemProperties.getInt(r0, r2);
        r2 = "camera_screen_light_delay";
        r2 = android.os.SystemProperties.getInt(r2, r4);
        r4 = TAG;
        r5 = new java.lang.StringBuilder;
        r5.<init>();
        r6 = "applyFlashMode: FLASH_MODE_SCREEN_LIGHT_ON color = ";
        r5.append(r6);
        r5.append(r11);
        r6 = ", brightness = ";
        r5.append(r6);
        r5.append(r0);
        r6 = ", delay = ";
        r5.append(r6);
        r5.append(r2);
        r6 = ", mCameraHandler = ";
        r5.append(r6);
        r6 = r10.mCameraHandler;
        r5.append(r6);
        r5 = r5.toString();
        com.android.camera.log.Log.d(r4, r5);
        if (r12 == r1) goto L_0x018b;
    L_0x0174:
        if (r12 != r3) goto L_0x0177;
    L_0x0176:
        goto L_0x018b;
    L_0x0177:
        if (r2 != 0) goto L_0x017f;
    L_0x0179:
        r11 = r10.mScreenLightCallback;
        r11.stopScreenLight();
        goto L_0x0190;
    L_0x017f:
        r11 = r10.mCameraHandler;
        r12 = new com.android.camera2.MiCamera2$8;
        r12.<init>();
        r0 = (long) r2;
        r11.postDelayed(r12, r0);
        goto L_0x0190;
    L_0x018b:
        r12 = r10.mScreenLightCallback;
        r12.startScreenLight(r11, r0);
    L_0x0191:
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera2.MiCamera2.applyFlashMode(android.hardware.camera2.CaptureRequest$Builder, int):void");
    }

    private void applyFocusMode(Builder builder) {
        if (builder != null) {
            builder.set(CaptureRequest.CONTROL_AF_MODE, Integer.valueOf(this.mConfigs.getFocusMode()));
            applyAFRegions(builder);
            applyAERegions(builder);
        }
    }

    private void applyFocusDistance(Builder builder) {
        if (builder != null && getFocusMode() == 0) {
            builder.set(CaptureRequest.LENS_FOCUS_DISTANCE, Float.valueOf(this.mConfigs.getFocusDistance()));
        }
    }

    private void applyFpsRange(Builder builder) {
        if (builder != null) {
            Range previewFpsRange = this.mConfigs.getPreviewFpsRange();
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("applyFpsRange: fpsRange = ");
            stringBuilder.append(previewFpsRange);
            Log.d(str, stringBuilder.toString());
            if (previewFpsRange != null) {
                builder.set(CaptureRequest.CONTROL_AE_TARGET_FPS_RANGE, previewFpsRange);
            }
        }
    }

    private void applyVideoFpsRange(Builder builder) {
        if (builder != null) {
            Range videoFpsRange = this.mConfigs.getVideoFpsRange();
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("applyVideoFpsRange: fpsRange = ");
            stringBuilder.append(videoFpsRange);
            Log.d(str, stringBuilder.toString());
            if (videoFpsRange != null) {
                builder.set(CaptureRequest.CONTROL_AE_TARGET_FPS_RANGE, videoFpsRange);
            }
        }
    }

    private void applyIso(Builder builder, int i) {
        if (builder != null) {
            int iso = this.mConfigs.getISO();
            if (b.hD() && i == 1 && iso > 0 && this.mConfigs.getExposureTime() > MAX_REALTIME_EXPOSURE_TIME) {
                iso = Math.min((int) (((float) iso) * ((float) (((double) this.mConfigs.getExposureTime()) / 1.25E8d))), this.mCapabilities.getMaxIso());
            }
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("applyIso: ");
            stringBuilder.append(iso);
            Log.d(str, stringBuilder.toString());
            MiCameraCompat.applyISO(builder, iso);
        }
    }

    private void applyExposureTime(Builder builder, int i) {
        if (builder != null) {
            long exposureTime = this.mConfigs.getExposureTime();
            if (b.hD() && i == 1) {
                exposureTime = Math.min(this.mConfigs.getExposureTime(), MAX_REALTIME_EXPOSURE_TIME);
            }
            if (b.hD() || i == 3) {
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("applyExposureTime: ");
                stringBuilder.append(exposureTime);
                Log.d(str, stringBuilder.toString());
                MiCameraCompat.applyExposureTime(builder, exposureTime);
            }
        }
    }

    private void applyContrast(Builder builder) {
        if (builder != null && this.mCapabilities.isSupportContrast()) {
            MiCameraCompat.applyContrast(builder, this.mConfigs.getContrastLevel());
        }
    }

    private void applySaturation(Builder builder) {
        if (builder != null) {
            MiCameraCompat.applySaturation(builder, this.mConfigs.getSaturationLevel());
        }
    }

    private void applySharpness(Builder builder) {
        if (builder != null) {
            MiCameraCompat.applySharpness(builder, this.mConfigs.getSharpnessLevel());
        }
    }

    private void applyExposureMeteringMode(Builder builder) {
        if (builder != null) {
            MiCameraCompat.applyExposureMeteringMode(builder, this.mConfigs.getExposureMeteringMode());
        }
    }

    private void applyCameraAi30Enable(Builder builder) {
        if (builder != null && this.mCapabilities.isSupportCameraAi30()) {
            MiCameraCompat.applyCameraAi30Enable(builder, this.mConfigs.isCameraAi30Enabled());
        }
    }

    private void applyDepurpleEnable(Builder builder, boolean z) {
        if (builder != null) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("applyDepurpleEnable: isSupport = ");
            stringBuilder.append(this.mCapabilities.isSupportDepurple());
            stringBuilder.append(", enadled = ");
            stringBuilder.append(z);
            Log.d(str, stringBuilder.toString());
            if (this.mCapabilities.isSupportDepurple()) {
                MiCameraCompat.applyDepurpleEnable(builder, z);
            }
        }
    }

    private void applyAiSceneDetectEnable(Builder builder) {
        if (builder != null) {
            MiCameraCompat.applyASDEnable(builder, this.mConfigs.isAiSceneDetectEnabled());
        }
    }

    private void applyAiSceneDetectPeriod(Builder builder) {
        if (builder != null) {
            MiCameraCompat.applyAiScenePeriod(builder, this.mConfigs.getAiSceneDetectPeriod());
        }
    }

    private void applySceneMode(Builder builder) {
        if (builder != null) {
            int sceneMode = this.mConfigs.getSceneMode();
            if (sceneMode != 0) {
                builder.set(CaptureRequest.CONTROL_SCENE_MODE, Integer.valueOf(sceneMode));
                builder.set(CaptureRequest.CONTROL_MODE, Integer.valueOf(2));
            } else {
                builder.set(CaptureRequest.CONTROL_MODE, Integer.valueOf(1));
            }
        }
    }

    private void applyZoomRatio(Builder builder) {
        if (builder != null) {
            float zoomRatio = this.mConfigs.getZoomRatio();
            Rect activeArraySize = this.mCapabilities.getActiveArraySize();
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("applyZoomRatio: ActiveArraySize=");
            stringBuilder.append(activeArraySize);
            Log.v(str, stringBuilder.toString());
            Rect rect = new Rect();
            int width = activeArraySize.width() / 2;
            int height = activeArraySize.height() / 2;
            float f = 2.0f * zoomRatio;
            int width2 = (int) (((float) activeArraySize.width()) / f);
            int height2 = (int) (((float) activeArraySize.height()) / f);
            rect.set(width - width2, height - height2, width + width2, height + height2);
            String str2 = TAG;
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("applyZoomRatio: cropRegion=");
            stringBuilder2.append(rect);
            Log.v(str2, stringBuilder2.toString());
            builder.set(CaptureRequest.SCALER_CROP_REGION, rect);
        }
    }

    private void applyZsl(Builder builder) {
        if (builder != null) {
            CompatibilityUtils.setZsl(builder, this.mConfigs.isZslEnabled());
        }
    }

    private void applyAntiShake(Builder builder) {
        if (builder != null) {
            boolean isEISEnabled = this.mConfigs.isEISEnabled();
            boolean isOISEnabled = this.mConfigs.isOISEnabled();
            if (isEISEnabled && isOISEnabled && Util.isDebugOsBuild()) {
                throw new RuntimeException("EIS&OIS are both on");
            }
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("EIS: ");
            stringBuilder.append(isEISEnabled ? "on" : "off");
            Log.v(str, stringBuilder.toString());
            int i = 0;
            builder.set(CaptureRequest.CONTROL_VIDEO_STABILIZATION_MODE, Integer.valueOf(isEISEnabled ? 1 : 0));
            if (this.mCapabilities.isSupportOIS()) {
                str = TAG;
                StringBuilder stringBuilder2 = new StringBuilder();
                stringBuilder2.append("OIS: ");
                String str2 = (isEISEnabled || !isOISEnabled) ? "off" : "on";
                stringBuilder2.append(str2);
                Log.v(str, stringBuilder2.toString());
                Key key = CaptureRequest.LENS_OPTICAL_STABILIZATION_MODE;
                if (!isEISEnabled && isOISEnabled) {
                    i = 1;
                }
                builder.set(key, Integer.valueOf(i));
            }
        }
    }

    private void applyHHT(Builder builder, int i) {
        if (builder != null && i == 3 && this.mCapabilities.isSupportHHT()) {
            MiCameraCompat.applyHHT(builder, this.mConfigs.isHHTEnabled());
        }
    }

    private void applyHDR(Builder builder, int i) {
        if (builder == null || !this.mCapabilities.isSupportHdr()) {
            return;
        }
        if (i != 3) {
            MiCameraCompat.applyHDR(builder, false);
        } else {
            MiCameraCompat.applyHDR(builder, this.mConfigs.isHDREnabled());
        }
    }

    private void applyHDRCheckerEnable(Builder builder, boolean z, int i) {
        if (builder != null && i == 1 && this.mCapabilities.isSupportAutoHdr()) {
            MiCameraCompat.applyHDRCheckerEnable(builder, this.mConfigs.isHDRCheckerEnabled());
        }
    }

    private void applyMfnr(Builder builder, int i) {
        if (builder == null || !this.mCapabilities.isSupportMfnr()) {
            return;
        }
        if (i != 3) {
            MiCameraCompat.applyMfnrEnable(builder, false);
            return;
        }
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("applyMfnrEnable: ");
        stringBuilder.append(this.mConfigs.isMfnrEnabled());
        Log.d(str, stringBuilder.toString());
        MiCameraCompat.applyMfnrEnable(builder, this.mConfigs.isMfnrEnabled());
    }

    private void applySwMfnr(Builder builder, int i) {
        if (builder == null || !this.mCapabilities.isSupportSwMfnr()) {
            return;
        }
        if (i != 3) {
            MiCameraCompat.applySwMfnrEnable(builder, false);
            return;
        }
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("applySwMfnrEnable: ");
        stringBuilder.append(this.mConfigs.isSwMfnrEnabled());
        Log.d(str, stringBuilder.toString());
        MiCameraCompat.applySwMfnrEnable(builder, this.mConfigs.isSwMfnrEnabled());
    }

    private void applyBokeh(Builder builder, int i) {
        if (builder != null && this.mCapabilities.isSupportBokeh()) {
            MiCameraCompat.applyBokehEnable(builder, this.mConfigs.isBokehEnabled());
        }
    }

    private void applyLensDirtyDetect(Builder builder, int i) {
        if (builder != null && this.mCapabilities.isSupportLensDirtyDetect()) {
            MiCameraCompat.applyLensDirtyDetect(builder, this.mConfigs.isLensDirtyDetectEnabled());
        }
    }

    private void applyPortraitLighting(Builder builder, int i) {
        if (builder != null && i == 3 && this.mCapabilities.isSupportPortraitLighting()) {
            MiCameraCompat.applyPortraitLighting(builder, this.mConfigs.getPortraitLightingPattern());
        }
    }

    private void applyFaceAgeAnalyze(Builder builder, int i) {
        if (builder != null && this.mCapabilities.isSupportFaceAgeAnalyze()) {
            MiCameraCompat.applyFaceAgeAnalyzeEnable(builder, this.mConfigs.isFaceAgeAnalyzeEnabled());
        }
    }

    private void applyFaceScore(Builder builder, int i) {
        if (builder != null && this.mCapabilities.isSupportFaceScore()) {
            MiCameraCompat.applyFaceScoreEnable(builder, this.mConfigs.isFaceScoreEnabled());
        }
    }

    private void applySuperResolution(Builder builder, int i) {
        if (builder != null && this.mCapabilities.isSupportSuperResolution()) {
            if (i != 3) {
                MiCameraCompat.applySuperResolution(builder, false);
            } else {
                MiCameraCompat.applySuperResolution(builder, this.mConfigs.isSuperResolutionEnabled());
            }
        }
    }

    private void applyWaterMark(Builder builder, int i) {
        if (builder != null && i == 3 && this.mCapabilities.isSupportWatermark()) {
            String join = Util.join(",", this.mConfigs.getWaterMarkAppliedList());
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("applyWaterMark appliedList:");
            stringBuilder.append(join);
            Log.d(str, stringBuilder.toString());
            if (join.length() > 0) {
                MiCameraCompat.applyWaterMarkAppliedList(builder, join);
                if (join.contains("watermark")) {
                    MiCameraCompat.applyTimeWaterMark(builder, this.mConfigs.getTimeWaterMarkValue());
                }
                if (join.contains("beautify")) {
                    MiCameraCompat.applyFaceWaterMark(builder, this.mConfigs.getFaceWaterMarkFormat());
                }
            }
        }
    }

    private void applyDeviceOrientation(Builder builder) {
        if (builder != null && this.mCapabilities.isSupportDeviceOrientation()) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("applyDeviceOrientation: ");
            stringBuilder.append(this.mConfigs.getDeviceOrientation());
            Log.d(str, stringBuilder.toString());
            MiCameraCompat.applyDeviceOrientation(builder, this.mConfigs.getDeviceOrientation());
        }
    }

    private void applyFrontMirror(Builder builder, int i) {
        if (builder != null && this.mCapabilities.isSupportFrontMirror() && i == 3) {
            MiCameraCompat.applyFrontMirror(builder, this.mConfigs.isFrontMirror());
        }
    }

    private void applyCommonSettings(Builder builder, int i) {
        builder.set(CaptureRequest.CONTROL_MODE, Integer.valueOf(1));
        applyFocusMode(builder);
        applyFaceDetection(builder);
        applyAntiBanding(builder);
        applyExposureCompensation(builder, i);
        applyZoomRatio(builder);
        if (ModuleManager.isCapture()) {
            applyContrast(builder);
            applySaturation(builder);
            applySharpness(builder);
            applyExposureMeteringMode(builder);
            applySceneMode(builder);
            if (ModuleManager.isSuperNightScene()) {
                applySuperNightScene(builder, i);
            }
            applyHHT(builder, i);
            applyHDR(builder, i);
            applySuperResolution(builder, i);
            applyMfnr(builder, i);
            applySwMfnr(builder, i);
            applyBokeh(builder, i);
            applyFaceAgeAnalyze(builder, i);
            applyFaceScore(builder, i);
            applyFrontMirror(builder, i);
            applyCameraAi30Enable(builder);
        }
        if (ModuleManager.isPortraitModule()) {
            applyContrast(builder);
            applySaturation(builder);
            applySharpness(builder);
            if (CameraSettings.isFrontCamera()) {
                applyBokeh(builder, i);
                applyFrontMirror(builder, i);
                applyFaceAgeAnalyze(builder, i);
                applyFaceScore(builder, i);
                applyMfnr(builder, i);
                applySwMfnr(builder, i);
            }
            applyPortraitLighting(builder, i);
            if (Util.UI_DEBUG()) {
                applyFNumber(builder);
            }
        }
        if (ModuleManager.isPortraitModule() || ModuleManager.isCapture()) {
            applyBeautyValues(builder);
            applyEyeLight(builder);
            applyWaterMark(builder, i);
        }
        if (ModuleManager.isPanoramaModule()) {
            applyAELock(builder, this.mConfigs.isAELocked());
        }
        if (ModuleManager.isManualModule()) {
            applyAWBMode(builder);
            applyCustomAWB(builder);
            applyFocusDistance(builder);
            applyIso(builder, i);
            applyExposureTime(builder, i);
        }
        applyNormalWideLDC(builder, i);
        applyUltraWideLDC(builder, i);
    }

    private void applySuperNightScene(Builder builder, int i) {
        if (builder != null && i == 3) {
            MiCameraCompat.applySuperNightScene(builder, true);
        }
    }

    private void applySettingsForPreview(Builder builder) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("applySettingsForPreview: ");
        stringBuilder.append(builder);
        Log.d(str, stringBuilder.toString());
        if (builder != null) {
            applyFlashMode(builder, 1);
            applyCommonSettings(builder, 1);
            applyLensDirtyDetect(builder, 1);
            applyAELock(builder, this.mConfigs.isAELocked());
            applyAWBLock(builder, this.mConfigs.isAWBLocked());
            applyAntiShake(builder);
            builder.set(CaptureRequest.CONTROL_AF_TRIGGER, Integer.valueOf(0));
        }
    }

    private void applySettingsForJpeg(Builder builder) {
        if (builder != null) {
            Location gpsLocation = this.mConfigs.getGpsLocation();
            if (gpsLocation != null) {
                builder.set(CaptureRequest.JPEG_GPS_LOCATION, new Location(gpsLocation));
            }
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("jpegRotation=");
            stringBuilder.append(this.mConfigs.getJpegRotation());
            Log.d(str, stringBuilder.toString());
            builder.set(CaptureRequest.JPEG_ORIENTATION, Integer.valueOf(this.mConfigs.getJpegRotation()));
            CameraSize thumbnailSize = this.mConfigs.getThumbnailSize();
            if (thumbnailSize != null) {
                builder.set(CaptureRequest.JPEG_THUMBNAIL_SIZE, new Size(thumbnailSize.getWidth(), thumbnailSize.getHeight()));
            }
            byte jpegQuality = (byte) this.mConfigs.getJpegQuality();
            builder.set(CaptureRequest.JPEG_THUMBNAIL_QUALITY, Byte.valueOf(jpegQuality));
            builder.set(CaptureRequest.JPEG_QUALITY, Byte.valueOf(jpegQuality));
        }
    }

    protected void applySettingsForCapture(Builder builder, int i) {
        if (builder != null) {
            boolean z = false;
            builder.set(CaptureRequest.CONTROL_AF_TRIGGER, Integer.valueOf(0));
            applyFlashMode(builder, i);
            applyCommonSettings(builder, i);
            applySettingsForJpeg(builder);
            applyZsl(builder);
            applyAntiShake(builder);
            applyFpsRange(builder);
            if (i != 4) {
                z = true;
            }
            applyDepurpleEnable(builder, z);
        }
    }

    protected void applySettingsForVideoShot(Builder builder, int i) {
        applySettingsForJpeg(builder);
        applyVideoFlash(builder);
        applyExposureCompensation(builder, i);
        applyZoomRatio(builder);
        applyAntiShake(builder);
        if (ModuleManager.isVideoModule() || ModuleManager.isFunModule()) {
            applyBeautyValues(builder);
        }
        applyFrontMirror(builder, i);
        applyFpsRange(builder);
    }

    private void applySettingsForVideo(Builder builder) {
        if (builder != null) {
            builder.set(CaptureRequest.CONTROL_MODE, Integer.valueOf(1));
            applyFlashMode(builder, 1);
            applyLensDirtyDetect(builder, 1);
            applyFocusMode(builder);
            applyFaceDetection(builder);
            applyAntiBanding(builder);
            applyExposureMeteringMode(builder);
            applyExposureCompensation(builder, 1);
            applyZoomRatio(builder);
            applyAntiShake(builder);
            applyAELock(builder, this.mConfigs.isAELocked());
            if (ModuleManager.isVideoModule() || ModuleManager.isFunModule()) {
                applyBeautyValues(builder);
            }
            applyVideoFpsRange(builder);
            applyFrontMirror(builder, 3);
            applyDeviceOrientation(builder);
        }
    }

    private void applyNoiseReduction(Builder builder) {
        if (builder != null) {
            builder.set(CaptureRequest.NOISE_REDUCTION_MODE, Integer.valueOf(2));
        }
    }

    private void applyVideoFlash(Builder builder) {
        if (builder != null) {
            int i;
            if (2 == this.mConfigs.getFlashMode()) {
                i = 1;
            } else {
                i = 0;
            }
            if (i != 0) {
                builder.set(CaptureRequest.FLASH_MODE, Integer.valueOf(2));
            } else {
                builder.set(CaptureRequest.FLASH_MODE, Integer.valueOf(0));
            }
        }
    }

    private void applyBeautyValues(Builder builder) {
        if (builder == null || !this.mCapabilities.isSupportBeauty()) {
            return;
        }
        if (((!ModuleManager.isVideoModule() && !ModuleManager.isFunModule()) || this.mCapabilities.isSupportVideoBeauty()) && this.mConfigs.getBeautyValues() != null) {
            MiCameraCompat.applyBeautyParameter(builder, this.mConfigs.getBeautyValues());
        }
    }

    private void applyFNumber(Builder builder) {
        if (builder != null) {
            if (!this.mCapabilities.isSupportBokehAdjust()) {
                Log.d(TAG, "set f number on unsupported devices");
            } else if (this.mConfigs.getFNumber() != null) {
                MiCameraCompat.applyFNumber(builder, this.mConfigs.getFNumber());
            }
        }
    }

    private void applyEyeLight(Builder builder) {
        if (builder != null && this.mCapabilities.isSupportEyeLight() && DataRepository.dataItemFeature().fq()) {
            int eyeLightType = this.mConfigs.getEyeLightType();
            if (eyeLightType < 0) {
                MiCameraCompat.applyEyeLight(builder, 0, 0);
            } else {
                MiCameraCompat.applyEyeLight(builder, eyeLightType, 100);
            }
        }
    }

    private void applyNormalWideLDC(Builder builder, int i) {
        if (builder != null && this.mCapabilities.isSupportNormalWideLDC()) {
            boolean z = this.mConfigs.getNormalWideLDCEnabled() && i != 4;
            MiCameraCompat.applyNormalWideLDC(builder, z);
        }
    }

    private void applyUltraWideLDC(Builder builder, int i) {
        if (builder != null && this.mCapabilities.isSupportUltraWideLDC()) {
            MiCameraCompat.applyUltraWideLDC(builder, this.mConfigs.getUltraWideLDCEnabled());
        }
    }

    private boolean checkCaptureSession(String str) {
        if (this.mCaptureSession != null) {
            return true;
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("session for camera ");
        stringBuilder.append(getId());
        stringBuilder.append(" is closed when ");
        stringBuilder.append(str);
        throw new RuntimeException(stringBuilder.toString());
    }

    private boolean checkCameraDevice(String str) {
        if (this.mCameraDevice != null) {
            return true;
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("camera ");
        stringBuilder.append(getId());
        stringBuilder.append(" is closed when ");
        stringBuilder.append(str);
        throw new RuntimeException(stringBuilder.toString());
    }

    protected boolean isFrontBeautyOn() {
        if (this.mCameraId == 1) {
            BeautyValues beautyValues = this.mConfigs.getBeautyValues();
            if (beautyValues == null) {
                Log.d(TAG, "Assume front beauty is off in case beautyValues is unavailable.");
                return false;
            } else if (b.hp()) {
                if (!BeautyConstant.LEVEL_CLOSE.equals(beautyValues.mBeautyLevel) || beautyValues.mBeautySkinColor > 0 || beautyValues.mBeautySlimFace > 0 || beautyValues.mBeautySkinSmooth > 0) {
                    return true;
                }
            } else if (!BeautyConstant.LEVEL_CLOSE.equals(beautyValues.mBeautyLevel)) {
                return true;
            }
        }
        return false;
    }

    private List<CaptureRequest> createHighSpeedRequestList(CaptureRequest captureRequest) throws CameraAccessException {
        if (captureRequest != null) {
            Collection targets = captureRequest.getTargets();
            Range range = (Range) captureRequest.get(CaptureRequest.CONTROL_AE_TARGET_FPS_RANGE);
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("createHighSpeedRequestList() fpsRange = ");
            stringBuilder.append(range);
            Log.d(str, stringBuilder.toString());
            int intValue = ((Integer) range.getUpper()).intValue() / 30;
            List arrayList = new ArrayList();
            int i = 0;
            Builder constructCaptureRequestBuilder = CompatibilityUtils.constructCaptureRequestBuilder(new CameraMetadataNative(captureRequest.getNativeCopy()), false, -1, captureRequest);
            Iterator it = targets.iterator();
            Surface surface = (Surface) it.next();
            if (targets.size() != 1 || SurfaceUtils.isSurfaceForHwVideoEncoder(surface)) {
                constructCaptureRequestBuilder.set(CaptureRequest.CONTROL_CAPTURE_INTENT, Integer.valueOf(3));
            } else {
                constructCaptureRequestBuilder.set(CaptureRequest.CONTROL_CAPTURE_INTENT, Integer.valueOf(1));
            }
            constructCaptureRequestBuilder.setPartOfCHSRequestList(true);
            Builder builder = null;
            if (targets.size() == 2) {
                builder = CompatibilityUtils.constructCaptureRequestBuilder(new CameraMetadataNative(captureRequest.getNativeCopy()), false, -1, captureRequest);
                builder.set(CaptureRequest.CONTROL_CAPTURE_INTENT, Integer.valueOf(3));
                builder.addTarget(surface);
                Surface surface2 = (Surface) it.next();
                builder.addTarget(surface2);
                builder.setPartOfCHSRequestList(true);
                if (SurfaceUtils.isSurfaceForHwVideoEncoder(surface)) {
                    surface2 = surface;
                }
                constructCaptureRequestBuilder.addTarget(surface2);
            } else {
                constructCaptureRequestBuilder.addTarget(surface);
            }
            while (i < intValue) {
                if (i != 0 || builder == null) {
                    arrayList.add(constructCaptureRequestBuilder.build());
                } else {
                    arrayList.add(builder.build());
                }
                i++;
            }
            return Collections.unmodifiableList(arrayList);
        }
        throw new IllegalArgumentException("Input capture request must not be null");
    }
}
