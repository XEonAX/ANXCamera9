.class public Lcom/xiaomi/camera/core/ParallelDataZipper;
.super Ljava/lang/Object;
.source "ParallelDataZipper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/camera/core/ParallelDataZipper$DataListener;,
        Lcom/xiaomi/camera/core/ParallelDataZipper$InstanceHolder;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mAlgoType:I

.field private mBurstNum:I

.field private final mCaptureDataArray:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/xiaomi/camera/core/CaptureData;",
            ">;"
        }
    .end annotation
.end field

.field private mCaptureDataBeanArray:Landroid/util/LongSparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LongSparseArray<",
            "Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;",
            ">;"
        }
    .end annotation
.end field

.field private mDataListener:Lcom/xiaomi/camera/core/ParallelDataZipper$DataListener;

.field private mHandler:Landroid/os/Handler;

.field private mStreamNum:I

.field private mWorkThread:Landroid/os/HandlerThread;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 29
    const-class v0, Lcom/xiaomi/camera/core/ParallelDataZipper;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/xiaomi/camera/core/ParallelDataZipper;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    const/4 v0, 0x0

    iput v0, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mAlgoType:I

    .line 32
    const/4 v0, 0x1

    iput v0, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mStreamNum:I

    .line 33
    iput v0, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mBurstNum:I

    .line 42
    new-instance v0, Landroid/util/LongSparseArray;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Landroid/util/LongSparseArray;-><init>(I)V

    iput-object v0, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mCaptureDataBeanArray:Landroid/util/LongSparseArray;

    .line 47
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0, v1}, Landroid/util/SparseArray;-><init>(I)V

    iput-object v0, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mCaptureDataArray:Landroid/util/SparseArray;

    .line 50
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "ParallelDataZipperThread"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mWorkThread:Landroid/os/HandlerThread;

    .line 51
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mWorkThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 52
    new-instance v0, Landroid/os/Handler;

    iget-object v1, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mWorkThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mHandler:Landroid/os/Handler;

    .line 53
    return-void
.end method

.method synthetic constructor <init>(Lcom/xiaomi/camera/core/ParallelDataZipper$1;)V
    .locals 0

    .line 28
    invoke-direct {p0}, Lcom/xiaomi/camera/core/ParallelDataZipper;-><init>()V

    return-void
.end method

.method static synthetic access$100(Lcom/xiaomi/camera/core/ParallelDataZipper;)Landroid/util/LongSparseArray;
    .locals 0

    .line 28
    iget-object p0, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mCaptureDataBeanArray:Landroid/util/LongSparseArray;

    return-object p0
.end method

.method static synthetic access$200(Lcom/xiaomi/camera/core/ParallelDataZipper;)I
    .locals 0

    .line 28
    iget p0, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mStreamNum:I

    return p0
.end method

.method static synthetic access$300(Lcom/xiaomi/camera/core/ParallelDataZipper;Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;)V
    .locals 0

    .line 28
    invoke-direct {p0, p1}, Lcom/xiaomi/camera/core/ParallelDataZipper;->tryToCallback(Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;)V

    return-void
.end method

.method public static getInstance()Lcom/xiaomi/camera/core/ParallelDataZipper;
    .locals 1

    .line 60
    sget-object v0, Lcom/xiaomi/camera/core/ParallelDataZipper$InstanceHolder;->INSTANCE:Lcom/xiaomi/camera/core/ParallelDataZipper;

    return-object v0
.end method

.method private tryToCallback(Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;)V
    .locals 8

    .line 123
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->getResult()Lcom/xiaomi/protocol/ICustomCaptureResult;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/protocol/ICustomCaptureResult;->getSequenceId()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 124
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->getResult()Lcom/xiaomi/protocol/ICustomCaptureResult;

    move-result-object v1

    invoke-virtual {v1}, Lcom/xiaomi/protocol/ICustomCaptureResult;->getTimeStamp()J

    move-result-wide v6

    .line 125
    iget-object v1, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mCaptureDataArray:Landroid/util/SparseArray;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/xiaomi/camera/core/CaptureData;

    .line 126
    if-nez v1, :cond_1

    .line 127
    iget-object v1, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mCaptureDataArray:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    move-result v1

    if-eqz v1, :cond_0

    .line 128
    sget-object v1, Lcom/xiaomi/camera/core/ParallelDataZipper;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "tryToCallback: captureDataNum = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mCaptureDataArray:Landroid/util/SparseArray;

    invoke-virtual {v3}, Landroid/util/SparseArray;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 130
    :cond_0
    new-instance v1, Lcom/xiaomi/camera/core/CaptureData;

    iget v3, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mAlgoType:I

    iget v4, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mStreamNum:I

    iget v5, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mBurstNum:I

    move-object v2, v1

    invoke-direct/range {v2 .. v7}, Lcom/xiaomi/camera/core/CaptureData;-><init>(IIIJ)V

    .line 131
    iget-object v2, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mCaptureDataArray:Landroid/util/SparseArray;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v2, v3, v1}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    .line 133
    :cond_1
    invoke-virtual {v1, p1}, Lcom/xiaomi/camera/core/CaptureData;->putCaptureDataBean(Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;)V

    .line 134
    invoke-virtual {v1}, Lcom/xiaomi/camera/core/CaptureData;->isDataReady()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 135
    iget-object p1, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mDataListener:Lcom/xiaomi/camera/core/ParallelDataZipper$DataListener;

    invoke-interface {p1, v1}, Lcom/xiaomi/camera/core/ParallelDataZipper$DataListener;->onParallelDataAvailable(Lcom/xiaomi/camera/core/CaptureData;)V

    .line 136
    iget-object p1, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mCaptureDataArray:Landroid/util/SparseArray;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/util/SparseArray;->remove(I)V

    .line 138
    :cond_2
    return-void
.end method


# virtual methods
.method public declared-synchronized join(Landroid/media/Image;I)V
    .locals 2

    monitor-enter p0

    .line 100
    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mWorkThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    .line 101
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/xiaomi/camera/core/ParallelDataZipper$2;

    invoke-direct {v1, p0, p1, p2}, Lcom/xiaomi/camera/core/ParallelDataZipper$2;-><init>(Lcom/xiaomi/camera/core/ParallelDataZipper;Landroid/media/Image;I)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 120
    monitor-exit p0

    return-void

    .line 118
    :cond_0
    :try_start_1
    new-instance p1, Ljava/lang/RuntimeException;

    const-string p2, "Thread already die!"

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 99
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized join(Lcom/xiaomi/protocol/ICustomCaptureResult;Z)V
    .locals 2
    .param p1    # Lcom/xiaomi/protocol/ICustomCaptureResult;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    monitor-enter p0

    .line 75
    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mWorkThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    .line 76
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/xiaomi/camera/core/ParallelDataZipper$1;

    invoke-direct {v1, p0, p1, p2}, Lcom/xiaomi/camera/core/ParallelDataZipper$1;-><init>(Lcom/xiaomi/camera/core/ParallelDataZipper;Lcom/xiaomi/protocol/ICustomCaptureResult;Z)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 97
    monitor-exit p0

    return-void

    .line 95
    :cond_0
    :try_start_1
    new-instance p1, Ljava/lang/RuntimeException;

    const-string p2, "Thread already die!"

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 74
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized prepare(IIILcom/xiaomi/camera/core/ParallelDataZipper$DataListener;)V
    .locals 5
    .param p4    # Lcom/xiaomi/camera/core/ParallelDataZipper$DataListener;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    monitor-enter p0

    .line 64
    :try_start_0
    iput p1, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mAlgoType:I

    .line 65
    iput p2, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mStreamNum:I

    .line 66
    iput p3, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mBurstNum:I

    .line 67
    iput-object p4, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mDataListener:Lcom/xiaomi/camera/core/ParallelDataZipper$DataListener;

    .line 68
    iget-object p4, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mCaptureDataBeanArray:Landroid/util/LongSparseArray;

    invoke-virtual {p4}, Landroid/util/LongSparseArray;->size()I

    move-result p4

    .line 69
    sget-object v0, Lcom/xiaomi/camera/core/ParallelDataZipper;->TAG:Ljava/lang/String;

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v2, "prepare: algo=%d streamNum=%d burstNum=%d arraySize=%d"

    const/4 v3, 0x4

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    .line 71
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v3, v4

    const/4 p1, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    aput-object p2, v3, p1

    const/4 p1, 0x2

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    aput-object p2, v3, p1

    const/4 p1, 0x3

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    aput-object p2, v3, p1

    .line 69
    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 72
    monitor-exit p0

    return-void

    .line 63
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
