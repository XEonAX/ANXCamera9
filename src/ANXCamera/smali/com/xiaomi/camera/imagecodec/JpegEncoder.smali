.class public Lcom/xiaomi/camera/imagecodec/JpegEncoder;
.super Ljava/lang/Object;
.source "JpegEncoder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/camera/imagecodec/JpegEncoder$ReprocessHandler;
    }
.end annotation


# static fields
.field private static BACK_VT_CAMERA_ID_DEFAULT:Ljava/lang/String; = null

.field private static FRONT_VT_CAMERA_ID_DEFAULT:Ljava/lang/String; = null

.field private static final MAX_IMAGE_BUFFER_SIZE:I = 0x2

.field private static final TAG:Ljava/lang/String;

.field private static sInstance:Lcom/xiaomi/camera/imagecodec/JpegEncoder;


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

.field private mNeedReopenCamera:Z

.field private mOutputConfiguration:Lcom/xiaomi/camera/imagecodec/JpegOutputConfiguration;

.field private mReprocessHandler:Landroid/os/Handler;

.field private mReprocessImageReader:Landroid/media/ImageReader;

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


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 48
    const-class v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    .line 50
    const-string v0, "100"

    sput-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->BACK_VT_CAMERA_ID_DEFAULT:Ljava/lang/String;

    .line 51
    const-string v0, "101"

    sput-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->FRONT_VT_CAMERA_ID_DEFAULT:Ljava/lang/String;

    .line 85
    new-instance v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    invoke-direct {v0}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;-><init>()V

    sput-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->sInstance:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 96
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    sget-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->BACK_VT_CAMERA_ID_DEFAULT:Ljava/lang/String;

    iput-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mBackVtCameraId:Ljava/lang/String;

    .line 55
    sget-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->FRONT_VT_CAMERA_ID_DEFAULT:Ljava/lang/String;

    iput-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mFrontVtCameraId:Ljava/lang/String;

    .line 63
    const/4 v0, -0x1

    iput v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCurrentSessionId:I

    .line 70
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCameraLock:Ljava/lang/Object;

    .line 72
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mTaskDataList:Ljava/util/LinkedList;

    .line 74
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mDataLock:Ljava/lang/Object;

    .line 98
    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .line 46
    sget-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)Ljava/util/LinkedList;
    .locals 0

    .line 46
    iget-object p0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mTaskDataList:Ljava/util/LinkedList;

    return-object p0
.end method

.method static synthetic access$1002(Lcom/xiaomi/camera/imagecodec/JpegEncoder;Landroid/media/ImageWriter;)Landroid/media/ImageWriter;
    .locals 0

    .line 46
    iput-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mReprocessImageWriter:Landroid/media/ImageWriter;

    return-object p1
.end method

.method static synthetic access$1100(Landroid/media/Image;)[B
    .locals 0

    .line 46
    invoke-static {p0}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->getJpegData(Landroid/media/Image;)[B

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1200(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)Ljava/lang/Object;
    .locals 0

    .line 46
    iget-object p0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mDataLock:Ljava/lang/Object;

    return-object p0
.end method

.method static synthetic access$1300(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)Lcom/xiaomi/camera/imagecodec/ReprocessData;
    .locals 0

    .line 46
    iget-object p0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCurrentProcessingData:Lcom/xiaomi/camera/imagecodec/ReprocessData;

    return-object p0
.end method

.method static synthetic access$1302(Lcom/xiaomi/camera/imagecodec/JpegEncoder;Lcom/xiaomi/camera/imagecodec/ReprocessData;)Lcom/xiaomi/camera/imagecodec/ReprocessData;
    .locals 0

    .line 46
    iput-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCurrentProcessingData:Lcom/xiaomi/camera/imagecodec/ReprocessData;

    return-object p1
.end method

.method static synthetic access$1400(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)J
    .locals 2

    .line 46
    iget-wide v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mReprocessStartTime:J

    return-wide v0
.end method

.method static synthetic access$1500(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)Z
    .locals 0

    .line 46
    invoke-direct {p0}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->checkConditionIsReady()Z

    move-result p0

    return p0
.end method

.method static synthetic access$1600(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)V
    .locals 0

    .line 46
    invoke-direct {p0}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->reprocessImage()V

    return-void
.end method

.method static synthetic access$200(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)Ljava/lang/Object;
    .locals 0

    .line 46
    iget-object p0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCameraLock:Ljava/lang/Object;

    return-object p0
.end method

.method static synthetic access$300(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)Landroid/hardware/camera2/CameraDevice;
    .locals 0

    .line 46
    iget-object p0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mVTCameraDevice:Landroid/hardware/camera2/CameraDevice;

    return-object p0
.end method

.method static synthetic access$302(Lcom/xiaomi/camera/imagecodec/JpegEncoder;Landroid/hardware/camera2/CameraDevice;)Landroid/hardware/camera2/CameraDevice;
    .locals 0

    .line 46
    iput-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mVTCameraDevice:Landroid/hardware/camera2/CameraDevice;

    return-object p1
.end method

.method static synthetic access$400(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)I
    .locals 0

    .line 46
    iget p0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCurrentSessionId:I

    return p0
.end method

.method static synthetic access$402(Lcom/xiaomi/camera/imagecodec/JpegEncoder;I)I
    .locals 0

    .line 46
    iput p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCurrentSessionId:I

    return p1
.end method

.method static synthetic access$408(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)I
    .locals 2

    .line 46
    iget v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCurrentSessionId:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCurrentSessionId:I

    return v0
.end method

.method static synthetic access$502(Lcom/xiaomi/camera/imagecodec/JpegEncoder;Landroid/hardware/camera2/CameraCaptureSession;)Landroid/hardware/camera2/CameraCaptureSession;
    .locals 0

    .line 46
    iput-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mVTCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    return-object p1
.end method

.method static synthetic access$602(Lcom/xiaomi/camera/imagecodec/JpegEncoder;Z)Z
    .locals 0

    .line 46
    iput-boolean p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCreatingReprocessSession:Z

    return p1
.end method

.method static synthetic access$700(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)V
    .locals 0

    .line 46
    invoke-direct {p0}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->sendReprocessRequest()V

    return-void
.end method

.method static synthetic access$800(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)Z
    .locals 0

    .line 46
    iget-boolean p0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mNeedReopenCamera:Z

    return p0
.end method

.method static synthetic access$802(Lcom/xiaomi/camera/imagecodec/JpegEncoder;Z)Z
    .locals 0

    .line 46
    iput-boolean p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mNeedReopenCamera:Z

    return p1
.end method

.method static synthetic access$900(Landroid/hardware/camera2/CameraCaptureSession;)I
    .locals 0

    .line 46
    invoke-static {p0}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->getSessionId(Landroid/hardware/camera2/CameraCaptureSession;)I

    move-result p0

    return p0
.end method

.method private checkConditionIsReady()Z
    .locals 4
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    .line 313
    nop

    .line 314
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mDataLock:Ljava/lang/Object;

    monitor-enter v0

    .line 315
    :try_start_0
    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCurrentProcessingData:Lcom/xiaomi/camera/imagecodec/ReprocessData;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 316
    sget-object v1, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    const-string v3, "sendReprocessRequest: mCurrentProcessingData is not null, there is other tasks has be doing"

    invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 318
    monitor-exit v0

    return v2

    .line 320
    :cond_0
    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mTaskDataList:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->peek()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/xiaomi/camera/imagecodec/ReprocessData;

    .line 321
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 322
    if-nez v1, :cond_1

    .line 323
    sget-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    const-string v1, "checkConditionIsReady: reprocess data is null!"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 324
    return v2

    .line 327
    :cond_1
    invoke-direct {p0, v1}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->createCaptureSessionIfNeed(Lcom/xiaomi/camera/imagecodec/ReprocessData;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0

    .line 321
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method private createCaptureSessionIfNeed(Lcom/xiaomi/camera/imagecodec/ReprocessData;)Z
    .locals 9
    .param p1    # Lcom/xiaomi/camera/imagecodec/ReprocessData;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    .line 246
    invoke-virtual {p1}, Lcom/xiaomi/camera/imagecodec/ReprocessData;->getYuvImage()Lcom/xiaomi/camera/imagecodec/MiImage;

    move-result-object v0

    .line 247
    new-instance v1, Landroid/hardware/camera2/params/InputConfiguration;

    invoke-virtual {v0}, Lcom/xiaomi/camera/imagecodec/MiImage;->getWidth()I

    move-result v2

    .line 248
    invoke-virtual {v0}, Lcom/xiaomi/camera/imagecodec/MiImage;->getHeight()I

    move-result v3

    invoke-virtual {v0}, Lcom/xiaomi/camera/imagecodec/MiImage;->getFormat()I

    move-result v0

    invoke-direct {v1, v2, v3, v0}, Landroid/hardware/camera2/params/InputConfiguration;-><init>(III)V

    .line 249
    new-instance v0, Lcom/xiaomi/camera/imagecodec/JpegOutputConfiguration;

    .line 250
    invoke-virtual {p1}, Lcom/xiaomi/camera/imagecodec/ReprocessData;->getOutputWidth()I

    move-result v2

    invoke-virtual {p1}, Lcom/xiaomi/camera/imagecodec/ReprocessData;->getOutputHeight()I

    move-result v3

    invoke-direct {v0, v2, v3}, Lcom/xiaomi/camera/imagecodec/JpegOutputConfiguration;-><init>(II)V

    .line 251
    invoke-virtual {p1}, Lcom/xiaomi/camera/imagecodec/ReprocessData;->isFrontCamera()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mFrontVtCameraId:Ljava/lang/String;

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mBackVtCameraId:Ljava/lang/String;

    .line 253
    :goto_0
    iget-object v2, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCameraLock:Ljava/lang/Object;

    monitor-enter v2

    .line 255
    :try_start_0
    iget-object v3, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mVTCameraDevice:Landroid/hardware/camera2/CameraDevice;

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mVTCameraDevice:Landroid/hardware/camera2/CameraDevice;

    invoke-virtual {v3}, Landroid/hardware/camera2/CameraDevice;->getId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    goto :goto_1

    .line 257
    :cond_1
    move v3, v4

    goto :goto_2

    .line 255
    :cond_2
    :goto_1
    nop

    .line 257
    move v3, v5

    :goto_2
    if-eqz v3, :cond_6

    .line 258
    iget-boolean v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCreatingReprocessSession:Z

    if-eqz v0, :cond_3

    .line 259
    sget-object p1, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    const-string v0, "creating reprocess session..."

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 260
    monitor-exit v2

    return v5

    .line 262
    :cond_3
    iput-boolean v5, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCreatingReprocessSession:Z

    .line 264
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mVTCameraDevice:Landroid/hardware/camera2/CameraDevice;

    if-nez v0, :cond_4

    .line 265
    invoke-direct {p0, p1}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->openVTCamera(Ljava/lang/String;)V

    goto :goto_3

    .line 266
    :cond_4
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mVTCameraDevice:Landroid/hardware/camera2/CameraDevice;

    invoke-virtual {v0}, Landroid/hardware/camera2/CameraDevice;->getId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    .line 267
    sget-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "createCaptureSessionIfNeed: expected device id is not matched, The old is :"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mVTCameraDevice:Landroid/hardware/camera2/CameraDevice;

    .line 268
    invoke-virtual {v3}, Landroid/hardware/camera2/CameraDevice;->getId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "; the new is :"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 267
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 270
    sget-object p1, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "createCaptureSessionIfNeed: close old camera "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mVTCameraDevice:Landroid/hardware/camera2/CameraDevice;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 271
    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mVTCameraDevice:Landroid/hardware/camera2/CameraDevice;

    invoke-virtual {p1}, Landroid/hardware/camera2/CameraDevice;->close()V

    .line 272
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mVTCameraDevice:Landroid/hardware/camera2/CameraDevice;

    .line 273
    iput-boolean v5, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mNeedReopenCamera:Z

    .line 275
    :cond_5
    :goto_3
    monitor-exit v2

    return v5

    .line 280
    :cond_6
    nop

    .line 282
    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mVTCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    if-nez p1, :cond_7

    .line 283
    nop

    .line 295
    :goto_4
    move v4, v5

    goto/16 :goto_9

    .line 284
    :cond_7
    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mInputConfiguration:Landroid/hardware/camera2/params/InputConfiguration;

    invoke-virtual {v1, p1}, Landroid/hardware/camera2/params/InputConfiguration;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_8

    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mOutputConfiguration:Lcom/xiaomi/camera/imagecodec/JpegOutputConfiguration;

    invoke-virtual {v0, p1}, Lcom/xiaomi/camera/imagecodec/JpegOutputConfiguration;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_d

    .line 285
    :cond_8
    sget-object p1, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    const-string v3, "recreate session settings: %dx%d->%dx%d %dx%d->%dx%d"

    const/16 v6, 0x8

    new-array v6, v6, [Ljava/lang/Object;

    iget-object v7, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mInputConfiguration:Landroid/hardware/camera2/params/InputConfiguration;

    if-nez v7, :cond_9

    .line 286
    move v7, v4

    goto :goto_5

    .line 285
    :cond_9
    iget-object v7, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mInputConfiguration:Landroid/hardware/camera2/params/InputConfiguration;

    .line 286
    invoke-virtual {v7}, Landroid/hardware/camera2/params/InputConfiguration;->getWidth()I

    move-result v7

    :goto_5
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v4

    iget-object v7, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mInputConfiguration:Landroid/hardware/camera2/params/InputConfiguration;

    if-nez v7, :cond_a

    .line 287
    move v7, v4

    goto :goto_6

    .line 286
    :cond_a
    iget-object v7, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mInputConfiguration:Landroid/hardware/camera2/params/InputConfiguration;

    .line 287
    invoke-virtual {v7}, Landroid/hardware/camera2/params/InputConfiguration;->getHeight()I

    move-result v7

    :goto_6
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v5

    const/4 v7, 0x2

    .line 288
    invoke-virtual {v1}, Landroid/hardware/camera2/params/InputConfiguration;->getWidth()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x3

    invoke-virtual {v1}, Landroid/hardware/camera2/params/InputConfiguration;->getHeight()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x4

    iget-object v8, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mOutputConfiguration:Lcom/xiaomi/camera/imagecodec/JpegOutputConfiguration;

    if-nez v8, :cond_b

    .line 289
    move v8, v4

    goto :goto_7

    .line 288
    :cond_b
    iget-object v8, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mOutputConfiguration:Lcom/xiaomi/camera/imagecodec/JpegOutputConfiguration;

    .line 289
    invoke-virtual {v8}, Lcom/xiaomi/camera/imagecodec/JpegOutputConfiguration;->getWidth()I

    move-result v8

    :goto_7
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x5

    iget-object v8, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mOutputConfiguration:Lcom/xiaomi/camera/imagecodec/JpegOutputConfiguration;

    if-nez v8, :cond_c

    goto :goto_8

    :cond_c
    iget-object v4, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mOutputConfiguration:Lcom/xiaomi/camera/imagecodec/JpegOutputConfiguration;

    .line 290
    invoke-virtual {v4}, Lcom/xiaomi/camera/imagecodec/JpegOutputConfiguration;->getHeight()I

    move-result v4

    :goto_8
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v6, v7

    const/4 v4, 0x6

    .line 291
    invoke-virtual {v0}, Lcom/xiaomi/camera/imagecodec/JpegOutputConfiguration;->getWidth()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v4

    const/4 v4, 0x7

    invoke-virtual {v0}, Lcom/xiaomi/camera/imagecodec/JpegOutputConfiguration;->getHeight()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v4

    .line 285
    invoke-static {v3, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {p1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 292
    goto/16 :goto_4

    .line 295
    :cond_d
    :goto_9
    if-eqz v4, :cond_f

    .line 296
    iget-boolean p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCreatingReprocessSession:Z

    if-eqz p1, :cond_e

    .line 297
    sget-object p1, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    const-string v0, "creating reprocess session..."

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 298
    monitor-exit v2

    return v5

    .line 300
    :cond_e
    iput-boolean v5, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCreatingReprocessSession:Z

    .line 303
    iput-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mInputConfiguration:Landroid/hardware/camera2/params/InputConfiguration;

    .line 304
    iput-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mOutputConfiguration:Lcom/xiaomi/camera/imagecodec/JpegOutputConfiguration;

    .line 305
    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mInputConfiguration:Landroid/hardware/camera2/params/InputConfiguration;

    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mOutputConfiguration:Lcom/xiaomi/camera/imagecodec/JpegOutputConfiguration;

    invoke-direct {p0, p1, v0}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->createReprocessSession(Landroid/hardware/camera2/params/InputConfiguration;Lcom/xiaomi/camera/imagecodec/JpegOutputConfiguration;)V

    .line 307
    :cond_f
    monitor-exit v2

    return v4

    .line 308
    :catchall_0
    move-exception p1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method private createReprocessSession(Landroid/hardware/camera2/params/InputConfiguration;Lcom/xiaomi/camera/imagecodec/JpegOutputConfiguration;)V
    .locals 3
    .param p1    # Landroid/hardware/camera2/params/InputConfiguration;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/xiaomi/camera/imagecodec/JpegOutputConfiguration;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    .line 463
    sget-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    const-string v1, "createReprocessSession>>"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 464
    invoke-virtual {p2}, Lcom/xiaomi/camera/imagecodec/JpegOutputConfiguration;->getWidth()I

    move-result v0

    invoke-virtual {p2}, Lcom/xiaomi/camera/imagecodec/JpegOutputConfiguration;->getHeight()I

    move-result p2

    invoke-direct {p0, v0, p2}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->initReprocessImageReader(II)V

    .line 467
    :try_start_0
    iget-object p2, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mVTCameraDevice:Landroid/hardware/camera2/CameraDevice;

    new-instance v0, Landroid/hardware/camera2/params/InputConfiguration;

    .line 468
    invoke-virtual {p1}, Landroid/hardware/camera2/params/InputConfiguration;->getWidth()I

    move-result v1

    invoke-virtual {p1}, Landroid/hardware/camera2/params/InputConfiguration;->getHeight()I

    move-result v2

    invoke-virtual {p1}, Landroid/hardware/camera2/params/InputConfiguration;->getFormat()I

    move-result p1

    invoke-direct {v0, v1, v2, p1}, Landroid/hardware/camera2/params/InputConfiguration;-><init>(III)V

    const/4 p1, 0x1

    new-array p1, p1, [Landroid/view/Surface;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mReprocessImageReader:Landroid/media/ImageReader;

    .line 469
    invoke-virtual {v2}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object v2

    aput-object v2, p1, v1

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    new-instance v1, Lcom/xiaomi/camera/imagecodec/JpegEncoder$3;

    invoke-direct {v1, p0}, Lcom/xiaomi/camera/imagecodec/JpegEncoder$3;-><init>(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)V

    iget-object v2, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCameraOperationHandler:Landroid/os/Handler;

    .line 467
    invoke-virtual {p2, v0, p1, v1, v2}, Landroid/hardware/camera2/CameraDevice;->createReprocessableCaptureSession(Landroid/hardware/camera2/params/InputConfiguration;Ljava/util/List;Landroid/hardware/camera2/CameraCaptureSession$StateCallback;Landroid/os/Handler;)V
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 512
    goto :goto_0

    .line 510
    :catch_0
    move-exception p1

    .line 511
    invoke-virtual {p1}, Landroid/hardware/camera2/CameraAccessException;->printStackTrace()V

    .line 513
    :goto_0
    sget-object p1, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    const-string p2, "createReprocessSession<<"

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 514
    return-void
.end method

.method private static getJpegData(Landroid/media/Image;)[B
    .locals 1

    .line 565
    invoke-virtual {p0}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object p0

    .line 566
    array-length v0, p0

    if-lez v0, :cond_0

    .line 567
    const/4 v0, 0x0

    aget-object p0, p0, v0

    invoke-virtual {p0}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object p0

    .line 568
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    new-array v0, v0, [B

    .line 569
    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 570
    return-object v0

    .line 572
    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method private static getSessionId(Landroid/hardware/camera2/CameraCaptureSession;)I
    .locals 2

    .line 551
    if-eqz p0, :cond_0

    .line 553
    :try_start_0
    const-string v0, "android.hardware.camera2.impl.CameraCaptureSessionImpl"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 554
    const-string v1, "mId"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 555
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 556
    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result p0
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    .line 557
    :catch_0
    move-exception p0

    .line 558
    sget-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    const-string v1, "getSessionId: failed! "

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 561
    :cond_0
    const/4 p0, -0x1

    return p0
.end method

.method private initReprocessImageReader(II)V
    .locals 2
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    .line 518
    sget-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    const-string v1, "initReprocessImageReader>>"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 519
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mReprocessImageReader:Landroid/media/ImageReader;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mReprocessImageReader:Landroid/media/ImageReader;

    .line 520
    invoke-virtual {v0}, Landroid/media/ImageReader;->getWidth()I

    move-result v0

    if-ne v0, p1, :cond_0

    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mReprocessImageReader:Landroid/media/ImageReader;

    .line 521
    invoke-virtual {v0}, Landroid/media/ImageReader;->getHeight()I

    move-result v0

    if-eq v0, p2, :cond_1

    .line 522
    :cond_0
    sget-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    const-string v1, "closing obsolete reprocess reader"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 523
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mReprocessImageReader:Landroid/media/ImageReader;

    invoke-virtual {v0}, Landroid/media/ImageReader;->close()V

    .line 525
    :cond_1
    const/16 v0, 0x100

    const/4 v1, 0x2

    invoke-static {p1, p2, v0, v1}, Landroid/media/ImageReader;->newInstance(IIII)Landroid/media/ImageReader;

    move-result-object p1

    iput-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mReprocessImageReader:Landroid/media/ImageReader;

    .line 527
    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mReprocessImageReader:Landroid/media/ImageReader;

    new-instance p2, Lcom/xiaomi/camera/imagecodec/JpegEncoder$4;

    invoke-direct {p2, p0}, Lcom/xiaomi/camera/imagecodec/JpegEncoder$4;-><init>(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)V

    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCameraOperationHandler:Landroid/os/Handler;

    invoke-virtual {p1, p2, v0}, Landroid/media/ImageReader;->setOnImageAvailableListener(Landroid/media/ImageReader$OnImageAvailableListener;Landroid/os/Handler;)V

    .line 547
    sget-object p1, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    const-string p2, "initReprocessImageReader<<"

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 548
    return-void
.end method

.method public static instance()Lcom/xiaomi/camera/imagecodec/JpegEncoder;
    .locals 1
    .annotation build Landroid/support/annotation/AnyThread;
    .end annotation

    .line 93
    sget-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->sInstance:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

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

    .line 392
    sget-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "openVTCamera: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 394
    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCameraManager:Landroid/hardware/camera2/CameraManager;

    new-instance v1, Lcom/xiaomi/camera/imagecodec/JpegEncoder$2;

    invoke-direct {v1, p0}, Lcom/xiaomi/camera/imagecodec/JpegEncoder$2;-><init>(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)V

    iget-object v2, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCameraOperationHandler:Landroid/os/Handler;

    invoke-virtual {v0, p1, v1, v2}, Landroid/hardware/camera2/CameraManager;->openCamera(Ljava/lang/String;Landroid/hardware/camera2/CameraDevice$StateCallback;Landroid/os/Handler;)V
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 457
    goto :goto_0

    .line 455
    :catch_0
    move-exception p1

    .line 456
    sget-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    const-string v1, "openVTCamera: open camera failed! No permission Exception."

    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 458
    :goto_0
    return-void
.end method

.method private reprocessImage()V
    .locals 6
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    .line 332
    sget-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    const-string v1, "reprocessImage: reprocessImage start"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 334
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mDataLock:Ljava/lang/Object;

    monitor-enter v0

    .line 335
    :try_start_0
    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mTaskDataList:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->poll()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/xiaomi/camera/imagecodec/ReprocessData;

    iput-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCurrentProcessingData:Lcom/xiaomi/camera/imagecodec/ReprocessData;

    .line 336
    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCurrentProcessingData:Lcom/xiaomi/camera/imagecodec/ReprocessData;

    invoke-virtual {v1}, Lcom/xiaomi/camera/imagecodec/ReprocessData;->getTotalCaptureResult()Lcom/xiaomi/protocol/ICustomCaptureResult;

    move-result-object v1

    .line 337
    iget v2, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCurrentSessionId:I

    invoke-static {v1, v2}, Lcom/xiaomi/protocol/ICustomCaptureResult;->toTotalCaptureResult(Lcom/xiaomi/protocol/ICustomCaptureResult;I)Landroid/hardware/camera2/TotalCaptureResult;

    move-result-object v1

    .line 338
    if-nez v1, :cond_0

    .line 339
    sget-object v1, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    const-string v2, "reprocessImage: captureResult is NULL!"

    invoke-static {v1, v2}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 340
    monitor-exit v0

    return-void

    .line 342
    :cond_0
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

    .line 343
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 345
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mReprocessStartTime:J

    .line 346
    iget-object v2, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCameraLock:Ljava/lang/Object;

    monitor-enter v2

    .line 348
    :try_start_1
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mVTCameraDevice:Landroid/hardware/camera2/CameraDevice;

    .line 349
    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraDevice;->createReprocessCaptureRequest(Landroid/hardware/camera2/TotalCaptureResult;)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v0

    .line 350
    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mReprocessImageReader:Landroid/media/ImageReader;

    invoke-virtual {v1}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 353
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->JPEG_THUMBNAIL_SIZE:Landroid/hardware/camera2/CaptureRequest$Key;

    new-instance v3, Landroid/util/Size;

    const/16 v4, 0x140

    const/16 v5, 0xf0

    invoke-direct {v3, v4, v5}, Landroid/util/Size;-><init>(II)V

    invoke-virtual {v0, v1, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 354
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->JPEG_THUMBNAIL_QUALITY:Landroid/hardware/camera2/CaptureRequest$Key;

    const/16 v3, 0x64

    invoke-static {v3}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v4

    invoke-virtual {v0, v1, v4}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 355
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->JPEG_QUALITY:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {v3}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 356
    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mReprocessImageWriter:Landroid/media/ImageWriter;

    invoke-virtual {v1}, Landroid/media/ImageWriter;->dequeueInputImage()Landroid/media/Image;

    move-result-object v1

    .line 357
    iget-object v3, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCurrentProcessingData:Lcom/xiaomi/camera/imagecodec/ReprocessData;

    invoke-virtual {v3}, Lcom/xiaomi/camera/imagecodec/ReprocessData;->getYuvImage()Lcom/xiaomi/camera/imagecodec/MiImage;

    move-result-object v3

    .line 358
    invoke-virtual {v3, v1}, Lcom/xiaomi/camera/imagecodec/MiImage;->toImage(Landroid/media/Image;)V

    .line 359
    invoke-virtual {v3}, Lcom/xiaomi/camera/imagecodec/MiImage;->close()V

    .line 360
    iget-object v3, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mReprocessImageWriter:Landroid/media/ImageWriter;

    invoke-virtual {v3, v1}, Landroid/media/ImageWriter;->queueInputImage(Landroid/media/Image;)V

    .line 362
    new-instance v1, Lcom/xiaomi/camera/imagecodec/JpegEncoder$1;

    invoke-direct {v1, p0}, Lcom/xiaomi/camera/imagecodec/JpegEncoder$1;-><init>(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)V

    .line 381
    iget-object v3, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mVTCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    invoke-virtual {v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v0

    iget-object v4, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCameraOperationHandler:Landroid/os/Handler;

    invoke-virtual {v3, v0, v1, v4}, Landroid/hardware/camera2/CameraCaptureSession;->capture(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I
    :try_end_1
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 384
    goto :goto_0

    .line 385
    :catchall_0
    move-exception v0

    goto :goto_1

    .line 382
    :catch_0
    move-exception v0

    .line 383
    :try_start_2
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->printStackTrace()V

    .line 385
    :goto_0
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 386
    sget-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    const-string v1, "reprocessImage: reprocessImage end"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 387
    return-void

    .line 385
    :goto_1
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v0

    .line 343
    :catchall_1
    move-exception v1

    :try_start_4
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw v1
.end method

.method private sendReprocessRequest()V
    .locals 5
    .annotation build Landroid/support/annotation/AnyThread;
    .end annotation

    .line 205
    sget-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    const-string v1, "============================================================="

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 207
    iget-boolean v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mInitialized:Z

    if-nez v0, :cond_0

    .line 208
    sget-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    const-string v1, "sendReprocessRequest: JpegEncoder has not initialized! Ignore all request."

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 209
    return-void

    .line 211
    :cond_0
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCameraLock:Ljava/lang/Object;

    monitor-enter v0

    .line 212
    :try_start_0
    iget-boolean v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCreatingReprocessSession:Z

    if-eqz v1, :cond_1

    .line 213
    sget-object v1, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    const-string v2, "sendReprocessRequest: creating reprocess session..."

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 214
    monitor-exit v0

    return-void

    .line 216
    :cond_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 218
    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mDataLock:Ljava/lang/Object;

    monitor-enter v1

    .line 219
    :try_start_1
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mTaskDataList:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v0

    const/4 v2, 0x2

    if-eqz v0, :cond_2

    .line 220
    sget-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    const-string v3, "sendReprocessRequest: there is no tasks to process, try to close camera after 30s"

    invoke-static {v0, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 221
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mReprocessHandler:Landroid/os/Handler;

    const-wide/16 v3, 0x7530

    invoke-virtual {v0, v2, v3, v4}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 222
    monitor-exit v1

    return-void

    .line 224
    :cond_2
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mReprocessHandler:Landroid/os/Handler;

    invoke-virtual {v0, v2}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 225
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mReprocessHandler:Landroid/os/Handler;

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 228
    :cond_3
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 230
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mReprocessHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 231
    sget-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    const-string v1, "sendReprocessRequest: there is other task in message queue"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 233
    :cond_4
    sget-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    const-string v2, "sendReprocessRequest: send MSG_REPROCESS_IMG"

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 234
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mReprocessHandler:Landroid/os/Handler;

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 236
    :goto_0
    return-void

    .line 228
    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    .line 216
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

    .line 120
    sget-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    const-string v1, "deInit>>"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mDataLock:Ljava/lang/Object;

    monitor-enter v0

    .line 122
    :try_start_0
    iget-boolean v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mInitialized:Z

    if-nez v1, :cond_0

    .line 123
    monitor-exit v0

    return-void

    .line 125
    :cond_0
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mInitialized:Z

    .line 126
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCameraManager:Landroid/hardware/camera2/CameraManager;

    .line 127
    iput-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCurrentProcessingData:Lcom/xiaomi/camera/imagecodec/ReprocessData;

    .line 128
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 130
    iget-object v2, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCameraLock:Ljava/lang/Object;

    monitor-enter v2

    .line 132
    :try_start_1
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mVTCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    if-eqz v0, :cond_1

    .line 133
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mVTCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    invoke-virtual {v0}, Landroid/hardware/camera2/CameraCaptureSession;->close()V

    .line 134
    iput-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mVTCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    .line 135
    iput-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mReprocessImageReader:Landroid/media/ImageReader;

    .line 136
    iput-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mReprocessImageWriter:Landroid/media/ImageWriter;

    .line 138
    :cond_1
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mVTCameraDevice:Landroid/hardware/camera2/CameraDevice;

    if-eqz v0, :cond_2

    .line 139
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mVTCameraDevice:Landroid/hardware/camera2/CameraDevice;

    invoke-virtual {v0}, Landroid/hardware/camera2/CameraDevice;->close()V

    .line 140
    iput-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mVTCameraDevice:Landroid/hardware/camera2/CameraDevice;

    .line 142
    :cond_2
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 144
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCameraOperationThread:Landroid/os/HandlerThread;

    if-eqz v0, :cond_3

    .line 145
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCameraOperationThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quitSafely()Z

    .line 147
    :try_start_2
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCameraOperationThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->join()V

    .line 148
    iput-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCameraOperationThread:Landroid/os/HandlerThread;

    .line 149
    iput-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCameraOperationHandler:Landroid/os/Handler;
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0

    .line 152
    goto :goto_0

    .line 150
    :catch_0
    move-exception v0

    .line 151
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    .line 155
    :cond_3
    :goto_0
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mReprocessThread:Landroid/os/HandlerThread;

    if-eqz v0, :cond_4

    .line 156
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mReprocessThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quitSafely()Z

    .line 158
    :try_start_3
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mReprocessThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->join()V

    .line 159
    iput-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mReprocessThread:Landroid/os/HandlerThread;

    .line 160
    iput-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mReprocessHandler:Landroid/os/Handler;
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_1

    .line 163
    goto :goto_1

    .line 161
    :catch_1
    move-exception v0

    .line 162
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    .line 165
    :cond_4
    :goto_1
    sget-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    const-string v1, "deInit<<"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 166
    return-void

    .line 142
    :catchall_0
    move-exception v0

    :try_start_4
    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v0

    .line 128
    :catchall_1
    move-exception v1

    :try_start_5
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    throw v1
.end method

.method public doReprocess(Lcom/xiaomi/camera/imagecodec/ReprocessData;)V
    .locals 3
    .annotation build Landroid/support/annotation/AnyThread;
    .end annotation

    .line 183
    sget-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "doReprocess: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 185
    invoke-virtual {p1}, Lcom/xiaomi/camera/imagecodec/ReprocessData;->getResultListener()Lcom/xiaomi/camera/imagecodec/ReprocessData$OnJpegAvailableListener;

    move-result-object v0

    if-nez v0, :cond_0

    .line 186
    sget-object p1, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    const-string v0, "doReprocess: data\'s callback is null, we need not process this data!"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 187
    return-void

    .line 189
    :cond_0
    iget-boolean v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mInitialized:Z

    if-eqz v0, :cond_1

    .line 192
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mDataLock:Ljava/lang/Object;

    monitor-enter v0

    .line 193
    :try_start_0
    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mTaskDataList:Ljava/util/LinkedList;

    invoke-virtual {v1, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 194
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 195
    invoke-direct {p0}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->sendReprocessRequest()V

    .line 196
    return-void

    .line 194
    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    .line 190
    :cond_1
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "JpegEncoder has not been initialized, please call init() first!"

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public init(Landroid/content/Context;)V
    .locals 2
    .annotation build Landroid/support/annotation/AnyThread;
    .end annotation

    .line 102
    sget-object v0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    const-string v1, "init >>"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 103
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mDataLock:Ljava/lang/Object;

    monitor-enter v0

    .line 104
    :try_start_0
    iget-boolean v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mInitialized:Z

    if-nez v1, :cond_0

    .line 105
    const-string v1, "camera"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/hardware/camera2/CameraManager;

    iput-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCameraManager:Landroid/hardware/camera2/CameraManager;

    .line 106
    new-instance p1, Landroid/os/HandlerThread;

    const-string v1, "CameraOperationThread"

    invoke-direct {p1, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCameraOperationThread:Landroid/os/HandlerThread;

    .line 107
    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCameraOperationThread:Landroid/os/HandlerThread;

    invoke-virtual {p1}, Landroid/os/HandlerThread;->start()V

    .line 108
    new-instance p1, Landroid/os/Handler;

    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCameraOperationThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {p1, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mCameraOperationHandler:Landroid/os/Handler;

    .line 109
    new-instance p1, Landroid/os/HandlerThread;

    const-string v1, "JpegEncoderThread"

    invoke-direct {p1, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mReprocessThread:Landroid/os/HandlerThread;

    .line 110
    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mReprocessThread:Landroid/os/HandlerThread;

    invoke-virtual {p1}, Landroid/os/HandlerThread;->start()V

    .line 111
    new-instance p1, Lcom/xiaomi/camera/imagecodec/JpegEncoder$ReprocessHandler;

    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mReprocessThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {p1, p0, v1}, Lcom/xiaomi/camera/imagecodec/JpegEncoder$ReprocessHandler;-><init>(Lcom/xiaomi/camera/imagecodec/JpegEncoder;Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mReprocessHandler:Landroid/os/Handler;

    .line 112
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mInitialized:Z

    .line 114
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 115
    sget-object p1, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->TAG:Ljava/lang/String;

    const-string v0, "init <<"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 116
    return-void

    .line 114
    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
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

    .line 176
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

    .line 177
    iput-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mBackVtCameraId:Ljava/lang/String;

    .line 178
    iput-object p2, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->mFrontVtCameraId:Ljava/lang/String;

    .line 179
    return-void
.end method
