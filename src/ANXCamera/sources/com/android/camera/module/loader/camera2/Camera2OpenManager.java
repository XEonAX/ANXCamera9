package com.android.camera.module.loader.camera2;

import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.hardware.camera2.CameraDevice;
import android.hardware.camera2.CameraDevice.StateCallback;
import android.hardware.camera2.CameraManager;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import android.support.annotation.NonNull;
import com.android.camera.CameraAppImpl;
import com.android.camera.constant.ExceptionConstant;
import com.android.camera.constant.GlobalConstant;
import com.android.camera.log.Log;
import com.android.camera2.Camera2Proxy;
import com.android.camera2.CameraCapabilities;
import com.android.camera2.MiCamera2;
import io.reactivex.Observable;
import io.reactivex.ObservableEmitter;
import io.reactivex.ObservableOnSubscribe;
import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.functions.Function;
import io.reactivex.observables.ConnectableObservable;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

@SuppressLint({"MissingPermission"})
@TargetApi(21)
public class Camera2OpenManager {
    private static final long CAMERA_OPEN_OR_CLOSE_TIMEOUT = 5000;
    private static final int MANAGER_MSG_CLOSE_FINISH = 3;
    private static final int MANAGER_MSG_FORCE_CLOSE_CAMERA = 2;
    private static final int MANAGER_MSG_OPEN_FINISH = 4;
    private static final int MANAGER_MSG_REQUEST_CAMERA = 1;
    private static final int MANAGER_STATE_IDLE = 1;
    private static final int MANAGER_STATE_WAITING_CLOSE = 2;
    private static final int MANAGER_STATE_WAITING_OPEN = 3;
    private static final String TAG = Camera2OpenManager.class.getSimpleName();
    private static Camera2OpenManager sInstance;
    private Camera2Proxy mCamera2Device;
    private CameraManager mCamera2Service;
    private Handler mCameraHandler;
    private Handler mCameraMainThreadHandler;
    private final StateCallback mCameraOpenCallback = new StateCallback() {
        public void onOpened(@NonNull CameraDevice cameraDevice) {
            int parseInt = Integer.parseInt(cameraDevice.getId());
            CameraCapabilities capabilities = Camera2DataContainer.getInstance().getCapabilities(parseInt);
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("CameraOpenCallback: camera ");
            stringBuilder.append(parseInt);
            stringBuilder.append(" was opened successfully");
            String stringBuilder2 = stringBuilder.toString();
            if (capabilities != null) {
                Camera2OpenManager.this.mCamera2Device = new MiCamera2(cameraDevice, parseInt, capabilities, Camera2OpenManager.this.getCameraHandler(), Camera2OpenManager.this.getCameraMainThreadHandler());
                Camera2DataContainer.getInstance().setCurrentOpenedCameraId(parseInt);
                Log.d(Camera2OpenManager.TAG, stringBuilder2);
                Camera2OpenManager.this.mCameraHandler.sendEmptyMessage(4);
                return;
            }
            StringBuilder stringBuilder3 = new StringBuilder();
            stringBuilder3.append(stringBuilder2);
            stringBuilder3.append(", but corresponding CameraCapabilities is null");
            String stringBuilder4 = stringBuilder3.toString();
            Log.e(Camera2OpenManager.TAG, stringBuilder4);
            Camera2OpenManager.this.onCameraOpenFailed(231, stringBuilder4);
        }

        public void onClosed(@NonNull CameraDevice cameraDevice) {
            String access$200 = Camera2OpenManager.TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("CameraOpenCallback: closed ");
            stringBuilder.append(cameraDevice.getId());
            Log.d(access$200, stringBuilder.toString());
            Camera2OpenManager.this.mCameraHandler.sendEmptyMessage(3);
        }

        public void onDisconnected(@NonNull CameraDevice cameraDevice) {
            String access$200 = Camera2OpenManager.TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("CameraOpenCallback: onDisconnected ");
            stringBuilder.append(cameraDevice.getId());
            Log.d(access$200, stringBuilder.toString());
        }

        public void onError(@NonNull CameraDevice cameraDevice, int i) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("onError: cameraId=");
            stringBuilder.append(cameraDevice.getId());
            stringBuilder.append(" error=");
            stringBuilder.append(i);
            String stringBuilder2 = stringBuilder.toString();
            String access$200 = Camera2OpenManager.TAG;
            StringBuilder stringBuilder3 = new StringBuilder();
            stringBuilder3.append("CameraOpenCallback: ");
            stringBuilder3.append(stringBuilder2);
            Log.e(access$200, stringBuilder3.toString());
            Camera2OpenManager.this.onCameraOpenFailed(ExceptionConstant.transFromCamera2Error(i), stringBuilder2);
        }
    };
    private ObservableEmitter<Camera2Result> mCameraResultEmitter;
    private ConnectableObservable<Camera2Result> mCameraResultObservable;
    private AtomicInteger mCurrentModule = new AtomicInteger(160);
    private int mCurrentState = 1;
    private final Object mEmitterLock = new Object();
    private AtomicInteger mPendingCameraId = new AtomicInteger(-1);

    @interface ManagerState {
    }

    private Camera2OpenManager() {
        initData();
    }

    private void initData() {
        HandlerThread handlerThread = new HandlerThread("Camera Handler Thread");
        handlerThread.start();
        this.mCameraHandler = new Handler(handlerThread.getLooper()) {
            public void handleMessage(Message message) {
                Camera2OpenManager.this.onMessage(message);
            }
        };
        this.mCameraMainThreadHandler = new Handler(Looper.getMainLooper());
        this.mCamera2Service = (CameraManager) CameraAppImpl.getAndroidContext().getSystemService("camera");
        Camera2DataContainer.getInstance(this.mCamera2Service);
    }

    public static synchronized Camera2OpenManager getInstance() {
        Camera2OpenManager camera2OpenManager;
        synchronized (Camera2OpenManager.class) {
            if (sInstance == null) {
                sInstance = new Camera2OpenManager();
            }
            camera2OpenManager = sInstance;
        }
        return camera2OpenManager;
    }

    public Handler getCameraHandler() {
        return this.mCameraHandler;
    }

    public Handler getCameraMainThreadHandler() {
        return this.mCameraMainThreadHandler;
    }

    public Camera2Proxy getCurrentCamera2Device() {
        return this.mCamera2Device;
    }

    public int getPendingCameraId() {
        return this.mPendingCameraId.get();
    }

    private void abandonOpenObservableIfExists() {
        Log.d(TAG, "abandonOpenObservableIfExists: start...");
        synchronized (this.mEmitterLock) {
            Log.d(TAG, "abandonOpenObservableIfExists: in Lock...");
            if (!(this.mCameraResultEmitter == null || this.mCameraResultEmitter.isDisposed())) {
                this.mCameraResultEmitter.onNext(Camera2Result.create(3).setCameraError(225));
                this.mCameraResultEmitter.onComplete();
                this.mCameraResultEmitter = null;
            }
        }
        Log.d(TAG, "abandonOpenObservableIfExists: end...");
    }

    private boolean attachInObservable(Observer<Camera2Result> observer) {
        boolean z;
        Log.d(TAG, "attachInObservable: start...");
        synchronized (this.mEmitterLock) {
            Log.d(TAG, "attachInObservable: in lock...");
            if (this.mCameraResultEmitter == null || this.mCameraResultEmitter.isDisposed()) {
                this.mCameraResultObservable = Observable.create(new ObservableOnSubscribe<Camera2Result>() {
                    public void subscribe(ObservableEmitter<Camera2Result> observableEmitter) {
                        Camera2OpenManager.this.mCameraResultEmitter = observableEmitter;
                    }
                }).timeout((long) CAMERA_OPEN_OR_CLOSE_TIMEOUT, TimeUnit.MILLISECONDS).onErrorResumeNext(new Function<Throwable, ObservableSource<Camera2Result>>() {
                    public ObservableSource<Camera2Result> apply(Throwable th) {
                        String access$200 = Camera2OpenManager.TAG;
                        StringBuilder stringBuilder = new StringBuilder();
                        stringBuilder.append("Exception occurs in camera open or close: ");
                        stringBuilder.append(th);
                        Log.d(access$200, stringBuilder.toString());
                        if (!Camera2OpenManager.this.mCameraHandler.getLooper().getQueue().isPolling()) {
                            Log.d(Camera2OpenManager.TAG, "CameraHandlerThread is being stuck...");
                        }
                        return Observable.just(Camera2Result.create(3).setCameraError(236));
                    }
                }).observeOn(GlobalConstant.sCameraSetupScheduler).publish();
                this.mCameraResultObservable.subscribe((Observer) observer);
                this.mCameraResultObservable.connect();
                z = false;
            } else {
                this.mCameraResultObservable.subscribe((Observer) observer);
                z = true;
            }
        }
        Log.d(TAG, "attachInObservable: end...");
        return z;
    }

    public void openCamera(int i, int i2, Observer<Camera2Result> observer, boolean z) {
        i = Camera2DataContainer.getInstance().getActualOpenCameraId(i, i2);
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("openCamera: pendingOpenId = ");
        stringBuilder.append(i);
        stringBuilder.append(", mPendingCameraId = ");
        stringBuilder.append(this.mPendingCameraId.get());
        stringBuilder.append(", currentMode = ");
        stringBuilder.append(i2);
        stringBuilder.append(", mCurrentModule = ");
        stringBuilder.append(this.mCurrentModule.get());
        stringBuilder.append(", forceClose = ");
        stringBuilder.append(z);
        Log.d(str, stringBuilder.toString());
        if (!(this.mPendingCameraId.get() == i && this.mCurrentModule.get() == i2)) {
            this.mCameraHandler.removeCallbacksAndMessages(null);
            this.mPendingCameraId.set(i);
            this.mCurrentModule.set(i2);
            abandonOpenObservableIfExists();
        }
        attachInObservable(observer);
        if (z) {
            this.mCameraHandler.sendEmptyMessage(2);
        } else {
            this.mCameraHandler.sendEmptyMessage(1);
        }
    }

    public void release(boolean z) {
        abandonOpenObservableIfExists();
        this.mPendingCameraId.set(-1);
        this.mCameraHandler.removeCallbacksAndMessages(null);
        this.mCurrentModule.set(160);
        setManagerState(1);
        this.mCameraHandler.sendEmptyMessage(2);
    }

    /* JADX WARNING: Removed duplicated region for block: B:31:0x0124 A:{ExcHandler: android.hardware.camera2.CameraAccessException (r0_32 'e' java.lang.Throwable), Splitter: B:29:0x010a} */
    /* JADX WARNING: Removed duplicated region for block: B:31:0x0124 A:{ExcHandler: android.hardware.camera2.CameraAccessException (r0_32 'e' java.lang.Throwable), Splitter: B:29:0x010a} */
    /* JADX WARNING: Missing block: B:31:0x0124, code:
            r0 = move-exception;
     */
    /* JADX WARNING: Missing block: B:32:0x0125, code:
            r0.printStackTrace();
            onCameraOpenFailed(230, r0.getClass().getSimpleName());
            r1 = TAG;
            r2 = new java.lang.StringBuilder();
            r2.append("openCamera: failed to open camera ");
            r2.append(r5.mPendingCameraId.get());
            com.android.camera.log.Log.e(r1, r2.toString(), r0);
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void onMessage(Message message) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("handleMessage: start... msg = ");
        stringBuilder.append(message);
        Log.d(str, stringBuilder.toString());
        switch (message.what) {
            case 1:
                if (this.mPendingCameraId.get() >= 0) {
                    if (this.mCamera2Device != null && this.mCamera2Device.getId() == this.mPendingCameraId.get()) {
                        StringBuilder stringBuilder2 = new StringBuilder();
                        stringBuilder2.append("Camera ");
                        stringBuilder2.append(this.mCamera2Device.getId());
                        stringBuilder2.append(" was opened successfully");
                        str = stringBuilder2.toString();
                        if (this.mCamera2Device.getCapabilities() != null) {
                            Log.d(TAG, str);
                            onCameraOpenSuccess();
                            break;
                        }
                        stringBuilder = new StringBuilder();
                        stringBuilder.append(str);
                        stringBuilder.append(", but corresponding CameraCapabilities is null");
                        str = stringBuilder.toString();
                        Log.d(TAG, str);
                        onCameraOpenFailed(231, str);
                        break;
                    } else if (this.mCamera2Device != null) {
                        setManagerState(2);
                        Log.d(TAG, "close start");
                        this.mCamera2Device.close();
                        this.mCamera2Device = null;
                        break;
                    } else if (getManagerState() == 1) {
                        try {
                            setManagerState(3);
                            Log.d(TAG, "open start");
                            this.mCamera2Service.openCamera(String.valueOf(this.mPendingCameraId), this.mCameraOpenCallback, this.mCameraHandler);
                            break;
                        } catch (Throwable e) {
                        }
                    }
                } else if (this.mCamera2Device != null) {
                    setManagerState(2);
                    Log.e(TAG, "close start");
                    this.mCamera2Device.close();
                    this.mCamera2Device = null;
                    break;
                }
                break;
            case 2:
                if (this.mCamera2Device != null) {
                    if (getManagerState() == 1) {
                        setManagerState(2);
                        Log.e(TAG, "force close start");
                        this.mCamera2Device.releasePreview();
                        this.mCamera2Device.resetConfigs();
                        this.mCamera2Device.close();
                        this.mCamera2Device = null;
                        break;
                    }
                }
                this.mCameraHandler.sendEmptyMessage(1);
                break;
                break;
            case 3:
                Log.e(TAG, "close finish");
                setManagerState(1);
                this.mCameraHandler.sendEmptyMessage(1);
                break;
            case 4:
                Log.e(TAG, "open finish");
                setManagerState(1);
                this.mCameraHandler.sendEmptyMessage(1);
                break;
        }
        str = TAG;
        stringBuilder = new StringBuilder();
        stringBuilder.append("handleMessage: End...msg = ");
        stringBuilder.append(message);
        Log.d(str, stringBuilder.toString());
    }

    private void setManagerState(@ManagerState int i) {
        this.mCurrentState = i;
    }

    @ManagerState
    private int getManagerState() {
        return this.mCurrentState;
    }

    private void onCameraOpenSuccess() {
        setManagerState(1);
        synchronized (this.mEmitterLock) {
            if (this.mCameraResultEmitter != null) {
                this.mCameraResultEmitter.onNext(Camera2Result.create(2));
                this.mCameraResultEmitter.onComplete();
            }
        }
    }

    private void onCameraOpenFailed(int i, String str) {
        String str2 = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("onCameraOpenFailed: ");
        stringBuilder.append(i);
        stringBuilder.append(" msg:");
        stringBuilder.append(str);
        Log.e(str2, stringBuilder.toString());
        setManagerState(1);
        synchronized (this.mEmitterLock) {
            if (this.mCameraResultEmitter != null) {
                this.mCameraResultEmitter.onNext(Camera2Result.create(3).setCameraError(i));
                this.mCameraResultEmitter.onComplete();
            }
        }
    }
}
