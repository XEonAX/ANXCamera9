.class public Lcom/xiaomi/camera/liveshot/writer/AudioSampleWriter;
.super Lcom/xiaomi/camera/liveshot/writer/SampleWriter;
.source "AudioSampleWriter.java"


# static fields
.field private static final DEBUG:Z = true

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final mAudioSnapshot:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;

.field private final mAudioTrackId:I

.field private final mMediaMuxer:Landroid/media/MediaMuxer;

.field private final mVideoFirstKeyFrameArrivedNotifier:Lcom/xiaomi/camera/liveshot/writer/SampleWriter$StatusNotifier;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/xiaomi/camera/liveshot/writer/SampleWriter$StatusNotifier<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 13
    const-class v0, Lcom/xiaomi/camera/liveshot/writer/AudioSampleWriter;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/xiaomi/camera/liveshot/writer/AudioSampleWriter;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/media/MediaMuxer;Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;ILcom/xiaomi/camera/liveshot/writer/SampleWriter$StatusNotifier;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/media/MediaMuxer;",
            "Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;",
            "I",
            "Lcom/xiaomi/camera/liveshot/writer/SampleWriter$StatusNotifier<",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .line 22
    invoke-direct {p0}, Lcom/xiaomi/camera/liveshot/writer/SampleWriter;-><init>()V

    .line 23
    iput-object p1, p0, Lcom/xiaomi/camera/liveshot/writer/AudioSampleWriter;->mMediaMuxer:Landroid/media/MediaMuxer;

    .line 24
    iput-object p2, p0, Lcom/xiaomi/camera/liveshot/writer/AudioSampleWriter;->mAudioSnapshot:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;

    .line 25
    iput p3, p0, Lcom/xiaomi/camera/liveshot/writer/AudioSampleWriter;->mAudioTrackId:I

    .line 26
    iput-object p4, p0, Lcom/xiaomi/camera/liveshot/writer/AudioSampleWriter;->mVideoFirstKeyFrameArrivedNotifier:Lcom/xiaomi/camera/liveshot/writer/SampleWriter$StatusNotifier;

    .line 27
    return-void
.end method


# virtual methods
.method protected writeSample()V
    .locals 19

    .line 31
    move-object/from16 v1, p0

    sget-object v0, Lcom/xiaomi/camera/liveshot/writer/AudioSampleWriter;->TAG:Ljava/lang/String;

    const-string v2, "writeAudioSamples: E"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    nop

    .line 33
    iget-object v0, v1, Lcom/xiaomi/camera/liveshot/writer/AudioSampleWriter;->mVideoFirstKeyFrameArrivedNotifier:Lcom/xiaomi/camera/liveshot/writer/SampleWriter$StatusNotifier;

    const-wide/16 v2, 0x0

    if-eqz v0, :cond_0

    .line 34
    iget-object v0, v1, Lcom/xiaomi/camera/liveshot/writer/AudioSampleWriter;->mVideoFirstKeyFrameArrivedNotifier:Lcom/xiaomi/camera/liveshot/writer/SampleWriter$StatusNotifier;

    invoke-virtual {v0}, Lcom/xiaomi/camera/liveshot/writer/SampleWriter$StatusNotifier;->getStatus()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    goto :goto_0

    .line 36
    :cond_0
    move-wide v4, v2

    :goto_0
    iget-object v0, v1, Lcom/xiaomi/camera/liveshot/writer/AudioSampleWriter;->mAudioSnapshot:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;

    iget-wide v6, v0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->head:J

    cmp-long v0, v4, v2

    if-gez v0, :cond_1

    move-wide v4, v2

    :cond_1
    add-long/2addr v6, v4

    .line 37
    iget-object v0, v1, Lcom/xiaomi/camera/liveshot/writer/AudioSampleWriter;->mAudioSnapshot:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;

    iget-wide v4, v0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->tail:J

    .line 39
    sget-object v0, Lcom/xiaomi/camera/liveshot/writer/AudioSampleWriter;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "writeAudioSamples: head timestamp: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v9, v1, Lcom/xiaomi/camera/liveshot/writer/AudioSampleWriter;->mAudioSnapshot:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;

    iget-wide v9, v9, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->head:J

    invoke-virtual {v8, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v9, ":"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v0, v8}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    sget-object v0, Lcom/xiaomi/camera/liveshot/writer/AudioSampleWriter;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "writeAudioSamples: tail timestamp: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v9, v1, Lcom/xiaomi/camera/liveshot/writer/AudioSampleWriter;->mAudioSnapshot:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;

    iget-wide v9, v9, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->tail:J

    invoke-virtual {v8, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v9, ":"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v0, v8}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    nop

    .line 43
    nop

    .line 44
    nop

    .line 45
    const-wide/16 v8, -0x1

    .line 47
    const/4 v10, 0x0

    move-wide v11, v2

    move v2, v10

    move v3, v2

    :goto_1
    if-nez v2, :cond_7

    .line 49
    sget-object v0, Lcom/xiaomi/camera/liveshot/writer/AudioSampleWriter;->TAG:Ljava/lang/String;

    const-string v13, "writeAudioSamples: take: E"

    invoke-static {v0, v13}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    :try_start_0
    iget-object v0, v1, Lcom/xiaomi/camera/liveshot/writer/AudioSampleWriter;->mAudioSnapshot:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;

    iget-object v0, v0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->samples:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v0}, Ljava/util/concurrent/BlockingQueue;->take()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Sample;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 59
    nop

    .line 61
    sget-object v2, Lcom/xiaomi/camera/liveshot/writer/AudioSampleWriter;->TAG:Ljava/lang/String;

    const-string v13, "writeAudioSamples: take: X"

    invoke-static {v2, v13}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    iget-object v2, v0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Sample;->data:Ljava/nio/ByteBuffer;

    .line 66
    iget-object v0, v0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Sample;->info:Landroid/media/MediaCodec$BufferInfo;

    .line 67
    iget-wide v13, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    cmp-long v13, v13, v6

    if-ltz v13, :cond_4

    iget-wide v14, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    sub-long/2addr v14, v11

    cmp-long v13, v8, v14

    if-gez v13, :cond_4

    .line 68
    if-nez v3, :cond_2

    .line 69
    nop

    .line 70
    iget-wide v11, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 71
    iget-object v3, v1, Lcom/xiaomi/camera/liveshot/writer/AudioSampleWriter;->mAudioSnapshot:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;

    iget-object v8, v1, Lcom/xiaomi/camera/liveshot/writer/AudioSampleWriter;->mAudioSnapshot:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;

    iget-wide v8, v8, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->head:J

    sub-long v8, v11, v8

    iput-wide v8, v3, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->offset:J

    .line 73
    sget-object v3, Lcom/xiaomi/camera/liveshot/writer/AudioSampleWriter;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "writeAudioSamples: first audio sample timestamp: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v3, v8}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    const/4 v3, 0x1

    :cond_2
    iget-wide v8, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    cmp-long v8, v8, v4

    if-ltz v8, :cond_3

    .line 78
    sget-object v8, Lcom/xiaomi/camera/liveshot/writer/AudioSampleWriter;->TAG:Ljava/lang/String;

    const-string v9, "writeAudioSamples: stop writing as reaching the ending timestamp"

    invoke-static {v8, v9}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    const/4 v8, 0x4

    iput v8, v0, Landroid/media/MediaCodec$BufferInfo;->flags:I

    .line 82
    :cond_3
    iget-wide v8, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    sub-long/2addr v8, v11

    iput-wide v8, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 83
    iget-object v8, v1, Lcom/xiaomi/camera/liveshot/writer/AudioSampleWriter;->mMediaMuxer:Landroid/media/MediaMuxer;

    iget v9, v1, Lcom/xiaomi/camera/liveshot/writer/AudioSampleWriter;->mAudioTrackId:I

    invoke-virtual {v8, v9, v2, v0}, Landroid/media/MediaMuxer;->writeSampleData(ILjava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V

    .line 84
    iget-wide v8, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 86
    sget-object v13, Lcom/xiaomi/camera/liveshot/writer/AudioSampleWriter;->TAG:Ljava/lang/String;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "writeAudioSamples: audio sample timestamp: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move/from16 v18, v3

    move-wide/from16 v16, v4

    iget-wide v3, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    add-long/2addr v3, v11

    invoke-virtual {v14, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v13, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 90
    move/from16 v3, v18

    goto :goto_2

    :cond_4
    move-wide/from16 v16, v4

    :goto_2
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->limit()I

    move-result v2

    if-eqz v2, :cond_6

    iget v0, v0, Landroid/media/MediaCodec$BufferInfo;->flags:I

    const/4 v2, 0x4

    and-int/2addr v0, v2

    if-eqz v0, :cond_5

    goto :goto_3

    .line 91
    :cond_5
    move v2, v10

    goto :goto_4

    .line 90
    :cond_6
    :goto_3
    nop

    .line 91
    const/4 v2, 0x1

    :goto_4
    goto :goto_5

    .line 54
    :catch_0
    move-exception v0

    move-wide/from16 v16, v4

    .line 56
    sget-object v0, Lcom/xiaomi/camera/liveshot/writer/AudioSampleWriter;->TAG:Ljava/lang/String;

    const-string v4, "writeAudioSamples: take: meet interrupted exception"

    invoke-static {v0, v4}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    nop

    .line 47
    :goto_5
    move-wide/from16 v4, v16

    goto/16 :goto_1

    .line 93
    :cond_7
    sget-object v0, Lcom/xiaomi/camera/liveshot/writer/AudioSampleWriter;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "writeAudioSamples: X: duration: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 94
    sget-object v0, Lcom/xiaomi/camera/liveshot/writer/AudioSampleWriter;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "writeAudioSamples: X: offset: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, v1, Lcom/xiaomi/camera/liveshot/writer/AudioSampleWriter;->mAudioSnapshot:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;

    iget-wide v3, v1, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->offset:J

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    return-void
.end method
