.class public abstract Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;
.super Landroid/media/MediaCodec$Callback;
.source "CircularMediaEncoder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;,
        Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$CyclicBuffer;,
        Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Sample;,
        Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$EventHandler;
    }
.end annotation


# static fields
.field private static final DEBUG:Z = true

.field private static final MSG_RELEASE_ENCODER:I = 0x2

.field private static final MSG_START_ENCODING:I = 0x0

.field private static final MSG_STOP_ENCODING:I = 0x1

.field private static final TAG:Ljava/lang/String;


# instance fields
.field protected final mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

.field protected final mBufferingDurationUs:J

.field protected final mCaptureDurationUs:J

.field protected volatile mCurrentPresentationTimeUs:J

.field protected mCyclicBuffer:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$CyclicBuffer;

.field protected final mDesiredMediaFormat:Landroid/media/MediaFormat;

.field protected final mEncodingThread:Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;

.field protected final mEventHandler:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$EventHandler;

.field protected final mHandlerHelper:Lcom/xiaomi/camera/liveshot/util/HandlerHelper;

.field protected volatile mIsBuffering:Z

.field protected volatile mIsInitialized:Z

.field protected mMediaCodec:Landroid/media/MediaCodec;

.field private volatile mOutputFormatChanged:Z

.field protected final mPostCaptureDurationUs:J

.field protected final mPreCaptureDurationUs:J

.field protected final mSnapshots:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/media/MediaFormat;JJ)V
    .locals 4

    invoke-direct {p0}, Landroid/media/MediaCodec$Callback;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mIsInitialized:Z

    if-eqz p1, :cond_5

    cmp-long v1, p4, p2

    if-gtz v1, :cond_4

    const-wide/16 v1, 0x0

    cmp-long v3, p2, v1

    if-lez v3, :cond_3

    cmp-long v1, p4, v1

    if-lez v1, :cond_3

    const-string v1, "mime"

    invoke-virtual {p1, v1}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    invoke-static {p1, v1}, Lcom/xiaomi/camera/liveshot/MediaCodecCapability;->isFormatSupported(Landroid/media/MediaFormat;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    iput-object p1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mDesiredMediaFormat:Landroid/media/MediaFormat;

    iput-wide p2, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mCaptureDurationUs:J

    iput-wide p4, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mPreCaptureDurationUs:J

    sub-long p4, p2, p4

    iput-wide p4, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mPostCaptureDurationUs:J

    const-wide/16 p4, 0x2

    mul-long/2addr p2, p4

    iput-wide p2, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mBufferingDurationUs:J

    sget-object p1, Ljava/util/concurrent/TimeUnit;->MICROSECONDS:Ljava/util/concurrent/TimeUnit;

    iget-wide p2, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mBufferingDurationUs:J

    invoke-virtual {p1, p2, p3}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide p1

    new-instance p3, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$CyclicBuffer;

    iget-object p4, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mDesiredMediaFormat:Landroid/media/MediaFormat;

    invoke-direct {p3, p4, p1, p2}, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$CyclicBuffer;-><init>(Landroid/media/MediaFormat;J)V

    iput-object p3, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mCyclicBuffer:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$CyclicBuffer;

    new-instance p1, Landroid/media/MediaCodec$BufferInfo;

    invoke-direct {p1}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    iput-object p1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mSnapshots:Ljava/util/List;

    const-string p1, "video"

    invoke-virtual {v1, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "VideoEncodingThread"

    goto :goto_0

    :cond_0
    const-string p1, "AudioEncodingThread"

    :goto_0
    new-instance p2, Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;

    invoke-direct {p2, p1}, Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;-><init>(Ljava/lang/String;)V

    iput-object p2, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mEncodingThread:Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;

    new-instance p1, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$EventHandler;

    iget-object p2, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mEncodingThread:Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;

    invoke-virtual {p2}, Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;->getLooper()Landroid/os/Looper;

    move-result-object p2

    invoke-direct {p1, p0, p2}, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$EventHandler;-><init>(Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mEventHandler:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$EventHandler;

    new-instance p1, Lcom/xiaomi/camera/liveshot/util/HandlerHelper;

    invoke-direct {p1}, Lcom/xiaomi/camera/liveshot/util/HandlerHelper;-><init>()V

    iput-object p1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mHandlerHelper:Lcom/xiaomi/camera/liveshot/util/HandlerHelper;

    iput-boolean v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mIsBuffering:Z

    return-void

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "The desired MediaFormat is not supported"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "The desired mimeType is not specified"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Both captureDurationUs and preCaptureDurationUs must be positive integers"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "The preCaptureDurationUs must not be greater than captureDurationUs"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_5
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "The desired MediaFormat must not be null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->TAG:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method protected doRelease()V
    .locals 4

    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->release()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    :cond_0
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mEncodingThread:Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;

    if-eqz v0, :cond_1

    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mEncodingThread:Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;

    invoke-virtual {v0}, Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;->quit()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    sget-object v1, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to stop encoding thread: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    :goto_0
    return-void
.end method

.method protected doStart()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mOutputFormatChanged:Z

    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->start()V

    :cond_0
    return-void
.end method

.method protected doStop()V
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->flush()V

    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->stop()V

    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->reset()V

    :cond_0
    return-void
.end method

.method protected getNextPresentationTimeUs(J)J
    .locals 0

    return-wide p1
.end method

.method public onError(Landroid/media/MediaCodec;Landroid/media/MediaCodec$CodecException;)V
    .locals 2

    sget-object p1, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "MediaCodec Exception occurred: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onInputBufferAvailable(Landroid/media/MediaCodec;I)V
    .locals 0

    return-void
.end method

.method public onOutputBufferAvailable(Landroid/media/MediaCodec;ILandroid/media/MediaCodec$BufferInfo;)V
    .locals 16

    move-object/from16 v1, p0

    move-object/from16 v0, p3

    invoke-virtual/range {p1 .. p2}, Landroid/media/MediaCodec;->getOutputBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-virtual/range {p1 .. p2}, Landroid/media/MediaCodec;->getOutputFormat(I)Landroid/media/MediaFormat;

    move-result-object v3

    const-string v4, "mime"

    invoke-virtual {v3, v4}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    aget-object v3, v3, v4

    if-eqz v2, :cond_8

    iget v5, v0, Landroid/media/MediaCodec$BufferInfo;->size:I

    if-eqz v5, :cond_8

    iget-boolean v5, v1, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mIsBuffering:Z

    if-eqz v5, :cond_8

    iget v5, v0, Landroid/media/MediaCodec$BufferInfo;->offset:I

    invoke-virtual {v2, v5}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    iget v5, v0, Landroid/media/MediaCodec$BufferInfo;->offset:I

    iget v6, v0, Landroid/media/MediaCodec$BufferInfo;->size:I

    add-int/2addr v5, v6

    invoke-virtual {v2, v5}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    iget-wide v5, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    invoke-virtual {v1, v5, v6}, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->getNextPresentationTimeUs(J)J

    move-result-wide v5

    iput-wide v5, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    sget-object v5, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, ": CyclicBuffer.add E "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v7, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v5, v1, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mCyclicBuffer:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$CyclicBuffer;

    iget v6, v0, Landroid/media/MediaCodec$BufferInfo;->flags:I

    iget-wide v7, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    invoke-virtual {v5, v2, v6, v7, v8}, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$CyclicBuffer;->add(Ljava/nio/ByteBuffer;IJ)V

    iget-wide v5, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    iput-wide v5, v1, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mCurrentPresentationTimeUs:J

    sget-object v2, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, ": CyclicBuffer.add X "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v6, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v2, v1, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mSnapshots:Ljava/util/List;

    monitor-enter v2

    :try_start_0
    iget-object v5, v1, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mSnapshots:Ljava/util/List;

    invoke-interface {v0, v5}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;

    iget-object v0, v1, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mCyclicBuffer:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$CyclicBuffer;

    invoke-virtual {v0}, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$CyclicBuffer;->getFirstIndex()I

    move-result v0

    if-ltz v0, :cond_7

    iget-wide v6, v5, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->position:J

    const-wide/16 v8, -0x1

    cmp-long v6, v6, v8

    const/4 v7, 0x1

    if-nez v6, :cond_0

    move v6, v7

    goto :goto_1

    :cond_0
    nop

    move v6, v4

    :goto_1
    move v8, v0

    :cond_1
    iget-object v0, v1, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mCyclicBuffer:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$CyclicBuffer;

    iget-object v9, v1, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    invoke-virtual {v0, v8, v9}, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$CyclicBuffer;->getChunk(ILandroid/media/MediaCodec$BufferInfo;)Ljava/nio/ByteBuffer;

    move-result-object v0

    iget-object v9, v1, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget-wide v9, v9, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    iget-object v11, v1, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v11, v11, Landroid/media/MediaCodec$BufferInfo;->flags:I

    and-int/2addr v11, v7

    if-eqz v11, :cond_2

    move v11, v7

    goto :goto_2

    :cond_2
    nop

    move v11, v4

    :goto_2
    if-eqz v6, :cond_3

    :try_start_1
    iget-wide v12, v5, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->head:J

    cmp-long v12, v9, v12

    if-ltz v12, :cond_4

    sget-object v12, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->TAG:Ljava/lang/String;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v14, ": Snapshot.put oldcache E "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v14, v5, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->head:J

    invoke-virtual {v13, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v14, ":"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v14, v5, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->tail:J

    invoke-virtual {v13, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v14, ":"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v9, ":"

    invoke-virtual {v13, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v12, v9}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v9, v1, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    invoke-virtual {v5, v0, v9}, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->put(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V

    sget-object v0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v10, ": Snapshot.put oldcache X"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v0, v9}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3

    :catch_0
    move-exception v0

    goto :goto_4

    :cond_3
    iget-wide v12, v5, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->position:J

    cmp-long v12, v9, v12

    if-lez v12, :cond_4

    sget-object v12, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->TAG:Ljava/lang/String;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v14, ": Snapshot.put incoming E "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v14, v5, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->head:J

    invoke-virtual {v13, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v14, ":"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v14, v5, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->tail:J

    invoke-virtual {v13, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v14, ":"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v9, ":"

    invoke-virtual {v13, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v12, v9}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v9, v1, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    invoke-virtual {v5, v0, v9}, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->put(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V

    sget-object v0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v10, ": Snapshot.put incoming X"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v0, v9}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    :cond_4
    :goto_3
    goto :goto_5

    :goto_4
    nop

    sget-object v0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v10, ": Snapshot.put: meet interrupted exception"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v0, v9}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_5
    invoke-virtual {v5}, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->eos()Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object v9, v1, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mSnapshots:Ljava/util/List;

    monitor-enter v9

    :try_start_2
    sget-object v0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, ": Snapshot.put: removed from queue"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v0, v6}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, v1, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mSnapshots:Ljava/util/List;

    invoke-interface {v0, v5}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    monitor-exit v9

    goto :goto_6

    :catchall_0
    move-exception v0

    monitor-exit v9
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    :cond_5
    iget-object v0, v1, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mCyclicBuffer:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$CyclicBuffer;

    invoke-virtual {v0, v8}, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$CyclicBuffer;->getNextIndex(I)I

    move-result v8

    if-ltz v8, :cond_6

    invoke-virtual {v5}, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->eos()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_6
    :goto_6
    goto/16 :goto_0

    :cond_7
    sget-object v0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ": Unable to get the first index"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Unable to get the first index"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :catchall_1
    move-exception v0

    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v0

    :cond_8
    move-object/from16 v1, p1

    move/from16 v2, p2

    invoke-virtual {v1, v2, v4}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    return-void
.end method

.method public onOutputFormatChanged(Landroid/media/MediaCodec;Landroid/media/MediaFormat;)V
    .locals 2

    sget-object p1, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "MediaCodec Output Format Changed: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    monitor-enter p0

    const/4 p1, 0x1

    :try_start_0
    iput-boolean p1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mOutputFormatChanged:Z

    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public release()V
    .locals 3

    sget-object v0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->TAG:Ljava/lang/String;

    const-string v1, "release"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mHandlerHelper:Lcom/xiaomi/camera/liveshot/util/HandlerHelper;

    iget-object v1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mEventHandler:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$EventHandler;

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$EventHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/xiaomi/camera/liveshot/util/HandlerHelper;->sendMessageAndAwaitResponse(Landroid/os/Message;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mHandlerHelper:Lcom/xiaomi/camera/liveshot/util/HandlerHelper;

    invoke-virtual {v0}, Lcom/xiaomi/camera/liveshot/util/HandlerHelper;->release()V

    return-void
.end method

.method public snapshot()Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;
    .locals 12

    iget-boolean v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mIsBuffering:Z

    if-eqz v0, :cond_0

    iget-wide v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mCurrentPresentationTimeUs:J

    iget-wide v2, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mPostCaptureDurationUs:J

    add-long v7, v0, v2

    const-wide/16 v0, 0x0

    iget-wide v2, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mCaptureDurationUs:J

    sub-long v2, v7, v2

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v5

    sget-object v0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Snapshot["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v2, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mCurrentPresentationTimeUs:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;

    iget-wide v9, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mCurrentPresentationTimeUs:J

    iget-object v1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v1}, Landroid/media/MediaCodec;->getOutputFormat()Landroid/media/MediaFormat;

    move-result-object v11

    move-object v4, v0

    invoke-direct/range {v4 .. v11}, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;-><init>(JJJLandroid/media/MediaFormat;)V

    iget-object v1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mSnapshots:Ljava/util/List;

    monitor-enter v1

    :try_start_0
    iget-object v2, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mSnapshots:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "MediaCodec has not been started yet"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public start()V
    .locals 3

    sget-object v0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->TAG:Ljava/lang/String;

    const-string v1, "start"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mHandlerHelper:Lcom/xiaomi/camera/liveshot/util/HandlerHelper;

    iget-object v1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mEventHandler:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$EventHandler;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$EventHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/xiaomi/camera/liveshot/util/HandlerHelper;->sendMessageAndAwaitResponse(Landroid/os/Message;)Ljava/lang/Object;

    return-void
.end method

.method public stop()V
    .locals 3

    sget-object v0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->TAG:Ljava/lang/String;

    const-string v1, "stop"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    nop

    monitor-enter p0

    const/16 v0, 0xa

    :goto_0
    :try_start_0
    iget-boolean v1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mOutputFormatChanged:Z

    if-nez v1, :cond_0

    if-lez v0, :cond_0

    add-int/lit8 v0, v0, -0x1

    sget-object v1, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->TAG:Ljava/lang/String;

    const-string v2, "waiting for MediaCodec getting stable before stop: E"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-wide/16 v1, 0xc8

    :try_start_1
    invoke-virtual {p0, v1, v2}, Ljava/lang/Object;->wait(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :catch_0
    move-exception v1

    :goto_1
    :try_start_2
    sget-object v1, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->TAG:Ljava/lang/String;

    const-string v2, "waiting for MediaCodec getting stable before stop: X"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_0
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-nez v0, :cond_1

    sget-object v0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->TAG:Ljava/lang/String;

    const-string v1, "waiting for MediaCodec getting stable before stop has timed out"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mHandlerHelper:Lcom/xiaomi/camera/liveshot/util/HandlerHelper;

    iget-object v1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->mEventHandler:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$EventHandler;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$EventHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/xiaomi/camera/liveshot/util/HandlerHelper;->sendMessageAndAwaitResponse(Landroid/os/Message;)Ljava/lang/Object;

    return-void

    :catchall_0
    move-exception v0

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v0
.end method
