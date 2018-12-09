.class public Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;
.super Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;
.source "CircularVideoEncoder.java"


# static fields
.field private static final DEBUG:Z = true

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private volatile mFrameNum:J

.field private mInputSurface:Landroid/view/Surface;

.field private final mPreviewHeight:I

.field private final mPreviewWidth:I

.field private mRenderThread:Lcom/xiaomi/camera/liveshot/gles/RenderThread;

.field private mSharedEGLContext:Landroid/opengl/EGLContext;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 19
    const-class v0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/media/MediaFormat;Landroid/opengl/EGLContext;JJ)V
    .locals 6

    .line 33
    move-object v0, p0

    move-object v1, p1

    move-wide v2, p3

    move-wide v4, p5

    invoke-direct/range {v0 .. v5}, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;-><init>(Landroid/media/MediaFormat;JJ)V

    .line 29
    const-wide/16 p3, 0x0

    iput-wide p3, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mFrameNum:J

    .line 35
    iget-object p1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mDesiredMediaFormat:Landroid/media/MediaFormat;

    const-string p3, "i-frame-interval"

    invoke-virtual {p1, p3}, Landroid/media/MediaFormat;->getFloat(Ljava/lang/String;)F

    move-result p1

    .line 36
    sget-object p3, Ljava/util/concurrent/TimeUnit;->MICROSECONDS:Ljava/util/concurrent/TimeUnit;

    iget-wide p4, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mBufferingDurationUs:J

    invoke-virtual {p3, p4, p5}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide p3

    .line 37
    const/high16 p5, 0x447a0000    # 1000.0f

    mul-float/2addr p1, p5

    const/high16 p5, 0x40000000    # 2.0f

    mul-float/2addr p1, p5

    .line 38
    long-to-float p5, p3

    cmpg-float p5, p5, p1

    if-ltz p5, :cond_1

    .line 43
    if-eqz p2, :cond_0

    .line 47
    iput-object p2, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mSharedEGLContext:Landroid/opengl/EGLContext;

    .line 49
    iget-object p1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mDesiredMediaFormat:Landroid/media/MediaFormat;

    const-string p2, "width"

    invoke-virtual {p1, p2}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result p1

    .line 50
    iget-object p2, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mDesiredMediaFormat:Landroid/media/MediaFormat;

    const-string p3, "height"

    invoke-virtual {p2, p3}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result p2

    .line 51
    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result p3

    iput p3, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mPreviewWidth:I

    .line 52
    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mPreviewHeight:I

    .line 55
    :try_start_0
    iget-object p1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mDesiredMediaFormat:Landroid/media/MediaFormat;

    const-string p2, "mime"

    invoke-virtual {p1, p2}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 56
    invoke-static {p1}, Landroid/media/MediaCodec;->createEncoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    move-result-object p1

    iput-object p1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mMediaCodec:Landroid/media/MediaCodec;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 59
    nop

    .line 61
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mIsInitialized:Z

    .line 62
    return-void

    .line 57
    :catch_0
    move-exception p1

    .line 58
    new-instance p2, Ljava/lang/IllegalStateException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "Failed to configure MediaCodec: "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 44
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "The shared EGLContext must not be null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 39
    :cond_1
    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-instance p5, Ljava/lang/StringBuilder;

    invoke-direct {p5}, Ljava/lang/StringBuilder;-><init>()V

    const-string p6, "Requested time span is too short: "

    invoke-virtual {p5, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p5, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p3, " vs. "

    invoke-virtual {p5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p5, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {p5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method


# virtual methods
.method public doRelease()V
    .locals 2

    .line 138
    sget-object v0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->TAG:Ljava/lang/String;

    const-string v1, "releasing encoder objects"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 139
    iget-boolean v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mIsInitialized:Z

    if-nez v0, :cond_0

    .line 140
    return-void

    .line 143
    :cond_0
    invoke-super {p0}, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->doRelease()V

    .line 145
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mIsInitialized:Z

    .line 146
    return-void
.end method

.method public doStart()V
    .locals 10

    .line 66
    sget-object v0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->TAG:Ljava/lang/String;

    const-string v1, "start(): E"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    iget-boolean v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mIsInitialized:Z

    if-nez v0, :cond_0

    .line 68
    sget-object v0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->TAG:Ljava/lang/String;

    const-string v1, "start(): not initialized yet"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 69
    return-void

    .line 72
    :cond_0
    iget-boolean v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mIsBuffering:Z

    if-eqz v0, :cond_1

    .line 73
    sget-object v0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->TAG:Ljava/lang/String;

    const-string v1, "start(): encoder is already running"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 74
    return-void

    .line 77
    :cond_1
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mCircularBuffer:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$CyclicBuffer;

    invoke-virtual {v0}, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$CyclicBuffer;->clear()V

    .line 79
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    iget-object v1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mDesiredMediaFormat:Landroid/media/MediaFormat;

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3, v3, v2}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 80
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->createInputSurface()Landroid/view/Surface;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mInputSurface:Landroid/view/Surface;

    .line 81
    new-instance v0, Lcom/xiaomi/camera/liveshot/gles/RenderThread;

    sget-object v4, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->TAG:Ljava/lang/String;

    iget v5, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mPreviewWidth:I

    iget v6, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mPreviewHeight:I

    iget-object v7, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mSharedEGLContext:Landroid/opengl/EGLContext;

    iget-object v8, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mInputSurface:Landroid/view/Surface;

    const/4 v9, 0x1

    move-object v3, v0

    invoke-direct/range {v3 .. v9}, Lcom/xiaomi/camera/liveshot/gles/RenderThread;-><init>(Ljava/lang/String;IILandroid/opengl/EGLContext;Ljava/lang/Object;Z)V

    iput-object v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mRenderThread:Lcom/xiaomi/camera/liveshot/gles/RenderThread;

    .line 82
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mRenderThread:Lcom/xiaomi/camera/liveshot/gles/RenderThread;

    invoke-virtual {v0}, Lcom/xiaomi/camera/liveshot/gles/RenderThread;->start()V

    .line 83
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mRenderThread:Lcom/xiaomi/camera/liveshot/gles/RenderThread;

    invoke-virtual {v0}, Lcom/xiaomi/camera/liveshot/gles/RenderThread;->waitUntilReady()V

    .line 84
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    new-instance v1, Landroid/os/Handler;

    iget-object v3, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mEncodingThread:Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;

    invoke-virtual {v3}, Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;->getLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v1, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    invoke-virtual {v0, p0, v1}, Landroid/media/MediaCodec;->setCallback(Landroid/media/MediaCodec$Callback;Landroid/os/Handler;)V

    .line 86
    invoke-super {p0}, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->doStart()V

    .line 88
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mCurrentPresentationTimeUs:J

    .line 89
    iput-boolean v2, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mIsBuffering:Z

    .line 90
    sget-object v0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->TAG:Ljava/lang/String;

    const-string v1, "start(): X"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    return-void
.end method

.method public declared-synchronized doStop()V
    .locals 5

    monitor-enter p0

    .line 95
    :try_start_0
    sget-object v0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->TAG:Ljava/lang/String;

    const-string v1, "stop(): E"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    iget-boolean v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mIsInitialized:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-nez v0, :cond_0

    .line 97
    monitor-exit p0

    return-void

    .line 100
    :cond_0
    :try_start_1
    iget-boolean v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mIsBuffering:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    if-nez v0, :cond_1

    .line 101
    monitor-exit p0

    return-void

    .line 104
    :cond_1
    const/4 v0, 0x0

    :try_start_2
    iput-boolean v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mIsBuffering:Z

    .line 106
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mRenderThread:Lcom/xiaomi/camera/liveshot/gles/RenderThread;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 107
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mRenderThread:Lcom/xiaomi/camera/liveshot/gles/RenderThread;

    invoke-virtual {v0}, Lcom/xiaomi/camera/liveshot/gles/RenderThread;->quit()V

    .line 108
    iput-object v1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mRenderThread:Lcom/xiaomi/camera/liveshot/gles/RenderThread;

    .line 111
    :cond_2
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mInputSurface:Landroid/view/Surface;

    if-eqz v0, :cond_3

    .line 112
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mInputSurface:Landroid/view/Surface;

    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 113
    iput-object v1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mInputSurface:Landroid/view/Surface;

    .line 116
    :cond_3
    invoke-super {p0}, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->doStop()V

    .line 118
    sget-object v0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->TAG:Ljava/lang/String;

    const-string v1, "clear pending snapshot requests: E"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 120
    iget-object v1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mSnapshots:Ljava/util/List;

    monitor-enter v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 121
    :try_start_3
    iget-object v2, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mSnapshots:Ljava/util/List;

    invoke-interface {v0, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 122
    iget-object v2, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mSnapshots:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 123
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 124
    :try_start_4
    sget-object v1, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "cleared "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " snapshot requests."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 125
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 127
    :try_start_5
    invoke-virtual {v1}, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->putEos()V
    :try_end_5
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 130
    goto :goto_1

    .line 128
    :catch_0
    move-exception v1

    .line 129
    :try_start_6
    sget-object v2, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to putEos: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 131
    :goto_1
    goto :goto_0

    .line 132
    :cond_4
    sget-object v0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->TAG:Ljava/lang/String;

    const-string v1, "clear pending snapshot requests: X"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 133
    sget-object v0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->TAG:Ljava/lang/String;

    const-string v1, "stop(): X"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 134
    monitor-exit p0

    return-void

    .line 123
    :catchall_0
    move-exception v0

    :try_start_7
    monitor-exit v1
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    :try_start_8
    throw v0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 94
    :catchall_1
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized onSurfaceTextureUpdated(Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;)V
    .locals 4

    monitor-enter p0

    .line 161
    :try_start_0
    iget-boolean v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mIsInitialized:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    .line 162
    monitor-exit p0

    return-void

    .line 165
    :cond_0
    :try_start_1
    iget-boolean v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mIsBuffering:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v0, :cond_1

    .line 166
    monitor-exit p0

    return-void

    .line 171
    :cond_1
    :try_start_2
    iget-wide v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mFrameNum:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mFrameNum:J

    .line 172
    iget-wide v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mFrameNum:J

    const-wide/16 v2, 0x2

    rem-long/2addr v0, v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_2

    .line 173
    monitor-exit p0

    return-void

    .line 176
    :cond_2
    :try_start_3
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mRenderThread:Lcom/xiaomi/camera/liveshot/gles/RenderThread;

    invoke-virtual {v0, p1}, Lcom/xiaomi/camera/liveshot/gles/RenderThread;->draw(Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 177
    monitor-exit p0

    return-void

    .line 160
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized setFilterId(I)V
    .locals 1

    monitor-enter p0

    .line 149
    :try_start_0
    iget-boolean v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mIsInitialized:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    .line 150
    monitor-exit p0

    return-void

    .line 153
    :cond_0
    :try_start_1
    iget-boolean v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mIsBuffering:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v0, :cond_1

    .line 154
    monitor-exit p0

    return-void

    .line 157
    :cond_1
    :try_start_2
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mRenderThread:Lcom/xiaomi/camera/liveshot/gles/RenderThread;

    invoke-virtual {v0, p1}, Lcom/xiaomi/camera/liveshot/gles/RenderThread;->setFilterId(I)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 158
    monitor-exit p0

    return-void

    .line 148
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
