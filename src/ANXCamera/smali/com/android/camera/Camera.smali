.class public Lcom/android/camera/Camera;
.super Lcom/android/camera/ActivityBase;
.source "Camera.java"

# interfaces
.implements Landroid/support/v4/app/ActivityCompat$OnRequestPermissionsResultCallback;
.implements Lcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;
.implements Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/Camera$LogThread;,
        Lcom/android/camera/Camera$WatchDogThread;,
        Lcom/android/camera/Camera$MyOrientationEventListener;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

.field private mCamera2OpenOnSubScribe:Lcom/android/camera/module/loader/camera2/Camera2OpenOnSubScribe;

.field private mCameraOpenResult:Lio/reactivex/functions/BiFunction;

.field private mCameraPendingSetupDisposable:Lio/reactivex/disposables/Disposable;

.field private mCameraSetupConsumer:Lio/reactivex/functions/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Consumer<",
            "Lcom/android/camera/module/loader/NullHolder<",
            "Lcom/android/camera/module/BaseModule;",
            ">;>;"
        }
    .end annotation
.end field

.field private mCameraSetupDisposable:Lio/reactivex/disposables/Disposable;

.field private mDebugThread:Lcom/android/camera/Camera$LogThread;

.field private mDidRegister:Z

.field private mDisplayFeatureManager:Lmiui/hardware/display/DisplayFeatureManager;

.field private mFirstOrientationArrived:Z

.field private mHasFocus:Z

.field private mImageSaver:Lcom/android/camera/storage/ImageSaver;

.field private mImplFactory:Lcom/android/camera/module/impl/ImplFactory;

.field private mIsGalleryServiceBound:Z

.field private mIsModeSwitched:Z

.field private mIsScreenSlideOff:Z

.field private mLastIgnoreKey:I

.field private mLastKeyEventTime:J

.field private mOrientationListener:Lcom/android/camera/Camera$MyOrientationEventListener;

.field private mPendingScreenSlideKeyCode:I

.field private mPowerManager:Landroid/os/IPowerManager;

.field private mProximitySensorLock:Lcom/android/camera/ProximitySensorLock;

.field private final mReceiver:Landroid/content/BroadcastReceiver;

.field private mSDReceiver:Landroid/content/BroadcastReceiver;

.field private mScreenSlideStatusObserver:Landroid/database/ContentObserver;

.field private mSensorStateManager:Lcom/android/camera/SensorStateManager;

.field private mServiceConnection:Landroid/content/ServiceConnection;

.field private mStartControl:Lcom/android/camera/module/loader/StartControl;

.field private volatile mTick:I

.field private mWatchDog:Ljava/lang/Thread;

.field private newbieDialogFragmentTag:Ljava/lang/String;

.field private final tickerRunnable:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 116
    const-class v0, Lcom/android/camera/Camera;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 112
    invoke-direct {p0}, Lcom/android/camera/ActivityBase;-><init>()V

    .line 120
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/android/camera/Camera;->mLastKeyEventTime:J

    .line 121
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera/Camera;->mLastIgnoreKey:I

    .line 137
    new-instance v0, Lcom/android/camera/Camera$1;

    invoke-direct {v0, p0}, Lcom/android/camera/Camera$1;-><init>(Lcom/android/camera/Camera;)V

    iput-object v0, p0, Lcom/android/camera/Camera;->tickerRunnable:Ljava/lang/Runnable;

    .line 154
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/Camera;->newbieDialogFragmentTag:Ljava/lang/String;

    .line 157
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/Camera;->mIsGalleryServiceBound:Z

    .line 162
    new-instance v0, Lcom/android/camera/Camera$2;

    invoke-direct {v0, p0}, Lcom/android/camera/Camera$2;-><init>(Lcom/android/camera/Camera;)V

    iput-object v0, p0, Lcom/android/camera/Camera;->mCameraSetupConsumer:Lio/reactivex/functions/Consumer;

    .line 183
    new-instance v0, Lcom/android/camera/Camera$3;

    invoke-direct {v0, p0}, Lcom/android/camera/Camera$3;-><init>(Lcom/android/camera/Camera;)V

    iput-object v0, p0, Lcom/android/camera/Camera;->mCameraOpenResult:Lio/reactivex/functions/BiFunction;

    .line 207
    new-instance v0, Lcom/android/camera/Camera$4;

    iget-object v1, p0, Lcom/android/camera/Camera;->mHandler:Landroid/os/Handler;

    invoke-direct {v0, p0, v1}, Lcom/android/camera/Camera$4;-><init>(Lcom/android/camera/Camera;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/android/camera/Camera;->mScreenSlideStatusObserver:Landroid/database/ContentObserver;

    .line 1509
    new-instance v0, Lcom/android/camera/Camera$8;

    invoke-direct {v0, p0}, Lcom/android/camera/Camera$8;-><init>(Lcom/android/camera/Camera;)V

    iput-object v0, p0, Lcom/android/camera/Camera;->mServiceConnection:Landroid/content/ServiceConnection;

    .line 1598
    new-instance v0, Lcom/android/camera/Camera$10;

    invoke-direct {v0, p0}, Lcom/android/camera/Camera$10;-><init>(Lcom/android/camera/Camera;)V

    iput-object v0, p0, Lcom/android/camera/Camera;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 1616
    new-instance v0, Lcom/android/camera/Camera$11;

    invoke-direct {v0, p0}, Lcom/android/camera/Camera$11;-><init>(Lcom/android/camera/Camera;)V

    iput-object v0, p0, Lcom/android/camera/Camera;->mSDReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/Camera;)I
    .locals 0

    .line 112
    iget p0, p0, Lcom/android/camera/Camera;->mTick:I

    return p0
.end method

.method static synthetic access$002(Lcom/android/camera/Camera;I)I
    .locals 0

    .line 112
    iput p1, p0, Lcom/android/camera/Camera;->mTick:I

    return p1
.end method

.method static synthetic access$100(Lcom/android/camera/Camera;I)V
    .locals 0

    .line 112
    invoke-direct {p0, p1}, Lcom/android/camera/Camera;->showCameraError(I)V

    return-void
.end method

.method static synthetic access$1000(Lcom/android/camera/Camera;)Ljava/lang/Runnable;
    .locals 0

    .line 112
    iget-object p0, p0, Lcom/android/camera/Camera;->tickerRunnable:Ljava/lang/Runnable;

    return-object p0
.end method

.method static synthetic access$1100(Lcom/android/camera/Camera;I)V
    .locals 0

    .line 112
    invoke-direct {p0, p1}, Lcom/android/camera/Camera;->setBrightnessRampRate(I)V

    return-void
.end method

.method static synthetic access$1200(Lcom/android/camera/Camera;Z)V
    .locals 0

    .line 112
    invoke-direct {p0, p1}, Lcom/android/camera/Camera;->setScreenEffect(Z)V

    return-void
.end method

.method static synthetic access$1302(Lcom/android/camera/Camera;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 112
    iput-object p1, p0, Lcom/android/camera/Camera;->newbieDialogFragmentTag:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$202(Lcom/android/camera/Camera;Lio/reactivex/disposables/Disposable;)Lio/reactivex/disposables/Disposable;
    .locals 0

    .line 112
    iput-object p1, p0, Lcom/android/camera/Camera;->mCameraSetupDisposable:Lio/reactivex/disposables/Disposable;

    return-object p1
.end method

.method static synthetic access$300(Lcom/android/camera/Camera;)V
    .locals 0

    .line 112
    invoke-direct {p0}, Lcom/android/camera/Camera;->showFirstUseHintIfNeeded()V

    return-void
.end method

.method static synthetic access$400()Ljava/lang/String;
    .locals 1

    .line 112
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$500(Lcom/android/camera/Camera;)Z
    .locals 0

    .line 112
    iget-boolean p0, p0, Lcom/android/camera/Camera;->mHasFocus:Z

    return p0
.end method

.method static synthetic access$600(Lcom/android/camera/Camera;)Z
    .locals 0

    .line 112
    iget-boolean p0, p0, Lcom/android/camera/Camera;->mFirstOrientationArrived:Z

    return p0
.end method

.method static synthetic access$602(Lcom/android/camera/Camera;Z)Z
    .locals 0

    .line 112
    iput-boolean p1, p0, Lcom/android/camera/Camera;->mFirstOrientationArrived:Z

    return p1
.end method

.method static synthetic access$700(Lcom/android/camera/Camera;)V
    .locals 0

    .line 112
    invoke-direct {p0}, Lcom/android/camera/Camera;->onDisplayRotationChanged()V

    return-void
.end method

.method static synthetic access$800(Lcom/android/camera/Camera;)Lcom/android/camera/fragment/BaseFragmentDelegate;
    .locals 0

    .line 112
    iget-object p0, p0, Lcom/android/camera/Camera;->mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

    return-object p0
.end method

.method private bindServices()V
    .locals 3

    .line 1521
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.miui.gallery.action.BIND_SERVICE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1522
    const-string v1, "com.miui.gallery"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 1523
    iget-object v1, p0, Lcom/android/camera/Camera;->mServiceConnection:Landroid/content/ServiceConnection;

    const/4 v2, 0x5

    invoke-virtual {p0, v0, v1, v2}, Lcom/android/camera/Camera;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    .line 1524
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/Camera;->mIsGalleryServiceBound:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1527
    goto :goto_0

    .line 1525
    :catch_0
    move-exception v0

    .line 1526
    sget-object v1, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v2, "bindServices error."

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1528
    :goto_0
    return-void
.end method

.method private boostParallelServiceAdj()V
    .locals 9

    .line 800
    invoke-static {}, Lcom/android/camera/CameraSettings;->isCameraParallelProcessEnable()Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    check-cast v0, Lcom/android/camera/module/BaseModule;

    .line 801
    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->isPortraitMode()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    .line 802
    invoke-virtual {v0}, Lcom/android/camera/CameraIntentManager;->isImageCaptureIntent()Z

    move-result v0

    if-nez v0, :cond_0

    .line 803
    move v0, v1

    goto :goto_0

    .line 802
    :cond_0
    nop

    .line 803
    move v0, v2

    :goto_0
    if-nez v0, :cond_1

    .line 804
    return-void

    .line 807
    :cond_1
    invoke-static {}, Lcom/android/camera/parallel/AlgoConnector;->getInstance()Lcom/android/camera/parallel/AlgoConnector;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/parallel/AlgoConnector;->getLocalBinder()Lcom/android/camera/LocalParallelService$LocalBinder;

    move-result-object v0

    .line 808
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lcom/android/camera/LocalParallelService$LocalBinder;->isIdle()Z

    move-result v0

    if-nez v0, :cond_2

    .line 810
    :try_start_0
    const-string v0, "miui.process.ProcessManager"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 811
    const-string v3, "adjBoost"

    const/4 v4, 0x4

    new-array v5, v4, [Ljava/lang/Class;

    const-class v6, Ljava/lang/String;

    aput-object v6, v5, v2

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v5, v1

    sget-object v6, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    const/4 v7, 0x2

    aput-object v6, v5, v7

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v8, 0x3

    aput-object v6, v5, v8

    invoke-virtual {v0, v3, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 813
    const/4 v3, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    const-string v5, "com.android.camera"

    aput-object v5, v4, v2

    .line 814
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v4, v1

    const-wide/32 v1, 0xea60

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    aput-object v1, v4, v7

    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v4, v8

    .line 813
    invoke-virtual {v0, v3, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    .line 818
    goto :goto_1

    .line 815
    :catch_0
    move-exception v0

    .line 817
    sget-object v1, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/ReflectiveOperationException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 820
    :cond_2
    :goto_1
    return-void
.end method

.method private closeCameraSetup()Z
    .locals 2

    .line 1353
    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraPendingSetupDisposable:Lio/reactivex/disposables/Disposable;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraPendingSetupDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1354
    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraPendingSetupDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 1355
    iput-object v1, p0, Lcom/android/camera/Camera;->mCameraPendingSetupDisposable:Lio/reactivex/disposables/Disposable;

    .line 1358
    :cond_0
    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraSetupDisposable:Lio/reactivex/disposables/Disposable;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraSetupDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1359
    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraSetupDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 1360
    iput-object v1, p0, Lcom/android/camera/Camera;->mCameraSetupDisposable:Lio/reactivex/disposables/Disposable;

    .line 1361
    const/4 v0, 0x1

    return v0

    .line 1363
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method private createNewModule(I)Lcom/android/camera/module/Module;
    .locals 3

    .line 875
    invoke-static {p1}, Lcom/android/camera/module/ModuleManager;->getModuleByIndex(I)Lcom/android/camera/module/Module;

    move-result-object v0

    .line 876
    if-eqz v0, :cond_0

    .line 879
    invoke-interface {v0, p0}, Lcom/android/camera/module/Module;->setActivity(Lcom/android/camera/Camera;)V

    .line 880
    iget p1, p0, Lcom/android/camera/Camera;->mOrientation:I

    iget v1, p0, Lcom/android/camera/Camera;->mOrientationCompensation:I

    invoke-interface {v0, p1, v1}, Lcom/android/camera/module/Module;->preTransferOrientation(II)V

    .line 881
    return-object v0

    .line 877
    :cond_0
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "invalid module index "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private currentIsMainThread()Z
    .locals 2

    .line 419
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private hideHibernationFragment()V
    .locals 2

    .line 1676
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    const-string v1, "Hibernation"

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    .line 1677
    if-eqz v0, :cond_0

    instance-of v1, v0, Landroid/support/v4/app/DialogFragment;

    if-eqz v1, :cond_0

    .line 1678
    check-cast v0, Landroid/support/v4/app/DialogFragment;

    invoke-virtual {v0}, Landroid/support/v4/app/DialogFragment;->dismissAllowingStateLoss()V

    .line 1680
    :cond_0
    return-void
.end method

.method private isFromKeyguard()Z
    .locals 3

    .line 559
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 560
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 561
    return v1

    .line 563
    :cond_0
    invoke-virtual {v0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 564
    const-string v2, "android.media.action.STILL_IMAGE_CAMERA"

    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getKeyguardFlag()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v1, 0x1

    nop

    :cond_1
    return v1
.end method

.method private onDisplayRotationChanged()V
    .locals 2

    .line 1217
    invoke-static {}, Lcom/mi/config/b;->hn()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1218
    return-void

    .line 1220
    :cond_0
    nop

    .line 1221
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    const-string v1, "RotateHint"

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/android/camera/fragment/dialog/FrontRotateNewbieDialogFragment;

    .line 1222
    if-eqz v0, :cond_1

    .line 1223
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/dialog/FrontRotateNewbieDialogFragment;->animateOut(I)V

    .line 1225
    :cond_1
    return-void
.end method

.method private final registerReceiver()V
    .locals 2

    .line 1609
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 1610
    const-string v1, "android.media.action.VOICE_COMMAND"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1612
    iget-object v1, p0, Lcom/android/camera/Camera;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1, v0}, Lcom/android/camera/Camera;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 1613
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/Camera;->mDidRegister:Z

    .line 1614
    return-void
.end method

.method private registerSDReceiver()V
    .locals 2

    .line 1626
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 1627
    const-string v1, "android.intent.action.MEDIA_EJECT"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1628
    const-string v1, "android.intent.action.MEDIA_MOUNTED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1629
    const-string v1, "android.intent.action.MEDIA_UNMOUNTED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1630
    const-string v1, "android.intent.action.MEDIA_SCANNER_STARTED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1631
    const-string v1, "android.intent.action.MEDIA_SCANNER_FINISHED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1632
    const-string v1, "file"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addDataScheme(Ljava/lang/String;)V

    .line 1633
    iget-object v1, p0, Lcom/android/camera/Camera;->mSDReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1, v0}, Lcom/android/camera/Camera;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 1634
    return-void
.end method

.method private resumeCamera()V
    .locals 10

    .line 568
    invoke-virtual {p0}, Lcom/android/camera/Camera;->isSwitchingModule()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 569
    return-void

    .line 571
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    invoke-static {v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->isAlive(I)Z

    move-result v0

    if-nez v0, :cond_1

    .line 572
    invoke-virtual {p0}, Lcom/android/camera/Camera;->unRegisterProtocol()V

    .line 573
    invoke-virtual {p0}, Lcom/android/camera/Camera;->registerProtocol()V

    goto/16 :goto_3

    .line 575
    :cond_1
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    .line 576
    nop

    .line 577
    iget-boolean v1, p0, Lcom/android/camera/Camera;->mJumpedToGallery:Z

    const/4 v7, 0x1

    const/4 v8, 0x0

    if-eqz v1, :cond_2

    .line 578
    iput-boolean v8, p0, Lcom/android/camera/Camera;->mJumpedToGallery:Z

    goto :goto_2

    .line 580
    :cond_2
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getIntentType()I

    move-result v9

    .line 581
    iget-object v1, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    invoke-virtual {v1}, Lcom/android/camera/CameraIntentManager;->checkCallerLegality()Z

    move-result v1

    .line 582
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {p0}, Lcom/android/camera/Camera;->startFromSecureKeyguard()Z

    move-result v4

    const/4 v5, 0x0

    iget-boolean v1, p0, Lcom/android/camera/Camera;->mDelayReleaseCamera:Z

    xor-int/lit8 v6, v1, 0x1

    move-object v1, v0

    invoke-virtual/range {v1 .. v6}, Lcom/android/camera/data/data/global/DataItemGlobal;->parseIntent(Landroid/content/Intent;Ljava/lang/Boolean;ZZZ)Landroid/support/v4/util/Pair;

    .line 583
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getIntentType()I

    move-result v1

    .line 584
    if-eqz v9, :cond_7

    .line 585
    iget-object v2, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v2}, Lcom/android/camera/module/Module;->isSelectingCapturedResult()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 586
    move v2, v7

    goto :goto_0

    .line 585
    :cond_3
    nop

    .line 586
    move v2, v8

    :goto_0
    if-ne v9, v1, :cond_5

    if-eqz v2, :cond_5

    .line 587
    iget-boolean v1, p0, Lcom/android/camera/Camera;->mDelayReleaseCamera:Z

    if-eqz v1, :cond_4

    .line 588
    iput-boolean v8, p0, Lcom/android/camera/Camera;->mDelayReleaseCamera:Z

    .line 589
    return-void

    .line 591
    :cond_4
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/camera/Camera;->resumeCurrentMode(I)V

    .line 592
    return-void

    .line 595
    :cond_5
    if-eqz v2, :cond_6

    .line 596
    iget-object v1, p0, Lcom/android/camera/Camera;->mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

    const/4 v2, 0x6

    invoke-virtual {v1, v2}, Lcom/android/camera/fragment/BaseFragmentDelegate;->delegateEvent(I)V

    .line 599
    :cond_6
    goto :goto_1

    .line 601
    :cond_7
    iget-boolean v1, p0, Lcom/android/camera/Camera;->mDelayReleaseCamera:Z

    if-eqz v1, :cond_8

    .line 602
    iput-boolean v8, p0, Lcom/android/camera/Camera;->mDelayReleaseCamera:Z

    .line 603
    return-void

    .line 607
    :cond_8
    :goto_1
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->isTimeOut()Z

    move-result v1

    if-eqz v1, :cond_9

    .line 608
    const/4 v7, 0x2

    .line 611
    :cond_9
    :goto_2
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v0

    invoke-static {v0}, Lcom/android/camera/module/loader/StartControl;->create(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    .line 612
    invoke-virtual {v0, v7}, Lcom/android/camera/module/loader/StartControl;->setResetType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    .line 611
    invoke-virtual {p0, v0}, Lcom/android/camera/Camera;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    .line 614
    :goto_3
    return-void
.end method

.method private setBrightnessRampRate(I)V
    .locals 1

    .line 1559
    iget-object v0, p0, Lcom/android/camera/Camera;->mPowerManager:Landroid/os/IPowerManager;

    invoke-static {v0, p1}, Lcom/android/camera/lib/compatibility/util/CompatibilityUtils;->setBrightnessRampRate(Landroid/os/IPowerManager;I)V

    .line 1560
    return-void
.end method

.method private setScreenEffect(Z)V
    .locals 2

    .line 1563
    iget-object v0, p0, Lcom/android/camera/Camera;->mDisplayFeatureManager:Lmiui/hardware/display/DisplayFeatureManager;

    if-eqz v0, :cond_0

    .line 1564
    iget-object v0, p0, Lcom/android/camera/Camera;->mDisplayFeatureManager:Lmiui/hardware/display/DisplayFeatureManager;

    const/16 v1, 0xe

    invoke-virtual {v0, v1, p1}, Lmiui/hardware/display/DisplayFeatureManager;->setScreenEffect(II)V

    .line 1566
    :cond_0
    return-void
.end method

.method private setTranslucentNavigation(Z)V
    .locals 2

    .line 550
    invoke-static {p0}, Lcom/android/camera/Util;->checkDeviceHasNavigationBar(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 551
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getWindow()Landroid/view/Window;

    move-result-object p1

    .line 552
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x300

    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 554
    const/high16 v0, -0x80000000

    invoke-virtual {p1, v0}, Landroid/view/Window;->addFlags(I)V

    .line 556
    :cond_0
    return-void
.end method

.method private setupCamera(Lcom/android/camera/module/loader/StartControl;)V
    .locals 5

    .line 424
    invoke-direct {p0}, Lcom/android/camera/Camera;->closeCameraSetup()Z

    .line 425
    new-instance v0, Lcom/android/camera/module/loader/FunctionCameraPrepare;

    iget v1, p1, Lcom/android/camera/module/loader/StartControl;->mTargetMode:I

    iget v2, p1, Lcom/android/camera/module/loader/StartControl;->mResetType:I

    iget-boolean v3, p1, Lcom/android/camera/module/loader/StartControl;->mNeedReConfigureData:Z

    iget-object v4, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    check-cast v4, Lcom/android/camera/module/BaseModule;

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/android/camera/module/loader/FunctionCameraPrepare;-><init>(IIZLcom/android/camera/module/BaseModule;)V

    .line 432
    new-instance v1, Lcom/android/camera/module/loader/FunctionModuleSetup;

    iget v2, p1, Lcom/android/camera/module/loader/StartControl;->mTargetMode:I

    invoke-direct {v1, v2}, Lcom/android/camera/module/loader/FunctionModuleSetup;-><init>(I)V

    .line 433
    new-instance v2, Lcom/android/camera/module/loader/FunctionDataSetup;

    iget v3, p1, Lcom/android/camera/module/loader/StartControl;->mTargetMode:I

    invoke-direct {v2, v3}, Lcom/android/camera/module/loader/FunctionDataSetup;-><init>(I)V

    .line 434
    new-instance v3, Lcom/android/camera/module/loader/FunctionUISetup;

    iget v4, p1, Lcom/android/camera/module/loader/StartControl;->mTargetMode:I

    invoke-virtual {p1}, Lcom/android/camera/module/loader/StartControl;->needNotifyUI()Z

    move-result p1

    invoke-direct {v3, v4, p1}, Lcom/android/camera/module/loader/FunctionUISetup;-><init>(IZ)V

    .line 436
    nop

    .line 437
    invoke-static {p0}, Lcom/android/camera/module/loader/NullHolder;->ofNullable(Ljava/lang/Object;)Lcom/android/camera/module/loader/NullHolder;

    move-result-object p1

    invoke-static {p1}, Lio/reactivex/Single;->just(Ljava/lang/Object;)Lio/reactivex/Single;

    move-result-object p1

    sget-object v4, Lcom/android/camera/constant/GlobalConstant;->sCameraSetupScheduler:Lio/reactivex/Scheduler;

    .line 443
    invoke-virtual {p1, v4}, Lio/reactivex/Single;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Single;

    move-result-object p1

    .line 444
    invoke-virtual {p1, v0}, Lio/reactivex/Single;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Single;

    move-result-object p1

    .line 446
    iget-object v0, p0, Lcom/android/camera/Camera;->mCamera2OpenOnSubScribe:Lcom/android/camera/module/loader/camera2/Camera2OpenOnSubScribe;

    invoke-static {v0}, Lio/reactivex/Single;->create(Lio/reactivex/SingleOnSubscribe;)Lio/reactivex/Single;

    move-result-object v0

    sget-object v4, Lcom/android/camera/constant/GlobalConstant;->sCameraSetupScheduler:Lio/reactivex/Scheduler;

    .line 447
    invoke-virtual {v0, v4}, Lio/reactivex/Single;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Single;

    move-result-object v0

    sget-object v4, Lcom/android/camera/constant/GlobalConstant;->sCameraSetupScheduler:Lio/reactivex/Scheduler;

    .line 448
    invoke-virtual {v0, v4}, Lio/reactivex/Single;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Single;

    move-result-object v0

    .line 450
    iget-object v4, p0, Lcom/android/camera/Camera;->mCameraOpenResult:Lio/reactivex/functions/BiFunction;

    invoke-virtual {p1, v0, v4}, Lio/reactivex/Single;->zipWith(Lio/reactivex/SingleSource;Lio/reactivex/functions/BiFunction;)Lio/reactivex/Single;

    move-result-object p1

    .line 452
    invoke-virtual {p1, v1}, Lio/reactivex/Single;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Single;

    move-result-object p1

    .line 453
    invoke-virtual {p1, v2}, Lio/reactivex/Single;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Single;

    move-result-object p1

    .line 456
    invoke-virtual {v3}, Lcom/android/camera/module/loader/FunctionUISetup;->getWorkThread()Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Single;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Single;

    move-result-object p1

    .line 457
    invoke-virtual {p1, v3}, Lio/reactivex/Single;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Single;

    move-result-object p1

    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraSetupConsumer:Lio/reactivex/functions/Consumer;

    .line 458
    invoke-virtual {p1, v0}, Lio/reactivex/Single;->subscribe(Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/Camera;->mCameraSetupDisposable:Lio/reactivex/disposables/Disposable;

    .line 459
    return-void
.end method

.method private shouldReleaseLater()Z
    .locals 1

    .line 542
    invoke-virtual {p0}, Lcom/android/camera/Camera;->isCurrentModuleAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0}, Lcom/android/camera/module/Module;->shouldReleaseLater()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private showCameraError(I)V
    .locals 3

    .line 333
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->isRetriedIfCameraError()Z

    move-result v0

    .line 334
    if-nez v0, :cond_0

    const/16 v0, 0xec

    if-eq p1, v0, :cond_0

    const/16 v0, 0xed

    if-eq p1, v0, :cond_0

    .line 336
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Exception "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " occurs, retry to open camera..."

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 337
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object p1

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->setRetriedIfCameraError(Z)V

    .line 338
    iget-object p1, p0, Lcom/android/camera/Camera;->mStartControl:Lcom/android/camera/module/loader/StartControl;

    invoke-direct {p0, p1}, Lcom/android/camera/Camera;->setupCamera(Lcom/android/camera/module/loader/StartControl;)V

    .line 339
    return-void

    .line 343
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/statistic/CameraStatUtil;->trackCameraError(Ljava/lang/String;)V

    .line 345
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    .line 346
    const/16 v1, 0xa

    iput v1, v0, Landroid/os/Message;->what:I

    .line 347
    iput p1, v0, Landroid/os/Message;->arg1:I

    .line 348
    iget-object p1, p0, Lcom/android/camera/Camera;->mHandler:Landroid/os/Handler;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 349
    return-void
.end method

.method private showDebug()V
    .locals 2

    .line 1292
    invoke-static {}, Lcom/android/camera/Util;->isShowDebugInfo()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 1293
    iget-object v0, p0, Lcom/android/camera/Camera;->mDebugInfoView:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    .line 1294
    iget-object v0, p0, Lcom/android/camera/Camera;->mDebugInfoView:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1296
    :cond_0
    new-instance v0, Lcom/android/camera/Camera$LogThread;

    invoke-direct {v0, p0}, Lcom/android/camera/Camera$LogThread;-><init>(Lcom/android/camera/Camera;)V

    iput-object v0, p0, Lcom/android/camera/Camera;->mDebugThread:Lcom/android/camera/Camera$LogThread;

    .line 1297
    iget-object v0, p0, Lcom/android/camera/Camera;->mDebugThread:Lcom/android/camera/Camera$LogThread;

    invoke-virtual {v0}, Lcom/android/camera/Camera$LogThread;->start()V

    .line 1299
    :cond_1
    iget-object v0, p0, Lcom/android/camera/Camera;->mDebugInfoView:Landroid/widget/TextView;

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/android/camera/Util;->isShowPreviewDebugInfo()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1300
    iget-object v0, p0, Lcom/android/camera/Camera;->mDebugInfoView:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1302
    :cond_2
    return-void
.end method

.method private showFirstUseHintIfNeeded()V
    .locals 4

    .line 1538
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "pref_camera_first_use_hint_shown_key"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1540
    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraRootView:Lcom/android/camera/ui/CameraRootView;

    if-eqz v0, :cond_0

    .line 1541
    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraRootView:Lcom/android/camera/ui/CameraRootView;

    invoke-virtual {v0}, Lcom/android/camera/ui/CameraRootView;->disableTouchEvent()V

    .line 1543
    :cond_0
    iget-object v0, p0, Lcom/android/camera/Camera;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/camera/Camera$9;

    invoke-direct {v1, p0}, Lcom/android/camera/Camera$9;-><init>(Lcom/android/camera/Camera;)V

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1556
    :cond_1
    return-void
.end method

.method private showHibernationFragment()V
    .locals 3

    .line 1668
    new-instance v0, Lcom/android/camera/fragment/dialog/HibernationFragment;

    invoke-direct {v0}, Lcom/android/camera/fragment/dialog/HibernationFragment;-><init>()V

    .line 1669
    const/4 v1, 0x2

    const v2, 0x7f0c001e

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/app/DialogFragment;->setStyle(II)V

    .line 1670
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    const-string v2, "Hibernation"

    .line 1671
    invoke-virtual {v1, v0, v2}, Landroid/support/v4/app/FragmentTransaction;->add(Landroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object v0

    .line 1672
    invoke-virtual {v0}, Landroid/support/v4/app/FragmentTransaction;->commitAllowingStateLoss()I

    .line 1673
    return-void
.end method

.method private switchEdgeFingerMode(Z)V
    .locals 1

    .line 1245
    invoke-static {}, Lcom/mi/config/b;->gP()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 1246
    :cond_0
    invoke-static {p0, p1}, Lcom/android/camera/CameraSettings;->setEdgeMode(Landroid/content/Context;Z)V

    .line 1249
    const/4 v0, 0x0

    if-eqz p1, :cond_1

    .line 1250
    new-instance p1, Lcom/android/camera/Camera$WatchDogThread;

    invoke-direct {p1, p0, v0}, Lcom/android/camera/Camera$WatchDogThread;-><init>(Lcom/android/camera/Camera;Lcom/android/camera/Camera$1;)V

    iput-object p1, p0, Lcom/android/camera/Camera;->mWatchDog:Ljava/lang/Thread;

    .line 1251
    iget-object p1, p0, Lcom/android/camera/Camera;->mWatchDog:Ljava/lang/Thread;

    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    goto :goto_0

    .line 1253
    :cond_1
    iget-object p1, p0, Lcom/android/camera/Camera;->mWatchDog:Ljava/lang/Thread;

    if-eqz p1, :cond_2

    .line 1254
    iget-object p1, p0, Lcom/android/camera/Camera;->mWatchDog:Ljava/lang/Thread;

    invoke-virtual {p1}, Ljava/lang/Thread;->interrupt()V

    .line 1255
    iput-object v0, p0, Lcom/android/camera/Camera;->mWatchDog:Ljava/lang/Thread;

    .line 1258
    :cond_2
    :goto_0
    return-void
.end method

.method private unbindServices()V
    .locals 1

    .line 1531
    iget-boolean v0, p0, Lcom/android/camera/Camera;->mIsGalleryServiceBound:Z

    if-eqz v0, :cond_0

    .line 1532
    iget-object v0, p0, Lcom/android/camera/Camera;->mServiceConnection:Landroid/content/ServiceConnection;

    invoke-virtual {p0, v0}, Lcom/android/camera/Camera;->unbindService(Landroid/content/ServiceConnection;)V

    .line 1533
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/Camera;->mIsGalleryServiceBound:Z

    .line 1535
    :cond_0
    return-void
.end method

.method private unregisterSDReceiver()V
    .locals 2

    .line 1640
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/Camera;->mSDReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/android/camera/Camera;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1643
    goto :goto_0

    .line 1641
    :catch_0
    move-exception v0

    .line 1642
    sget-object v1, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1644
    :goto_0
    return-void
.end method


# virtual methods
.method public changeRequestOrientation()V
    .locals 1

    .line 1342
    invoke-static {}, Lcom/mi/config/b;->hn()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1343
    return-void

    .line 1345
    :cond_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1346
    const/4 v0, 0x7

    invoke-virtual {p0, v0}, Lcom/android/camera/Camera;->setRequestedOrientation(I)V

    goto :goto_0

    .line 1348
    :cond_1
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/Camera;->setRequestedOrientation(I)V

    .line 1350
    :goto_0
    return-void
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 1

    .line 947
    iget-object v0, p0, Lcom/android/camera/Camera;->mProximitySensorLock:Lcom/android/camera/ProximitySensorLock;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/Camera;->mProximitySensorLock:Lcom/android/camera/ProximitySensorLock;

    invoke-virtual {v0, p1}, Lcom/android/camera/ProximitySensorLock;->intercept(Landroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 948
    const/4 p1, 0x1

    return p1

    .line 950
    :cond_0
    invoke-super {p0, p1}, Lcom/android/camera/ActivityBase;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1056
    iget-boolean v0, p0, Lcom/android/camera/Camera;->mActivityPaused:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 1058
    return v1

    .line 1061
    :cond_0
    iget-object v0, p0, Lcom/android/camera/Camera;->mProximitySensorLock:Lcom/android/camera/ProximitySensorLock;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/Camera;->mProximitySensorLock:Lcom/android/camera/ProximitySensorLock;

    invoke-virtual {v0}, Lcom/android/camera/ProximitySensorLock;->active()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1062
    return v1

    .line 1065
    :cond_1
    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0}, Lcom/android/camera/module/Module;->isIgnoreTouchEvent()Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_1

    .line 1069
    :cond_2
    invoke-super {p0, p1}, Lcom/android/camera/ActivityBase;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    if-nez v0, :cond_4

    invoke-static {p0}, Lcom/android/camera/ui/V6GestureRecognizer;->getInstance(Lcom/android/camera/ActivityBase;)Lcom/android/camera/ui/V6GestureRecognizer;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/V6GestureRecognizer;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_0

    :cond_3
    const/4 v1, 0x0

    nop

    :cond_4
    :goto_0
    return v1

    .line 1066
    :cond_5
    :goto_1
    invoke-super {p0, p1}, Lcom/android/camera/ActivityBase;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public getCapturePosture()I
    .locals 1

    .line 1241
    iget-object v0, p0, Lcom/android/camera/Camera;->mSensorStateManager:Lcom/android/camera/SensorStateManager;

    invoke-virtual {v0}, Lcom/android/camera/SensorStateManager;->getCapturePosture()I

    move-result v0

    return v0
.end method

.method public getCurrentBrightness()I
    .locals 1

    .line 1592
    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraBrightness:Lcom/android/camera/CameraBrightness;

    invoke-virtual {v0}, Lcom/android/camera/CameraBrightness;->getCurrentBrightness()I

    move-result v0

    return v0
.end method

.method public getCurrentModuleIndex()I
    .locals 1

    .line 1091
    invoke-virtual {p0}, Lcom/android/camera/Camera;->isCurrentModuleAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0}, Lcom/android/camera/module/Module;->getModuleIndex()I

    move-result v0

    goto :goto_0

    :cond_0
    const/16 v0, 0xa0

    :goto_0
    return v0
.end method

.method public getImageSaver()Lcom/android/camera/storage/ImageSaver;
    .locals 1

    .line 1229
    iget-object v0, p0, Lcom/android/camera/Camera;->mImageSaver:Lcom/android/camera/storage/ImageSaver;

    return-object v0
.end method

.method public getImplFactory()Lcom/android/camera/module/impl/ImplFactory;
    .locals 1

    .line 352
    iget-object v0, p0, Lcom/android/camera/Camera;->mImplFactory:Lcom/android/camera/module/impl/ImplFactory;

    return-object v0
.end method

.method public getSensorStateManager()Lcom/android/camera/SensorStateManager;
    .locals 1

    .line 1233
    iget-object v0, p0, Lcom/android/camera/Camera;->mSensorStateManager:Lcom/android/camera/SensorStateManager;

    return-object v0
.end method

.method public handleScreenSlideKeyEvent(ILandroid/view/KeyEvent;)Z
    .locals 10

    .line 1722
    sget-object p2, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "handleScreenSlideKeyEvent "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1723
    const/4 p2, 0x1

    const/16 v0, 0x2bd

    if-ne p1, v0, :cond_0

    .line 1724
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getCameraIntentManager()Lcom/android/camera/CameraIntentManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraIntentManager;->isFromScreenSlide()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/Camera;->isModeSwitched()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1725
    invoke-virtual {p0}, Lcom/android/camera/Camera;->finish()V

    .line 1726
    const p1, 0x7f050002

    const v0, 0x7f050003

    invoke-virtual {p0, p1, v0}, Lcom/android/camera/Camera;->overridePendingTransition(II)V

    .line 1727
    return p2

    .line 1730
    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    .line 1731
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v1

    .line 1732
    const/16 v2, 0x2bc

    const/4 v3, 0x0

    if-ne p1, v2, :cond_1

    .line 1733
    nop

    .line 1735
    move v4, p2

    goto :goto_0

    .line 1734
    :cond_1
    nop

    .line 1735
    move v4, v3

    :goto_0
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v5

    .line 1736
    const/16 v6, 0xab

    const/16 v7, 0xac

    const/16 v8, 0xa9

    const/16 v9, 0xa2

    if-ne v5, v6, :cond_2

    invoke-static {}, Lcom/mi/config/b;->he()Z

    move-result v6

    if-eqz v6, :cond_6

    :cond_2
    const/16 v6, 0xa6

    if-eq v5, v6, :cond_6

    const/16 v6, 0xa7

    if-eq v5, v6, :cond_6

    const/16 v6, 0xad

    if-ne v5, v6, :cond_3

    goto :goto_2

    .line 1741
    :cond_3
    const/16 v6, 0xa8

    if-eq v5, v6, :cond_5

    if-eq v5, v8, :cond_5

    const/16 v6, 0xaa

    if-eq v5, v6, :cond_5

    if-ne v5, v7, :cond_4

    goto :goto_1

    .line 1746
    :cond_4
    if-ne v5, v9, :cond_7

    .line 1747
    if-nez v4, :cond_7

    .line 1748
    invoke-static {}, Lcom/android/camera/data/DataRepository;->getInstance()Lcom/android/camera/data/DataRepository;

    move-result-object v6

    invoke-virtual {v6}, Lcom/android/camera/data/DataRepository;->backUp()Lcom/android/camera/data/backup/DataBackUp;

    move-result-object v6

    .line 1749
    invoke-interface {v6}, Lcom/android/camera/data/backup/DataBackUp;->isLastVideoFastMotion()Z

    move-result v6

    if-eqz v6, :cond_7

    .line 1750
    nop

    .line 1754
    move v5, v8

    goto :goto_3

    .line 1745
    :cond_5
    :goto_1
    nop

    .line 1754
    move v5, v9

    goto :goto_3

    .line 1740
    :cond_6
    :goto_2
    const/16 v5, 0xa3

    .line 1754
    :cond_7
    :goto_3
    if-eq v1, v4, :cond_c

    .line 1756
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    invoke-virtual {p1, v7}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 1758
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    .line 1759
    invoke-virtual {v2, v9}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v2

    check-cast v2, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    .line 1760
    if-eqz p1, :cond_8

    .line 1761
    const/4 v6, 0x4

    invoke-interface {p1, v6}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->removeExtraMenu(I)V

    .line 1763
    :cond_8
    if-eqz v2, :cond_9

    .line 1764
    invoke-interface {v2}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->hideExtra()V

    .line 1766
    :cond_9
    invoke-virtual {v0, v5}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCurrentMode(I)V

    .line 1767
    invoke-virtual {v0, v4}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCameraId(I)V

    .line 1768
    if-ne v1, p2, :cond_a

    move p1, p2

    goto :goto_4

    :cond_a
    move p1, v3

    :goto_4
    if-ne v4, p2, :cond_b

    .line 1769
    move v3, p2

    goto :goto_5

    .line 1768
    :cond_b
    nop

    .line 1769
    :goto_5
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v0

    .line 1768
    invoke-static {p1, v3, v0}, Lcom/android/camera/statistic/ScenarioTrackUtil;->trackSwitchCameraStart(ZZI)V

    .line 1770
    invoke-static {v5}, Lcom/android/camera/module/loader/StartControl;->create(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    .line 1771
    invoke-virtual {p1, p2}, Lcom/android/camera/module/loader/StartControl;->setFromScreenSlide(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    .line 1772
    invoke-virtual {p1, p2}, Lcom/android/camera/module/loader/StartControl;->setNeedBlurAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    const/4 v0, 0x2

    .line 1773
    invoke-virtual {p1, v0}, Lcom/android/camera/module/loader/StartControl;->setViewConfigType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    .line 1770
    invoke-virtual {p0, p1}, Lcom/android/camera/Camera;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    .line 1774
    goto :goto_6

    .line 1775
    :cond_c
    if-ne p1, v2, :cond_d

    invoke-virtual {p0}, Lcom/android/camera/Camera;->isCurrentModuleAlive()Z

    move-result p1

    if-eqz p1, :cond_d

    .line 1776
    iget-object p1, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    check-cast p1, Lcom/android/camera/module/BaseModule;

    invoke-virtual {p1, p2}, Lcom/android/camera/module/BaseModule;->updateScreenSlide(Z)V

    .line 1779
    :cond_d
    :goto_6
    return p2
.end method

.method public hideLensDirtyDetectedHint()V
    .locals 2

    .line 1711
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fG()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1713
    return-void

    .line 1715
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    const-string v1, "LensDirtyDetectDialog"

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    .line 1716
    if-eqz v0, :cond_1

    instance-of v1, v0, Landroid/support/v4/app/DialogFragment;

    if-eqz v1, :cond_1

    .line 1717
    check-cast v0, Landroid/support/v4/app/DialogFragment;

    invoke-virtual {v0}, Landroid/support/v4/app/DialogFragment;->dismissAllowingStateLoss()V

    .line 1719
    :cond_1
    return-void
.end method

.method public isCurrentModuleAlive()Z
    .locals 1

    .line 546
    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0}, Lcom/android/camera/module/Module;->isCreated()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isModeSwitched()Z
    .locals 1

    .line 1783
    iget-boolean v0, p0, Lcom/android/camera/Camera;->mIsModeSwitched:Z

    return v0
.end method

.method public isNewBieAlive(I)Z
    .locals 2

    .line 1434
    nop

    .line 1435
    packed-switch p1, :pswitch_data_0

    .line 1449
    const/4 p1, 0x0

    goto :goto_0

    .line 1446
    :pswitch_0
    const-string p1, "UltraWideHint"

    goto :goto_0

    .line 1443
    :pswitch_1
    const-string p1, "AiSceneHint"

    .line 1444
    goto :goto_0

    .line 1440
    :pswitch_2
    const-string p1, "RotateHint"

    .line 1441
    goto :goto_0

    .line 1437
    :pswitch_3
    const-string p1, "PortraitHint"

    .line 1438
    nop

    .line 1449
    :goto_0
    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 1450
    return v0

    .line 1452
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object p1

    if-eqz p1, :cond_1

    const/4 v0, 0x1

    nop

    :cond_1
    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public isPanoramaRecording()Z
    .locals 1

    .line 534
    invoke-virtual {p0}, Lcom/android/camera/Camera;->isCurrentModuleAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0}, Lcom/android/camera/module/Module;->isPanoramaDoing()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isScreenSlideOff()Z
    .locals 1

    .line 1787
    iget-boolean v0, p0, Lcom/android/camera/Camera;->mIsScreenSlideOff:Z

    return v0
.end method

.method public isSelectingCapturedVideo()Z
    .locals 1

    .line 538
    invoke-virtual {p0}, Lcom/android/camera/Camera;->isCurrentModuleAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0}, Lcom/android/camera/module/Module;->isSelectingCapturedResult()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isStable()Z
    .locals 1

    .line 1237
    iget-object v0, p0, Lcom/android/camera/Camera;->mSensorStateManager:Lcom/android/camera/SensorStateManager;

    invoke-virtual {v0}, Lcom/android/camera/SensorStateManager;->isStable()Z

    move-result v0

    return v0
.end method

.method public isVideoRecording()Z
    .locals 1

    .line 530
    invoke-virtual {p0}, Lcom/android/camera/Camera;->isCurrentModuleAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0}, Lcom/android/camera/module/Module;->isVideoRecording()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public notifyOnFirstFrameArrived(I)V
    .locals 2

    .line 1479
    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0}, Lcom/android/camera/module/Module;->isDeparted()Z

    move-result v0

    if-nez v0, :cond_6

    invoke-virtual {p0}, Lcom/android/camera/Camera;->isSwitchingModule()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 1483
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->clearAnimation()V

    .line 1484
    iget-object v0, p0, Lcom/android/camera/Camera;->mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

    invoke-virtual {v0}, Lcom/android/camera/fragment/BaseFragmentDelegate;->getAnimationComposite()Lcom/android/camera/animation/AnimationComposite;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/camera/animation/AnimationComposite;->notifyAfterFirstFrameArrived(I)V

    .line 1485
    iget-object p1, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    const/4 v0, 0x1

    invoke-interface {p1, v0}, Lcom/android/camera/module/Module;->enableCameraControls(Z)V

    .line 1486
    iget-object p1, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {p1, v0}, Lcom/android/camera/module/Module;->setFrameAvailable(Z)V

    .line 1489
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getCurrentModuleIndex()I

    move-result p1

    const/16 v1, 0xa5

    if-eq p1, v1, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getCurrentModuleIndex()I

    move-result p1

    const/16 v1, 0xa3

    if-eq p1, v1, :cond_1

    .line 1490
    return-void

    .line 1492
    :cond_1
    invoke-static {}, Lcom/mi/config/b;->hn()Z

    move-result p1

    if-nez p1, :cond_2

    .line 1493
    return-void

    .line 1495
    :cond_2
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result p1

    if-nez p1, :cond_3

    .line 1496
    return-void

    .line 1498
    :cond_3
    iget p1, p0, Lcom/android/camera/Camera;->mDisplayRotation:I

    if-eqz p1, :cond_4

    .line 1499
    return-void

    .line 1501
    :cond_4
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object p1

    const-string v1, "pref_front_camera_first_use_hint_shown_key"

    invoke-virtual {p1, v1, v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_5

    .line 1502
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object p1

    const-string v0, "pref_front_camera_first_use_hint_shown_key"

    const/4 v1, 0x0

    .line 1503
    invoke-interface {p1, v0, v1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putBoolean(Ljava/lang/String;Z)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object p1

    .line 1504
    invoke-interface {p1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 1505
    const/4 p1, 0x2

    invoke-virtual {p0, p1}, Lcom/android/camera/Camera;->showNewBie(I)Z

    .line 1507
    :cond_5
    return-void

    .line 1480
    :cond_6
    :goto_0
    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 0

    .line 1792
    invoke-super {p0, p1, p2, p3}, Lcom/android/camera/ActivityBase;->onActivityResult(IILandroid/content/Intent;)V

    .line 1793
    invoke-static {p0, p1, p2, p3}, Lcom/android/camera/FileCompat;->handleActivityResult(Landroid/app/Activity;IILandroid/content/Intent;)Z

    move-result p1

    .line 1794
    if-eqz p1, :cond_1

    .line 1795
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    invoke-static {p0, p1}, Landroid/support/v4/provider/DocumentFile;->fromTreeUri(Landroid/content/Context;Landroid/net/Uri;)Landroid/support/v4/provider/DocumentFile;

    move-result-object p1

    .line 1796
    const-string p2, "Camera"

    invoke-virtual {p1, p2}, Landroid/support/v4/provider/DocumentFile;->findFile(Ljava/lang/String;)Landroid/support/v4/provider/DocumentFile;

    move-result-object p2

    if-nez p2, :cond_0

    .line 1797
    const-string p2, "Camera"

    invoke-virtual {p1, p2}, Landroid/support/v4/provider/DocumentFile;->createDirectory(Ljava/lang/String;)Landroid/support/v4/provider/DocumentFile;

    .line 1799
    :cond_0
    goto :goto_0

    .line 1800
    :cond_1
    sget-object p1, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string p2, "onActivityResult documents permission not granted"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1801
    const/4 p1, 0x0

    invoke-static {p1}, Lcom/android/camera/storage/PriorityStorageBroadcastReceiver;->setPriorityStorage(Z)V

    .line 1803
    :goto_0
    return-void
.end method

.method public onAwaken()V
    .locals 2

    .line 1662
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v1, "onAwaken"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1663
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->requestAwaken()V

    .line 1664
    iget-object v0, p0, Lcom/android/camera/Camera;->mStartControl:Lcom/android/camera/module/loader/StartControl;

    invoke-virtual {p0, v0}, Lcom/android/camera/Camera;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    .line 1665
    return-void
.end method

.method public onBackPressed()V
    .locals 2

    .line 939
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v1, "onBackPressed"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 940
    invoke-virtual {p0}, Lcom/android/camera/Camera;->isCurrentModuleAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0}, Lcom/android/camera/module/Module;->onBackPressed()Z

    move-result v0

    if-nez v0, :cond_1

    .line 941
    :cond_0
    invoke-super {p0}, Lcom/android/camera/ActivityBase;->onBackPressed()V

    .line 943
    :cond_1
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 9

    .line 226
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v1, "onCreate start"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 227
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/android/camera/CameraAppImpl;

    iput-object v0, p0, Lcom/android/camera/Camera;->mApplication:Lcom/android/camera/CameraAppImpl;

    .line 233
    iget-object v0, p0, Lcom/android/camera/Camera;->mApplication:Lcom/android/camera/CameraAppImpl;

    invoke-virtual {v0}, Lcom/android/camera/CameraAppImpl;->isApplicationFirstLaunched()Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/camera/Camera;->trackAppLunchTimeStart(Z)V

    .line 234
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/Camera;->mAppStartTime:J

    .line 235
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/CameraIntentManager;->getInstance(Landroid/content/Intent;)Lcom/android/camera/CameraIntentManager;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    .line 236
    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    invoke-virtual {v0, p0}, Lcom/android/camera/CameraIntentManager;->setReferer(Landroid/app/Activity;)V

    .line 237
    invoke-static {p0}, Lcom/android/camera/lib/compatibility/util/CompatibilityUtils;->isInMultiWindowMode(Landroid/app/Activity;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 241
    invoke-super {p0, v1}, Lcom/android/camera/ActivityBase;->onCreate(Landroid/os/Bundle;)V

    invoke-static {p0}, Lcom/aeonax/PermissionsAsker;->Ask(Landroid/app/Activity;)V
    .line 242
    const p1, 0x7f0b01f2

    invoke-static {p0, p1}, Lcom/android/camera/ToastUtils;->showToast(Landroid/content/Context;I)V

    .line 243
    sget-object p1, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v0, "isInMultiWindowMode call finish"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 244
    invoke-virtual {p0}, Lcom/android/camera/Camera;->finish()V

    .line 245
    return-void

    .line 249
    :cond_0
    const-string v0, "android.media.action.VOICE_COMMAND"

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 250
    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    invoke-virtual {v0}, Lcom/android/camera/CameraIntentManager;->checkCallerLegality()Z

    move-result v0

    if-nez v0, :cond_1

    .line 251
    sget-object p1, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "An illegal caller:"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    invoke-virtual {v2}, Lcom/android/camera/CameraIntentManager;->getCaller()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " use VOICE_CONTROL_INTENT!"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 253
    invoke-super {p0, v1}, Lcom/android/camera/ActivityBase;->onCreate(Landroid/os/Bundle;)V

    invoke-static {p0}, Lcom/aeonax/PermissionsAsker;->Ask(Landroid/app/Activity;)V
    .line 254
    invoke-virtual {p0}, Lcom/android/camera/Camera;->finish()V

    .line 255
    return-void

    .line 259
    :cond_1
    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    invoke-virtual {v0}, Lcom/android/camera/CameraIntentManager;->checkCallerLegality()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 260
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/statistic/CameraStatUtil;->trackVoiceControl(Landroid/content/Intent;)V

    .line 263
    :cond_2
    invoke-super {p0, p1}, Lcom/android/camera/ActivityBase;->onCreate(Landroid/os/Bundle;)V

    invoke-static {p0}, Lcom/aeonax/PermissionsAsker;->Ask(Landroid/app/Activity;)V
    .line 265
    iget-object p1, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    invoke-virtual {p1}, Lcom/android/camera/CameraIntentManager;->checkCallerLegality()Z

    move-result v8

    .line 266
    new-instance p1, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    .line 267
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getIntent()Landroid/content/Intent;

    move-result-object v6

    .line 268
    invoke-virtual {p0}, Lcom/android/camera/Camera;->startFromSecureKeyguard()Z

    move-result v7

    move-object v2, p1

    invoke-direct/range {v2 .. v8}, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;-><init>(Lcom/android/camera/module/Module;Lcom/android/camera/module/loader/StartControl;Lcom/android/camera/CameraScreenNail;Landroid/content/Intent;ZZ)V

    .line 266
    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    sget-object v0, Lcom/android/camera/constant/GlobalConstant;->sCameraSetupScheduler:Lio/reactivex/Scheduler;

    .line 269
    invoke-virtual {p1, v0}, Lio/reactivex/Completable;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Completable;

    move-result-object p1

    .line 270
    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 272
    invoke-static {}, Lcom/android/camera/ProximitySensorLock;->enabled()Z

    move-result p1

    if-eqz p1, :cond_4

    invoke-direct {p0}, Lcom/android/camera/Camera;->isFromKeyguard()Z

    move-result p1

    if-eqz p1, :cond_4

    .line 273
    invoke-static {}, Lcom/android/camera/Util;->isNonUIEnabled()Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    invoke-virtual {p1}, Lcom/android/camera/CameraIntentManager;->isFromVolumeKey()Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_3

    .line 274
    invoke-static {}, Lcom/android/camera/Util;->isNonUI()Z

    move-result p1

    if-eqz p1, :cond_4

    .line 275
    const-string p1, "counter"

    const-string v0, "pocket_mode_enter"

    const-string v1, "\u65b9\u5f0f"

    const-string v2, "NonUI\u97f3\u91cf\u952e"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lcom/android/camera/statistic/CameraStatUtil;->track(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 280
    sget-object p1, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v0, "Finish from NonUI mode."

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 281
    invoke-virtual {p0}, Lcom/android/camera/Camera;->finish()V

    .line 282
    return-void

    .line 284
    :cond_3
    invoke-static {}, Lcom/android/camera/ProximitySensorLock;->supported()Z

    move-result p1

    if-eqz p1, :cond_4

    .line 285
    new-instance p1, Lcom/android/camera/ProximitySensorLock;

    invoke-direct {p1, p0}, Lcom/android/camera/ProximitySensorLock;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/android/camera/Camera;->mProximitySensorLock:Lcom/android/camera/ProximitySensorLock;

    .line 287
    iget-object p1, p0, Lcom/android/camera/Camera;->mProximitySensorLock:Lcom/android/camera/ProximitySensorLock;

    invoke-virtual {p1}, Lcom/android/camera/ProximitySensorLock;->startWatching()V

    .line 291
    :cond_4
    invoke-static {}, Lcom/android/camera/effect/EffectController;->releaseInstance()V

    .line 292
    const p1, 0x7f040044

    invoke-virtual {p0, p1}, Lcom/android/camera/Camera;->setContentView(I)V

    .line 294
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1, v1}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 295
    const p1, 0x7f0d00d7

    invoke-virtual {p0, p1}, Lcom/android/camera/Camera;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/android/camera/ui/V6CameraGLSurfaceView;

    iput-object p1, p0, Lcom/android/camera/Camera;->mGLView:Lcom/android/camera/ui/V6CameraGLSurfaceView;

    .line 296
    const p1, 0x7f0d00d8

    invoke-virtual {p0, p1}, Lcom/android/camera/Camera;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/android/camera/Camera;->mGLCoverView:Landroid/widget/ImageView;

    .line 297
    const p1, 0x7f0d00e6

    invoke-virtual {p0, p1}, Lcom/android/camera/Camera;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/android/camera/Camera;->mDebugInfoView:Landroid/widget/TextView;

    .line 298
    const p1, 0x7f0d00f2

    invoke-virtual {p0, p1}, Lcom/android/camera/Camera;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/android/camera/ui/V9EdgeShutterView;

    iput-object p1, p0, Lcom/android/camera/Camera;->mEdgeShutterView:Lcom/android/camera/ui/V9EdgeShutterView;

    .line 299
    const p1, 0x7f0d00e5

    invoke-virtual {p0, p1}, Lcom/android/camera/Camera;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/android/camera/ui/CameraRootView;

    iput-object p1, p0, Lcom/android/camera/Camera;->mCameraRootView:Lcom/android/camera/ui/CameraRootView;

    .line 303
    const/4 p1, 0x0

    invoke-virtual {p0, p1, p1}, Lcom/android/camera/Camera;->createCameraScreenNail(ZZ)V

    .line 304
    new-instance p1, Lcom/android/camera/module/loader/camera2/Camera2OpenOnSubScribe;

    invoke-direct {p1, p0}, Lcom/android/camera/module/loader/camera2/Camera2OpenOnSubScribe;-><init>(Lcom/android/camera/module/loader/SurfaceStateListener;)V

    iput-object p1, p0, Lcom/android/camera/Camera;->mCamera2OpenOnSubScribe:Lcom/android/camera/module/loader/camera2/Camera2OpenOnSubScribe;

    .line 305
    invoke-virtual {p0}, Lcom/android/camera/Camera;->registerProtocol()V

    .line 308
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getKeyguardFlag()Z

    move-result p1

    if-nez p1, :cond_5

    .line 309
    invoke-static {p0}, Lcom/android/camera/permission/PermissionManager;->requestCameraRuntimePermissions(Landroid/app/Activity;)Z

    .line 312
    :cond_5
    invoke-static {p0}, Lcom/android/camera/Util;->updateCountryIso(Landroid/content/Context;)V

    .line 313
    const-string p1, "power"

    invoke-static {p1}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Landroid/os/IPowerManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/os/IPowerManager;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/Camera;->mPowerManager:Landroid/os/IPowerManager;

    .line 314
    invoke-static {}, Lcom/mi/config/b;->hw()Z

    move-result p1

    if-eqz p1, :cond_6

    .line 316
    :try_start_0
    invoke-static {}, Lmiui/hardware/display/DisplayFeatureManager;->getInstance()Lmiui/hardware/display/DisplayFeatureManager;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/Camera;->mDisplayFeatureManager:Lmiui/hardware/display/DisplayFeatureManager;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 320
    goto :goto_0

    .line 317
    :catch_0
    move-exception p1

    .line 319
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v1, "DisplayFeatureManager init failed"

    invoke-static {v0, v1, p1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 322
    :cond_6
    :goto_0
    new-instance p1, Lcom/android/camera/SensorStateManager;

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p1, p0, v0}, Lcom/android/camera/SensorStateManager;-><init>(Landroid/content/Context;Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/android/camera/Camera;->mSensorStateManager:Lcom/android/camera/SensorStateManager;

    .line 323
    new-instance p1, Lcom/android/camera/Camera$MyOrientationEventListener;

    invoke-direct {p1, p0, p0}, Lcom/android/camera/Camera$MyOrientationEventListener;-><init>(Lcom/android/camera/Camera;Landroid/content/Context;)V

    iput-object p1, p0, Lcom/android/camera/Camera;->mOrientationListener:Lcom/android/camera/Camera$MyOrientationEventListener;

    .line 324
    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lcom/android/camera/Camera;->setTranslucentNavigation(Z)V

    .line 325
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p1

    invoke-static {p1}, Lcom/android/camera/EffectChangedListenerController;->setHoldKey(I)V

    .line 327
    invoke-direct {p0}, Lcom/android/camera/Camera;->showDebug()V

    .line 328
    sget-object p1, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v0, "onCreate end"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 329
    return-void
.end method

.method public onDestroy()V
    .locals 3

    .line 824
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v1, "onDestroy start"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 825
    invoke-super {p0}, Lcom/android/camera/ActivityBase;->onDestroy()V

    .line 827
    invoke-static {p0}, Lcom/android/camera/AutoLockManager;->removeInstance(Landroid/content/Context;)V

    .line 828
    invoke-direct {p0}, Lcom/android/camera/Camera;->closeCameraSetup()Z

    .line 830
    invoke-virtual {p0}, Lcom/android/camera/Camera;->unRegisterProtocol()V

    .line 832
    iget-boolean v0, p0, Lcom/android/camera/Camera;->mDelayReleaseCamera:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 833
    iput-boolean v1, p0, Lcom/android/camera/Camera;->mDelayReleaseCamera:Z

    .line 834
    const/4 v0, 0x1

    invoke-virtual {p0, v0, v0}, Lcom/android/camera/Camera;->releaseAll(ZZ)V

    .line 837
    :cond_0
    invoke-static {}, Lcom/android/camera/ThermalDetector;->getInstance()Lcom/android/camera/ThermalDetector;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/ThermalDetector;->onDestroy()V

    .line 839
    iget-object v0, p0, Lcom/android/camera/Camera;->mImageSaver:Lcom/android/camera/storage/ImageSaver;

    if-eqz v0, :cond_1

    .line 840
    iget-object v0, p0, Lcom/android/camera/Camera;->mImageSaver:Lcom/android/camera/storage/ImageSaver;

    invoke-virtual {v0}, Lcom/android/camera/storage/ImageSaver;->onHostDestroy()V

    .line 842
    :cond_1
    iget-object v0, p0, Lcom/android/camera/Camera;->mSensorStateManager:Lcom/android/camera/SensorStateManager;

    if-eqz v0, :cond_2

    .line 843
    iget-object v0, p0, Lcom/android/camera/Camera;->mSensorStateManager:Lcom/android/camera/SensorStateManager;

    invoke-virtual {v0}, Lcom/android/camera/SensorStateManager;->onDestroy()V

    .line 845
    :cond_2
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/Camera;->mPowerManager:Landroid/os/IPowerManager;

    .line 846
    iput-object v0, p0, Lcom/android/camera/Camera;->mDisplayFeatureManager:Lmiui/hardware/display/DisplayFeatureManager;

    .line 847
    invoke-static {p0}, Lcom/android/camera/ui/V6GestureRecognizer;->onDestroy(Lcom/android/camera/ActivityBase;)V

    .line 848
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v2

    invoke-static {v2}, Lcom/android/camera/EffectChangedListenerController;->removeEffectChangedListenerMap(I)V

    .line 849
    iget-object v2, p0, Lcom/android/camera/Camera;->mDebugThread:Lcom/android/camera/Camera$LogThread;

    if-eqz v2, :cond_3

    .line 850
    iget-object v2, p0, Lcom/android/camera/Camera;->mDebugThread:Lcom/android/camera/Camera$LogThread;

    invoke-virtual {v2, v1}, Lcom/android/camera/Camera$LogThread;->setRunFlag(Z)V

    .line 852
    :cond_3
    iget-object v1, p0, Lcom/android/camera/Camera;->mProximitySensorLock:Lcom/android/camera/ProximitySensorLock;

    if-eqz v1, :cond_4

    .line 853
    iget-object v1, p0, Lcom/android/camera/Camera;->mProximitySensorLock:Lcom/android/camera/ProximitySensorLock;

    invoke-virtual {v1}, Lcom/android/camera/ProximitySensorLock;->destroy()V

    .line 856
    :cond_4
    iget-object v1, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    if-eqz v1, :cond_5

    .line 857
    iget-object v1, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    invoke-virtual {v1}, Lcom/android/camera/CameraIntentManager;->destroy()V

    .line 858
    iput-object v0, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    .line 861
    :cond_5
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getScreenHint()Lcom/android/camera/ui/ScreenHint;

    move-result-object v0

    if-eqz v0, :cond_6

    .line 862
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getScreenHint()Lcom/android/camera/ui/ScreenHint;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/ui/ScreenHint;->dismissSystemChoiceDialog()V

    .line 864
    :cond_6
    invoke-static {}, Lcom/android/camera/CameraIntentManager;->removeAllInstance()V

    .line 865
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v1, "onDestroy end"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 866
    return-void
.end method

.method public onEdgeTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1073
    invoke-static {}, Lcom/mi/config/b;->gP()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1074
    invoke-static {p0}, Lcom/android/camera/ui/V6GestureRecognizer;->getInstance(Lcom/android/camera/ActivityBase;)Lcom/android/camera/ui/V6GestureRecognizer;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/V6GestureRecognizer;->onEdgeTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1

    .line 1076
    :cond_0
    const/4 p1, 0x1

    return p1
.end method

.method public onHibernate()V
    .locals 2

    .line 1647
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v1, "onHibernate"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1648
    invoke-virtual {p0}, Lcom/android/camera/Camera;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1649
    invoke-static {p0}, Lcom/android/camera/AutoLockManager;->getInstance(Landroid/content/Context;)Lcom/android/camera/AutoLockManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/AutoLockManager;->removeMessage()V

    .line 1650
    return-void

    .line 1652
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/Camera;->isCurrentModuleAlive()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1653
    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0}, Lcom/android/camera/module/Module;->setDeparted()V

    .line 1654
    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0}, Lcom/android/camera/module/Module;->closeCamera()V

    .line 1656
    :cond_1
    invoke-direct {p0}, Lcom/android/camera/Camera;->showHibernationFragment()V

    .line 1657
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->requestHibernate()V

    .line 1658
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->release(Z)V

    .line 1659
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 9

    .line 955
    iget-boolean v0, p0, Lcom/android/camera/Camera;->mActivityPaused:Z

    if-eqz v0, :cond_0

    .line 956
    invoke-super {p0, p1, p2}, Lcom/android/camera/ActivityBase;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1

    .line 960
    :cond_0
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    const/4 v1, -0x1

    const/4 v2, 0x1

    if-nez v0, :cond_3

    const/16 v0, 0x42

    if-eq p1, v0, :cond_1

    const/16 v0, 0x1b

    if-eq p1, v0, :cond_1

    const/16 v0, 0x58

    if-eq p1, v0, :cond_1

    const/16 v0, 0x57

    if-eq p1, v0, :cond_1

    const/16 v0, 0x18

    if-eq p1, v0, :cond_1

    const/16 v0, 0x19

    if-ne p1, v0, :cond_3

    .line 968
    :cond_1
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getEventTime()J

    move-result-wide v3

    iget-wide v5, p0, Lcom/android/camera/Camera;->mLastKeyEventTime:J

    const-wide/16 v7, 0x96

    invoke-static/range {v3 .. v8}, Lcom/android/camera/Util;->isTimeout(JJJ)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 969
    iput v1, p0, Lcom/android/camera/Camera;->mLastIgnoreKey:I

    goto :goto_0

    .line 971
    :cond_2
    iput p1, p0, Lcom/android/camera/Camera;->mLastIgnoreKey:I

    .line 972
    return v2

    .line 974
    :cond_3
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    if-lez v0, :cond_4

    iget v0, p0, Lcom/android/camera/Camera;->mLastIgnoreKey:I

    if-ne p1, v0, :cond_4

    .line 975
    iput v1, p0, Lcom/android/camera/Camera;->mLastIgnoreKey:I

    .line 978
    :cond_4
    :goto_0
    const/16 v0, 0x2bc

    const/4 v1, 0x0

    if-ne p1, v0, :cond_5

    .line 979
    iput-boolean v1, p0, Lcom/android/camera/Camera;->mIsScreenSlideOff:Z

    goto :goto_1

    .line 980
    :cond_5
    const/16 v0, 0x2bd

    if-ne p1, v0, :cond_6

    .line 981
    iput-boolean v2, p0, Lcom/android/camera/Camera;->mIsScreenSlideOff:Z

    .line 984
    :cond_6
    :goto_1
    invoke-virtual {p0}, Lcom/android/camera/Camera;->isCurrentModuleAlive()Z

    move-result v0

    if-eqz v0, :cond_a

    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0}, Lcom/android/camera/module/Module;->isFrameAvailable()Z

    move-result v0

    if-nez v0, :cond_7

    goto :goto_4

    .line 1002
    :cond_7
    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0, p1, p2}, Lcom/android/camera/module/Module;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    if-nez v0, :cond_9

    .line 1003
    invoke-super {p0, p1, p2}, Lcom/android/camera/ActivityBase;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result p1

    if-eqz p1, :cond_8

    goto :goto_2

    :cond_8
    goto :goto_3

    .line 1002
    :cond_9
    :goto_2
    move v1, v2

    :goto_3
    return v1

    .line 985
    :cond_a
    :goto_4
    sparse-switch p1, :sswitch_data_0

    .line 999
    invoke-super {p0, p1, p2}, Lcom/android/camera/ActivityBase;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1

    .line 988
    :sswitch_0
    invoke-virtual {p0, p1, p2}, Lcom/android/camera/Camera;->handleScreenSlideKeyEvent(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1

    .line 996
    :sswitch_1
    return v2

    :sswitch_data_0
    .sparse-switch
        0x18 -> :sswitch_1
        0x19 -> :sswitch_1
        0x1b -> :sswitch_1
        0x42 -> :sswitch_1
        0x50 -> :sswitch_1
        0x57 -> :sswitch_1
        0x58 -> :sswitch_1
        0x2bc -> :sswitch_0
        0x2bd -> :sswitch_0
    .end sparse-switch
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .locals 4

    .line 1008
    iget-boolean v0, p0, Lcom/android/camera/Camera;->mActivityPaused:Z

    if-eqz v0, :cond_0

    .line 1009
    invoke-super {p0, p1, p2}, Lcom/android/camera/ActivityBase;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1

    .line 1011
    :cond_0
    iget v0, p0, Lcom/android/camera/Camera;->mLastIgnoreKey:I

    const/4 v1, 0x1

    if-ne p1, v0, :cond_1

    .line 1012
    const-wide/16 p1, 0x0

    iput-wide p1, p0, Lcom/android/camera/Camera;->mLastKeyEventTime:J

    .line 1013
    const/4 p1, -0x1

    iput p1, p0, Lcom/android/camera/Camera;->mLastIgnoreKey:I

    .line 1014
    return v1

    .line 1017
    :cond_1
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getEventTime()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/android/camera/Camera;->mLastKeyEventTime:J

    .line 1019
    invoke-virtual {p0}, Lcom/android/camera/Camera;->isCurrentModuleAlive()Z

    move-result v0

    if-nez v0, :cond_2

    .line 1020
    invoke-super {p0, p1, p2}, Lcom/android/camera/ActivityBase;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1

    .line 1023
    :cond_2
    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0, p1, p2}, Lcom/android/camera/module/Module;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 1024
    invoke-super {p0, p1, p2}, Lcom/android/camera/ActivityBase;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_0

    :cond_3
    const/4 v1, 0x0

    nop

    .line 1023
    :cond_4
    :goto_0
    return v1
.end method

.method public onLifeAlive()V
    .locals 6

    .line 401
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v2, "onLifeAlive module 0x%x, need anim %d, need blur %b need reconfig %b reset type %d"

    const/4 v3, 0x5

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/android/camera/Camera;->mStartControl:Lcom/android/camera/module/loader/StartControl;

    iget v4, v4, Lcom/android/camera/module/loader/StartControl;->mTargetMode:I

    .line 403
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    iget-object v4, p0, Lcom/android/camera/Camera;->mStartControl:Lcom/android/camera/module/loader/StartControl;

    iget v4, v4, Lcom/android/camera/module/loader/StartControl;->mViewConfigType:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x1

    aput-object v4, v3, v5

    iget-object v4, p0, Lcom/android/camera/Camera;->mStartControl:Lcom/android/camera/module/loader/StartControl;

    iget-boolean v4, v4, Lcom/android/camera/module/loader/StartControl;->mNeedBlurAnimation:Z

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    const/4 v5, 0x2

    aput-object v4, v3, v5

    iget-object v4, p0, Lcom/android/camera/Camera;->mStartControl:Lcom/android/camera/module/loader/StartControl;

    iget-boolean v4, v4, Lcom/android/camera/module/loader/StartControl;->mNeedReConfigureCamera:Z

    .line 404
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    const/4 v5, 0x3

    aput-object v4, v3, v5

    iget-object v4, p0, Lcom/android/camera/Camera;->mStartControl:Lcom/android/camera/module/loader/StartControl;

    iget v4, v4, Lcom/android/camera/module/loader/StartControl;->mResetType:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x4

    aput-object v4, v3, v5

    .line 401
    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 405
    iget-object v0, p0, Lcom/android/camera/Camera;->mStartControl:Lcom/android/camera/module/loader/StartControl;

    invoke-direct {p0, v0}, Lcom/android/camera/Camera;->setupCamera(Lcom/android/camera/module/loader/StartControl;)V

    .line 406
    return-void
.end method

.method public onLifeDestroy(Ljava/lang/String;)V
    .locals 3

    .line 415
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onLifeDestroy "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 416
    return-void
.end method

.method public onLifeStart(Ljava/lang/String;)V
    .locals 3

    .line 396
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onLifeStart "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 397
    return-void
.end method

.method public onLifeStop(Ljava/lang/String;)V
    .locals 3

    .line 410
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onLifeStop "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 411
    return-void
.end method

.method public onModeSelected(Lcom/android/camera/module/loader/StartControl;)V
    .locals 9
    .annotation build Landroid/support/annotation/MainThread;
    .end annotation

    .line 1097
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getCurrentModuleIndex()I

    move-result v0

    .line 1098
    iget-object v1, p0, Lcom/android/camera/Camera;->mStartControl:Lcom/android/camera/module/loader/StartControl;

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_0

    move v1, v2

    goto :goto_0

    :cond_0
    move v1, v3

    :goto_0
    iput-boolean v1, p0, Lcom/android/camera/Camera;->mIsModeSwitched:Z

    .line 1099
    invoke-static {p0}, Lcom/android/camera/Util;->isScreenSlideOff(Landroid/content/Context;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/android/camera/Camera;->mIsScreenSlideOff:Z

    .line 1100
    sget-object v1, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    sget-object v4, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v5, "onModeSelected from 0x%x to 0x%x, ScreenSlideOff = %b"

    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Object;

    .line 1101
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v3

    iget v7, p1, Lcom/android/camera/module/loader/StartControl;->mTargetMode:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v2

    const/4 v7, 0x2

    iget-boolean v8, p0, Lcom/android/camera/Camera;->mIsScreenSlideOff:Z

    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    aput-object v8, v6, v7

    .line 1100
    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1102
    const/16 v1, 0xa0

    if-eq v0, v1, :cond_1

    invoke-static {v0}, Lcom/android/camera/statistic/CameraStatUtil;->modeIdToName(I)Ljava/lang/String;

    move-result-object v1

    iget v4, p1, Lcom/android/camera/module/loader/StartControl;->mTargetMode:I

    .line 1103
    invoke-static {v4}, Lcom/android/camera/statistic/CameraStatUtil;->modeIdToName(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 1104
    iget v1, p1, Lcom/android/camera/module/loader/StartControl;->mTargetMode:I

    .line 1105
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v4

    .line 1104
    invoke-static {v0, v1, v4}, Lcom/android/camera/statistic/ScenarioTrackUtil;->trackSwitchModeStart(IIZ)V

    .line 1107
    :cond_1
    invoke-direct {p0}, Lcom/android/camera/Camera;->closeCameraSetup()Z

    .line 1109
    iput-object p1, p0, Lcom/android/camera/Camera;->mStartControl:Lcom/android/camera/module/loader/StartControl;

    .line 1112
    iget v0, p1, Lcom/android/camera/module/loader/StartControl;->mTargetMode:I

    invoke-static {v0}, Lcom/android/camera/module/ModuleManager;->setActiveModuleIndex(I)V

    .line 1113
    iget-boolean v0, p1, Lcom/android/camera/module/loader/StartControl;->mNeedReConfigureCamera:Z

    const/4 v1, 0x0

    if-nez v0, :cond_2

    .line 1114
    iget-object v0, p0, Lcom/android/camera/Camera;->mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

    invoke-virtual {v0, v1, p1, v1}, Lcom/android/camera/fragment/BaseFragmentDelegate;->delegateMode(Lio/reactivex/Completable;Lcom/android/camera/module/loader/StartControl;Lcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;)Lio/reactivex/disposables/Disposable;

    .line 1115
    return-void

    .line 1121
    :cond_2
    iget-object v0, p0, Lcom/android/camera/Camera;->mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

    if-eqz v0, :cond_3

    .line 1122
    iget-object v0, p0, Lcom/android/camera/Camera;->mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

    invoke-virtual {v0}, Lcom/android/camera/fragment/BaseFragmentDelegate;->getAnimationComposite()Lcom/android/camera/animation/AnimationComposite;

    move-result-object v0

    invoke-virtual {v0, v3}, Lcom/android/camera/animation/AnimationComposite;->setClickEnable(Z)V

    .line 1125
    :cond_3
    invoke-virtual {p0, v2}, Lcom/android/camera/Camera;->setSwitchingModule(Z)V

    .line 1127
    invoke-virtual {p0}, Lcom/android/camera/Camera;->isCurrentModuleAlive()Z

    move-result v0

    if-nez v0, :cond_4

    .line 1132
    iput-boolean v3, p1, Lcom/android/camera/module/loader/StartControl;->mNeedBlurAnimation:Z

    .line 1133
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v2, 0x80

    invoke-virtual {v0, v2}, Landroid/view/Window;->clearFlags(I)V

    .line 1137
    :cond_4
    invoke-static {p0}, Lcom/android/camera/ui/V6GestureRecognizer;->getInstance(Lcom/android/camera/ActivityBase;)Lcom/android/camera/ui/V6GestureRecognizer;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/V6GestureRecognizer;->setCurrentModule(Lcom/android/camera/module/Module;)V

    .line 1138
    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    move-object v2, v0

    check-cast v2, Lcom/android/camera/module/BaseModule;

    .line 1139
    if-eqz v2, :cond_5

    .line 1140
    invoke-virtual {v2}, Lcom/android/camera/module/BaseModule;->setDeparted()V

    .line 1142
    :cond_5
    iget v0, p1, Lcom/android/camera/module/loader/StartControl;->mTargetMode:I

    invoke-direct {p0, v0}, Lcom/android/camera/Camera;->createNewModule(I)Lcom/android/camera/module/Module;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    .line 1144
    iget-object v0, p0, Lcom/android/camera/Camera;->mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

    if-nez v0, :cond_6

    .line 1145
    new-instance v0, Lcom/android/camera/fragment/BaseFragmentDelegate;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/BaseFragmentDelegate;-><init>(Lcom/android/camera/Camera;)V

    iput-object v0, p0, Lcom/android/camera/Camera;->mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

    .line 1146
    iget-object v0, p0, Lcom/android/camera/Camera;->mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    iget p1, p1, Lcom/android/camera/module/loader/StartControl;->mTargetMode:I

    invoke-virtual {v0, v1, p1, p0}, Lcom/android/camera/fragment/BaseFragmentDelegate;->init(Landroid/support/v4/app/FragmentManager;ILcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;)V

    goto :goto_1

    .line 1159
    :cond_6
    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    invoke-virtual {v0}, Lcom/android/camera/CameraIntentManager;->checkCallerLegality()Z

    move-result v7

    .line 1160
    new-instance v0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;

    .line 1164
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v4

    const/4 v5, 0x0

    .line 1166
    invoke-virtual {p0}, Lcom/android/camera/Camera;->startFromSecureKeyguard()Z

    move-result v6

    move-object v1, v0

    move-object v3, p1

    invoke-direct/range {v1 .. v7}, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;-><init>(Lcom/android/camera/module/Module;Lcom/android/camera/module/loader/StartControl;Lcom/android/camera/CameraScreenNail;Landroid/content/Intent;ZZ)V

    .line 1160
    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    sget-object v1, Lcom/android/camera/constant/GlobalConstant;->sCameraSetupScheduler:Lio/reactivex/Scheduler;

    .line 1169
    invoke-virtual {v0, v1}, Lio/reactivex/Completable;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Completable;

    move-result-object v0

    .line 1173
    iget-object v1, p0, Lcom/android/camera/Camera;->mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

    invoke-virtual {v1, v0, p1, p0}, Lcom/android/camera/fragment/BaseFragmentDelegate;->delegateMode(Lio/reactivex/Completable;Lcom/android/camera/module/loader/StartControl;Lcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;)Lio/reactivex/disposables/Disposable;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/Camera;->mCameraPendingSetupDisposable:Lio/reactivex/disposables/Disposable;

    .line 1175
    :goto_1
    return-void
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 2

    .line 618
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v1, "onNewIntent start"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 619
    invoke-virtual {p0, p1}, Lcom/android/camera/Camera;->setIntent(Landroid/content/Intent;)V

    .line 620
    invoke-super {p0, p1}, Lcom/android/camera/ActivityBase;->onNewIntent(Landroid/content/Intent;)V

    .line 621
    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    invoke-virtual {v0}, Lcom/android/camera/CameraIntentManager;->destroy()V

    .line 622
    invoke-static {p1}, Lcom/android/camera/CameraIntentManager;->getInstance(Landroid/content/Intent;)Lcom/android/camera/CameraIntentManager;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    .line 623
    iget-object p1, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    invoke-virtual {p1, p0}, Lcom/android/camera/CameraIntentManager;->setReferer(Landroid/app/Activity;)V

    .line 624
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/Camera;->mJumpedToGallery:Z

    .line 626
    sget-object p1, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v0, "onNewIntent end"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 627
    return-void
.end method

.method public onPause()V
    .locals 4

    .line 724
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v1, "onPause start"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 726
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/android/camera/Camera;->mAppStartTime:J

    .line 727
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/Camera;->mActivityPaused:Z

    .line 728
    const/4 v1, 0x0

    iput v1, p0, Lcom/android/camera/Camera;->mPendingScreenSlideKeyCode:I

    .line 729
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    iget-object v3, p0, Lcom/android/camera/Camera;->mScreenSlideStatusObserver:Landroid/database/ContentObserver;

    invoke-virtual {v2, v3}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 730
    invoke-direct {p0, v1}, Lcom/android/camera/Camera;->switchEdgeFingerMode(Z)V

    .line 731
    iget-object v2, p0, Lcom/android/camera/Camera;->mOrientationListener:Lcom/android/camera/Camera$MyOrientationEventListener;

    invoke-virtual {v2}, Lcom/android/camera/Camera$MyOrientationEventListener;->disable()V

    .line 732
    invoke-static {p0}, Lcom/android/camera/AutoLockManager;->getInstance(Landroid/content/Context;)Lcom/android/camera/AutoLockManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/AutoLockManager;->onPause()V

    .line 733
    invoke-direct {p0}, Lcom/android/camera/Camera;->hideHibernationFragment()V

    .line 735
    invoke-direct {p0}, Lcom/android/camera/Camera;->closeCameraSetup()Z

    .line 736
    const/4 v2, -0x1

    invoke-direct {p0, v2}, Lcom/android/camera/Camera;->setBrightnessRampRate(I)V

    .line 737
    invoke-direct {p0, v1}, Lcom/android/camera/Camera;->setScreenEffect(Z)V

    .line 739
    invoke-virtual {p0, v1}, Lcom/android/camera/Camera;->setSwitchingModule(Z)V

    .line 741
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getWindow()Landroid/view/Window;

    move-result-object v2

    const/16 v3, 0x80

    invoke-virtual {v2, v3}, Landroid/view/Window;->clearFlags(I)V

    .line 742
    iget-boolean v2, p0, Lcom/android/camera/Camera;->mDidRegister:Z

    if-eqz v2, :cond_0

    .line 743
    iget-object v2, p0, Lcom/android/camera/Camera;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v2}, Lcom/android/camera/Camera;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 744
    iput-boolean v1, p0, Lcom/android/camera/Camera;->mDidRegister:Z

    .line 746
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/Camera;->unregisterSDReceiver()V

    .line 748
    invoke-super {p0}, Lcom/android/camera/ActivityBase;->onPause()V

    .line 750
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getScreenHint()Lcom/android/camera/ui/ScreenHint;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 751
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getScreenHint()Lcom/android/camera/ui/ScreenHint;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/ui/ScreenHint;->cancelHint()V

    .line 754
    :cond_1
    iget-object v2, p0, Lcom/android/camera/Camera;->mCameraRootView:Lcom/android/camera/ui/CameraRootView;

    if-eqz v2, :cond_2

    .line 755
    iget-object v2, p0, Lcom/android/camera/Camera;->mCameraRootView:Lcom/android/camera/ui/CameraRootView;

    invoke-virtual {v2}, Lcom/android/camera/ui/CameraRootView;->enableTouchEvent()V

    .line 760
    :cond_2
    iget-object v2, p0, Lcom/android/camera/Camera;->mImageSaver:Lcom/android/camera/storage/ImageSaver;

    if-eqz v2, :cond_3

    .line 761
    iget-object v2, p0, Lcom/android/camera/Camera;->mImageSaver:Lcom/android/camera/storage/ImageSaver;

    invoke-virtual {v2}, Lcom/android/camera/storage/ImageSaver;->onHostPause()V

    .line 763
    :cond_3
    invoke-static {}, Lcom/android/camera/statistic/CameraStat;->recordPageEnd()V

    .line 764
    iput-boolean v1, p0, Lcom/android/camera/Camera;->mDelayReleaseCamera:Z

    .line 765
    invoke-virtual {p0}, Lcom/android/camera/Camera;->isGotoGallery()Z

    move-result v2

    if-nez v2, :cond_5

    invoke-direct {p0}, Lcom/android/camera/Camera;->shouldReleaseLater()Z

    move-result v2

    if-eqz v2, :cond_4

    goto :goto_0

    .line 768
    :cond_4
    invoke-virtual {p0, v1, v0}, Lcom/android/camera/Camera;->releaseAll(ZZ)V

    goto :goto_1

    .line 766
    :cond_5
    :goto_0
    iput-boolean v0, p0, Lcom/android/camera/Camera;->mDelayReleaseCamera:Z

    .line 770
    :goto_1
    invoke-virtual {p0}, Lcom/android/camera/Camera;->removeNewBie()V

    .line 771
    invoke-static {}, Lcom/android/camera/ThermalDetector;->getInstance()Lcom/android/camera/ThermalDetector;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/ThermalDetector;->unregisterReceiver()V

    .line 772
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v1, "onPause end"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 773
    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 1

    .line 1329
    invoke-static {}, Lcom/android/camera/permission/PermissionManager;->getCameraRuntimePermissionRequestCode()I

    move-result v0

    if-ne p1, v0, :cond_1

    .line 1331
    invoke-static {p2, p3}, Lcom/android/camera/permission/PermissionManager;->isCameraLaunchPermissionsResultReady([Ljava/lang/String;[I)Z

    move-result p1

    if-nez p1, :cond_0

    .line 1332
    invoke-virtual {p0}, Lcom/android/camera/Camera;->finish()V

    .line 1334
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result p1

    if-nez p1, :cond_1

    invoke-static {p2, p3}, Lcom/android/camera/permission/PermissionManager;->isCameraLocationPermissionsResultReady([Ljava/lang/String;[I)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 1335
    invoke-static {}, Lcom/android/camera/CameraSettings;->isRecordLocation()Z

    move-result p1

    .line 1336
    invoke-static {}, Lcom/android/camera/LocationManager;->instance()Lcom/android/camera/LocationManager;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/android/camera/LocationManager;->recordLocation(Z)V

    .line 1339
    :cond_1
    return-void
.end method

.method protected onRestart()V
    .locals 2

    .line 697
    invoke-super {p0}, Lcom/android/camera/ActivityBase;->onRestart()V

    .line 698
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/Camera;->trackAppLunchTimeStart(Z)V

    .line 699
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/Camera;->mAppStartTime:J

    .line 700
    return-void
.end method

.method public onResume()V
    .locals 5

    .line 631
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v1, "onResume start"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 634
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getKeyguardFlag()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/android/camera/permission/PermissionManager;->checkCameraLaunchPermissions()Z

    move-result v0

    if-nez v0, :cond_0

    .line 635
    invoke-virtual {p0}, Lcom/android/camera/Camera;->finish()V

    .line 638
    :cond_0
    sget-boolean v0, Lcom/android/camera/Util;->sIsFullScreenNavBarHidden:Z

    invoke-static {p0}, Lcom/android/camera/Util;->isFullScreenNavBarHidden(Landroid/content/Context;)Z

    move-result v1

    if-eq v0, v1, :cond_1

    .line 639
    invoke-static {p0}, Lcom/android/camera/Util;->initialize(Landroid/content/Context;)V

    .line 641
    :cond_1
    invoke-static {p0}, Lcom/android/camera/AutoLockManager;->getInstance(Landroid/content/Context;)Lcom/android/camera/AutoLockManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/AutoLockManager;->onResume()V

    .line 642
    iget-object v0, p0, Lcom/android/camera/Camera;->mProximitySensorLock:Lcom/android/camera/ProximitySensorLock;

    if-eqz v0, :cond_2

    .line 643
    iget-object v0, p0, Lcom/android/camera/Camera;->mProximitySensorLock:Lcom/android/camera/ProximitySensorLock;

    invoke-virtual {v0}, Lcom/android/camera/ProximitySensorLock;->onResume()V

    .line 645
    :cond_2
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/android/camera/Util;->SCREEN_SLIDE_STATUS_SETTING_URI:Landroid/net/Uri;

    iget-object v2, p0, Lcom/android/camera/Camera;->mScreenSlideStatusObserver:Landroid/database/ContentObserver;

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3, v2}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 646
    const-string v0, "CameraActivity"

    invoke-static {p0, v0}, Lcom/android/camera/statistic/CameraStat;->recordPageStart(Landroid/content/Context;Ljava/lang/String;)V

    .line 647
    invoke-static {p0}, Lcom/android/camera/Util;->checkLockedOrientation(Landroid/app/Activity;)V

    .line 648
    iput-boolean v3, p0, Lcom/android/camera/Camera;->mActivityPaused:Z

    .line 649
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/android/camera/Camera;->switchEdgeFingerMode(Z)V

    .line 650
    iput-boolean v3, p0, Lcom/android/camera/Camera;->mFirstOrientationArrived:Z

    .line 651
    iget-object v1, p0, Lcom/android/camera/Camera;->mOrientationListener:Lcom/android/camera/Camera$MyOrientationEventListener;

    invoke-virtual {v1}, Lcom/android/camera/Camera$MyOrientationEventListener;->enable()V

    .line 653
    invoke-super {p0}, Lcom/android/camera/ActivityBase;->onResume()V

    .line 656
    invoke-static {p0}, Lcom/android/camera/storage/Storage;->initStorage(Landroid/content/Context;)V

    .line 659
    invoke-static {}, Lcom/android/camera/storage/Storage;->isUseDocumentMode()Z

    move-result v1

    if-eqz v1, :cond_4

    sget-object v1, Lcom/android/camera/storage/Storage;->DIRECTORY:Ljava/lang/String;

    invoke-static {v1}, Lcom/android/camera/FileCompat;->hasStoragePermission(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 660
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getKeyguardFlag()Z

    move-result v1

    if-nez v1, :cond_3

    .line 661
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v1, "start request documents permission"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 662
    sget-object v0, Lcom/android/camera/storage/Storage;->DIRECTORY:Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/android/camera/FileCompat;->getStorageAccessForLOLLIPOP(Landroid/app/Activity;Ljava/lang/String;)Z

    .line 663
    return-void

    .line 666
    :cond_3
    sget-object v1, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "documents permission not granted, getKeyguardFlag = "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getKeyguardFlag()Z

    move-result v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 667
    invoke-static {v3}, Lcom/android/camera/storage/PriorityStorageBroadcastReceiver;->setPriorityStorage(Z)V

    .line 670
    :cond_4
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getScreenHint()Lcom/android/camera/ui/ScreenHint;

    move-result-object v1

    if-eqz v1, :cond_5

    .line 671
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getScreenHint()Lcom/android/camera/ui/ScreenHint;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/ui/ScreenHint;->updateHint()V

    .line 674
    :cond_5
    invoke-direct {p0}, Lcom/android/camera/Camera;->registerReceiver()V

    .line 675
    invoke-direct {p0}, Lcom/android/camera/Camera;->registerSDReceiver()V

    .line 676
    invoke-direct {p0}, Lcom/android/camera/Camera;->resumeCamera()V

    .line 677
    iput-boolean v3, p0, Lcom/android/camera/Camera;->mIsModeSwitched:Z

    .line 679
    invoke-static {}, Lcom/android/camera/ThermalDetector;->getInstance()Lcom/android/camera/ThermalDetector;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/ThermalDetector;->registerReceiver()V

    .line 685
    iget-object v1, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    invoke-virtual {v1}, Lcom/android/camera/CameraIntentManager;->isImageCaptureIntent()Z

    move-result v1

    if-nez v1, :cond_7

    iget-object v1, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    .line 686
    invoke-virtual {v1}, Lcom/android/camera/CameraIntentManager;->isVideoCaptureIntent()Z

    move-result v1

    if-eqz v1, :cond_6

    goto :goto_0

    .line 687
    :cond_6
    move v0, v3

    goto :goto_1

    .line 686
    :cond_7
    :goto_0
    nop

    .line 687
    :goto_1
    iget-object v1, p0, Lcom/android/camera/Camera;->mImageSaver:Lcom/android/camera/storage/ImageSaver;

    if-nez v1, :cond_8

    .line 688
    new-instance v1, Lcom/android/camera/storage/ImageSaver;

    iget-object v2, p0, Lcom/android/camera/Camera;->mHandler:Landroid/os/Handler;

    invoke-direct {v1, p0, v2, v0}, Lcom/android/camera/storage/ImageSaver;-><init>(Lcom/android/camera/ActivityBase;Landroid/os/Handler;Z)V

    iput-object v1, p0, Lcom/android/camera/Camera;->mImageSaver:Lcom/android/camera/storage/ImageSaver;

    .line 690
    :cond_8
    iget-object v1, p0, Lcom/android/camera/Camera;->mImageSaver:Lcom/android/camera/storage/ImageSaver;

    invoke-virtual {v1, v0}, Lcom/android/camera/storage/ImageSaver;->onHostResume(Z)V

    .line 691
    invoke-direct {p0}, Lcom/android/camera/Camera;->bindServices()V

    .line 692
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v1, "onResume end"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 693
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 1

    .line 705
    sget-object p1, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v0, "onSaveInstanceState"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 706
    return-void
.end method

.method public onStop()V
    .locals 2

    .line 777
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v1, "onStop start"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 778
    invoke-super {p0}, Lcom/android/camera/ActivityBase;->onStop()V

    .line 779
    iget-boolean v0, p0, Lcom/android/camera/Camera;->mDelayReleaseCamera:Z

    if-eqz v0, :cond_2

    .line 780
    invoke-virtual {p0}, Lcom/android/camera/Camera;->isGotoGallery()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/Camera;->isSelectingCapturedVideo()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 783
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/Camera;->isPostProcessing()Z

    move-result v0

    if-nez v0, :cond_2

    .line 784
    iput-boolean v1, p0, Lcom/android/camera/Camera;->mDelayReleaseCamera:Z

    .line 785
    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0}, Lcom/android/camera/module/Module;->onHostStopAndNotifyActionStop()V

    goto :goto_1

    .line 781
    :cond_1
    :goto_0
    iput-boolean v1, p0, Lcom/android/camera/Camera;->mDelayReleaseCamera:Z

    .line 782
    const/4 v0, 0x1

    invoke-virtual {p0, v0, v0}, Lcom/android/camera/Camera;->releaseAll(ZZ)V

    .line 789
    :cond_2
    :goto_1
    invoke-direct {p0}, Lcom/android/camera/Camera;->unbindServices()V

    .line 790
    invoke-direct {p0}, Lcom/android/camera/Camera;->boostParallelServiceAdj()V

    .line 792
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc4

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$FullScreenProtocol;

    .line 793
    if-eqz v0, :cond_3

    .line 794
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$FullScreenProtocol;->hideScreenLight()V

    .line 796
    :cond_3
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v1, "onStop end"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 797
    return-void
.end method

.method public onUserInteraction()V
    .locals 2

    .line 1081
    invoke-super {p0}, Lcom/android/camera/ActivityBase;->onUserInteraction()V

    .line 1082
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v1, "onUserInteraction"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1083
    invoke-static {p0}, Lcom/android/camera/AutoLockManager;->getInstance(Landroid/content/Context;)Lcom/android/camera/AutoLockManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/AutoLockManager;->onUserInteraction()V

    .line 1084
    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    if-eqz v0, :cond_0

    .line 1085
    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0}, Lcom/android/camera/module/Module;->onUserInteraction()V

    .line 1087
    :cond_0
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 3

    .line 1029
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onWindowFocusChanged hasFocus->"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1030
    iput-boolean p1, p0, Lcom/android/camera/Camera;->mHasFocus:Z

    .line 1031
    invoke-super {p0, p1}, Lcom/android/camera/ActivityBase;->onWindowFocusChanged(Z)V

    .line 1032
    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    if-nez v0, :cond_0

    .line 1033
    return-void

    .line 1035
    :cond_0
    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0, p1}, Lcom/android/camera/module/Module;->onWindowFocusChanged(Z)V

    .line 1036
    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraBrightness:Lcom/android/camera/CameraBrightness;

    if-eqz v0, :cond_1

    .line 1037
    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraBrightness:Lcom/android/camera/CameraBrightness;

    invoke-virtual {v0, p1}, Lcom/android/camera/CameraBrightness;->onWindowFocusChanged(Z)V

    .line 1040
    :cond_1
    if-eqz p1, :cond_2

    .line 1041
    invoke-static {p0}, Lcom/android/camera/Util;->checkLockedOrientation(Landroid/app/Activity;)V

    .line 1042
    iget-object p1, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {p1}, Lcom/android/camera/module/Module;->checkActivityOrientation()V

    .line 1043
    iget-object p1, p0, Lcom/android/camera/Camera;->mSensorStateManager:Lcom/android/camera/SensorStateManager;

    if-eqz p1, :cond_3

    .line 1044
    iget-object p1, p0, Lcom/android/camera/Camera;->mSensorStateManager:Lcom/android/camera/SensorStateManager;

    invoke-virtual {p1}, Lcom/android/camera/SensorStateManager;->register()V

    goto :goto_0

    .line 1048
    :cond_2
    iget-object p1, p0, Lcom/android/camera/Camera;->mSensorStateManager:Lcom/android/camera/SensorStateManager;

    if-eqz p1, :cond_3

    .line 1049
    iget-object p1, p0, Lcom/android/camera/Camera;->mSensorStateManager:Lcom/android/camera/SensorStateManager;

    const/16 v0, 0xf

    invoke-virtual {p1, v0}, Lcom/android/camera/SensorStateManager;->unregister(I)V

    .line 1052
    :cond_3
    :goto_0
    return-void
.end method

.method public pause()V
    .locals 1

    .line 717
    invoke-virtual {p0}, Lcom/android/camera/Camera;->isVideoRecording()Z

    move-result v0

    if-nez v0, :cond_0

    .line 718
    invoke-super {p0}, Lcom/android/camera/ActivityBase;->pause()V

    .line 720
    :cond_0
    return-void
.end method

.method public registerProtocol()V
    .locals 11

    .line 357
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->forceDestroy()V

    .line 358
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    invoke-static {v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->create(I)V

    .line 359
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    invoke-static {v0}, Lcom/android/camera/EffectChangedListenerController;->setHoldKey(I)V

    .line 361
    new-instance v0, Lcom/android/camera/module/impl/ImplFactory;

    invoke-direct {v0}, Lcom/android/camera/module/impl/ImplFactory;-><init>()V

    iput-object v0, p0, Lcom/android/camera/Camera;->mImplFactory:Lcom/android/camera/module/impl/ImplFactory;

    .line 362
    iget-object v0, p0, Lcom/android/camera/Camera;->mImplFactory:Lcom/android/camera/module/impl/ImplFactory;

    const/4 v1, 0x1

    new-array v2, v1, [I

    const/4 v3, 0x0

    const/16 v4, 0xab

    aput v4, v2, v3

    invoke-virtual {v0, p0, v2}, Lcom/android/camera/module/impl/ImplFactory;->initBase(Lcom/android/camera/ActivityBase;[I)V

    .line 364
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    .line 365
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getCameraIntentManager()Lcom/android/camera/CameraIntentManager;

    .line 366
    iget-object v2, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    invoke-virtual {v2}, Lcom/android/camera/CameraIntentManager;->checkCallerLegality()Z

    move-result v2

    .line 367
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getIntent()Landroid/content/Intent;

    move-result-object v6

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    invoke-virtual {p0}, Lcom/android/camera/Camera;->startFromSecureKeyguard()Z

    move-result v8

    const/4 v9, 0x0

    const/4 v10, 0x1

    move-object v5, v0

    invoke-virtual/range {v5 .. v10}, Lcom/android/camera/data/data/global/DataItemGlobal;->parseIntent(Landroid/content/Intent;Ljava/lang/Boolean;ZZZ)Landroid/support/v4/util/Pair;

    .line 368
    nop

    .line 369
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->isTimeOut()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 370
    const/4 v1, 0x2

    .line 372
    :cond_0
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v0

    invoke-static {v0}, Lcom/android/camera/module/loader/StartControl;->create(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/android/camera/module/loader/StartControl;->setResetType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/camera/Camera;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    .line 373
    return-void
.end method

.method public releaseAll(ZZ)V
    .locals 2

    .line 885
    sget-object p1, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "releaseAll: releaseDevice = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", isCurrentModuleAlive = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 886
    invoke-virtual {p0}, Lcom/android/camera/Camera;->isCurrentModuleAlive()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 885
    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 887
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/Camera;->mDelayReleaseCamera:Z

    .line 896
    iget-object p1, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    if-eqz p1, :cond_0

    .line 897
    iget-object p1, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {p1}, Lcom/android/camera/module/Module;->setDeparted()V

    .line 900
    :cond_0
    sget-object p1, Lcom/android/camera/constant/GlobalConstant;->sCameraSetupScheduler:Lio/reactivex/Scheduler;

    new-instance v0, Lcom/android/camera/Camera$5;

    invoke-direct {v0, p0, p2}, Lcom/android/camera/Camera$5;-><init>(Lcom/android/camera/Camera;Z)V

    invoke-virtual {p1, v0}, Lio/reactivex/Scheduler;->scheduleDirect(Ljava/lang/Runnable;)Lio/reactivex/disposables/Disposable;

    .line 935
    return-void
.end method

.method protected releaseCameraScreenNail()V
    .locals 0

    .line 526
    invoke-super {p0}, Lcom/android/camera/ActivityBase;->releaseCameraScreenNail()V

    .line 527
    return-void
.end method

.method public removeNewBie()V
    .locals 3

    .line 1456
    nop

    .line 1457
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v0

    .line 1458
    iget-object v1, p0, Lcom/android/camera/Camera;->newbieDialogFragmentTag:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 1459
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    iget-object v2, p0, Lcom/android/camera/Camera;->newbieDialogFragmentTag:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v1

    .line 1460
    if-eqz v1, :cond_0

    .line 1461
    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentTransaction;->remove(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    .line 1464
    :cond_0
    invoke-virtual {v0}, Landroid/support/v4/app/FragmentTransaction;->commitAllowingStateLoss()I

    .line 1465
    return-void
.end method

.method public restoreWindowBrightness()V
    .locals 2

    .line 1577
    nop

    .line 1578
    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraBrightness:Lcom/android/camera/CameraBrightness;

    if-eqz v0, :cond_0

    .line 1579
    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraBrightness:Lcom/android/camera/CameraBrightness;

    invoke-virtual {v0}, Lcom/android/camera/CameraBrightness;->getCurrentBrightness()I

    move-result v0

    .line 1580
    if-lez v0, :cond_0

    .line 1581
    int-to-float v0, v0

    const/high16 v1, 0x437f0000    # 255.0f

    div-float/2addr v0, v1

    goto :goto_0

    .line 1584
    :cond_0
    const/high16 v0, -0x40800000    # -1.0f

    :goto_0
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    .line 1585
    iput v0, v1, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    .line 1586
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 1587
    const/4 v0, -0x1

    invoke-direct {p0, v0}, Lcom/android/camera/Camera;->setBrightnessRampRate(I)V

    .line 1588
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/camera/Camera;->setScreenEffect(Z)V

    .line 1589
    return-void
.end method

.method public resume()V
    .locals 1

    .line 710
    invoke-virtual {p0}, Lcom/android/camera/Camera;->isVideoRecording()Z

    move-result v0

    if-nez v0, :cond_0

    .line 711
    invoke-super {p0}, Lcom/android/camera/ActivityBase;->resume()V

    .line 713
    :cond_0
    return-void
.end method

.method public resumeCurrentMode(I)V
    .locals 3

    .line 501
    invoke-direct {p0}, Lcom/android/camera/Camera;->closeCameraSetup()Z

    .line 502
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/Camera;->setSwitchingModule(Z)V

    .line 503
    new-instance v0, Lcom/android/camera/module/loader/FunctionCameraLegacySetup;

    invoke-direct {v0, p1}, Lcom/android/camera/module/loader/FunctionCameraLegacySetup;-><init>(I)V

    .line 505
    new-instance v1, Lcom/android/camera/module/loader/FunctionResumeModule;

    invoke-direct {v1, p1}, Lcom/android/camera/module/loader/FunctionResumeModule;-><init>(I)V

    .line 507
    iget-object p1, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    check-cast p1, Lcom/android/camera/module/BaseModule;

    .line 508
    invoke-static {p1}, Lcom/android/camera/module/loader/NullHolder;->ofNullable(Ljava/lang/Object;)Lcom/android/camera/module/loader/NullHolder;

    move-result-object p1

    invoke-static {p1}, Lio/reactivex/Single;->just(Ljava/lang/Object;)Lio/reactivex/Single;

    move-result-object p1

    sget-object v2, Lcom/android/camera/constant/GlobalConstant;->sCameraSetupScheduler:Lio/reactivex/Scheduler;

    .line 509
    invoke-virtual {p1, v2}, Lio/reactivex/Single;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Single;

    move-result-object p1

    .line 510
    invoke-virtual {p1, v0}, Lio/reactivex/Single;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Single;

    move-result-object p1

    .line 512
    iget-object v0, p0, Lcom/android/camera/Camera;->mCamera2OpenOnSubScribe:Lcom/android/camera/module/loader/camera2/Camera2OpenOnSubScribe;

    .line 513
    invoke-static {v0}, Lio/reactivex/Single;->create(Lio/reactivex/SingleOnSubscribe;)Lio/reactivex/Single;

    move-result-object v0

    sget-object v2, Lcom/android/camera/constant/GlobalConstant;->sCameraSetupScheduler:Lio/reactivex/Scheduler;

    .line 514
    invoke-virtual {v0, v2}, Lio/reactivex/Single;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Single;

    move-result-object v0

    .line 516
    iget-object v2, p0, Lcom/android/camera/Camera;->mCameraOpenResult:Lio/reactivex/functions/BiFunction;

    invoke-virtual {p1, v0, v2}, Lio/reactivex/Single;->zipWith(Lio/reactivex/SingleSource;Lio/reactivex/functions/BiFunction;)Lio/reactivex/Single;

    move-result-object p1

    .line 518
    invoke-virtual {p1, v1}, Lio/reactivex/Single;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Single;

    move-result-object p1

    .line 519
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Single;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Single;

    move-result-object p1

    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraSetupConsumer:Lio/reactivex/functions/Consumer;

    .line 520
    invoke-virtual {p1, v0}, Lio/reactivex/Single;->subscribe(Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/Camera;->mCameraSetupDisposable:Lio/reactivex/disposables/Disposable;

    .line 521
    return-void
.end method

.method public setBlockingLifeCycles(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 392
    return-void
.end method

.method public setWindowBrightness(I)V
    .locals 2

    .line 1569
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/camera/Camera;->setBrightnessRampRate(I)V

    .line 1570
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/android/camera/Camera;->setScreenEffect(Z)V

    .line 1571
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    .line 1572
    int-to-float p1, p1

    const/high16 v1, 0x437f0000    # 255.0f

    div-float/2addr p1, v1

    iput p1, v0, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    .line 1573
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 1574
    return-void
.end method

.method public showLensDirtyDetectedHint()V
    .locals 3

    .line 1683
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fG()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1684
    iget-object v0, p0, Lcom/android/camera/Camera;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/camera/Camera$12;

    invoke-direct {v1, p0}, Lcom/android/camera/Camera$12;-><init>(Lcom/android/camera/Camera;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 1699
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    const-string v1, "LensDirtyDetectDialog"

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    .line 1700
    if-nez v0, :cond_1

    .line 1701
    new-instance v0, Lcom/android/camera/fragment/dialog/LensDirtyDetectDialogFragment;

    invoke-direct {v0}, Lcom/android/camera/fragment/dialog/LensDirtyDetectDialogFragment;-><init>()V

    .line 1702
    const/4 v1, 0x2

    const v2, 0x7f0c001f

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/app/DialogFragment;->setStyle(II)V

    .line 1703
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    const-string v2, "LensDirtyDetectDialog"

    .line 1704
    invoke-virtual {v1, v0, v2}, Landroid/support/v4/app/FragmentTransaction;->add(Landroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object v0

    .line 1705
    invoke-virtual {v0}, Landroid/support/v4/app/FragmentTransaction;->commitAllowingStateLoss()I

    .line 1708
    :cond_1
    :goto_0
    return-void
.end method

.method public showNewBie(I)Z
    .locals 5

    .line 1367
    const v0, 0x7f0c001e

    const/4 v1, 0x2

    const-wide/16 v2, 0x1f4

    const/4 v4, 0x1

    packed-switch p1, :pswitch_data_0

    .line 1430
    const/4 p1, 0x0

    return p1

    .line 1408
    :pswitch_0
    iget-object p1, p0, Lcom/android/camera/Camera;->mHandler:Landroid/os/Handler;

    new-instance v0, Lcom/android/camera/Camera$7;

    invoke-direct {v0, p0}, Lcom/android/camera/Camera$7;-><init>(Lcom/android/camera/Camera;)V

    invoke-virtual {p1, v0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1426
    return v4

    .line 1387
    :pswitch_1
    iget-object p1, p0, Lcom/android/camera/Camera;->mHandler:Landroid/os/Handler;

    new-instance v0, Lcom/android/camera/Camera$6;

    invoke-direct {v0, p0}, Lcom/android/camera/Camera$6;-><init>(Lcom/android/camera/Camera;)V

    invoke-virtual {p1, v0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1405
    return v4

    .line 1378
    :pswitch_2
    new-instance p1, Lcom/android/camera/fragment/dialog/FrontRotateNewbieDialogFragment;

    invoke-direct {p1}, Lcom/android/camera/fragment/dialog/FrontRotateNewbieDialogFragment;-><init>()V

    .line 1379
    invoke-virtual {p1, v1, v0}, Landroid/support/v4/app/DialogFragment;->setStyle(II)V

    .line 1380
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v0

    const-string v1, "RotateHint"

    .line 1381
    invoke-virtual {v0, p1, v1}, Landroid/support/v4/app/FragmentTransaction;->add(Landroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object p1

    .line 1382
    invoke-virtual {p1}, Landroid/support/v4/app/FragmentTransaction;->commitAllowingStateLoss()I

    .line 1383
    const-string p1, "RotateHint"

    iput-object p1, p0, Lcom/android/camera/Camera;->newbieDialogFragmentTag:Ljava/lang/String;

    .line 1384
    return v4

    .line 1369
    :pswitch_3
    new-instance p1, Lcom/android/camera/fragment/dialog/PortraitNewbieDialogFragment;

    invoke-direct {p1}, Lcom/android/camera/fragment/dialog/PortraitNewbieDialogFragment;-><init>()V

    .line 1370
    invoke-virtual {p1, v1, v0}, Landroid/support/v4/app/DialogFragment;->setStyle(II)V

    .line 1371
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v0

    const-string v1, "PortraitHint"

    .line 1372
    invoke-virtual {v0, p1, v1}, Landroid/support/v4/app/FragmentTransaction;->add(Landroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object p1

    .line 1373
    invoke-virtual {p1}, Landroid/support/v4/app/FragmentTransaction;->commitAllowingStateLoss()I

    .line 1374
    const-string p1, "PortraitHint"

    iput-object p1, p0, Lcom/android/camera/Camera;->newbieDialogFragmentTag:Ljava/lang/String;

    .line 1375
    return v4

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public unRegisterProtocol()V
    .locals 1

    .line 377
    iget-object v0, p0, Lcom/android/camera/Camera;->mImplFactory:Lcom/android/camera/module/impl/ImplFactory;

    if-eqz v0, :cond_0

    .line 378
    iget-object v0, p0, Lcom/android/camera/Camera;->mImplFactory:Lcom/android/camera/module/impl/ImplFactory;

    invoke-virtual {v0}, Lcom/android/camera/module/impl/ImplFactory;->release()V

    .line 381
    :cond_0
    iget-object v0, p0, Lcom/android/camera/Camera;->mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

    if-eqz v0, :cond_1

    .line 382
    iget-object v0, p0, Lcom/android/camera/Camera;->mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

    invoke-virtual {v0}, Lcom/android/camera/fragment/BaseFragmentDelegate;->unRegisterProtocol()V

    .line 383
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/Camera;->mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

    .line 385
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    invoke-static {v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->destroyAll(I)V

    .line 386
    return-void
.end method

.method public declared-synchronized updateSurfaceState(I)V
    .locals 1

    monitor-enter p0

    .line 1469
    :try_start_0
    invoke-super {p0, p1}, Lcom/android/camera/ActivityBase;->updateSurfaceState(I)V

    .line 1471
    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    .line 1472
    iget-object p1, p0, Lcom/android/camera/Camera;->mCamera2OpenOnSubScribe:Lcom/android/camera/module/loader/camera2/Camera2OpenOnSubScribe;

    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/Camera2OpenOnSubScribe;->onGlSurfaceCreated()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1474
    :cond_0
    monitor-exit p0

    return-void

    .line 1468
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
