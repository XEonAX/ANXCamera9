.class public Lcom/xiaomi/camera/core/MultiFrameProcessor;
.super Ljava/lang/Object;
.source "MultiFrameProcessor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/camera/core/MultiFrameProcessor$WorkerHandler;,
        Lcom/xiaomi/camera/core/MultiFrameProcessor$MultiFrameProcessorHolder;
    }
.end annotation


# static fields
.field private static final REPROCESS_TIMEOUT_MS:I = 0x1f40

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final MSG_PROCESS_DATA:I

.field private mHandler:Landroid/os/Handler;

.field private final mObjLock:Ljava/lang/Object;

.field private mProcessResultListener:Lcom/xiaomi/camera/processor/ProcessResultListener;

.field private mReprocessStartTime:J

.field private mReprocessing:Z

.field private mWorkThread:Landroid/os/HandlerThread;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 31
    const-class v0, Lcom/xiaomi/camera/core/MultiFrameProcessor;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/xiaomi/camera/core/MultiFrameProcessor;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/camera/core/MultiFrameProcessor;->mObjLock:Ljava/lang/Object;

    .line 56
    new-instance v0, Lcom/xiaomi/camera/core/MultiFrameProcessor$1;

    invoke-direct {v0, p0}, Lcom/xiaomi/camera/core/MultiFrameProcessor$1;-><init>(Lcom/xiaomi/camera/core/MultiFrameProcessor;)V

    iput-object v0, p0, Lcom/xiaomi/camera/core/MultiFrameProcessor;->mProcessResultListener:Lcom/xiaomi/camera/processor/ProcessResultListener;

    .line 161
    const/4 v0, 0x1

    iput v0, p0, Lcom/xiaomi/camera/core/MultiFrameProcessor;->MSG_PROCESS_DATA:I

    .line 43
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "MultiFrameProcessorThread"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/xiaomi/camera/core/MultiFrameProcessor;->mWorkThread:Landroid/os/HandlerThread;

    .line 44
    iget-object v0, p0, Lcom/xiaomi/camera/core/MultiFrameProcessor;->mWorkThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 45
    new-instance v0, Lcom/xiaomi/camera/core/MultiFrameProcessor$WorkerHandler;

    iget-object v1, p0, Lcom/xiaomi/camera/core/MultiFrameProcessor;->mWorkThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/xiaomi/camera/core/MultiFrameProcessor$WorkerHandler;-><init>(Lcom/xiaomi/camera/core/MultiFrameProcessor;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/xiaomi/camera/core/MultiFrameProcessor;->mHandler:Landroid/os/Handler;

    .line 46
    return-void
.end method

.method synthetic constructor <init>(Lcom/xiaomi/camera/core/MultiFrameProcessor$1;)V
    .locals 0

    .line 30
    invoke-direct {p0}, Lcom/xiaomi/camera/core/MultiFrameProcessor;-><init>()V

    return-void
.end method

.method static synthetic access$100()Ljava/lang/String;
    .locals 1

    .line 30
    sget-object v0, Lcom/xiaomi/camera/core/MultiFrameProcessor;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lcom/xiaomi/camera/core/MultiFrameProcessor;Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;)V
    .locals 0

    .line 30
    invoke-direct {p0, p1}, Lcom/xiaomi/camera/core/MultiFrameProcessor;->reprocessImage(Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;)V

    return-void
.end method

.method static synthetic access$300(Lcom/xiaomi/camera/core/MultiFrameProcessor;)Ljava/lang/Object;
    .locals 0

    .line 30
    iget-object p0, p0, Lcom/xiaomi/camera/core/MultiFrameProcessor;->mObjLock:Ljava/lang/Object;

    return-object p0
.end method

.method static synthetic access$402(Lcom/xiaomi/camera/core/MultiFrameProcessor;Z)Z
    .locals 0

    .line 30
    iput-boolean p1, p0, Lcom/xiaomi/camera/core/MultiFrameProcessor;->mReprocessing:Z

    return p1
.end method

.method static synthetic access$500(Lcom/xiaomi/camera/core/MultiFrameProcessor;)J
    .locals 2

    .line 30
    iget-wide v0, p0, Lcom/xiaomi/camera/core/MultiFrameProcessor;->mReprocessStartTime:J

    return-wide v0
.end method

.method static synthetic access$600(Lcom/xiaomi/camera/core/MultiFrameProcessor;Lcom/xiaomi/camera/core/CaptureData;)V
    .locals 0

    .line 30
    invoke-direct {p0, p1}, Lcom/xiaomi/camera/core/MultiFrameProcessor;->doProcess(Lcom/xiaomi/camera/core/CaptureData;)V

    return-void
.end method

.method private doProcess(Lcom/xiaomi/camera/core/CaptureData;)V
    .locals 4

    .line 100
    sget-object v0, Lcom/xiaomi/camera/core/MultiFrameProcessor;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "doProcess: start process task: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/xiaomi/camera/core/CaptureData;->getCaptureTimestamp()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 101
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/CaptureData;->getAlgoType()I

    move-result v0

    .line 102
    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 103
    new-instance v0, Lcom/xiaomi/camera/processor/ClearShotProcessor;

    invoke-direct {v0}, Lcom/xiaomi/camera/processor/ClearShotProcessor;-><init>()V

    iget-object v1, p0, Lcom/xiaomi/camera/core/MultiFrameProcessor;->mProcessResultListener:Lcom/xiaomi/camera/processor/ProcessResultListener;

    invoke-virtual {v0, p1, v1}, Lcom/xiaomi/camera/processor/ClearShotProcessor;->doProcess(Lcom/xiaomi/camera/core/CaptureData;Lcom/xiaomi/camera/processor/ProcessResultListener;)V

    goto :goto_0

    .line 104
    :cond_0
    const/4 v1, 0x5

    if-ne v0, v1, :cond_1

    .line 105
    new-instance v0, Lcom/xiaomi/camera/processor/GroupShotProcessor;

    invoke-direct {v0}, Lcom/xiaomi/camera/processor/GroupShotProcessor;-><init>()V

    iget-object v1, p0, Lcom/xiaomi/camera/core/MultiFrameProcessor;->mProcessResultListener:Lcom/xiaomi/camera/processor/ProcessResultListener;

    invoke-virtual {v0, p1, v1}, Lcom/xiaomi/camera/processor/GroupShotProcessor;->doProcess(Lcom/xiaomi/camera/core/CaptureData;Lcom/xiaomi/camera/processor/ProcessResultListener;)V

    .line 109
    :goto_0
    return-void

    .line 107
    :cond_1
    new-instance p1, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unknown multi-frame process algorithm type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static getInstance()Lcom/xiaomi/camera/core/MultiFrameProcessor;
    .locals 1

    .line 53
    sget-object v0, Lcom/xiaomi/camera/core/MultiFrameProcessor$MultiFrameProcessorHolder;->INSTANCE:Lcom/xiaomi/camera/core/MultiFrameProcessor;

    return-object v0
.end method

.method private reprocessImage(Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;)V
    .locals 13

    .line 115
    new-instance v8, Lcom/xiaomi/camera/core/MultiFrameProcessor$2;

    invoke-direct {v8, p0, p1}, Lcom/xiaomi/camera/core/MultiFrameProcessor$2;-><init>(Lcom/xiaomi/camera/core/MultiFrameProcessor;Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;)V

    .line 133
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->getMainImage()Landroid/media/Image;

    move-result-object v1

    .line 134
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->getResult()Lcom/xiaomi/protocol/ICustomCaptureResult;

    move-result-object v2

    invoke-virtual {v2}, Lcom/xiaomi/protocol/ICustomCaptureResult;->getTimeStamp()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v9, 0x0

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 136
    nop

    .line 137
    invoke-virtual {v1}, Landroid/media/Image;->getWidth()I

    move-result v5

    .line 138
    invoke-virtual {v1}, Landroid/media/Image;->getHeight()I

    move-result v6

    .line 139
    sget-object v0, Lcom/xiaomi/camera/core/MultiFrameProcessor;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "reprocessImage: timestamp = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Landroid/media/Image;->getTimestamp()J

    move-result-wide v10

    invoke-virtual {v3, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 141
    iget-object v10, p0, Lcom/xiaomi/camera/core/MultiFrameProcessor;->mObjLock:Ljava/lang/Object;

    monitor-enter v10

    .line 142
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iput-wide v3, p0, Lcom/xiaomi/camera/core/MultiFrameProcessor;->mReprocessStartTime:J

    .line 143
    const/4 v11, 0x1

    iput-boolean v11, p0, Lcom/xiaomi/camera/core/MultiFrameProcessor;->mReprocessing:Z

    .line 144
    new-instance v12, Lcom/xiaomi/camera/imagecodec/ReprocessData;

    invoke-virtual {p1}, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->getResult()Lcom/xiaomi/protocol/ICustomCaptureResult;

    move-result-object v3

    const/16 v7, 0x23

    const/4 v4, 0x1

    move-object v0, v12

    invoke-direct/range {v0 .. v8}, Lcom/xiaomi/camera/imagecodec/ReprocessData;-><init>(Landroid/media/Image;Ljava/lang/String;Lcom/xiaomi/protocol/ICustomCaptureResult;ZIIILcom/xiaomi/camera/imagecodec/ReprocessData$OnDataAvailableListener;)V

    .line 147
    invoke-virtual {v12, v11}, Lcom/xiaomi/camera/imagecodec/ReprocessData;->setImageFromPool(Z)V

    .line 148
    invoke-static {}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->instance()Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    move-result-object p1

    invoke-virtual {p1, v12}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->doReprocess(Lcom/xiaomi/camera/imagecodec/ReprocessData;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 151
    :goto_0
    :try_start_1
    iget-boolean p1, p0, Lcom/xiaomi/camera/core/MultiFrameProcessor;->mReprocessing:Z

    if-eqz p1, :cond_0

    .line 152
    iget-object p1, p0, Lcom/xiaomi/camera/core/MultiFrameProcessor;->mObjLock:Ljava/lang/Object;

    const-wide/16 v0, 0x1f40

    invoke-virtual {p1, v0, v1}, Ljava/lang/Object;->wait(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 157
    :cond_0
    goto :goto_1

    .line 154
    :catch_0
    move-exception p1

    .line 155
    :try_start_2
    iput-boolean v9, p0, Lcom/xiaomi/camera/core/MultiFrameProcessor;->mReprocessing:Z

    .line 156
    sget-object v0, Lcom/xiaomi/camera/core/MultiFrameProcessor;->TAG:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 158
    :goto_1
    monitor-exit v10

    .line 159
    return-void

    .line 158
    :catchall_0
    move-exception p1

    monitor-exit v10
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method


# virtual methods
.method public processData(Lcom/xiaomi/camera/core/CaptureData;)V
    .locals 4

    .line 85
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/CaptureData;->getBurstNum()I

    move-result v0

    invoke-virtual {p1}, Lcom/xiaomi/camera/core/CaptureData;->getCaptureDataBeanList()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ne v0, v1, :cond_1

    .line 90
    iget-object v0, p0, Lcom/xiaomi/camera/core/MultiFrameProcessor;->mWorkThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/camera/core/MultiFrameProcessor;->mHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    .line 91
    sget-object v0, Lcom/xiaomi/camera/core/MultiFrameProcessor;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "processData: queue task: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/xiaomi/camera/core/CaptureData;->getCaptureTimestamp()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 92
    iget-object v0, p0, Lcom/xiaomi/camera/core/MultiFrameProcessor;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    goto :goto_0

    .line 94
    :cond_0
    sget-object v0, Lcom/xiaomi/camera/core/MultiFrameProcessor;->TAG:Ljava/lang/String;

    const-string v1, "processData: sync mode"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    invoke-direct {p0, p1}, Lcom/xiaomi/camera/core/MultiFrameProcessor;->doProcess(Lcom/xiaomi/camera/core/CaptureData;)V

    .line 97
    :goto_0
    return-void

    .line 86
    :cond_1
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Loss some capture data, burstNum is: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/xiaomi/camera/core/CaptureData;->getBurstNum()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "; but data bean list size is: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/CaptureData;->getCaptureDataBeanList()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
