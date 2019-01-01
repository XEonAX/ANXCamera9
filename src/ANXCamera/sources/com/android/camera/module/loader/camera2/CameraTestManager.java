package com.android.camera.module.loader.camera2;

import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.graphics.Rect;
import android.graphics.SurfaceTexture;
import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CameraCaptureSession.CaptureCallback;
import android.hardware.camera2.CameraCharacteristics;
import android.hardware.camera2.CameraDevice;
import android.hardware.camera2.CameraDevice.StateCallback;
import android.hardware.camera2.CameraManager;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.CaptureRequest.Builder;
import android.hardware.camera2.CaptureResult;
import android.hardware.camera2.TotalCaptureResult;
import android.hardware.camera2.params.MeteringRectangle;
import android.media.Image;
import android.media.ImageReader;
import android.media.ImageReader.OnImageAvailableListener;
import android.media.MediaRecorder;
import android.os.Handler;
import android.os.HandlerThread;
import android.support.annotation.NonNull;
import android.view.Surface;
import com.android.camera.CameraAppImpl;
import com.android.camera.CameraSettings;
import com.android.camera.CameraSize;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.constant.ExceptionConstant;
import com.android.camera.data.data.config.ComponentManuallyDualLens;
import com.android.camera.log.Log;
import com.android.camera2.CameraCapabilities;
import io.reactivex.Observable;
import io.reactivex.ObservableEmitter;
import io.reactivex.ObservableOnSubscribe;
import io.reactivex.Observer;
import io.reactivex.observables.ConnectableObservable;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@SuppressLint({"MissingPermission"})
@TargetApi(21)
public class CameraTestManager {
    private static final String TAG = CameraTestManager.class.getSimpleName();
    private static int mAuxBackCameraId = -1;
    private static int mFrontCameraId = -1;
    private static int mMainBackCameraId = -1;
    private static int mMuxCameraId = -1;
    private static final CameraTestManager sInstance = new CameraTestManager();
    protected final int FOCUS_AREA_HEIGHT = CameraAppImpl.getAndroidContext().getResources().getDimensionPixelSize(R.dimen.focus_area_height);
    protected final int FOCUS_AREA_WIDTH = CameraAppImpl.getAndroidContext().getResources().getDimensionPixelSize(R.dimen.focus_area_width);
    private ObservableEmitter<Camera2Result> cameraOpenEmitter;
    private ConnectableObservable<Camera2Result> connectableObservable;
    private CaptureCallback mAfCaptureCallback = new CaptureCallback() {
        private void process(CaptureResult captureResult) {
            Integer num = (Integer) captureResult.get(CaptureResult.CONTROL_AF_STATE);
            if (num != null) {
                if (4 == num.intValue() || 5 == num.intValue()) {
                    CameraTestManager.this.mPreviewRequestBuilder.set(CaptureRequest.CONTROL_AF_TRIGGER, Integer.valueOf(2));
                    CameraTestManager.this.stopPreview();
                    Log.e("af:", "finish 0");
                    CameraTestManager.this.mPreviewRequestBuilder.set(CaptureRequest.CONTROL_AF_MODE, Integer.valueOf(3));
                    CameraTestManager.this.mPreviewRequestBuilder.set(CaptureRequest.CONTROL_AE_MODE, Integer.valueOf(1));
                    CameraTestManager.this.resumePreview();
                    CameraTestManager.this.mCameraPreviewCallback.onAutoFocusFinish(true);
                }
            }
        }

        public void onCaptureProgressed(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, @NonNull CaptureResult captureResult) {
            process(captureResult);
        }

        public void onCaptureCompleted(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, @NonNull TotalCaptureResult totalCaptureResult) {
            process(totalCaptureResult);
        }
    };
    private CameraDevice mCamera2Device;
    private CameraManager mCamera2Service;
    private CameraCaptureCallback mCameraCaptureCallback;
    private CameraCloseCallBack mCameraCloseCallBack;
    private Handler mCameraHandler;
    private final StateCallback mCameraOpenCallback = new StateCallback() {
        public void onOpened(@NonNull CameraDevice cameraDevice) {
            Log.e("mCameraOpenCallback", "open");
            CameraTestManager.this.mCamera2Device = cameraDevice;
            try {
                CameraTestManager.this.mCharacteristics = CameraTestManager.this.mCamera2Service.getCameraCharacteristics(String.valueOf(CameraTestManager.this.mCurrentActualCameraId));
            } catch (CameraAccessException e) {
                e.printStackTrace();
            }
            CameraTestManager.this.cameraOpenEmitter.onComplete();
            CameraTestManager.this.cameraOpenEmitter = null;
        }

        public void onClosed(@NonNull CameraDevice cameraDevice) {
            Log.e("mCameraOpenCallback", "close");
            CameraTestManager.this.mCamera2Device = null;
            CameraTestManager.this.mCameraCloseCallBack.onCameraClosed(cameraDevice);
            CameraTestManager.this.mCameraCloseCallBack = null;
        }

        public void onDisconnected(@NonNull CameraDevice cameraDevice) {
        }

        public void onError(@NonNull CameraDevice cameraDevice, int i) {
            CameraTestManager.this.cameraOpenEmitter.onNext(Camera2Result.create(3).setCameraError(ExceptionConstant.transFromCamera2Error(i)));
            CameraTestManager.this.cameraOpenEmitter.onComplete();
        }
    };
    private CameraPreviewCallback mCameraPreviewCallback;
    private final CaptureCallback mCameraPreviewContinuousCallBack = new CaptureCallback() {
        public void onCaptureProgressed(CameraCaptureSession cameraCaptureSession, CaptureRequest captureRequest, CaptureResult captureResult) {
            super.onCaptureProgressed(cameraCaptureSession, captureRequest, captureResult);
            Log.e("onCaptureProgressed", "yes");
        }

        public void onCaptureCompleted(CameraCaptureSession cameraCaptureSession, CaptureRequest captureRequest, TotalCaptureResult totalCaptureResult) {
            super.onCaptureCompleted(cameraCaptureSession, captureRequest, totalCaptureResult);
        }
    };
    private CameraCaptureSession mCameraPreviewSession;
    private final CameraCaptureSession.StateCallback mCameraPreviewSessionCallBack = new CameraCaptureSession.StateCallback() {
        public void onConfigured(CameraCaptureSession cameraCaptureSession) {
            CameraTestManager.this.mCameraPreviewSession = cameraCaptureSession;
            CameraTestManager.this.resumePreview();
            CameraTestManager.this.mCameraPreviewCallback.onPreviewSessionSuccess(cameraCaptureSession);
        }

        public void onConfigureFailed(CameraCaptureSession cameraCaptureSession) {
            CameraTestManager.this.mCameraPreviewSession = cameraCaptureSession;
            CameraTestManager.this.mCameraPreviewCallback.onPreviewSessionFailed(cameraCaptureSession);
        }
    };
    private Surface mCameraPreviewSurface;
    private List<CameraCapabilities> mCapabilities;
    private ImageReader mCaptureImageReader;
    private CameraCharacteristics mCharacteristics;
    private int mCurrentActualCameraId = -1;
    private final OnImageAvailableListener mOnFrameAvailableListener = new OnImageAvailableListener() {
        public void onImageAvailable(ImageReader imageReader) {
            Image acquireNextImage = imageReader.acquireNextImage();
            if (acquireNextImage != null) {
                CameraTestManager.this.mCameraPreviewCallback.onPreviewFrameAvailable(CameraTestManager.this.convertYUV420888ToNV21(acquireNextImage));
                acquireNextImage.close();
            }
        }
    };
    private final OnImageAvailableListener mOnImageAvailableListener = new OnImageAvailableListener() {
        /* JADX WARNING: Missing block: B:11:0x0032, code:
            if (r6 != null) goto L_0x0034;
     */
        /* JADX WARNING: Missing block: B:12:0x0034, code:
            if (r0 != null) goto L_0x0036;
     */
        /* JADX WARNING: Missing block: B:14:?, code:
            r6.close();
     */
        /* JADX WARNING: Missing block: B:15:0x003a, code:
            r6 = move-exception;
     */
        /* JADX WARNING: Missing block: B:16:0x003b, code:
            r0.addSuppressed(r6);
     */
        /* JADX WARNING: Missing block: B:17:0x003f, code:
            r6.close();
     */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        public void onImageAvailable(ImageReader imageReader) {
            Image acquireNextImage = imageReader.acquireNextImage();
            byte[] firstPlane = Util.getFirstPlane(acquireNextImage);
            if (firstPlane != null) {
                CameraTestManager.this.mCameraCaptureCallback.onPictureTaken(firstPlane, CameraTestManager.this.mCaptureImageReader.getWidth(), CameraTestManager.this.mCaptureImageReader.getHeight());
            }
            if (acquireNextImage != null) {
                acquireNextImage.close();
            }
        }
    };
    private ImageReader mPreviewFrameImageReader;
    private CaptureRequest mPreviewRequest;
    private Builder mPreviewRequestBuilder;

    public interface CameraCloseCallBack {
        void onCameraClosed(@NonNull CameraDevice cameraDevice);
    }

    public interface CameraCaptureCallback {
        void onPictureTaken(byte[] bArr, int i, int i2);
    }

    public interface CameraPreviewCallback {
        void onAutoFocusFinish(boolean z);

        void onPreviewFrameAvailable(byte[] bArr);

        void onPreviewSessionFailed(CameraCaptureSession cameraCaptureSession);

        void onPreviewSessionSuccess(CameraCaptureSession cameraCaptureSession);
    }

    private CameraTestManager() {
        initData();
    }

    private void initData() {
        HandlerThread handlerThread = new HandlerThread("Camera Handler Thread");
        handlerThread.start();
        this.mCameraHandler = new Handler(handlerThread.getLooper());
        this.mCapabilities = new ArrayList();
        this.mCamera2Service = (CameraManager) CameraAppImpl.getAndroidContext().getSystemService("camera");
        try {
            for (String str : this.mCamera2Service.getCameraIdList()) {
                try {
                    int parseInt = Integer.parseInt(str);
                    CameraCharacteristics cameraCharacteristics = this.mCamera2Service.getCameraCharacteristics(str);
                    Integer num = (Integer) cameraCharacteristics.get(CameraCharacteristics.LENS_FACING);
                    if (num != null) {
                        if (mMainBackCameraId == -1 && num.intValue() == 1) {
                            mMainBackCameraId = parseInt;
                        } else if (mFrontCameraId == -1 && num.intValue() == 0) {
                            mFrontCameraId = parseInt;
                        } else if (mAuxBackCameraId == -1 && num.intValue() == 1) {
                            mAuxBackCameraId = parseInt;
                        } else if (mMuxCameraId == -1 && num.intValue() == 1) {
                            mMuxCameraId = parseInt;
                        }
                    }
                    this.mCapabilities.add(parseInt, new CameraCapabilities(cameraCharacteristics));
                } catch (NumberFormatException e) {
                    String str2 = TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("non-integer camera id ");
                    stringBuilder.append(str);
                    Log.e(str2, stringBuilder.toString());
                }
            }
        } catch (Throwable e2) {
            Log.e(TAG, e2.getMessage(), e2);
        }
    }

    public static CameraTestManager getInstance() {
        return sInstance;
    }

    public Handler getCameraHandler() {
        return this.mCameraHandler;
    }

    public int getMainBackCameraId() {
        return mMainBackCameraId;
    }

    public int getFrontCameraId() {
        return mFrontCameraId;
    }

    public boolean hasMuxCamera() {
        return mMuxCameraId > 0;
    }

    public CameraCapabilities getCapabilities(int i) {
        return (CameraCapabilities) this.mCapabilities.get(i);
    }

    public CameraDevice getCurrentCamera2Device() {
        return this.mCamera2Device;
    }

    public CameraCharacteristics getCharacteristics() {
        return this.mCharacteristics;
    }

    public int getCurrentActualCameraId() {
        return this.mCurrentActualCameraId;
    }

    public void openCamera(int i, int i2, Observer<Camera2Result> observer) {
        if (this.cameraOpenEmitter == null || this.cameraOpenEmitter.isDisposed()) {
            this.connectableObservable = Observable.create(new ObservableOnSubscribe<Camera2Result>() {
                public void subscribe(ObservableEmitter<Camera2Result> observableEmitter) throws Exception {
                    CameraTestManager.this.cameraOpenEmitter = observableEmitter;
                }
            }).publish();
            this.connectableObservable.subscribe((Observer) observer);
            this.connectableObservable.connect();
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("connect | ");
            stringBuilder.append(observer.getClass().getName());
            stringBuilder.append(" | ");
            stringBuilder.append(Thread.currentThread().getName());
            Log.e("rx emmitter:", stringBuilder.toString());
            i = getActualOpenCameraId(i, i2);
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("start | ");
            stringBuilder2.append(observer.getClass().getName());
            stringBuilder2.append(" | ");
            stringBuilder2.append(Thread.currentThread().getName());
            Log.e("openCamera: ", stringBuilder2.toString());
            this.mCurrentActualCameraId = i;
            try {
                this.mCamera2Service.openCamera(String.valueOf(i), this.mCameraOpenCallback, this.mCameraHandler);
            } catch (CameraAccessException e) {
                e.printStackTrace();
            }
            return;
        }
        StringBuilder stringBuilder3 = new StringBuilder();
        stringBuilder3.append("return | ");
        stringBuilder3.append(observer.getClass().getName());
        stringBuilder3.append(" | ");
        stringBuilder3.append(Thread.currentThread().getName());
        Log.e("rx emmitter:", stringBuilder3.toString());
        this.connectableObservable.subscribe((Observer) observer);
    }

    public void closeCurrentCamera(CameraCloseCallBack cameraCloseCallBack) {
        this.mCameraCloseCallBack = cameraCloseCallBack;
        if (this.mCaptureImageReader != null) {
            this.mCaptureImageReader.close();
            this.mCaptureImageReader = null;
        }
        if (this.mPreviewFrameImageReader != null) {
            this.mPreviewFrameImageReader.close();
            this.mPreviewFrameImageReader = null;
        }
        releasePreview();
        if (!(this.mPreviewRequestBuilder == null || this.mCameraPreviewSurface == null)) {
            this.mPreviewRequestBuilder.removeTarget(this.mCameraPreviewSurface);
            this.mPreviewRequestBuilder = null;
        }
        if (this.mCamera2Device != null) {
            this.mCamera2Device.close();
            this.mCamera2Device = null;
        }
    }

    public void startPreviewSession(@NonNull CameraDevice cameraDevice, SurfaceTexture surfaceTexture, CameraPreviewCallback cameraPreviewCallback, CameraSize cameraSize) {
        this.mCameraPreviewCallback = cameraPreviewCallback;
        if (!(this.mPreviewRequestBuilder == null || this.mCameraPreviewSurface == null)) {
            this.mPreviewRequestBuilder.removeTarget(this.mCameraPreviewSurface);
        }
        this.mCameraPreviewSurface = new Surface(surfaceTexture);
        if (!(this.mCaptureImageReader == null || (this.mCaptureImageReader.getWidth() == cameraSize.width && this.mCaptureImageReader.getHeight() == cameraSize.height))) {
            this.mCaptureImageReader.close();
        }
        this.mCaptureImageReader = ImageReader.newInstance(cameraSize.width, cameraSize.height, 256, 2);
        this.mCaptureImageReader.setOnImageAvailableListener(this.mOnImageAvailableListener, this.mCameraHandler);
        try {
            this.mPreviewRequestBuilder = cameraDevice.createCaptureRequest(1);
            this.mPreviewRequestBuilder.addTarget(this.mCameraPreviewSurface);
            cameraDevice.createCaptureSession(Arrays.asList(new Surface[]{this.mCameraPreviewSurface, this.mCaptureImageReader.getSurface()}), this.mCameraPreviewSessionCallBack, this.mCameraHandler);
        } catch (CameraAccessException e) {
            e.printStackTrace();
            this.mCameraPreviewCallback.onPreviewSessionFailed(null);
        }
    }

    public void startPreviewSessionWithFrameCallback(@NonNull CameraDevice cameraDevice, SurfaceTexture surfaceTexture, CameraPreviewCallback cameraPreviewCallback, CameraSize cameraSize) {
        this.mCameraPreviewCallback = cameraPreviewCallback;
        if (!(this.mPreviewRequestBuilder == null || this.mCameraPreviewSurface == null)) {
            this.mPreviewRequestBuilder.removeTarget(this.mCameraPreviewSurface);
        }
        if (!(this.mPreviewFrameImageReader == null || (this.mPreviewFrameImageReader.getWidth() == cameraSize.width && this.mPreviewFrameImageReader.getHeight() == cameraSize.height))) {
            this.mPreviewFrameImageReader.close();
        }
        this.mPreviewFrameImageReader = ImageReader.newInstance(cameraSize.width, cameraSize.height, 35, 1);
        this.mPreviewFrameImageReader.setOnImageAvailableListener(this.mOnFrameAvailableListener, this.mCameraHandler);
        this.mCameraPreviewSurface = new Surface(surfaceTexture);
        try {
            this.mPreviewRequestBuilder = cameraDevice.createCaptureRequest(1);
            this.mPreviewRequestBuilder.addTarget(this.mCameraPreviewSurface);
            cameraDevice.createCaptureSession(Arrays.asList(new Surface[]{this.mCameraPreviewSurface, this.mPreviewFrameImageReader.getSurface()}), this.mCameraPreviewSessionCallBack, this.mCameraHandler);
        } catch (CameraAccessException e) {
            e.printStackTrace();
            this.mCameraPreviewCallback.onPreviewSessionFailed(null);
        }
    }

    public void acquireFrameCallback(CameraDevice cameraDevice) {
        Log.e("previewFrame:", "acquireFrameCallback");
        stopPreview();
        this.mPreviewRequestBuilder.addTarget(this.mPreviewFrameImageReader.getSurface());
        resumePreview();
    }

    public void stopFrameCallback() {
        stopPreview();
        Surface surface = this.mPreviewFrameImageReader.getSurface();
        this.mPreviewRequestBuilder.removeTarget(surface);
        surface.release();
        resumePreview();
    }

    private byte[] convertYUV420888ToNV21(Image image) {
        ByteBuffer buffer = image.getPlanes()[0].getBuffer();
        ByteBuffer buffer2 = image.getPlanes()[2].getBuffer();
        int remaining = buffer.remaining();
        int remaining2 = buffer2.remaining();
        byte[] bArr = new byte[(remaining + remaining2)];
        buffer.get(bArr, 0, remaining);
        buffer2.get(bArr, remaining, remaining2);
        return bArr;
    }

    public void startVideoRecording(@NonNull CameraDevice cameraDevice, SurfaceTexture surfaceTexture, MediaRecorder mediaRecorder, CameraPreviewCallback cameraPreviewCallback) {
        this.mCameraPreviewCallback = cameraPreviewCallback;
        if (!(this.mPreviewRequestBuilder == null || this.mCameraPreviewSurface == null)) {
            this.mPreviewRequestBuilder.removeTarget(this.mCameraPreviewSurface);
        }
        this.mCameraPreviewSurface = new Surface(surfaceTexture);
        Surface surface = mediaRecorder.getSurface();
        try {
            this.mPreviewRequestBuilder = cameraDevice.createCaptureRequest(3);
            this.mPreviewRequestBuilder.addTarget(this.mCameraPreviewSurface);
            this.mPreviewRequestBuilder.addTarget(surface);
            cameraDevice.createCaptureSession(Arrays.asList(new Surface[]{this.mCameraPreviewSurface, surface}), this.mCameraPreviewSessionCallBack, this.mCameraHandler);
        } catch (CameraAccessException e) {
            e.printStackTrace();
            this.mCameraPreviewCallback.onPreviewSessionFailed(null);
        }
    }

    public void stopRecordingVideo() {
        try {
            this.mCameraPreviewSession.stopRepeating();
            this.mCameraPreviewSession.abortCaptures();
        } catch (CameraAccessException e) {
            e.printStackTrace();
        }
    }

    public void setFocusMode(String str) {
        if (str.equals("0")) {
            this.mPreviewRequestBuilder.set(CaptureRequest.CONTROL_AE_MODE, Integer.valueOf(1));
            this.mPreviewRequestBuilder.set(CaptureRequest.FLASH_MODE, Integer.valueOf(0));
        } else if (str.equals("3")) {
            this.mPreviewRequestBuilder.set(CaptureRequest.CONTROL_AE_MODE, Integer.valueOf(2));
            this.mPreviewRequestBuilder.set(CaptureRequest.FLASH_MODE, Integer.valueOf(0));
        } else if (str.equals("1")) {
            this.mPreviewRequestBuilder.set(CaptureRequest.CONTROL_AE_MODE, Integer.valueOf(3));
            this.mPreviewRequestBuilder.set(CaptureRequest.FLASH_MODE, Integer.valueOf(0));
        } else if (str.equals("2")) {
            this.mPreviewRequestBuilder.set(CaptureRequest.CONTROL_AE_MODE, Integer.valueOf(1));
            this.mPreviewRequestBuilder.set(CaptureRequest.FLASH_MODE, Integer.valueOf(2));
        }
        resumePreview();
    }

    public void setPictureSize(CameraSize cameraSize) {
        if (!(this.mCaptureImageReader == null || (this.mCaptureImageReader.getWidth() == cameraSize.width && this.mCaptureImageReader.getHeight() == cameraSize.height))) {
            this.mCaptureImageReader.close();
        }
        this.mCaptureImageReader = ImageReader.newInstance(cameraSize.width, cameraSize.height, 256, 2);
        this.mCaptureImageReader.setOnImageAvailableListener(this.mOnImageAvailableListener, this.mCameraHandler);
    }

    public CameraSize getPictureSize() {
        return new CameraSize(this.mCaptureImageReader.getWidth(), this.mCaptureImageReader.getHeight());
    }

    public void setFocusArea(MeteringRectangle[] meteringRectangleArr, MeteringRectangle[] meteringRectangleArr2) {
        stopPreview();
        this.mPreviewRequestBuilder.set(CaptureRequest.CONTROL_AF_REGIONS, meteringRectangleArr);
        this.mPreviewRequestBuilder.set(CaptureRequest.CONTROL_AE_REGIONS, meteringRectangleArr2);
        this.mPreviewRequestBuilder.set(CaptureRequest.CONTROL_AF_MODE, Integer.valueOf(1));
        this.mPreviewRequestBuilder.set(CaptureRequest.CONTROL_AF_TRIGGER, Integer.valueOf(1));
        this.mPreviewRequestBuilder.set(CaptureRequest.CONTROL_AE_PRECAPTURE_TRIGGER, Integer.valueOf(1));
        this.mPreviewRequest = this.mPreviewRequestBuilder.build();
        try {
            this.mCameraPreviewSession.setRepeatingRequest(this.mPreviewRequest, this.mAfCaptureCallback, this.mCameraHandler);
        } catch (CameraAccessException e) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("setRepeatingRequest failed, ");
            stringBuilder.append(e.getMessage());
            Log.e("error", stringBuilder.toString());
        }
    }

    public void captureStillPicture(CameraCaptureCallback cameraCaptureCallback, int i) {
        this.mCameraCaptureCallback = cameraCaptureCallback;
        try {
            Builder createCaptureRequest = this.mCamera2Device.createCaptureRequest(2);
            createCaptureRequest.addTarget(this.mCaptureImageReader.getSurface());
            createCaptureRequest.set(CaptureRequest.CONTROL_AF_MODE, (Integer) this.mPreviewRequestBuilder.get(CaptureRequest.CONTROL_AF_MODE));
            ((Integer) this.mCharacteristics.get(CameraCharacteristics.SENSOR_ORIENTATION)).intValue();
            createCaptureRequest.set(CaptureRequest.JPEG_ORIENTATION, Integer.valueOf(i));
            this.mCameraPreviewSession.stopRepeating();
            this.mCameraPreviewSession.capture(createCaptureRequest.build(), new CaptureCallback() {
                public void onCaptureCompleted(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, @NonNull TotalCaptureResult totalCaptureResult) {
                    CameraTestManager.this.resumePreview();
                }
            }, null);
        } catch (CameraAccessException e) {
        }
    }

    public Rect getCropRect() {
        return (Rect) this.mPreviewRequest.get(CaptureRequest.SCALER_CROP_REGION);
    }

    public void applyZoom(Rect rect) {
        this.mPreviewRequestBuilder.set(CaptureRequest.SCALER_CROP_REGION, rect);
        resumePreview();
    }

    public void stopPreview() {
        if (this.mCameraPreviewSession != null) {
            try {
                this.mCameraPreviewSession.stopRepeating();
            } catch (CameraAccessException e) {
                e.printStackTrace();
            }
        }
    }

    public void releasePreview() {
        if (this.mCameraPreviewSession != null) {
            try {
                this.mCameraPreviewSession.stopRepeating();
                this.mCameraPreviewSession.close();
            } catch (CameraAccessException e) {
                e.printStackTrace();
            }
            this.mCameraPreviewSession = null;
        }
    }

    public void resumePreview() {
        if (this.mCameraPreviewSession != null) {
            try {
                this.mPreviewRequest = this.mPreviewRequestBuilder.build();
                this.mCameraPreviewSession.setRepeatingRequest(this.mPreviewRequest, this.mCameraPreviewContinuousCallBack, this.mCameraHandler);
            } catch (CameraAccessException e) {
                e.printStackTrace();
            }
        }
    }

    public void release(boolean z) {
        closeCurrentCamera(new CameraCloseCallBack() {
            public void onCameraClosed(@NonNull CameraDevice cameraDevice) {
            }
        });
        this.mCameraPreviewCallback = null;
    }

    public static int getActualOpenCameraId(int i, int i2) {
        Object obj = (CameraSettings.isSupportedOpticalZoom() || CameraSettings.isSupportedPortrait()) ? 1 : null;
        if (obj == null || i != 0) {
            return i;
        }
        if (!(i2 == 163 || i2 == 171)) {
            switch (i2) {
                case 165:
                    break;
                case 166:
                case 167:
                    if (!CameraSettings.isSwitchCameraZoomMode()) {
                        return i;
                    }
                    String cameraZoomMode = CameraSettings.getCameraZoomMode(i2);
                    if (ComponentManuallyDualLens.LENS_WIDE.equals(cameraZoomMode)) {
                        return mMainBackCameraId;
                    }
                    if (ComponentManuallyDualLens.LENS_TELE.equals(cameraZoomMode)) {
                        return mAuxBackCameraId;
                    }
                    return i;
                default:
                    return i;
            }
        }
        return mMuxCameraId;
    }

    public void setAe(int i) {
        this.mPreviewRequestBuilder.set(CaptureRequest.CONTROL_AE_EXPOSURE_COMPENSATION, Integer.valueOf(i));
        resumePreview();
    }

    public void lockAe(boolean z) {
        this.mPreviewRequestBuilder.set(CaptureRequest.CONTROL_AE_LOCK, Boolean.valueOf(z));
    }
}
