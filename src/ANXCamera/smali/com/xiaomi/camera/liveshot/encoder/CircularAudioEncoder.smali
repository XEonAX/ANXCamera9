.class public Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;
.super Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;
.source "CircularAudioEncoder.java"


# static fields
.field private static DEBUG:Z = false

.field private static final NOTIFICATION_PERIOD_SAMPLE_COUNT:I = 0x5a0

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mAudioRecord:Landroid/media/AudioRecord;

.field private final mAudioRecordBufferSize:I

.field private final mChannelCount:I

.field private final mFrameBytes:I

.field private final mNotificationPeriod:I

.field private mSampleBuffer:[B

.field private mSampleCount:J

.field private final mSampleRate:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 20
    const-class v0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->TAG:Ljava/lang/String;

    .line 21
    const/4 v0, 0x1

    sput-boolean v0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->DEBUG:Z

    return-void
.end method

.method public constructor <init>(Landroid/media/MediaFormat;JJ)V
    .locals 6

    .line 37
    invoke-direct/range {p0 .. p5}, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;-><init>(Landroid/media/MediaFormat;JJ)V

    .line 39
    iget-object p1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mDesiredMediaFormat:Landroid/media/MediaFormat;

    const-string p2, "sample-rate"

    invoke-virtual {p1, p2}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mSampleRate:I

    .line 40
    iget-object p1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mDesiredMediaFormat:Landroid/media/MediaFormat;

    const-string p2, "channel-count"

    invoke-virtual {p1, p2}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mChannelCount:I

    .line 42
    iget-object p1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mDesiredMediaFormat:Landroid/media/MediaFormat;

    const-string p2, "pcm-encoding"

    invoke-virtual {p1, p2}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v4

    .line 43
    invoke-direct {p0, v4}, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->sampleBytes(I)I

    move-result p1

    iget p2, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mChannelCount:I

    mul-int/2addr p1, p2

    iput p1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mFrameBytes:I

    .line 44
    const/16 p1, 0x5a0

    iput p1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mNotificationPeriod:I

    .line 46
    iget p1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mNotificationPeriod:I

    iget p2, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mFrameBytes:I

    mul-int/2addr p1, p2

    mul-int/lit8 p1, p1, 0x4

    iget p2, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mSampleRate:I

    .line 47
    invoke-direct {p0}, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->channelConfig()I

    move-result p3

    invoke-static {p2, p3, v4}, Landroid/media/AudioRecord;->getMinBufferSize(III)I

    move-result p2

    .line 46
    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mAudioRecordBufferSize:I

    .line 49
    iget p1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mAudioRecordBufferSize:I

    new-array p1, p1, [B

    iput-object p1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mSampleBuffer:[B

    .line 50
    new-instance p1, Landroid/media/AudioRecord;

    iget v2, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mSampleRate:I

    .line 51
    invoke-direct {p0}, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->channelConfig()I

    move-result v3

    iget v5, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mAudioRecordBufferSize:I

    const/4 v1, 0x5

    move-object v0, p1

    invoke-direct/range {v0 .. v5}, Landroid/media/AudioRecord;-><init>(IIIII)V

    iput-object p1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mAudioRecord:Landroid/media/AudioRecord;

    .line 52
    iget-object p1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mAudioRecord:Landroid/media/AudioRecord;

    invoke-virtual {p1}, Landroid/media/AudioRecord;->getRecordingState()I

    move-result p1

    if-eqz p1, :cond_1

    .line 57
    const/4 p1, 0x0

    .line 59
    const/4 p2, 0x1

    :try_start_0
    const-string p3, "OMX.qcom.audio.encoder.aac"

    invoke-static {p3}, Landroid/media/MediaCodec;->createByCodecName(Ljava/lang/String;)Landroid/media/MediaCodec;

    move-result-object p3

    iput-object p3, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mMediaCodec:Landroid/media/MediaCodec;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 60
    nop

    .line 63
    nop

    .line 65
    move p1, p2

    goto :goto_0

    .line 61
    :catch_0
    move-exception p3

    .line 62
    sget-object p3, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->TAG:Ljava/lang/String;

    const-string p4, "HW AAC encoder not found fallback to default instead"

    invoke-static {p3, p4}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    :goto_0
    if-nez p1, :cond_0

    .line 67
    :try_start_1
    iget-object p1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mDesiredMediaFormat:Landroid/media/MediaFormat;

    const-string p3, "mime"

    invoke-virtual {p1, p3}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 68
    invoke-static {p1}, Landroid/media/MediaCodec;->createEncoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    move-result-object p1

    iput-object p1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mMediaCodec:Landroid/media/MediaCodec;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 71
    goto :goto_1

    .line 69
    :catch_1
    move-exception p1

    .line 70
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

    .line 74
    :cond_0
    :goto_1
    iput-boolean p2, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mIsInitialized:Z

    .line 75
    return-void

    .line 53
    :cond_1
    iget-object p1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mAudioRecord:Landroid/media/AudioRecord;

    invoke-virtual {p1}, Landroid/media/AudioRecord;->release()V

    .line 54
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Failed to initialize AudioRecord"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private addSampleCount(J)V
    .locals 2

    .line 191
    iget-wide v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mSampleCount:J

    add-long/2addr v0, p1

    iput-wide v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mSampleCount:J

    .line 192
    return-void
.end method

.method private channelConfig()I
    .locals 2

    .line 180
    iget v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mChannelCount:I

    const/16 v1, 0x10

    packed-switch v0, :pswitch_data_0

    .line 186
    return v1

    .line 184
    :pswitch_0
    const/16 v0, 0xc

    return v0

    .line 182
    :pswitch_1
    return v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private getPresentationTime(J)J
    .locals 4

    .line 195
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMicros(J)J

    move-result-wide v0

    iget-wide v2, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mSampleCount:J

    add-long/2addr v2, p1

    mul-long/2addr v0, v2

    iget p1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mSampleRate:I

    int-to-long p1, p1

    div-long/2addr v0, p1

    return-wide v0
.end method

.method private getSampleDataBytes()I
    .locals 1

    .line 199
    iget v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mFrameBytes:I

    return v0
.end method

.method private sampleBytes(I)I
    .locals 1

    .line 169
    packed-switch p1, :pswitch_data_0

    .line 175
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Specified Audio format is not supported."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 173
    :pswitch_0
    const/4 p1, 0x1

    return p1

    .line 171
    :pswitch_1
    const/4 p1, 0x2

    return p1

    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public doRelease()V
    .locals 4

    .line 154
    iget-boolean v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mIsInitialized:Z

    if-nez v0, :cond_0

    .line 155
    return-void

    .line 158
    :cond_0
    invoke-super {p0}, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->doRelease()V

    .line 160
    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mAudioRecord:Landroid/media/AudioRecord;

    invoke-virtual {v0}, Landroid/media/AudioRecord;->release()V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 163
    goto :goto_0

    .line 161
    :catch_0
    move-exception v0

    .line 162
    sget-object v1, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Meet exception when mAudioRecord.release(): "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 165
    :goto_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mIsInitialized:Z

    .line 166
    return-void
.end method

.method public doStart()V
    .locals 4

    .line 79
    sget-boolean v0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->DEBUG:Z

    if-eqz v0, :cond_0

    sget-object v0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->TAG:Ljava/lang/String;

    const-string v1, "start(): X"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    :cond_0
    iget-boolean v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mIsInitialized:Z

    if-nez v0, :cond_1

    .line 81
    sget-object v0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->TAG:Ljava/lang/String;

    const-string v1, "start(): not initialized yet"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    return-void

    .line 85
    :cond_1
    iget-boolean v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mIsBuffering:Z

    if-eqz v0, :cond_2

    .line 86
    sget-object v0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->TAG:Ljava/lang/String;

    const-string v1, "start(): encoder is already running"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 87
    return-void

    .line 90
    :cond_2
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mCircularBuffer:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$CyclicBuffer;

    invoke-virtual {v0}, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$CyclicBuffer;->clear()V

    .line 92
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    iget-object v1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mDesiredMediaFormat:Landroid/media/MediaFormat;

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3, v3, v2}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 93
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    new-instance v1, Landroid/os/Handler;

    iget-object v3, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mEncodingThread:Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;

    invoke-virtual {v3}, Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;->getLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v1, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    invoke-virtual {v0, p0, v1}, Landroid/media/MediaCodec;->setCallback(Landroid/media/MediaCodec$Callback;Landroid/os/Handler;)V

    .line 94
    invoke-super {p0}, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->doStart()V

    .line 96
    iput-boolean v2, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mIsBuffering:Z

    .line 97
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mCurrentPresentationTimeUs:J

    .line 100
    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mAudioRecord:Landroid/media/AudioRecord;

    invoke-virtual {v0}, Landroid/media/AudioRecord;->startRecording()V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 104
    nop

    .line 106
    sget-boolean v0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->DEBUG:Z

    if-eqz v0, :cond_3

    sget-object v0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->TAG:Ljava/lang/String;

    const-string v1, "start(): X"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 107
    :cond_3
    return-void

    .line 101
    :catch_0
    move-exception v0

    .line 102
    sget-object v1, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "startRecording(): failed "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 103
    return-void
.end method

.method public doStop()V
    .locals 5

    .line 111
    sget-boolean v0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->DEBUG:Z

    if-eqz v0, :cond_0

    sget-object v0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->TAG:Ljava/lang/String;

    const-string v1, "stop(): E"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 112
    :cond_0
    iget-boolean v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mIsInitialized:Z

    if-nez v0, :cond_1

    .line 113
    sget-object v0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->TAG:Ljava/lang/String;

    const-string v1, "stop(): not initialized yet"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 114
    return-void

    .line 117
    :cond_1
    iget-boolean v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mIsBuffering:Z

    if-nez v0, :cond_2

    .line 118
    return-void

    .line 121
    :cond_2
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mIsBuffering:Z

    .line 123
    invoke-super {p0}, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->doStop()V

    .line 125
    sget-boolean v0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->DEBUG:Z

    if-eqz v0, :cond_3

    sget-object v0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->TAG:Ljava/lang/String;

    const-string v1, "mAudioRecord.stop(): E"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 127
    :cond_3
    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mAudioRecord:Landroid/media/AudioRecord;

    invoke-virtual {v0}, Landroid/media/AudioRecord;->stop()V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 130
    goto :goto_0

    .line 128
    :catch_0
    move-exception v0

    .line 129
    sget-object v1, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Meet exception when mAudioRecord.stop(): "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 131
    :goto_0
    sget-boolean v0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->DEBUG:Z

    if-eqz v0, :cond_4

    sget-object v0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->TAG:Ljava/lang/String;

    const-string v1, "mAudioRecord.stop(): X"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 133
    :cond_4
    sget-boolean v0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->DEBUG:Z

    if-eqz v0, :cond_5

    sget-object v0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->TAG:Ljava/lang/String;

    const-string v1, "clear pending snapshot requests: E"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 134
    :cond_5
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 135
    iget-object v1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mSnapshots:Ljava/util/List;

    monitor-enter v1

    .line 136
    :try_start_1
    iget-object v2, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mSnapshots:Ljava/util/List;

    invoke-interface {v0, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 137
    iget-object v2, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mSnapshots:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 138
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 139
    sget-boolean v1, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->DEBUG:Z

    if-eqz v1, :cond_6

    sget-object v1, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->TAG:Ljava/lang/String;

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

    .line 140
    :cond_6
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_7

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;

    .line 142
    :try_start_2
    invoke-virtual {v1}, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->putEos()V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_1

    .line 145
    goto :goto_2

    .line 143
    :catch_1
    move-exception v1

    .line 144
    sget-object v2, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to putEos: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 146
    :goto_2
    goto :goto_1

    .line 147
    :cond_7
    sget-boolean v0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->DEBUG:Z

    if-eqz v0, :cond_8

    sget-object v0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->TAG:Ljava/lang/String;

    const-string v1, "clear pending snapshot requests: X"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 149
    :cond_8
    sget-boolean v0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->DEBUG:Z

    if-eqz v0, :cond_9

    sget-object v0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->TAG:Ljava/lang/String;

    const-string v1, "stop() X"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 150
    :cond_9
    return-void

    .line 138
    :catchall_0
    move-exception v0

    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v0
.end method

.method public onInputBufferAvailable(Landroid/media/MediaCodec;I)V
    .locals 11

    .line 204
    sget-boolean v0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->DEBUG:Z

    if-eqz v0, :cond_0

    sget-object v0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->TAG:Ljava/lang/String;

    const-string v1, "audioCodec.onInputBufferAvailable(): E"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 205
    :cond_0
    iget-boolean v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mIsBuffering:Z

    if-nez v0, :cond_1

    .line 206
    sget-object v0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->TAG:Ljava/lang/String;

    const-string v1, "audioCodec: already End of Stream"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 207
    const/4 v4, 0x0

    const/4 v5, 0x0

    const-wide/16 v6, 0x0

    const/4 v8, 0x4

    move-object v2, p1

    move v3, p2

    invoke-virtual/range {v2 .. v8}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 208
    return-void

    .line 211
    :cond_1
    sget-object v0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->TAG:Ljava/lang/String;

    const-string v1, "audioCodec.dequeueInputBuffer(): E"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 212
    invoke-virtual {p1, p2}, Landroid/media/MediaCodec;->getInputBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object p1

    .line 213
    sget-object v0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "audioCodec.dequeueInputBuffer("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "): X"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 215
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mAudioRecord:Landroid/media/AudioRecord;

    iget-object v1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mSampleBuffer:[B

    .line 216
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v2

    iget v3, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mNotificationPeriod:I

    iget v4, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mFrameBytes:I

    mul-int/2addr v3, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 215
    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3, v2}, Landroid/media/AudioRecord;->read([BII)I

    move-result v0

    .line 217
    if-eqz v0, :cond_6

    packed-switch v0, :pswitch_data_0

    .line 231
    nop

    .line 232
    sget-object v1, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->TAG:Ljava/lang/String;

    const-string v2, "audioCodec.queueInputBuffer(): E"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 233
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 234
    iget-object v1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mSampleBuffer:[B

    invoke-virtual {p1, v1, v3, v0}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 235
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result p1

    add-int v7, v3, p1

    .line 237
    invoke-direct {p0}, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->getSampleDataBytes()I

    move-result p1

    div-int p1, v7, p1

    .line 238
    int-to-long v0, p1

    invoke-direct {p0, v0, v1}, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->getPresentationTime(J)J

    move-result-wide v8

    .line 239
    iget-boolean p1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mIsBuffering:Z

    if-nez p1, :cond_2

    const/4 v3, 0x4

    .line 240
    :goto_0
    move v10, v3

    goto :goto_1

    .line 239
    :cond_2
    goto :goto_0

    .line 240
    :goto_1
    iget-object v4, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    const/4 v6, 0x0

    move v5, p2

    invoke-virtual/range {v4 .. v10}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 241
    invoke-direct {p0, v0, v1}, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->addSampleCount(J)V

    .line 242
    sget-object p1, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->TAG:Ljava/lang/String;

    const-string p2, "audioCodec.queueInputBuffer(): X"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 244
    sget-boolean p1, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->DEBUG:Z

    if-eqz p1, :cond_3

    sget-object p1, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->TAG:Ljava/lang/String;

    const-string p2, "audioCodec.onInputBufferAvailable(): X"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 245
    :cond_3
    return-void

    .line 219
    :pswitch_0
    sget-boolean p1, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->DEBUG:Z

    if-eqz p1, :cond_4

    sget-object p1, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->TAG:Ljava/lang/String;

    const-string p2, "  ERROR_BAD_VALUE"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 220
    :cond_4
    return-void

    .line 223
    :pswitch_1
    sget-boolean p1, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->DEBUG:Z

    if-eqz p1, :cond_5

    sget-object p1, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->TAG:Ljava/lang/String;

    const-string p2, "  ERROR_INVALID_OP"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 224
    :cond_5
    return-void

    .line 227
    :cond_6
    sget-boolean p1, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->DEBUG:Z

    if-eqz p1, :cond_7

    sget-object p1, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->TAG:Ljava/lang/String;

    const-string p2, "  END_OF_BUFFER"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 228
    :cond_7
    return-void

    :pswitch_data_0
    .packed-switch -0x3
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
