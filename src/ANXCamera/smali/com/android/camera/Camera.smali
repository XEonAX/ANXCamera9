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

.field private mCameraPendingSetupDisposableGuard:Ljava/lang/Object;

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

.field private mCameraSetupDisposableGuard:Ljava/lang/Object;

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

    .line 119
    const-class v0, Lcom/android/camera/Camera;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 115
    invoke-direct {p0}, Lcom/android/camera/ActivityBase;-><init>()V

    .line 123
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/android/camera/Camera;->mLastKeyEventTime:J

    .line 124
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera/Camera;->mLastIgnoreKey:I

    .line 140
    new-instance v0, Lcom/android/camera/Camera$1;

    invoke-direct {v0, p0}, Lcom/android/camera/Camera$1;-><init>(Lcom/android/camera/Camera;)V

    iput-object v0, p0, Lcom/android/camera/Camera;->tickerRunnable:Ljava/lang/Runnable;

    .line 153
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/camera/Camera;->mCameraSetupDisposableGuard:Ljava/lang/Object;

    .line 155
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/camera/Camera;->mCameraPendingSetupDisposableGuard:Ljava/lang/Object;

    .line 159
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/Camera;->newbieDialogFragmentTag:Ljava/lang/String;

    .line 162
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/Camera;->mIsGalleryServiceBound:Z

    .line 167
    new-instance v0, Lcom/android/camera/Camera$2;

    invoke-direct {v0, p0}, Lcom/android/camera/Camera$2;-><init>(Lcom/android/camera/Camera;)V

    iput-object v0, p0, Lcom/android/camera/Camera;->mCameraSetupConsumer:Lio/reactivex/functions/Consumer;

    .line 190
    new-instance v0, Lcom/android/camera/Camera$3;

    invoke-direct {v0, p0}, Lcom/android/camera/Camera$3;-><init>(Lcom/android/camera/Camera;)V

    iput-object v0, p0, Lcom/android/camera/Camera;->mCameraOpenResult:Lio/reactivex/functions/BiFunction;

    .line 214
    new-instance v0, Lcom/android/camera/Camera$4;

    iget-object v1, p0, Lcom/android/camera/Camera;->mHandler:Landroid/os/Handler;

    invoke-direct {v0, p0, v1}, Lcom/android/camera/Camera$4;-><init>(Lcom/android/camera/Camera;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/android/camera/Camera;->mScreenSlideStatusObserver:Landroid/database/ContentObserver;

    .line 1560
    new-instance v0, Lcom/android/camera/Camera$8;

    invoke-direct {v0, p0}, Lcom/android/camera/Camera$8;-><init>(Lcom/android/camera/Camera;)V

    iput-object v0, p0, Lcom/android/camera/Camera;->mServiceConnection:Landroid/content/ServiceConnection;

    .line 1649
    new-instance v0, Lcom/android/camera/Camera$10;

    invoke-direct {v0, p0}, Lcom/android/camera/Camera$10;-><init>(Lcom/android/camera/Camera;)V

    iput-object v0, p0, Lcom/android/camera/Camera;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 1667
    new-instance v0, Lcom/android/camera/Camera$11;

    invoke-direct {v0, p0}, Lcom/android/camera/Camera$11;-><init>(Lcom/android/camera/Camera;)V

    iput-object v0, p0, Lcom/android/camera/Camera;->mSDReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/Camera;)I
    .locals 0

    .line 115
    iget p0, p0, Lcom/android/camera/Camera;->mTick:I

    return p0
.end method

.method static synthetic access$002(Lcom/android/camera/Camera;I)I
    .locals 0

    .line 115
    iput p1, p0, Lcom/android/camera/Camera;->mTick:I

    return p1
.end method

.method static synthetic access$100(Lcom/android/camera/Camera;I)V
    .locals 0

    .line 115
    invoke-direct {p0, p1}, Lcom/android/camera/Camera;->showCameraError(I)V

    return-void
.end method

.method static synthetic access$1100(Lcom/android/camera/Camera;)Ljava/lang/Runnable;
    .locals 0

    .line 115
    iget-object p0, p0, Lcom/android/camera/Camera;->tickerRunnable:Ljava/lang/Runnable;

    return-object p0
.end method

.method static synthetic access$1200(Lcom/android/camera/Camera;I)V
    .locals 0

    .line 115
    invoke-direct {p0, p1}, Lcom/android/camera/Camera;->setBrightnessRampRate(I)V

    return-void
.end method

.method static synthetic access$1300(Lcom/android/camera/Camera;Z)V
    .locals 0

    .line 115
    invoke-direct {p0, p1}, Lcom/android/camera/Camera;->setScreenEffect(Z)V

    return-void
.end method

.method static synthetic access$1402(Lcom/android/camera/Camera;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 115
    iput-object p1, p0, Lcom/android/camera/Camera;->newbieDialogFragmentTag:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$200(Lcom/android/camera/Camera;)Ljava/lang/Object;
    .locals 0

    .line 115
    iget-object p0, p0, Lcom/android/camera/Camera;->mCameraSetupDisposableGuard:Ljava/lang/Object;

    return-object p0
.end method

.method static synthetic access$302(Lcom/android/camera/Camera;Lio/reactivex/disposables/Disposable;)Lio/reactivex/disposables/Disposable;
    .locals 0

    .line 115
    iput-object p1, p0, Lcom/android/camera/Camera;->mCameraSetupDisposable:Lio/reactivex/disposables/Disposable;

    return-object p1
.end method

.method static synthetic access$400(Lcom/android/camera/Camera;)V
    .locals 0

    .line 115
    invoke-direct {p0}, Lcom/android/camera/Camera;->showFirstUseHintIfNeeded()V

    return-void
.end method

.method static synthetic access$500()Ljava/lang/String;
    .locals 1

    .line 115
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$600(Lcom/android/camera/Camera;)Z
    .locals 0

    .line 115
    iget-boolean p0, p0, Lcom/android/camera/Camera;->mHasFocus:Z

    return p0
.end method

.method static synthetic access$700(Lcom/android/camera/Camera;)Z
    .locals 0

    .line 115
    iget-boolean p0, p0, Lcom/android/camera/Camera;->mFirstOrientationArrived:Z

    return p0
.end method

.method static synthetic access$702(Lcom/android/camera/Camera;Z)Z
    .locals 0

    .line 115
    iput-boolean p1, p0, Lcom/android/camera/Camera;->mFirstOrientationArrived:Z

    return p1
.end method

.method static synthetic access$800(Lcom/android/camera/Camera;)V
    .locals 0

    .line 115
    invoke-direct {p0}, Lcom/android/camera/Camera;->onDisplayRotationChanged()V

    return-void
.end method

.method static synthetic access$900(Lcom/android/camera/Camera;)Lcom/android/camera/fragment/BaseFragmentDelegate;
    .locals 0

    .line 115
    iget-object p0, p0, Lcom/android/camera/Camera;->mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

    return-object p0
.end method

.method private bindServices()V
    .locals 3

    .line 1572
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.miui.gallery.action.BIND_SERVICE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1573
    const-string v1, "com.miui.gallery"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 1574
    iget-object v1, p0, Lcom/android/camera/Camera;->mServiceConnection:Landroid/content/ServiceConnection;

    const/4 v2, 0x5

    invoke-virtual {p0, v0, v1, v2}, Lcom/android/camera/Camera;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    .line 1575
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/Camera;->mIsGalleryServiceBound:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1578
    goto :goto_0

    .line 1576
    :catch_0
    move-exception v0

    .line 1577
    sget-object v1, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v2, "bindServices error."

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1579
    :goto_0
    return-void
.end method

.method private boostParallelServiceAdj()V
    .locals 9

    .line 826
    invoke-static {}, Lcom/android/camera/CameraSettings;->isCameraParallelProcessEnable()Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    check-cast v0, Lcom/android/camera/module/BaseModule;

    .line 827
    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->isPortraitMode()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    .line 828
    invoke-virtual {v0}, Lcom/android/camera/CameraIntentManager;->isImageCaptureIntent()Z

    move-result v0

    if-nez v0, :cond_0

    .line 829
    move v0, v1

    goto :goto_0

    .line 828
    :cond_0
    nop

    .line 829
    move v0, v2

    :goto_0
    if-nez v0, :cond_1

    .line 830
    return-void

    .line 833
    :cond_1
    invoke-static {}, Lcom/android/camera/parallel/AlgoConnector;->getInstance()Lcom/android/camera/parallel/AlgoConnector;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/parallel/AlgoConnector;->getLocalBinder()Lcom/android/camera/LocalParallelService$LocalBinder;

    move-result-object v0

    .line 834
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lcom/android/camera/LocalParallelService$LocalBinder;->isIdle()Z

    move-result v0

    if-nez v0, :cond_2

    .line 836
    :try_start_0
    const-string v0, "miui.process.ProcessManager"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 837
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

    .line 839
    const/4 v3, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    const-string v5, "com.android.camera"

    aput-object v5, v4, v2

    .line 840
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

    .line 839
    invoke-virtual {v0, v3, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    .line 844
    goto :goto_1

    .line 841
    :catch_0
    move-exception v0

    .line 843
    sget-object v1, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/ReflectiveOperationException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 846
    :cond_2
    :goto_1
    return-void
.end method

.method private closeCameraSetup()Z
    .locals 3

    .line 1396
    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraPendingSetupDisposableGuard:Ljava/lang/Object;

    monitor-enter v0

    .line 1397
    :try_start_0
    iget-object v1, p0, Lcom/android/camera/Camera;->mCameraPendingSetupDisposable:Lio/reactivex/disposables/Disposable;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/camera/Camera;->mCameraPendingSetupDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v1}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1398
    iget-object v1, p0, Lcom/android/camera/Camera;->mCameraPendingSetupDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v1}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 1399
    iput-object v2, p0, Lcom/android/camera/Camera;->mCameraPendingSetupDisposable:Lio/reactivex/disposables/Disposable;

    .line 1401
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 1403
    iget-object v1, p0, Lcom/android/camera/Camera;->mCameraSetupDisposableGuard:Ljava/lang/Object;

    monitor-enter v1

    .line 1404
    :try_start_1
    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraSetupDisposable:Lio/reactivex/disposables/Disposable;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraSetupDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1405
    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraSetupDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 1406
    iput-object v2, p0, Lcom/android/camera/Camera;->mCameraSetupDisposable:Lio/reactivex/disposables/Disposable;

    .line 1407
    const/4 v0, 0x1

    monitor-exit v1

    return v0

    .line 1409
    :cond_1
    monitor-exit v1

    .line 1410
    const/4 v0, 0x0

    return v0

    .line 1409
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 1401
    :catchall_1
    move-exception v1

    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v1
.end method

.method private createNewModule(I)Lcom/android/camera/module/Module;
    .locals 3

    .line 901
    invoke-static {p1}, Lcom/android/camera/module/ModuleManager;->getModuleByIndex(I)Lcom/android/camera/module/Module;

    move-result-object v0

    .line 902
    if-eqz v0, :cond_0

    .line 905
    invoke-interface {v0, p0}, Lcom/android/camera/module/Module;->setActivity(Lcom/android/camera/Camera;)V

    .line 906
    iget p1, p0, Lcom/android/camera/Camera;->mOrientation:I

    iget v1, p0, Lcom/android/camera/Camera;->mOrientationCompensation:I

    invoke-interface {v0, p1, v1}, Lcom/android/camera/module/Module;->preTransferOrientation(II)V

    .line 907
    return-object v0

    .line 903
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

    .line 429
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

    .line 1734
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    const-string v1, "Hibernation"

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    .line 1735
    if-eqz v0, :cond_0

    instance-of v1, v0, Landroid/support/v4/app/DialogFragment;

    if-eqz v1, :cond_0

    .line 1736
    check-cast v0, Landroid/support/v4/app/DialogFragment;

    invoke-virtual {v0}, Landroid/support/v4/app/DialogFragment;->dismissAllowingStateLoss()V

    .line 1738
    :cond_0
    return-void
.end method

.method private isFromKeyguard()Z
    .locals 3

    .line 572
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 573
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 574
    return v1

    .line 576
    :cond_0
    invoke-virtual {v0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 577
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

    .line 1245
    invoke-static {}, Lcom/mi/config/b;->hL()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1246
    return-void

    .line 1248
    :cond_0
    nop

    .line 1249
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    const-string v1, "RotateHint"

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/android/camera/fragment/dialog/FrontRotateNewbieDialogFragment;

    .line 1250
    if-eqz v0, :cond_1

    .line 1251
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/dialog/FrontRotateNewbieDialogFragment;->animateOut(I)V

    .line 1253
    :cond_1
    return-void
.end method

.method private final registerReceiver()V
    .locals 2

    .line 1660
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 1661
    const-string v1, "android.media.action.VOICE_COMMAND"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1663
    iget-object v1, p0, Lcom/android/camera/Camera;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1, v0}, Lcom/android/camera/Camera;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 1664
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/Camera;->mDidRegister:Z

    .line 1665
    return-void
.end method

.method private registerSDReceiver()V
    .locals 2

    .line 1677
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 1678
    const-string v1, "android.intent.action.MEDIA_EJECT"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1679
    const-string v1, "android.intent.action.MEDIA_MOUNTED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1680
    const-string v1, "android.intent.action.MEDIA_UNMOUNTED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1681
    const-string v1, "android.intent.action.MEDIA_SCANNER_STARTED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1682
    const-string v1, "android.intent.action.MEDIA_SCANNER_FINISHED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1683
    const-string v1, "file"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addDataScheme(Ljava/lang/String;)V

    .line 1684
    iget-object v1, p0, Lcom/android/camera/Camera;->mSDReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1, v0}, Lcom/android/camera/Camera;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 1685
    return-void
.end method

.method private resumeCamera()V
    .locals 13

    .line 581
    invoke-virtual {p0}, Lcom/android/camera/Camera;->isSwitchingModule()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 582
    return-void

    .line 584
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    invoke-static {v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->isAlive(I)Z

    move-result v0

    if-nez v0, :cond_1

    .line 585
    invoke-virtual {p0}, Lcom/android/camera/Camera;->unRegisterProtocol()V

    .line 586
    invoke-virtual {p0}, Lcom/android/camera/Camera;->registerProtocol()V

    goto/16 :goto_5

    .line 588
    :cond_1
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    .line 589
    iget-object v1, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    invoke-virtual {v1}, Lcom/android/camera/CameraIntentManager;->checkCallerLegality()Z

    move-result v7

    .line 590
    nop

    .line 591
    iget-boolean v1, p0, Lcom/android/camera/Camera;->mJumpedToGallery:Z

    const/4 v8, 0x3

    const/4 v9, 0x2

    const/4 v10, 0x1

    const/4 v11, 0x0

    if-eqz v1, :cond_2

    .line 592
    iput-boolean v11, p0, Lcom/android/camera/Camera;->mJumpedToGallery:Z

    goto :goto_2

    .line 594
    :cond_2
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getIntentType()I

    move-result v12

    .line 595
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {p0}, Lcom/android/camera/Camera;->startFromSecureKeyguard()Z

    move-result v4

    const/4 v5, 0x0

    iget-boolean v1, p0, Lcom/android/camera/Camera;->mDelayReleaseCamera:Z

    xor-int/lit8 v6, v1, 0x1

    move-object v1, v0

    invoke-virtual/range {v1 .. v6}, Lcom/android/camera/data/data/global/DataItemGlobal;->parseIntent(Landroid/content/Intent;Ljava/lang/Boolean;ZZZ)Landroid/support/v4/util/Pair;

    .line 596
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getIntentType()I

    move-result v1

    .line 597
    if-eqz v12, :cond_7

    .line 598
    iget-object v2, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v2}, Lcom/android/camera/module/Module;->isSelectingCapturedResult()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 599
    move v2, v10

    goto :goto_0

    .line 598
    :cond_3
    nop

    .line 599
    move v2, v11

    :goto_0
    if-ne v12, v1, :cond_5

    if-eqz v2, :cond_5

    .line 600
    iget-boolean v1, p0, Lcom/android/camera/Camera;->mDelayReleaseCamera:Z

    if-eqz v1, :cond_4

    .line 601
    iput-boolean v11, p0, Lcom/android/camera/Camera;->mDelayReleaseCamera:Z

    .line 602
    return-void

    .line 604
    :cond_4
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/camera/Camera;->resumeCurrentMode(I)V

    .line 605
    return-void

    .line 608
    :cond_5
    if-eqz v2, :cond_6

    .line 609
    iget-object v1, p0, Lcom/android/camera/Camera;->mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

    const/4 v2, 0x6

    invoke-virtual {v1, v2}, Lcom/android/camera/fragment/BaseFragmentDelegate;->delegateEvent(I)V

    .line 612
    :cond_6
    goto :goto_1

    .line 614
    :cond_7
    iget-boolean v1, p0, Lcom/android/camera/Camera;->mDelayReleaseCamera:Z

    if-eqz v1, :cond_8

    .line 615
    iput-boolean v11, p0, Lcom/android/camera/Camera;->mDelayReleaseCamera:Z

    .line 616
    return-void

    .line 620
    :cond_8
    :goto_1
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->isTimeOut()Z

    move-result v1

    if-eqz v1, :cond_9

    .line 621
    nop

    .line 622
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    sget-object v2, Lcom/android/camera/fragment/music/FragmentLiveMusic;->TAG:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/android/camera/fragment/FragmentUtils;->removeFragmentByTag(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)Z

    .line 631
    move v1, v8

    goto :goto_3

    :cond_9
    :goto_2
    move v1, v9

    .line 632
    :goto_3
    if-eqz v7, :cond_a

    if-eq v1, v8, :cond_a

    .line 633
    goto :goto_4

    .line 635
    :cond_a
    move v9, v10

    :goto_4
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v0

    invoke-static {v0}, Lcom/android/camera/module/loader/StartControl;->create(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    .line 636
    invoke-virtual {v0, v1}, Lcom/android/camera/module/loader/StartControl;->setResetType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    invoke-virtual {v0, v9}, Lcom/android/camera/module/loader/StartControl;->setViewConfigType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    .line 635
    invoke-virtual {p0, v0}, Lcom/android/camera/Camera;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    .line 638
    :goto_5
    return-void
.end method

.method private setBrightnessRampRate(I)V
    .locals 1

    .line 1610
    iget-object v0, p0, Lcom/android/camera/Camera;->mPowerManager:Landroid/os/IPowerManager;

    invoke-static {v0, p1}, Lcom/android/camera/lib/compatibility/util/CompatibilityUtils;->setBrightnessRampRate(Landroid/os/IPowerManager;I)V

    .line 1611
    return-void
.end method

.method private setScreenEffect(Z)V
    .locals 2

    .line 1614
    iget-object v0, p0, Lcom/android/camera/Camera;->mDisplayFeatureManager:Lmiui/hardware/display/DisplayFeatureManager;

    if-eqz v0, :cond_0

    .line 1615
    iget-object v0, p0, Lcom/android/camera/Camera;->mDisplayFeatureManager:Lmiui/hardware/display/DisplayFeatureManager;

    const/16 v1, 0xe

    invoke-virtual {v0, v1, p1}, Lmiui/hardware/display/DisplayFeatureManager;->setScreenEffect(II)V

    .line 1617
    :cond_0
    return-void
.end method

.method private setTranslucentNavigation(Z)V
    .locals 2

    .line 563
    invoke-static {p0}, Lcom/android/camera/Util;->checkDeviceHasNavigationBar(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 564
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getWindow()Landroid/view/Window;

    move-result-object p1

    .line 565
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x300

    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 567
    const/high16 v0, -0x80000000

    invoke-virtual {p1, v0}, Landroid/view/Window;->addFlags(I)V

    .line 569
    :cond_0
    return-void
.end method

.method private setupCamera(Lcom/android/camera/module/loader/StartControl;)V
    .locals 6

    .line 434
    invoke-direct {p0}, Lcom/android/camera/Camera;->closeCameraSetup()Z

    .line 435
    new-instance v0, Lcom/android/camera/module/loader/FunctionCameraPrepare;

    iget v1, p1, Lcom/android/camera/module/loader/StartControl;->mTargetMode:I

    iget v2, p1, Lcom/android/camera/module/loader/StartControl;->mResetType:I

    iget-boolean v3, p1, Lcom/android/camera/module/loader/StartControl;->mNeedReConfigureData:Z

    iget-object v4, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    check-cast v4, Lcom/android/camera/module/BaseModule;

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/android/camera/module/loader/FunctionCameraPrepare;-><init>(IIZLcom/android/camera/module/BaseModule;)V

    .line 442
    new-instance v1, Lcom/android/camera/module/loader/FunctionModuleSetup;

    iget v2, p1, Lcom/android/camera/module/loader/StartControl;->mTargetMode:I

    invoke-direct {v1, v2}, Lcom/android/camera/module/loader/FunctionModuleSetup;-><init>(I)V

    .line 443
    new-instance v2, Lcom/android/camera/module/loader/FunctionDataSetup;

    iget v3, p1, Lcom/android/camera/module/loader/StartControl;->mTargetMode:I

    invoke-direct {v2, v3}, Lcom/android/camera/module/loader/FunctionDataSetup;-><init>(I)V

    .line 444
    new-instance v3, Lcom/android/camera/module/loader/FunctionUISetup;

    iget v4, p1, Lcom/android/camera/module/loader/StartControl;->mTargetMode:I

    invoke-virtual {p1}, Lcom/android/camera/module/loader/StartControl;->needNotifyUI()Z

    move-result p1

    invoke-direct {v3, v4, p1}, Lcom/android/camera/module/loader/FunctionUISetup;-><init>(IZ)V

    .line 446
    nop

    .line 447
    invoke-static {p0}, Lcom/android/camera/module/loader/NullHolder;->ofNullable(Ljava/lang/Object;)Lcom/android/camera/module/loader/NullHolder;

    move-result-object p1

    invoke-static {p1}, Lio/reactivex/Single;->just(Ljava/lang/Object;)Lio/reactivex/Single;

    move-result-object p1

    sget-object v4, Lcom/android/camera/constant/GlobalConstant;->sCameraSetupScheduler:Lio/reactivex/Scheduler;

    .line 453
    invoke-virtual {p1, v4}, Lio/reactivex/Single;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Single;

    move-result-object p1

    .line 454
    invoke-virtual {p1, v0}, Lio/reactivex/Single;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Single;

    move-result-object p1

    .line 456
    iget-object v0, p0, Lcom/android/camera/Camera;->mCamera2OpenOnSubScribe:Lcom/android/camera/module/loader/camera2/Camera2OpenOnSubScribe;

    invoke-static {v0}, Lio/reactivex/Single;->create(Lio/reactivex/SingleOnSubscribe;)Lio/reactivex/Single;

    move-result-object v0

    sget-object v4, Lcom/android/camera/constant/GlobalConstant;->sCameraSetupScheduler:Lio/reactivex/Scheduler;

    .line 457
    invoke-virtual {v0, v4}, Lio/reactivex/Single;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Single;

    move-result-object v0

    sget-object v4, Lcom/android/camera/constant/GlobalConstant;->sCameraSetupScheduler:Lio/reactivex/Scheduler;

    .line 458
    invoke-virtual {v0, v4}, Lio/reactivex/Single;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Single;

    move-result-object v0

    .line 460
    iget-object v4, p0, Lcom/android/camera/Camera;->mCameraSetupDisposableGuard:Ljava/lang/Object;

    monitor-enter v4

    .line 461
    :try_start_0
    iget-object v5, p0, Lcom/android/camera/Camera;->mCameraOpenResult:Lio/reactivex/functions/BiFunction;

    invoke-virtual {p1, v0, v5}, Lio/reactivex/Single;->zipWith(Lio/reactivex/SingleSource;Lio/reactivex/functions/BiFunction;)Lio/reactivex/Single;

    move-result-object p1

    .line 463
    invoke-virtual {p1, v1}, Lio/reactivex/Single;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Single;

    move-result-object p1

    .line 464
    invoke-virtual {p1, v2}, Lio/reactivex/Single;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Single;

    move-result-object p1

    .line 467
    invoke-virtual {v3}, Lcom/android/camera/module/loader/FunctionUISetup;->getWorkThread()Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Single;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Single;

    move-result-object p1

    .line 468
    invoke-virtual {p1, v3}, Lio/reactivex/Single;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Single;

    move-result-object p1

    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraSetupConsumer:Lio/reactivex/functions/Consumer;

    .line 469
    invoke-virtual {p1, v0}, Lio/reactivex/Single;->subscribe(Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/Camera;->mCameraSetupDisposable:Lio/reactivex/disposables/Disposable;

    .line 470
    monitor-exit v4

    .line 471
    return-void

    .line 470
    :catchall_0
    move-exception p1

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method private shouldReleaseLater()Z
    .locals 1

    .line 555
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
    .locals 2

    .line 351
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/statistic/CameraStatUtil;->trackCameraError(Ljava/lang/String;)V

    .line 353
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    .line 354
    const/16 v1, 0xa

    iput v1, v0, Landroid/os/Message;->what:I

    .line 355
    iput p1, v0, Landroid/os/Message;->arg1:I

    .line 356
    iget-object p1, p0, Lcom/android/camera/Camera;->mHandler:Landroid/os/Handler;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 357
    return-void
.end method

.method private showDebug()V
    .locals 2

    .line 1335
    invoke-static {}, Lcom/android/camera/Util;->isShowDebugInfo()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 1336
    iget-object v0, p0, Lcom/android/camera/Camera;->mDebugInfoView:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    .line 1337
    iget-object v0, p0, Lcom/android/camera/Camera;->mDebugInfoView:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1339
    :cond_0
    new-instance v0, Lcom/android/camera/Camera$LogThread;

    invoke-direct {v0, p0}, Lcom/android/camera/Camera$LogThread;-><init>(Lcom/android/camera/Camera;)V

    iput-object v0, p0, Lcom/android/camera/Camera;->mDebugThread:Lcom/android/camera/Camera$LogThread;

    .line 1340
    iget-object v0, p0, Lcom/android/camera/Camera;->mDebugThread:Lcom/android/camera/Camera$LogThread;

    invoke-virtual {v0}, Lcom/android/camera/Camera$LogThread;->start()V

    .line 1342
    :cond_1
    iget-object v0, p0, Lcom/android/camera/Camera;->mDebugInfoView:Landroid/widget/TextView;

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/android/camera/Util;->isShowPreviewDebugInfo()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1343
    iget-object v0, p0, Lcom/android/camera/Camera;->mDebugInfoView:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1345
    :cond_2
    return-void
.end method

.method private showFirstUseHintIfNeeded()V
    .locals 4

    .line 1589
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "pref_camera_first_use_hint_shown_key"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1591
    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraRootView:Lcom/android/camera/ui/CameraRootView;

    if-eqz v0, :cond_0

    .line 1592
    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraRootView:Lcom/android/camera/ui/CameraRootView;

    invoke-virtual {v0}, Lcom/android/camera/ui/CameraRootView;->disableTouchEvent()V

    .line 1594
    :cond_0
    iget-object v0, p0, Lcom/android/camera/Camera;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/camera/Camera$9;

    invoke-direct {v1, p0}, Lcom/android/camera/Camera$9;-><init>(Lcom/android/camera/Camera;)V

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1607
    :cond_1
    return-void
.end method

.method private showHibernationFragment()V
    .locals 3

    .line 1726
    new-instance v0, Lcom/android/camera/fragment/dialog/HibernationFragment;

    invoke-direct {v0}, Lcom/android/camera/fragment/dialog/HibernationFragment;-><init>()V

    .line 1727
    const/4 v1, 0x2

    const v2, 0x7f0c001e

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/app/DialogFragment;->setStyle(II)V

    .line 1728
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    const-string v2, "Hibernation"

    .line 1729
    invoke-virtual {v1, v0, v2}, Landroid/support/v4/app/FragmentTransaction;->add(Landroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object v0

    .line 1730
    invoke-virtual {v0}, Landroid/support/v4/app/FragmentTransaction;->commitAllowingStateLoss()I

    .line 1731
    return-void
.end method

.method private switchEdgeFingerMode(Z)V
    .locals 1

    .line 1273
    invoke-static {}, Lcom/mi/config/b;->hn()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 1274
    :cond_0
    invoke-static {p0, p1}, Lcom/android/camera/CameraSettings;->setEdgeMode(Landroid/content/Context;Z)V

    .line 1276
    return-void
.end method

.method private triggerWatchDog(Z)V
    .locals 3

    .line 1279
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "triggerWatchDog: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1280
    sget-boolean v0, Lcom/mi/config/b;->qY:Z

    if-eqz v0, :cond_3

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fY()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_1

    .line 1284
    :cond_0
    const/4 v0, 0x0

    if-eqz p1, :cond_1

    .line 1285
    new-instance p1, Lcom/android/camera/Camera$WatchDogThread;

    invoke-direct {p1, p0, v0}, Lcom/android/camera/Camera$WatchDogThread;-><init>(Lcom/android/camera/Camera;Lcom/android/camera/Camera$1;)V

    iput-object p1, p0, Lcom/android/camera/Camera;->mWatchDog:Ljava/lang/Thread;

    .line 1286
    iget-object p1, p0, Lcom/android/camera/Camera;->mWatchDog:Ljava/lang/Thread;

    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    goto :goto_0

    .line 1288
    :cond_1
    iget-object p1, p0, Lcom/android/camera/Camera;->mWatchDog:Ljava/lang/Thread;

    if-eqz p1, :cond_2

    .line 1289
    iget-object p1, p0, Lcom/android/camera/Camera;->mWatchDog:Ljava/lang/Thread;

    invoke-virtual {p1}, Ljava/lang/Thread;->interrupt()V

    .line 1290
    iput-object v0, p0, Lcom/android/camera/Camera;->mWatchDog:Ljava/lang/Thread;

    .line 1293
    :cond_2
    :goto_0
    return-void

    .line 1281
    :cond_3
    :goto_1
    return-void
.end method

.method private unbindServices()V
    .locals 1

    .line 1582
    iget-boolean v0, p0, Lcom/android/camera/Camera;->mIsGalleryServiceBound:Z

    if-eqz v0, :cond_0

    .line 1583
    iget-object v0, p0, Lcom/android/camera/Camera;->mServiceConnection:Landroid/content/ServiceConnection;

    invoke-virtual {p0, v0}, Lcom/android/camera/Camera;->unbindService(Landroid/content/ServiceConnection;)V

    .line 1584
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/Camera;->mIsGalleryServiceBound:Z

    .line 1586
    :cond_0
    return-void
.end method

.method private unregisterSDReceiver()V
    .locals 2

    .line 1691
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/Camera;->mSDReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/android/camera/Camera;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1694
    goto :goto_0

    .line 1692
    :catch_0
    move-exception v0

    .line 1693
    sget-object v1, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1695
    :goto_0
    return-void
.end method


# virtual methods
.method public changeRequestOrientation()V
    .locals 1

    .line 1385
    invoke-static {}, Lcom/mi/config/b;->hL()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1386
    return-void

    .line 1388
    :cond_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1389
    const/4 v0, 0x7

    invoke-virtual {p0, v0}, Lcom/android/camera/Camera;->setRequestedOrientation(I)V

    goto :goto_0

    .line 1391
    :cond_1
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/Camera;->setRequestedOrientation(I)V

    .line 1393
    :goto_0
    return-void
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 1

    .line 973
    iget-object v0, p0, Lcom/android/camera/Camera;->mProximitySensorLock:Lcom/android/camera/ProximitySensorLock;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/Camera;->mProximitySensorLock:Lcom/android/camera/ProximitySensorLock;

    invoke-virtual {v0, p1}, Lcom/android/camera/ProximitySensorLock;->intercept(Landroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 974
    const/4 p1, 0x1

    return p1

    .line 976
    :cond_0
    invoke-super {p0, p1}, Lcom/android/camera/ActivityBase;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1082
    iget-boolean v0, p0, Lcom/android/camera/Camera;->mActivityPaused:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 1084
    return v1

    .line 1087
    :cond_0
    iget-object v0, p0, Lcom/android/camera/Camera;->mProximitySensorLock:Lcom/android/camera/ProximitySensorLock;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/Camera;->mProximitySensorLock:Lcom/android/camera/ProximitySensorLock;

    invoke-virtual {v0}, Lcom/android/camera/ProximitySensorLock;->active()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1088
    return v1

    .line 1091
    :cond_1
    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0}, Lcom/android/camera/module/Module;->isIgnoreTouchEvent()Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_1

    .line 1095
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

    .line 1092
    :cond_5
    :goto_1
    invoke-super {p0, p1}, Lcom/android/camera/ActivityBase;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public getCapturePosture()I
    .locals 1

    .line 1269
    iget-object v0, p0, Lcom/android/camera/Camera;->mSensorStateManager:Lcom/android/camera/SensorStateManager;

    invoke-virtual {v0}, Lcom/android/camera/SensorStateManager;->getCapturePosture()I

    move-result v0

    return v0
.end method

.method public getCurrentBrightness()I
    .locals 1

    .line 1643
    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraBrightness:Lcom/android/camera/CameraBrightness;

    invoke-virtual {v0}, Lcom/android/camera/CameraBrightness;->getCurrentBrightness()I

    move-result v0

    return v0
.end method

.method public getCurrentModuleIndex()I
    .locals 1

    .line 1117
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

    .line 1257
    iget-object v0, p0, Lcom/android/camera/Camera;->mImageSaver:Lcom/android/camera/storage/ImageSaver;

    return-object v0
.end method

.method public getImplFactory()Lcom/android/camera/module/impl/ImplFactory;
    .locals 1

    .line 360
    iget-object v0, p0, Lcom/android/camera/Camera;->mImplFactory:Lcom/android/camera/module/impl/ImplFactory;

    return-object v0
.end method

.method public getSensorStateManager()Lcom/android/camera/SensorStateManager;
    .locals 1

    .line 1261
    iget-object v0, p0, Lcom/android/camera/Camera;->mSensorStateManager:Lcom/android/camera/SensorStateManager;

    return-object v0
.end method

.method public handleScreenSlideKeyEvent(ILandroid/view/KeyEvent;)Z
    .locals 11

    .line 1780
    sget-object p2, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "handleScreenSlideKeyEvent "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1781
    const/4 p2, 0x1

    const/16 v0, 0x2bd

    if-ne p1, v0, :cond_0

    .line 1782
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

    .line 1783
    invoke-virtual {p0}, Lcom/android/camera/Camera;->finish()V

    .line 1784
    const p1, 0x7f050002

    const v0, 0x7f050003

    invoke-virtual {p0, p1, v0}, Lcom/android/camera/Camera;->overridePendingTransition(II)V

    .line 1785
    return p2

    .line 1788
    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    .line 1789
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v1

    .line 1790
    const/16 v2, 0x2bc

    const/4 v3, 0x0

    if-ne p1, v2, :cond_1

    .line 1791
    nop

    .line 1793
    move v4, p2

    goto :goto_0

    .line 1792
    :cond_1
    nop

    .line 1793
    move v4, v3

    :goto_0
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v5

    .line 1794
    const/16 v6, 0xab

    const/16 v7, 0xac

    const/16 v8, 0xa9

    const/16 v9, 0xa6

    const/16 v10, 0xa2

    if-ne v5, v6, :cond_2

    invoke-static {}, Lcom/mi/config/b;->hC()Z

    move-result v6

    if-eqz v6, :cond_6

    :cond_2
    if-eq v5, v9, :cond_6

    const/16 v6, 0xa7

    if-eq v5, v6, :cond_6

    const/16 v6, 0xad

    if-ne v5, v6, :cond_3

    goto :goto_2

    .line 1799
    :cond_3
    const/16 v6, 0xa8

    if-eq v5, v6, :cond_5

    if-eq v5, v8, :cond_5

    const/16 v6, 0xaa

    if-eq v5, v6, :cond_5

    if-ne v5, v7, :cond_4

    goto :goto_1

    .line 1804
    :cond_4
    if-ne v5, v10, :cond_7

    .line 1805
    if-nez v4, :cond_7

    .line 1806
    invoke-static {}, Lcom/android/camera/data/DataRepository;->getInstance()Lcom/android/camera/data/DataRepository;

    move-result-object v6

    invoke-virtual {v6}, Lcom/android/camera/data/DataRepository;->backUp()Lcom/android/camera/data/backup/DataBackUp;

    move-result-object v6

    .line 1807
    invoke-interface {v6}, Lcom/android/camera/data/backup/DataBackUp;->isLastVideoFastMotion()Z

    move-result v6

    if-eqz v6, :cond_7

    .line 1808
    nop

    .line 1812
    move v5, v8

    goto :goto_3

    .line 1803
    :cond_5
    :goto_1
    nop

    .line 1812
    move v5, v10

    goto :goto_3

    .line 1798
    :cond_6
    :goto_2
    const/16 v5, 0xa3

    .line 1812
    :cond_7
    :goto_3
    if-eq v1, v4, :cond_c

    .line 1814
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    invoke-virtual {p1, v7}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 1816
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    .line 1817
    invoke-virtual {v2, v10}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v2

    check-cast v2, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    .line 1818
    if-eqz p1, :cond_8

    .line 1819
    const/4 v6, 0x4

    invoke-interface {p1, v6}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->removeExtraMenu(I)V

    .line 1821
    :cond_8
    if-eqz v2, :cond_9

    .line 1822
    invoke-interface {v2}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->hideExtra()V

    .line 1824
    :cond_9
    invoke-virtual {v0, v5}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCurrentMode(I)V

    .line 1825
    invoke-virtual {v0, v4}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCameraId(I)V

    .line 1826
    if-ne v1, p2, :cond_a

    move p1, p2

    goto :goto_4

    :cond_a
    move p1, v3

    :goto_4
    if-ne v4, p2, :cond_b

    .line 1827
    move v3, p2

    goto :goto_5

    .line 1826
    :cond_b
    nop

    .line 1827
    :goto_5
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v0

    .line 1826
    invoke-static {p1, v3, v0}, Lcom/android/camera/statistic/ScenarioTrackUtil;->trackSwitchCameraStart(ZZI)V

    .line 1828
    invoke-static {v5}, Lcom/android/camera/module/loader/StartControl;->create(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    .line 1829
    invoke-virtual {p1, p2}, Lcom/android/camera/module/loader/StartControl;->setFromScreenSlide(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    .line 1830
    invoke-virtual {p1, p2}, Lcom/android/camera/module/loader/StartControl;->setNeedBlurAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    const/4 v0, 0x2

    .line 1831
    invoke-virtual {p1, v0}, Lcom/android/camera/module/loader/StartControl;->setViewConfigType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    .line 1828
    invoke-virtual {p0, p1}, Lcom/android/camera/Camera;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    .line 1832
    goto :goto_6

    .line 1833
    :cond_c
    if-ne p1, v2, :cond_d

    invoke-virtual {p0}, Lcom/android/camera/Camera;->isCurrentModuleAlive()Z

    move-result p1

    if-eqz p1, :cond_d

    .line 1834
    iget-object p1, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    check-cast p1, Lcom/android/camera/module/BaseModule;

    invoke-virtual {p1, p2}, Lcom/android/camera/module/BaseModule;->updateScreenSlide(Z)V

    .line 1835
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    .line 1836
    invoke-virtual {p1, v9}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    .line 1837
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result v0

    if-eqz v0, :cond_d

    if-eqz p1, :cond_d

    .line 1838
    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->updateContentDescription()V

    .line 1842
    :cond_d
    :goto_6
    return p2
.end method

.method public hideLensDirtyDetectedHint()V
    .locals 2

    .line 1769
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fK()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1771
    return-void

    .line 1773
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    const-string v1, "LensDirtyDetectDialog"

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    .line 1774
    if-eqz v0, :cond_1

    instance-of v1, v0, Landroid/support/v4/app/DialogFragment;

    if-eqz v1, :cond_1

    .line 1775
    check-cast v0, Landroid/support/v4/app/DialogFragment;

    invoke-virtual {v0}, Landroid/support/v4/app/DialogFragment;->dismissAllowingStateLoss()V

    .line 1777
    :cond_1
    return-void
.end method

.method public isCurrentModuleAlive()Z
    .locals 1

    .line 559
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

    .line 1846
    iget-boolean v0, p0, Lcom/android/camera/Camera;->mIsModeSwitched:Z

    return v0
.end method

.method public isNewBieAlive(I)Z
    .locals 2

    .line 1481
    nop

    .line 1482
    packed-switch p1, :pswitch_data_0

    .line 1496
    const/4 p1, 0x0

    goto :goto_0

    .line 1493
    :pswitch_0
    const-string p1, "UltraWideHint"

    goto :goto_0

    .line 1490
    :pswitch_1
    const-string p1, "AiSceneHint"

    .line 1491
    goto :goto_0

    .line 1487
    :pswitch_2
    const-string p1, "RotateHint"

    .line 1488
    goto :goto_0

    .line 1484
    :pswitch_3
    const-string p1, "PortraitHint"

    .line 1485
    nop

    .line 1496
    :goto_0
    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 1497
    return v0

    .line 1499
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

    .line 547
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

    .line 1850
    iget-boolean v0, p0, Lcom/android/camera/Camera;->mIsScreenSlideOff:Z

    return v0
.end method

.method public isSelectingCapturedResult()Z
    .locals 1

    .line 551
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

    .line 1265
    iget-object v0, p0, Lcom/android/camera/Camera;->mSensorStateManager:Lcom/android/camera/SensorStateManager;

    invoke-virtual {v0}, Lcom/android/camera/SensorStateManager;->isStable()Z

    move-result v0

    return v0
.end method

.method public isVideoRecording()Z
    .locals 1

    .line 543
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

    .line 1530
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

    .line 1534
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->clearAnimation()V

    .line 1535
    iget-object v0, p0, Lcom/android/camera/Camera;->mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

    invoke-virtual {v0}, Lcom/android/camera/fragment/BaseFragmentDelegate;->getAnimationComposite()Lcom/android/camera/animation/AnimationComposite;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/camera/animation/AnimationComposite;->notifyAfterFirstFrameArrived(I)V

    .line 1536
    iget-object p1, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    const/4 v0, 0x1

    invoke-interface {p1, v0}, Lcom/android/camera/module/Module;->enableCameraControls(Z)V

    .line 1537
    iget-object p1, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {p1, v0}, Lcom/android/camera/module/Module;->setFrameAvailable(Z)V

    .line 1540
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getCurrentModuleIndex()I

    move-result p1

    const/16 v1, 0xa5

    if-eq p1, v1, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getCurrentModuleIndex()I

    move-result p1

    const/16 v1, 0xa3

    if-eq p1, v1, :cond_1

    .line 1541
    return-void

    .line 1543
    :cond_1
    invoke-static {}, Lcom/mi/config/b;->hL()Z

    move-result p1

    if-nez p1, :cond_2

    .line 1544
    return-void

    .line 1546
    :cond_2
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result p1

    if-nez p1, :cond_3

    .line 1547
    return-void

    .line 1549
    :cond_3
    iget p1, p0, Lcom/android/camera/Camera;->mDisplayRotation:I

    if-eqz p1, :cond_4

    .line 1550
    return-void

    .line 1552
    :cond_4
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object p1

    const-string v1, "pref_front_camera_first_use_hint_shown_key"

    invoke-virtual {p1, v1, v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_5

    .line 1553
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object p1

    const-string v0, "pref_front_camera_first_use_hint_shown_key"

    const/4 v1, 0x0

    .line 1554
    invoke-interface {p1, v0, v1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putBoolean(Ljava/lang/String;Z)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object p1

    .line 1555
    invoke-interface {p1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 1556
    const/4 p1, 0x2

    invoke-virtual {p0, p1}, Lcom/android/camera/Camera;->showNewBie(I)Z

    .line 1558
    :cond_5
    return-void

    .line 1531
    :cond_6
    :goto_0
    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 0

    .line 1855
    invoke-super {p0, p1, p2, p3}, Lcom/android/camera/ActivityBase;->onActivityResult(IILandroid/content/Intent;)V

    .line 1856
    invoke-static {p0, p1, p2, p3}, Lcom/android/camera/FileCompat;->handleActivityResult(Landroid/app/Activity;IILandroid/content/Intent;)Z

    move-result p1

    .line 1857
    if-eqz p1, :cond_1

    .line 1858
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    invoke-static {p0, p1}, Landroid/support/v4/provider/DocumentFile;->fromTreeUri(Landroid/content/Context;Landroid/net/Uri;)Landroid/support/v4/provider/DocumentFile;

    move-result-object p1

    .line 1859
    const-string p2, "Camera"

    invoke-virtual {p1, p2}, Landroid/support/v4/provider/DocumentFile;->findFile(Ljava/lang/String;)Landroid/support/v4/provider/DocumentFile;

    move-result-object p2

    if-nez p2, :cond_0

    .line 1860
    const-string p2, "Camera"

    invoke-virtual {p1, p2}, Landroid/support/v4/provider/DocumentFile;->createDirectory(Ljava/lang/String;)Landroid/support/v4/provider/DocumentFile;

    .line 1862
    :cond_0
    goto :goto_0

    .line 1863
    :cond_1
    sget-object p1, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string p2, "onActivityResult documents permission not granted"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1864
    const/4 p1, 0x0

    invoke-static {p1}, Lcom/android/camera/storage/PriorityStorageBroadcastReceiver;->setPriorityStorage(Z)V

    .line 1866
    :goto_0
    return-void
.end method

.method public onAwaken()V
    .locals 2

    .line 1720
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v1, "onAwaken"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1721
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->requestAwaken()V

    .line 1722
    iget-object v0, p0, Lcom/android/camera/Camera;->mStartControl:Lcom/android/camera/module/loader/StartControl;

    invoke-virtual {p0, v0}, Lcom/android/camera/Camera;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    .line 1723
    return-void
.end method

.method public onBackPressed()V
    .locals 2

    .line 965
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v1, "onBackPressed"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 966
    invoke-virtual {p0}, Lcom/android/camera/Camera;->isCurrentModuleAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0}, Lcom/android/camera/module/Module;->onBackPressed()Z

    move-result v0

    if-nez v0, :cond_1

    .line 967
    :cond_0
    invoke-super {p0}, Lcom/android/camera/ActivityBase;->onBackPressed()V

    .line 969
    :cond_1
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 9

    .line 233
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v1, "onCreate start"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 234
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/android/camera/CameraAppImpl;

    iput-object v0, p0, Lcom/android/camera/Camera;->mApplication:Lcom/android/camera/CameraAppImpl;

    .line 240
    iget-object v0, p0, Lcom/android/camera/Camera;->mApplication:Lcom/android/camera/CameraAppImpl;

    invoke-virtual {v0}, Lcom/android/camera/CameraAppImpl;->isApplicationFirstLaunched()Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/camera/Camera;->trackAppLunchTimeStart(Z)V

    .line 241
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/Camera;->mAppStartTime:J

    .line 242
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/CameraIntentManager;->getInstance(Landroid/content/Intent;)Lcom/android/camera/CameraIntentManager;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    .line 243
    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    invoke-virtual {v0, p0}, Lcom/android/camera/CameraIntentManager;->setReferer(Landroid/app/Activity;)V

    .line 244
    invoke-static {p0}, Lcom/android/camera/lib/compatibility/util/CompatibilityUtils;->isInMultiWindowMode(Landroid/app/Activity;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 248
    invoke-super {p0, v1}, Lcom/android/camera/ActivityBase;->onCreate(Landroid/os/Bundle;)V

    invoke-static {p0}, Lcom/aeonax/PermissionsAsker;->Ask(Landroid/app/Activity;)V
    .line 249
    const p1, 0x7f0901f5

    invoke-static {p0, p1}, Lcom/android/camera/ToastUtils;->showToast(Landroid/content/Context;I)V

    .line 250
    sget-object p1, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v0, "isInMultiWindowMode call finish"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 251
    invoke-virtual {p0}, Lcom/android/camera/Camera;->finish()V

    .line 252
    return-void

    .line 256
    :cond_0
    const-string v0, "android.media.action.VOICE_COMMAND"

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 257
    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    invoke-virtual {v0}, Lcom/android/camera/CameraIntentManager;->checkCallerLegality()Z

    move-result v0

    if-nez v0, :cond_1

    .line 258
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

    .line 260
    invoke-super {p0, v1}, Lcom/android/camera/ActivityBase;->onCreate(Landroid/os/Bundle;)V

    invoke-static {p0}, Lcom/aeonax/PermissionsAsker;->Ask(Landroid/app/Activity;)V
    .line 261
    invoke-virtual {p0}, Lcom/android/camera/Camera;->finish()V

    .line 262
    return-void

    .line 266
    :cond_1
    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    invoke-virtual {v0}, Lcom/android/camera/CameraIntentManager;->checkCallerLegality()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 267
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/statistic/CameraStatUtil;->trackVoiceControl(Landroid/content/Intent;)V

    .line 270
    :cond_2
    invoke-super {p0, p1}, Lcom/android/camera/ActivityBase;->onCreate(Landroid/os/Bundle;)V

    invoke-static {p0}, Lcom/aeonax/PermissionsAsker;->Ask(Landroid/app/Activity;)V
    .line 272
    iget-object p1, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    invoke-virtual {p1}, Lcom/android/camera/CameraIntentManager;->checkCallerLegality()Z

    move-result v8

    .line 273
    new-instance p1, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    .line 274
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getIntent()Landroid/content/Intent;

    move-result-object v6

    .line 275
    invoke-virtual {p0}, Lcom/android/camera/Camera;->startFromSecureKeyguard()Z

    move-result v7

    move-object v2, p1

    invoke-direct/range {v2 .. v8}, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;-><init>(Lcom/android/camera/module/Module;Lcom/android/camera/module/loader/StartControl;Lcom/android/camera/CameraScreenNail;Landroid/content/Intent;ZZ)V

    .line 273
    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    sget-object v0, Lcom/android/camera/constant/GlobalConstant;->sCameraSetupScheduler:Lio/reactivex/Scheduler;

    .line 276
    invoke-virtual {p1, v0}, Lio/reactivex/Completable;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Completable;

    move-result-object p1

    .line 277
    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 279
    invoke-static {}, Lcom/android/camera/ProximitySensorLock;->enabled()Z

    move-result p1

    if-eqz p1, :cond_4

    invoke-direct {p0}, Lcom/android/camera/Camera;->isFromKeyguard()Z

    move-result p1

    if-eqz p1, :cond_4

    .line 280
    invoke-static {}, Lcom/android/camera/Util;->isNonUIEnabled()Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    invoke-virtual {p1}, Lcom/android/camera/CameraIntentManager;->isFromVolumeKey()Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_3

    .line 281
    invoke-static {}, Lcom/android/camera/Util;->isNonUI()Z

    move-result p1

    if-eqz p1, :cond_4

    .line 282
    const-string p1, "counter"

    const-string v0, "pocket_mode_enter"

    const-string v1, "\u65b9\u5f0f"

    const-string v2, "NonUI\u97f3\u91cf\u952e"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lcom/android/camera/statistic/CameraStatUtil;->track(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 287
    sget-object p1, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v0, "Finish from NonUI mode."

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 288
    invoke-virtual {p0}, Lcom/android/camera/Camera;->finish()V

    .line 289
    return-void

    .line 291
    :cond_3
    invoke-static {}, Lcom/android/camera/ProximitySensorLock;->supported()Z

    move-result p1

    if-eqz p1, :cond_4

    .line 292
    new-instance p1, Lcom/android/camera/ProximitySensorLock;

    invoke-direct {p1, p0}, Lcom/android/camera/ProximitySensorLock;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/android/camera/Camera;->mProximitySensorLock:Lcom/android/camera/ProximitySensorLock;

    .line 294
    iget-object p1, p0, Lcom/android/camera/Camera;->mProximitySensorLock:Lcom/android/camera/ProximitySensorLock;

    invoke-virtual {p1}, Lcom/android/camera/ProximitySensorLock;->startWatching()V

    .line 298
    :cond_4
    invoke-static {}, Lcom/android/camera/effect/EffectController;->releaseInstance()V

    .line 299
    const p1, 0x7f040046

    invoke-virtual {p0, p1}, Lcom/android/camera/Camera;->setContentView(I)V

    .line 301
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1, v1}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 302
    const p1, 0x7f0d00e3

    invoke-virtual {p0, p1}, Lcom/android/camera/Camera;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/android/camera/ui/V6CameraGLSurfaceView;

    iput-object p1, p0, Lcom/android/camera/Camera;->mGLView:Lcom/android/camera/ui/V6CameraGLSurfaceView;

    .line 303
    const p1, 0x7f0d00e4

    invoke-virtual {p0, p1}, Lcom/android/camera/Camera;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/android/camera/Camera;->mGLCoverView:Landroid/widget/ImageView;

    .line 304
    const p1, 0x7f0d00f6

    invoke-virtual {p0, p1}, Lcom/android/camera/Camera;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/android/camera/Camera;->mDebugInfoView:Landroid/widget/TextView;

    .line 305
    const p1, 0x7f0d0102

    invoke-virtual {p0, p1}, Lcom/android/camera/Camera;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/android/camera/ui/V9EdgeShutterView;

    iput-object p1, p0, Lcom/android/camera/Camera;->mEdgeShutterView:Lcom/android/camera/ui/V9EdgeShutterView;

    .line 306
    const p1, 0x7f0d00f5

    invoke-virtual {p0, p1}, Lcom/android/camera/Camera;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/android/camera/ui/CameraRootView;

    iput-object p1, p0, Lcom/android/camera/Camera;->mCameraRootView:Lcom/android/camera/ui/CameraRootView;

    .line 308
    new-instance p1, Lcom/android/camera/SensorStateManager;

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p1, p0, v0}, Lcom/android/camera/SensorStateManager;-><init>(Landroid/content/Context;Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/android/camera/Camera;->mSensorStateManager:Lcom/android/camera/SensorStateManager;

    .line 309
    new-instance p1, Lcom/android/camera/Camera$MyOrientationEventListener;

    invoke-direct {p1, p0, p0}, Lcom/android/camera/Camera$MyOrientationEventListener;-><init>(Lcom/android/camera/Camera;Landroid/content/Context;)V

    iput-object p1, p0, Lcom/android/camera/Camera;->mOrientationListener:Lcom/android/camera/Camera$MyOrientationEventListener;

    .line 312
    const/4 p1, 0x0

    invoke-virtual {p0, p1, p1}, Lcom/android/camera/Camera;->createCameraScreenNail(ZZ)V

    .line 314
    new-instance p1, Lcom/android/camera/module/loader/camera2/Camera2OpenOnSubScribe;

    invoke-direct {p1, p0}, Lcom/android/camera/module/loader/camera2/Camera2OpenOnSubScribe;-><init>(Lcom/android/camera/module/loader/SurfaceStateListener;)V

    iput-object p1, p0, Lcom/android/camera/Camera;->mCamera2OpenOnSubScribe:Lcom/android/camera/module/loader/camera2/Camera2OpenOnSubScribe;

    .line 315
    invoke-virtual {p0}, Lcom/android/camera/Camera;->registerProtocol()V

    .line 318
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getKeyguardFlag()Z

    move-result p1

    if-nez p1, :cond_5

    .line 319
    invoke-static {p0}, Lcom/android/camera/permission/PermissionManager;->requestCameraRuntimePermissions(Landroid/app/Activity;)Z

    .line 322
    :cond_5
    invoke-static {p0}, Lcom/android/camera/Util;->updateCountryIso(Landroid/content/Context;)V

    .line 323
    const-string p1, "power"

    invoke-static {p1}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Landroid/os/IPowerManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/os/IPowerManager;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/Camera;->mPowerManager:Landroid/os/IPowerManager;

    .line 324
    invoke-static {}, Lcom/mi/config/b;->hU()Z

    move-result p1

    if-eqz p1, :cond_6

    .line 326
    :try_start_0
    invoke-static {}, Lmiui/hardware/display/DisplayFeatureManager;->getInstance()Lmiui/hardware/display/DisplayFeatureManager;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/Camera;->mDisplayFeatureManager:Lmiui/hardware/display/DisplayFeatureManager;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 330
    goto :goto_0

    .line 327
    :catch_0
    move-exception p1

    .line 329
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v1, "DisplayFeatureManager init failed"

    invoke-static {v0, v1, p1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 332
    :cond_6
    :goto_0
    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lcom/android/camera/Camera;->setTranslucentNavigation(Z)V

    .line 333
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p1

    invoke-static {p1}, Lcom/android/camera/EffectChangedListenerController;->setHoldKey(I)V

    .line 335
    invoke-direct {p0}, Lcom/android/camera/Camera;->showDebug()V

    .line 336
    sget-object p1, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v0, "onCreate end"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 337
    return-void
.end method

.method public onDestroy()V
    .locals 3

    .line 850
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v1, "onDestroy start"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 851
    invoke-super {p0}, Lcom/android/camera/ActivityBase;->onDestroy()V

    .line 853
    invoke-static {p0}, Lcom/android/camera/AutoLockManager;->removeInstance(Landroid/content/Context;)V

    .line 854
    invoke-direct {p0}, Lcom/android/camera/Camera;->closeCameraSetup()Z

    .line 856
    invoke-virtual {p0}, Lcom/android/camera/Camera;->unRegisterProtocol()V

    .line 858
    iget-boolean v0, p0, Lcom/android/camera/Camera;->mDelayReleaseCamera:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 859
    iput-boolean v1, p0, Lcom/android/camera/Camera;->mDelayReleaseCamera:Z

    .line 860
    const/4 v0, 0x1

    invoke-virtual {p0, v0, v0}, Lcom/android/camera/Camera;->releaseAll(ZZ)V

    .line 863
    :cond_0
    invoke-static {}, Lcom/android/camera/ThermalDetector;->getInstance()Lcom/android/camera/ThermalDetector;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/ThermalDetector;->onDestroy()V

    .line 865
    iget-object v0, p0, Lcom/android/camera/Camera;->mImageSaver:Lcom/android/camera/storage/ImageSaver;

    if-eqz v0, :cond_1

    .line 866
    iget-object v0, p0, Lcom/android/camera/Camera;->mImageSaver:Lcom/android/camera/storage/ImageSaver;

    invoke-virtual {v0}, Lcom/android/camera/storage/ImageSaver;->onHostDestroy()V

    .line 868
    :cond_1
    iget-object v0, p0, Lcom/android/camera/Camera;->mSensorStateManager:Lcom/android/camera/SensorStateManager;

    if-eqz v0, :cond_2

    .line 869
    iget-object v0, p0, Lcom/android/camera/Camera;->mSensorStateManager:Lcom/android/camera/SensorStateManager;

    invoke-virtual {v0}, Lcom/android/camera/SensorStateManager;->onDestroy()V

    .line 871
    :cond_2
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/Camera;->mPowerManager:Landroid/os/IPowerManager;

    .line 872
    iput-object v0, p0, Lcom/android/camera/Camera;->mDisplayFeatureManager:Lmiui/hardware/display/DisplayFeatureManager;

    .line 873
    invoke-static {p0}, Lcom/android/camera/ui/V6GestureRecognizer;->onDestroy(Lcom/android/camera/ActivityBase;)V

    .line 874
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v2

    invoke-static {v2}, Lcom/android/camera/EffectChangedListenerController;->removeEffectChangedListenerMap(I)V

    .line 875
    iget-object v2, p0, Lcom/android/camera/Camera;->mDebugThread:Lcom/android/camera/Camera$LogThread;

    if-eqz v2, :cond_3

    .line 876
    iget-object v2, p0, Lcom/android/camera/Camera;->mDebugThread:Lcom/android/camera/Camera$LogThread;

    invoke-virtual {v2, v1}, Lcom/android/camera/Camera$LogThread;->setRunFlag(Z)V

    .line 878
    :cond_3
    iget-object v1, p0, Lcom/android/camera/Camera;->mProximitySensorLock:Lcom/android/camera/ProximitySensorLock;

    if-eqz v1, :cond_4

    .line 879
    iget-object v1, p0, Lcom/android/camera/Camera;->mProximitySensorLock:Lcom/android/camera/ProximitySensorLock;

    invoke-virtual {v1}, Lcom/android/camera/ProximitySensorLock;->destroy()V

    .line 882
    :cond_4
    iget-object v1, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    if-eqz v1, :cond_5

    .line 883
    iget-object v1, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    invoke-virtual {v1}, Lcom/android/camera/CameraIntentManager;->destroy()V

    .line 884
    iput-object v0, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    .line 887
    :cond_5
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getScreenHint()Lcom/android/camera/ui/ScreenHint;

    move-result-object v0

    if-eqz v0, :cond_6

    .line 888
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getScreenHint()Lcom/android/camera/ui/ScreenHint;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/ui/ScreenHint;->dismissSystemChoiceDialog()V

    .line 890
    :cond_6
    invoke-static {}, Lcom/android/camera/CameraIntentManager;->removeAllInstance()V

    .line 891
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v1, "onDestroy end"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 892
    return-void
.end method

.method public onEdgeTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1099
    invoke-static {}, Lcom/mi/config/b;->hn()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1100
    invoke-static {p0}, Lcom/android/camera/ui/V6GestureRecognizer;->getInstance(Lcom/android/camera/ActivityBase;)Lcom/android/camera/ui/V6GestureRecognizer;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/V6GestureRecognizer;->onEdgeTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1

    .line 1102
    :cond_0
    const/4 p1, 0x1

    return p1
.end method

.method public onHibernate()V
    .locals 2

    .line 1698
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v1, "onHibernate"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1699
    invoke-virtual {p0}, Lcom/android/camera/Camera;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1700
    invoke-static {p0}, Lcom/android/camera/AutoLockManager;->getInstance(Landroid/content/Context;)Lcom/android/camera/AutoLockManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/AutoLockManager;->removeMessage()V

    .line 1701
    return-void

    .line 1703
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/Camera;->showHibernationFragment()V

    .line 1704
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->requestHibernate()V

    .line 1706
    sget-object v0, Lcom/android/camera/constant/GlobalConstant;->sCameraSetupScheduler:Lio/reactivex/Scheduler;

    new-instance v1, Lcom/android/camera/Camera$12;

    invoke-direct {v1, p0}, Lcom/android/camera/Camera$12;-><init>(Lcom/android/camera/Camera;)V

    invoke-virtual {v0, v1}, Lio/reactivex/Scheduler;->scheduleDirect(Ljava/lang/Runnable;)Lio/reactivex/disposables/Disposable;

    .line 1717
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 9

    .line 981
    iget-boolean v0, p0, Lcom/android/camera/Camera;->mActivityPaused:Z

    if-eqz v0, :cond_0

    .line 982
    invoke-super {p0, p1, p2}, Lcom/android/camera/ActivityBase;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1

    .line 986
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

    .line 994
    :cond_1
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getEventTime()J

    move-result-wide v3

    iget-wide v5, p0, Lcom/android/camera/Camera;->mLastKeyEventTime:J

    const-wide/16 v7, 0x96

    invoke-static/range {v3 .. v8}, Lcom/android/camera/Util;->isTimeout(JJJ)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 995
    iput v1, p0, Lcom/android/camera/Camera;->mLastIgnoreKey:I

    goto :goto_0

    .line 997
    :cond_2
    iput p1, p0, Lcom/android/camera/Camera;->mLastIgnoreKey:I

    .line 998
    return v2

    .line 1000
    :cond_3
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    if-lez v0, :cond_4

    iget v0, p0, Lcom/android/camera/Camera;->mLastIgnoreKey:I

    if-ne p1, v0, :cond_4

    .line 1001
    iput v1, p0, Lcom/android/camera/Camera;->mLastIgnoreKey:I

    .line 1004
    :cond_4
    :goto_0
    const/16 v0, 0x2bc

    const/4 v1, 0x0

    if-ne p1, v0, :cond_5

    .line 1005
    iput-boolean v1, p0, Lcom/android/camera/Camera;->mIsScreenSlideOff:Z

    goto :goto_1

    .line 1006
    :cond_5
    const/16 v0, 0x2bd

    if-ne p1, v0, :cond_6

    .line 1007
    iput-boolean v2, p0, Lcom/android/camera/Camera;->mIsScreenSlideOff:Z

    .line 1010
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

    .line 1028
    :cond_7
    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0, p1, p2}, Lcom/android/camera/module/Module;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    if-nez v0, :cond_9

    .line 1029
    invoke-super {p0, p1, p2}, Lcom/android/camera/ActivityBase;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result p1

    if-eqz p1, :cond_8

    goto :goto_2

    :cond_8
    goto :goto_3

    .line 1028
    :cond_9
    :goto_2
    move v1, v2

    :goto_3
    return v1

    .line 1011
    :cond_a
    :goto_4
    sparse-switch p1, :sswitch_data_0

    .line 1025
    invoke-super {p0, p1, p2}, Lcom/android/camera/ActivityBase;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1

    .line 1014
    :sswitch_0
    invoke-virtual {p0, p1, p2}, Lcom/android/camera/Camera;->handleScreenSlideKeyEvent(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1

    .line 1022
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

    .line 1034
    iget-boolean v0, p0, Lcom/android/camera/Camera;->mActivityPaused:Z

    if-eqz v0, :cond_0

    .line 1035
    invoke-super {p0, p1, p2}, Lcom/android/camera/ActivityBase;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1

    .line 1037
    :cond_0
    iget v0, p0, Lcom/android/camera/Camera;->mLastIgnoreKey:I

    const/4 v1, 0x1

    if-ne p1, v0, :cond_1

    .line 1038
    const-wide/16 p1, 0x0

    iput-wide p1, p0, Lcom/android/camera/Camera;->mLastKeyEventTime:J

    .line 1039
    const/4 p1, -0x1

    iput p1, p0, Lcom/android/camera/Camera;->mLastIgnoreKey:I

    .line 1040
    return v1

    .line 1043
    :cond_1
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getEventTime()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/android/camera/Camera;->mLastKeyEventTime:J

    .line 1045
    invoke-virtual {p0}, Lcom/android/camera/Camera;->isCurrentModuleAlive()Z

    move-result v0

    if-nez v0, :cond_2

    .line 1046
    invoke-super {p0, p1, p2}, Lcom/android/camera/ActivityBase;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1

    .line 1049
    :cond_2
    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0, p1, p2}, Lcom/android/camera/module/Module;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 1050
    invoke-super {p0, p1, p2}, Lcom/android/camera/ActivityBase;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_0

    :cond_3
    const/4 v1, 0x0

    nop

    .line 1049
    :cond_4
    :goto_0
    return v1
.end method

.method public onLifeAlive()V
    .locals 6

    .line 411
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v2, "onLifeAlive module 0x%x, need anim %d, need blur %b need reconfig %b reset type %d"

    const/4 v3, 0x5

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/android/camera/Camera;->mStartControl:Lcom/android/camera/module/loader/StartControl;

    iget v4, v4, Lcom/android/camera/module/loader/StartControl;->mTargetMode:I

    .line 413
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

    .line 414
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

    .line 411
    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 415
    iget-object v0, p0, Lcom/android/camera/Camera;->mStartControl:Lcom/android/camera/module/loader/StartControl;

    invoke-direct {p0, v0}, Lcom/android/camera/Camera;->setupCamera(Lcom/android/camera/module/loader/StartControl;)V

    .line 416
    return-void
.end method

.method public onLifeDestroy(Ljava/lang/String;)V
    .locals 3

    .line 425
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onLifeDestroy "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 426
    return-void
.end method

.method public onLifeStart(Ljava/lang/String;)V
    .locals 3

    .line 406
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onLifeStart "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 407
    return-void
.end method

.method public onLifeStop(Ljava/lang/String;)V
    .locals 3

    .line 420
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onLifeStop "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 421
    return-void
.end method

.method public onModeSelected(Lcom/android/camera/module/loader/StartControl;)V
    .locals 9
    .annotation build Landroid/support/annotation/MainThread;
    .end annotation

    .line 1123
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getCurrentModuleIndex()I

    move-result v0

    .line 1124
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

    .line 1125
    invoke-static {p0}, Lcom/android/camera/Util;->isScreenSlideOff(Landroid/content/Context;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/android/camera/Camera;->mIsScreenSlideOff:Z

    .line 1126
    sget-object v1, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    sget-object v4, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v5, "onModeSelected from 0x%x to 0x%x, ScreenSlideOff = %b"

    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Object;

    .line 1127
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

    .line 1126
    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1128
    const/16 v1, 0xa0

    if-eq v0, v1, :cond_1

    invoke-static {v0}, Lcom/android/camera/statistic/CameraStatUtil;->modeIdToName(I)Ljava/lang/String;

    move-result-object v1

    iget v4, p1, Lcom/android/camera/module/loader/StartControl;->mTargetMode:I

    .line 1129
    invoke-static {v4}, Lcom/android/camera/statistic/CameraStatUtil;->modeIdToName(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 1130
    iget v1, p1, Lcom/android/camera/module/loader/StartControl;->mTargetMode:I

    .line 1131
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v4

    .line 1130
    invoke-static {v0, v1, v4}, Lcom/android/camera/statistic/ScenarioTrackUtil;->trackSwitchModeStart(IIZ)V

    .line 1133
    :cond_1
    invoke-direct {p0}, Lcom/android/camera/Camera;->closeCameraSetup()Z

    .line 1135
    iput-object p1, p0, Lcom/android/camera/Camera;->mStartControl:Lcom/android/camera/module/loader/StartControl;

    .line 1138
    iget v0, p1, Lcom/android/camera/module/loader/StartControl;->mTargetMode:I

    invoke-static {v0}, Lcom/android/camera/module/ModuleManager;->setActiveModuleIndex(I)V

    .line 1139
    iget-boolean v0, p1, Lcom/android/camera/module/loader/StartControl;->mNeedReConfigureCamera:Z

    const/4 v1, 0x0

    if-nez v0, :cond_2

    .line 1140
    iget-object v0, p0, Lcom/android/camera/Camera;->mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

    invoke-virtual {v0, v1, p1, v1}, Lcom/android/camera/fragment/BaseFragmentDelegate;->delegateMode(Lio/reactivex/Completable;Lcom/android/camera/module/loader/StartControl;Lcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;)Lio/reactivex/disposables/Disposable;

    .line 1141
    return-void

    .line 1147
    :cond_2
    iget-object v0, p0, Lcom/android/camera/Camera;->mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

    if-eqz v0, :cond_3

    .line 1148
    iget-object v0, p0, Lcom/android/camera/Camera;->mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

    invoke-virtual {v0}, Lcom/android/camera/fragment/BaseFragmentDelegate;->getAnimationComposite()Lcom/android/camera/animation/AnimationComposite;

    move-result-object v0

    invoke-virtual {v0, v3}, Lcom/android/camera/animation/AnimationComposite;->setClickEnable(Z)V

    .line 1151
    :cond_3
    invoke-virtual {p0, v2}, Lcom/android/camera/Camera;->setSwitchingModule(Z)V

    .line 1153
    invoke-virtual {p0}, Lcom/android/camera/Camera;->isCurrentModuleAlive()Z

    move-result v0

    if-nez v0, :cond_4

    .line 1158
    iput-boolean v3, p1, Lcom/android/camera/module/loader/StartControl;->mNeedBlurAnimation:Z

    .line 1159
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v2, 0x80

    invoke-virtual {v0, v2}, Landroid/view/Window;->clearFlags(I)V

    .line 1163
    :cond_4
    invoke-static {p0}, Lcom/android/camera/ui/V6GestureRecognizer;->getInstance(Lcom/android/camera/ActivityBase;)Lcom/android/camera/ui/V6GestureRecognizer;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/V6GestureRecognizer;->setCurrentModule(Lcom/android/camera/module/Module;)V

    .line 1164
    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    move-object v2, v0

    check-cast v2, Lcom/android/camera/module/BaseModule;

    .line 1165
    if-eqz v2, :cond_5

    .line 1166
    invoke-virtual {v2}, Lcom/android/camera/module/BaseModule;->setDeparted()V

    .line 1168
    :cond_5
    iget v0, p1, Lcom/android/camera/module/loader/StartControl;->mTargetMode:I

    invoke-direct {p0, v0}, Lcom/android/camera/Camera;->createNewModule(I)Lcom/android/camera/module/Module;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    .line 1170
    iget-object v0, p0, Lcom/android/camera/Camera;->mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

    if-nez v0, :cond_6

    .line 1171
    new-instance v0, Lcom/android/camera/fragment/BaseFragmentDelegate;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/BaseFragmentDelegate;-><init>(Lcom/android/camera/Camera;)V

    iput-object v0, p0, Lcom/android/camera/Camera;->mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

    .line 1172
    iget-object v0, p0, Lcom/android/camera/Camera;->mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    iget p1, p1, Lcom/android/camera/module/loader/StartControl;->mTargetMode:I

    invoke-virtual {v0, v1, p1, p0}, Lcom/android/camera/fragment/BaseFragmentDelegate;->init(Landroid/support/v4/app/FragmentManager;ILcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;)V

    goto :goto_1

    .line 1185
    :cond_6
    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    invoke-virtual {v0}, Lcom/android/camera/CameraIntentManager;->checkCallerLegality()Z

    move-result v7

    .line 1186
    new-instance v0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;

    .line 1190
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v4

    const/4 v5, 0x0

    .line 1192
    invoke-virtual {p0}, Lcom/android/camera/Camera;->startFromSecureKeyguard()Z

    move-result v6

    move-object v1, v0

    move-object v3, p1

    invoke-direct/range {v1 .. v7}, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;-><init>(Lcom/android/camera/module/Module;Lcom/android/camera/module/loader/StartControl;Lcom/android/camera/CameraScreenNail;Landroid/content/Intent;ZZ)V

    .line 1186
    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    sget-object v1, Lcom/android/camera/constant/GlobalConstant;->sCameraSetupScheduler:Lio/reactivex/Scheduler;

    .line 1195
    invoke-virtual {v0, v1}, Lio/reactivex/Completable;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Completable;

    move-result-object v0

    .line 1199
    iget-object v1, p0, Lcom/android/camera/Camera;->mCameraPendingSetupDisposableGuard:Ljava/lang/Object;

    monitor-enter v1

    .line 1200
    :try_start_0
    iget-object v2, p0, Lcom/android/camera/Camera;->mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

    invoke-virtual {v2, v0, p1, p0}, Lcom/android/camera/fragment/BaseFragmentDelegate;->delegateMode(Lio/reactivex/Completable;Lcom/android/camera/module/loader/StartControl;Lcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;)Lio/reactivex/disposables/Disposable;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/Camera;->mCameraPendingSetupDisposable:Lio/reactivex/disposables/Disposable;

    .line 1201
    monitor-exit v1

    .line 1203
    :goto_1
    return-void

    .line 1201
    :catchall_0
    move-exception p1

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 2

    .line 642
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v1, "onNewIntent start"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 643
    invoke-virtual {p0, p1}, Lcom/android/camera/Camera;->setIntent(Landroid/content/Intent;)V

    .line 644
    invoke-super {p0, p1}, Lcom/android/camera/ActivityBase;->onNewIntent(Landroid/content/Intent;)V

    .line 645
    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    invoke-virtual {v0}, Lcom/android/camera/CameraIntentManager;->destroy()V

    .line 646
    invoke-static {p1}, Lcom/android/camera/CameraIntentManager;->getInstance(Landroid/content/Intent;)Lcom/android/camera/CameraIntentManager;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    .line 647
    iget-object p1, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    invoke-virtual {p1, p0}, Lcom/android/camera/CameraIntentManager;->setReferer(Landroid/app/Activity;)V

    .line 648
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/Camera;->mJumpedToGallery:Z

    .line 650
    sget-object p1, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v0, "onNewIntent end"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 651
    return-void
.end method

.method public onPause()V
    .locals 4

    .line 749
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v1, "onPause start"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 751
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/android/camera/Camera;->mAppStartTime:J

    .line 752
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/Camera;->mActivityPaused:Z

    .line 753
    const/4 v1, 0x0

    iput v1, p0, Lcom/android/camera/Camera;->mPendingScreenSlideKeyCode:I

    .line 754
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    iget-object v3, p0, Lcom/android/camera/Camera;->mScreenSlideStatusObserver:Landroid/database/ContentObserver;

    invoke-virtual {v2, v3}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 755
    invoke-direct {p0, v1}, Lcom/android/camera/Camera;->switchEdgeFingerMode(Z)V

    .line 756
    iget-object v2, p0, Lcom/android/camera/Camera;->mOrientationListener:Lcom/android/camera/Camera$MyOrientationEventListener;

    invoke-virtual {v2}, Lcom/android/camera/Camera$MyOrientationEventListener;->disable()V

    .line 757
    invoke-static {p0}, Lcom/android/camera/AutoLockManager;->getInstance(Landroid/content/Context;)Lcom/android/camera/AutoLockManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/AutoLockManager;->onPause()V

    .line 758
    invoke-direct {p0}, Lcom/android/camera/Camera;->hideHibernationFragment()V

    .line 760
    invoke-direct {p0}, Lcom/android/camera/Camera;->closeCameraSetup()Z

    .line 761
    const/4 v2, -0x1

    invoke-direct {p0, v2}, Lcom/android/camera/Camera;->setBrightnessRampRate(I)V

    .line 762
    invoke-direct {p0, v1}, Lcom/android/camera/Camera;->setScreenEffect(Z)V

    .line 764
    invoke-virtual {p0, v1}, Lcom/android/camera/Camera;->setSwitchingModule(Z)V

    .line 766
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getWindow()Landroid/view/Window;

    move-result-object v2

    const/16 v3, 0x80

    invoke-virtual {v2, v3}, Landroid/view/Window;->clearFlags(I)V

    .line 767
    iget-boolean v2, p0, Lcom/android/camera/Camera;->mDidRegister:Z

    if-eqz v2, :cond_0

    .line 768
    iget-object v2, p0, Lcom/android/camera/Camera;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v2}, Lcom/android/camera/Camera;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 769
    iput-boolean v1, p0, Lcom/android/camera/Camera;->mDidRegister:Z

    .line 771
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/Camera;->unregisterSDReceiver()V

    .line 773
    invoke-super {p0}, Lcom/android/camera/ActivityBase;->onPause()V

    .line 775
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getScreenHint()Lcom/android/camera/ui/ScreenHint;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 776
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getScreenHint()Lcom/android/camera/ui/ScreenHint;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/ui/ScreenHint;->cancelHint()V

    .line 779
    :cond_1
    iget-object v2, p0, Lcom/android/camera/Camera;->mCameraRootView:Lcom/android/camera/ui/CameraRootView;

    if-eqz v2, :cond_2

    .line 780
    iget-object v2, p0, Lcom/android/camera/Camera;->mCameraRootView:Lcom/android/camera/ui/CameraRootView;

    invoke-virtual {v2}, Lcom/android/camera/ui/CameraRootView;->enableTouchEvent()V

    .line 785
    :cond_2
    iget-object v2, p0, Lcom/android/camera/Camera;->mImageSaver:Lcom/android/camera/storage/ImageSaver;

    if-eqz v2, :cond_3

    .line 786
    iget-object v2, p0, Lcom/android/camera/Camera;->mImageSaver:Lcom/android/camera/storage/ImageSaver;

    invoke-virtual {v2}, Lcom/android/camera/storage/ImageSaver;->onHostPause()V

    .line 788
    :cond_3
    invoke-static {}, Lcom/android/camera/statistic/CameraStat;->recordPageEnd()V

    .line 789
    iput-boolean v1, p0, Lcom/android/camera/Camera;->mDelayReleaseCamera:Z

    .line 790
    invoke-virtual {p0}, Lcom/android/camera/Camera;->isGotoGallery()Z

    move-result v2

    if-nez v2, :cond_5

    invoke-direct {p0}, Lcom/android/camera/Camera;->shouldReleaseLater()Z

    move-result v2

    if-eqz v2, :cond_4

    goto :goto_0

    .line 793
    :cond_4
    invoke-virtual {p0, v1, v0}, Lcom/android/camera/Camera;->releaseAll(ZZ)V

    goto :goto_1

    .line 791
    :cond_5
    :goto_0
    iput-boolean v0, p0, Lcom/android/camera/Camera;->mDelayReleaseCamera:Z

    .line 795
    :goto_1
    invoke-virtual {p0}, Lcom/android/camera/Camera;->removeNewBie()V

    .line 796
    invoke-static {}, Lcom/android/camera/ThermalDetector;->getInstance()Lcom/android/camera/ThermalDetector;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/ThermalDetector;->unregisterReceiver()V

    .line 797
    invoke-direct {p0, v1}, Lcom/android/camera/Camera;->triggerWatchDog(Z)V

    .line 798
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v1, "onPause end"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 799
    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 1

    .line 1372
    invoke-static {}, Lcom/android/camera/permission/PermissionManager;->getCameraRuntimePermissionRequestCode()I

    move-result v0

    if-ne p1, v0, :cond_1

    .line 1374
    invoke-static {p2, p3}, Lcom/android/camera/permission/PermissionManager;->isCameraLaunchPermissionsResultReady([Ljava/lang/String;[I)Z

    move-result p1

    if-nez p1, :cond_0

    .line 1375
    invoke-virtual {p0}, Lcom/android/camera/Camera;->finish()V

    .line 1377
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result p1

    if-nez p1, :cond_1

    invoke-static {p2, p3}, Lcom/android/camera/permission/PermissionManager;->isCameraLocationPermissionsResultReady([Ljava/lang/String;[I)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 1378
    invoke-static {}, Lcom/android/camera/CameraSettings;->isRecordLocation()Z

    move-result p1

    .line 1379
    invoke-static {}, Lcom/android/camera/LocationManager;->instance()Lcom/android/camera/LocationManager;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/android/camera/LocationManager;->recordLocation(Z)V

    .line 1382
    :cond_1
    return-void
.end method

.method protected onRestart()V
    .locals 2

    .line 722
    invoke-super {p0}, Lcom/android/camera/ActivityBase;->onRestart()V

    .line 723
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/Camera;->trackAppLunchTimeStart(Z)V

    .line 724
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/Camera;->mAppStartTime:J

    .line 725
    return-void
.end method

.method public onResume()V
    .locals 5

    .line 655
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v1, "onResume start"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 658
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getKeyguardFlag()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/android/camera/permission/PermissionManager;->checkCameraLaunchPermissions()Z

    move-result v0

    if-nez v0, :cond_0

    .line 659
    invoke-virtual {p0}, Lcom/android/camera/Camera;->finish()V

    .line 662
    :cond_0
    sget-boolean v0, Lcom/android/camera/Util;->sIsFullScreenNavBarHidden:Z

    invoke-static {p0}, Lcom/android/camera/Util;->isFullScreenNavBarHidden(Landroid/content/Context;)Z

    move-result v1

    if-eq v0, v1, :cond_1

    .line 663
    invoke-static {p0}, Lcom/android/camera/Util;->initialize(Landroid/content/Context;)V

    .line 665
    :cond_1
    invoke-static {p0}, Lcom/android/camera/AutoLockManager;->getInstance(Landroid/content/Context;)Lcom/android/camera/AutoLockManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/AutoLockManager;->onResume()V

    .line 666
    iget-object v0, p0, Lcom/android/camera/Camera;->mProximitySensorLock:Lcom/android/camera/ProximitySensorLock;

    if-eqz v0, :cond_2

    .line 667
    iget-object v0, p0, Lcom/android/camera/Camera;->mProximitySensorLock:Lcom/android/camera/ProximitySensorLock;

    invoke-virtual {v0}, Lcom/android/camera/ProximitySensorLock;->onResume()V

    .line 669
    :cond_2
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/android/camera/Util;->SCREEN_SLIDE_STATUS_SETTING_URI:Landroid/net/Uri;

    iget-object v2, p0, Lcom/android/camera/Camera;->mScreenSlideStatusObserver:Landroid/database/ContentObserver;

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3, v2}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 670
    const-string v0, "CameraActivity"

    invoke-static {p0, v0}, Lcom/android/camera/statistic/CameraStat;->recordPageStart(Landroid/content/Context;Ljava/lang/String;)V

    .line 671
    invoke-static {p0}, Lcom/android/camera/Util;->checkLockedOrientation(Landroid/app/Activity;)V

    .line 672
    iput-boolean v3, p0, Lcom/android/camera/Camera;->mActivityPaused:Z

    .line 673
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/android/camera/Camera;->switchEdgeFingerMode(Z)V

    .line 674
    iput-boolean v3, p0, Lcom/android/camera/Camera;->mFirstOrientationArrived:Z

    .line 675
    iget-object v1, p0, Lcom/android/camera/Camera;->mOrientationListener:Lcom/android/camera/Camera$MyOrientationEventListener;

    invoke-virtual {v1}, Lcom/android/camera/Camera$MyOrientationEventListener;->enable()V

    .line 677
    invoke-super {p0}, Lcom/android/camera/ActivityBase;->onResume()V

    .line 680
    invoke-static {p0}, Lcom/android/camera/storage/Storage;->initStorage(Landroid/content/Context;)V

    .line 683
    invoke-static {}, Lcom/android/camera/storage/Storage;->isUseDocumentMode()Z

    move-result v1

    if-eqz v1, :cond_4

    sget-object v1, Lcom/android/camera/storage/Storage;->DIRECTORY:Ljava/lang/String;

    invoke-static {v1}, Lcom/android/camera/FileCompat;->hasStoragePermission(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 684
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getKeyguardFlag()Z

    move-result v1

    if-nez v1, :cond_3

    .line 685
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v1, "start request documents permission"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 686
    sget-object v0, Lcom/android/camera/storage/Storage;->DIRECTORY:Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/android/camera/FileCompat;->getStorageAccessForLOLLIPOP(Landroid/app/Activity;Ljava/lang/String;)Z

    .line 687
    return-void

    .line 690
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

    .line 691
    invoke-static {v3}, Lcom/android/camera/storage/PriorityStorageBroadcastReceiver;->setPriorityStorage(Z)V

    .line 694
    :cond_4
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getScreenHint()Lcom/android/camera/ui/ScreenHint;

    move-result-object v1

    if-eqz v1, :cond_5

    .line 695
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getScreenHint()Lcom/android/camera/ui/ScreenHint;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/ui/ScreenHint;->updateHint()V

    .line 698
    :cond_5
    invoke-direct {p0}, Lcom/android/camera/Camera;->registerReceiver()V

    .line 699
    invoke-direct {p0}, Lcom/android/camera/Camera;->registerSDReceiver()V

    .line 700
    invoke-direct {p0}, Lcom/android/camera/Camera;->resumeCamera()V

    .line 701
    iput-boolean v3, p0, Lcom/android/camera/Camera;->mIsModeSwitched:Z

    .line 703
    invoke-static {}, Lcom/android/camera/ThermalDetector;->getInstance()Lcom/android/camera/ThermalDetector;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/ThermalDetector;->registerReceiver()V

    .line 709
    iget-object v1, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    invoke-virtual {v1}, Lcom/android/camera/CameraIntentManager;->isImageCaptureIntent()Z

    move-result v1

    if-nez v1, :cond_7

    iget-object v1, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    .line 710
    invoke-virtual {v1}, Lcom/android/camera/CameraIntentManager;->isVideoCaptureIntent()Z

    move-result v1

    if-eqz v1, :cond_6

    goto :goto_0

    :cond_6
    goto :goto_1

    .line 711
    :cond_7
    :goto_0
    move v3, v0

    :goto_1
    iget-object v1, p0, Lcom/android/camera/Camera;->mImageSaver:Lcom/android/camera/storage/ImageSaver;

    if-nez v1, :cond_8

    .line 712
    new-instance v1, Lcom/android/camera/storage/ImageSaver;

    iget-object v2, p0, Lcom/android/camera/Camera;->mHandler:Landroid/os/Handler;

    invoke-direct {v1, p0, v2, v3}, Lcom/android/camera/storage/ImageSaver;-><init>(Lcom/android/camera/ActivityBase;Landroid/os/Handler;Z)V

    iput-object v1, p0, Lcom/android/camera/Camera;->mImageSaver:Lcom/android/camera/storage/ImageSaver;

    .line 714
    :cond_8
    iget-object v1, p0, Lcom/android/camera/Camera;->mImageSaver:Lcom/android/camera/storage/ImageSaver;

    invoke-virtual {v1, v3}, Lcom/android/camera/storage/ImageSaver;->onHostResume(Z)V

    .line 715
    invoke-direct {p0}, Lcom/android/camera/Camera;->bindServices()V

    .line 716
    invoke-direct {p0, v0}, Lcom/android/camera/Camera;->triggerWatchDog(Z)V

    .line 717
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v1, "onResume end"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 718
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 1

    .line 730
    sget-object p1, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v0, "onSaveInstanceState"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 731
    return-void
.end method

.method public onStop()V
    .locals 2

    .line 803
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v1, "onStop start"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 804
    invoke-super {p0}, Lcom/android/camera/ActivityBase;->onStop()V

    .line 805
    iget-boolean v0, p0, Lcom/android/camera/Camera;->mDelayReleaseCamera:Z

    if-eqz v0, :cond_2

    .line 806
    invoke-virtual {p0}, Lcom/android/camera/Camera;->isGotoGallery()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/Camera;->isSelectingCapturedResult()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 809
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/Camera;->isPostProcessing()Z

    move-result v0

    if-nez v0, :cond_2

    .line 810
    iput-boolean v1, p0, Lcom/android/camera/Camera;->mDelayReleaseCamera:Z

    .line 811
    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0}, Lcom/android/camera/module/Module;->onHostStopAndNotifyActionStop()V

    goto :goto_1

    .line 807
    :cond_1
    :goto_0
    iput-boolean v1, p0, Lcom/android/camera/Camera;->mDelayReleaseCamera:Z

    .line 808
    const/4 v0, 0x1

    invoke-virtual {p0, v0, v0}, Lcom/android/camera/Camera;->releaseAll(ZZ)V

    .line 815
    :cond_2
    :goto_1
    invoke-direct {p0}, Lcom/android/camera/Camera;->unbindServices()V

    .line 816
    invoke-direct {p0}, Lcom/android/camera/Camera;->boostParallelServiceAdj()V

    .line 818
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc4

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$FullScreenProtocol;

    .line 819
    if-eqz v0, :cond_3

    .line 820
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$FullScreenProtocol;->hideScreenLight()V

    .line 822
    :cond_3
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v1, "onStop end"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 823
    return-void
.end method

.method public onUserInteraction()V
    .locals 2

    .line 1107
    invoke-super {p0}, Lcom/android/camera/ActivityBase;->onUserInteraction()V

    .line 1108
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v1, "onUserInteraction"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1109
    invoke-static {p0}, Lcom/android/camera/AutoLockManager;->getInstance(Landroid/content/Context;)Lcom/android/camera/AutoLockManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/AutoLockManager;->onUserInteraction()V

    .line 1110
    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    if-eqz v0, :cond_0

    .line 1111
    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0}, Lcom/android/camera/module/Module;->onUserInteraction()V

    .line 1113
    :cond_0
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 3

    .line 1055
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onWindowFocusChanged hasFocus->"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1056
    iput-boolean p1, p0, Lcom/android/camera/Camera;->mHasFocus:Z

    .line 1057
    invoke-super {p0, p1}, Lcom/android/camera/ActivityBase;->onWindowFocusChanged(Z)V

    .line 1058
    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    if-nez v0, :cond_0

    .line 1059
    return-void

    .line 1061
    :cond_0
    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0, p1}, Lcom/android/camera/module/Module;->onWindowFocusChanged(Z)V

    .line 1062
    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraBrightness:Lcom/android/camera/CameraBrightness;

    if-eqz v0, :cond_1

    .line 1063
    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraBrightness:Lcom/android/camera/CameraBrightness;

    invoke-virtual {v0, p1}, Lcom/android/camera/CameraBrightness;->onWindowFocusChanged(Z)V

    .line 1066
    :cond_1
    if-eqz p1, :cond_2

    .line 1067
    invoke-static {p0}, Lcom/android/camera/Util;->checkLockedOrientation(Landroid/app/Activity;)V

    .line 1068
    iget-object p1, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {p1}, Lcom/android/camera/module/Module;->checkActivityOrientation()V

    .line 1069
    iget-object p1, p0, Lcom/android/camera/Camera;->mSensorStateManager:Lcom/android/camera/SensorStateManager;

    if-eqz p1, :cond_3

    .line 1070
    iget-object p1, p0, Lcom/android/camera/Camera;->mSensorStateManager:Lcom/android/camera/SensorStateManager;

    invoke-virtual {p1}, Lcom/android/camera/SensorStateManager;->register()V

    goto :goto_0

    .line 1074
    :cond_2
    iget-object p1, p0, Lcom/android/camera/Camera;->mSensorStateManager:Lcom/android/camera/SensorStateManager;

    if-eqz p1, :cond_3

    .line 1075
    iget-object p1, p0, Lcom/android/camera/Camera;->mSensorStateManager:Lcom/android/camera/SensorStateManager;

    const/16 v0, 0x7f

    invoke-virtual {p1, v0}, Lcom/android/camera/SensorStateManager;->unregister(I)V

    .line 1078
    :cond_3
    :goto_0
    return-void
.end method

.method public pause()V
    .locals 1

    .line 742
    invoke-virtual {p0}, Lcom/android/camera/Camera;->isVideoRecording()Z

    move-result v0

    if-nez v0, :cond_0

    .line 743
    invoke-super {p0}, Lcom/android/camera/ActivityBase;->pause()V

    .line 745
    :cond_0
    return-void
.end method

.method public registerProtocol()V
    .locals 10

    .line 365
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->forceDestroy()V

    .line 366
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    invoke-static {v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->create(I)V

    .line 367
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    invoke-static {v0}, Lcom/android/camera/EffectChangedListenerController;->setHoldKey(I)V

    .line 369
    new-instance v0, Lcom/android/camera/module/impl/ImplFactory;

    invoke-direct {v0}, Lcom/android/camera/module/impl/ImplFactory;-><init>()V

    iput-object v0, p0, Lcom/android/camera/Camera;->mImplFactory:Lcom/android/camera/module/impl/ImplFactory;

    .line 370
    iget-object v0, p0, Lcom/android/camera/Camera;->mImplFactory:Lcom/android/camera/module/impl/ImplFactory;

    const/4 v1, 0x1

    new-array v1, v1, [I

    const/4 v2, 0x0

    const/16 v3, 0xab

    aput v3, v1, v2

    invoke-virtual {v0, p0, v1}, Lcom/android/camera/module/impl/ImplFactory;->initBase(Lcom/android/camera/ActivityBase;[I)V

    .line 372
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    .line 373
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getCameraIntentManager()Lcom/android/camera/CameraIntentManager;

    .line 374
    iget-object v1, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    invoke-virtual {v1}, Lcom/android/camera/CameraIntentManager;->checkCallerLegality()Z

    move-result v1

    .line 375
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getIntent()Landroid/content/Intent;

    move-result-object v5

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    invoke-virtual {p0}, Lcom/android/camera/Camera;->startFromSecureKeyguard()Z

    move-result v7

    const/4 v8, 0x0

    const/4 v9, 0x1

    move-object v4, v0

    invoke-virtual/range {v4 .. v9}, Lcom/android/camera/data/data/global/DataItemGlobal;->parseIntent(Landroid/content/Intent;Ljava/lang/Boolean;ZZZ)Landroid/support/v4/util/Pair;

    .line 376
    nop

    .line 377
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->isTimeOut()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 378
    const/4 v1, 0x3

    goto :goto_0

    .line 380
    :cond_0
    const/4 v1, 0x2

    :goto_0
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v0

    invoke-static {v0}, Lcom/android/camera/module/loader/StartControl;->create(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/android/camera/module/loader/StartControl;->setResetType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/camera/Camera;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    .line 381
    return-void
.end method

.method public releaseAll(ZZ)V
    .locals 2

    .line 911
    sget-object p1, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "releaseAll: releaseDevice = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", isCurrentModuleAlive = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 912
    invoke-virtual {p0}, Lcom/android/camera/Camera;->isCurrentModuleAlive()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 911
    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 913
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/Camera;->mDelayReleaseCamera:Z

    .line 922
    iget-object p1, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    if-eqz p1, :cond_0

    .line 923
    iget-object p1, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {p1}, Lcom/android/camera/module/Module;->setDeparted()V

    .line 926
    :cond_0
    sget-object p1, Lcom/android/camera/constant/GlobalConstant;->sCameraSetupScheduler:Lio/reactivex/Scheduler;

    new-instance v0, Lcom/android/camera/Camera$5;

    invoke-direct {v0, p0, p2}, Lcom/android/camera/Camera$5;-><init>(Lcom/android/camera/Camera;Z)V

    invoke-virtual {p1, v0}, Lio/reactivex/Scheduler;->scheduleDirect(Ljava/lang/Runnable;)Lio/reactivex/disposables/Disposable;

    .line 961
    return-void
.end method

.method protected releaseCameraScreenNail()V
    .locals 0

    .line 539
    invoke-super {p0}, Lcom/android/camera/ActivityBase;->releaseCameraScreenNail()V

    .line 540
    return-void
.end method

.method public removeNewBie()V
    .locals 3

    .line 1503
    nop

    .line 1504
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v0

    .line 1505
    iget-object v1, p0, Lcom/android/camera/Camera;->newbieDialogFragmentTag:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 1506
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    iget-object v2, p0, Lcom/android/camera/Camera;->newbieDialogFragmentTag:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v1

    .line 1507
    if-eqz v1, :cond_0

    .line 1508
    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentTransaction;->remove(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    .line 1511
    :cond_0
    invoke-virtual {v0}, Landroid/support/v4/app/FragmentTransaction;->commitAllowingStateLoss()I

    .line 1512
    return-void
.end method

.method public restoreWindowBrightness()V
    .locals 2

    .line 1628
    nop

    .line 1629
    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraBrightness:Lcom/android/camera/CameraBrightness;

    if-eqz v0, :cond_0

    .line 1630
    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraBrightness:Lcom/android/camera/CameraBrightness;

    invoke-virtual {v0}, Lcom/android/camera/CameraBrightness;->getCurrentBrightness()I

    move-result v0

    .line 1631
    if-lez v0, :cond_0

    .line 1632
    int-to-float v0, v0

    const/high16 v1, 0x437f0000    # 255.0f

    div-float/2addr v0, v1

    goto :goto_0

    .line 1635
    :cond_0
    const/high16 v0, -0x40800000    # -1.0f

    :goto_0
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    .line 1636
    iput v0, v1, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    .line 1637
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 1638
    const/4 v0, -0x1

    invoke-direct {p0, v0}, Lcom/android/camera/Camera;->setBrightnessRampRate(I)V

    .line 1639
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/camera/Camera;->setScreenEffect(Z)V

    .line 1640
    return-void
.end method

.method public resume()V
    .locals 1

    .line 735
    invoke-virtual {p0}, Lcom/android/camera/Camera;->isVideoRecording()Z

    move-result v0

    if-nez v0, :cond_0

    .line 736
    invoke-super {p0}, Lcom/android/camera/ActivityBase;->resume()V

    .line 738
    :cond_0
    return-void
.end method

.method public resumeCurrentMode(I)V
    .locals 4

    .line 512
    invoke-direct {p0}, Lcom/android/camera/Camera;->closeCameraSetup()Z

    .line 513
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/Camera;->setSwitchingModule(Z)V

    .line 514
    new-instance v0, Lcom/android/camera/module/loader/FunctionCameraLegacySetup;

    invoke-direct {v0, p1}, Lcom/android/camera/module/loader/FunctionCameraLegacySetup;-><init>(I)V

    .line 516
    new-instance v1, Lcom/android/camera/module/loader/FunctionResumeModule;

    invoke-direct {v1, p1}, Lcom/android/camera/module/loader/FunctionResumeModule;-><init>(I)V

    .line 518
    iget-object p1, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    check-cast p1, Lcom/android/camera/module/BaseModule;

    .line 519
    invoke-static {p1}, Lcom/android/camera/module/loader/NullHolder;->ofNullable(Ljava/lang/Object;)Lcom/android/camera/module/loader/NullHolder;

    move-result-object p1

    invoke-static {p1}, Lio/reactivex/Single;->just(Ljava/lang/Object;)Lio/reactivex/Single;

    move-result-object p1

    sget-object v2, Lcom/android/camera/constant/GlobalConstant;->sCameraSetupScheduler:Lio/reactivex/Scheduler;

    .line 520
    invoke-virtual {p1, v2}, Lio/reactivex/Single;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Single;

    move-result-object p1

    .line 521
    invoke-virtual {p1, v0}, Lio/reactivex/Single;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Single;

    move-result-object p1

    .line 523
    iget-object v0, p0, Lcom/android/camera/Camera;->mCamera2OpenOnSubScribe:Lcom/android/camera/module/loader/camera2/Camera2OpenOnSubScribe;

    .line 524
    invoke-static {v0}, Lio/reactivex/Single;->create(Lio/reactivex/SingleOnSubscribe;)Lio/reactivex/Single;

    move-result-object v0

    sget-object v2, Lcom/android/camera/constant/GlobalConstant;->sCameraSetupScheduler:Lio/reactivex/Scheduler;

    .line 525
    invoke-virtual {v0, v2}, Lio/reactivex/Single;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Single;

    move-result-object v0

    .line 527
    iget-object v2, p0, Lcom/android/camera/Camera;->mCameraSetupDisposableGuard:Ljava/lang/Object;

    monitor-enter v2

    .line 528
    :try_start_0
    iget-object v3, p0, Lcom/android/camera/Camera;->mCameraOpenResult:Lio/reactivex/functions/BiFunction;

    invoke-virtual {p1, v0, v3}, Lio/reactivex/Single;->zipWith(Lio/reactivex/SingleSource;Lio/reactivex/functions/BiFunction;)Lio/reactivex/Single;

    move-result-object p1

    .line 530
    invoke-virtual {p1, v1}, Lio/reactivex/Single;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Single;

    move-result-object p1

    .line 531
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Single;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Single;

    move-result-object p1

    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraSetupConsumer:Lio/reactivex/functions/Consumer;

    .line 532
    invoke-virtual {p1, v0}, Lio/reactivex/Single;->subscribe(Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/Camera;->mCameraSetupDisposable:Lio/reactivex/disposables/Disposable;

    .line 533
    monitor-exit v2

    .line 534
    return-void

    .line 533
    :catchall_0
    move-exception p1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
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

    .line 402
    return-void
.end method

.method public setWindowBrightness(I)V
    .locals 2

    .line 1620
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/camera/Camera;->setBrightnessRampRate(I)V

    .line 1621
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/android/camera/Camera;->setScreenEffect(Z)V

    .line 1622
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    .line 1623
    int-to-float p1, p1

    const/high16 v1, 0x437f0000    # 255.0f

    div-float/2addr p1, v1

    iput p1, v0, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    .line 1624
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 1625
    return-void
.end method

.method public showLensDirtyDetectedHint()V
    .locals 3

    .line 1741
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fK()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1742
    iget-object v0, p0, Lcom/android/camera/Camera;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/camera/Camera$13;

    invoke-direct {v1, p0}, Lcom/android/camera/Camera$13;-><init>(Lcom/android/camera/Camera;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 1757
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    const-string v1, "LensDirtyDetectDialog"

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    .line 1758
    if-nez v0, :cond_1

    .line 1759
    new-instance v0, Lcom/android/camera/fragment/dialog/LensDirtyDetectDialogFragment;

    invoke-direct {v0}, Lcom/android/camera/fragment/dialog/LensDirtyDetectDialogFragment;-><init>()V

    .line 1760
    const/4 v1, 0x2

    const v2, 0x7f0c001f

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/app/DialogFragment;->setStyle(II)V

    .line 1761
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    const-string v2, "LensDirtyDetectDialog"

    .line 1762
    invoke-virtual {v1, v0, v2}, Landroid/support/v4/app/FragmentTransaction;->add(Landroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object v0

    .line 1763
    invoke-virtual {v0}, Landroid/support/v4/app/FragmentTransaction;->commitAllowingStateLoss()I

    .line 1766
    :cond_1
    :goto_0
    return-void
.end method

.method public showNewBie(I)Z
    .locals 5

    .line 1414
    const v0, 0x7f0c001e

    const/4 v1, 0x2

    const-wide/16 v2, 0x1f4

    const/4 v4, 0x1

    packed-switch p1, :pswitch_data_0

    .line 1477
    const/4 p1, 0x0

    return p1

    .line 1455
    :pswitch_0
    iget-object p1, p0, Lcom/android/camera/Camera;->mHandler:Landroid/os/Handler;

    new-instance v0, Lcom/android/camera/Camera$7;

    invoke-direct {v0, p0}, Lcom/android/camera/Camera$7;-><init>(Lcom/android/camera/Camera;)V

    invoke-virtual {p1, v0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1473
    return v4

    .line 1434
    :pswitch_1
    iget-object p1, p0, Lcom/android/camera/Camera;->mHandler:Landroid/os/Handler;

    new-instance v0, Lcom/android/camera/Camera$6;

    invoke-direct {v0, p0}, Lcom/android/camera/Camera$6;-><init>(Lcom/android/camera/Camera;)V

    invoke-virtual {p1, v0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1452
    return v4

    .line 1425
    :pswitch_2
    new-instance p1, Lcom/android/camera/fragment/dialog/FrontRotateNewbieDialogFragment;

    invoke-direct {p1}, Lcom/android/camera/fragment/dialog/FrontRotateNewbieDialogFragment;-><init>()V

    .line 1426
    invoke-virtual {p1, v1, v0}, Landroid/support/v4/app/DialogFragment;->setStyle(II)V

    .line 1427
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v0

    const-string v1, "RotateHint"

    .line 1428
    invoke-virtual {v0, p1, v1}, Landroid/support/v4/app/FragmentTransaction;->add(Landroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object p1

    .line 1429
    invoke-virtual {p1}, Landroid/support/v4/app/FragmentTransaction;->commitAllowingStateLoss()I

    .line 1430
    const-string p1, "RotateHint"

    iput-object p1, p0, Lcom/android/camera/Camera;->newbieDialogFragmentTag:Ljava/lang/String;

    .line 1431
    return v4

    .line 1416
    :pswitch_3
    new-instance p1, Lcom/android/camera/fragment/dialog/PortraitNewbieDialogFragment;

    invoke-direct {p1}, Lcom/android/camera/fragment/dialog/PortraitNewbieDialogFragment;-><init>()V

    .line 1417
    invoke-virtual {p1, v1, v0}, Landroid/support/v4/app/DialogFragment;->setStyle(II)V

    .line 1418
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v0

    const-string v1, "PortraitHint"

    .line 1419
    invoke-virtual {v0, p1, v1}, Landroid/support/v4/app/FragmentTransaction;->add(Landroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object p1

    .line 1420
    invoke-virtual {p1}, Landroid/support/v4/app/FragmentTransaction;->commitAllowingStateLoss()I

    .line 1421
    const-string p1, "PortraitHint"

    iput-object p1, p0, Lcom/android/camera/Camera;->newbieDialogFragmentTag:Ljava/lang/String;

    .line 1422
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

    .line 385
    iget-object v0, p0, Lcom/android/camera/Camera;->mImplFactory:Lcom/android/camera/module/impl/ImplFactory;

    if-eqz v0, :cond_0

    .line 388
    iget-object v0, p0, Lcom/android/camera/Camera;->mImplFactory:Lcom/android/camera/module/impl/ImplFactory;

    invoke-virtual {v0}, Lcom/android/camera/module/impl/ImplFactory;->detachBase()V

    .line 391
    :cond_0
    iget-object v0, p0, Lcom/android/camera/Camera;->mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

    if-eqz v0, :cond_1

    .line 392
    iget-object v0, p0, Lcom/android/camera/Camera;->mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

    invoke-virtual {v0}, Lcom/android/camera/fragment/BaseFragmentDelegate;->unRegisterProtocol()V

    .line 393
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/Camera;->mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

    .line 395
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    invoke-static {v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->destroyAll(I)V

    .line 396
    return-void
.end method

.method public updateSurfaceState(I)V
    .locals 1

    .line 1516
    invoke-super {p0, p1}, Lcom/android/camera/ActivityBase;->updateSurfaceState(I)V

    .line 1518
    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    .line 1519
    iget-object p1, p0, Lcom/android/camera/Camera;->mCamera2OpenOnSubScribe:Lcom/android/camera/module/loader/camera2/Camera2OpenOnSubScribe;

    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/Camera2OpenOnSubScribe;->onGlSurfaceCreated()V

    .line 1520
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isCapture()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 1521
    iget-object p1, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    check-cast p1, Lcom/android/camera/module/BaseModule;

    .line 1522
    invoke-virtual {p1}, Lcom/android/camera/module/BaseModule;->updatePreviewSurface()V

    .line 1525
    :cond_0
    return-void
.end method
