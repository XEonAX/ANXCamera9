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
            CameraDevice cameraDevice2 = cameraDevice;
            int i = parseInt;
            Camera2OpenManager.this.mCamera2Device = new MiCamera2(cameraDevice2, i, Camera2DataContainer.getInstance().getCapabilities(parseInt), Camera2OpenManager.this.getCameraHandler(), Camera2OpenManager.this.getCameraMainThreadHandler());
            Camera2DataContainer.getInstance().setCurrentOpenedCameraId(parseInt);
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("CameraOpenCallback: camera ");
            stringBuilder.append(parseInt);
            stringBuilder.append(" was opened successfully");
            String stringBuilder2 = stringBuilder.toString();
            if (Camera2OpenManager.this.mCamera2Device.getCapabilities() == null) {
                StringBuilder stringBuilder3 = new StringBuilder();
                stringBuilder3.append(stringBuilder2);
                stringBuilder3.append(", but corresponding CameraCapabilities is null");
                stringBuilder2 = stringBuilder3.toString();
                Log.d(Camera2OpenManager.TAG, stringBuilder2);
                Camera2OpenManager.this.onCameraOpenFailed(231, stringBuilder2);
                return;
            }
            Log.d(Camera2OpenManager.TAG, stringBuilder2);
            Camera2OpenManager.this.mCameraHandler.sendEmptyMessage(4);
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
            String access$200 = Camera2OpenManager.TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("CameraOpenCallback: onError ");
            stringBuilder.append(cameraDevice.getId());
            Log.d(access$200, stringBuilder.toString());
            Camera2OpenManager.this.onCameraOpenFailed(ExceptionConstant.transFromCamera2Error(i), "onError");
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
    private void onMessage(android.os.Message r6) {
        /*
        r5 = this;
        r0 = TAG;
        r1 = new java.lang.StringBuilder;
        r1.<init>();
        r2 = "handleMessage: start... msg = ";
        r1.append(r2);
        r1.append(r6);
        r1 = r1.toString();
        com.android.camera.log.Log.d(r0, r1);
        r0 = r6.what;
        r1 = 0;
        r2 = 2;
        r3 = 1;
        switch(r0) {
            case 1: goto L_0x0072;
            case 2: goto L_0x0042;
            case 3: goto L_0x0031;
            case 4: goto L_0x0020;
            default: goto L_0x001e;
        };
    L_0x001e:
        goto L_0x0152;
    L_0x0020:
        r0 = TAG;
        r1 = "open finish";
        com.android.camera.log.Log.e(r0, r1);
        r5.setManagerState(r3);
        r0 = r5.mCameraHandler;
        r0.sendEmptyMessage(r3);
        goto L_0x0152;
    L_0x0031:
        r0 = TAG;
        r1 = "close finish";
        com.android.camera.log.Log.e(r0, r1);
        r5.setManagerState(r3);
        r0 = r5.mCameraHandler;
        r0.sendEmptyMessage(r3);
        goto L_0x0152;
    L_0x0042:
        r0 = r5.mCamera2Device;
        if (r0 != 0) goto L_0x004d;
    L_0x0046:
        r0 = r5.mCameraHandler;
        r0.sendEmptyMessage(r3);
        goto L_0x0152;
    L_0x004d:
        r0 = r5.getManagerState();
        if (r0 == r3) goto L_0x0055;
    L_0x0053:
        goto L_0x0152;
    L_0x0055:
        r5.setManagerState(r2);
        r0 = TAG;
        r2 = "force close start";
        com.android.camera.log.Log.e(r0, r2);
        r0 = r5.mCamera2Device;
        r0.releasePreview();
        r0 = r5.mCamera2Device;
        r0.resetConfigs();
        r0 = r5.mCamera2Device;
        r0.close();
        r5.mCamera2Device = r1;
        goto L_0x0152;
    L_0x0072:
        r0 = r5.mPendingCameraId;
        r0 = r0.get();
        if (r0 >= 0) goto L_0x0091;
    L_0x007a:
        r0 = r5.mCamera2Device;
        if (r0 == 0) goto L_0x0152;
    L_0x007e:
        r5.setManagerState(r2);
        r0 = TAG;
        r2 = "close start";
        com.android.camera.log.Log.e(r0, r2);
        r0 = r5.mCamera2Device;
        r0.close();
        r5.mCamera2Device = r1;
        goto L_0x0152;
    L_0x0091:
        r0 = r5.mCamera2Device;
        if (r0 == 0) goto L_0x00ec;
    L_0x0095:
        r0 = r5.mCamera2Device;
        r0 = r0.getId();
        r4 = r5.mPendingCameraId;
        r4 = r4.get();
        if (r0 != r4) goto L_0x00ec;
    L_0x00a3:
        r0 = new java.lang.StringBuilder;
        r0.<init>();
        r1 = "Camera ";
        r0.append(r1);
        r1 = r5.mCamera2Device;
        r1 = r1.getId();
        r0.append(r1);
        r1 = " was opened successfully";
        r0.append(r1);
        r0 = r0.toString();
        r1 = r5.mCamera2Device;
        r1 = r1.getCapabilities();
        if (r1 != 0) goto L_0x00e3;
    L_0x00c7:
        r1 = new java.lang.StringBuilder;
        r1.<init>();
        r1.append(r0);
        r0 = ", but corresponding CameraCapabilities is null";
        r1.append(r0);
        r0 = r1.toString();
        r1 = TAG;
        com.android.camera.log.Log.d(r1, r0);
        r1 = 231; // 0xe7 float:3.24E-43 double:1.14E-321;
        r5.onCameraOpenFailed(r1, r0);
        goto L_0x0152;
    L_0x00e3:
        r1 = TAG;
        com.android.camera.log.Log.d(r1, r0);
        r5.onCameraOpenSuccess();
        goto L_0x0152;
    L_0x00ec:
        r0 = r5.mCamera2Device;
        if (r0 == 0) goto L_0x0102;
    L_0x00f0:
        r5.setManagerState(r2);
        r0 = TAG;
        r2 = "close start";
        com.android.camera.log.Log.e(r0, r2);
        r0 = r5.mCamera2Device;
        r0.close();
        r5.mCamera2Device = r1;
        goto L_0x0152;
    L_0x0102:
        r0 = r5.getManagerState();
        if (r0 == r3) goto L_0x0109;
    L_0x0108:
        goto L_0x0152;
    L_0x0109:
        r0 = 3;
        r5.setManagerState(r0);	 Catch:{ CameraAccessException -> 0x0124, CameraAccessException -> 0x0124, CameraAccessException -> 0x0124 }
        r0 = TAG;	 Catch:{ CameraAccessException -> 0x0124, CameraAccessException -> 0x0124, CameraAccessException -> 0x0124 }
        r1 = "open start";
        com.android.camera.log.Log.e(r0, r1);	 Catch:{ CameraAccessException -> 0x0124, CameraAccessException -> 0x0124, CameraAccessException -> 0x0124 }
        r0 = r5.mCamera2Service;	 Catch:{ CameraAccessException -> 0x0124, CameraAccessException -> 0x0124, CameraAccessException -> 0x0124 }
        r1 = r5.mPendingCameraId;	 Catch:{ CameraAccessException -> 0x0124, CameraAccessException -> 0x0124, CameraAccessException -> 0x0124 }
        r1 = java.lang.String.valueOf(r1);	 Catch:{ CameraAccessException -> 0x0124, CameraAccessException -> 0x0124, CameraAccessException -> 0x0124 }
        r2 = r5.mCameraOpenCallback;	 Catch:{ CameraAccessException -> 0x0124, CameraAccessException -> 0x0124, CameraAccessException -> 0x0124 }
        r3 = r5.mCameraHandler;	 Catch:{ CameraAccessException -> 0x0124, CameraAccessException -> 0x0124, CameraAccessException -> 0x0124 }
        r0.openCamera(r1, r2, r3);	 Catch:{ CameraAccessException -> 0x0124, CameraAccessException -> 0x0124, CameraAccessException -> 0x0124 }
        goto L_0x0152;
    L_0x0124:
        r0 = move-exception;
        r0.printStackTrace();
        r1 = 230; // 0xe6 float:3.22E-43 double:1.136E-321;
        r2 = r0.getClass();
        r2 = r2.getSimpleName();
        r5.onCameraOpenFailed(r1, r2);
        r1 = TAG;
        r2 = new java.lang.StringBuilder;
        r2.<init>();
        r3 = "openCamera: failed to open camera ";
        r2.append(r3);
        r3 = r5.mPendingCameraId;
        r3 = r3.get();
        r2.append(r3);
        r2 = r2.toString();
        com.android.camera.log.Log.e(r1, r2, r0);
    L_0x0152:
        r0 = TAG;
        r1 = new java.lang.StringBuilder;
        r1.<init>();
        r2 = "handleMessage: End...msg = ";
        r1.append(r2);
        r1.append(r6);
        r6 = r1.toString();
        com.android.camera.log.Log.d(r0, r6);
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.module.loader.camera2.Camera2OpenManager.onMessage(android.os.Message):void");
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
