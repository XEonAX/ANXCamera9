.class public Lcom/xiaomi/camera/core/SingleCameraProcessor;
.super Lcom/xiaomi/camera/core/ImageProcessor;
.source "SingleCameraProcessor.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mImageQueue:Ljava/util/concurrent/LinkedBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/LinkedBlockingQueue<",
            "Landroid/media/Image;",
            ">;"
        }
    .end annotation
.end field

.field private mIsCaptureResultReady:Z

.field private mIsImageReady:Z

.field private mResultQueue:Ljava/util/concurrent/LinkedBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/LinkedBlockingQueue<",
            "Lcom/xiaomi/protocol/ICustomCaptureResult;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 29
    const-class v0, Lcom/xiaomi/camera/core/SingleCameraProcessor;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/xiaomi/camera/core/SingleCameraProcessor;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/xiaomi/camera/core/ImageProcessor$ImageProcessorStatusCallback;)V
    .locals 1

    .line 41
    invoke-direct {p0, p1}, Lcom/xiaomi/camera/core/ImageProcessor;-><init>(Lcom/xiaomi/camera/core/ImageProcessor$ImageProcessorStatusCallback;)V

    .line 31
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/xiaomi/camera/core/SingleCameraProcessor;->mIsImageReady:Z

    .line 32
    iput-boolean p1, p0, Lcom/xiaomi/camera/core/SingleCameraProcessor;->mIsCaptureResultReady:Z

    .line 42
    new-instance p1, Ljava/util/concurrent/LinkedBlockingQueue;

    const/16 v0, 0xa

    invoke-direct {p1, v0}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>(I)V

    iput-object p1, p0, Lcom/xiaomi/camera/core/SingleCameraProcessor;->mResultQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 43
    new-instance p1, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {p1, v0}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>(I)V

    iput-object p1, p0, Lcom/xiaomi/camera/core/SingleCameraProcessor;->mImageQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 44
    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .line 28
    sget-object v0, Lcom/xiaomi/camera/core/SingleCameraProcessor;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method private processCaptureResult(Lcom/xiaomi/protocol/ICustomCaptureResult;Landroid/media/Image;)V
    .locals 7

    .line 137
    new-instance v6, Lcom/xiaomi/engine/FrameData;

    .line 138
    invoke-virtual {p1}, Lcom/xiaomi/protocol/ICustomCaptureResult;->getFrameNumber()J

    move-result-wide v2

    invoke-virtual {p1}, Lcom/xiaomi/protocol/ICustomCaptureResult;->getResults()Landroid/os/Parcelable;

    move-result-object v4

    const/4 v1, 0x0

    move-object v0, v6

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/xiaomi/engine/FrameData;-><init>(IJLandroid/os/Parcelable;Landroid/media/Image;)V

    .line 139
    new-instance p1, Lcom/xiaomi/camera/core/SingleCameraProcessor$2;

    invoke-direct {p1, p0}, Lcom/xiaomi/camera/core/SingleCameraProcessor$2;-><init>(Lcom/xiaomi/camera/core/SingleCameraProcessor;)V

    invoke-virtual {v6, p1}, Lcom/xiaomi/engine/FrameData;->setFrameCallback(Lcom/xiaomi/engine/FrameData$FrameStatusCallback;)V

    .line 150
    iget-object p1, p0, Lcom/xiaomi/camera/core/SingleCameraProcessor;->mTaskSession:Lcom/xiaomi/engine/TaskSession;

    new-instance p2, Lcom/xiaomi/camera/core/SingleCameraProcessor$3;

    invoke-direct {p2, p0}, Lcom/xiaomi/camera/core/SingleCameraProcessor$3;-><init>(Lcom/xiaomi/camera/core/SingleCameraProcessor;)V

    invoke-virtual {p1, v6, p2}, Lcom/xiaomi/engine/TaskSession;->processFrame(Lcom/xiaomi/engine/FrameData;Lcom/xiaomi/engine/TaskSession$FrameCallback;)V

    .line 157
    return-void
.end method


# virtual methods
.method public configOutputConfigurations(Lcom/xiaomi/engine/BufferFormat;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/xiaomi/engine/BufferFormat;",
            ")",
            "Ljava/util/List<",
            "Landroid/hardware/camera2/params/OutputConfiguration;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 74
    const/4 p1, 0x0

    return-object p1
.end method

.method public configOutputSurfaces(Lcom/xiaomi/engine/BufferFormat;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/xiaomi/engine/BufferFormat;",
            ")",
            "Ljava/util/List<",
            "Landroid/view/Surface;",
            ">;"
        }
    .end annotation

    .line 79
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 80
    invoke-virtual {p1}, Lcom/xiaomi/engine/BufferFormat;->getBufferWidth()I

    move-result v1

    .line 81
    invoke-virtual {p1}, Lcom/xiaomi/engine/BufferFormat;->getBufferHeight()I

    move-result v2

    invoke-virtual {p1}, Lcom/xiaomi/engine/BufferFormat;->getBufferFormat()I

    move-result p1

    iget v3, p0, Lcom/xiaomi/camera/core/SingleCameraProcessor;->mImageBufferQueueSize:I

    .line 80
    invoke-static {v1, v2, p1, v3}, Landroid/media/ImageReader;->newInstance(IIII)Landroid/media/ImageReader;

    move-result-object p1

    .line 82
    new-instance v1, Lcom/xiaomi/camera/core/SingleCameraProcessor$1;

    invoke-direct {v1, p0, p1}, Lcom/xiaomi/camera/core/SingleCameraProcessor$1;-><init>(Lcom/xiaomi/camera/core/SingleCameraProcessor;Landroid/media/ImageReader;)V

    .line 91
    invoke-virtual {p0}, Lcom/xiaomi/camera/core/SingleCameraProcessor;->getHandler()Landroid/os/Handler;

    move-result-object v2

    .line 82
    invoke-virtual {p1, v1, v2}, Landroid/media/ImageReader;->setOnImageAvailableListener(Landroid/media/ImageReader$OnImageAvailableListener;Landroid/os/Handler;)V

    .line 92
    iget-object v1, p0, Lcom/xiaomi/camera/core/SingleCameraProcessor;->mImageReaderList:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 93
    invoke-virtual {p1}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 94
    return-object v0
.end method

.method onCaptureReceived(Lcom/xiaomi/protocol/ICustomCaptureResult;I)V
    .locals 1
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    .line 63
    :try_start_0
    iget-object p2, p0, Lcom/xiaomi/camera/core/SingleCameraProcessor;->mResultQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-virtual {p2, p1}, Ljava/util/concurrent/LinkedBlockingQueue;->put(Ljava/lang/Object;)V

    .line 64
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/xiaomi/camera/core/SingleCameraProcessor;->mIsCaptureResultReady:Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 67
    goto :goto_0

    .line 65
    :catch_0
    move-exception p1

    .line 66
    sget-object p2, Lcom/xiaomi/camera/core/SingleCameraProcessor;->TAG:Ljava/lang/String;

    const-string v0, "onCaptureReceived: failed!"

    invoke-static {p2, v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 68
    :goto_0
    invoke-virtual {p0}, Lcom/xiaomi/camera/core/SingleCameraProcessor;->processImage()V

    .line 69
    return-void
.end method

.method onImageReceived(Landroid/media/Image;I)V
    .locals 1
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    .line 49
    sget-object p2, Lcom/xiaomi/camera/core/SingleCameraProcessor;->TAG:Ljava/lang/String;

    const-string v0, "putWideCameraImage: received a wide image"

    invoke-static {p2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    :try_start_0
    iget-object p2, p0, Lcom/xiaomi/camera/core/SingleCameraProcessor;->mImageQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-virtual {p2, p1}, Ljava/util/concurrent/LinkedBlockingQueue;->put(Ljava/lang/Object;)V

    .line 52
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/xiaomi/camera/core/SingleCameraProcessor;->mIsImageReady:Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 55
    goto :goto_0

    .line 53
    :catch_0
    move-exception p1

    .line 54
    sget-object p2, Lcom/xiaomi/camera/core/SingleCameraProcessor;->TAG:Ljava/lang/String;

    const-string v0, "onImageReceived: failed!"

    invoke-static {p2, v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 56
    :goto_0
    invoke-virtual {p0}, Lcom/xiaomi/camera/core/SingleCameraProcessor;->processImage()V

    .line 57
    return-void
.end method

.method processImage()V
    .locals 10
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    .line 100
    iget-boolean v0, p0, Lcom/xiaomi/camera/core/SingleCameraProcessor;->mIsImageReady:Z

    if-eqz v0, :cond_6

    iget-boolean v0, p0, Lcom/xiaomi/camera/core/SingleCameraProcessor;->mIsCaptureResultReady:Z

    if-nez v0, :cond_0

    goto/16 :goto_3

    .line 103
    :cond_0
    iget-object v0, p0, Lcom/xiaomi/camera/core/SingleCameraProcessor;->mResultQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/LinkedBlockingQueue;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/xiaomi/protocol/ICustomCaptureResult;

    .line 104
    iget-object v1, p0, Lcom/xiaomi/camera/core/SingleCameraProcessor;->mImageQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-virtual {v1}, Ljava/util/concurrent/LinkedBlockingQueue;->peek()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/media/Image;

    .line 107
    if-eqz v0, :cond_5

    if-nez v1, :cond_1

    goto :goto_2

    .line 110
    :cond_1
    invoke-virtual {v0}, Lcom/xiaomi/protocol/ICustomCaptureResult;->getTimeStamp()J

    move-result-wide v2

    .line 113
    :try_start_0
    invoke-virtual {v1}, Landroid/media/Image;->getTimestamp()J

    move-result-wide v4

    cmp-long v4, v4, v2

    const/4 v5, 0x0

    const-wide/16 v6, 0xbb8

    if-nez v4, :cond_2

    .line 114
    iget-object v2, p0, Lcom/xiaomi/camera/core/SingleCameraProcessor;->mResultQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MICROSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v2, v6, v7, v3}, Ljava/util/concurrent/LinkedBlockingQueue;->poll(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    .line 115
    iget-object v2, p0, Lcom/xiaomi/camera/core/SingleCameraProcessor;->mImageQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MICROSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v2, v6, v7, v3}, Ljava/util/concurrent/LinkedBlockingQueue;->poll(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    .line 116
    invoke-direct {p0, v0, v1}, Lcom/xiaomi/camera/core/SingleCameraProcessor;->processCaptureResult(Lcom/xiaomi/protocol/ICustomCaptureResult;Landroid/media/Image;)V

    .line 118
    iget-object v1, p0, Lcom/xiaomi/camera/core/SingleCameraProcessor;->mImageProcessorStatusCallback:Lcom/xiaomi/camera/core/ImageProcessor$ImageProcessorStatusCallback;

    invoke-virtual {v0}, Lcom/xiaomi/protocol/ICustomCaptureResult;->getTimeStamp()J

    move-result-wide v2

    invoke-interface {v1, v2, v3}, Lcom/xiaomi/camera/core/ImageProcessor$ImageProcessorStatusCallback;->onImageProcessStart(J)V

    .line 119
    iput-boolean v5, p0, Lcom/xiaomi/camera/core/SingleCameraProcessor;->mIsImageReady:Z

    .line 120
    iput-boolean v5, p0, Lcom/xiaomi/camera/core/SingleCameraProcessor;->mIsCaptureResultReady:Z

    goto :goto_0

    .line 121
    :cond_2
    invoke-virtual {v1}, Landroid/media/Image;->getTimestamp()J

    move-result-wide v8

    cmp-long v0, v8, v2

    if-gez v0, :cond_3

    .line 123
    iget-object v0, p0, Lcom/xiaomi/camera/core/SingleCameraProcessor;->mImageQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    sget-object v1, Ljava/util/concurrent/TimeUnit;->MICROSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v6, v7, v1}, Ljava/util/concurrent/LinkedBlockingQueue;->poll(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    .line 124
    iput-boolean v5, p0, Lcom/xiaomi/camera/core/SingleCameraProcessor;->mIsImageReady:Z

    goto :goto_0

    .line 125
    :cond_3
    invoke-virtual {v1}, Landroid/media/Image;->getTimestamp()J

    move-result-wide v0

    cmp-long v0, v0, v2

    if-lez v0, :cond_4

    .line 127
    iget-object v0, p0, Lcom/xiaomi/camera/core/SingleCameraProcessor;->mResultQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    sget-object v1, Ljava/util/concurrent/TimeUnit;->MICROSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v6, v7, v1}, Ljava/util/concurrent/LinkedBlockingQueue;->poll(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    .line 128
    iput-boolean v5, p0, Lcom/xiaomi/camera/core/SingleCameraProcessor;->mIsCaptureResultReady:Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 132
    :cond_4
    :goto_0
    goto :goto_1

    .line 130
    :catch_0
    move-exception v0

    .line 131
    sget-object v1, Lcom/xiaomi/camera/core/SingleCameraProcessor;->TAG:Ljava/lang/String;

    const-string v2, "onImageReceive: poll result time out!"

    invoke-virtual {v0}, Ljava/lang/InterruptedException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 134
    :goto_1
    return-void

    .line 108
    :cond_5
    :goto_2
    return-void

    .line 101
    :cond_6
    :goto_3
    return-void
.end method

.method public releaseResource()V
    .locals 0

    .line 163
    return-void
.end method
