.class public Lcom/android/camera/module/WideSelfieModule;
.super Lcom/android/camera/module/BaseModule;
.source "WideSelfieModule.java"

# interfaces
.implements Lcom/android/camera/protocol/ModeProtocol$CameraAction;
.implements Lcom/android/camera/protocol/ModeProtocol$OnFaceBeautyChangedProtocol;
.implements Lcom/android/camera/wideselfie/WideSelfieEngineWrapper$WideSelfStateCallback;
.implements Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;
.implements Lcom/android/camera2/Camera2Proxy$FaceDetectionCallback;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x15
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/module/WideSelfieModule$SaveStateCallback;,
        Lcom/android/camera/module/WideSelfieModule$SaveOutputImageTask;,
        Lcom/android/camera/module/WideSelfieModule$MainHandler;
    }
.end annotation


# static fields
.field private static final MIN_SHOOTING_TIME:I = 0x258

.field public static final STOP_ROTATION_THRESHOLD:I = 0x3c

.field private static final TAG:Ljava/lang/String; = "WideSelfieModule"


# instance fields
.field private MOVE_DISTANCE:I

.field private MOVE_DISTANCE_VERTICAL:I

.field public OFFSET_X_HINT_THRESHOLD:I

.field public OFFSET_X_STOP_CAPTURE_THRESHOLD:I

.field public OFFSET_Y_HINT_THRESHOLD:I

.field public OFFSET_Y_STOP_CAPTURE_THRESHOLD:I

.field private mBeautyValues:Lcom/android/camera/fragment/beauty/BeautyValues;

.field private mCaptureOrientation:I

.field private final mDeviceLock:Ljava/lang/Object;

.field private mFaceDetectionEnabled:Z

.field private mFaceDetectionStarted:Z

.field private mFirstFrameNv21Data:[B

.field private mIsContinuousVibratoring:Z

.field private volatile mIsShooting:Z

.field private mJpegRotation:I

.field private mLastMoveDirection:I

.field private mLastVibratorProgress:I

.field protected final mMainHandler:Landroid/os/Handler;

.field private mMaxMoveWidth:I

.field private mMetaDataDisposable:Lio/reactivex/disposables/Disposable;

.field private mMetaDataFlowableEmitter:Lio/reactivex/FlowableEmitter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/FlowableEmitter<",
            "Landroid/hardware/camera2/CaptureResult;",
            ">;"
        }
    .end annotation
.end field

.field private mSaveOutputImageTask:Lcom/android/camera/module/WideSelfieModule$SaveOutputImageTask;

.field private mShootingStartTime:J

.field private mShowWarningToast:Z

.field private mStillPreviewWidth:I

.field private mTargetFocusMode:I

.field private mToastOffsetY:I

.field private mWideSelfEngine:Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;


# direct methods
.method public constructor <init>()V
    .locals 3

    invoke-direct {p0}, Lcom/android/camera/module/BaseModule;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/WideSelfieModule;->mIsShooting:Z

    new-instance v1, Lcom/android/camera/module/WideSelfieModule$MainHandler;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/android/camera/module/WideSelfieModule$MainHandler;-><init>(Lcom/android/camera/module/WideSelfieModule;Lcom/android/camera/module/WideSelfieModule$1;)V

    iput-object v1, p0, Lcom/android/camera/module/WideSelfieModule;->mMainHandler:Landroid/os/Handler;

    const/4 v1, 0x4

    iput v1, p0, Lcom/android/camera/module/WideSelfieModule;->mTargetFocusMode:I

    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lcom/android/camera/module/WideSelfieModule;->mDeviceLock:Ljava/lang/Object;

    const/4 v1, -0x1

    iput v1, p0, Lcom/android/camera/module/WideSelfieModule;->mCaptureOrientation:I

    iput-boolean v0, p0, Lcom/android/camera/module/WideSelfieModule;->mIsContinuousVibratoring:Z

    iput v1, p0, Lcom/android/camera/module/WideSelfieModule;->mLastMoveDirection:I

    return-void
.end method

.method static synthetic access$100(Lcom/android/camera/module/WideSelfieModule;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/module/WideSelfieModule;->initPreviewLayout()V

    return-void
.end method

.method static synthetic access$200(Lcom/android/camera/module/WideSelfieModule;)Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/WideSelfieModule;->mWideSelfEngine:Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;

    return-object p0
.end method

.method static synthetic access$300(Lcom/android/camera/module/WideSelfieModule;ZZ)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/android/camera/module/WideSelfieModule;->handleUpdateFaceView(ZZ)V

    return-void
.end method

.method static synthetic access$402(Lcom/android/camera/module/WideSelfieModule;Lio/reactivex/FlowableEmitter;)Lio/reactivex/FlowableEmitter;
    .locals 0

    iput-object p1, p0, Lcom/android/camera/module/WideSelfieModule;->mMetaDataFlowableEmitter:Lio/reactivex/FlowableEmitter;

    return-object p1
.end method

.method static synthetic access$500(Lcom/android/camera/module/WideSelfieModule;)[B
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/WideSelfieModule;->mFirstFrameNv21Data:[B

    return-object p0
.end method

.method static synthetic access$502(Lcom/android/camera/module/WideSelfieModule;[B)[B
    .locals 0

    iput-object p1, p0, Lcom/android/camera/module/WideSelfieModule;->mFirstFrameNv21Data:[B

    return-object p1
.end method

.method static synthetic access$600(Lcom/android/camera/module/WideSelfieModule;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/android/camera/module/WideSelfieModule;->mShowWarningToast:Z

    return p0
.end method

.method static synthetic access$700(Lcom/android/camera/module/WideSelfieModule;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/module/WideSelfieModule;->mToastOffsetY:I

    return p0
.end method

.method static synthetic access$800(Lcom/android/camera/module/WideSelfieModule;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/module/WideSelfieModule;->onSaveFinish()V

    return-void
.end method

.method private doLaterReleaseIfNeed()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mActivity:Lcom/android/camera/Camera;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->pause()V

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mActivity:Lcom/android/camera/Camera;

    const/4 v1, 0x1

    invoke-virtual {v0, v1, v1}, Lcom/android/camera/Camera;->releaseAll(ZZ)V

    return-void

    :cond_1
    return-void
.end method

.method private handleUpdateFaceView(ZZ)V
    .locals 6

    invoke-virtual {p0}, Lcom/android/camera/module/WideSelfieModule;->isFrontCamera()Z

    move-result v3

    if-eqz p1, :cond_0

    iget-boolean p2, p0, Lcom/android/camera/module/WideSelfieModule;->mFaceDetectionStarted:Z

    if-eqz p2, :cond_1

    const/4 p2, 0x1

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->getFocusMode()I

    move-result v0

    if-eq p2, v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    const/4 v2, 0x1

    const/4 v4, 0x1

    iget v5, p0, Lcom/android/camera/module/WideSelfieModule;->mCameraDisplayOrientation:I

    move v1, p1

    invoke-interface/range {v0 .. v5}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->updateFaceView(ZZZZI)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    const/4 v4, 0x0

    const/4 v5, -0x1

    move v1, p1

    move v2, p2

    invoke-interface/range {v0 .. v5}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->updateFaceView(ZZZZI)V

    :cond_1
    :goto_0
    return-void
.end method

.method private initMetaParser()V
    .locals 3

    new-instance v0, Lcom/android/camera/module/WideSelfieModule$2;

    invoke-direct {v0, p0}, Lcom/android/camera/module/WideSelfieModule$2;-><init>(Lcom/android/camera/module/WideSelfieModule;)V

    sget-object v1, Lio/reactivex/BackpressureStrategy;->DROP:Lio/reactivex/BackpressureStrategy;

    invoke-static {v0, v1}, Lio/reactivex/Flowable;->create(Lio/reactivex/FlowableOnSubscribe;Lio/reactivex/BackpressureStrategy;)Lio/reactivex/Flowable;

    move-result-object v0

    new-instance v1, Lcom/android/camera/module/loader/FunctionParseAsdFace;

    invoke-virtual {p0}, Lcom/android/camera/module/WideSelfieModule;->isFrontCamera()Z

    move-result v2

    invoke-direct {v1, p0, v2}, Lcom/android/camera/module/loader/FunctionParseAsdFace;-><init>(Lcom/android/camera2/Camera2Proxy$FaceDetectionCallback;Z)V

    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Flowable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Flowable;->subscribe()Lio/reactivex/disposables/Disposable;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mMetaDataDisposable:Lio/reactivex/disposables/Disposable;

    return-void
.end method

.method private initPreviewLayout()V
    .locals 5

    invoke-virtual {p0}, Lcom/android/camera/module/WideSelfieModule;->isAlive()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/module/WideSelfieModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v1, v1, Lcom/android/camera/CameraSize;->width:I

    iget-object v2, p0, Lcom/android/camera/module/WideSelfieModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v2, v2, Lcom/android/camera/CameraSize;->height:I

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/CameraScreenNail;->setPreviewSize(II)V

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->getWidth()I

    move-result v1

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->getHeight()I

    move-result v0

    iget-object v2, p0, Lcom/android/camera/module/WideSelfieModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0a0164

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    mul-int/2addr v1, v2

    div-int/2addr v1, v0

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v3, 0xd8

    invoke-virtual {v0, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$WideSelfieProtocol;

    if-eqz v0, :cond_1

    iget-object v3, p0, Lcom/android/camera/module/WideSelfieModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v3, v3, Lcom/android/camera/CameraSize;->width:I

    iget-object v4, p0, Lcom/android/camera/module/WideSelfieModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v4, v4, Lcom/android/camera/CameraSize;->height:I

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/android/camera/protocol/ModeProtocol$WideSelfieProtocol;->initPreviewLayout(IIII)V

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$WideSelfieProtocol;->resetShootUI()V

    :cond_1
    return-void
.end method

.method private isProcessingSaveTask()Z
    .locals 2

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mSaveOutputImageTask:Lcom/android/camera/module/WideSelfieModule$SaveOutputImageTask;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mSaveOutputImageTask:Lcom/android/camera/module/WideSelfieModule$SaveOutputImageTask;

    invoke-virtual {v0}, Lcom/android/camera/module/WideSelfieModule$SaveOutputImageTask;->getStatus()Landroid/os/AsyncTask$Status;

    move-result-object v0

    sget-object v1, Landroid/os/AsyncTask$Status;->FINISHED:Landroid/os/AsyncTask$Status;

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private isShootingTooShort()Z
    .locals 4

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/android/camera/module/WideSelfieModule;->mShootingStartTime:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x258

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private keepScreenOnAwhile()V
    .locals 4

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mMainHandler:Landroid/os/Handler;

    const/16 v1, 0x11

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    return-void
.end method

.method private onSaveFinish()V
    .locals 2

    const-string v0, "WideSelfieModule"

    const-string v1, "onSaveFinish"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/WideSelfieModule;->mIsShooting:Z

    invoke-virtual {p0}, Lcom/android/camera/module/WideSelfieModule;->isAlive()Z

    move-result v1

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/android/camera/module/WideSelfieModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/android/camera/module/WideSelfieModule;->enableCameraControls(Z)V

    iget-boolean v1, p0, Lcom/android/camera/module/WideSelfieModule;->mAeLockSupported:Z

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/android/camera/module/WideSelfieModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v0}, Lcom/android/camera2/Camera2Proxy;->setAELock(Z)V

    :cond_1
    iget-boolean v1, p0, Lcom/android/camera/module/WideSelfieModule;->mAwbLockSupported:Z

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/android/camera/module/WideSelfieModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v0}, Lcom/android/camera2/Camera2Proxy;->setAWBLock(Z)V

    :cond_2
    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget v1, p0, Lcom/android/camera/module/WideSelfieModule;->mTargetFocusMode:I

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setFocusMode(I)V

    invoke-virtual {p0}, Lcom/android/camera/module/WideSelfieModule;->startPreview()V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xd4

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$RecordState;

    if-eqz v0, :cond_3

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onPostSavingFinish()V

    :cond_3
    return-void

    :cond_4
    :goto_0
    return-void
.end method

.method private resetScreenOn()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mMainHandler:Landroid/os/Handler;

    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mMainHandler:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    return-void
.end method

.method private setupCaptureParams()V
    .locals 5

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-nez v0, :cond_0

    const-string v0, "WideSelfieModule"

    const-string v1, "camera device is not ready"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget v1, p0, Lcom/android/camera/module/WideSelfieModule;->mTargetFocusMode:I

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setFocusMode(I)V

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setZoomRatio(F)V

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setFlashMode(I)V

    invoke-static {}, Lcom/android/camera/CameraSettings;->getAntiBanding()Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Lcom/android/camera/module/WideSelfieModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/android/camera2/Camera2Proxy;->setAntiBanding(I)V

    const-string v2, "WideSelfieModule"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "antiBanding="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/android/camera2/Camera2Proxy;->setEnableZsl(Z)V

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setHHT(Z)V

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setEnableOIS(Z)V

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setTimeWaterMarkEnable(Z)V

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setFaceWaterMarkEnable(Z)V

    return-void
.end method

.method private startSaveTask([BII)V
    .locals 7
    .annotation build Landroid/support/annotation/UiThread;
    .end annotation

    iget-boolean v0, p0, Lcom/android/camera/module/WideSelfieModule;->mIsShooting:Z

    if-nez v0, :cond_0

    const-string p1, "WideSelfieModule"

    const-string p2, "startSaveTask while not shooting"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    const-string v0, "WideSelfieModule"

    const-string v1, "startSaveTask"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    invoke-direct {p0}, Lcom/android/camera/module/WideSelfieModule;->keepScreenOnAwhile()V

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mDeviceLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/android/camera/module/WideSelfieModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/android/camera/module/WideSelfieModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1}, Lcom/android/camera2/Camera2Proxy;->captureAbortBurst()V

    :cond_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    nop

    nop

    nop

    iget-boolean v0, p0, Lcom/android/camera/module/WideSelfieModule;->mShowWarningToast:Z

    if-eqz v0, :cond_2

    iget-object p1, p0, Lcom/android/camera/module/WideSelfieModule;->mFirstFrameNv21Data:[B

    iget-object p2, p0, Lcom/android/camera/module/WideSelfieModule;->mPictureSize:Lcom/android/camera/CameraSize;

    iget p2, p2, Lcom/android/camera/CameraSize;->width:I

    iget-object p3, p0, Lcom/android/camera/module/WideSelfieModule;->mPictureSize:Lcom/android/camera/CameraSize;

    iget p3, p3, Lcom/android/camera/CameraSize;->height:I

    :cond_2
    move-object v2, p1

    move v3, p2

    move v4, p3

    new-instance p1, Lcom/android/camera/module/WideSelfieModule$SaveOutputImageTask;

    iget-object v1, p0, Lcom/android/camera/module/WideSelfieModule;->mActivity:Lcom/android/camera/Camera;

    iget v5, p0, Lcom/android/camera/module/WideSelfieModule;->mJpegRotation:I

    new-instance v6, Lcom/android/camera/module/WideSelfieModule$4;

    invoke-direct {v6, p0}, Lcom/android/camera/module/WideSelfieModule$4;-><init>(Lcom/android/camera/module/WideSelfieModule;)V

    move-object v0, p1

    invoke-direct/range {v0 .. v6}, Lcom/android/camera/module/WideSelfieModule$SaveOutputImageTask;-><init>(Lcom/android/camera/Camera;[BIIILcom/android/camera/module/WideSelfieModule$SaveStateCallback;)V

    iput-object p1, p0, Lcom/android/camera/module/WideSelfieModule;->mSaveOutputImageTask:Lcom/android/camera/module/WideSelfieModule$SaveOutputImageTask;

    iget-object p1, p0, Lcom/android/camera/module/WideSelfieModule;->mSaveOutputImageTask:Lcom/android/camera/module/WideSelfieModule$SaveOutputImageTask;

    const/4 p2, 0x0

    new-array p3, p2, [Ljava/lang/Void;

    invoke-virtual {p1, p3}, Lcom/android/camera/module/WideSelfieModule$SaveOutputImageTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    iput-boolean p2, p0, Lcom/android/camera/module/WideSelfieModule;->mIsShooting:Z

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method private stopWideSelfieShooting(ZZ)V
    .locals 0

    iput-boolean p2, p0, Lcom/android/camera/module/WideSelfieModule;->mShowWarningToast:Z

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/android/camera/module/WideSelfieModule;->mActivity:Lcom/android/camera/Camera;

    invoke-static {p1}, Lcom/android/camera/VibratorUtils;->getInstance(Landroid/content/Context;)Lcom/android/camera/VibratorUtils;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/VibratorUtils;->vibrate()V

    :cond_0
    const/4 p1, 0x3

    invoke-virtual {p0, p1}, Lcom/android/camera/module/WideSelfieModule;->playCameraSound(I)V

    iget-object p1, p0, Lcom/android/camera/module/WideSelfieModule;->mWideSelfEngine:Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;

    invoke-virtual {p1}, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->stopCapture()V

    return-void
.end method

.method private updateBeauty()V
    .locals 3

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mBeautyValues:Lcom/android/camera/fragment/beauty/BeautyValues;

    if-nez v0, :cond_0

    new-instance v0, Lcom/android/camera/fragment/beauty/BeautyValues;

    invoke-direct {v0}, Lcom/android/camera/fragment/beauty/BeautyValues;-><init>()V

    iput-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mBeautyValues:Lcom/android/camera/fragment/beauty/BeautyValues;

    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mBeautyValues:Lcom/android/camera/fragment/beauty/BeautyValues;

    invoke-static {}, Lcom/android/camera/CameraSettings;->getFaceBeautyCloseValue()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyLevel:Ljava/lang/String;

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mBeautyValues:Lcom/android/camera/fragment/beauty/BeautyValues;

    invoke-static {}, Lcom/mi/config/b;->jc()Z

    move-result v1

    invoke-static {v0, v1}, Lcom/android/camera/CameraSettings;->initBeautyValues(Lcom/android/camera/fragment/beauty/BeautyValues;Z)V

    const-string v0, "WideSelfieModule"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "updateBeauty(): "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/module/WideSelfieModule;->mBeautyValues:Lcom/android/camera/fragment/beauty/BeautyValues;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v1, p0, Lcom/android/camera/module/WideSelfieModule;->mBeautyValues:Lcom/android/camera/fragment/beauty/BeautyValues;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setBeautyValues(Lcom/android/camera/fragment/beauty/BeautyValues;)V

    return-void
.end method

.method private updateFaceView(ZZ)V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mMainHandler:Landroid/os/Handler;

    const/16 v1, 0x23

    invoke-virtual {v0, v1}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mMainHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mMainHandler:Landroid/os/Handler;

    nop

    invoke-virtual {v0, v1, p1, p2}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    return-void
.end method

.method private updatePictureAndPreviewSize()V
    .locals 6

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    const/16 v1, 0x23

    invoke-virtual {v0, v1}, Lcom/android/camera2/CameraCapabilities;->getSupportedOutputSize(I)Ljava/util/List;

    move-result-object v0

    iget v1, p0, Lcom/android/camera/module/WideSelfieModule;->mBogusCameraId:I

    const/4 v2, 0x0

    const/16 v3, 0xb0

    invoke-static {v0, v2, v3, v1}, Lcom/android/camera/PictureSizeManager;->initialize(Ljava/util/List;III)V

    invoke-static {}, Lcom/android/camera/PictureSizeManager;->getBestPictureSize()Lcom/android/camera/CameraSize;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/module/WideSelfieModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    const-class v2, Landroid/graphics/SurfaceTexture;

    invoke-virtual {v1, v2}, Lcom/android/camera2/CameraCapabilities;->getSupportedOutputSize(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v1

    iget v2, p0, Lcom/android/camera/module/WideSelfieModule;->mModuleIndex:I

    iget v3, p0, Lcom/android/camera/module/WideSelfieModule;->mBogusCameraId:I

    iget v4, v0, Lcom/android/camera/CameraSize;->width:I

    iget v5, v0, Lcom/android/camera/CameraSize;->height:I

    invoke-static {v4, v5}, Lcom/android/camera/CameraSettings;->getPreviewAspectRatio(II)F

    move-result v4

    float-to-double v4, v4

    invoke-static {v2, v3, v1, v4, v5}, Lcom/android/camera/Util;->getOptimalPreviewSize(IILjava/util/List;D)Lcom/android/camera/CameraSize;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera/module/WideSelfieModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iput-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mPictureSize:Lcom/android/camera/CameraSize;

    const-string v1, "WideSelfieModule"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "pictureSize= "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Lcom/android/camera/CameraSize;->width:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "X"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, v0, Lcom/android/camera/CameraSize;->height:I

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " previewSize="

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v0, v0, Lcom/android/camera/CameraSize;->width:I

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "X"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v0, v0, Lcom/android/camera/CameraSize;->height:I

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v0, v0, Lcom/android/camera/CameraSize;->width:I

    iget-object v1, p0, Lcom/android/camera/module/WideSelfieModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v1, v1, Lcom/android/camera/CameraSize;->height:I

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/module/WideSelfieModule;->updateCameraScreenNailSize(II)V

    return-void
.end method


# virtual methods
.method public closeCamera()V
    .locals 4

    const-string v0, "WideSelfieModule"

    const-string v1, "closeCamera: start"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mMetaDataFlowableEmitter:Lio/reactivex/FlowableEmitter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mMetaDataFlowableEmitter:Lio/reactivex/FlowableEmitter;

    invoke-interface {v0}, Lio/reactivex/FlowableEmitter;->onComplete()V

    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mMetaDataDisposable:Lio/reactivex/disposables/Disposable;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mMetaDataDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mDeviceLock:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x0

    :try_start_0
    invoke-virtual {p0, v1}, Lcom/android/camera/module/WideSelfieModule;->setCameraState(I)V

    iget-object v1, p0, Lcom/android/camera/module/WideSelfieModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/android/camera/module/WideSelfieModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/android/camera2/Camera2Proxy;->setErrorCallback(Lcom/android/camera2/Camera2Proxy$CameraErrorCallback;)V

    iget-object v1, p0, Lcom/android/camera/module/WideSelfieModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Lcom/android/camera2/Camera2Proxy;->stopPreviewCallback(Z)V

    iput-object v2, p0, Lcom/android/camera/module/WideSelfieModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    :cond_2
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string v0, "WideSelfieModule"

    const-string v1, "closeCamera: end"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public varargs consumePreference([I)V
    .locals 6
    .param p1    # [I
        .annotation build Lcom/android/camera/constant/UpdateConstant$UpdateType;
        .end annotation
    .end param

    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_6

    aget v2, p1, v1

    const/4 v3, 0x1

    if-eq v2, v3, :cond_5

    const/4 v3, 0x5

    if-eq v2, v3, :cond_4

    const/16 v3, 0xd

    if-eq v2, v3, :cond_3

    const/16 v3, 0x18

    if-eq v2, v3, :cond_2

    const/16 v3, 0x20

    if-eq v2, v3, :cond_1

    sget-boolean v3, Lcom/android/camera/module/WideSelfieModule;->DEBUG:Z

    if-nez v3, :cond_0

    const-string v3, "WideSelfieModule"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "no consumer for this updateType: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    :cond_0
    new-instance p1, Ljava/lang/RuntimeException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "no consumer for this updateType: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    invoke-direct {p0}, Lcom/android/camera/module/WideSelfieModule;->setupCaptureParams()V

    goto :goto_1

    :cond_2
    invoke-virtual {p0}, Lcom/android/camera/module/WideSelfieModule;->getZoomValue()F

    move-result v2

    invoke-virtual {p0, v2}, Lcom/android/camera/module/WideSelfieModule;->setZoomRatio(F)V

    goto :goto_1

    :cond_3
    invoke-direct {p0}, Lcom/android/camera/module/WideSelfieModule;->updateBeauty()V

    goto :goto_1

    :cond_4
    invoke-virtual {p0}, Lcom/android/camera/module/WideSelfieModule;->updateFace()V

    goto :goto_1

    :cond_5
    invoke-direct {p0}, Lcom/android/camera/module/WideSelfieModule;->updatePictureAndPreviewSize()V

    nop

    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_6
    return-void
.end method

.method protected enableFaceDetection()Z
    .locals 4

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "pref_camera_facedetection_key"

    invoke-virtual {p0}, Lcom/android/camera/module/WideSelfieModule;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0f0006

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method protected getOperatingMode()I
    .locals 1

    const v0, 0x8008

    return v0
.end method

.method public isDoingAction()Z
    .locals 1

    invoke-direct {p0}, Lcom/android/camera/module/WideSelfieModule;->isProcessingSaveTask()Z

    move-result v0

    return v0
.end method

.method public isFaceDetectStarted()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/module/WideSelfieModule;->mFaceDetectionStarted:Z

    return v0
.end method

.method public isRecording()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/module/WideSelfieModule;->mIsShooting:Z

    return v0
.end method

.method public isUnInterruptable()Z
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mUnInterruptableReason:Ljava/lang/String;

    iget-boolean v0, p0, Lcom/android/camera/module/WideSelfieModule;->mIsShooting:Z

    if-eqz v0, :cond_0

    const-string v0, "shooting"

    iput-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mUnInterruptableReason:Ljava/lang/String;

    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mUnInterruptableReason:Ljava/lang/String;

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isUseFaceInfo()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method protected isZoomEnabled()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method protected keepScreenOn()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mMainHandler:Landroid/os/Handler;

    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mMainHandler:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    invoke-virtual {p0}, Lcom/android/camera/module/WideSelfieModule;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x80

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    return-void
.end method

.method public onBackPressed()Z
    .locals 3

    iget-boolean v0, p0, Lcom/android/camera/module/WideSelfieModule;->mIsShooting:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/android/camera/module/WideSelfieModule;->isProcessingSaveTask()Z

    move-result v0

    const/4 v2, 0x1

    if-nez v0, :cond_0

    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lcom/android/camera/module/WideSelfieModule;->playCameraSound(I)V

    invoke-direct {p0, v2, v1}, Lcom/android/camera/module/WideSelfieModule;->stopWideSelfieShooting(ZZ)V

    :cond_0
    return v2

    :cond_1
    return v1
.end method

.method public onBeautyChanged()V
    .locals 3

    invoke-static {}, Lcom/mi/config/b;->jj()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x3

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    invoke-virtual {p0, v0}, Lcom/android/camera/module/WideSelfieModule;->updatePreferenceInWorkThread([I)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const/16 v2, 0xd

    aput v2, v0, v1

    invoke-virtual {p0, v0}, Lcom/android/camera/module/WideSelfieModule;->updatePreferenceInWorkThread([I)V

    :goto_0
    return-void

    :array_0
    .array-data 4
        0xd
        0x22
        0x2a
    .end array-data
.end method

.method protected onCameraOpened()V
    .locals 2

    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onCameraOpened()V

    invoke-virtual {p0}, Lcom/android/camera/module/WideSelfieModule;->checkDisplayOrientation()V

    sget-object v0, Lcom/android/camera/constant/UpdateConstant;->WIDESELFIE_TYPES_INIT:[I

    invoke-virtual {p0, v0}, Lcom/android/camera/module/WideSelfieModule;->updatePreferenceTrampoline([I)V

    invoke-virtual {p0}, Lcom/android/camera/module/WideSelfieModule;->startPreviewSession()V

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mMainHandler:Landroid/os/Handler;

    const/16 v1, 0x9

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    invoke-direct {p0}, Lcom/android/camera/module/WideSelfieModule;->initMetaParser()V

    const-string v0, "WideSelfieModule"

    const-string v1, "SetupCameraThread done"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onCreate(II)V
    .locals 1

    invoke-super {p0, p1, p2}, Lcom/android/camera/module/BaseModule;->onCreate(II)V

    invoke-virtual {p0}, Lcom/android/camera/module/WideSelfieModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object p1

    invoke-static {p1}, Lcom/android/camera/wideselfie/WideSelfieConfig;->getInstance(Landroid/content/Context;)Lcom/android/camera/wideselfie/WideSelfieConfig;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/wideselfie/WideSelfieConfig;->getStillPreviewWidth()I

    move-result p1

    iput p1, p0, Lcom/android/camera/module/WideSelfieModule;->mStillPreviewWidth:I

    const/4 p1, 0x0

    iput p1, p0, Lcom/android/camera/module/WideSelfieModule;->OFFSET_X_HINT_THRESHOLD:I

    iget p1, p0, Lcom/android/camera/module/WideSelfieModule;->mStillPreviewWidth:I

    div-int/lit8 p1, p1, 0x4

    iput p1, p0, Lcom/android/camera/module/WideSelfieModule;->OFFSET_Y_HINT_THRESHOLD:I

    iget p1, p0, Lcom/android/camera/module/WideSelfieModule;->mStillPreviewWidth:I

    div-int/lit8 p1, p1, 0x2

    iput p1, p0, Lcom/android/camera/module/WideSelfieModule;->OFFSET_X_STOP_CAPTURE_THRESHOLD:I

    iget p1, p0, Lcom/android/camera/module/WideSelfieModule;->mStillPreviewWidth:I

    div-int/lit8 p1, p1, 0x2

    iput p1, p0, Lcom/android/camera/module/WideSelfieModule;->OFFSET_Y_STOP_CAPTURE_THRESHOLD:I

    iget-object p1, p0, Lcom/android/camera/module/WideSelfieModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0a0169

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/module/WideSelfieModule;->mToastOffsetY:I

    iget-object p1, p0, Lcom/android/camera/module/WideSelfieModule;->mActivity:Lcom/android/camera/Camera;

    invoke-static {p1}, Lcom/android/camera/wideselfie/WideSelfieConfig;->getInstance(Landroid/content/Context;)Lcom/android/camera/wideselfie/WideSelfieConfig;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/wideselfie/WideSelfieConfig;->getThumbBgWidth()I

    move-result p1

    iget-object p2, p0, Lcom/android/camera/module/WideSelfieModule;->mActivity:Lcom/android/camera/Camera;

    invoke-static {p2}, Lcom/android/camera/wideselfie/WideSelfieConfig;->getInstance(Landroid/content/Context;)Lcom/android/camera/wideselfie/WideSelfieConfig;

    move-result-object p2

    invoke-virtual {p2}, Lcom/android/camera/wideselfie/WideSelfieConfig;->getStillPreviewWidth()I

    move-result p2

    sub-int/2addr p1, p2

    div-int/lit8 p1, p1, 0x2

    iput p1, p0, Lcom/android/camera/module/WideSelfieModule;->MOVE_DISTANCE:I

    iget-object p1, p0, Lcom/android/camera/module/WideSelfieModule;->mActivity:Lcom/android/camera/Camera;

    invoke-static {p1}, Lcom/android/camera/wideselfie/WideSelfieConfig;->getInstance(Landroid/content/Context;)Lcom/android/camera/wideselfie/WideSelfieConfig;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/wideselfie/WideSelfieConfig;->getThumbBgHeightVertical()I

    move-result p1

    iget-object p2, p0, Lcom/android/camera/module/WideSelfieModule;->mActivity:Lcom/android/camera/Camera;

    invoke-static {p2}, Lcom/android/camera/wideselfie/WideSelfieConfig;->getInstance(Landroid/content/Context;)Lcom/android/camera/wideselfie/WideSelfieConfig;

    move-result-object p2

    invoke-virtual {p2}, Lcom/android/camera/wideselfie/WideSelfieConfig;->getStillPreviewHeight()I

    move-result p2

    sub-int/2addr p1, p2

    div-int/lit8 p1, p1, 0x2

    iput p1, p0, Lcom/android/camera/module/WideSelfieModule;->MOVE_DISTANCE_VERTICAL:I

    const-string p1, "WideSelfieModule"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "MOVE_DISTANCE "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Lcom/android/camera/module/WideSelfieModule;->MOVE_DISTANCE:I

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ", MOVE_DISTANCE_VERTICAL =  "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Lcom/android/camera/module/WideSelfieModule;->MOVE_DISTANCE_VERTICAL:I

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance p1, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;

    iget-object p2, p0, Lcom/android/camera/module/WideSelfieModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p2}, Lcom/android/camera/Camera;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    invoke-direct {p1, p2, p0}, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;-><init>(Landroid/content/Context;Lcom/android/camera/wideselfie/WideSelfieEngineWrapper$WideSelfStateCallback;)V

    iput-object p1, p0, Lcom/android/camera/module/WideSelfieModule;->mWideSelfEngine:Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;

    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object p1

    sget p2, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    invoke-virtual {p1, p2}, Lcom/android/camera/effect/EffectController;->setEffect(I)V

    invoke-virtual {p0}, Lcom/android/camera/module/WideSelfieModule;->onCameraOpened()V

    return-void
.end method

.method public onDestroy()V
    .locals 2

    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onDestroy()V

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mMainHandler:Landroid/os/Handler;

    const/16 v1, 0x2d

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mWideSelfEngine:Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;

    invoke-virtual {v0}, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->onDestroy()V

    return-void
.end method

.method public onFaceDetected([Lcom/android/camera2/CameraHardwareFace;Lcom/android/camera/effect/FaceAnalyzeInfo;)V
    .locals 3

    invoke-virtual {p0}, Lcom/android/camera/module/WideSelfieModule;->isCreated()Z

    move-result p2

    if-nez p2, :cond_0

    return-void

    :cond_0
    if-nez p1, :cond_1

    return-void

    :cond_1
    invoke-static {}, Lcom/mi/config/b;->hW()Z

    move-result p2

    if-eqz p2, :cond_2

    array-length p2, p1

    if-lez p2, :cond_2

    const/4 p2, 0x0

    aget-object p2, p1, p2

    iget p2, p2, Lcom/android/camera2/CameraHardwareFace;->faceType:I

    const v0, 0xface

    if-ne p2, v0, :cond_2

    iget-boolean p2, p0, Lcom/android/camera/module/WideSelfieModule;->mObjectTrackingStarted:Z

    if-eqz p2, :cond_3

    iget-object p2, p0, Lcom/android/camera/module/WideSelfieModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    const/4 v0, 0x3

    invoke-virtual {p0}, Lcom/android/camera/module/WideSelfieModule;->getActiveArraySize()Landroid/graphics/Rect;

    move-result-object v1

    iget v2, p0, Lcom/android/camera/module/WideSelfieModule;->mZoomValue:F

    invoke-interface {p2, v0, p1, v1, v2}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setFaces(I[Lcom/android/camera2/CameraHardwareFace;Landroid/graphics/Rect;F)Z

    goto :goto_0

    :cond_2
    iget-object p2, p0, Lcom/android/camera/module/WideSelfieModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    const/4 v0, 0x1

    invoke-virtual {p0}, Lcom/android/camera/module/WideSelfieModule;->getActiveArraySize()Landroid/graphics/Rect;

    move-result-object v1

    iget v2, p0, Lcom/android/camera/module/WideSelfieModule;->mZoomValue:F

    invoke-interface {p2, v0, p1, v1, v2}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setFaces(I[Lcom/android/camera2/CameraHardwareFace;Landroid/graphics/Rect;F)Z

    move-result p1

    if-nez p1, :cond_3

    return-void

    :cond_3
    :goto_0
    return-void
.end method

.method public onHostStopAndNotifyActionStop()V
    .locals 2

    iget-boolean v0, p0, Lcom/android/camera/module/WideSelfieModule;->mIsShooting:Z

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xd4

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$RecordState;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onFinish()V

    :cond_0
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lcom/android/camera/module/WideSelfieModule;->playCameraSound(I)V

    const/4 v0, 0x0

    invoke-direct {p0, v0, v0}, Lcom/android/camera/module/WideSelfieModule;->stopWideSelfieShooting(ZZ)V

    invoke-direct {p0}, Lcom/android/camera/module/WideSelfieModule;->doLaterReleaseIfNeed()V

    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 4

    iget-boolean v0, p0, Lcom/android/camera/module/WideSelfieModule;->mPaused:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/WideSelfieModule;->isFrameAvailable()Z

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_1

    return v2

    :cond_1
    const/16 v0, 0x1b

    if-eq p1, v0, :cond_5

    const/16 v0, 0x42

    if-eq p1, v0, :cond_5

    const/16 v0, 0x2bc

    if-eq p1, v0, :cond_4

    packed-switch p1, :pswitch_data_0

    packed-switch p1, :pswitch_data_1

    goto :goto_3

    :pswitch_0
    const/16 v0, 0x18

    if-eq p1, v0, :cond_3

    const/16 v0, 0x58

    if-ne p1, v0, :cond_2

    goto :goto_0

    :cond_2
    goto :goto_1

    :cond_3
    :goto_0
    move v2, v1

    :goto_1
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getDevice()Landroid/view/InputDevice;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/InputDevice;->isExternal()Z

    move-result v3

    invoke-virtual {p0, v2, v1, v0, v3}, Lcom/android/camera/module/WideSelfieModule;->handleVolumeKeyEvent(ZZIZ)Z

    move-result v0

    if-eqz v0, :cond_8

    return v1

    :pswitch_1
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    if-nez v0, :cond_8

    const/16 p1, 0x32

    invoke-virtual {p0, p1}, Lcom/android/camera/module/WideSelfieModule;->onShutterButtonClick(I)V

    return v1

    :cond_4
    iget-boolean v0, p0, Lcom/android/camera/module/WideSelfieModule;->mIsShooting:Z

    if-eqz v0, :cond_8

    invoke-direct {p0, v2, v2}, Lcom/android/camera/module/WideSelfieModule;->stopWideSelfieShooting(ZZ)V

    goto :goto_3

    :cond_5
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    if-nez v0, :cond_8

    invoke-static {p2}, Lcom/android/camera/Util;->isFingerPrintKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    if-eqz p1, :cond_6

    invoke-static {}, Lcom/android/camera/CameraSettings;->isFingerprintCaptureEnable()Z

    move-result p1

    if-eqz p1, :cond_7

    const/16 p1, 0x1e

    invoke-virtual {p0, p1}, Lcom/android/camera/module/WideSelfieModule;->onShutterButtonClick(I)V

    goto :goto_2

    :cond_6
    const/16 p1, 0x28

    invoke-virtual {p0, p1}, Lcom/android/camera/module/WideSelfieModule;->onShutterButtonClick(I)V

    :cond_7
    :goto_2
    return v1

    :cond_8
    :goto_3
    invoke-super {p0, p1, p2}, Lcom/android/camera/module/BaseModule;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1

    :pswitch_data_0
    .packed-switch 0x17
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x57
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .locals 3

    iget-boolean v0, p0, Lcom/android/camera/module/WideSelfieModule;->mPaused:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    :cond_0
    const/4 v0, 0x4

    if-eq p1, v0, :cond_2

    const/16 v0, 0x1b

    if-eq p1, v0, :cond_1

    const/16 v0, 0x42

    if-eq p1, v0, :cond_1

    goto :goto_0

    :cond_1
    return v1

    :cond_2
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v2, 0xab

    invoke-virtual {v0, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BackStack;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BackStack;->handleBackStackFromKeyBack()Z

    move-result v0

    if-eqz v0, :cond_3

    return v1

    :cond_3
    :goto_0
    invoke-super {p0, p1, p2}, Lcom/android/camera/module/BaseModule;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public onMove(IILandroid/graphics/Point;Landroid/graphics/Point;Z)V
    .locals 8
    .annotation build Landroid/support/annotation/UiThread;
    .end annotation

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xd8

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$WideSelfieProtocol;

    if-nez v0, :cond_0

    iget-object p1, p0, Lcom/android/camera/module/WideSelfieModule;->mActivity:Lcom/android/camera/Camera;

    invoke-static {p1}, Lcom/android/camera/VibratorUtils;->getInstance(Landroid/content/Context;)Lcom/android/camera/VibratorUtils;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/VibratorUtils;->cancel()V

    return-void

    :cond_0
    iget v1, p3, Landroid/graphics/Point;->x:I

    iget p3, p3, Landroid/graphics/Point;->y:I

    iget v2, p0, Lcom/android/camera/module/WideSelfieModule;->mJpegRotation:I

    rem-int/lit16 v2, v2, 0xb4

    const/16 v3, 0x5a

    if-ne v2, v3, :cond_1

    iget v2, p0, Lcom/android/camera/module/WideSelfieModule;->OFFSET_X_STOP_CAPTURE_THRESHOLD:I

    goto :goto_0

    :cond_1
    iget v2, p0, Lcom/android/camera/module/WideSelfieModule;->OFFSET_X_STOP_CAPTURE_THRESHOLD:I

    div-int/lit8 v2, v2, 0x2

    :goto_0
    invoke-static {p3}, Ljava/lang/Math;->abs(I)I

    move-result v4

    iget v5, p0, Lcom/android/camera/module/WideSelfieModule;->OFFSET_Y_STOP_CAPTURE_THRESHOLD:I

    const/4 v6, 0x0

    const/4 v7, 0x1

    if-ge v4, v5, :cond_3

    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    if-lt v1, v2, :cond_2

    goto :goto_1

    :cond_2
    move v1, v6

    goto :goto_2

    :cond_3
    :goto_1
    nop

    move v1, v7

    :goto_2
    if-nez p5, :cond_1a

    if-eqz v1, :cond_4

    goto/16 :goto_c

    :cond_4
    invoke-static {p3}, Ljava/lang/Math;->abs(I)I

    move-result p5

    iget v1, p0, Lcom/android/camera/module/WideSelfieModule;->OFFSET_Y_HINT_THRESHOLD:I

    if-lt p5, v1, :cond_5

    move p5, v7

    goto :goto_3

    :cond_5
    nop

    move p5, v6

    :goto_3
    if-eqz p5, :cond_9

    nop

    if-gez p3, :cond_6

    const p1, 0x7f0902c3

    goto :goto_4

    :cond_6
    const p1, 0x7f0902c4

    :goto_4
    if-eqz p1, :cond_8

    iget-boolean p2, p0, Lcom/android/camera/module/WideSelfieModule;->mIsContinuousVibratoring:Z

    if-nez p2, :cond_7

    iget-object p2, p0, Lcom/android/camera/module/WideSelfieModule;->mActivity:Lcom/android/camera/Camera;

    invoke-static {p2}, Lcom/android/camera/VibratorUtils;->getInstance(Landroid/content/Context;)Lcom/android/camera/VibratorUtils;

    move-result-object p2

    invoke-virtual {p2}, Lcom/android/camera/VibratorUtils;->vibrate()V

    iput-boolean v7, p0, Lcom/android/camera/module/WideSelfieModule;->mIsContinuousVibratoring:Z

    :cond_7
    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$WideSelfieProtocol;->updateHintText(I)V

    :cond_8
    return-void

    :cond_9
    iget-boolean p3, p0, Lcom/android/camera/module/WideSelfieModule;->mIsContinuousVibratoring:Z

    if-eqz p3, :cond_a

    iget-object p3, p0, Lcom/android/camera/module/WideSelfieModule;->mActivity:Lcom/android/camera/Camera;

    invoke-static {p3}, Lcom/android/camera/VibratorUtils;->getInstance(Landroid/content/Context;)Lcom/android/camera/VibratorUtils;

    move-result-object p3

    invoke-virtual {p3}, Lcom/android/camera/VibratorUtils;->cancel()V

    iput-boolean v6, p0, Lcom/android/camera/module/WideSelfieModule;->mIsContinuousVibratoring:Z

    :cond_a
    const/4 p3, -0x1

    if-ne p1, p3, :cond_b

    const p1, 0x7f0902c0

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$WideSelfieProtocol;->updateHintText(I)V

    return-void

    :cond_b
    const/16 p3, 0x64

    const/16 p5, 0x32

    if-eq p2, p5, :cond_c

    if-ne p2, p3, :cond_d

    :cond_c
    iget v1, p0, Lcom/android/camera/module/WideSelfieModule;->mLastVibratorProgress:I

    if-eq v1, p2, :cond_d

    iget-object v1, p0, Lcom/android/camera/module/WideSelfieModule;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v1}, Lcom/android/camera/VibratorUtils;->getInstance(Landroid/content/Context;)Lcom/android/camera/VibratorUtils;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/VibratorUtils;->vibrate()V

    iput p2, p0, Lcom/android/camera/module/WideSelfieModule;->mLastVibratorProgress:I

    :cond_d
    iget v1, p0, Lcom/android/camera/module/WideSelfieModule;->mJpegRotation:I

    rem-int/lit16 v1, v1, 0xb4

    if-ne v1, v3, :cond_12

    iget v1, p0, Lcom/android/camera/module/WideSelfieModule;->mMaxMoveWidth:I

    iget p4, p4, Landroid/graphics/Point;->y:I

    invoke-static {p4}, Ljava/lang/Math;->abs(I)I

    move-result p4

    invoke-static {v1, p4}, Ljava/lang/Math;->max(II)I

    move-result p4

    iput p4, p0, Lcom/android/camera/module/WideSelfieModule;->mMaxMoveWidth:I

    if-eq p2, p5, :cond_f

    if-ne p2, p3, :cond_e

    goto :goto_5

    :cond_e
    move p2, v6

    goto :goto_6

    :cond_f
    :goto_5
    nop

    move p2, v7

    :goto_6
    if-nez p2, :cond_10

    iget p3, p0, Lcom/android/camera/module/WideSelfieModule;->mLastMoveDirection:I

    if-ne p3, v7, :cond_10

    if-nez p1, :cond_10

    iget p2, p0, Lcom/android/camera/module/WideSelfieModule;->MOVE_DISTANCE:I

    iget p3, p0, Lcom/android/camera/module/WideSelfieModule;->mMaxMoveWidth:I

    sub-int/2addr p2, p3

    invoke-interface {v0, v6, v7, p2}, Lcom/android/camera/protocol/ModeProtocol$WideSelfieProtocol;->updateThumbBackgroudLayout(ZZI)V

    goto :goto_7

    :cond_10
    if-nez p2, :cond_11

    iget p2, p0, Lcom/android/camera/module/WideSelfieModule;->mLastMoveDirection:I

    if-nez p2, :cond_11

    if-ne p1, v7, :cond_11

    iget p2, p0, Lcom/android/camera/module/WideSelfieModule;->MOVE_DISTANCE:I

    iget p3, p0, Lcom/android/camera/module/WideSelfieModule;->mMaxMoveWidth:I

    sub-int/2addr p2, p3

    invoke-interface {v0, v6, v6, p2}, Lcom/android/camera/protocol/ModeProtocol$WideSelfieProtocol;->updateThumbBackgroudLayout(ZZI)V

    :cond_11
    :goto_7
    goto :goto_a

    :cond_12
    iget v1, p0, Lcom/android/camera/module/WideSelfieModule;->mMaxMoveWidth:I

    iget p4, p4, Landroid/graphics/Point;->x:I

    invoke-static {p4}, Ljava/lang/Math;->abs(I)I

    move-result p4

    invoke-static {v1, p4}, Ljava/lang/Math;->max(II)I

    move-result p4

    iput p4, p0, Lcom/android/camera/module/WideSelfieModule;->mMaxMoveWidth:I

    if-eq p2, p5, :cond_14

    if-ne p2, p3, :cond_13

    goto :goto_8

    :cond_13
    move p2, v6

    goto :goto_9

    :cond_14
    :goto_8
    nop

    move p2, v7

    :goto_9
    if-nez p2, :cond_15

    iget p3, p0, Lcom/android/camera/module/WideSelfieModule;->mLastMoveDirection:I

    if-ne p3, v7, :cond_15

    if-nez p1, :cond_15

    iget p2, p0, Lcom/android/camera/module/WideSelfieModule;->MOVE_DISTANCE_VERTICAL:I

    iget p3, p0, Lcom/android/camera/module/WideSelfieModule;->mMaxMoveWidth:I

    sub-int/2addr p2, p3

    invoke-interface {v0, v7, v7, p2}, Lcom/android/camera/protocol/ModeProtocol$WideSelfieProtocol;->updateThumbBackgroudLayout(ZZI)V

    goto :goto_a

    :cond_15
    if-nez p2, :cond_16

    iget p2, p0, Lcom/android/camera/module/WideSelfieModule;->mLastMoveDirection:I

    if-nez p2, :cond_16

    if-ne p1, v7, :cond_16

    iget p2, p0, Lcom/android/camera/module/WideSelfieModule;->MOVE_DISTANCE_VERTICAL:I

    iget p3, p0, Lcom/android/camera/module/WideSelfieModule;->mMaxMoveWidth:I

    sub-int/2addr p2, p3

    invoke-interface {v0, v7, v6, p2}, Lcom/android/camera/protocol/ModeProtocol$WideSelfieProtocol;->updateThumbBackgroudLayout(ZZI)V

    :cond_16
    :goto_a
    iput p1, p0, Lcom/android/camera/module/WideSelfieModule;->mLastMoveDirection:I

    nop

    if-ne p1, v7, :cond_17

    const v6, 0x7f0902c1

    goto :goto_b

    :cond_17
    if-nez p1, :cond_18

    const v6, 0x7f0902c2

    :cond_18
    :goto_b
    if-eqz v6, :cond_19

    invoke-interface {v0, v6}, Lcom/android/camera/protocol/ModeProtocol$WideSelfieProtocol;->updateHintText(I)V

    :cond_19
    return-void

    :cond_1a
    :goto_c
    const-string p1, "WideSelfieModule"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "stop shooting completed = "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string p3, ", requestStop = "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    invoke-direct {p0, v7, v6}, Lcom/android/camera/module/WideSelfieModule;->stopWideSelfieShooting(ZZ)V

    return-void
.end method

.method public onNv21Available([BII)V
    .locals 2

    const-string v0, "WideSelfieModule"

    const-string v1, "onNv21Available"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-direct {p0, p1, p2, p3}, Lcom/android/camera/module/WideSelfieModule;->startSaveTask([BII)V

    return-void
.end method

.method public onOrientationChanged(III)V
    .locals 2

    invoke-super {p0, p1, p2, p3}, Lcom/android/camera/module/BaseModule;->onOrientationChanged(III)V

    iget-boolean p2, p0, Lcom/android/camera/module/WideSelfieModule;->mIsShooting:Z

    if-eqz p2, :cond_1

    iget p2, p0, Lcom/android/camera/module/WideSelfieModule;->mCaptureOrientation:I

    sub-int/2addr p2, p3

    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    move-result p2

    const/16 v0, 0xb4

    if-le p2, v0, :cond_0

    rsub-int p2, p2, 0x168

    :cond_0
    const/16 v0, 0x3c

    if-lt p2, v0, :cond_1

    const-string p2, "WideSelfieModule"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onOrientationChanged stop shooting mCaptureOrientation "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/android/camera/module/WideSelfieModule;->mCaptureOrientation:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", orientation = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ", realTimeOrientation = "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, 0x0

    const/4 p2, 0x1

    invoke-direct {p0, p1, p2}, Lcom/android/camera/module/WideSelfieModule;->stopWideSelfieShooting(ZZ)V

    :cond_1
    return-void
.end method

.method public onPause()V
    .locals 2

    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onPause()V

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mMainHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/android/camera/module/WideSelfieModule;->closeCamera()V

    invoke-direct {p0}, Lcom/android/camera/module/WideSelfieModule;->resetScreenOn()V

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mWideSelfEngine:Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;

    invoke-virtual {v0}, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->pause()V

    return-void
.end method

.method public onPreviewLayoutChanged(Landroid/graphics/Rect;)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0, p1}, Lcom/android/camera/Camera;->onLayoutChange(Landroid/graphics/Rect;)V

    return-void
.end method

.method public onPreviewMetaDataUpdate(Landroid/hardware/camera2/CaptureResult;)V
    .locals 1

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-super {p0, p1}, Lcom/android/camera/module/BaseModule;->onPreviewMetaDataUpdate(Landroid/hardware/camera2/CaptureResult;)V

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mMetaDataFlowableEmitter:Lio/reactivex/FlowableEmitter;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mMetaDataFlowableEmitter:Lio/reactivex/FlowableEmitter;

    invoke-interface {v0, p1}, Lio/reactivex/FlowableEmitter;->onNext(Ljava/lang/Object;)V

    :cond_1
    return-void
.end method

.method public onPreviewSessionClosed(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 0

    return-void
.end method

.method public onPreviewSessionFailed(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 1

    invoke-virtual {p0}, Lcom/android/camera/module/WideSelfieModule;->isTextureExpired()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/android/camera/module/WideSelfieModule;->mMainHandler:Landroid/os/Handler;

    invoke-virtual {p0, p1}, Lcom/android/camera/module/WideSelfieModule;->retryOnceIfCameraError(Landroid/os/Handler;)Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "WideSelfieModule"

    const-string v0, "sessionFailed due to surfaceTexture expired, retry"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    iget-object p1, p0, Lcom/android/camera/module/WideSelfieModule;->mMainHandler:Landroid/os/Handler;

    const/16 v0, 0x33

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void
.end method

.method public onPreviewSessionSuccess(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 0

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/WideSelfieModule;->isAlive()Z

    move-result p1

    if-nez p1, :cond_1

    return-void

    :cond_1
    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/android/camera/module/WideSelfieModule;->setCameraState(I)V

    sget-object p1, Lcom/android/camera/constant/UpdateConstant;->WIDESELFIE_ON_PREVIEW_SUCCESS:[I

    invoke-virtual {p0, p1}, Lcom/android/camera/module/WideSelfieModule;->updatePreferenceInWorkThread([I)V

    return-void
.end method

.method public onPreviewSizeChanged(II)V
    .locals 0

    return-void
.end method

.method public onPreviewUpdate([BIILandroid/graphics/Rect;Landroid/graphics/Rect;)V
    .locals 0

    if-eqz p1, :cond_0

    invoke-static {p1, p2, p3}, Lcom/arcsoft/camera/utils/d;->a([BII)Landroid/graphics/Bitmap;

    move-result-object p1

    const/16 p2, 0x5a

    const/4 p3, 0x1

    invoke-static {p1, p2, p3}, Lcom/arcsoft/camera/utils/d;->rotateBitmap(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;

    move-result-object p1

    iget-object p2, p0, Lcom/android/camera/module/WideSelfieModule;->mMainHandler:Landroid/os/Handler;

    new-instance p3, Lcom/android/camera/module/WideSelfieModule$1;

    invoke-direct {p3, p0, p1, p4, p5}, Lcom/android/camera/module/WideSelfieModule$1;-><init>(Lcom/android/camera/module/WideSelfieModule;Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;)V

    invoke-virtual {p2, p3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 1

    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onResume()V

    invoke-direct {p0}, Lcom/android/camera/module/WideSelfieModule;->keepScreenOnAwhile()V

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mWideSelfEngine:Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;

    invoke-virtual {v0}, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->resume()V

    return-void
.end method

.method public onReviewCancelClicked()V
    .locals 0

    return-void
.end method

.method public onReviewDoneClicked()V
    .locals 0

    return-void
.end method

.method public onShutterButtonClick(I)V
    .locals 2

    iget-boolean v0, p0, Lcom/android/camera/module/WideSelfieModule;->mPaused:Z

    if-nez v0, :cond_6

    invoke-virtual {p0}, Lcom/android/camera/module/WideSelfieModule;->getCameraState()I

    move-result v0

    if-eqz v0, :cond_6

    invoke-virtual {p0}, Lcom/android/camera/module/WideSelfieModule;->isIgnoreTouchEvent()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->isScreenSlideOff()Z

    move-result v0

    if-eqz v0, :cond_1

    return-void

    :cond_1
    invoke-direct {p0}, Lcom/android/camera/module/WideSelfieModule;->isProcessingSaveTask()Z

    move-result v0

    if-eqz v0, :cond_2

    const-string p1, "WideSelfieModule"

    const-string v0, "onShutterButtonClick return, isProcessingSaveTask"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_2
    invoke-virtual {p0, p1}, Lcom/android/camera/module/WideSelfieModule;->setTriggerMode(I)V

    iget-boolean p1, p0, Lcom/android/camera/module/WideSelfieModule;->mIsShooting:Z

    if-nez p1, :cond_4

    iget-object p1, p0, Lcom/android/camera/module/WideSelfieModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->getScreenHint()Lcom/android/camera/ui/ScreenHint;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/ui/ScreenHint;->updateHint()V

    invoke-static {}, Lcom/android/camera/storage/Storage;->isLowStorageAtLastPoint()Z

    move-result p1

    if-eqz p1, :cond_3

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xd4

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$RecordState;

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onFailed()V

    return-void

    :cond_3
    const/4 p1, 0x2

    invoke-virtual {p0, p1}, Lcom/android/camera/module/WideSelfieModule;->playCameraSound(I)V

    invoke-virtual {p0}, Lcom/android/camera/module/WideSelfieModule;->startWideSelfieShooting()V

    iget-object p1, p0, Lcom/android/camera/module/WideSelfieModule;->mWideSelfEngine:Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;

    invoke-virtual {p1}, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->startCapture()I

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/module/WideSelfieModule;->mShootingStartTime:J

    goto :goto_0

    :cond_4
    invoke-direct {p0}, Lcom/android/camera/module/WideSelfieModule;->isShootingTooShort()Z

    move-result p1

    if-eqz p1, :cond_5

    const-string p1, "WideSelfieModule"

    const-string v0, "shooting is too short, ignore this click"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_5
    const/4 p1, 0x1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/camera/module/WideSelfieModule;->stopWideSelfieShooting(ZZ)V

    :goto_0
    return-void

    :cond_6
    :goto_1
    return-void
.end method

.method public onShutterButtonFocus(ZI)V
    .locals 0

    return-void
.end method

.method public onShutterButtonLongClick()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public onShutterButtonLongClickCancel(Z)V
    .locals 1

    const/4 p1, 0x0

    const/4 v0, 0x2

    invoke-virtual {p0, p1, v0}, Lcom/android/camera/module/WideSelfieModule;->onShutterButtonFocus(ZI)V

    return-void
.end method

.method public onSingleTapUp(IIZ)V
    .locals 1

    iget-boolean p3, p0, Lcom/android/camera/module/WideSelfieModule;->mPaused:Z

    if-nez p3, :cond_4

    iget-object p3, p0, Lcom/android/camera/module/WideSelfieModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz p3, :cond_4

    iget-object p3, p0, Lcom/android/camera/module/WideSelfieModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {p3}, Lcom/android/camera2/Camera2Proxy;->isSessionReady()Z

    move-result p3

    if-eqz p3, :cond_4

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/module/WideSelfieModule;->isInTapableRect(II)Z

    move-result p3

    if-nez p3, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/WideSelfieModule;->isFrameAvailable()Z

    move-result p3

    if-nez p3, :cond_1

    const-string p1, "WideSelfieModule"

    const-string p2, "onSingleTapUp: frame not available"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/module/WideSelfieModule;->isFrontCamera()Z

    move-result p3

    if-eqz p3, :cond_2

    iget-object p3, p0, Lcom/android/camera/module/WideSelfieModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p3}, Lcom/android/camera/Camera;->isScreenSlideOff()Z

    move-result p3

    if-eqz p3, :cond_2

    return-void

    :cond_2
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p3

    const/16 v0, 0xab

    invoke-virtual {p3, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p3

    check-cast p3, Lcom/android/camera/protocol/ModeProtocol$BackStack;

    invoke-interface {p3, p1, p2}, Lcom/android/camera/protocol/ModeProtocol$BackStack;->handleBackStackFromTapDown(II)Z

    move-result p1

    if-eqz p1, :cond_3

    return-void

    :cond_3
    iget-object p1, p0, Lcom/android/camera/module/WideSelfieModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    const/4 p2, 0x1

    invoke-interface {p1, p2}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setFocusViewType(Z)V

    return-void

    :cond_4
    :goto_0
    return-void
.end method

.method public onStop()V
    .locals 0

    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onStop()V

    return-void
.end method

.method public onThumbnailClicked(Landroid/view/View;)V
    .locals 0
    .annotation runtime Lcom/android/camera/OnClickAttr;
    .end annotation

    iget-boolean p1, p0, Lcom/android/camera/module/WideSelfieModule;->mPaused:Z

    if-nez p1, :cond_1

    invoke-direct {p0}, Lcom/android/camera/module/WideSelfieModule;->isProcessingSaveTask()Z

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/android/camera/module/WideSelfieModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/ThumbnailUpdater;->getThumbnail()Lcom/android/camera/Thumbnail;

    move-result-object p1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/android/camera/module/WideSelfieModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->gotoGallery()V

    return-void

    :cond_1
    :goto_0
    return-void
.end method

.method public onUserInteraction()V
    .locals 1

    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onUserInteraction()V

    iget-boolean v0, p0, Lcom/android/camera/module/WideSelfieModule;->mIsShooting:Z

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/android/camera/module/WideSelfieModule;->keepScreenOnAwhile()V

    :cond_0
    return-void
.end method

.method public onWideSelfCompleted()V
    .locals 2

    const-string v0, "WideSelfieModule"

    const-string v1, "onWideSelfCompleted"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method protected openSettingActivity()V
    .locals 4

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    iget-object v1, p0, Lcom/android/camera/module/WideSelfieModule;->mActivity:Lcom/android/camera/Camera;

    const-class v2, Lcom/android/camera/CameraPreferenceActivity;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    const-string v1, "from_where"

    iget v2, p0, Lcom/android/camera/module/WideSelfieModule;->mModuleIndex:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v1, ":miui:starting_window_label"

    invoke-virtual {p0}, Lcom/android/camera/module/WideSelfieModule;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f090048

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object v1, p0, Lcom/android/camera/module/WideSelfieModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->startFromKeyguard()Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "StartActivityWhenLocked"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    :cond_0
    iget-object v1, p0, Lcom/android/camera/module/WideSelfieModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1, v0}, Lcom/android/camera/Camera;->startActivity(Landroid/content/Intent;)V

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mActivity:Lcom/android/camera/Camera;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/android/camera/Camera;->setJumpFlag(I)V

    iget v0, p0, Lcom/android/camera/module/WideSelfieModule;->mModuleIndex:I

    invoke-static {v0}, Lcom/android/camera/statistic/CameraStatUtil;->trackGotoSettings(I)V

    return-void
.end method

.method public pausePreview()V
    .locals 2

    const-string v0, "WideSelfieModule"

    const-string v1, "pausePreview"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->pausePreview()V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/module/WideSelfieModule;->setCameraState(I)V

    return-void
.end method

.method protected performVolumeKeyClicked(Ljava/lang/String;IZ)V
    .locals 0

    if-nez p2, :cond_0

    if-eqz p3, :cond_0

    const/16 p1, 0x14

    invoke-virtual {p0, p1}, Lcom/android/camera/module/WideSelfieModule;->onShutterButtonClick(I)V

    :cond_0
    return-void
.end method

.method public registerProtocol()V
    .locals 3

    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->registerProtocol()V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc7

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    invoke-virtual {p0}, Lcom/android/camera/module/WideSelfieModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getImplFactory()Lcom/android/camera/module/impl/ImplFactory;

    move-result-object v0

    invoke-virtual {p0}, Lcom/android/camera/module/WideSelfieModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v1

    const/4 v2, 0x3

    new-array v2, v2, [I

    fill-array-data v2, :array_0

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/module/impl/ImplFactory;->initAdditional(Lcom/android/camera/ActivityBase;[I)V

    return-void

    nop

    :array_0
    .array-data 4
        0xae
        0xa4
        0xd4
    .end array-data
.end method

.method public requestRender()V
    .locals 2

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xd8

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$WideSelfieProtocol;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$WideSelfieProtocol;->requestRender()V

    :cond_0
    return-void
.end method

.method public resumePreview()V
    .locals 2

    const-string v0, "WideSelfieModule"

    const-string v1, "resumePreview"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->resumePreview()V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/module/WideSelfieModule;->setCameraState(I)V

    return-void
.end method

.method protected sendOpenFailMessage()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mMainHandler:Landroid/os/Handler;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void
.end method

.method public setFrameAvailable(Z)V
    .locals 1

    invoke-super {p0, p1}, Lcom/android/camera/module/BaseModule;->setFrameAvailable(Z)V

    if-eqz p1, :cond_0

    invoke-static {}, Lcom/android/camera/CameraSettings;->isCameraSoundOpen()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/android/camera/module/WideSelfieModule;->mActivity:Lcom/android/camera/Camera;

    if-eqz p1, :cond_0

    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Lcom/android/camera/Camera;->loadCameraSound(I)V

    const/4 v0, 0x3

    invoke-virtual {p1, v0}, Lcom/android/camera/Camera;->loadCameraSound(I)V

    :cond_0
    return-void
.end method

.method public shouldReleaseLater()Z
    .locals 1

    invoke-virtual {p0}, Lcom/android/camera/module/WideSelfieModule;->isRecording()Z

    move-result v0

    return v0
.end method

.method public startFaceDetection()V
    .locals 2

    iget-boolean v0, p0, Lcom/android/camera/module/WideSelfieModule;->mFaceDetectionEnabled:Z

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/android/camera/module/WideSelfieModule;->mFaceDetectionStarted:Z

    if-nez v0, :cond_2

    invoke-virtual {p0}, Lcom/android/camera/module/WideSelfieModule;->isAlive()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iget v0, p0, Lcom/android/camera/module/WideSelfieModule;->mMaxFaceCount:I

    if-lez v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/module/WideSelfieModule;->mFaceDetectionStarted:Z

    iget-object v1, p0, Lcom/android/camera/module/WideSelfieModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1}, Lcom/android/camera2/Camera2Proxy;->startFaceDetection()V

    invoke-direct {p0, v0, v0}, Lcom/android/camera/module/WideSelfieModule;->updateFaceView(ZZ)V

    :cond_1
    return-void

    :cond_2
    :goto_0
    return-void
.end method

.method public startPreview()V
    .locals 3

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mDeviceLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/android/camera/module/WideSelfieModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-nez v1, :cond_0

    const-string v1, "WideSelfieModule"

    const-string v2, "startPreview: camera has been closed"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    monitor-exit v0

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/WideSelfieModule;->checkDisplayOrientation()V

    iget-object v1, p0, Lcom/android/camera/module/WideSelfieModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget v2, p0, Lcom/android/camera/module/WideSelfieModule;->mCameraDisplayOrientation:I

    invoke-virtual {v1, v2}, Lcom/android/camera2/Camera2Proxy;->setDisplayOrientation(I)V

    iget-boolean v1, p0, Lcom/android/camera/module/WideSelfieModule;->mAeLockSupported:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/android/camera/module/WideSelfieModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v2}, Lcom/android/camera2/Camera2Proxy;->setAELock(Z)V

    :cond_1
    iget-boolean v1, p0, Lcom/android/camera/module/WideSelfieModule;->mAwbLockSupported:Z

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/android/camera/module/WideSelfieModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v2}, Lcom/android/camera2/Camera2Proxy;->setAWBLock(Z)V

    :cond_2
    iget-object v1, p0, Lcom/android/camera/module/WideSelfieModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget v2, p0, Lcom/android/camera/module/WideSelfieModule;->mTargetFocusMode:I

    invoke-virtual {v1, v2}, Lcom/android/camera2/Camera2Proxy;->setFocusMode(I)V

    iget-object v1, p0, Lcom/android/camera/module/WideSelfieModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1}, Lcom/android/camera2/Camera2Proxy;->resumePreview()V

    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/android/camera/module/WideSelfieModule;->setCameraState(I)V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public startPreviewSession()V
    .locals 9

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-nez v0, :cond_0

    const-string v0, "WideSelfieModule"

    const-string v1, "startPreview: camera has been closed"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setDualCamWaterMarkEnable(Z)V

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v1, p0, Lcom/android/camera/module/WideSelfieModule;->mErrorCallback:Lcom/android/camera/CameraErrorCallbackImpl;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setErrorCallback(Lcom/android/camera2/Camera2Proxy$CameraErrorCallback;)V

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v1, p0, Lcom/android/camera/module/WideSelfieModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setPreviewSize(Lcom/android/camera/CameraSize;)V

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v1, p0, Lcom/android/camera/module/WideSelfieModule;->mPictureSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setPictureSize(Lcom/android/camera/CameraSize;)V

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setPictureMaxImages(I)V

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/16 v1, 0x23

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setPictureFormat(I)V

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->getSurfaceCreatedTimestamp()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/module/WideSelfieModule;->mSurfaceCreatedTimestamp:J

    iget-object v2, p0, Lcom/android/camera/module/WideSelfieModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    new-instance v3, Landroid/view/Surface;

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v0

    invoke-direct {v3, v0}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    const/4 v4, 0x1

    const/4 v5, 0x0

    invoke-virtual {p0}, Lcom/android/camera/module/WideSelfieModule;->getOperatingMode()I

    move-result v6

    const/4 v7, 0x0

    move-object v8, p0

    invoke-virtual/range {v2 .. v8}, Lcom/android/camera2/Camera2Proxy;->startPreviewSession(Landroid/view/Surface;ZZIZLcom/android/camera2/Camera2Proxy$CameraPreviewCallback;)V

    return-void
.end method

.method public startWideSelfieShooting()V
    .locals 7

    invoke-direct {p0}, Lcom/android/camera/module/WideSelfieModule;->isProcessingSaveTask()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "WideSelfieModule"

    const-string v1, "previous save task is on going"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/WideSelfieModule;->mShowWarningToast:Z

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/camera/module/WideSelfieModule;->mFirstFrameNv21Data:[B

    iget v2, p0, Lcom/android/camera/module/WideSelfieModule;->mOrientation:I

    iput v2, p0, Lcom/android/camera/module/WideSelfieModule;->mCaptureOrientation:I

    iget v2, p0, Lcom/android/camera/module/WideSelfieModule;->mBogusCameraId:I

    iget v3, p0, Lcom/android/camera/module/WideSelfieModule;->mOrientation:I

    invoke-static {v2, v3}, Lcom/android/camera/Util;->getJpegRotation(II)I

    move-result v2

    iput v2, p0, Lcom/android/camera/module/WideSelfieModule;->mJpegRotation:I

    const-string v2, "WideSelfieModule"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "startWideSelfieShooting mJpegRotation = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v4, p0, Lcom/android/camera/module/WideSelfieModule;->mJpegRotation:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    const/16 v3, 0xd4

    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v2

    check-cast v2, Lcom/android/camera/protocol/ModeProtocol$RecordState;

    invoke-interface {v2}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onPrepare()V

    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/android/camera/module/WideSelfieModule;->mIsShooting:Z

    const/4 v4, -0x1

    iput v4, p0, Lcom/android/camera/module/WideSelfieModule;->mLastVibratorProgress:I

    iput v4, p0, Lcom/android/camera/module/WideSelfieModule;->mLastMoveDirection:I

    iput v0, p0, Lcom/android/camera/module/WideSelfieModule;->mMaxMoveWidth:I

    iget-object v4, p0, Lcom/android/camera/module/WideSelfieModule;->mWideSelfEngine:Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;

    iget v5, p0, Lcom/android/camera/module/WideSelfieModule;->mJpegRotation:I

    invoke-virtual {v4, v5}, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->setOrientation(I)V

    iget-object v4, p0, Lcom/android/camera/module/WideSelfieModule;->mDeviceLock:Ljava/lang/Object;

    monitor-enter v4

    :try_start_0
    iget-boolean v5, p0, Lcom/android/camera/module/WideSelfieModule;->mAeLockSupported:Z

    if-eqz v5, :cond_1

    iget-object v5, p0, Lcom/android/camera/module/WideSelfieModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v5, v3}, Lcom/android/camera2/Camera2Proxy;->setAELock(Z)V

    :cond_1
    iget-boolean v5, p0, Lcom/android/camera/module/WideSelfieModule;->mAwbLockSupported:Z

    if-eqz v5, :cond_2

    iget-object v5, p0, Lcom/android/camera/module/WideSelfieModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v5, v3}, Lcom/android/camera2/Camera2Proxy;->setAWBLock(Z)V

    :cond_2
    invoke-static {}, Lcom/android/camera/LocationManager;->instance()Lcom/android/camera/LocationManager;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/camera/LocationManager;->getCurrentLocation()Landroid/location/Location;

    move-result-object v5

    iget-object v6, p0, Lcom/android/camera/module/WideSelfieModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v6, v5}, Lcom/android/camera2/Camera2Proxy;->setGpsLocation(Landroid/location/Location;)V

    iget-object v5, p0, Lcom/android/camera/module/WideSelfieModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v5, v3}, Lcom/android/camera2/Camera2Proxy;->setFocusMode(I)V

    iget-object v5, p0, Lcom/android/camera/module/WideSelfieModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v5, v3}, Lcom/android/camera2/Camera2Proxy;->setEnableZsl(Z)V

    iget-object v3, p0, Lcom/android/camera/module/WideSelfieModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v3, v0}, Lcom/android/camera2/Camera2Proxy;->setNeedPausePreview(Z)V

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v3, 0x3

    invoke-virtual {v0, v3}, Lcom/android/camera2/Camera2Proxy;->setShotType(I)V

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/16 v3, 0x64

    new-instance v5, Lcom/android/camera/module/WideSelfieModule$3;

    invoke-direct {v5, p0}, Lcom/android/camera/module/WideSelfieModule$3;-><init>(Lcom/android/camera/module/WideSelfieModule;)V

    invoke-virtual {v0, v3, v5, v1}, Lcom/android/camera2/Camera2Proxy;->captureBurstPictures(ILcom/android/camera2/Camera2Proxy$PictureCallback;Lcom/xiaomi/camera/core/ParallelCallback;)V

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-interface {v2}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onStart()V

    invoke-virtual {p0}, Lcom/android/camera/module/WideSelfieModule;->keepScreenOn()V

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v0}, Lcom/android/camera/AutoLockManager;->getInstance(Landroid/content/Context;)Lcom/android/camera/AutoLockManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/AutoLockManager;->removeMessage()V

    return-void

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public stopFaceDetection(Z)V
    .locals 3

    iget-boolean v0, p0, Lcom/android/camera/module/WideSelfieModule;->mFaceDetectionEnabled:Z

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/android/camera/module/WideSelfieModule;->mFaceDetectionStarted:Z

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/WideSelfieModule;->mFaceDetectionStarted:Z

    iget-object v1, p0, Lcom/android/camera/module/WideSelfieModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/android/camera/module/WideSelfieModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1}, Lcom/android/camera2/Camera2Proxy;->stopFaceDetection()V

    :cond_1
    iget-object v1, p0, Lcom/android/camera/module/WideSelfieModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    const/4 v2, 0x2

    invoke-interface {v1, v2}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setActiveIndicator(I)V

    invoke-direct {p0, v0, p1}, Lcom/android/camera/module/WideSelfieModule;->updateFaceView(ZZ)V

    return-void

    :cond_2
    :goto_0
    return-void
.end method

.method public unRegisterProtocol()V
    .locals 2

    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->unRegisterProtocol()V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc7

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    iget-object v0, p0, Lcom/android/camera/module/WideSelfieModule;->mActivity:Lcom/android/camera/Camera;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getImplFactory()Lcom/android/camera/module/impl/ImplFactory;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/module/impl/ImplFactory;->detachAdditional()V

    :cond_0
    return-void
.end method

.method protected updateFace()V
    .locals 3

    invoke-virtual {p0}, Lcom/android/camera/module/WideSelfieModule;->enableFaceDetection()Z

    move-result v0

    iget-object v1, p0, Lcom/android/camera/module/WideSelfieModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/camera/module/WideSelfieModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    xor-int/lit8 v2, v0, 0x1

    invoke-interface {v1, v2}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setSkipDrawFace(Z)V

    :cond_0
    const/4 v1, 0x1

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/android/camera/module/WideSelfieModule;->mFaceDetectionEnabled:Z

    if-nez v0, :cond_2

    iput-boolean v1, p0, Lcom/android/camera/module/WideSelfieModule;->mFaceDetectionEnabled:Z

    invoke-virtual {p0}, Lcom/android/camera/module/WideSelfieModule;->startFaceDetection()V

    goto :goto_0

    :cond_1
    iget-boolean v0, p0, Lcom/android/camera/module/WideSelfieModule;->mFaceDetectionEnabled:Z

    if-eqz v0, :cond_2

    invoke-virtual {p0, v1}, Lcom/android/camera/module/WideSelfieModule;->stopFaceDetection(Z)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/WideSelfieModule;->mFaceDetectionEnabled:Z

    :cond_2
    :goto_0
    return-void
.end method
