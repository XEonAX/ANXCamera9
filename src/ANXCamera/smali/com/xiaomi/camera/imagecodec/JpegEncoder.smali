.class public Lcom/xiaomi/camera/imagecodec/JpegEncoder;
.super Ljava/lang/Object;
.source "JpegEncoder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/camera/imagecodec/JpegEncoder$ReprocessHandler;,
        Lcom/xiaomi/camera/imagecodec/JpegEncoder$JpegEncoderHolder;
    }
.end annotation


# static fields
.field private static BACK_VT_CAMERA_ID_DEFAULT:Ljava/lang/String; = null

.field private static FRONT_VT_CAMERA_ID_DEFAULT:Ljava/lang/String; = null

.field private static final MAX_IMAGE_BUFFER_SIZE:I = 0x2

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mBackVtCameraId:Ljava/lang/String;

.field private final mCameraLock:Ljava/lang/Object;

.field private mCameraManager:Landroid/hardware/camera2/CameraManager;

.field private mCameraOperationHandler:Landroid/os/Handler;

.field private mCameraOperationThread:Landroid/os/HandlerThread;

.field private volatile mCreatingReprocessSession:Z

.field private mCurrentProcessingData:Lcom/xiaomi/camera/imagecodec/ReprocessData;

.field private mCurrentSessionId:I

.field private final mDataLock:Ljava/lang/Object;

.field private mFrontVtCameraId:Ljava/lang/String;

.field private mInitialized:Z

.field private mInputConfiguration:Landroid/hardware/camera2/params/InputConfiguration;

.field private mJpegImageReader:Landroid/media/ImageReader;

.field private mJpegOutputConfiguration:Lcom/xiaomi/camera/imagecodec/OutputConfiguration;

.field private mNeedReopenCamera:Z

.field private mReprocessHandler:Landroid/os/Handler;

.field private mReprocessImageWriter:Landroid/media/ImageWriter;

.field private mReprocessStartTime:J

.field private mReprocessThread:Landroid/os/HandlerThread;

.field private mTaskDataList:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lcom/xiaomi/camera/imagecodec/ReprocessData;",
            ">;"
        }
    .end annotation
.end field

.field private mVTCameraDevice:Landroid/hardware/camera2/CameraDevice;

.field private mVTCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

.field private mYuvImageReader:Landroid/media/ImageReader;

.field private mYuvOutputConfiguration:Lcom/xiaomi/camera/imagecodec/OutputConfiguration;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 49
    const-class v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    .line 51
    const-string v0, "100"

    sput-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->BACK_VT_CAMERA_ID_DEFAULT:Ljava/lang/String;

    .line 52
    const-string v0, "101"

    sput-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->FRONT_VT_CAMERA_ID_DEFAULT:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 3

    .line 101
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    sget-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->BACK_VT_CAMERA_ID_DEFAULT:Ljava/lang/String;

    iput-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mBackVtCameraId:Ljava/lang/String;

    .line 56
    sget-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->FRONT_VT_CAMERA_ID_DEFAULT:Ljava/lang/String;

    iput-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mFrontVtCameraId:Ljava/lang/String;

    .line 64
    const/4 v0, -0x1

    iput v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCurrentSessionId:I

    .line 72
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCameraLock:Ljava/lang/Object;

    .line 74
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mTaskDataList:Ljava/util/LinkedList;

    .line 76
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mDataLock:Ljava/lang/Object;

    .line 102
    new-instance v0, Lcom/xiaomi/camera/imagecodec/OutputConfiguration;

    const/4 v1, 0x0

    const/16 v2, 0x23

    invoke-direct {v0, v1, v1, v2}, Lcom/xiaomi/camera/imagecodec/OutputConfiguration;-><init>(III)V

    iput-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mYuvOutputConfiguration:Lcom/xiaomi/camera/imagecodec/OutputConfiguration;

    .line 103
    return-void
.end method

.method synthetic constructor <init>(Lcom/xiaomi/camera/imagecodec/JpegEncoder$1;)V
    .locals 0

    .line 47
    invoke-direct {p0}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;-><init>()V

    return-void
.end method

.method static synthetic access$100()Ljava/lang/String;
    .locals 1

    .line 47
    sget-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1000(Landroid/hardware/camera2/CameraCaptureSession;)I
    .locals 0

    .line 47
    invoke-static {p0}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->getSessionId(Landroid/hardware/camera2/CameraCaptureSession;)I

    move-result p0

    return p0
.end method

.method static synthetic access$1100(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)Landroid/media/ImageWriter;
    .locals 0

    .line 47
    iget-object p0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mReprocessImageWriter:Landroid/media/ImageWriter;

    return-object p0
.end method

.method static synthetic access$1102(Lcom/xiaomi/camera/imagecodec/JpegEncoder;Landroid/media/ImageWriter;)Landroid/media/ImageWriter;
    .locals 0

    .line 47
    iput-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mReprocessImageWriter:Landroid/media/ImageWriter;

    return-object p1
.end method

.method static synthetic access$1200(Landroid/media/Image;)[B
    .locals 0

    .line 47
    invoke-static {p0}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->getJpegData(Landroid/media/Image;)[B

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1300(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)Ljava/lang/Object;
    .locals 0

    .line 47
    iget-object p0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mDataLock:Ljava/lang/Object;

    return-object p0
.end method

.method static synthetic access$1400(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)Lcom/xiaomi/camera/imagecodec/ReprocessData;
    .locals 0

    .line 47
    iget-object p0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCurrentProcessingData:Lcom/xiaomi/camera/imagecodec/ReprocessData;

    return-object p0
.end method

.method static synthetic access$1402(Lcom/xiaomi/camera/imagecodec/JpegEncoder;Lcom/xiaomi/camera/imagecodec/ReprocessData;)Lcom/xiaomi/camera/imagecodec/ReprocessData;
    .locals 0

    .line 47
    iput-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCurrentProcessingData:Lcom/xiaomi/camera/imagecodec/ReprocessData;

    return-object p1
.end method

.method static synthetic access$1500(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)J
    .locals 2

    .line 47
    iget-wide v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mReprocessStartTime:J

    return-wide v0
.end method

.method static synthetic access$1600(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)Z
    .locals 0

    .line 47
    invoke-direct {p0}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->checkConditionIsReady()Z

    move-result p0

    return p0
.end method

.method static synthetic access$1700(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)V
    .locals 0

    .line 47
    invoke-direct {p0}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->reprocessImage()V

    return-void
.end method

.method static synthetic access$200(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)Ljava/util/LinkedList;
    .locals 0

    .line 47
    iget-object p0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mTaskDataList:Ljava/util/LinkedList;

    return-object p0
.end method

.method static synthetic access$300(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)Ljava/lang/Object;
    .locals 0

    .line 47
    iget-object p0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCameraLock:Ljava/lang/Object;

    return-object p0
.end method

.method static synthetic access$400(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)Landroid/hardware/camera2/CameraDevice;
    .locals 0

    .line 47
    iget-object p0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mVTCameraDevice:Landroid/hardware/camera2/CameraDevice;

    return-object p0
.end method

.method static synthetic access$402(Lcom/xiaomi/camera/imagecodec/JpegEncoder;Landroid/hardware/camera2/CameraDevice;)Landroid/hardware/camera2/CameraDevice;
    .locals 0

    .line 47
    iput-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mVTCameraDevice:Landroid/hardware/camera2/CameraDevice;

    return-object p1
.end method

.method static synthetic access$500(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)I
    .locals 0

    .line 47
    iget p0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCurrentSessionId:I

    return p0
.end method

.method static synthetic access$502(Lcom/xiaomi/camera/imagecodec/JpegEncoder;I)I
    .locals 0

    .line 47
    iput p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCurrentSessionId:I

    return p1
.end method

.method static synthetic access$508(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)I
    .locals 2

    .line 47
    iget v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCurrentSessionId:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCurrentSessionId:I

    return v0
.end method

.method static synthetic access$602(Lcom/xiaomi/camera/imagecodec/JpegEncoder;Landroid/hardware/camera2/CameraCaptureSession;)Landroid/hardware/camera2/CameraCaptureSession;
    .locals 0

    .line 47
    iput-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mVTCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    return-object p1
.end method

.method static synthetic access$702(Lcom/xiaomi/camera/imagecodec/JpegEncoder;Z)Z
    .locals 0

    .line 47
    iput-boolean p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCreatingReprocessSession:Z

    return p1
.end method

.method static synthetic access$800(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)V
    .locals 0

    .line 47
    invoke-direct {p0}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->sendReprocessRequest()V

    return-void
.end method

.method static synthetic access$900(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)Z
    .locals 0

    .line 47
    iget-boolean p0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mNeedReopenCamera:Z

    return p0
.end method

.method static synthetic access$902(Lcom/xiaomi/camera/imagecodec/JpegEncoder;Z)Z
    .locals 0

    .line 47
    iput-boolean p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mNeedReopenCamera:Z

    return p1
.end method

.method private checkConditionIsReady()Z
    .locals 4
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    .line 358
    nop

    .line 359
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mDataLock:Ljava/lang/Object;

    monitor-enter v0

    .line 360
    :try_start_0
    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCurrentProcessingData:Lcom/xiaomi/camera/imagecodec/ReprocessData;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 361
    sget-object v1, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    const-string v3, "checkConditionIsReady: processor is busy!"

    invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 362
    monitor-exit v0

    return v2

    .line 364
    :cond_0
    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mTaskDataList:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->peek()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/xiaomi/camera/imagecodec/ReprocessData;

    .line 365
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 366
    if-nez v1, :cond_1

    .line 367
    sget-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    const-string v1, "checkConditionIsReady: ignore null request!"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 368
    return v2

    .line 371
    :cond_1
    invoke-direct {p0, v1}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->createCaptureSessionIfNeed(Lcom/xiaomi/camera/imagecodec/ReprocessData;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0

    .line 365
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method private createCaptureSessionIfNeed(Lcom/xiaomi/camera/imagecodec/ReprocessData;)Z
    .locals 11
    .param p1    # Lcom/xiaomi/camera/imagecodec/ReprocessData;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    .line 280
    invoke-virtual {p1}, Lcom/xiaomi/camera/imagecodec/ReprocessData;->getYuvImage()Landroid/media/Image;

    move-result-object v0

    .line 281
    new-instance v1, Landroid/hardware/camera2/params/InputConfiguration;

    invoke-virtual {v0}, Landroid/media/Image;->getWidth()I

    move-result v2

    .line 282
    invoke-virtual {v0}, Landroid/media/Image;->getHeight()I

    move-result v3

    invoke-virtual {v0}, Landroid/media/Image;->getFormat()I

    move-result v0

    invoke-direct {v1, v2, v3, v0}, Landroid/hardware/camera2/params/InputConfiguration;-><init>(III)V

    .line 283
    new-instance v0, Lcom/xiaomi/camera/imagecodec/OutputConfiguration;

    .line 284
    invoke-virtual {p1}, Lcom/xiaomi/camera/imagecodec/ReprocessData;->getOutputWidth()I

    move-result v2

    .line 285
    invoke-virtual {p1}, Lcom/xiaomi/camera/imagecodec/ReprocessData;->getOutputHeight()I

    move-result v3

    .line 286
    invoke-virtual {p1}, Lcom/xiaomi/camera/imagecodec/ReprocessData;->getOutputFormat()I

    move-result v4

    invoke-direct {v0, v2, v3, v4}, Lcom/xiaomi/camera/imagecodec/OutputConfiguration;-><init>(III)V

    .line 287
    invoke-virtual {p1}, Lcom/xiaomi/camera/imagecodec/ReprocessData;->isFrontCamera()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mFrontVtCameraId:Ljava/lang/String;

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mBackVtCameraId:Ljava/lang/String;

    .line 290
    :goto_0
    iget-object v2, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCameraLock:Ljava/lang/Object;

    monitor-enter v2

    .line 292
    :try_start_0
    iget-object v3, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mVTCameraDevice:Landroid/hardware/camera2/CameraDevice;

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mVTCameraDevice:Landroid/hardware/camera2/CameraDevice;

    .line 293
    invoke-virtual {v3}, Landroid/hardware/camera2/CameraDevice;->getId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    goto :goto_1

    .line 295
    :cond_1
    move v3, v4

    goto :goto_2

    .line 293
    :cond_2
    :goto_1
    nop

    .line 295
    move v3, v5

    :goto_2
    if-eqz v3, :cond_6

    .line 296
    iget-boolean v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCreatingReprocessSession:Z

    if-eqz v0, :cond_3

    .line 297
    sget-object p1, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    const-string v0, "creating reprocess session..."

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 298
    monitor-exit v2

    return v5

    .line 300
    :cond_3
    iput-boolean v5, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCreatingReprocessSession:Z

    .line 302
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mVTCameraDevice:Landroid/hardware/camera2/CameraDevice;

    if-nez v0, :cond_4

    .line 303
    invoke-direct {p0, p1}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->openVTCamera(Ljava/lang/String;)V

    goto :goto_3

    .line 304
    :cond_4
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mVTCameraDevice:Landroid/hardware/camera2/CameraDevice;

    invoke-virtual {v0}, Landroid/hardware/camera2/CameraDevice;->getId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    .line 305
    sget-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "createCaptureSessionIfNeed: expected device changed. oldId="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mVTCameraDevice:Landroid/hardware/camera2/CameraDevice;

    .line 306
    invoke-virtual {v3}, Landroid/hardware/camera2/CameraDevice;->getId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " newId="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 305
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 308
    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mVTCameraDevice:Landroid/hardware/camera2/CameraDevice;

    invoke-virtual {p1}, Landroid/hardware/camera2/CameraDevice;->close()V

    .line 309
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mVTCameraDevice:Landroid/hardware/camera2/CameraDevice;

    .line 310
    iput-boolean v5, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mNeedReopenCamera:Z

    .line 312
    :cond_5
    :goto_3
    monitor-exit v2

    return v5

    .line 317
    :cond_6
    nop

    .line 318
    const/16 p1, 0x100

    iget v3, v0, Lcom/xiaomi/camera/imagecodec/OutputConfiguration;->mFormat:I

    if-ne p1, v3, :cond_7

    .line 319
    move p1, v5

    goto :goto_4

    .line 318
    :cond_7
    nop

    .line 319
    move p1, v4

    :goto_4
    if-eqz p1, :cond_8

    iget-object v3, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mJpegOutputConfiguration:Lcom/xiaomi/camera/imagecodec/OutputConfiguration;

    goto :goto_5

    :cond_8
    iget-object v3, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mYuvOutputConfiguration:Lcom/xiaomi/camera/imagecodec/OutputConfiguration;

    .line 321
    :goto_5
    iget-object v6, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mVTCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    if-nez v6, :cond_9

    .line 322
    nop

    .line 335
    :goto_6
    move v4, v5

    goto/16 :goto_c

    .line 323
    :cond_9
    iget-object v6, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mInputConfiguration:Landroid/hardware/camera2/params/InputConfiguration;

    invoke-virtual {v1, v6}, Landroid/hardware/camera2/params/InputConfiguration;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_a

    invoke-virtual {v0, v3}, Lcom/xiaomi/camera/imagecodec/OutputConfiguration;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_10

    .line 324
    :cond_a
    sget-object v6, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    const-string v7, "recreate session. in: %dx%d->%dx%d %sOut: %dx%d->%dx%d"

    const/16 v8, 0x9

    new-array v8, v8, [Ljava/lang/Object;

    iget-object v9, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mInputConfiguration:Landroid/hardware/camera2/params/InputConfiguration;

    if-nez v9, :cond_b

    .line 325
    move v9, v4

    goto :goto_7

    .line 324
    :cond_b
    iget-object v9, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mInputConfiguration:Landroid/hardware/camera2/params/InputConfiguration;

    .line 325
    invoke-virtual {v9}, Landroid/hardware/camera2/params/InputConfiguration;->getWidth()I

    move-result v9

    :goto_7
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v4

    iget-object v9, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mInputConfiguration:Landroid/hardware/camera2/params/InputConfiguration;

    if-nez v9, :cond_c

    .line 326
    move v9, v4

    goto :goto_8

    .line 325
    :cond_c
    iget-object v9, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mInputConfiguration:Landroid/hardware/camera2/params/InputConfiguration;

    .line 326
    invoke-virtual {v9}, Landroid/hardware/camera2/params/InputConfiguration;->getHeight()I

    move-result v9

    :goto_8
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v5

    const/4 v9, 0x2

    .line 327
    invoke-virtual {v1}, Landroid/hardware/camera2/params/InputConfiguration;->getWidth()I

    move-result v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x3

    invoke-virtual {v1}, Landroid/hardware/camera2/params/InputConfiguration;->getHeight()I

    move-result v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x4

    if-eqz p1, :cond_d

    const-string v10, "jpeg"

    goto :goto_9

    :cond_d
    const-string v10, "yuv"

    :goto_9
    aput-object v10, v8, v9

    const/4 v9, 0x5

    if-nez v3, :cond_e

    .line 329
    move v10, v4

    goto :goto_a

    :cond_e
    invoke-virtual {v3}, Lcom/xiaomi/camera/imagecodec/OutputConfiguration;->getWidth()I

    move-result v10

    :goto_a
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x6

    if-nez v3, :cond_f

    goto :goto_b

    .line 330
    :cond_f
    invoke-virtual {v3}, Lcom/xiaomi/camera/imagecodec/OutputConfiguration;->getHeight()I

    move-result v4

    :goto_b
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v8, v9

    const/4 v3, 0x7

    .line 331
    invoke-virtual {v0}, Lcom/xiaomi/camera/imagecodec/OutputConfiguration;->getWidth()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v8, v3

    const/16 v3, 0x8

    invoke-virtual {v0}, Lcom/xiaomi/camera/imagecodec/OutputConfiguration;->getHeight()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v8, v3

    .line 324
    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v6, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 332
    goto/16 :goto_6

    .line 335
    :cond_10
    :goto_c
    if-eqz v4, :cond_13

    .line 336
    iget-boolean v3, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCreatingReprocessSession:Z

    if-eqz v3, :cond_11

    .line 337
    sget-object p1, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    const-string v0, "creating reprocess session..."

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 338
    monitor-exit v2

    return v5

    .line 340
    :cond_11
    iput-boolean v5, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCreatingReprocessSession:Z

    .line 343
    iput-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mInputConfiguration:Landroid/hardware/camera2/params/InputConfiguration;

    .line 344
    if-eqz p1, :cond_12

    .line 345
    iput-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mJpegOutputConfiguration:Lcom/xiaomi/camera/imagecodec/OutputConfiguration;

    goto :goto_d

    .line 347
    :cond_12
    iput-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mYuvOutputConfiguration:Lcom/xiaomi/camera/imagecodec/OutputConfiguration;

    .line 349
    :goto_d
    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mInputConfiguration:Landroid/hardware/camera2/params/InputConfiguration;

    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mYuvOutputConfiguration:Lcom/xiaomi/camera/imagecodec/OutputConfiguration;

    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mJpegOutputConfiguration:Lcom/xiaomi/camera/imagecodec/OutputConfiguration;

    invoke-direct {p0, p1, v0, v1}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->createReprocessSession(Landroid/hardware/camera2/params/InputConfiguration;Lcom/xiaomi/camera/imagecodec/OutputConfiguration;Lcom/xiaomi/camera/imagecodec/OutputConfiguration;)V

    .line 352
    :cond_13
    monitor-exit v2

    return v4

    .line 353
    :catchall_0
    move-exception p1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method private createReprocessSession(Landroid/hardware/camera2/params/InputConfiguration;Lcom/xiaomi/camera/imagecodec/OutputConfiguration;Lcom/xiaomi/camera/imagecodec/OutputConfiguration;)V
    .locals 9
    .param p1    # Landroid/hardware/camera2/params/InputConfiguration;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/xiaomi/camera/imagecodec/OutputConfiguration;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Lcom/xiaomi/camera/imagecodec/OutputConfiguration;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    .line 511
    sget-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v2, "createReprocessSession>>input[%dx%d] output[%dx%d]"

    const/4 v3, 0x4

    new-array v3, v3, [Ljava/lang/Object;

    .line 512
    invoke-virtual {p1}, Landroid/hardware/camera2/params/InputConfiguration;->getWidth()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {p1}, Landroid/hardware/camera2/params/InputConfiguration;->getHeight()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v6, 0x1

    aput-object v4, v3, v6

    invoke-virtual {p3}, Lcom/xiaomi/camera/imagecodec/OutputConfiguration;->getWidth()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v7, 0x2

    aput-object v4, v3, v7

    invoke-virtual {p3}, Lcom/xiaomi/camera/imagecodec/OutputConfiguration;->getHeight()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v8, 0x3

    aput-object v4, v3, v8

    .line 511
    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 513
    invoke-virtual {p2}, Lcom/xiaomi/camera/imagecodec/OutputConfiguration;->getWidth()I

    move-result v0

    invoke-virtual {p2}, Lcom/xiaomi/camera/imagecodec/OutputConfiguration;->getHeight()I

    move-result v1

    invoke-direct {p0, v0, v1}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->initYuvImageReader(II)V

    .line 514
    invoke-virtual {p3}, Lcom/xiaomi/camera/imagecodec/OutputConfiguration;->getWidth()I

    move-result v0

    invoke-virtual {p3}, Lcom/xiaomi/camera/imagecodec/OutputConfiguration;->getHeight()I

    move-result p3

    invoke-direct {p0, v0, p3}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->initJpegImageReader(II)V

    .line 518
    :try_start_0
    invoke-virtual {p2}, Lcom/xiaomi/camera/imagecodec/OutputConfiguration;->getWidth()I

    move-result p2

    if-lez p2, :cond_0

    iget-object p2, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mYuvImageReader:Landroid/media/ImageReader;

    if-eqz p2, :cond_0

    .line 519
    new-array p2, v7, [Landroid/view/Surface;

    iget-object p3, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mJpegImageReader:Landroid/media/ImageReader;

    invoke-virtual {p3}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object p3

    aput-object p3, p2, v5

    iget-object p3, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mYuvImageReader:Landroid/media/ImageReader;

    invoke-virtual {p3}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object p3

    aput-object p3, p2, v6

    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p2

    goto :goto_0

    .line 521
    :cond_0
    new-array p2, v6, [Landroid/view/Surface;

    iget-object p3, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mJpegImageReader:Landroid/media/ImageReader;

    invoke-virtual {p3}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object p3

    aput-object p3, p2, v5

    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p2

    .line 523
    :goto_0
    iget-object p3, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mVTCameraDevice:Landroid/hardware/camera2/CameraDevice;

    new-instance v0, Landroid/hardware/camera2/params/InputConfiguration;

    .line 524
    invoke-virtual {p1}, Landroid/hardware/camera2/params/InputConfiguration;->getWidth()I

    move-result v1

    invoke-virtual {p1}, Landroid/hardware/camera2/params/InputConfiguration;->getHeight()I

    move-result v2

    invoke-virtual {p1}, Landroid/hardware/camera2/params/InputConfiguration;->getFormat()I

    move-result p1

    invoke-direct {v0, v1, v2, p1}, Landroid/hardware/camera2/params/InputConfiguration;-><init>(III)V

    new-instance p1, Lcom/xiaomi/camera/imagecodec/JpegEncoder$3;

    invoke-direct {p1, p0}, Lcom/xiaomi/camera/imagecodec/JpegEncoder$3;-><init>(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)V

    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCameraOperationHandler:Landroid/os/Handler;

    .line 523
    invoke-virtual {p3, v0, p2, p1, v1}, Landroid/hardware/camera2/CameraDevice;->createReprocessableCaptureSession(Landroid/hardware/camera2/params/InputConfiguration;Ljava/util/List;Landroid/hardware/camera2/CameraCaptureSession$StateCallback;Landroid/os/Handler;)V
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 572
    goto :goto_1

    .line 570
    :catch_0
    move-exception p1

    .line 571
    invoke-virtual {p1}, Landroid/hardware/camera2/CameraAccessException;->printStackTrace()V

    .line 573
    :goto_1
    sget-object p1, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    const-string p2, "createReprocessSession<<"

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 574
    return-void
.end method

.method private static getJpegData(Landroid/media/Image;)[B
    .locals 1

    .line 670
    invoke-virtual {p0}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object p0

    .line 671
    array-length v0, p0

    if-lez v0, :cond_0

    .line 672
    const/4 v0, 0x0

    aget-object p0, p0, v0

    invoke-virtual {p0}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object p0

    .line 673
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    new-array v0, v0, [B

    .line 674
    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 675
    return-object v0

    .line 677
    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method private static getSessionId(Landroid/hardware/camera2/CameraCaptureSession;)I
    .locals 2

    .line 656
    if-eqz p0, :cond_0

    .line 658
    :try_start_0
    const-string v0, "android.hardware.camera2.impl.CameraCaptureSessionImpl"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 659
    const-string v1, "mId"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 660
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 661
    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result p0
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    .line 662
    :catch_0
    move-exception p0

    .line 663
    sget-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    const-string v1, "getSessionId: failed! "

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 666
    :cond_0
    const/4 p0, -0x1

    return p0
.end method

.method private initJpegImageReader(II)V
    .locals 2
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    .line 578
    sget-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    const-string v1, "initJpegImageReader>>"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 579
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mJpegImageReader:Landroid/media/ImageReader;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mJpegImageReader:Landroid/media/ImageReader;

    .line 580
    invoke-virtual {v0}, Landroid/media/ImageReader;->getWidth()I

    move-result v0

    if-ne v0, p1, :cond_0

    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mJpegImageReader:Landroid/media/ImageReader;

    .line 581
    invoke-virtual {v0}, Landroid/media/ImageReader;->getHeight()I

    move-result v0

    if-eq v0, p2, :cond_1

    .line 582
    :cond_0
    sget-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    const-string v1, "closing obsolete reprocess reader"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 583
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mJpegImageReader:Landroid/media/ImageReader;

    invoke-virtual {v0}, Landroid/media/ImageReader;->close()V

    .line 585
    :cond_1
    const/16 v0, 0x100

    const/4 v1, 0x2

    invoke-static {p1, p2, v0, v1}, Landroid/media/ImageReader;->newInstance(IIII)Landroid/media/ImageReader;

    move-result-object p1

    iput-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mJpegImageReader:Landroid/media/ImageReader;

    .line 587
    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mJpegImageReader:Landroid/media/ImageReader;

    new-instance p2, Lcom/xiaomi/camera/imagecodec/JpegEncoder$4;

    invoke-direct {p2, p0}, Lcom/xiaomi/camera/imagecodec/JpegEncoder$4;-><init>(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)V

    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCameraOperationHandler:Landroid/os/Handler;

    invoke-virtual {p1, p2, v0}, Landroid/media/ImageReader;->setOnImageAvailableListener(Landroid/media/ImageReader$OnImageAvailableListener;Landroid/os/Handler;)V

    .line 607
    sget-object p1, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    const-string p2, "initJpegImageReader<<"

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 608
    return-void
.end method

.method private initYuvImageReader(II)V
    .locals 3
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    .line 612
    sget-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "initYuvImageReader>>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "x"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 613
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mYuvImageReader:Landroid/media/ImageReader;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mYuvImageReader:Landroid/media/ImageReader;

    .line 614
    invoke-virtual {v0}, Landroid/media/ImageReader;->getWidth()I

    move-result v0

    if-ne v0, p1, :cond_0

    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mYuvImageReader:Landroid/media/ImageReader;

    .line 615
    invoke-virtual {v0}, Landroid/media/ImageReader;->getHeight()I

    move-result v0

    if-eq v0, p2, :cond_1

    .line 616
    :cond_0
    sget-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    const-string v1, "closing obsolete yuv reader"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 617
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mYuvImageReader:Landroid/media/ImageReader;

    invoke-virtual {v0}, Landroid/media/ImageReader;->close()V

    .line 618
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mYuvImageReader:Landroid/media/ImageReader;

    .line 621
    :cond_1
    if-lez p1, :cond_3

    if-gtz p2, :cond_2

    goto :goto_0

    .line 625
    :cond_2
    const/16 v0, 0x23

    const/4 v1, 0x2

    invoke-static {p1, p2, v0, v1}, Landroid/media/ImageReader;->newInstance(IIII)Landroid/media/ImageReader;

    move-result-object p1

    iput-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mYuvImageReader:Landroid/media/ImageReader;

    .line 626
    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mYuvImageReader:Landroid/media/ImageReader;

    new-instance p2, Lcom/xiaomi/camera/imagecodec/JpegEncoder$5;

    invoke-direct {p2, p0}, Lcom/xiaomi/camera/imagecodec/JpegEncoder$5;-><init>(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)V

    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCameraOperationHandler:Landroid/os/Handler;

    invoke-virtual {p1, p2, v0}, Landroid/media/ImageReader;->setOnImageAvailableListener(Landroid/media/ImageReader$OnImageAvailableListener;Landroid/os/Handler;)V

    .line 652
    sget-object p1, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    const-string p2, "initYuvImageReader<<"

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 653
    return-void

    .line 622
    :cond_3
    :goto_0
    return-void
.end method

.method public static instance()Lcom/xiaomi/camera/imagecodec/JpegEncoder;
    .locals 1
    .annotation build Landroid/support/annotation/AnyThread;
    .end annotation

    .line 98
    sget-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$JpegEncoderHolder;->sInstance:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    return-object v0
.end method

.method private openVTCamera(Ljava/lang/String;)V
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MissingPermission"
        }
    .end annotation

    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    .line 439
    sget-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "openVTCamera: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 441
    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCameraManager:Landroid/hardware/camera2/CameraManager;

    new-instance v1, Lcom/xiaomi/camera/imagecodec/JpegEncoder$2;

    invoke-direct {v1, p0}, Lcom/xiaomi/camera/imagecodec/JpegEncoder$2;-><init>(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)V

    iget-object v2, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCameraOperationHandler:Landroid/os/Handler;

    invoke-virtual {v0, p1, v1, v2}, Landroid/hardware/camera2/CameraManager;->openCamera(Ljava/lang/String;Landroid/hardware/camera2/CameraDevice$StateCallback;Landroid/os/Handler;)V
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 504
    goto :goto_0

    .line 502
    :catch_0
    move-exception p1

    .line 503
    sget-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    const-string v1, "openVTCamera: open camera failed! No permission Exception."

    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 505
    :goto_0
    return-void
.end method

.method private reprocessImage()V
    .locals 5
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    .line 376
    sget-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    const-string v1, "reprocessImage>>"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 378
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mDataLock:Ljava/lang/Object;

    monitor-enter v0

    .line 379
    :try_start_0
    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mTaskDataList:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->poll()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/xiaomi/camera/imagecodec/ReprocessData;

    iput-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCurrentProcessingData:Lcom/xiaomi/camera/imagecodec/ReprocessData;

    .line 380
    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCurrentProcessingData:Lcom/xiaomi/camera/imagecodec/ReprocessData;

    invoke-virtual {v1}, Lcom/xiaomi/camera/imagecodec/ReprocessData;->getTotalCaptureResult()Lcom/xiaomi/protocol/ICustomCaptureResult;

    move-result-object v1

    .line 381
    iget v2, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCurrentSessionId:I

    invoke-static {v1, v2}, Lcom/xiaomi/protocol/ICustomCaptureResult;->toTotalCaptureResult(Lcom/xiaomi/protocol/ICustomCaptureResult;I)Landroid/hardware/camera2/TotalCaptureResult;

    move-result-object v1

    .line 382
    if-nez v1, :cond_0

    .line 383
    sget-object v1, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    const-string v2, "reprocessImage<<null metadata!"

    invoke-static {v1, v2}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 384
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    return-void

    .line 387
    :cond_0
    :try_start_1
    iget-object v2, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mDataLock:Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->notifyAll()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 390
    goto :goto_0

    .line 388
    :catch_0
    move-exception v2

    .line 389
    :try_start_2
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 391
    :goto_0
    sget-object v2, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "reprocessImage: tag="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCurrentProcessingData:Lcom/xiaomi/camera/imagecodec/ReprocessData;

    invoke-virtual {v4}, Lcom/xiaomi/camera/imagecodec/ReprocessData;->getImageTag()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 392
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 394
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mReprocessStartTime:J

    .line 395
    iget-object v2, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCameraLock:Ljava/lang/Object;

    monitor-enter v2

    .line 397
    :try_start_3
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mVTCameraDevice:Landroid/hardware/camera2/CameraDevice;

    .line 398
    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraDevice;->createReprocessCaptureRequest(Landroid/hardware/camera2/TotalCaptureResult;)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v0

    .line 399
    const/16 v1, 0x100

    iget-object v3, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCurrentProcessingData:Lcom/xiaomi/camera/imagecodec/ReprocessData;

    invoke-virtual {v3}, Lcom/xiaomi/camera/imagecodec/ReprocessData;->getOutputFormat()I

    move-result v3

    if-ne v1, v3, :cond_1

    .line 400
    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mJpegImageReader:Landroid/media/ImageReader;

    invoke-virtual {v1}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 401
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->JPEG_QUALITY:Landroid/hardware/camera2/CaptureRequest$Key;

    const/16 v3, 0x64

    invoke-static {v3}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    goto :goto_1

    .line 403
    :cond_1
    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mYuvImageReader:Landroid/media/ImageReader;

    invoke-virtual {v1}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 407
    :goto_1
    sget-object v1, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "reprocessImage: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCurrentProcessingData:Lcom/xiaomi/camera/imagecodec/ReprocessData;

    invoke-virtual {v4}, Lcom/xiaomi/camera/imagecodec/ReprocessData;->getYuvImage()Landroid/media/Image;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 408
    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mReprocessImageWriter:Landroid/media/ImageWriter;

    iget-object v3, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCurrentProcessingData:Lcom/xiaomi/camera/imagecodec/ReprocessData;

    invoke-virtual {v3}, Lcom/xiaomi/camera/imagecodec/ReprocessData;->getYuvImage()Landroid/media/Image;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/media/ImageWriter;->queueInputImage(Landroid/media/Image;)V

    .line 409
    new-instance v1, Lcom/xiaomi/camera/imagecodec/JpegEncoder$1;

    invoke-direct {v1, p0}, Lcom/xiaomi/camera/imagecodec/JpegEncoder$1;-><init>(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)V

    .line 428
    iget-object v3, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mVTCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    invoke-virtual {v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v0

    iget-object v4, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCameraOperationHandler:Landroid/os/Handler;

    invoke-virtual {v3, v0, v1, v4}, Landroid/hardware/camera2/CameraCaptureSession;->capture(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I
    :try_end_3
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 431
    goto :goto_2

    .line 432
    :catchall_0
    move-exception v0

    goto :goto_3

    .line 429
    :catch_1
    move-exception v0

    .line 430
    :try_start_4
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->printStackTrace()V

    .line 432
    :goto_2
    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 433
    sget-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    const-string v1, "reprocessImage<<"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 434
    return-void

    .line 432
    :goto_3
    :try_start_5
    monitor-exit v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    throw v0

    .line 392
    :catchall_1
    move-exception v1

    :try_start_6
    monitor-exit v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    throw v1
.end method

.method private sendReprocessRequest()V
    .locals 5
    .annotation build Landroid/support/annotation/AnyThread;
    .end annotation

    .line 239
    sget-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    const-string v1, "============================================================="

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 241
    iget-boolean v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mInitialized:Z

    if-nez v0, :cond_0

    .line 242
    sget-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    const-string v1, "sendReprocessRequest: NOT initialized!"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 243
    return-void

    .line 245
    :cond_0
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCameraLock:Ljava/lang/Object;

    monitor-enter v0

    .line 246
    :try_start_0
    iget-boolean v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCreatingReprocessSession:Z

    if-eqz v1, :cond_1

    .line 247
    sget-object v1, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    const-string v2, "sendReprocessRequest: creating session..."

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 248
    monitor-exit v0

    return-void

    .line 250
    :cond_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 252
    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mDataLock:Ljava/lang/Object;

    monitor-enter v1

    .line 253
    :try_start_1
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mTaskDataList:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v0

    const/4 v2, 0x2

    if-eqz v0, :cond_2

    .line 254
    sget-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    const-string v3, "sendReprocessRequest: idle. Try to close device 30s later."

    invoke-static {v0, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 255
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mReprocessHandler:Landroid/os/Handler;

    const-wide/16 v3, 0x7530

    invoke-virtual {v0, v2, v3, v4}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 256
    monitor-exit v1

    return-void

    .line 258
    :cond_2
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mReprocessHandler:Landroid/os/Handler;

    invoke-virtual {v0, v2}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 259
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mReprocessHandler:Landroid/os/Handler;

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 262
    :cond_3
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 264
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mReprocessHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 265
    sget-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    const-string v1, "sendReprocessRequest: busy"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 267
    :cond_4
    sget-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    const-string v2, "sendReprocessRequest: send MSG_REPROCESS_IMG"

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 268
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mReprocessHandler:Landroid/os/Handler;

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 270
    :goto_0
    return-void

    .line 262
    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    .line 250
    :catchall_1
    move-exception v1

    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v1
.end method


# virtual methods
.method public deInit()V
    .locals 3
    .annotation build Landroid/support/annotation/AnyThread;
    .end annotation

    .line 125
    sget-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    const-string v1, "deInit>>"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 126
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mDataLock:Ljava/lang/Object;

    monitor-enter v0

    .line 127
    :try_start_0
    iget-boolean v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mInitialized:Z

    if-nez v1, :cond_0

    .line 128
    monitor-exit v0

    return-void

    .line 130
    :cond_0
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mInitialized:Z

    .line 131
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCameraManager:Landroid/hardware/camera2/CameraManager;

    .line 132
    iput-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCurrentProcessingData:Lcom/xiaomi/camera/imagecodec/ReprocessData;

    .line 133
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 135
    iget-object v2, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCameraLock:Ljava/lang/Object;

    monitor-enter v2

    .line 137
    :try_start_1
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mVTCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    if-eqz v0, :cond_1

    .line 138
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mVTCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    invoke-virtual {v0}, Landroid/hardware/camera2/CameraCaptureSession;->close()V

    .line 139
    iput-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mVTCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    .line 140
    iput-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mJpegImageReader:Landroid/media/ImageReader;

    .line 141
    iput-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mYuvImageReader:Landroid/media/ImageReader;

    .line 142
    iput-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mReprocessImageWriter:Landroid/media/ImageWriter;

    .line 144
    :cond_1
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mVTCameraDevice:Landroid/hardware/camera2/CameraDevice;

    if-eqz v0, :cond_2

    .line 145
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mVTCameraDevice:Landroid/hardware/camera2/CameraDevice;

    invoke-virtual {v0}, Landroid/hardware/camera2/CameraDevice;->close()V

    .line 146
    iput-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mVTCameraDevice:Landroid/hardware/camera2/CameraDevice;

    .line 148
    :cond_2
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 150
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCameraOperationThread:Landroid/os/HandlerThread;

    if-eqz v0, :cond_3

    .line 151
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCameraOperationThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quitSafely()Z

    .line 153
    :try_start_2
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCameraOperationThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->join()V

    .line 154
    iput-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCameraOperationThread:Landroid/os/HandlerThread;

    .line 155
    iput-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCameraOperationHandler:Landroid/os/Handler;
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0

    .line 158
    goto :goto_0

    .line 156
    :catch_0
    move-exception v0

    .line 157
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    .line 161
    :cond_3
    :goto_0
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mReprocessThread:Landroid/os/HandlerThread;

    if-eqz v0, :cond_4

    .line 162
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mReprocessThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quitSafely()Z

    .line 164
    :try_start_3
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mReprocessThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->join()V

    .line 165
    iput-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mReprocessThread:Landroid/os/HandlerThread;

    .line 166
    iput-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mReprocessHandler:Landroid/os/Handler;
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_1

    .line 169
    goto :goto_1

    .line 167
    :catch_1
    move-exception v0

    .line 168
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    .line 171
    :cond_4
    :goto_1
    sget-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    const-string v1, "deInit<<"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 172
    return-void

    .line 148
    :catchall_0
    move-exception v0

    :try_start_4
    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v0

    .line 133
    :catchall_1
    move-exception v1

    :try_start_5
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    throw v1
.end method

.method public doReprocess(Lcom/xiaomi/camera/imagecodec/ReprocessData;)V
    .locals 7
    .annotation build Landroid/support/annotation/AnyThread;
    .end annotation

    .line 204
    sget-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "doReprocess: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 206
    invoke-virtual {p1}, Lcom/xiaomi/camera/imagecodec/ReprocessData;->getResultListener()Lcom/xiaomi/camera/imagecodec/ReprocessData$OnDataAvailableListener;

    move-result-object v0

    if-nez v0, :cond_0

    .line 207
    sget-object p1, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    const-string v0, "doReprocess: drop this request due to no callback was provided!"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 208
    return-void

    .line 210
    :cond_0
    iget-boolean v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mInitialized:Z

    if-eqz v0, :cond_2

    .line 213
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mDataLock:Ljava/lang/Object;

    monitor-enter v0

    .line 214
    :try_start_0
    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mTaskDataList:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/16 v2, 0x1d

    if-lt v1, v2, :cond_1

    .line 216
    :try_start_1
    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mDataLock:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 219
    goto :goto_0

    .line 217
    :catch_0
    move-exception v1

    .line 218
    :try_start_2
    invoke-virtual {v1}, Ljava/lang/InterruptedException;->printStackTrace()V

    .line 221
    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mTaskDataList:Ljava/util/LinkedList;

    invoke-virtual {v1, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 223
    invoke-virtual {p1}, Lcom/xiaomi/camera/imagecodec/ReprocessData;->getYuvImage()Landroid/media/Image;

    move-result-object v1

    invoke-virtual {v1}, Landroid/media/Image;->getTimestamp()J

    move-result-wide v1

    .line 224
    invoke-static {}, Lcom/xiaomi/camera/imagecodec/ImagePool;->getInstance()Lcom/xiaomi/camera/imagecodec/ImagePool;

    move-result-object v3

    invoke-virtual {p1}, Lcom/xiaomi/camera/imagecodec/ReprocessData;->getYuvImage()Landroid/media/Image;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/xiaomi/camera/imagecodec/ImagePool;->queueImage(Landroid/media/Image;)V

    .line 225
    invoke-static {}, Lcom/xiaomi/camera/imagecodec/ImagePool;->getInstance()Lcom/xiaomi/camera/imagecodec/ImagePool;

    move-result-object v3

    invoke-virtual {v3, v1, v2}, Lcom/xiaomi/camera/imagecodec/ImagePool;->getImage(J)Landroid/media/Image;

    move-result-object v3

    .line 226
    sget-object v4, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "doReprocess: image is "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v6, "; timestamp = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v4, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 227
    invoke-virtual {p1, v3}, Lcom/xiaomi/camera/imagecodec/ReprocessData;->setYuvImage(Landroid/media/Image;)V

    .line 228
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 229
    invoke-direct {p0}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->sendReprocessRequest()V

    .line 230
    return-void

    .line 228
    :catchall_0
    move-exception p1

    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw p1

    .line 211
    :cond_2
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "NOT initialized. Call init() first!"

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public init(Landroid/content/Context;)V
    .locals 2
    .annotation build Landroid/support/annotation/AnyThread;
    .end annotation

    .line 107
    sget-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    const-string v1, "init>>"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 108
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mDataLock:Ljava/lang/Object;

    monitor-enter v0

    .line 109
    :try_start_0
    iget-boolean v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mInitialized:Z

    if-nez v1, :cond_0

    .line 110
    const-string v1, "camera"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/hardware/camera2/CameraManager;

    iput-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCameraManager:Landroid/hardware/camera2/CameraManager;

    .line 111
    new-instance p1, Landroid/os/HandlerThread;

    const-string v1, "CameraOperationThread"

    invoke-direct {p1, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCameraOperationThread:Landroid/os/HandlerThread;

    .line 112
    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCameraOperationThread:Landroid/os/HandlerThread;

    invoke-virtual {p1}, Landroid/os/HandlerThread;->start()V

    .line 113
    new-instance p1, Landroid/os/Handler;

    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCameraOperationThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {p1, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCameraOperationHandler:Landroid/os/Handler;

    .line 114
    new-instance p1, Landroid/os/HandlerThread;

    const-string v1, "JpegEncoderThread"

    invoke-direct {p1, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mReprocessThread:Landroid/os/HandlerThread;

    .line 115
    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mReprocessThread:Landroid/os/HandlerThread;

    invoke-virtual {p1}, Landroid/os/HandlerThread;->start()V

    .line 116
    new-instance p1, Lcom/xiaomi/camera/imagecodec/JpegEncoder$ReprocessHandler;

    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mReprocessThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {p1, p0, v1}, Lcom/xiaomi/camera/imagecodec/JpegEncoder$ReprocessHandler;-><init>(Lcom/xiaomi/camera/imagecodec/JpegEncoder;Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mReprocessHandler:Landroid/os/Handler;

    .line 117
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mInitialized:Z

    .line 119
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 120
    sget-object p1, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    const-string v0, "init<<"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    return-void

    .line 119
    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public setJpegOutputSize(II)V
    .locals 3

    .line 183
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mJpegOutputConfiguration:Lcom/xiaomi/camera/imagecodec/OutputConfiguration;

    if-nez v0, :cond_0

    .line 184
    sget-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setJpegOutputSize: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "x"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 185
    new-instance v0, Lcom/xiaomi/camera/imagecodec/OutputConfiguration;

    const/16 v1, 0x100

    invoke-direct {v0, p1, p2, v1}, Lcom/xiaomi/camera/imagecodec/OutputConfiguration;-><init>(III)V

    iput-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mJpegOutputConfiguration:Lcom/xiaomi/camera/imagecodec/OutputConfiguration;

    .line 187
    :cond_0
    return-void
.end method

.method public setVTCameraIds(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/AnyThread;
    .end annotation

    .line 197
    sget-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    const-string v1, "setVTCameraIds: backId=%s frontId=%s"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 v3, 0x1

    aput-object p2, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 198
    iput-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mBackVtCameraId:Ljava/lang/String;

    .line 199
    iput-object p2, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mFrontVtCameraId:Ljava/lang/String;

    .line 200
    return-void
.end method
