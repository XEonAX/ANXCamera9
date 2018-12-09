.class public Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;
.super Ljava/lang/Object;
.source "CircularMediaRecorder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingRequest;,
        Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingCallback;
    }
.end annotation


# static fields
.field private static final AUDIO_BIT_RATE:I = 0xfa00

.field private static final AUDIO_CHANNELS:I = 0x1

.field private static final AUDIO_FORMAT:I = 0x2

.field private static final AUDIO_MIME_TYPE:Ljava/lang/String; = "audio/mp4a-latm"

.field private static final AUDIO_SAMPLE_RATE:I = 0xac44

.field private static final BYTES_COPY_BUFFER_LENGTH:I = 0x800

.field private static final CAPTURE_DURATION_IN_MICROSECOND:J = 0x2dc6c0L

.field private static final DEBUG:Z = true

.field private static final MOVIE_FILE_FORMAT:I = 0x0

.field private static final PRE_CAPTURE_DURATION_IN_MICROSECOND:J = 0x16e360L

.field private static final SAVE_MICRO_VIDEO_IN_SDCARD:Z

.field private static final TAG:Ljava/lang/String;

.field private static final VIDEO_BIT_RATE:I = 0x1312d00

.field private static final VIDEO_FRAME_RATE:I = 0xf

.field private static final VIDEO_IFRAME_INTERVAL:F = 0.5f

.field private static final VIDEO_MIME_TYPE:Ljava/lang/String;


# instance fields
.field private final mCircularAudioEncoder:Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;

.field private final mCircularVideoEncoder:Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;

.field private mOrientationHint:I

.field private final mSavingRequestScheduler:Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 36
    const-class v0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->TAG:Ljava/lang/String;

    .line 39
    invoke-static {}, Lcom/android/camera/Util;->saveLiveShotMicroVideoInSdcard()Z

    move-result v0

    sput-boolean v0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->SAVE_MICRO_VIDEO_IN_SDCARD:Z

    .line 62
    const/4 v0, 0x6

    invoke-static {v0}, Landroid/media/CamcorderProfile;->get(I)Landroid/media/CamcorderProfile;

    move-result-object v0

    .line 63
    const-string v1, "QUALITY_1080P_PROFILE"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "    audioBitRate: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Landroid/media/CamcorderProfile;->audioBitRate:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    const-string v1, "QUALITY_1080P_PROFILE"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "   audioChannels: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Landroid/media/CamcorderProfile;->audioChannels:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    const-string v1, "QUALITY_1080P_PROFILE"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, " audioSampleRate: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Landroid/media/CamcorderProfile;->audioSampleRate:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    const-string v1, "QUALITY_1080P_PROFILE"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "      audioCodec: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Landroid/media/CamcorderProfile;->audioCodec:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    const-string v1, "QUALITY_1080P_PROFILE"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, " videoFrameWidth: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    const-string v1, "QUALITY_1080P_PROFILE"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "videoFrameHeight: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 69
    const-string v1, "QUALITY_1080P_PROFILE"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "    videoBitRate: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Landroid/media/CamcorderProfile;->videoBitRate:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    const-string v1, "QUALITY_1080P_PROFILE"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "  videoFrameRate: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Landroid/media/CamcorderProfile;->videoFrameRate:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 71
    const-string v1, "QUALITY_1080P_PROFILE"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "      videoCodec: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Landroid/media/CamcorderProfile;->videoCodec:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 72
    const-string v1, "QUALITY_1080P_PROFILE"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "        duration: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, v0, Landroid/media/CamcorderProfile;->duration:I

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    invoke-static {}, Lcom/android/camera/CameraSettings;->getVideoEncoder()I

    move-result v0

    const/4 v1, 0x5

    if-ne v0, v1, :cond_0

    .line 80
    invoke-static {}, Lcom/xiaomi/camera/liveshot/MediaCodecCapability;->isH265EncodingSupported()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 81
    const-string v0, "video/hevc"

    sput-object v0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->VIDEO_MIME_TYPE:Ljava/lang/String;

    goto :goto_0

    .line 83
    :cond_0
    const-string v0, "video/avc"

    sput-object v0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->VIDEO_MIME_TYPE:Ljava/lang/String;

    .line 85
    :goto_0
    return-void
.end method

.method public constructor <init>(IILandroid/opengl/EGLContext;Z)V
    .locals 8

    .line 104
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 101
    const/4 v0, 0x0

    iput v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mOrientationHint:I

    .line 105
    new-instance v0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;

    .line 106
    invoke-static {p1, p2}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->createVideoFormat(II)Landroid/media/MediaFormat;

    move-result-object v2

    const-wide/32 v4, 0x2dc6c0

    const-wide/32 v6, 0x16e360

    move-object v1, v0

    move-object v3, p3

    invoke-direct/range {v1 .. v7}, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;-><init>(Landroid/media/MediaFormat;Landroid/opengl/EGLContext;JJ)V

    iput-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mCircularVideoEncoder:Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;

    .line 112
    if-eqz p4, :cond_0

    .line 113
    new-instance v6, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;

    const v0, 0xac44

    const/4 v1, 0x1

    .line 114
    invoke-static {v0, v1}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->createAudioFormat(II)Landroid/media/MediaFormat;

    move-result-object v1

    const-wide/32 v2, 0x2dc6c0

    const-wide/32 v4, 0x16e360

    move-object v0, v6

    invoke-direct/range {v0 .. v5}, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;-><init>(Landroid/media/MediaFormat;JJ)V

    iput-object v6, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mCircularAudioEncoder:Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;

    goto :goto_0

    .line 119
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mCircularAudioEncoder:Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;

    .line 123
    :goto_0
    new-instance v0, Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler;

    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler;-><init>(Ljava/util/concurrent/ExecutorService;)V

    iput-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mSavingRequestScheduler:Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler;

    .line 124
    return-void
.end method

.method static synthetic access$100()Ljava/lang/String;
    .locals 1

    .line 35
    sget-object v0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200()Z
    .locals 1

    .line 35
    sget-boolean v0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->SAVE_MICRO_VIDEO_IN_SDCARD:Z

    return v0
.end method

.method private static createAudioFormat(II)Landroid/media/MediaFormat;
    .locals 3

    .line 432
    const-string v0, "audio/mp4a-latm"

    invoke-static {v0, p0, p1}, Landroid/media/MediaFormat;->createAudioFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    move-result-object p0

    .line 433
    const-string v0, "aac-profile"

    const/4 v1, 0x2

    invoke-virtual {p0, v0, v1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 434
    const-string v0, "bitrate"

    const v2, 0xfa00

    invoke-virtual {p0, v0, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 435
    const-string v0, "channel-count"

    invoke-virtual {p0, v0, p1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 436
    const-string p1, "pcm-encoding"

    invoke-virtual {p0, p1, v1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 437
    return-object p0
.end method

.method private static createVideoFormat(II)Landroid/media/MediaFormat;
    .locals 1

    .line 441
    sget-object v0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->VIDEO_MIME_TYPE:Ljava/lang/String;

    invoke-static {v0, p0, p1}, Landroid/media/MediaFormat;->createVideoFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    move-result-object p0

    .line 442
    const-string p1, "color-format"

    const v0, 0x7f000789

    invoke-virtual {p0, p1, v0}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 443
    const-string p1, "bitrate"

    const v0, 0x1312d00

    invoke-virtual {p0, p1, v0}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 444
    const-string p1, "frame-rate"

    const/16 v0, 0xf

    invoke-virtual {p0, p1, v0}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 445
    const-string p1, "i-frame-interval"

    const/high16 v0, 0x3f000000    # 0.5f

    invoke-virtual {p0, p1, v0}, Landroid/media/MediaFormat;->setFloat(Ljava/lang/String;F)V

    .line 446
    return-object p0
.end method


# virtual methods
.method public onSurfaceTextureUpdated(Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;)V
    .locals 1

    .line 162
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mCircularVideoEncoder:Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;

    if-eqz v0, :cond_0

    .line 163
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mCircularVideoEncoder:Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;

    invoke-virtual {v0, p1}, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->onSurfaceTextureUpdated(Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;)V

    .line 165
    :cond_0
    return-void
.end method

.method public release()V
    .locals 2

    .line 151
    sget-object v0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->TAG:Ljava/lang/String;

    const-string v1, "release(): E"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 152
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mCircularVideoEncoder:Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;

    if-eqz v0, :cond_0

    .line 153
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mCircularVideoEncoder:Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;

    invoke-virtual {v0}, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->release()V

    .line 155
    :cond_0
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mCircularAudioEncoder:Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;

    if-eqz v0, :cond_1

    .line 156
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mCircularAudioEncoder:Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;

    invoke-virtual {v0}, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->release()V

    .line 158
    :cond_1
    sget-object v0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->TAG:Ljava/lang/String;

    const-string v1, "release(): X"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 159
    return-void
.end method

.method public setFilterId(I)V
    .locals 1

    .line 168
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mCircularVideoEncoder:Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;

    if-eqz v0, :cond_0

    .line 169
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mCircularVideoEncoder:Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;

    invoke-virtual {v0, p1}, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->setFilterId(I)V

    .line 171
    :cond_0
    return-void
.end method

.method public setOrientationHint(I)V
    .locals 3

    .line 174
    iput p1, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mOrientationHint:I

    .line 175
    sget-object v0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setOrientationHint(): mOrientationHint = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 176
    return-void
.end method

.method public snapshot(ILcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingCallback;)V
    .locals 7

    .line 179
    new-instance v6, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingRequest;

    .line 180
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mCircularAudioEncoder:Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 181
    move-object v2, v1

    goto :goto_0

    .line 180
    :cond_0
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mCircularAudioEncoder:Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;

    invoke-virtual {v0}, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->snapshot()Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;

    move-result-object v0

    .line 181
    move-object v2, v0

    :goto_0
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mCircularVideoEncoder:Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;

    if-nez v0, :cond_1

    .line 182
    move-object v3, v1

    goto :goto_1

    .line 181
    :cond_1
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mCircularVideoEncoder:Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;

    invoke-virtual {v0}, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->snapshot()Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;

    move-result-object v0

    .line 182
    move-object v3, v0

    :goto_1
    const/4 v0, -0x1

    if-ne p1, v0, :cond_2

    iget p1, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mOrientationHint:I

    :cond_2
    const/4 v5, 0x0

    move-object v0, v6

    move-object v1, v2

    move-object v2, v3

    move v3, p1

    move-object v4, p2

    invoke-direct/range {v0 .. v5}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingRequest;-><init>(Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;ILcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingCallback;Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$1;)V

    .line 184
    iget-object p1, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mSavingRequestScheduler:Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler;

    invoke-virtual {p1, v6}, Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler;->submit(Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler$Cancellable;)V

    .line 185
    return-void
.end method

.method public start()V
    .locals 2

    .line 127
    sget-object v0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->TAG:Ljava/lang/String;

    const-string v1, "start(): E"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 128
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mCircularVideoEncoder:Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;

    if-eqz v0, :cond_0

    .line 129
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mCircularVideoEncoder:Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;

    invoke-virtual {v0}, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->start()V

    .line 131
    :cond_0
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mCircularAudioEncoder:Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;

    if-eqz v0, :cond_1

    .line 132
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mCircularAudioEncoder:Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;

    invoke-virtual {v0}, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->start()V

    .line 134
    :cond_1
    sget-object v0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->TAG:Ljava/lang/String;

    const-string v1, "start(): X"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 135
    return-void
.end method

.method public stop()V
    .locals 2

    .line 138
    sget-object v0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->TAG:Ljava/lang/String;

    const-string v1, "stop(): E"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 139
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mSavingRequestScheduler:Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler;

    invoke-virtual {v0}, Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler;->abortRemainingTasks()V

    .line 141
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mCircularVideoEncoder:Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;

    if-eqz v0, :cond_0

    .line 142
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mCircularVideoEncoder:Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;

    invoke-virtual {v0}, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->stop()V

    .line 144
    :cond_0
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mCircularAudioEncoder:Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;

    if-eqz v0, :cond_1

    .line 145
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mCircularAudioEncoder:Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;

    invoke-virtual {v0}, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->stop()V

    .line 147
    :cond_1
    sget-object v0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->TAG:Ljava/lang/String;

    const-string v1, "stop(): X"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 148
    return-void
.end method
