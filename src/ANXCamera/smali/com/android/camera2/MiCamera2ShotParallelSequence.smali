.class public Lcom/android/camera2/MiCamera2ShotParallelSequence;
.super Lcom/android/camera2/MiCamera2Shot;
.source "MiCamera2ShotParallelSequence.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/camera2/MiCamera2Shot<",
        "Lcom/xiaomi/camera/core/ParallelTaskData;",
        ">;"
    }
.end annotation


# instance fields
.field private mAlgoType:I

.field private mCaptureResult:Landroid/hardware/camera2/CaptureResult;

.field private mFirstNum:Z

.field private mHdrCheckerEvValue:[I

.field private mSequenceNum:I

.field private requests:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/hardware/camera2/CaptureRequest;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/android/camera2/MiCamera2;Landroid/hardware/camera2/CaptureResult;)V
    .locals 0

    .line 38
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2Shot;-><init>(Lcom/android/camera2/MiCamera2;)V

    .line 29
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/android/camera2/MiCamera2ShotParallelSequence;->requests:Ljava/util/List;

    .line 39
    iput-object p2, p0, Lcom/android/camera2/MiCamera2ShotParallelSequence;->mCaptureResult:Landroid/hardware/camera2/CaptureResult;

    .line 40
    return-void
.end method

.method static synthetic access$000(Lcom/android/camera2/MiCamera2ShotParallelSequence;)Z
    .locals 0

    .line 26
    iget-boolean p0, p0, Lcom/android/camera2/MiCamera2ShotParallelSequence;->mFirstNum:Z

    return p0
.end method

.method static synthetic access$002(Lcom/android/camera2/MiCamera2ShotParallelSequence;Z)Z
    .locals 0

    .line 26
    iput-boolean p1, p0, Lcom/android/camera2/MiCamera2ShotParallelSequence;->mFirstNum:Z

    return p1
.end method

.method static synthetic access$100(Lcom/android/camera2/MiCamera2ShotParallelSequence;)I
    .locals 0

    .line 26
    iget p0, p0, Lcom/android/camera2/MiCamera2ShotParallelSequence;->mSequenceNum:I

    return p0
.end method

.method static synthetic access$110(Lcom/android/camera2/MiCamera2ShotParallelSequence;)I
    .locals 2

    .line 26
    iget v0, p0, Lcom/android/camera2/MiCamera2ShotParallelSequence;->mSequenceNum:I

    add-int/lit8 v1, v0, -0x1

    iput v1, p0, Lcom/android/camera2/MiCamera2ShotParallelSequence;->mSequenceNum:I

    return v0
.end method

.method private applyAlgoParameter(Landroid/hardware/camera2/CaptureRequest$Builder;II)V
    .locals 1

    .line 90
    const/4 v0, 0x1

    if-eq p3, v0, :cond_0

    goto :goto_0

    .line 92
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/android/camera2/MiCamera2ShotParallelSequence;->applyHdrParameter(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 95
    :goto_0
    return-void
.end method

.method private applyHdrParameter(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 2

    .line 99
    iget v0, p0, Lcom/android/camera2/MiCamera2ShotParallelSequence;->mSequenceNum:I

    if-gt p2, v0, :cond_0

    .line 103
    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/android/camera2/compat/MiCameraCompat;->applyHdrBracketMode(Landroid/hardware/camera2/CaptureRequest$Builder;B)V

    .line 104
    invoke-static {p1, p2}, Lcom/android/camera2/compat/MiCameraCompat;->applyMultiFrameInputNum(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 105
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_EXPOSURE_COMPENSATION:Landroid/hardware/camera2/CaptureRequest$Key;

    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotParallelSequence;->mHdrCheckerEvValue:[I

    aget p2, v1, p2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p1, v0, p2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 106
    return-void

    .line 100
    :cond_0
    new-instance p1, Ljava/lang/RuntimeException;

    const-string p2, "wrong num"

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private prepareClearShot()V
    .locals 1

    .line 85
    const/4 v0, 0x5

    iput v0, p0, Lcom/android/camera2/MiCamera2ShotParallelSequence;->mSequenceNum:I

    .line 86
    return-void
.end method

.method private prepareHdr()V
    .locals 5

    .line 65
    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotParallelSequence;->mCaptureResult:Landroid/hardware/camera2/CaptureResult;

    invoke-static {v0}, Lcom/android/camera2/CaptureResultParser;->getHdrCheckerValues(Landroid/hardware/camera2/CaptureResult;)[Ljava/lang/Byte;

    move-result-object v0

    .line 66
    if-nez v0, :cond_0

    .line 67
    const/4 v0, 0x3

    iput v0, p0, Lcom/android/camera2/MiCamera2ShotParallelSequence;->mSequenceNum:I

    .line 68
    new-array v0, v0, [I

    fill-array-data v0, :array_0

    iput-object v0, p0, Lcom/android/camera2/MiCamera2ShotParallelSequence;->mHdrCheckerEvValue:[I

    .line 69
    return-void

    .line 71
    :cond_0
    const/4 v1, 0x0

    aget-object v2, v0, v1

    invoke-virtual {v2}, Ljava/lang/Byte;->byteValue()B

    move-result v2

    iput v2, p0, Lcom/android/camera2/MiCamera2ShotParallelSequence;->mSequenceNum:I

    .line 72
    iget v2, p0, Lcom/android/camera2/MiCamera2ShotParallelSequence;->mSequenceNum:I

    const/4 v3, 0x6

    if-gt v2, v3, :cond_2

    .line 75
    iget v2, p0, Lcom/android/camera2/MiCamera2ShotParallelSequence;->mSequenceNum:I

    new-array v2, v2, [I

    iput-object v2, p0, Lcom/android/camera2/MiCamera2ShotParallelSequence;->mHdrCheckerEvValue:[I

    .line 76
    iget v2, p0, Lcom/android/camera2/MiCamera2ShotParallelSequence;->mSequenceNum:I

    if-lez v2, :cond_1

    iget v2, p0, Lcom/android/camera2/MiCamera2ShotParallelSequence;->mSequenceNum:I

    if-ge v2, v3, :cond_1

    .line 77
    :goto_0
    iget v2, p0, Lcom/android/camera2/MiCamera2ShotParallelSequence;->mSequenceNum:I

    if-ge v1, v2, :cond_1

    .line 78
    iget-object v2, p0, Lcom/android/camera2/MiCamera2ShotParallelSequence;->mHdrCheckerEvValue:[I

    add-int/lit8 v3, v1, 0x1

    mul-int/lit8 v4, v3, 0x4

    aget-object v4, v0, v4

    invoke-virtual {v4}, Ljava/lang/Byte;->byteValue()B

    move-result v4

    aput v4, v2, v1

    .line 77
    move v1, v3

    goto :goto_0

    .line 82
    :cond_1
    return-void

    .line 73
    :cond_2
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "wrong sequenceNum"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    :array_0
    .array-data 4
        -0x6
        0x0
        0x6
    .end array-data
.end method


# virtual methods
.method protected generateCaptureCallback()Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
    .locals 1

    .line 133
    new-instance v0, Lcom/android/camera2/MiCamera2ShotParallelSequence$1;

    invoke-direct {v0, p0}, Lcom/android/camera2/MiCamera2ShotParallelSequence$1;-><init>(Lcom/android/camera2/MiCamera2ShotParallelSequence;)V

    return-object v0
.end method

.method protected generateRequestBuilder()Landroid/hardware/camera2/CaptureRequest$Builder;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/hardware/camera2/CameraAccessException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 179
    nop

    .line 181
    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotParallelSequence;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v0}, Lcom/android/camera2/MiCamera2;->getCameraDevice()Landroid/hardware/camera2/CameraDevice;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v0

    .line 183
    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotParallelSequence;->mMiCamera:Lcom/android/camera2/MiCamera2;

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

    .line 184
    invoke-virtual {v0, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 185
    goto :goto_0

    .line 187
    :cond_0
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 191
    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotParallelSequence;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v1}, Lcom/android/camera2/MiCamera2;->getPreviewSurface()Landroid/view/Surface;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 193
    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotParallelSequence;->mMiCamera:Lcom/android/camera2/MiCamera2;

    const/4 v2, 0x3

    invoke-virtual {v1, v0, v2}, Lcom/android/camera2/MiCamera2;->applySettingsForCapture(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 194
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_ENABLE_ZSL:Landroid/hardware/camera2/CaptureRequest$Key;

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 196
    return-object v0
.end method

.method protected notifyResultData(Lcom/xiaomi/camera/core/ParallelTaskData;)V
    .locals 0

    .line 207
    return-void
.end method

.method protected bridge synthetic notifyResultData(Ljava/lang/Object;)V
    .locals 0

    .line 26
    check-cast p1, Lcom/xiaomi/camera/core/ParallelTaskData;

    invoke-virtual {p0, p1}, Lcom/android/camera2/MiCamera2ShotParallelSequence;->notifyResultData(Lcom/xiaomi/camera/core/ParallelTaskData;)V

    return-void
.end method

.method protected onImageReceived(Landroid/media/Image;I)V
    .locals 0

    .line 202
    return-void
.end method

.method protected prepare()V
    .locals 2

    .line 45
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera2/MiCamera2ShotParallelSequence;->mFirstNum:Z

    .line 46
    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotParallelSequence;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v1}, Lcom/android/camera2/MiCamera2;->getCameraConfigs()Lcom/android/camera2/CameraConfigs;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera2/CameraConfigs;->isHDREnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 47
    iput v0, p0, Lcom/android/camera2/MiCamera2ShotParallelSequence;->mAlgoType:I

    .line 52
    :cond_0
    iget v0, p0, Lcom/android/camera2/MiCamera2ShotParallelSequence;->mAlgoType:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1

    .line 55
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2ShotParallelSequence;->prepareHdr()V

    .line 56
    goto :goto_0

    .line 59
    :cond_1
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2ShotParallelSequence;->prepareClearShot()V

    .line 62
    :goto_0
    return-void
.end method

.method protected startShot()V
    .locals 4

    .line 112
    :try_start_0
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2ShotParallelSequence;->generateCaptureCallback()Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    move-result-object v0

    .line 113
    const/4 v1, 0x0

    :goto_0
    iget v2, p0, Lcom/android/camera2/MiCamera2ShotParallelSequence;->mSequenceNum:I

    if-ge v1, v2, :cond_0

    .line 114
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2ShotParallelSequence;->generateRequestBuilder()Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v2

    .line 115
    iget v3, p0, Lcom/android/camera2/MiCamera2ShotParallelSequence;->mAlgoType:I

    invoke-direct {p0, v2, v1, v3}, Lcom/android/camera2/MiCamera2ShotParallelSequence;->applyAlgoParameter(Landroid/hardware/camera2/CaptureRequest$Builder;II)V

    .line 116
    iget-object v3, p0, Lcom/android/camera2/MiCamera2ShotParallelSequence;->requests:Ljava/util/List;

    invoke-virtual {v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v2

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 113
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 119
    :cond_0
    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotParallelSequence;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v1}, Lcom/android/camera2/MiCamera2;->getCaptureSession()Landroid/hardware/camera2/CameraCaptureSession;

    move-result-object v1

    iget-object v2, p0, Lcom/android/camera2/MiCamera2ShotParallelSequence;->requests:Ljava/util/List;

    iget-object v3, p0, Lcom/android/camera2/MiCamera2ShotParallelSequence;->mCameraHandler:Landroid/os/Handler;

    invoke-virtual {v1, v2, v0, v3}, Landroid/hardware/camera2/CameraCaptureSession;->captureBurst(Ljava/util/List;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 125
    :catch_0
    move-exception v0

    .line 126
    sget-object v1, Lcom/android/camera2/MiCamera2ShotParallelSequence;->TAG:Ljava/lang/String;

    const-string v2, "Failed to captureBurst, IllegalState"

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 127
    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotParallelSequence;->mMiCamera:Lcom/android/camera2/MiCamera2;

    const/16 v1, 0x100

    invoke-virtual {v0, v1}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    goto :goto_2

    .line 121
    :catch_1
    move-exception v0

    .line 122
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->printStackTrace()V

    .line 123
    sget-object v1, Lcom/android/camera2/MiCamera2ShotParallelSequence;->TAG:Ljava/lang/String;

    const-string v2, "Cannot  captureBurst"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 124
    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotParallelSequence;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->getReason()I

    move-result v0

    invoke-virtual {v1, v0}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    .line 128
    :goto_1
    nop

    .line 129
    :goto_2
    return-void
.end method
