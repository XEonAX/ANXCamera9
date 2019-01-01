package com.android.camera;

import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.ServiceConnection;
import android.database.ContentObserver;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IPowerManager;
import android.os.IPowerManager.Stub;
import android.os.Looper;
import android.os.Message;
import android.os.ServiceManager;
import android.os.UserHandle;
import android.support.annotation.MainThread;
import android.support.v4.app.ActivityCompat.OnRequestPermissionsResultCallback;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentTransaction;
import android.support.v4.provider.DocumentFile;
import android.text.TextUtils;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.OrientationEventListener;
import android.view.Window;
import android.view.WindowManager.LayoutParams;
import android.widget.ImageView;
import android.widget.TextView;
import com.android.camera.LocalParallelService.LocalBinder;
import com.android.camera.constant.GlobalConstant;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.global.DataItemGlobal;
import com.android.camera.effect.EffectController;
import com.android.camera.fragment.BaseFragmentDelegate;
import com.android.camera.fragment.dialog.AiSceneNewbieDialogFragment;
import com.android.camera.fragment.dialog.FrontRotateNewbieDialogFragment;
import com.android.camera.fragment.dialog.HibernationFragment;
import com.android.camera.fragment.dialog.LensDirtyDetectDialogFragment;
import com.android.camera.fragment.dialog.PortraitNewbieDialogFragment;
import com.android.camera.fragment.dialog.UltraWideNewbieDialogFragment;
import com.android.camera.fragment.lifeCircle.BaseLifecycleListener;
import com.android.camera.fragment.top.FragmentTopConfig;
import com.android.camera.lib.compatibility.util.CompatibilityUtils;
import com.android.camera.log.Log;
import com.android.camera.module.BaseModule;
import com.android.camera.module.Module;
import com.android.camera.module.ModuleManager;
import com.android.camera.module.impl.ImplFactory;
import com.android.camera.module.loader.FunctionCameraLegacySetup;
import com.android.camera.module.loader.FunctionCameraPrepare;
import com.android.camera.module.loader.FunctionDataSetup;
import com.android.camera.module.loader.FunctionModuleSetup;
import com.android.camera.module.loader.FunctionResumeModule;
import com.android.camera.module.loader.FunctionUISetup;
import com.android.camera.module.loader.NullHolder;
import com.android.camera.module.loader.StartControl;
import com.android.camera.module.loader.camera2.Camera2OpenManager;
import com.android.camera.module.loader.camera2.Camera2OpenOnSubScribe;
import com.android.camera.module.loader.camera2.Camera2Result;
import com.android.camera.module.loader.camera2.CompletablePreFixCamera2Setup;
import com.android.camera.parallel.AlgoConnector;
import com.android.camera.permission.PermissionManager;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.ActionProcessing;
import com.android.camera.protocol.ModeProtocol.BaseProtocol;
import com.android.camera.protocol.ModeProtocol.FullScreenProtocol;
import com.android.camera.protocol.ModeProtocol.TopAlert;
import com.android.camera.statistic.CameraStat;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera.statistic.ScenarioTrackUtil;
import com.android.camera.storage.ImageSaver;
import com.android.camera.storage.PriorityStorageBroadcastReceiver;
import com.android.camera.storage.Storage;
import com.android.camera.ui.CameraRootView;
import com.android.camera.ui.V6CameraGLSurfaceView;
import com.android.camera.ui.V6GestureRecognizer;
import com.android.camera.ui.V9EdgeShutterView;
import com.mi.config.b;
import io.reactivex.Completable;
import io.reactivex.Single;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.annotations.NonNull;
import io.reactivex.disposables.Disposable;
import io.reactivex.functions.BiFunction;
import io.reactivex.functions.Consumer;
import io.reactivex.functions.Function;
import java.util.List;
import java.util.Locale;
import miui.hardware.display.DisplayFeatureManager;

public class Camera extends ActivityBase implements OnRequestPermissionsResultCallback, BaseLifecycleListener, BaseProtocol {
    private static final String TAG = Camera.class.getSimpleName();
    private BaseFragmentDelegate mBaseFragmentDelegate;
    private Camera2OpenOnSubScribe mCamera2OpenOnSubScribe;
    private BiFunction mCameraOpenResult = new BiFunction<NullHolder<BaseModule>, Camera2Result, NullHolder<BaseModule>>() {
        public NullHolder<BaseModule> apply(@NonNull NullHolder<BaseModule> nullHolder, @NonNull Camera2Result camera2Result) throws Exception {
            int result = camera2Result.getResult();
            String access$400 = Camera.TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("mCameraOpenResult apply : result = ");
            stringBuilder.append(result);
            Log.d(access$400, stringBuilder.toString());
            switch (result) {
                case 3:
                    if (nullHolder.isPresent()) {
                        ((BaseModule) nullHolder.get()).setDeparted();
                    }
                    Camera.this.showCameraError(camera2Result.getCameraError());
                    break;
            }
            return nullHolder;
        }
    };
    private Disposable mCameraPendingSetupDisposable;
    private Consumer<NullHolder<BaseModule>> mCameraSetupConsumer = new Consumer<NullHolder<BaseModule>>() {
        public void accept(@NonNull NullHolder<BaseModule> nullHolder) throws Exception {
            if (nullHolder.isPresent()) {
                V6GestureRecognizer.getInstance(Camera.this).setCurrentModule((Module) nullHolder.get());
            } else {
                Camera.this.showCameraError(nullHolder.getException());
                Camera.this.mCurrentModule = null;
            }
            Camera.this.getCameraScreenNail().resetFrameAvailableFlag();
            Camera.this.setSwitchingModule(false);
            Camera.this.mCameraSetupDisposable = null;
            DataRepository.dataCloudMgr().fillCloudValues();
            AutoLockManager.getInstance(Camera.this).hibernateDelayed();
            Camera.this.showFirstUseHintIfNeeded();
            Log.d(Camera.TAG, "cameraSetupConsumer#accept switch module done.");
        }
    };
    private Disposable mCameraSetupDisposable;
    private LogThread mDebugThread;
    private boolean mDidRegister;
    private DisplayFeatureManager mDisplayFeatureManager;
    private boolean mFirstOrientationArrived;
    private boolean mHasFocus;
    private ImageSaver mImageSaver;
    private ImplFactory mImplFactory;
    private boolean mIsGalleryServiceBound = false;
    private boolean mIsModeSwitched;
    private boolean mIsScreenSlideOff;
    private int mLastIgnoreKey = -1;
    private long mLastKeyEventTime = 0;
    private MyOrientationEventListener mOrientationListener;
    private int mPendingScreenSlideKeyCode;
    private IPowerManager mPowerManager;
    private ProximitySensorLock mProximitySensorLock;
    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {
        public void onReceive(Context context, Intent intent) {
            if (!Camera.this.mCurrentModule.isDeparted()) {
                Camera.this.mCurrentModule.onBroadcastReceived(context, intent);
            }
        }
    };
    private BroadcastReceiver mSDReceiver = new BroadcastReceiver() {
        public void onReceive(Context context, Intent intent) {
            if (!Camera.this.mCurrentModule.isDeparted()) {
                Camera.this.mCurrentModule.onBroadcastReceived(context, intent);
            }
        }
    };
    private ContentObserver mScreenSlideStatusObserver = new ContentObserver(this.mHandler) {
        public void onChange(boolean z) {
            super.onChange(z);
            if (!Camera.this.mHasFocus && !Camera.this.mActivityPaused) {
                int i = Util.isScreenSlideOff(Camera.this) ? Util.KEYCODE_SLIDE_OFF : Util.KEYCODE_SLIDE_ON;
                String access$400 = Camera.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("focus lost, try key code: ");
                stringBuilder.append(i);
                Log.d(access$400, stringBuilder.toString());
                Camera.this.onKeyDown(i, new KeyEvent(0, i));
            }
        }

        public boolean deliverSelfNotifications() {
            return true;
        }
    };
    private SensorStateManager mSensorStateManager;
    private ServiceConnection mServiceConnection = new ServiceConnection() {
        public void onServiceConnected(ComponentName componentName, IBinder iBinder) {
        }

        public void onServiceDisconnected(ComponentName componentName) {
        }
    };
    private StartControl mStartControl;
    private volatile int mTick;
    private Thread mWatchDog;
    private String newbieDialogFragmentTag = null;
    private final Runnable tickerRunnable = new Runnable() {
        public void run() {
            Camera.this.mTick = (Camera.this.mTick + 1) % 10;
        }
    };

    class LogThread extends Thread {
        private volatile boolean mRunFlag = true;

        LogThread() {
        }

        public void setRunFlag(boolean z) {
            this.mRunFlag = z;
        }

        public void run() {
            while (this.mRunFlag) {
                try {
                    Thread.sleep(10);
                    if (!Camera.this.isActivityPaused()) {
                        Camera.this.mHandler.obtainMessage(0, Util.getDebugInfo()).sendToTarget();
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    return;
                }
            }
        }
    }

    private class MyOrientationEventListener extends OrientationEventListener {
        public MyOrientationEventListener(Context context) {
            super(context);
        }

        public void onOrientationChanged(int i) {
            if (i != -1) {
                Camera.this.mOrientation = Util.roundOrientation(i, Camera.this.mOrientation);
                if (!Camera.this.mFirstOrientationArrived) {
                    Camera.this.mFirstOrientationArrived = true;
                    String access$400 = Camera.TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("onOrientationChanged: first orientation is arrived... , orientation = ");
                    stringBuilder.append(i);
                    stringBuilder.append(", mOrientation = ");
                    stringBuilder.append(Camera.this.mOrientation);
                    Log.d(access$400, stringBuilder.toString());
                }
                i = Util.getDisplayRotation(Camera.this);
                if (i != Camera.this.mDisplayRotation) {
                    Camera.this.mDisplayRotation = i;
                    Camera.this.onDisplayRotationChanged();
                }
                Camera.this.mOrientationCompensation = (Camera.this.mOrientation + Camera.this.mDisplayRotation) % 360;
                if (Camera.this.mCurrentModule != null) {
                    Camera.this.mCurrentModule.onOrientationChanged(Camera.this.mOrientation, Camera.this.mOrientationCompensation);
                }
                Camera.this.mBaseFragmentDelegate.getAnimationComposite().disposeRotation(Camera.this.mOrientationCompensation);
            }
        }
    }

    private class WatchDogThread extends Thread {
        private static final String TAG = "WatchDogThread";
        private static final int TIMEOUT_INTERVAL = 5000;

        private WatchDogThread() {
        }

        /* synthetic */ WatchDogThread(Camera camera, AnonymousClass1 anonymousClass1) {
            this();
        }

        public void run() {
            setName("ANR-WatchDog");
            while (!isInterrupted()) {
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("watch dog run ");
                stringBuilder.append(Thread.currentThread().getId());
                Log.v(str, stringBuilder.toString());
                int access$000 = Camera.this.mTick;
                Camera.this.mHandler.post(Camera.this.tickerRunnable);
                try {
                    Thread.sleep(5000);
                    if (Camera.this.mTick == access$000) {
                        CameraSettings.setEdgeMode(Camera.this, false);
                        Camera.this.setBrightnessRampRate(-1);
                        Camera.this.setScreenEffect(false);
                        return;
                    }
                } catch (InterruptedException e) {
                    str = TAG;
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("watch dog InterruptedException ");
                    stringBuilder.append(Thread.currentThread().getId());
                    Log.e(str, stringBuilder.toString());
                    return;
                }
            }
        }
    }

    public void onCreate(Bundle bundle) {
        Log.d(TAG, "onCreate start");
        this.mApplication = (CameraAppImpl) getApplication();
        trackAppLunchTimeStart(this.mApplication.isApplicationFirstLaunched());
        this.mAppStartTime = System.currentTimeMillis();
        this.mCameraIntentManager = CameraIntentManager.getInstance(getIntent());
        this.mCameraIntentManager.setReferer(this);
        if (CompatibilityUtils.isInMultiWindowMode(this)) {
            super.onCreate(null);
            ToastUtils.showToast((Context) this, (int) R.string.multi_window_mode_not_supported);
            Log.d(TAG, "isInMultiWindowMode call finish");
            finish();
        } else if (!CameraIntentManager.ACTION_VOICE_CONTROL.equals(getIntent().getAction()) || this.mCameraIntentManager.checkCallerLegality()) {
            if (this.mCameraIntentManager.checkCallerLegality()) {
                CameraStatUtil.trackVoiceControl(getIntent());
            }
            super.onCreate(bundle);
            Completable.create(new CompletablePreFixCamera2Setup(null, null, null, getIntent(), startFromSecureKeyguard(), this.mCameraIntentManager.checkCallerLegality())).subscribeOn(GlobalConstant.sCameraSetupScheduler).subscribe();
            if (ProximitySensorLock.enabled() && isFromKeyguard()) {
                if (Util.isNonUIEnabled() && this.mCameraIntentManager.isFromVolumeKey().booleanValue()) {
                    if (Util.isNonUI()) {
                        CameraStatUtil.track(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_POCKET_MODE_ENTER, CameraStat.PARAM_COMMON_MODE, CameraStat.POCKET_MODE_NONUI_ENTER_VOLUME);
                        Log.d(TAG, "Finish from NonUI mode.");
                        finish();
                        return;
                    }
                } else if (ProximitySensorLock.supported()) {
                    this.mProximitySensorLock = new ProximitySensorLock(this);
                    this.mProximitySensorLock.startWatching();
                }
            }
            EffectController.releaseInstance();
            setContentView(R.layout.v9_main);
            getWindow().setBackgroundDrawable(null);
            this.mGLView = (V6CameraGLSurfaceView) findViewById(R.id.v6_gl_surface_view);
            this.mGLCoverView = (ImageView) findViewById(R.id.gl_root_cover);
            this.mDebugInfoView = (TextView) findViewById(R.id.camera_debug_content);
            this.mEdgeShutterView = (V9EdgeShutterView) findViewById(R.id.v9_edge_shutter_view);
            this.mCameraRootView = (CameraRootView) findViewById(R.id.camera_app_root);
            createCameraScreenNail(false, false);
            this.mCamera2OpenOnSubScribe = new Camera2OpenOnSubScribe(this);
            registerProtocol();
            if (!getKeyguardFlag()) {
                PermissionManager.requestCameraRuntimePermissions(this);
            }
            Util.updateCountryIso(this);
            this.mPowerManager = Stub.asInterface(ServiceManager.getService("power"));
            if (b.hw()) {
                try {
                    this.mDisplayFeatureManager = DisplayFeatureManager.getInstance();
                } catch (Throwable e) {
                    Log.w(TAG, "DisplayFeatureManager init failed", e);
                }
            }
            this.mSensorStateManager = new SensorStateManager(this, getMainLooper());
            this.mOrientationListener = new MyOrientationEventListener(this);
            setTranslucentNavigation(true);
            EffectChangedListenerController.setHoldKey(hashCode());
            showDebug();
            Log.d(TAG, "onCreate end");
        } else {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("An illegal caller:");
            stringBuilder.append(this.mCameraIntentManager.getCaller());
            stringBuilder.append(" use VOICE_CONTROL_INTENT!");
            Log.e(str, stringBuilder.toString());
            super.onCreate(null);
            finish();
        }
    }

    private void showCameraError(int i) {
        if (DataRepository.dataItemGlobal().isRetriedIfCameraError() || i == 236 || i == 237) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("");
            stringBuilder.append(i);
            CameraStatUtil.trackCameraError(stringBuilder.toString());
            Message obtain = Message.obtain();
            obtain.what = 10;
            obtain.arg1 = i;
            this.mHandler.sendMessage(obtain);
            return;
        }
        String str = TAG;
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append("Exception ");
        stringBuilder2.append(i);
        stringBuilder2.append(" occurs, retry to open camera...");
        Log.e(str, stringBuilder2.toString());
        DataRepository.dataItemGlobal().setRetriedIfCameraError(true);
        setupCamera(this.mStartControl);
    }

    public ImplFactory getImplFactory() {
        return this.mImplFactory;
    }

    public void registerProtocol() {
        ModeCoordinatorImpl.forceDestroy();
        ModeCoordinatorImpl.create(hashCode());
        EffectChangedListenerController.setHoldKey(hashCode());
        this.mImplFactory = new ImplFactory();
        int i = 1;
        this.mImplFactory.initBase(this, 171);
        DataItemGlobal dataItemGlobal = DataRepository.dataItemGlobal();
        getCameraIntentManager();
        DataItemGlobal dataItemGlobal2 = dataItemGlobal;
        dataItemGlobal2.parseIntent(getIntent(), Boolean.valueOf(this.mCameraIntentManager.checkCallerLegality()), startFromSecureKeyguard(), false, true);
        if (dataItemGlobal.isTimeOut()) {
            i = 2;
        }
        onModeSelected(StartControl.create(dataItemGlobal.getCurrentMode()).setResetType(i));
    }

    public void unRegisterProtocol() {
        if (this.mImplFactory != null) {
            this.mImplFactory.release();
        }
        if (this.mBaseFragmentDelegate != null) {
            this.mBaseFragmentDelegate.unRegisterProtocol();
            this.mBaseFragmentDelegate = null;
        }
        ModeCoordinatorImpl.destroyAll(hashCode());
    }

    @Deprecated
    public void setBlockingLifeCycles(List<String> list) {
    }

    public void onLifeStart(String str) {
        String str2 = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("onLifeStart ");
        stringBuilder.append(str);
        Log.d(str2, stringBuilder.toString());
    }

    public void onLifeAlive() {
        Log.d(TAG, String.format(Locale.ENGLISH, "onLifeAlive module 0x%x, need anim %d, need blur %b need reconfig %b reset type %d", new Object[]{Integer.valueOf(this.mStartControl.mTargetMode), Integer.valueOf(this.mStartControl.mViewConfigType), Boolean.valueOf(this.mStartControl.mNeedBlurAnimation), Boolean.valueOf(this.mStartControl.mNeedReConfigureCamera), Integer.valueOf(this.mStartControl.mResetType)}));
        setupCamera(this.mStartControl);
    }

    public void onLifeStop(String str) {
        String str2 = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("onLifeStop ");
        stringBuilder.append(str);
        Log.d(str2, stringBuilder.toString());
    }

    public void onLifeDestroy(String str) {
        String str2 = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("onLifeDestroy ");
        stringBuilder.append(str);
        Log.d(str2, stringBuilder.toString());
    }

    private boolean currentIsMainThread() {
        return Looper.getMainLooper() == Looper.myLooper();
    }

    private void setupCamera(StartControl startControl) {
        closeCameraSetup();
        Function functionCameraPrepare = new FunctionCameraPrepare(startControl.mTargetMode, startControl.mResetType, startControl.mNeedReConfigureData, (BaseModule) this.mCurrentModule);
        Function functionModuleSetup = new FunctionModuleSetup(startControl.mTargetMode);
        Function functionDataSetup = new FunctionDataSetup(startControl.mTargetMode);
        Function functionUISetup = new FunctionUISetup(startControl.mTargetMode, startControl.needNotifyUI());
        this.mCameraSetupDisposable = Single.just(NullHolder.ofNullable(this)).observeOn(GlobalConstant.sCameraSetupScheduler).map(functionCameraPrepare).zipWith(Single.create(this.mCamera2OpenOnSubScribe).subscribeOn(GlobalConstant.sCameraSetupScheduler).observeOn(GlobalConstant.sCameraSetupScheduler), this.mCameraOpenResult).map(functionModuleSetup).map(functionDataSetup).observeOn(functionUISetup.getWorkThread()).map(functionUISetup).subscribe(this.mCameraSetupConsumer);
    }

    public void resumeCurrentMode(int i) {
        closeCameraSetup();
        setSwitchingModule(true);
        Function functionCameraLegacySetup = new FunctionCameraLegacySetup(i);
        this.mCameraSetupDisposable = Single.just(NullHolder.ofNullable((BaseModule) this.mCurrentModule)).observeOn(GlobalConstant.sCameraSetupScheduler).map(functionCameraLegacySetup).zipWith(Single.create(this.mCamera2OpenOnSubScribe).observeOn(GlobalConstant.sCameraSetupScheduler), this.mCameraOpenResult).map(new FunctionResumeModule(i)).observeOn(AndroidSchedulers.mainThread()).subscribe(this.mCameraSetupConsumer);
    }

    protected void releaseCameraScreenNail() {
        super.releaseCameraScreenNail();
    }

    public boolean isVideoRecording() {
        return isCurrentModuleAlive() && this.mCurrentModule.isVideoRecording();
    }

    public boolean isPanoramaRecording() {
        return isCurrentModuleAlive() && this.mCurrentModule.isPanoramaDoing();
    }

    public boolean isSelectingCapturedVideo() {
        return isCurrentModuleAlive() && this.mCurrentModule.isSelectingCapturedResult();
    }

    private boolean shouldReleaseLater() {
        return isCurrentModuleAlive() && this.mCurrentModule.shouldReleaseLater();
    }

    public boolean isCurrentModuleAlive() {
        return this.mCurrentModule != null && this.mCurrentModule.isCreated();
    }

    private void setTranslucentNavigation(boolean z) {
        if (Util.checkDeviceHasNavigationBar(this)) {
            Window window = getWindow();
            window.getDecorView().setSystemUiVisibility(768);
            window.addFlags(Integer.MIN_VALUE);
        }
    }

    private boolean isFromKeyguard() {
        Intent intent = getIntent();
        boolean z = false;
        if (intent == null) {
            return false;
        }
        if (TextUtils.equals(intent.getAction(), "android.media.action.STILL_IMAGE_CAMERA") && getKeyguardFlag()) {
            z = true;
        }
        return z;
    }

    private void resumeCamera() {
        if (!isSwitchingModule()) {
            if (ModeCoordinatorImpl.isAlive(hashCode())) {
                DataItemGlobal dataItemGlobal = DataRepository.dataItemGlobal();
                int i = 1;
                if (this.mJumpedToGallery) {
                    this.mJumpedToGallery = false;
                } else {
                    int intentType = dataItemGlobal.getIntentType();
                    dataItemGlobal.parseIntent(getIntent(), Boolean.valueOf(this.mCameraIntentManager.checkCallerLegality()), startFromSecureKeyguard(), false, this.mDelayReleaseCamera ^ 1);
                    int intentType2 = dataItemGlobal.getIntentType();
                    if (intentType != 0) {
                        int i2 = (this.mCurrentModule == null || !this.mCurrentModule.isSelectingCapturedResult()) ? false : 1;
                        if (intentType != intentType2 || i2 == 0) {
                            if (i2 != 0) {
                                this.mBaseFragmentDelegate.delegateEvent(6);
                            }
                        } else if (this.mDelayReleaseCamera) {
                            this.mDelayReleaseCamera = false;
                            return;
                        } else {
                            resumeCurrentMode(dataItemGlobal.getCurrentMode());
                            return;
                        }
                    } else if (this.mDelayReleaseCamera) {
                        this.mDelayReleaseCamera = false;
                        return;
                    }
                    if (dataItemGlobal.isTimeOut()) {
                        i = 2;
                    }
                }
                onModeSelected(StartControl.create(dataItemGlobal.getCurrentMode()).setResetType(i));
            } else {
                unRegisterProtocol();
                registerProtocol();
            }
        }
    }

    protected void onNewIntent(Intent intent) {
        Log.d(TAG, "onNewIntent start");
        setIntent(intent);
        super.onNewIntent(intent);
        this.mCameraIntentManager.destroy();
        this.mCameraIntentManager = CameraIntentManager.getInstance(intent);
        this.mCameraIntentManager.setReferer(this);
        this.mJumpedToGallery = false;
        Log.d(TAG, "onNewIntent end");
    }

    public void onResume() {
        Log.d(TAG, "onResume start");
        if (getKeyguardFlag() && !PermissionManager.checkCameraLaunchPermissions()) {
            finish();
        }
        if (Util.sIsFullScreenNavBarHidden != Util.isFullScreenNavBarHidden(this)) {
            Util.initialize(this);
        }
        AutoLockManager.getInstance(this).onResume();
        if (this.mProximitySensorLock != null) {
            this.mProximitySensorLock.onResume();
        }
        getContentResolver().registerContentObserver(Util.SCREEN_SLIDE_STATUS_SETTING_URI, false, this.mScreenSlideStatusObserver);
        CameraStat.recordPageStart(this, "CameraActivity");
        Util.checkLockedOrientation(this);
        this.mActivityPaused = false;
        boolean z = true;
        switchEdgeFingerMode(true);
        this.mFirstOrientationArrived = false;
        this.mOrientationListener.enable();
        super.onResume();
        Storage.initStorage(this);
        if (Storage.isUseDocumentMode() && !FileCompat.hasStoragePermission(Storage.DIRECTORY)) {
            if (getKeyguardFlag()) {
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("documents permission not granted, getKeyguardFlag = ");
                stringBuilder.append(getKeyguardFlag());
                Log.w(str, stringBuilder.toString());
                PriorityStorageBroadcastReceiver.setPriorityStorage(false);
            } else {
                Log.w(TAG, "start request documents permission");
                FileCompat.getStorageAccessForLOLLIPOP(this, Storage.DIRECTORY);
                return;
            }
        }
        if (getScreenHint() != null) {
            getScreenHint().updateHint();
        }
        registerReceiver();
        registerSDReceiver();
        resumeCamera();
        this.mIsModeSwitched = false;
        ThermalDetector.getInstance().registerReceiver();
        if (!(this.mCameraIntentManager.isImageCaptureIntent() || this.mCameraIntentManager.isVideoCaptureIntent())) {
            z = false;
        }
        if (this.mImageSaver == null) {
            this.mImageSaver = new ImageSaver(this, this.mHandler, z);
        }
        this.mImageSaver.onHostResume(z);
        bindServices();
        Log.d(TAG, "onResume end");
    }

    protected void onRestart() {
        super.onRestart();
        trackAppLunchTimeStart(false);
        this.mAppStartTime = System.currentTimeMillis();
    }

    protected void onSaveInstanceState(Bundle bundle) {
        Log.d(TAG, "onSaveInstanceState");
    }

    public void resume() {
        if (!isVideoRecording()) {
            super.resume();
        }
    }

    public void pause() {
        if (!isVideoRecording()) {
            super.pause();
        }
    }

    public void onPause() {
        Log.d(TAG, "onPause start");
        this.mAppStartTime = 0;
        this.mActivityPaused = true;
        this.mPendingScreenSlideKeyCode = 0;
        getContentResolver().unregisterContentObserver(this.mScreenSlideStatusObserver);
        switchEdgeFingerMode(false);
        this.mOrientationListener.disable();
        AutoLockManager.getInstance(this).onPause();
        hideHibernationFragment();
        closeCameraSetup();
        setBrightnessRampRate(-1);
        setScreenEffect(false);
        setSwitchingModule(false);
        getWindow().clearFlags(128);
        if (this.mDidRegister) {
            unregisterReceiver(this.mReceiver);
            this.mDidRegister = false;
        }
        unregisterSDReceiver();
        super.onPause();
        if (getScreenHint() != null) {
            getScreenHint().cancelHint();
        }
        if (this.mCameraRootView != null) {
            this.mCameraRootView.enableTouchEvent();
        }
        if (this.mImageSaver != null) {
            this.mImageSaver.onHostPause();
        }
        CameraStat.recordPageEnd();
        this.mDelayReleaseCamera = false;
        if (isGotoGallery() || shouldReleaseLater()) {
            this.mDelayReleaseCamera = true;
        } else {
            releaseAll(false, true);
        }
        removeNewBie();
        ThermalDetector.getInstance().unregisterReceiver();
        Log.d(TAG, "onPause end");
    }

    public void onStop() {
        Log.d(TAG, "onStop start");
        super.onStop();
        if (this.mDelayReleaseCamera) {
            if (isGotoGallery() || isSelectingCapturedVideo()) {
                this.mDelayReleaseCamera = false;
                releaseAll(true, true);
            } else if (!isPostProcessing()) {
                this.mDelayReleaseCamera = false;
                this.mCurrentModule.onHostStopAndNotifyActionStop();
            }
        }
        unbindServices();
        boostParallelServiceAdj();
        FullScreenProtocol fullScreenProtocol = (FullScreenProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(196);
        if (fullScreenProtocol != null) {
            fullScreenProtocol.hideScreenLight();
        }
        Log.d(TAG, "onStop end");
    }

    /* JADX WARNING: Removed duplicated region for block: B:18:0x007a A:{ExcHandler: java.lang.ClassNotFoundException (r0_16 'e' java.lang.Throwable), Splitter: B:16:0x0035} */
    /* JADX WARNING: Removed duplicated region for block: B:18:0x007a A:{ExcHandler: java.lang.ClassNotFoundException (r0_16 'e' java.lang.Throwable), Splitter: B:16:0x0035} */
    /* JADX WARNING: Removed duplicated region for block: B:18:0x007a A:{ExcHandler: java.lang.ClassNotFoundException (r0_16 'e' java.lang.Throwable), Splitter: B:16:0x0035} */
    /* JADX WARNING: Missing block: B:18:0x007a, code:
            r0 = move-exception;
     */
    /* JADX WARNING: Missing block: B:19:0x007b, code:
            com.android.camera.log.Log.e(TAG, r0.getMessage(), r0);
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void boostParallelServiceAdj() {
        int i = (!CameraSettings.isCameraParallelProcessEnable() || this.mCurrentModule == null || !((BaseModule) this.mCurrentModule).isPortraitMode() || this.mCameraIntentManager.isImageCaptureIntent()) ? 0 : 1;
        if (i != 0) {
            LocalBinder localBinder = AlgoConnector.getInstance().getLocalBinder();
            if (!(localBinder == null || localBinder.isIdle())) {
                try {
                    Class.forName("miui.process.ProcessManager").getDeclaredMethod("adjBoost", new Class[]{String.class, Integer.TYPE, Long.TYPE, Integer.TYPE}).invoke(null, new Object[]{"com.android.camera", Integer.valueOf(0), Long.valueOf(60000), Integer.valueOf(UserHandle.myUserId())});
                } catch (Throwable e) {
                }
            }
        }
    }

    public void onDestroy() {
        Log.d(TAG, "onDestroy start");
        super.onDestroy();
        AutoLockManager.removeInstance(this);
        closeCameraSetup();
        unRegisterProtocol();
        if (this.mDelayReleaseCamera) {
            this.mDelayReleaseCamera = false;
            releaseAll(true, true);
        }
        ThermalDetector.getInstance().onDestroy();
        if (this.mImageSaver != null) {
            this.mImageSaver.onHostDestroy();
        }
        if (this.mSensorStateManager != null) {
            this.mSensorStateManager.onDestroy();
        }
        this.mPowerManager = null;
        this.mDisplayFeatureManager = null;
        V6GestureRecognizer.onDestroy(this);
        EffectChangedListenerController.removeEffectChangedListenerMap(hashCode());
        if (this.mDebugThread != null) {
            this.mDebugThread.setRunFlag(false);
        }
        if (this.mProximitySensorLock != null) {
            this.mProximitySensorLock.destroy();
        }
        if (this.mCameraIntentManager != null) {
            this.mCameraIntentManager.destroy();
            this.mCameraIntentManager = null;
        }
        if (getScreenHint() != null) {
            getScreenHint().dismissSystemChoiceDialog();
        }
        CameraIntentManager.removeAllInstance();
        Log.d(TAG, "onDestroy end");
    }

    private Module createNewModule(int i) {
        Module moduleByIndex = ModuleManager.getModuleByIndex(i);
        if (moduleByIndex != null) {
            moduleByIndex.setActivity(this);
            moduleByIndex.preTransferOrientation(this.mOrientation, this.mOrientationCompensation);
            return moduleByIndex;
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("invalid module index ");
        stringBuilder.append(i);
        throw new RuntimeException(stringBuilder.toString());
    }

    public void releaseAll(boolean z, final boolean z2) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("releaseAll: releaseDevice = ");
        stringBuilder.append(z2);
        stringBuilder.append(", isCurrentModuleAlive = ");
        stringBuilder.append(isCurrentModuleAlive());
        Log.d(str, stringBuilder.toString());
        this.mDelayReleaseCamera = false;
        if (this.mCurrentModule != null) {
            this.mCurrentModule.setDeparted();
        }
        GlobalConstant.sCameraSetupScheduler.scheduleDirect(new Runnable() {
            public void run() {
                if (Camera.this.isCurrentModuleAlive()) {
                    Module module = Camera.this.mCurrentModule;
                    DataRepository.getInstance().backUp().backupRunning(DataRepository.dataItemRunning(), DataRepository.dataItemGlobal().getDataBackUpKey(Camera.this.getCurrentModuleIndex()), DataRepository.dataItemGlobal().getCurrentCameraId(), false);
                    if (ModeCoordinatorImpl.isAlive(Camera.this.hashCode())) {
                        module.unRegisterProtocol();
                        module.unRegisterModulePersistProtocol();
                    }
                    module.onPause();
                    module.onStop();
                    module.onDestroy();
                }
                if (z2) {
                    boolean containsResumedCameraInStack = Camera.this.mApplication.containsResumedCameraInStack();
                    String access$400 = Camera.TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("start releaseCameraDevice: ");
                    stringBuilder.append(containsResumedCameraInStack ^ 1);
                    Log.d(access$400, stringBuilder.toString());
                    if (containsResumedCameraInStack) {
                        Log.d(Camera.TAG, "Camera2OpenManager release ignored.");
                    } else {
                        Camera2OpenManager.getInstance().release(false);
                    }
                }
                DataRepository.dataItemGlobal().resetTimeOut();
            }
        });
    }

    public void onBackPressed() {
        Log.d(TAG, "onBackPressed");
        if (!isCurrentModuleAlive() || !this.mCurrentModule.onBackPressed()) {
            super.onBackPressed();
        }
    }

    public boolean dispatchKeyEvent(KeyEvent keyEvent) {
        if (this.mProximitySensorLock == null || !this.mProximitySensorLock.intercept(keyEvent)) {
            return super.dispatchKeyEvent(keyEvent);
        }
        return true;
    }

    public boolean onKeyDown(int i, KeyEvent keyEvent) {
        if (this.mActivityPaused) {
            return super.onKeyDown(i, keyEvent);
        }
        if (keyEvent.getRepeatCount() == 0 && (i == 66 || i == 27 || i == 88 || i == 87 || i == 24 || i == 25)) {
            if (Util.isTimeout(keyEvent.getEventTime(), this.mLastKeyEventTime, 150)) {
                this.mLastIgnoreKey = -1;
            } else {
                this.mLastIgnoreKey = i;
                return true;
            }
        } else if (keyEvent.getRepeatCount() > 0 && i == this.mLastIgnoreKey) {
            this.mLastIgnoreKey = -1;
        }
        boolean z = false;
        if (i == Util.KEYCODE_SLIDE_ON) {
            this.mIsScreenSlideOff = false;
        } else if (i == Util.KEYCODE_SLIDE_OFF) {
            this.mIsScreenSlideOff = true;
        }
        if (isCurrentModuleAlive() && this.mCurrentModule.isFrameAvailable()) {
            if (this.mCurrentModule.onKeyDown(i, keyEvent) || super.onKeyDown(i, keyEvent)) {
                z = true;
            }
            return z;
        }
        switch (i) {
            case 24:
            case 25:
            case 27:
            case 66:
            case 80:
            case 87:
            case 88:
                return true;
            case Util.KEYCODE_SLIDE_ON /*700*/:
            case Util.KEYCODE_SLIDE_OFF /*701*/:
                return handleScreenSlideKeyEvent(i, keyEvent);
            default:
                return super.onKeyDown(i, keyEvent);
        }
    }

    public boolean onKeyUp(int i, KeyEvent keyEvent) {
        if (this.mActivityPaused) {
            return super.onKeyUp(i, keyEvent);
        }
        boolean z = true;
        if (i == this.mLastIgnoreKey) {
            this.mLastKeyEventTime = 0;
            this.mLastIgnoreKey = -1;
            return true;
        }
        this.mLastKeyEventTime = keyEvent.getEventTime();
        if (!isCurrentModuleAlive()) {
            return super.onKeyUp(i, keyEvent);
        }
        if (!(this.mCurrentModule.onKeyUp(i, keyEvent) || super.onKeyUp(i, keyEvent))) {
            z = false;
        }
        return z;
    }

    public void onWindowFocusChanged(boolean z) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("onWindowFocusChanged hasFocus->");
        stringBuilder.append(z);
        Log.d(str, stringBuilder.toString());
        this.mHasFocus = z;
        super.onWindowFocusChanged(z);
        if (this.mCurrentModule != null) {
            this.mCurrentModule.onWindowFocusChanged(z);
            if (this.mCameraBrightness != null) {
                this.mCameraBrightness.onWindowFocusChanged(z);
            }
            if (z) {
                Util.checkLockedOrientation(this);
                this.mCurrentModule.checkActivityOrientation();
                if (this.mSensorStateManager != null) {
                    this.mSensorStateManager.register();
                }
            } else if (this.mSensorStateManager != null) {
                this.mSensorStateManager.unregister(15);
            }
        }
    }

    public boolean dispatchTouchEvent(MotionEvent motionEvent) {
        boolean z = true;
        if (this.mActivityPaused) {
            return true;
        }
        if (this.mProximitySensorLock != null && this.mProximitySensorLock.active()) {
            return true;
        }
        if (this.mCurrentModule == null || this.mCurrentModule.isIgnoreTouchEvent()) {
            return super.dispatchTouchEvent(motionEvent);
        }
        if (!(super.dispatchTouchEvent(motionEvent) || V6GestureRecognizer.getInstance(this).onTouchEvent(motionEvent))) {
            z = false;
        }
        return z;
    }

    public boolean onEdgeTouchEvent(MotionEvent motionEvent) {
        if (b.gP()) {
            return V6GestureRecognizer.getInstance(this).onEdgeTouchEvent(motionEvent);
        }
        return true;
    }

    public void onUserInteraction() {
        super.onUserInteraction();
        Log.d(TAG, "onUserInteraction");
        AutoLockManager.getInstance(this).onUserInteraction();
        if (this.mCurrentModule != null) {
            this.mCurrentModule.onUserInteraction();
        }
    }

    public int getCurrentModuleIndex() {
        return isCurrentModuleAlive() ? this.mCurrentModule.getModuleIndex() : 160;
    }

    @MainThread
    public void onModeSelected(StartControl startControl) {
        int currentModuleIndex = getCurrentModuleIndex();
        this.mIsModeSwitched = this.mStartControl != null;
        this.mIsScreenSlideOff = Util.isScreenSlideOff(this);
        Log.d(TAG, String.format(Locale.ENGLISH, "onModeSelected from 0x%x to 0x%x, ScreenSlideOff = %b", new Object[]{Integer.valueOf(currentModuleIndex), Integer.valueOf(startControl.mTargetMode), Boolean.valueOf(this.mIsScreenSlideOff)}));
        if (!(currentModuleIndex == 160 || CameraStatUtil.modeIdToName(currentModuleIndex).equals(CameraStatUtil.modeIdToName(startControl.mTargetMode)))) {
            ScenarioTrackUtil.trackSwitchModeStart(currentModuleIndex, startControl.mTargetMode, CameraSettings.isFrontCamera());
        }
        closeCameraSetup();
        this.mStartControl = startControl;
        ModuleManager.setActiveModuleIndex(startControl.mTargetMode);
        if (startControl.mNeedReConfigureCamera) {
            if (this.mBaseFragmentDelegate != null) {
                this.mBaseFragmentDelegate.getAnimationComposite().setClickEnable(false);
            }
            setSwitchingModule(true);
            if (!isCurrentModuleAlive()) {
                startControl.mNeedBlurAnimation = false;
                getWindow().clearFlags(128);
            }
            V6GestureRecognizer.getInstance(this).setCurrentModule(null);
            BaseModule baseModule = (BaseModule) this.mCurrentModule;
            if (baseModule != null) {
                baseModule.setDeparted();
            }
            this.mCurrentModule = createNewModule(startControl.mTargetMode);
            if (this.mBaseFragmentDelegate == null) {
                this.mBaseFragmentDelegate = new BaseFragmentDelegate(this);
                this.mBaseFragmentDelegate.init(getSupportFragmentManager(), startControl.mTargetMode, this);
            } else {
                this.mCameraPendingSetupDisposable = this.mBaseFragmentDelegate.delegateMode(Completable.create(new CompletablePreFixCamera2Setup(baseModule, startControl, getCameraScreenNail(), null, startFromSecureKeyguard(), this.mCameraIntentManager.checkCallerLegality())).subscribeOn(GlobalConstant.sCameraSetupScheduler), startControl, this);
            }
            return;
        }
        this.mBaseFragmentDelegate.delegateMode(null, startControl, null);
    }

    private void onDisplayRotationChanged() {
        if (b.hn()) {
            FrontRotateNewbieDialogFragment frontRotateNewbieDialogFragment = (FrontRotateNewbieDialogFragment) getSupportFragmentManager().findFragmentByTag(FrontRotateNewbieDialogFragment.TAG);
            if (frontRotateNewbieDialogFragment != null) {
                frontRotateNewbieDialogFragment.animateOut(0);
            }
        }
    }

    public ImageSaver getImageSaver() {
        return this.mImageSaver;
    }

    public SensorStateManager getSensorStateManager() {
        return this.mSensorStateManager;
    }

    public boolean isStable() {
        return this.mSensorStateManager.isStable();
    }

    public int getCapturePosture() {
        return this.mSensorStateManager.getCapturePosture();
    }

    private void switchEdgeFingerMode(boolean z) {
        if (b.gP()) {
            CameraSettings.setEdgeMode(this, z);
            if (z) {
                this.mWatchDog = new WatchDogThread(this, null);
                this.mWatchDog.start();
            } else if (this.mWatchDog != null) {
                this.mWatchDog.interrupt();
                this.mWatchDog = null;
            }
        }
    }

    private void showDebug() {
        if (Util.isShowDebugInfo()) {
            if (this.mDebugInfoView != null) {
                this.mDebugInfoView.setVisibility(0);
            }
            this.mDebugThread = new LogThread();
            this.mDebugThread.start();
        }
        if (this.mDebugInfoView != null && Util.isShowPreviewDebugInfo()) {
            this.mDebugInfoView.setVisibility(0);
        }
    }

    public void onRequestPermissionsResult(int i, String[] strArr, int[] iArr) {
        if (i == PermissionManager.getCameraRuntimePermissionRequestCode()) {
            if (!PermissionManager.isCameraLaunchPermissionsResultReady(strArr, iArr)) {
                finish();
            }
            if (!isActivityPaused() && PermissionManager.isCameraLocationPermissionsResultReady(strArr, iArr)) {
                LocationManager.instance().recordLocation(CameraSettings.isRecordLocation());
            }
        }
    }

    public void changeRequestOrientation() {
        if (b.hn()) {
            if (CameraSettings.isFrontCamera()) {
                setRequestedOrientation(7);
            } else {
                setRequestedOrientation(1);
            }
        }
    }

    private boolean closeCameraSetup() {
        if (!(this.mCameraPendingSetupDisposable == null || this.mCameraPendingSetupDisposable.isDisposed())) {
            this.mCameraPendingSetupDisposable.dispose();
            this.mCameraPendingSetupDisposable = null;
        }
        if (this.mCameraSetupDisposable == null || this.mCameraSetupDisposable.isDisposed()) {
            return false;
        }
        this.mCameraSetupDisposable.dispose();
        this.mCameraSetupDisposable = null;
        return true;
    }

    public boolean showNewBie(int i) {
        switch (i) {
            case 1:
                PortraitNewbieDialogFragment portraitNewbieDialogFragment = new PortraitNewbieDialogFragment();
                portraitNewbieDialogFragment.setStyle(2, R.style.DialogFragmentFullScreen);
                getSupportFragmentManager().beginTransaction().add(portraitNewbieDialogFragment, PortraitNewbieDialogFragment.TAG).commitAllowingStateLoss();
                this.newbieDialogFragmentTag = PortraitNewbieDialogFragment.TAG;
                return true;
            case 2:
                FrontRotateNewbieDialogFragment frontRotateNewbieDialogFragment = new FrontRotateNewbieDialogFragment();
                frontRotateNewbieDialogFragment.setStyle(2, R.style.DialogFragmentFullScreen);
                getSupportFragmentManager().beginTransaction().add(frontRotateNewbieDialogFragment, FrontRotateNewbieDialogFragment.TAG).commitAllowingStateLoss();
                this.newbieDialogFragmentTag = FrontRotateNewbieDialogFragment.TAG;
                return true;
            case 3:
                this.mHandler.postDelayed(new Runnable() {
                    public void run() {
                        if (!Camera.this.isActivityPaused()) {
                            AiSceneNewbieDialogFragment aiSceneNewbieDialogFragment = new AiSceneNewbieDialogFragment();
                            aiSceneNewbieDialogFragment.setStyle(2, R.style.DialogFragmentFullScreen);
                            Camera.this.getSupportFragmentManager().beginTransaction().add(aiSceneNewbieDialogFragment, AiSceneNewbieDialogFragment.TAG).commitAllowingStateLoss();
                            Camera.this.newbieDialogFragmentTag = AiSceneNewbieDialogFragment.TAG;
                            DataRepository.dataItemGlobal().editor().putBoolean("pref_camera_first_ai_scene_use_hint_shown_key", false).apply();
                        }
                    }
                }, 500);
                return true;
            case 4:
                this.mHandler.postDelayed(new Runnable() {
                    public void run() {
                        if (!Camera.this.isActivityPaused()) {
                            UltraWideNewbieDialogFragment ultraWideNewbieDialogFragment = new UltraWideNewbieDialogFragment();
                            ultraWideNewbieDialogFragment.setStyle(2, R.style.DialogFragmentFullScreen);
                            Camera.this.getSupportFragmentManager().beginTransaction().add(ultraWideNewbieDialogFragment, UltraWideNewbieDialogFragment.TAG).commitAllowingStateLoss();
                            Camera.this.newbieDialogFragmentTag = UltraWideNewbieDialogFragment.TAG;
                            DataRepository.dataItemGlobal().editor().putBoolean("pref_camera_first_ultra_wide_use_hint_shown_key", false).apply();
                        }
                    }
                }, 500);
                return true;
            default:
                return false;
        }
    }

    public boolean isNewBieAlive(int i) {
        String str;
        switch (i) {
            case 1:
                str = PortraitNewbieDialogFragment.TAG;
                break;
            case 2:
                str = FrontRotateNewbieDialogFragment.TAG;
                break;
            case 3:
                str = AiSceneNewbieDialogFragment.TAG;
                break;
            case 4:
                str = UltraWideNewbieDialogFragment.TAG;
                break;
            default:
                str = null;
                break;
        }
        boolean z = false;
        if (str == null) {
            return false;
        }
        if (getSupportFragmentManager().findFragmentByTag(str) != null) {
            z = true;
        }
        return z;
    }

    public void removeNewBie() {
        FragmentTransaction beginTransaction = getSupportFragmentManager().beginTransaction();
        if (this.newbieDialogFragmentTag != null) {
            Fragment findFragmentByTag = getSupportFragmentManager().findFragmentByTag(this.newbieDialogFragmentTag);
            if (findFragmentByTag != null) {
                beginTransaction.remove(findFragmentByTag);
            }
        }
        beginTransaction.commitAllowingStateLoss();
    }

    public synchronized void updateSurfaceState(int i) {
        super.updateSurfaceState(i);
        if (i == 4) {
            this.mCamera2OpenOnSubScribe.onGlSurfaceCreated();
        }
    }

    public void notifyOnFirstFrameArrived(int i) {
        if (this.mCurrentModule != null && !this.mCurrentModule.isDeparted() && !isSwitchingModule()) {
            getCameraScreenNail().clearAnimation();
            this.mBaseFragmentDelegate.getAnimationComposite().notifyAfterFirstFrameArrived(i);
            this.mCurrentModule.enableCameraControls(true);
            this.mCurrentModule.setFrameAvailable(true);
            if ((getCurrentModuleIndex() == 165 || getCurrentModuleIndex() == 163) && b.hn() && CameraSettings.isFrontCamera() && this.mDisplayRotation == 0 && DataRepository.dataItemGlobal().getBoolean("pref_front_camera_first_use_hint_shown_key", true)) {
                DataRepository.dataItemGlobal().editor().putBoolean("pref_front_camera_first_use_hint_shown_key", false).apply();
                showNewBie(2);
            }
        }
    }

    private void bindServices() {
        try {
            Intent intent = new Intent(Util.ACTION_BIND_GALLERY_SERVICE);
            intent.setPackage(Util.REVIEW_ACTIVITY_PACKAGE);
            bindService(intent, this.mServiceConnection, 5);
            this.mIsGalleryServiceBound = true;
        } catch (Throwable e) {
            Log.w(TAG, "bindServices error.", e);
        }
    }

    private void unbindServices() {
        if (this.mIsGalleryServiceBound) {
            unbindService(this.mServiceConnection);
            this.mIsGalleryServiceBound = false;
        }
    }

    private void showFirstUseHintIfNeeded() {
        if (DataRepository.dataItemGlobal().getBoolean(CameraSettings.KEY_CAMERA_FIRST_USE_HINT_SHOWN, true)) {
            if (this.mCameraRootView != null) {
                this.mCameraRootView.disableTouchEvent();
            }
            this.mHandler.postDelayed(new Runnable() {
                public void run() {
                    if (!Camera.this.isActivityPaused()) {
                        Camera.this.getScreenHint().showFirstUseHint();
                        if (Camera.this.mCameraRootView != null) {
                            Camera.this.mCameraRootView.enableTouchEvent();
                        }
                    }
                }
            }, 1000);
        }
    }

    private void setBrightnessRampRate(int i) {
        CompatibilityUtils.setBrightnessRampRate(this.mPowerManager, i);
    }

    private void setScreenEffect(boolean z) {
        if (this.mDisplayFeatureManager != null) {
            this.mDisplayFeatureManager.setScreenEffect(14, z);
        }
    }

    public void setWindowBrightness(int i) {
        setBrightnessRampRate(0);
        setScreenEffect(true);
        LayoutParams attributes = getWindow().getAttributes();
        attributes.screenBrightness = ((float) i) / 255.0f;
        getWindow().setAttributes(attributes);
    }

    public void restoreWindowBrightness() {
        float f;
        LayoutParams attributes;
        if (this.mCameraBrightness != null) {
            int currentBrightness = this.mCameraBrightness.getCurrentBrightness();
            if (currentBrightness > 0) {
                f = ((float) currentBrightness) / 255.0f;
                attributes = getWindow().getAttributes();
                attributes.screenBrightness = f;
                getWindow().setAttributes(attributes);
                setBrightnessRampRate(-1);
                setScreenEffect(false);
            }
        }
        f = -1.0f;
        attributes = getWindow().getAttributes();
        attributes.screenBrightness = f;
        getWindow().setAttributes(attributes);
        setBrightnessRampRate(-1);
        setScreenEffect(false);
    }

    public int getCurrentBrightness() {
        return this.mCameraBrightness.getCurrentBrightness();
    }

    private final void registerReceiver() {
        IntentFilter intentFilter = new IntentFilter();
        intentFilter.addAction(CameraIntentManager.ACTION_VOICE_CONTROL);
        registerReceiver(this.mReceiver, intentFilter);
        this.mDidRegister = true;
    }

    private void registerSDReceiver() {
        IntentFilter intentFilter = new IntentFilter();
        intentFilter.addAction("android.intent.action.MEDIA_EJECT");
        intentFilter.addAction("android.intent.action.MEDIA_MOUNTED");
        intentFilter.addAction("android.intent.action.MEDIA_UNMOUNTED");
        intentFilter.addAction("android.intent.action.MEDIA_SCANNER_STARTED");
        intentFilter.addAction("android.intent.action.MEDIA_SCANNER_FINISHED");
        intentFilter.addDataScheme("file");
        registerReceiver(this.mSDReceiver, intentFilter);
    }

    private void unregisterSDReceiver() {
        try {
            unregisterReceiver(this.mSDReceiver);
        } catch (Exception e) {
            Log.e(TAG, e.getMessage());
        }
    }

    public void onHibernate() {
        Log.d(TAG, "onHibernate");
        if (isDestroyed()) {
            AutoLockManager.getInstance(this).removeMessage();
            return;
        }
        if (isCurrentModuleAlive()) {
            this.mCurrentModule.setDeparted();
            this.mCurrentModule.closeCamera();
        }
        showHibernationFragment();
        getCameraScreenNail().requestHibernate();
        Camera2OpenManager.getInstance().release(true);
    }

    public void onAwaken() {
        Log.d(TAG, "onAwaken");
        getCameraScreenNail().requestAwaken();
        onModeSelected(this.mStartControl);
    }

    private void showHibernationFragment() {
        HibernationFragment hibernationFragment = new HibernationFragment();
        hibernationFragment.setStyle(2, R.style.DialogFragmentFullScreen);
        getSupportFragmentManager().beginTransaction().add(hibernationFragment, HibernationFragment.TAG).commitAllowingStateLoss();
    }

    private void hideHibernationFragment() {
        Fragment findFragmentByTag = getSupportFragmentManager().findFragmentByTag(HibernationFragment.TAG);
        if (findFragmentByTag != null && (findFragmentByTag instanceof DialogFragment)) {
            ((DialogFragment) findFragmentByTag).dismissAllowingStateLoss();
        }
    }

    public void showLensDirtyDetectedHint() {
        if (DataRepository.dataItemFeature().fG()) {
            this.mHandler.post(new Runnable() {
                public void run() {
                    FragmentTopConfig fragmentTopConfig = (FragmentTopConfig) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
                    if (fragmentTopConfig != null) {
                        int i;
                        int i2 = 1;
                        if (DataRepository.dataItemGlobal().getCurrentCameraId() != 1) {
                            i2 = 0;
                        }
                        if (i2 != 0) {
                            i = R.string.lens_dirty_detected_title_front;
                        } else {
                            i = R.string.lens_dirty_detected_title_back;
                        }
                        fragmentTopConfig.alertAiDetectTipHint(0, i, 8000);
                    }
                }
            });
        } else if (getSupportFragmentManager().findFragmentByTag(LensDirtyDetectDialogFragment.TAG) == null) {
            LensDirtyDetectDialogFragment lensDirtyDetectDialogFragment = new LensDirtyDetectDialogFragment();
            lensDirtyDetectDialogFragment.setStyle(2, R.style.LensDirtyDetectDialogFragment);
            getSupportFragmentManager().beginTransaction().add(lensDirtyDetectDialogFragment, LensDirtyDetectDialogFragment.TAG).commitAllowingStateLoss();
        }
    }

    public void hideLensDirtyDetectedHint() {
        if (!DataRepository.dataItemFeature().fG()) {
            Fragment findFragmentByTag = getSupportFragmentManager().findFragmentByTag(LensDirtyDetectDialogFragment.TAG);
            if (findFragmentByTag != null && (findFragmentByTag instanceof DialogFragment)) {
                ((DialogFragment) findFragmentByTag).dismissAllowingStateLoss();
            }
        }
    }

    public boolean handleScreenSlideKeyEvent(int i, KeyEvent keyEvent) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("handleScreenSlideKeyEvent ");
        stringBuilder.append(i);
        Log.d(str, stringBuilder.toString());
        if (i == Util.KEYCODE_SLIDE_OFF && getCameraIntentManager().isFromScreenSlide().booleanValue() && !isModeSwitched()) {
            finish();
            overridePendingTransition(R.anim.anim_screen_slide_fade_in, R.anim.anim_screen_slide_fade_out);
            return true;
        }
        DataItemGlobal dataItemGlobal = DataRepository.dataItemGlobal();
        int currentCameraId = dataItemGlobal.getCurrentCameraId();
        boolean z = false;
        int i2 = i == Util.KEYCODE_SLIDE_ON ? 1 : 0;
        int currentMode = dataItemGlobal.getCurrentMode();
        if ((currentMode == 171 && !b.he()) || currentMode == 166 || currentMode == 167 || currentMode == 173) {
            currentMode = 163;
        } else if (currentMode == 168 || currentMode == 169 || currentMode == 170 || currentMode == 172) {
            currentMode = 162;
        } else if (currentMode == 162 && i2 == 0 && DataRepository.getInstance().backUp().isLastVideoFastMotion()) {
            currentMode = 169;
        }
        if (currentCameraId != i2) {
            TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
            ActionProcessing actionProcessing = (ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162);
            if (topAlert != null) {
                topAlert.removeExtraMenu(4);
            }
            if (actionProcessing != null) {
                actionProcessing.hideExtra();
            }
            dataItemGlobal.setCurrentMode(currentMode);
            dataItemGlobal.setCameraId(i2);
            boolean z2 = currentCameraId == 1;
            if (i2 == 1) {
                z = true;
            }
            ScenarioTrackUtil.trackSwitchCameraStart(z2, z, dataItemGlobal.getCurrentMode());
            onModeSelected(StartControl.create(currentMode).setFromScreenSlide(true).setNeedBlurAnimation(true).setViewConfigType(2));
        } else if (i == Util.KEYCODE_SLIDE_ON && isCurrentModuleAlive()) {
            ((BaseModule) this.mCurrentModule).updateScreenSlide(true);
        }
        return true;
    }

    public boolean isModeSwitched() {
        return this.mIsModeSwitched;
    }

    public boolean isScreenSlideOff() {
        return this.mIsScreenSlideOff;
    }

    protected void onActivityResult(int i, int i2, Intent intent) {
        super.onActivityResult(i, i2, intent);
        if (FileCompat.handleActivityResult(this, i, i2, intent)) {
            DocumentFile fromTreeUri = DocumentFile.fromTreeUri(this, intent.getData());
            if (fromTreeUri.findFile("Camera") == null) {
                fromTreeUri.createDirectory("Camera");
                return;
            }
            return;
        }
        Log.w(TAG, "onActivityResult documents permission not granted");
        PriorityStorageBroadcastReceiver.setPriorityStorage(false);
    }
}
