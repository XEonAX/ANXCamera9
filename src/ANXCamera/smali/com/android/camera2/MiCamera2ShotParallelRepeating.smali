.class public Lcom/android/camera2/MiCamera2ShotParallelRepeating;
.super Lcom/android/camera2/MiCamera2Shot;
.source "MiCamera2ShotParallelRepeating.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/camera2/MiCamera2Shot<",
        "[B>;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "ParallelRepeating"


# instance fields
.field private mBurstNum:I

.field private mRepeatingCaptureResult:Landroid/hardware/camera2/CaptureResult;


# direct methods
.method public constructor <init>(Lcom/android/camera2/MiCamera2;I)V
    .locals 0

    .line 46
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2Shot;-><init>(Lcom/android/camera2/MiCamera2;)V

    .line 47
    iput p2, p0, Lcom/android/camera2/MiCamera2ShotParallelRepeating;->mBurstNum:I

    .line 48
    return-void
.end method

.method static synthetic access$000(Lcom/android/camera2/MiCamera2ShotParallelRepeating;)Landroid/hardware/camera2/CaptureResult;
    .locals 0

    .line 34
    iget-object p0, p0, Lcom/android/camera2/MiCamera2ShotParallelRepeating;->mRepeatingCaptureResult:Landroid/hardware/camera2/CaptureResult;

    return-object p0
.end method

.method static synthetic access$002(Lcom/android/camera2/MiCamera2ShotParallelRepeating;Landroid/hardware/camera2/CaptureResult;)Landroid/hardware/camera2/CaptureResult;
    .locals 0

    .line 34
    iput-object p1, p0, Lcom/android/camera2/MiCamera2ShotParallelRepeating;->mRepeatingCaptureResult:Landroid/hardware/camera2/CaptureResult;

    return-object p1
.end method

.method static synthetic access$100(Lcom/android/camera2/MiCamera2ShotParallelRepeating;Z)V
    .locals 0

    .line 34
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2ShotParallelRepeating;->onRepeatingEnd(Z)V

    return-void
.end method

.method private onRepeatingEnd(Z)V
    .locals 2

    .line 179
    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotParallelRepeating;->mMiCamera:Lcom/android/camera2/MiCamera2;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera2/MiCamera2;->setAWBLock(Z)V

    .line 180
    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotParallelRepeating;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v0}, Lcom/android/camera2/MiCamera2;->resumePreview()V

    .line 181
    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotParallelRepeating;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v0}, Lcom/android/camera2/MiCamera2;->getPictureCallback()Lcom/android/camera2/Camera2Proxy$PictureCallback;

    move-result-object v0

    .line 182
    if-eqz v0, :cond_0

    .line 183
    invoke-interface {v0, p1}, Lcom/android/camera2/Camera2Proxy$PictureCallback;->onPictureTakenFinished(Z)V

    .line 185
    :cond_0
    return-void
.end method


# virtual methods
.method protected generateCaptureCallback()Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
    .locals 1

    .line 76
    new-instance v0, Lcom/android/camera2/MiCamera2ShotParallelRepeating$1;

    invoke-direct {v0, p0}, Lcom/android/camera2/MiCamera2ShotParallelRepeating$1;-><init>(Lcom/android/camera2/MiCamera2ShotParallelRepeating;)V

    return-object v0
.end method

.method protected generateRequestBuilder()Landroid/hardware/camera2/CaptureRequest$Builder;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/hardware/camera2/CameraAccessException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 146
    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotParallelRepeating;->mMiCamera:Lcom/android/camera2/MiCamera2;

    .line 147
    invoke-virtual {v0}, Lcom/android/camera2/MiCamera2;->getCameraDevice()Landroid/hardware/camera2/CameraDevice;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v0

    .line 148
    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotParallelRepeating;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v1}, Lcom/android/camera2/MiCamera2;->getRemoteSurfaceList()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/Surface;

    .line 149
    const-string v3, "ParallelRepeating"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "add surface "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v5, " to capture request"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 150
    invoke-virtual {v0, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 151
    goto :goto_0

    .line 152
    :cond_0
    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotParallelRepeating;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v1}, Lcom/android/camera2/MiCamera2;->getPreviewSurface()Landroid/view/Surface;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 155
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2ShotParallelRepeating;->isInQcfaMode()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 156
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getBokehFrontCameraId()I

    move-result v1

    iget-object v2, p0, Lcom/android/camera2/MiCamera2ShotParallelRepeating;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v2}, Lcom/android/camera2/MiCamera2;->getId()I

    move-result v2

    if-ne v1, v2, :cond_2

    .line 157
    :cond_1
    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotParallelRepeating;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v1}, Lcom/android/camera2/MiCamera2;->getPreviewSurface()Landroid/view/Surface;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 160
    :cond_2
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    iget-object v2, p0, Lcom/android/camera2/MiCamera2ShotParallelRepeating;->mMiCamera:Lcom/android/camera2/MiCamera2;

    .line 161
    invoke-virtual {v2}, Lcom/android/camera2/MiCamera2;->getPreviewRequestBuilder()Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v2

    sget-object v3, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {v2, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->get(Landroid/hardware/camera2/CaptureRequest$Key;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    .line 160
    invoke-virtual {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 163
    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotParallelRepeating;->mMiCamera:Lcom/android/camera2/MiCamera2;

    const/4 v2, 0x3

    invoke-virtual {v1, v0, v2}, Lcom/android/camera2/MiCamera2;->applySettingsForCapture(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 164
    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/android/camera2/compat/MiCameraCompat;->applyMfnrEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 165
    return-object v0
.end method

.method protected bridge synthetic notifyResultData(Ljava/lang/Object;)V
    .locals 0

    .line 34
    check-cast p1, [B

    invoke-virtual {p0, p1}, Lcom/android/camera2/MiCamera2ShotParallelRepeating;->notifyResultData([B)V

    return-void
.end method

.method protected notifyResultData([B)V
    .locals 0

    .line 176
    return-void
.end method

.method protected onImageReceived(Landroid/media/Image;I)V
    .locals 0

    .line 171
    return-void
.end method

.method protected prepare()V
    .locals 2

    .line 52
    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotParallelRepeating;->mMiCamera:Lcom/android/camera2/MiCamera2;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera2/MiCamera2;->setAWBLock(Z)V

    .line 53
    return-void
.end method

.method protected startSessionCapture()V
    .locals 4

    .line 57
    const-string v0, "ParallelRepeating"

    const-string v1, "startSessionCapture"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/xiaomi/camera/base/PerformanceTracker;->trackPictureCapture(I)V

    .line 59
    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotParallelRepeating;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v0}, Lcom/android/camera2/MiCamera2;->pausePreview()V

    .line 62
    :try_start_0
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2ShotParallelRepeating;->generateCaptureCallback()Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    move-result-object v0

    .line 63
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2ShotParallelRepeating;->generateRequestBuilder()Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v1

    .line 64
    iget-object v2, p0, Lcom/android/camera2/MiCamera2ShotParallelRepeating;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v2}, Lcom/android/camera2/MiCamera2;->getCaptureSession()Landroid/hardware/camera2/CameraCaptureSession;

    move-result-object v2

    invoke-virtual {v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v1

    iget-object v3, p0, Lcom/android/camera2/MiCamera2ShotParallelRepeating;->mCameraHandler:Landroid/os/Handler;

    invoke-virtual {v2, v1, v0, v3}, Landroid/hardware/camera2/CameraCaptureSession;->setRepeatingRequest(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 68
    :catch_0
    move-exception v0

    .line 69
    const-string v1, "ParallelRepeating"

    const-string v2, "Failed to capture burst, IllegalState"

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 70
    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotParallelRepeating;->mMiCamera:Lcom/android/camera2/MiCamera2;

    const/16 v1, 0x100

    invoke-virtual {v0, v1}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    goto :goto_1

    .line 65
    :catch_1
    move-exception v0

    .line 66
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->printStackTrace()V

    .line 67
    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotParallelRepeating;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->getReason()I

    move-result v0

    invoke-virtual {v1, v0}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    .line 71
    :goto_0
    nop

    .line 72
    :goto_1
    return-void
.end method
