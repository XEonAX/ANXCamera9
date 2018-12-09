.class public Lcom/xiaomi/camera/core/PortraitImageProcessor;
.super Lcom/xiaomi/camera/core/ImageProcessor;
.source "PortraitImageProcessor.java"


# static fields
.field public static final DEPTH_IMAGE_GROUP_ID:I = 0x3

.field public static final EFFECT_IMAGE_GROUP_ID:I = 0x1

.field public static final RAW_IMAGE_GROUP_ID:I = 0x2

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mCaptureResultQueue:Ljava/util/concurrent/LinkedBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/LinkedBlockingQueue<",
            "Lcom/xiaomi/protocol/ICustomCaptureResult;",
            ">;"
        }
    .end annotation
.end field

.field private mDepthImageReaderHolder:Landroid/media/ImageReader;

.field private mEffectImageReaderHolder:Landroid/media/ImageReader;

.field private mRawImageReaderHolder:Landroid/media/ImageReader;

.field private mTeleCaptureImageQueue:Ljava/util/concurrent/LinkedBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/LinkedBlockingQueue<",
            "Landroid/media/Image;",
            ">;"
        }
    .end annotation
.end field

.field private mWideCaptureImageQueue:Ljava/util/concurrent/LinkedBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/LinkedBlockingQueue<",
            "Landroid/media/Image;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 33
    const-class v0, Lcom/xiaomi/camera/core/PortraitImageProcessor;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/xiaomi/camera/core/PortraitImageProcessor;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/xiaomi/camera/core/ImageProcessor$ImageProcessorStatusCallback;)V
    .locals 1

    .line 63
    invoke-direct {p0, p1}, Lcom/xiaomi/camera/core/ImageProcessor;-><init>(Lcom/xiaomi/camera/core/ImageProcessor$ImageProcessorStatusCallback;)V

    .line 64
    new-instance p1, Ljava/util/concurrent/LinkedBlockingQueue;

    const/16 v0, 0xa

    invoke-direct {p1, v0}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>(I)V

    iput-object p1, p0, Lcom/xiaomi/camera/core/PortraitImageProcessor;->mCaptureResultQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 65
    new-instance p1, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {p1, v0}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>(I)V

    iput-object p1, p0, Lcom/xiaomi/camera/core/PortraitImageProcessor;->mWideCaptureImageQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 66
    new-instance p1, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {p1, v0}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>(I)V

    iput-object p1, p0, Lcom/xiaomi/camera/core/PortraitImageProcessor;->mTeleCaptureImageQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 67
    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .line 32
    sget-object v0, Lcom/xiaomi/camera/core/PortraitImageProcessor;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method private processCaptureResult(Lcom/xiaomi/protocol/ICustomCaptureResult;Landroid/media/Image;I)V
    .locals 7

    .line 152
    invoke-virtual {p1}, Lcom/xiaomi/protocol/ICustomCaptureResult;->getResults()Landroid/os/Parcelable;

    move-result-object v4

    .line 153
    sget-object v0, Lcom/xiaomi/camera/core/PortraitImageProcessor;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "processCaptureResult: cameraMetadataNative = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 154
    sget-object v0, Lcom/xiaomi/camera/core/PortraitImageProcessor;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "processCaptureResult: image = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 155
    new-instance v6, Lcom/xiaomi/engine/FrameData;

    invoke-virtual {p1}, Lcom/xiaomi/protocol/ICustomCaptureResult;->getFrameNumber()J

    move-result-wide v2

    move-object v0, v6

    move v1, p3

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/xiaomi/engine/FrameData;-><init>(IJLandroid/os/Parcelable;Landroid/media/Image;)V

    .line 156
    new-instance p1, Lcom/xiaomi/camera/core/PortraitImageProcessor$1;

    invoke-direct {p1, p0}, Lcom/xiaomi/camera/core/PortraitImageProcessor$1;-><init>(Lcom/xiaomi/camera/core/PortraitImageProcessor;)V

    invoke-virtual {v6, p1}, Lcom/xiaomi/engine/FrameData;->setFrameCallback(Lcom/xiaomi/engine/FrameData$FrameStatusCallback;)V

    .line 166
    iget-object p1, p0, Lcom/xiaomi/camera/core/PortraitImageProcessor;->mTaskSession:Lcom/xiaomi/engine/TaskSession;

    new-instance p2, Lcom/xiaomi/camera/core/PortraitImageProcessor$2;

    invoke-direct {p2, p0}, Lcom/xiaomi/camera/core/PortraitImageProcessor$2;-><init>(Lcom/xiaomi/camera/core/PortraitImageProcessor;)V

    invoke-virtual {p1, v6, p2}, Lcom/xiaomi/engine/TaskSession;->processFrame(Lcom/xiaomi/engine/FrameData;Lcom/xiaomi/engine/TaskSession$FrameCallback;)V

    .line 172
    return-void
.end method


# virtual methods
.method public configOutputConfigurations(Lcom/xiaomi/engine/BufferFormat;)Ljava/util/List;
    .locals 5
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

    .line 182
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 183
    invoke-virtual {p1}, Lcom/xiaomi/engine/BufferFormat;->getBufferWidth()I

    move-result v1

    .line 184
    invoke-virtual {p1}, Lcom/xiaomi/engine/BufferFormat;->getBufferHeight()I

    move-result v2

    invoke-virtual {p1}, Lcom/xiaomi/engine/BufferFormat;->getBufferFormat()I

    move-result v3

    iget v4, p0, Lcom/xiaomi/camera/core/PortraitImageProcessor;->mImageBufferQueueSize:I

    .line 183
    invoke-static {v1, v2, v3, v4}, Landroid/media/ImageReader;->newInstance(IIII)Landroid/media/ImageReader;

    move-result-object v1

    iput-object v1, p0, Lcom/xiaomi/camera/core/PortraitImageProcessor;->mEffectImageReaderHolder:Landroid/media/ImageReader;

    .line 185
    iget-object v1, p0, Lcom/xiaomi/camera/core/PortraitImageProcessor;->mEffectImageReaderHolder:Landroid/media/ImageReader;

    new-instance v2, Lcom/xiaomi/camera/core/PortraitImageProcessor$3;

    invoke-direct {v2, p0}, Lcom/xiaomi/camera/core/PortraitImageProcessor$3;-><init>(Lcom/xiaomi/camera/core/PortraitImageProcessor;)V

    .line 197
    invoke-virtual {p0}, Lcom/xiaomi/camera/core/PortraitImageProcessor;->getHandler()Landroid/os/Handler;

    move-result-object v3

    .line 185
    invoke-virtual {v1, v2, v3}, Landroid/media/ImageReader;->setOnImageAvailableListener(Landroid/media/ImageReader$OnImageAvailableListener;Landroid/os/Handler;)V

    .line 198
    new-instance v1, Landroid/hardware/camera2/params/OutputConfiguration;

    iget-object v2, p0, Lcom/xiaomi/camera/core/PortraitImageProcessor;->mEffectImageReaderHolder:Landroid/media/ImageReader;

    invoke-virtual {v2}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object v2

    const/4 v3, 0x1

    invoke-direct {v1, v3, v2}, Landroid/hardware/camera2/params/OutputConfiguration;-><init>(ILandroid/view/Surface;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 200
    invoke-virtual {p1}, Lcom/xiaomi/engine/BufferFormat;->getBufferWidth()I

    move-result v1

    .line 201
    invoke-virtual {p1}, Lcom/xiaomi/engine/BufferFormat;->getBufferHeight()I

    move-result v2

    invoke-virtual {p1}, Lcom/xiaomi/engine/BufferFormat;->getBufferFormat()I

    move-result v3

    iget v4, p0, Lcom/xiaomi/camera/core/PortraitImageProcessor;->mImageBufferQueueSize:I

    .line 200
    invoke-static {v1, v2, v3, v4}, Landroid/media/ImageReader;->newInstance(IIII)Landroid/media/ImageReader;

    move-result-object v1

    iput-object v1, p0, Lcom/xiaomi/camera/core/PortraitImageProcessor;->mRawImageReaderHolder:Landroid/media/ImageReader;

    .line 202
    iget-object v1, p0, Lcom/xiaomi/camera/core/PortraitImageProcessor;->mRawImageReaderHolder:Landroid/media/ImageReader;

    new-instance v2, Lcom/xiaomi/camera/core/PortraitImageProcessor$4;

    invoke-direct {v2, p0}, Lcom/xiaomi/camera/core/PortraitImageProcessor$4;-><init>(Lcom/xiaomi/camera/core/PortraitImageProcessor;)V

    .line 213
    invoke-virtual {p0}, Lcom/xiaomi/camera/core/PortraitImageProcessor;->getHandler()Landroid/os/Handler;

    move-result-object v3

    .line 202
    invoke-virtual {v1, v2, v3}, Landroid/media/ImageReader;->setOnImageAvailableListener(Landroid/media/ImageReader$OnImageAvailableListener;Landroid/os/Handler;)V

    .line 214
    new-instance v1, Landroid/hardware/camera2/params/OutputConfiguration;

    iget-object v2, p0, Lcom/xiaomi/camera/core/PortraitImageProcessor;->mRawImageReaderHolder:Landroid/media/ImageReader;

    invoke-virtual {v2}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object v2

    const/4 v3, 0x2

    invoke-direct {v1, v3, v2}, Landroid/hardware/camera2/params/OutputConfiguration;-><init>(ILandroid/view/Surface;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 217
    invoke-virtual {p1}, Lcom/xiaomi/engine/BufferFormat;->getBufferWidth()I

    move-result v1

    div-int/2addr v1, v3

    .line 218
    invoke-virtual {p1}, Lcom/xiaomi/engine/BufferFormat;->getBufferHeight()I

    move-result p1

    div-int/2addr p1, v3

    iget v2, p0, Lcom/xiaomi/camera/core/PortraitImageProcessor;->mImageBufferQueueSize:I

    .line 217
    const v3, 0x20363159

    invoke-static {v1, p1, v3, v2}, Landroid/media/ImageReader;->newInstance(IIII)Landroid/media/ImageReader;

    move-result-object p1

    iput-object p1, p0, Lcom/xiaomi/camera/core/PortraitImageProcessor;->mDepthImageReaderHolder:Landroid/media/ImageReader;

    .line 219
    iget-object p1, p0, Lcom/xiaomi/camera/core/PortraitImageProcessor;->mDepthImageReaderHolder:Landroid/media/ImageReader;

    new-instance v1, Lcom/xiaomi/camera/core/PortraitImageProcessor$5;

    invoke-direct {v1, p0}, Lcom/xiaomi/camera/core/PortraitImageProcessor$5;-><init>(Lcom/xiaomi/camera/core/PortraitImageProcessor;)V

    .line 230
    invoke-virtual {p0}, Lcom/xiaomi/camera/core/PortraitImageProcessor;->getHandler()Landroid/os/Handler;

    move-result-object v2

    .line 219
    invoke-virtual {p1, v1, v2}, Landroid/media/ImageReader;->setOnImageAvailableListener(Landroid/media/ImageReader$OnImageAvailableListener;Landroid/os/Handler;)V

    .line 231
    new-instance p1, Landroid/hardware/camera2/params/OutputConfiguration;

    iget-object v1, p0, Lcom/xiaomi/camera/core/PortraitImageProcessor;->mDepthImageReaderHolder:Landroid/media/ImageReader;

    invoke-virtual {v1}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object v1

    const/4 v2, 0x3

    invoke-direct {p1, v2, v1}, Landroid/hardware/camera2/params/OutputConfiguration;-><init>(ILandroid/view/Surface;)V

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 232
    return-object v0
.end method

.method public configOutputSurfaces(Lcom/xiaomi/engine/BufferFormat;)Ljava/util/List;
    .locals 1
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

    .line 237
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "This method is not supported in Portrait mode!"

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method onCaptureReceived(Lcom/xiaomi/protocol/ICustomCaptureResult;I)V
    .locals 3

    .line 89
    sget-object v0, Lcom/xiaomi/camera/core/PortraitImageProcessor;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onCaptureReceived: received a capture result "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, "-"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    :try_start_0
    iget-object p2, p0, Lcom/xiaomi/camera/core/PortraitImageProcessor;->mCaptureResultQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-virtual {p2, p1}, Ljava/util/concurrent/LinkedBlockingQueue;->put(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 94
    goto :goto_0

    .line 92
    :catch_0
    move-exception p1

    .line 93
    sget-object p2, Lcom/xiaomi/camera/core/PortraitImageProcessor;->TAG:Ljava/lang/String;

    const-string v0, "onCaptureReceived: failed!"

    invoke-static {p2, v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 95
    :goto_0
    invoke-virtual {p0}, Lcom/xiaomi/camera/core/PortraitImageProcessor;->processImage()V

    .line 96
    return-void
.end method

.method onImageReceived(Landroid/media/Image;I)V
    .locals 3

    .line 72
    sget-object v0, Lcom/xiaomi/camera/core/PortraitImageProcessor;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onImageReceived: received a image"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, "; target = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 74
    const/4 v0, 0x1

    if-ne p2, v0, :cond_0

    .line 75
    :try_start_0
    iget-object p2, p0, Lcom/xiaomi/camera/core/PortraitImageProcessor;->mWideCaptureImageQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-virtual {p2, p1}, Ljava/util/concurrent/LinkedBlockingQueue;->put(Ljava/lang/Object;)V

    goto :goto_0

    .line 81
    :catch_0
    move-exception p1

    goto :goto_1

    .line 76
    :cond_0
    if-nez p2, :cond_1

    .line 77
    iget-object p2, p0, Lcom/xiaomi/camera/core/PortraitImageProcessor;->mTeleCaptureImageQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-virtual {p2, p1}, Ljava/util/concurrent/LinkedBlockingQueue;->put(Ljava/lang/Object;)V

    goto :goto_0

    .line 79
    :cond_1
    sget-object p1, Lcom/xiaomi/camera/core/PortraitImageProcessor;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onImageReceived: unknown image target: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 83
    :goto_0
    goto :goto_2

    .line 81
    :goto_1
    nop

    .line 82
    sget-object p2, Lcom/xiaomi/camera/core/PortraitImageProcessor;->TAG:Ljava/lang/String;

    const-string v0, "onImageReceived: failed!"

    invoke-static {p2, v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 84
    :goto_2
    invoke-virtual {p0}, Lcom/xiaomi/camera/core/PortraitImageProcessor;->processImage()V

    .line 85
    return-void
.end method

.method processImage()V
    .locals 10

    .line 100
    iget-object v0, p0, Lcom/xiaomi/camera/core/PortraitImageProcessor;->mCaptureResultQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/LinkedBlockingQueue;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/xiaomi/camera/core/PortraitImageProcessor;->mWideCaptureImageQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/LinkedBlockingQueue;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/xiaomi/camera/core/PortraitImageProcessor;->mTeleCaptureImageQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/LinkedBlockingQueue;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_2

    .line 103
    :cond_0
    sget-object v0, Lcom/xiaomi/camera/core/PortraitImageProcessor;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "processImage: mCaptureResultQueue size: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/xiaomi/camera/core/PortraitImageProcessor;->mCaptureResultQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-virtual {v2}, Ljava/util/concurrent/LinkedBlockingQueue;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 104
    sget-object v0, Lcom/xiaomi/camera/core/PortraitImageProcessor;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "processImage: mWideCaptureImageQueue size: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/xiaomi/camera/core/PortraitImageProcessor;->mWideCaptureImageQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-virtual {v2}, Ljava/util/concurrent/LinkedBlockingQueue;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 105
    sget-object v0, Lcom/xiaomi/camera/core/PortraitImageProcessor;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "processImage: mTeleCaptureImageQueue size: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/xiaomi/camera/core/PortraitImageProcessor;->mTeleCaptureImageQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-virtual {v2}, Ljava/util/concurrent/LinkedBlockingQueue;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 107
    iget-object v0, p0, Lcom/xiaomi/camera/core/PortraitImageProcessor;->mCaptureResultQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/LinkedBlockingQueue;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/xiaomi/protocol/ICustomCaptureResult;

    .line 108
    iget-object v1, p0, Lcom/xiaomi/camera/core/PortraitImageProcessor;->mWideCaptureImageQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-virtual {v1}, Ljava/util/concurrent/LinkedBlockingQueue;->peek()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/media/Image;

    .line 109
    iget-object v2, p0, Lcom/xiaomi/camera/core/PortraitImageProcessor;->mTeleCaptureImageQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-virtual {v2}, Ljava/util/concurrent/LinkedBlockingQueue;->peek()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/media/Image;

    .line 111
    if-eqz v0, :cond_3

    if-eqz v1, :cond_3

    if-nez v2, :cond_1

    goto :goto_1

    .line 114
    :cond_1
    invoke-virtual {v0}, Lcom/xiaomi/protocol/ICustomCaptureResult;->getTimeStamp()J

    move-result-wide v3

    .line 126
    invoke-virtual {v1}, Landroid/media/Image;->getTimestamp()J

    move-result-wide v5

    .line 127
    invoke-virtual {v2}, Landroid/media/Image;->getTimestamp()J

    move-result-wide v7

    .line 130
    cmp-long v9, v3, v5

    if-nez v9, :cond_2

    cmp-long v9, v3, v7

    if-nez v9, :cond_2

    .line 132
    :try_start_0
    iget-object v3, p0, Lcom/xiaomi/camera/core/PortraitImageProcessor;->mImageProcessorStatusCallback:Lcom/xiaomi/camera/core/ImageProcessor$ImageProcessorStatusCallback;

    invoke-virtual {v0}, Lcom/xiaomi/protocol/ICustomCaptureResult;->getTimeStamp()J

    move-result-wide v4

    invoke-interface {v3, v4, v5}, Lcom/xiaomi/camera/core/ImageProcessor$ImageProcessorStatusCallback;->onImageProcessStart(J)V

    .line 133
    iget-object v3, p0, Lcom/xiaomi/camera/core/PortraitImageProcessor;->mCaptureResultQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MICROSECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v5, 0xbb8

    invoke-virtual {v3, v5, v6, v4}, Ljava/util/concurrent/LinkedBlockingQueue;->poll(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    .line 134
    iget-object v3, p0, Lcom/xiaomi/camera/core/PortraitImageProcessor;->mWideCaptureImageQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MICROSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v3, v5, v6, v4}, Ljava/util/concurrent/LinkedBlockingQueue;->poll(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    .line 135
    iget-object v3, p0, Lcom/xiaomi/camera/core/PortraitImageProcessor;->mTeleCaptureImageQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MICROSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v3, v5, v6, v4}, Ljava/util/concurrent/LinkedBlockingQueue;->poll(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    .line 136
    const-string v3, "[ORIGINAL]"

    const/4 v4, 0x0

    invoke-static {v3, v4}, Lcom/xiaomi/camera/base/PerformanceTracker;->trackAlgorithmProcess(Ljava/lang/String;I)V

    .line 137
    const/4 v3, 0x1

    invoke-direct {p0, v0, v1, v3}, Lcom/xiaomi/camera/core/PortraitImageProcessor;->processCaptureResult(Lcom/xiaomi/protocol/ICustomCaptureResult;Landroid/media/Image;I)V

    .line 138
    invoke-direct {p0, v0, v2, v4}, Lcom/xiaomi/camera/core/PortraitImageProcessor;->processCaptureResult(Lcom/xiaomi/protocol/ICustomCaptureResult;Landroid/media/Image;I)V

    .line 148
    goto :goto_0

    .line 140
    :cond_2
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "TimeStamp is not matched: captureResult="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v2, ";wideImage="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v2, ";teleImage="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 145
    :catch_0
    move-exception v0

    .line 147
    sget-object v1, Lcom/xiaomi/camera/core/PortraitImageProcessor;->TAG:Ljava/lang/String;

    const-string v2, "onImageReceive: poll result time out!"

    invoke-virtual {v0}, Ljava/lang/InterruptedException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 149
    :goto_0
    return-void

    .line 112
    :cond_3
    :goto_1
    return-void

    .line 101
    :cond_4
    :goto_2
    return-void
.end method

.method public releaseResource()V
    .locals 2

    .line 244
    iget-object v0, p0, Lcom/xiaomi/camera/core/PortraitImageProcessor;->mEffectImageReaderHolder:Landroid/media/ImageReader;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 245
    iget-object v0, p0, Lcom/xiaomi/camera/core/PortraitImageProcessor;->mEffectImageReaderHolder:Landroid/media/ImageReader;

    invoke-virtual {v0}, Landroid/media/ImageReader;->close()V

    .line 246
    iput-object v1, p0, Lcom/xiaomi/camera/core/PortraitImageProcessor;->mEffectImageReaderHolder:Landroid/media/ImageReader;

    .line 249
    :cond_0
    iget-object v0, p0, Lcom/xiaomi/camera/core/PortraitImageProcessor;->mRawImageReaderHolder:Landroid/media/ImageReader;

    if-eqz v0, :cond_1

    .line 250
    iget-object v0, p0, Lcom/xiaomi/camera/core/PortraitImageProcessor;->mRawImageReaderHolder:Landroid/media/ImageReader;

    invoke-virtual {v0}, Landroid/media/ImageReader;->close()V

    .line 251
    iput-object v1, p0, Lcom/xiaomi/camera/core/PortraitImageProcessor;->mRawImageReaderHolder:Landroid/media/ImageReader;

    .line 254
    :cond_1
    iget-object v0, p0, Lcom/xiaomi/camera/core/PortraitImageProcessor;->mDepthImageReaderHolder:Landroid/media/ImageReader;

    if-eqz v0, :cond_2

    .line 255
    iget-object v0, p0, Lcom/xiaomi/camera/core/PortraitImageProcessor;->mDepthImageReaderHolder:Landroid/media/ImageReader;

    invoke-virtual {v0}, Landroid/media/ImageReader;->close()V

    .line 256
    iput-object v1, p0, Lcom/xiaomi/camera/core/PortraitImageProcessor;->mDepthImageReaderHolder:Landroid/media/ImageReader;

    .line 258
    :cond_2
    return-void
.end method
