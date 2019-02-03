.class public Lcom/android/camera/module/loader/camera2/Camera2OpenManager;
.super Ljava/lang/Object;
.source "Camera2OpenManager.java"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "MissingPermission"
    }
.end annotation

.annotation build Landroid/annotation/TargetApi;
    value = 0x15
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/module/loader/camera2/Camera2OpenManager$ManagerState;
    }
.end annotation


# static fields
.field private static final CAMERA_OPEN_OR_CLOSE_TIMEOUT:J = 0x1388L

.field private static final MANAGER_MSG_CLOSE_FINISH:I = 0x3

.field private static final MANAGER_MSG_FORCE_CLOSE_CAMERA:I = 0x2

.field private static final MANAGER_MSG_OPEN_FINISH:I = 0x4

.field private static final MANAGER_MSG_REQUEST_CAMERA:I = 0x1

.field private static final MANAGER_STATE_IDLE:I = 0x1

.field private static final MANAGER_STATE_WAITING_CLOSE:I = 0x2

.field private static final MANAGER_STATE_WAITING_OPEN:I = 0x3

.field private static final TAG:Ljava/lang/String;

.field private static sInstance:Lcom/android/camera/module/loader/camera2/Camera2OpenManager;


# instance fields
.field private mCamera2Device:Lcom/android/camera2/Camera2Proxy;

.field private mCamera2Service:Landroid/hardware/camera2/CameraManager;

.field private mCameraHandler:Landroid/os/Handler;

.field private mCameraMainThreadHandler:Landroid/os/Handler;

.field private final mCameraOpenCallback:Landroid/hardware/camera2/CameraDevice$StateCallback;

.field private mCameraResultEmitter:Lio/reactivex/ObservableEmitter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/ObservableEmitter<",
            "Lcom/android/camera/module/loader/camera2/Camera2Result;",
            ">;"
        }
    .end annotation
.end field

.field private mCameraResultObservable:Lio/reactivex/observables/ConnectableObservable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/observables/ConnectableObservable<",
            "Lcom/android/camera/module/loader/camera2/Camera2Result;",
            ">;"
        }
    .end annotation
.end field

.field private mCurrentModule:Ljava/util/concurrent/atomic/AtomicInteger;

.field private mCurrentState:I

.field private final mEmitterLock:Ljava/lang/Object;

.field private mPendingCameraId:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 43
    const-class v0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mEmitterLock:Ljava/lang/Object;

    .line 54
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, -0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mPendingCameraId:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 55
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/16 v1, 0xa0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCurrentModule:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 75
    const/4 v0, 0x1

    iput v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCurrentState:I

    .line 130
    new-instance v0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager$2;

    invoke-direct {v0, p0}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager$2;-><init>(Lcom/android/camera/module/loader/camera2/Camera2OpenManager;)V

    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraOpenCallback:Landroid/hardware/camera2/CameraDevice$StateCallback;

    .line 79
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->initData()V

    .line 80
    return-void
.end method

.method private abandonOpenObservableIfExists()V
    .locals 4

    .line 182
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mEmitterLock:Ljava/lang/Object;

    monitor-enter v0

    .line 183
    :try_start_0
    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraResultEmitter:Lio/reactivex/ObservableEmitter;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraResultEmitter:Lio/reactivex/ObservableEmitter;

    invoke-interface {v1}, Lio/reactivex/ObservableEmitter;->isDisposed()Z

    move-result v1

    if-nez v1, :cond_0

    .line 184
    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraResultEmitter:Lio/reactivex/ObservableEmitter;

    const/4 v2, 0x3

    invoke-static {v2}, Lcom/android/camera/module/loader/camera2/Camera2Result;->create(I)Lcom/android/camera/module/loader/camera2/Camera2Result;

    move-result-object v2

    const/16 v3, 0xe1

    .line 185
    invoke-virtual {v2, v3}, Lcom/android/camera/module/loader/camera2/Camera2Result;->setCameraError(I)Lcom/android/camera/module/loader/camera2/Camera2Result;

    move-result-object v2

    .line 184
    invoke-interface {v1, v2}, Lio/reactivex/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    .line 186
    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraResultEmitter:Lio/reactivex/ObservableEmitter;

    invoke-interface {v1}, Lio/reactivex/ObservableEmitter;->onComplete()V

    .line 187
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraResultEmitter:Lio/reactivex/ObservableEmitter;

    .line 189
    :cond_0
    monitor-exit v0

    .line 190
    return-void

    .line 189
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method static synthetic access$000(Lcom/android/camera/module/loader/camera2/Camera2OpenManager;Landroid/os/Message;)V
    .locals 0

    .line 42
    invoke-direct {p0, p1}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->onMessage(Landroid/os/Message;)V

    return-void
.end method

.method static synthetic access$102(Lcom/android/camera/module/loader/camera2/Camera2OpenManager;Lcom/android/camera2/Camera2Proxy;)Lcom/android/camera2/Camera2Proxy;
    .locals 0

    .line 42
    iput-object p1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    return-object p1
.end method

.method static synthetic access$200()Ljava/lang/String;
    .locals 1

    .line 42
    sget-object v0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$300(Lcom/android/camera/module/loader/camera2/Camera2OpenManager;)Landroid/os/Handler;
    .locals 0

    .line 42
    iget-object p0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraHandler:Landroid/os/Handler;

    return-object p0
.end method

.method static synthetic access$400(Lcom/android/camera/module/loader/camera2/Camera2OpenManager;ILjava/lang/String;)V
    .locals 0

    .line 42
    invoke-direct {p0, p1, p2}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->onCameraOpenFailed(ILjava/lang/String;)V

    return-void
.end method

.method static synthetic access$502(Lcom/android/camera/module/loader/camera2/Camera2OpenManager;Lio/reactivex/ObservableEmitter;)Lio/reactivex/ObservableEmitter;
    .locals 0

    .line 42
    iput-object p1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraResultEmitter:Lio/reactivex/ObservableEmitter;

    return-object p1
.end method

.method private attachInObservable(Lio/reactivex/Observer;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer<",
            "Lcom/android/camera/module/loader/camera2/Camera2Result;",
            ">;)Z"
        }
    .end annotation

    .line 194
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mEmitterLock:Ljava/lang/Object;

    monitor-enter v0

    .line 195
    :try_start_0
    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraResultEmitter:Lio/reactivex/ObservableEmitter;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraResultEmitter:Lio/reactivex/ObservableEmitter;

    invoke-interface {v1}, Lio/reactivex/ObservableEmitter;->isDisposed()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 228
    :cond_0
    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraResultObservable:Lio/reactivex/observables/ConnectableObservable;

    invoke-virtual {v1, p1}, Lio/reactivex/observables/ConnectableObservable;->subscribe(Lio/reactivex/Observer;)V

    .line 229
    const/4 p1, 0x1

    goto :goto_1

    .line 196
    :cond_1
    :goto_0
    new-instance v1, Lcom/android/camera/module/loader/camera2/Camera2OpenManager$4;

    invoke-direct {v1, p0}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager$4;-><init>(Lcom/android/camera/module/loader/camera2/Camera2OpenManager;)V

    invoke-static {v1}, Lio/reactivex/Observable;->create(Lio/reactivex/ObservableOnSubscribe;)Lio/reactivex/Observable;

    move-result-object v1

    const-wide/16 v2, 0x1388

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 203
    invoke-virtual {v1, v2, v3, v4}, Lio/reactivex/Observable;->timeout(JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Observable;

    move-result-object v1

    new-instance v2, Lcom/android/camera/module/loader/camera2/Camera2OpenManager$3;

    invoke-direct {v2, p0}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager$3;-><init>(Lcom/android/camera/module/loader/camera2/Camera2OpenManager;)V

    invoke-virtual {v1, v2}, Lio/reactivex/Observable;->onErrorResumeNext(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object v1

    sget-object v2, Lcom/android/camera/constant/GlobalConstant;->sCameraSetupScheduler:Lio/reactivex/Scheduler;

    .line 217
    invoke-virtual {v1, v2}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v1

    .line 219
    invoke-virtual {v1}, Lio/reactivex/Observable;->publish()Lio/reactivex/observables/ConnectableObservable;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraResultObservable:Lio/reactivex/observables/ConnectableObservable;

    .line 220
    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraResultObservable:Lio/reactivex/observables/ConnectableObservable;

    invoke-virtual {v1, p1}, Lio/reactivex/observables/ConnectableObservable;->subscribe(Lio/reactivex/Observer;)V

    .line 222
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraResultObservable:Lio/reactivex/observables/ConnectableObservable;

    invoke-virtual {p1}, Lio/reactivex/observables/ConnectableObservable;->connect()Lio/reactivex/disposables/Disposable;

    .line 226
    const/4 p1, 0x0

    .line 227
    nop

    .line 231
    :goto_1
    monitor-exit v0

    .line 232
    return p1

    .line 231
    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public static declared-synchronized getInstance()Lcom/android/camera/module/loader/camera2/Camera2OpenManager;
    .locals 2

    const-class v0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    monitor-enter v0

    .line 101
    :try_start_0
    sget-object v1, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->sInstance:Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    if-nez v1, :cond_0

    .line 102
    new-instance v1, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    invoke-direct {v1}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;-><init>()V

    sput-object v1, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->sInstance:Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    .line 104
    :cond_0
    sget-object v1, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->sInstance:Lcom/android/camera/module/loader/camera2/Camera2OpenManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    .line 100
    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private getManagerState()I
    .locals 1
    .annotation build Lcom/android/camera/module/loader/camera2/Camera2OpenManager$ManagerState;
    .end annotation

    .line 375
    iget v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCurrentState:I

    return v0
.end method

.method private initData()V
    .locals 2

    .line 83
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "Camera Handler Thread"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 84
    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 85
    new-instance v1, Lcom/android/camera/module/loader/camera2/Camera2OpenManager$1;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {v1, p0, v0}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager$1;-><init>(Lcom/android/camera/module/loader/camera2/Camera2OpenManager;Landroid/os/Looper;)V

    iput-object v1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraHandler:Landroid/os/Handler;

    .line 91
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraMainThreadHandler:Landroid/os/Handler;

    .line 93
    nop

    .line 94
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "camera"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/camera2/CameraManager;

    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCamera2Service:Landroid/hardware/camera2/CameraManager;

    .line 97
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCamera2Service:Landroid/hardware/camera2/CameraManager;

    invoke-static {v0}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance(Landroid/hardware/camera2/CameraManager;)Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    .line 98
    return-void
.end method

.method private onCameraOpenFailed(ILjava/lang/String;)V
    .locals 3

    .line 389
    sget-object v0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onCameraOpenFailed: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " msg:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, p2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 390
    const/4 p2, 0x1

    invoke-direct {p0, p2}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->setManagerState(I)V

    .line 391
    iget-object p2, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mEmitterLock:Ljava/lang/Object;

    monitor-enter p2

    .line 392
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraResultEmitter:Lio/reactivex/ObservableEmitter;

    if-eqz v0, :cond_0

    .line 393
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraResultEmitter:Lio/reactivex/ObservableEmitter;

    const/4 v1, 0x3

    .line 394
    invoke-static {v1}, Lcom/android/camera/module/loader/camera2/Camera2Result;->create(I)Lcom/android/camera/module/loader/camera2/Camera2Result;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/android/camera/module/loader/camera2/Camera2Result;->setCameraError(I)Lcom/android/camera/module/loader/camera2/Camera2Result;

    move-result-object p1

    .line 393
    invoke-interface {v0, p1}, Lio/reactivex/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    .line 395
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraResultEmitter:Lio/reactivex/ObservableEmitter;

    invoke-interface {p1}, Lio/reactivex/ObservableEmitter;->onComplete()V

    .line 397
    :cond_0
    monitor-exit p2

    .line 398
    return-void

    .line 397
    :catchall_0
    move-exception p1

    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method private onCameraOpenSuccess()V
    .locals 3

    .line 379
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->setManagerState(I)V

    .line 380
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mEmitterLock:Ljava/lang/Object;

    monitor-enter v0

    .line 381
    :try_start_0
    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraResultEmitter:Lio/reactivex/ObservableEmitter;

    if-eqz v1, :cond_0

    .line 382
    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraResultEmitter:Lio/reactivex/ObservableEmitter;

    const/4 v2, 0x2

    invoke-static {v2}, Lcom/android/camera/module/loader/camera2/Camera2Result;->create(I)Lcom/android/camera/module/loader/camera2/Camera2Result;

    move-result-object v2

    invoke-interface {v1, v2}, Lio/reactivex/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    .line 383
    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraResultEmitter:Lio/reactivex/ObservableEmitter;

    invoke-interface {v1}, Lio/reactivex/ObservableEmitter;->onComplete()V

    .line 385
    :cond_0
    monitor-exit v0

    .line 386
    return-void

    .line 385
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private onMessage(Landroid/os/Message;)V
    .locals 4

    .line 282
    iget p1, p1, Landroid/os/Message;->what:I

    const/4 v0, 0x0

    const/4 v1, 0x2

    const/4 v2, 0x1

    packed-switch p1, :pswitch_data_0

    goto/16 :goto_0

    .line 362
    :pswitch_0
    sget-object p1, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->TAG:Ljava/lang/String;

    const-string v0, "open finish"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 363
    invoke-direct {p0, v2}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->setManagerState(I)V

    .line 364
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraHandler:Landroid/os/Handler;

    invoke-virtual {p1, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto/16 :goto_0

    .line 356
    :pswitch_1
    sget-object p1, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->TAG:Ljava/lang/String;

    const-string v0, "close finish"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 357
    invoke-direct {p0, v2}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->setManagerState(I)V

    .line 358
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraHandler:Landroid/os/Handler;

    invoke-virtual {p1, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 359
    goto/16 :goto_0

    .line 337
    :pswitch_2
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-nez p1, :cond_0

    .line 338
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraHandler:Landroid/os/Handler;

    invoke-virtual {p1, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 339
    goto/16 :goto_0

    .line 342
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->getManagerState()I

    move-result p1

    if-eq p1, v2, :cond_1

    .line 343
    goto/16 :goto_0

    .line 346
    :cond_1
    invoke-direct {p0, v1}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->setManagerState(I)V

    .line 347
    sget-object p1, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->TAG:Ljava/lang/String;

    const-string v1, "force close start"

    invoke-static {p1, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 348
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {p1}, Lcom/android/camera2/Camera2Proxy;->releasePreview()V

    .line 349
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {p1}, Lcom/android/camera2/Camera2Proxy;->resetConfigs()V

    .line 350
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {p1}, Lcom/android/camera2/Camera2Proxy;->close()V

    .line 351
    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    .line 352
    goto/16 :goto_0

    .line 285
    :pswitch_3
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mPendingCameraId:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result p1

    if-gez p1, :cond_2

    .line 288
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz p1, :cond_7

    .line 289
    invoke-direct {p0, v1}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->setManagerState(I)V

    .line 290
    sget-object p1, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->TAG:Ljava/lang/String;

    const-string v1, "close start"

    invoke-static {p1, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 291
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {p1}, Lcom/android/camera2/Camera2Proxy;->close()V

    .line 292
    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    .line 293
    goto/16 :goto_0

    .line 297
    :cond_2
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz p1, :cond_4

    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {p1}, Lcom/android/camera2/Camera2Proxy;->getId()I

    move-result p1

    iget-object v3, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mPendingCameraId:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v3

    if-ne p1, v3, :cond_4

    .line 298
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Camera "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->getId()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " was opened successfully"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 301
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->getCapabilities()Lcom/android/camera2/CameraCapabilities;

    move-result-object v0

    if-nez v0, :cond_3

    .line 302
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ", but corresponding CameraCapabilities is null"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 303
    sget-object v0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->TAG:Ljava/lang/String;

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 304
    const/16 v0, 0xe7

    invoke-direct {p0, v0, p1}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->onCameraOpenFailed(ILjava/lang/String;)V

    goto :goto_0

    .line 306
    :cond_3
    sget-object v0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->TAG:Ljava/lang/String;

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 307
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->onCameraOpenSuccess()V

    .line 309
    goto :goto_0

    .line 312
    :cond_4
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz p1, :cond_5

    .line 313
    invoke-direct {p0, v1}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->setManagerState(I)V

    .line 314
    sget-object p1, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->TAG:Ljava/lang/String;

    const-string v1, "close start"

    invoke-static {p1, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 315
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {p1}, Lcom/android/camera2/Camera2Proxy;->close()V

    .line 316
    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    .line 317
    goto :goto_0

    .line 320
    :cond_5
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->getManagerState()I

    move-result p1

    if-eq p1, v2, :cond_6

    .line 321
    goto :goto_0

    .line 325
    :cond_6
    const/4 p1, 0x3

    :try_start_0
    invoke-direct {p0, p1}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->setManagerState(I)V

    .line 326
    sget-object p1, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->TAG:Ljava/lang/String;

    const-string v0, "open start"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 327
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCamera2Service:Landroid/hardware/camera2/CameraManager;

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mPendingCameraId:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraOpenCallback:Landroid/hardware/camera2/CameraDevice$StateCallback;

    iget-object v2, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraHandler:Landroid/os/Handler;

    invoke-virtual {p1, v0, v1, v2}, Landroid/hardware/camera2/CameraManager;->openCamera(Ljava/lang/String;Landroid/hardware/camera2/CameraDevice$StateCallback;Landroid/os/Handler;)V
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 333
    goto :goto_0

    .line 329
    :catch_0
    move-exception p1

    .line 330
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 331
    const/16 v0, 0xe6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->onCameraOpenFailed(ILjava/lang/String;)V

    .line 332
    sget-object v0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "openCamera: failed to open camera "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mPendingCameraId:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 334
    nop

    .line 367
    :cond_7
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static preload()V
    .locals 2

    .line 108
    sget-object v0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->TAG:Ljava/lang/String;

    const-string v1, "preload"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 109
    return-void
.end method

.method private setManagerState(I)V
    .locals 0
    .param p1    # I
        .annotation build Lcom/android/camera/module/loader/camera2/Camera2OpenManager$ManagerState;
        .end annotation
    .end param

    .line 370
    iput p1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCurrentState:I

    .line 371
    return-void
.end method


# virtual methods
.method public getCameraHandler()Landroid/os/Handler;
    .locals 1

    .line 113
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraHandler:Landroid/os/Handler;

    return-object v0
.end method

.method public getCameraMainThreadHandler()Landroid/os/Handler;
    .locals 1

    .line 117
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraMainThreadHandler:Landroid/os/Handler;

    return-object v0
.end method

.method public getCurrentCamera2Device()Lcom/android/camera2/Camera2Proxy;
    .locals 1

    .line 121
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    return-object v0
.end method

.method public getPendingCameraId()I
    .locals 1

    .line 125
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mPendingCameraId:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    return v0
.end method

.method public openCamera(IILio/reactivex/Observer;Z)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Lio/reactivex/Observer<",
            "Lcom/android/camera/module/loader/camera2/Camera2Result;",
            ">;Z)V"
        }
    .end annotation

    .line 241
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getActualOpenCameraId(II)I

    move-result p1

    .line 242
    sget-object v0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "openCamera: pendingOpenId = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", mPendingCameraId = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mPendingCameraId:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 243
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", currentMode = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", mCurrentModule = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCurrentModule:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 245
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", forceClose = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 242
    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 247
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mPendingCameraId:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    if-ne v0, p1, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCurrentModule:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    if-eq v0, p2, :cond_1

    .line 248
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 249
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mPendingCameraId:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 250
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCurrentModule:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p1, p2}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 251
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->abandonOpenObservableIfExists()V

    .line 255
    :cond_1
    invoke-direct {p0, p3}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->attachInObservable(Lio/reactivex/Observer;)Z

    .line 257
    if-eqz p4, :cond_2

    .line 258
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraHandler:Landroid/os/Handler;

    const/4 p2, 0x2

    invoke-virtual {p1, p2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0

    .line 260
    :cond_2
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraHandler:Landroid/os/Handler;

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 266
    :goto_0
    return-void
.end method

.method public release(Z)V
    .locals 1

    .line 270
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->abandonOpenObservableIfExists()V

    .line 271
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mPendingCameraId:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 272
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraHandler:Landroid/os/Handler;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 273
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCurrentModule:Ljava/util/concurrent/atomic/AtomicInteger;

    const/16 v0, 0xa0

    invoke-virtual {p1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 274
    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->setManagerState(I)V

    .line 275
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraHandler:Landroid/os/Handler;

    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 276
    return-void
.end method
