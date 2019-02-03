.class public Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;
.super Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;
.source "CircularVideoEncoder.java"


# static fields
.field private static final DEBUG_FPS:Z = true

.field private static final TAG:Ljava/lang/String;


# instance fields
.field protected mFirstPresentationTimeUs:J

.field private mFpsOutputInterval:I

.field private mFrameStartTimestampNs:J

.field private mFramesRendered:I

.field private mInputSurface:Landroid/view/Surface;

.field protected mLastPresentationTimeUs:J

.field private mMinFrameRenderPeriodNs:J

.field private mNextFrameTimestampNs:J

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

    .line 42
    move-object v0, p0

    move-object v1, p1

    move-wide v2, p3

    move-wide v4, p5

    invoke-direct/range {v0 .. v5}, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;-><init>(Landroid/media/MediaFormat;JJ)V

    .line 36
    const-wide/16 p3, 0x0

    iput-wide p3, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mFrameStartTimestampNs:J

    .line 37
    const/4 p1, 0x0

    iput p1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mFramesRendered:I

    .line 38
    const/16 p1, 0x1f4

    iput p1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mFpsOutputInterval:I

    .line 44
    iget-object p1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mDesiredMediaFormat:Landroid/media/MediaFormat;

    const-string p3, "i-frame-interval"

    invoke-virtual {p1, p3}, Landroid/media/MediaFormat;->getFloat(Ljava/lang/String;)F

    move-result p1

    .line 45
    sget-object p3, Ljava/util/concurrent/TimeUnit;->MICROSECONDS:Ljava/util/concurrent/TimeUnit;

    iget-wide p4, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mBufferingDurationUs:J

    invoke-virtual {p3, p4, p5}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide p3

    .line 46
    const/high16 p5, 0x447a0000    # 1000.0f

    mul-float/2addr p1, p5

    const/high16 p5, 0x40000000    # 2.0f

    mul-float/2addr p1, p5

    .line 47
    long-to-float p5, p3

    cmpg-float p5, p5, p1

    if-ltz p5, :cond_1

    .line 52
    if-eqz p2, :cond_0

    .line 56
    iput-object p2, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mSharedEGLContext:Landroid/opengl/EGLContext;

    .line 58
    iget-object p1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mDesiredMediaFormat:Landroid/media/MediaFormat;

    const-string p2, "width"

    invoke-virtual {p1, p2}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result p1

    .line 59
    iget-object p2, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mDesiredMediaFormat:Landroid/media/MediaFormat;

    const-string p3, "height"

    invoke-virtual {p2, p3}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result p2

    .line 60
    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result p3

    iput p3, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mPreviewWidth:I

    .line 61
    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mPreviewHeight:I

    .line 64
    :try_start_0
    iget-object p1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mDesiredMediaFormat:Landroid/media/MediaFormat;

    const-string p2, "mime"

    invoke-virtual {p1, p2}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 65
    invoke-static {p1}, Landroid/media/MediaCodec;->createEncoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    move-result-object p1

    iput-object p1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mMediaCodec:Landroid/media/MediaCodec;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 68
    nop

    .line 70
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mIsInitialized:Z

    .line 71
    return-void

    .line 66
    :catch_0
    move-exception p1

    .line 67
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

    .line 53
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "The shared EGLContext must not be null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 48
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
    .locals 1

    .line 185
    iget-boolean v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mIsInitialized:Z

    if-nez v0, :cond_0

    .line 186
    return-void

    .line 189
    :cond_0
    invoke-super {p0}, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->doRelease()V

    .line 191
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mIsInitialized:Z

    .line 192
    return-void
.end method

.method public doStart()V
    .locals 10

    .line 110
    sget-object v0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->TAG:Ljava/lang/String;

    const-string v1, "start(): E"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    iget-boolean v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mIsInitialized:Z

    if-nez v0, :cond_0

    .line 112
    sget-object v0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->TAG:Ljava/lang/String;

    const-string v1, "start(): not initialized yet"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 113
    return-void

    .line 116
    :cond_0
    iget-boolean v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mIsBuffering:Z

    if-eqz v0, :cond_1

    .line 117
    sget-object v0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->TAG:Ljava/lang/String;

    const-string v1, "start(): encoder is already running"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 118
    return-void

    .line 121
    :cond_1
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mCyclicBuffer:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$CyclicBuffer;

    invoke-virtual {v0}, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$CyclicBuffer;->clear()V

    .line 123
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    iget-object v1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mDesiredMediaFormat:Landroid/media/MediaFormat;

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3, v3, v2}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 124
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->createInputSurface()Landroid/view/Surface;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mInputSurface:Landroid/view/Surface;

    .line 125
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

    .line 126
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mRenderThread:Lcom/xiaomi/camera/liveshot/gles/RenderThread;

    invoke-virtual {v0}, Lcom/xiaomi/camera/liveshot/gles/RenderThread;->start()V

    .line 127
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mRenderThread:Lcom/xiaomi/camera/liveshot/gles/RenderThread;

    invoke-virtual {v0}, Lcom/xiaomi/camera/liveshot/gles/RenderThread;->waitUntilReady()V

    .line 128
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    new-instance v1, Landroid/os/Handler;

    iget-object v3, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mEncodingThread:Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;

    invoke-virtual {v3}, Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;->getLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v1, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    invoke-virtual {v0, p0, v1}, Landroid/media/MediaCodec;->setCallback(Landroid/media/MediaCodec$Callback;Landroid/os/Handler;)V

    .line 130
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mCurrentPresentationTimeUs:J

    .line 131
    iput-wide v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mFirstPresentationTimeUs:J

    .line 132
    iput-wide v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mLastPresentationTimeUs:J

    .line 134
    invoke-super {p0}, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->doStart()V

    .line 136
    iput-boolean v2, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mIsBuffering:Z

    .line 137
    sget-object v0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->TAG:Ljava/lang/String;

    const-string v1, "start(): X"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 138
    return-void
.end method

.method public declared-synchronized doStop()V
    .locals 5

    monitor-enter p0

    .line 142
    :try_start_0
    sget-object v0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->TAG:Ljava/lang/String;

    const-string v1, "stop(): E"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 143
    iget-boolean v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mIsInitialized:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-nez v0, :cond_0

    .line 144
    monitor-exit p0

    return-void

    .line 147
    :cond_0
    :try_start_1
    iget-boolean v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mIsBuffering:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    if-nez v0, :cond_1

    .line 148
    monitor-exit p0

    return-void

    .line 151
    :cond_1
    const/4 v0, 0x0

    :try_start_2
    iput-boolean v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mIsBuffering:Z

    .line 153
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mRenderThread:Lcom/xiaomi/camera/liveshot/gles/RenderThread;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 154
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mRenderThread:Lcom/xiaomi/camera/liveshot/gles/RenderThread;

    invoke-virtual {v0}, Lcom/xiaomi/camera/liveshot/gles/RenderThread;->quit()V

    .line 155
    iput-object v1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mRenderThread:Lcom/xiaomi/camera/liveshot/gles/RenderThread;

    .line 158
    :cond_2
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mInputSurface:Landroid/view/Surface;

    if-eqz v0, :cond_3

    .line 159
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mInputSurface:Landroid/view/Surface;

    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 160
    iput-object v1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mInputSurface:Landroid/view/Surface;

    .line 163
    :cond_3
    invoke-super {p0}, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->doStop()V

    .line 165
    sget-object v0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->TAG:Ljava/lang/String;

    const-string v1, "clear pending snapshot requests: E"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 166
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 167
    iget-object v1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mSnapshots:Ljava/util/List;

    monitor-enter v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 168
    :try_start_3
    iget-object v2, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mSnapshots:Ljava/util/List;

    invoke-interface {v0, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 169
    iget-object v2, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mSnapshots:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 170
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 171
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

    .line 172
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

    .line 174
    :try_start_5
    invoke-virtual {v1}, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->putEos()V
    :try_end_5
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 177
    goto :goto_1

    .line 175
    :catch_0
    move-exception v1

    .line 176
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

    .line 178
    :goto_1
    goto :goto_0

    .line 179
    :cond_4
    sget-object v0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->TAG:Ljava/lang/String;

    const-string v1, "clear pending snapshot requests: X"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 180
    sget-object v0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->TAG:Ljava/lang/String;

    const-string v1, "stop(): X"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 181
    monitor-exit p0

    return-void

    .line 170
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

    .line 141
    :catchall_1
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected getNextPresentationTimeUs(J)J
    .locals 4

    .line 93
    iget-wide v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mFirstPresentationTimeUs:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 94
    iput-wide p1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mFirstPresentationTimeUs:J

    .line 95
    return-wide v2

    .line 98
    :cond_0
    iget-wide v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mFirstPresentationTimeUs:J

    sub-long/2addr p1, v0

    .line 99
    iget-wide v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mLastPresentationTimeUs:J

    cmp-long v0, v0, p1

    if-ltz v0, :cond_1

    .line 101
    iget-wide p1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mLastPresentationTimeUs:J

    const-wide/16 v0, 0x25ab

    add-long/2addr p1, v0

    iput-wide p1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mLastPresentationTimeUs:J

    .line 102
    iget-wide p1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mLastPresentationTimeUs:J

    return-wide p1

    .line 104
    :cond_1
    iput-wide p1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mLastPresentationTimeUs:J

    .line 105
    return-wide p1
.end method

.method public declared-synchronized onSurfaceTextureUpdated(Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;)V
    .locals 8

    monitor-enter p0

    .line 207
    :try_start_0
    iget-boolean v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mIsInitialized:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    .line 208
    monitor-exit p0

    return-void

    .line 211
    :cond_0
    :try_start_1
    iget-boolean v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mIsBuffering:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v0, :cond_1

    .line 212
    monitor-exit p0

    return-void

    .line 215
    :cond_1
    :try_start_2
    iget-wide v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mMinFrameRenderPeriodNs:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_3

    .line 216
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    .line 217
    iget-wide v4, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mNextFrameTimestampNs:J

    cmp-long v4, v0, v4

    if-gez v4, :cond_2

    .line 218
    sget-object p1, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->TAG:Ljava/lang/String;

    const-string v0, "Dropping frame - fps reduction is active."

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 219
    monitor-exit p0

    return-void

    .line 221
    :cond_2
    :try_start_3
    iget-wide v4, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mNextFrameTimestampNs:J

    iget-wide v6, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mMinFrameRenderPeriodNs:J

    add-long/2addr v4, v6

    iput-wide v4, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mNextFrameTimestampNs:J

    .line 223
    iget-wide v4, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mNextFrameTimestampNs:J

    invoke-static {v4, v5, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mNextFrameTimestampNs:J

    .line 226
    :cond_3
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mRenderThread:Lcom/xiaomi/camera/liveshot/gles/RenderThread;

    invoke-virtual {v0, p1}, Lcom/xiaomi/camera/liveshot/gles/RenderThread;->draw(Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;)V

    .line 229
    sget-object p1, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    .line 230
    iget-wide v4, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mFrameStartTimestampNs:J

    cmp-long p1, v4, v2

    if-lez p1, :cond_5

    .line 232
    iget-wide v2, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mFrameStartTimestampNs:J

    sub-long v2, v0, v2

    .line 233
    iget p1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mFramesRendered:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mFramesRendered:I

    .line 234
    iget p1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mFpsOutputInterval:I

    int-to-long v4, p1

    cmp-long p1, v2, v4

    if-lez p1, :cond_4

    .line 235
    iget p1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mFramesRendered:I

    mul-int/lit16 p1, p1, 0x3e8

    int-to-double v4, p1

    long-to-double v2, v2

    div-double/2addr v4, v2

    .line 236
    sget-object p1, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onSurfaceTextureUpdated(): "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 237
    iput-wide v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mFrameStartTimestampNs:J

    .line 238
    const/4 p1, 0x0

    iput p1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mFramesRendered:I

    .line 240
    :cond_4
    goto :goto_0

    .line 241
    :cond_5
    iput-wide v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mFrameStartTimestampNs:J
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 244
    :goto_0
    monitor-exit p0

    return-void

    .line 206
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized setFilterId(I)V
    .locals 1

    monitor-enter p0

    .line 195
    :try_start_0
    iget-boolean v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mIsInitialized:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    .line 196
    monitor-exit p0

    return-void

    .line 199
    :cond_0
    :try_start_1
    iget-boolean v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mIsBuffering:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v0, :cond_1

    .line 200
    monitor-exit p0

    return-void

    .line 203
    :cond_1
    :try_start_2
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mRenderThread:Lcom/xiaomi/camera/liveshot/gles/RenderThread;

    invoke-virtual {v0, p1}, Lcom/xiaomi/camera/liveshot/gles/RenderThread;->setFilterId(I)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 204
    monitor-exit p0

    return-void

    .line 194
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public setFpsReduction(F)V
    .locals 3

    .line 77
    sget-object v0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setFpsReduction: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 78
    const/4 v0, 0x0

    cmpg-float v0, p1, v0

    if-gtz v0, :cond_0

    .line 79
    const-wide v0, 0x7fffffffffffffffL

    iput-wide v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mMinFrameRenderPeriodNs:J

    goto :goto_0

    .line 81
    :cond_0
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v0

    long-to-float v0, v0

    div-float/2addr v0, p1

    float-to-long v0, v0

    iput-wide v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->mMinFrameRenderPeriodNs:J

    .line 83
    :goto_0
    return-void
.end method
