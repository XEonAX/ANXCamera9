.class public Lcom/android/camera/module/VideoModule;
.super Lcom/android/camera/module/VideoBase;
.source "VideoModule.java"

# interfaces
.implements Landroid/media/MediaRecorder$OnErrorListener;
.implements Landroid/media/MediaRecorder$OnInfoListener;
.implements Lcom/android/camera/protocol/ModeProtocol$AutoZoomModuleProtocol;
.implements Lcom/android/camera/ui/ObjectView$ObjectViewListener;
.implements Lcom/android/camera2/Camera2Proxy$VideoRecordStateCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/module/VideoModule$JpegPictureCallback;
    }
.end annotation


# static fields
.field private static final HEVC_VIDEO_ENCODER_BITRATE:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final MAX_DURATION_4K:I = 0x75300

.field private static final RESET_VIDEO_AUTO_FOCUS_TIME:I = 0xbb8

.field public static final SIZE_1080:Landroid/util/Size;

.field public static final SIZE_720:Landroid/util/Size;

.field private static final START_OFFSET_MS:J = 0x1c2L

.field private static final VIDEO_HFR_FRAME_RATE_120:I = 0x78

.field private static final VIDEO_HFR_FRAME_RATE_240:I = 0xf0

.field public static final VIDEO_MAX_SINGLE_FILE_SIZE:J = 0xdac00000L

.field public static final VIDEO_MIN_SINGLE_FILE_SIZE:J

.field private static final VIDEO_NORMAL_FRAME_RATE:I = 0x1e


# instance fields
.field private isAutoZoomTracking:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private mAutoZoomDataDisposable:Lio/reactivex/disposables/Disposable;

.field private mAutoZoomEmitter:Lio/reactivex/FlowableEmitter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/FlowableEmitter<",
            "Landroid/hardware/camera2/CaptureResult;",
            ">;"
        }
    .end annotation
.end field

.field private mAutoZoomUiDisposable:Lio/reactivex/disposables/Disposable;

.field private mAutoZoomViewProtocol:Lcom/android/camera/protocol/ModeProtocol$AutoZoomViewProtocol;

.field private mCaptureTimeLapse:Z

.field private mCountDownTimer:Landroid/os/CountDownTimer;

.field private volatile mCurrentFileNumber:I

.field private mDumpOrig960:Ljava/lang/Boolean;

.field private mFovcEnabled:Z

.field private mFrameRate:I

.field private mHfrFPSLower:I

.field private mHfrFPSUpper:I

.field private final mLock:Ljava/lang/Object;

.field private mMediaRecorder:Landroid/media/MediaRecorder;

.field private mMediaRecorderPostProcessing:Z

.field private mMediaRecorderWorking:Z

.field private mNextVideoFileName:Ljava/lang/String;

.field private mNextVideoValues:Landroid/content/ContentValues;

.field private mPauseClickTime:J

.field private volatile mPendingStopRecorder:Z

.field private mProfile:Landroid/media/CamcorderProfile;

.field private mQuality:I

.field private mQuickCapture:Z

.field private mRecorderSurface:Landroid/view/Surface;

.field private mRecordingTime:Ljava/lang/String;

.field private mRecordingTimeCountsDown:Z

.field private mSlowModeFps:Ljava/lang/String;

.field private mSnapshotInProgress:Z

.field private mSpeed:Ljava/lang/String;

.field private mSplitWhenReachMaxSize:Z

.field private mStopRecorderDone:Ljava/util/concurrent/CountDownLatch;

.field private mTimeBetweenTimeLapseFrameCaptureMs:I

.field private mTopAlert:Lcom/android/camera/protocol/ModeProtocol$TopAlert;

.field private mVideoRecordTime:J

.field private mVideoRecordedDuration:J


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 133
    nop

    .line 134
    const-wide/32 v0, 0x800000

    const-wide/32 v2, 0x3200000

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    sput-wide v0, Lcom/android/camera/module/VideoModule;->VIDEO_MIN_SINGLE_FILE_SIZE:J

    .line 141
    new-instance v0, Landroid/util/Size;

    const/16 v1, 0x780

    const/16 v2, 0x438

    invoke-direct {v0, v1, v2}, Landroid/util/Size;-><init>(II)V

    sput-object v0, Lcom/android/camera/module/VideoModule;->SIZE_1080:Landroid/util/Size;

    .line 142
    new-instance v0, Landroid/util/Size;

    const/16 v1, 0x500

    const/16 v2, 0x2d0

    invoke-direct {v0, v1, v2}, Landroid/util/Size;-><init>(II)V

    sput-object v0, Lcom/android/camera/module/VideoModule;->SIZE_720:Landroid/util/Size;

    .line 196
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/android/camera/module/VideoModule;->HEVC_VIDEO_ENCODER_BITRATE:Ljava/util/HashMap;

    .line 202
    sget-object v0, Lcom/android/camera/module/VideoModule;->HEVC_VIDEO_ENCODER_BITRATE:Ljava/util/HashMap;

    const-string v1, "3840x2160:30"

    const v2, 0x24b76a0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 203
    sget-object v0, Lcom/android/camera/module/VideoModule;->HEVC_VIDEO_ENCODER_BITRATE:Ljava/util/HashMap;

    const-string v1, "1920x1080:30"

    const v2, 0xeafc40

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 204
    sget-object v0, Lcom/android/camera/module/VideoModule;->HEVC_VIDEO_ENCODER_BITRATE:Ljava/util/HashMap;

    const-string v1, "1280x720:30"

    const v2, 0xa47d60

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 205
    sget-object v0, Lcom/android/camera/module/VideoModule;->HEVC_VIDEO_ENCODER_BITRATE:Ljava/util/HashMap;

    const-string v1, "720x480:30"

    const v2, 0x150e00

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 206
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 209
    const-class v0, Lcom/android/camera/module/VideoModule;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera/module/VideoBase;-><init>(Ljava/lang/String;)V

    .line 171
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/android/camera/module/VideoModule;->isAutoZoomTracking:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 176
    iput v1, p0, Lcom/android/camera/module/VideoModule;->mTimeBetweenTimeLapseFrameCaptureMs:I

    .line 178
    const-string v0, "normal"

    iput-object v0, p0, Lcom/android/camera/module/VideoModule;->mSpeed:Ljava/lang/String;

    .line 180
    const/4 v0, 0x5

    iput v0, p0, Lcom/android/camera/module/VideoModule;->mQuality:I

    .line 182
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/android/camera/module/VideoModule;->mPauseClickTime:J

    .line 188
    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v2, p0, Lcom/android/camera/module/VideoModule;->mLock:Ljava/lang/Object;

    .line 190
    iput-wide v0, p0, Lcom/android/camera/module/VideoModule;->mVideoRecordTime:J

    .line 191
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/module/VideoModule;->mDumpOrig960:Ljava/lang/Boolean;

    .line 210
    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/module/VideoModule;Lcom/android/camera2/autozoom/AutoZoomCaptureResult;)V
    .locals 0

    .line 126
    invoke-direct {p0, p1}, Lcom/android/camera/module/VideoModule;->consumeAutoZoomData(Lcom/android/camera2/autozoom/AutoZoomCaptureResult;)V

    return-void
.end method

.method static synthetic access$1000(Lcom/android/camera/module/VideoModule;)I
    .locals 0

    .line 126
    iget p0, p0, Lcom/android/camera/module/VideoModule;->mQuality:I

    return p0
.end method

.method static synthetic access$102(Lcom/android/camera/module/VideoModule;Lio/reactivex/FlowableEmitter;)Lio/reactivex/FlowableEmitter;
    .locals 0

    .line 126
    iput-object p1, p0, Lcom/android/camera/module/VideoModule;->mAutoZoomEmitter:Lio/reactivex/FlowableEmitter;

    return-object p1
.end method

.method static synthetic access$1100(Lcom/android/camera/module/VideoModule;)I
    .locals 0

    .line 126
    iget p0, p0, Lcom/android/camera/module/VideoModule;->mFrameRate:I

    return p0
.end method

.method static synthetic access$1200(Lcom/android/camera/module/VideoModule;)Z
    .locals 0

    .line 126
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isFPS960()Z

    move-result p0

    return p0
.end method

.method static synthetic access$1300(Lcom/android/camera/module/VideoModule;)Z
    .locals 0

    .line 126
    iget-boolean p0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderPostProcessing:Z

    return p0
.end method

.method static synthetic access$1400(Lcom/android/camera/module/VideoModule;)Z
    .locals 0

    .line 126
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isActivityResumed()Z

    move-result p0

    return p0
.end method

.method static synthetic access$1500(Lcom/android/camera/module/VideoModule;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 126
    invoke-direct {p0, p1}, Lcom/android/camera/module/VideoModule;->postProcessVideo(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1600(Lcom/android/camera/module/VideoModule;)Lcom/android/camera/protocol/ModeProtocol$AutoZoomViewProtocol;
    .locals 0

    .line 126
    iget-object p0, p0, Lcom/android/camera/module/VideoModule;->mAutoZoomViewProtocol:Lcom/android/camera/protocol/ModeProtocol$AutoZoomViewProtocol;

    return-object p0
.end method

.method static synthetic access$1700(Lcom/android/camera/module/VideoModule;)V
    .locals 0

    .line 126
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->notifyAutoZoomStartUiHint()V

    return-void
.end method

.method static synthetic access$1800(Lcom/android/camera/module/VideoModule;)V
    .locals 0

    .line 126
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->notifyAutoZoomStopUiHint()V

    return-void
.end method

.method static synthetic access$1900(Lcom/android/camera/module/VideoModule;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 0

    .line 126
    iget-object p0, p0, Lcom/android/camera/module/VideoModule;->isAutoZoomTracking:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-object p0
.end method

.method static synthetic access$200(Lcom/android/camera/module/VideoModule;)Lcom/android/camera/protocol/ModeProtocol$TopAlert;
    .locals 0

    .line 126
    iget-object p0, p0, Lcom/android/camera/module/VideoModule;->mTopAlert:Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    return-object p0
.end method

.method static synthetic access$2002(Lcom/android/camera/module/VideoModule;Z)Z
    .locals 0

    .line 126
    iput-boolean p1, p0, Lcom/android/camera/module/VideoModule;->mSnapshotInProgress:Z

    return p1
.end method

.method static synthetic access$2100(Lcom/android/camera/module/VideoModule;I)Z
    .locals 0

    .line 126
    invoke-direct {p0, p1}, Lcom/android/camera/module/VideoModule;->needImageThumbnail(I)Z

    move-result p0

    return p0
.end method

.method static synthetic access$300(Lcom/android/camera/module/VideoModule;)V
    .locals 0

    .line 126
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->onMediaRecorderReleased()V

    return-void
.end method

.method static synthetic access$400(Lcom/android/camera/module/VideoModule;)Ljava/util/concurrent/CountDownLatch;
    .locals 0

    .line 126
    iget-object p0, p0, Lcom/android/camera/module/VideoModule;->mStopRecorderDone:Ljava/util/concurrent/CountDownLatch;

    return-object p0
.end method

.method static synthetic access$402(Lcom/android/camera/module/VideoModule;Ljava/util/concurrent/CountDownLatch;)Ljava/util/concurrent/CountDownLatch;
    .locals 0

    .line 126
    iput-object p1, p0, Lcom/android/camera/module/VideoModule;->mStopRecorderDone:Ljava/util/concurrent/CountDownLatch;

    return-object p1
.end method

.method static synthetic access$500(Lcom/android/camera/module/VideoModule;)Ljava/lang/String;
    .locals 0

    .line 126
    iget-object p0, p0, Lcom/android/camera/module/VideoModule;->mSpeed:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$600(Lcom/android/camera/module/VideoModule;)Landroid/media/MediaRecorder;
    .locals 0

    .line 126
    iget-object p0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;

    return-object p0
.end method

.method static synthetic access$700(Lcom/android/camera/module/VideoModule;)V
    .locals 0

    .line 126
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->releaseMediaRecorder()V

    return-void
.end method

.method static synthetic access$800(Lcom/android/camera/module/VideoModule;)Z
    .locals 0

    .line 126
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isFPS120()Z

    move-result p0

    return p0
.end method

.method static synthetic access$900(Lcom/android/camera/module/VideoModule;)Z
    .locals 0

    .line 126
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isFPS240()Z

    move-result p0

    return p0
.end method

.method private consumeAutoZoomData(Lcom/android/camera2/autozoom/AutoZoomCaptureResult;)V
    .locals 1

    .line 345
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 348
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mAutoZoomViewProtocol:Lcom/android/camera/protocol/ModeProtocol$AutoZoomViewProtocol;

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$AutoZoomViewProtocol;->feedData(Lcom/android/camera2/autozoom/AutoZoomCaptureResult;)V

    .line 349
    return-void

    .line 346
    :cond_1
    :goto_0
    return-void
.end method

.method private convertSizeToQuality(Ljava/lang/String;)I
    .locals 4

    .line 772
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v0

    const v1, -0x6683aa6a

    const/4 v2, -0x1

    if-eq v0, v1, :cond_1

    const v1, 0x2fce7329

    if-eq v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const-string v0, "1920x1080"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    const-string v0, "1280x720"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x1

    goto :goto_1

    :cond_2
    :goto_0
    move v0, v2

    :goto_1
    packed-switch v0, :pswitch_data_0

    .line 778
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "unexpected hfr video size "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 779
    return v2

    .line 776
    :pswitch_0
    const/4 p1, 0x5

    return p1

    .line 774
    :pswitch_1
    const/4 p1, 0x6

    return p1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private countDownForVideoBokeh()V
    .locals 7

    .line 1470
    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    if-nez v0, :cond_0

    .line 1471
    return-void

    .line 1474
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCountDownTimer:Landroid/os/CountDownTimer;

    if-eqz v0, :cond_1

    .line 1475
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCountDownTimer:Landroid/os/CountDownTimer;

    invoke-virtual {v0}, Landroid/os/CountDownTimer;->cancel()V

    .line 1478
    :cond_1
    new-instance v0, Lcom/android/camera/module/VideoModule$5;

    const-wide/16 v3, 0x76f2

    const-wide/16 v5, 0x3e8

    move-object v1, v0

    move-object v2, p0

    invoke-direct/range {v1 .. v6}, Lcom/android/camera/module/VideoModule$5;-><init>(Lcom/android/camera/module/VideoModule;JJ)V

    iput-object v0, p0, Lcom/android/camera/module/VideoModule;->mCountDownTimer:Landroid/os/CountDownTimer;

    .line 1494
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCountDownTimer:Landroid/os/CountDownTimer;

    invoke-virtual {v0}, Landroid/os/CountDownTimer;->start()Landroid/os/CountDownTimer;

    .line 1495
    return-void
.end method

.method private forceToNormalMode()V
    .locals 3

    .line 724
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    .line 725
    const-string v1, "pref_video_speed_key"

    const-string v2, "normal"

    invoke-interface {v0, v1, v2}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 726
    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 727
    const-string v0, "normal"

    iput-object v0, p0, Lcom/android/camera/module/VideoModule;->mSpeed:Ljava/lang/String;

    .line 728
    return-void
.end method

.method private getHSRValue()I
    .locals 3

    .line 743
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    const-string v1, "pref_camera_hsr_value_key"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/config/DataItemConfig;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 746
    const/4 v1, 0x0

    if-eqz v0, :cond_5

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_5

    const-string v2, "off"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_1

    .line 750
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isBeautyOn()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 751
    return v1

    .line 754
    :cond_1
    invoke-static {}, Lcom/android/camera/CameraSettings;->isVideoBokehOn()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 755
    return v1

    .line 759
    :cond_2
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isFastMotionModule()Z

    move-result v2

    if-nez v2, :cond_4

    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isSlowMotionModule()Z

    move-result v2

    if-eqz v2, :cond_3

    goto :goto_0

    .line 763
    :cond_3
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    return v0

    .line 760
    :cond_4
    :goto_0
    return v1

    .line 747
    :cond_5
    :goto_1
    return v1
.end method

.method private getHevcVideoEncoderBitRate(Landroid/media/CamcorderProfile;)I
    .locals 4

    .line 1198
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget v1, p1, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p1, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p1, Landroid/media/CamcorderProfile;->videoFrameRate:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1200
    sget-object v1, Lcom/android/camera/module/VideoModule;->HEVC_VIDEO_ENCODER_BITRATE:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1201
    sget-object p1, Lcom/android/camera/module/VideoModule;->HEVC_VIDEO_ENCODER_BITRATE:Ljava/util/HashMap;

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    goto :goto_0

    .line 1203
    :cond_0
    sget-object v1, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "no pre-defined bitrate for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1204
    iget p1, p1, Landroid/media/CamcorderProfile;->videoBitRate:I

    .line 1206
    :goto_0
    return p1
.end method

.method private getHfrSetting()Ljava/lang/String;
    .locals 3

    .line 702
    invoke-static {}, Lcom/android/camera/CameraSettings;->getHfrSetting()Ljava/lang/String;

    move-result-object v0

    .line 703
    iget v1, p0, Lcom/android/camera/module/VideoModule;->mBogusCameraId:I

    invoke-static {v1}, Lcom/android/camera/CameraSettings;->getSupportedHfrSettings(I)Ljava/util/ArrayList;

    move-result-object v1

    .line 704
    if-eqz v1, :cond_0

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 705
    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 707
    :cond_0
    return-object v0
.end method

.method private getOperationModeForPreview()I
    .locals 2

    .line 2682
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    const-string v1, "pref_camera_auto_zoom"

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v0

    .line 2683
    nop

    .line 2684
    if-eqz v0, :cond_0

    .line 2685
    const v0, 0x80f4

    goto :goto_0

    .line 2687
    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private getRecorderMaxFileSize(I)J
    .locals 6

    .line 1210
    invoke-static {}, Lcom/android/camera/storage/Storage;->getLeftSpace()J

    move-result-wide v0

    const-wide/32 v2, 0x3200000

    sub-long/2addr v0, v2

    .line 1211
    if-lez p1, :cond_0

    int-to-long v2, p1

    cmp-long p1, v2, v0

    if-gez p1, :cond_0

    .line 1212
    nop

    .line 1214
    move-wide v0, v2

    :cond_0
    const-wide v2, 0xdac00000L

    cmp-long p1, v0, v2

    if-lez p1, :cond_1

    .line 1215
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p1

    invoke-virtual {p1}, Lcom/mi/config/a;->fk()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 1216
    nop

    .line 1220
    move-wide v0, v2

    goto :goto_0

    .line 1217
    :cond_1
    sget-wide v2, Lcom/android/camera/module/VideoModule;->VIDEO_MIN_SINGLE_FILE_SIZE:J

    cmp-long p1, v0, v2

    if-gez p1, :cond_2

    .line 1218
    sget-wide v0, Lcom/android/camera/module/VideoModule;->VIDEO_MIN_SINGLE_FILE_SIZE:J

    .line 1220
    :cond_2
    :goto_0
    iget-wide v2, p0, Lcom/android/camera/module/VideoModule;->mIntentRequestSize:J

    const-wide/16 v4, 0x0

    cmp-long p1, v2, v4

    if-lez p1, :cond_3

    iget-wide v2, p0, Lcom/android/camera/module/VideoModule;->mIntentRequestSize:J

    cmp-long p1, v2, v0

    if-gez p1, :cond_3

    .line 1221
    iget-wide v0, p0, Lcom/android/camera/module/VideoModule;->mIntentRequestSize:J

    .line 1223
    :cond_3
    return-wide v0
.end method

.method private getRecorderOrientationHint()I
    .locals 3

    .line 1239
    nop

    .line 1240
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->getSensorOrientation()I

    move-result v0

    .line 1241
    iget v1, p0, Lcom/android/camera/module/VideoModule;->mOrientation:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    .line 1242
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isFrontCamera()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1243
    iget v1, p0, Lcom/android/camera/module/VideoModule;->mOrientation:I

    sub-int/2addr v0, v1

    add-int/lit16 v0, v0, 0x168

    rem-int/lit16 v0, v0, 0x168

    goto :goto_0

    .line 1245
    :cond_0
    iget v1, p0, Lcom/android/camera/module/VideoModule;->mOrientation:I

    add-int/2addr v0, v1

    rem-int/lit16 v0, v0, 0x168

    goto :goto_0

    .line 1248
    :cond_1
    nop

    .line 1250
    :goto_0
    return v0
.end method

.method private getSpeedRecordVideoLength(JD)J
    .locals 2

    .line 1890
    const-wide/16 v0, 0x0

    cmpl-double v0, p3, v0

    if-nez v0, :cond_0

    .line 1891
    const-wide/16 p1, 0x0

    return-wide p1

    .line 1895
    :cond_0
    long-to-double p1, p1

    div-double/2addr p1, p3

    .line 1896
    nop

    .line 1897
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->getNormalVideoFrameRate()I

    move-result p3

    int-to-double p3, p3

    div-double/2addr p1, p3

    const-wide p3, 0x408f400000000000L    # 1000.0

    mul-double/2addr p1, p3

    double-to-long p1, p1

    .line 1896
    return-wide p1
.end method

.method private initAutoZoom()V
    .locals 2

    .line 312
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fA()Z

    move-result v0

    if-nez v0, :cond_0

    .line 313
    return-void

    .line 316
    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    const-string v1, "pref_camera_auto_zoom"

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v0

    .line 317
    if-eqz v0, :cond_1

    .line 318
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->startAutoZoom()V

    goto :goto_0

    .line 320
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->stopAutoZoom()V

    .line 322
    :goto_0
    new-instance v0, Lcom/android/camera/module/VideoModule$3;

    invoke-direct {v0, p0}, Lcom/android/camera/module/VideoModule$3;-><init>(Lcom/android/camera/module/VideoModule;)V

    sget-object v1, Lio/reactivex/BackpressureStrategy;->DROP:Lio/reactivex/BackpressureStrategy;

    invoke-static {v0, v1}, Lio/reactivex/Flowable;->create(Lio/reactivex/FlowableOnSubscribe;Lio/reactivex/BackpressureStrategy;)Lio/reactivex/Flowable;

    move-result-object v0

    sget-object v1, Lcom/android/camera/constant/GlobalConstant;->sCameraSetupScheduler:Lio/reactivex/Scheduler;

    .line 328
    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Flowable;

    move-result-object v0

    new-instance v1, Lcom/android/camera/module/VideoModule$2;

    invoke-direct {v1, p0}, Lcom/android/camera/module/VideoModule$2;-><init>(Lcom/android/camera/module/VideoModule;)V

    .line 329
    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Flowable;

    move-result-object v0

    .line 335
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Flowable;

    move-result-object v0

    new-instance v1, Lcom/android/camera/module/VideoModule$1;

    invoke-direct {v1, p0}, Lcom/android/camera/module/VideoModule$1;-><init>(Lcom/android/camera/module/VideoModule;)V

    .line 336
    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->subscribe(Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/VideoModule;->mAutoZoomDataDisposable:Lio/reactivex/disposables/Disposable;

    .line 342
    return-void
.end method

.method private initRecorderSurface()V
    .locals 1

    .line 352
    invoke-static {}, Landroid/media/MediaCodec;->createPersistentInputSurface()Landroid/view/Surface;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/VideoModule;->mRecorderSurface:Landroid/view/Surface;

    .line 353
    return-void
.end method

.method private initializeObjectTrack(Landroid/graphics/RectF;Z)Z
    .locals 1

    .line 2052
    invoke-virtual {p0, p1}, Lcom/android/camera/module/VideoModule;->mapTapCoordinate(Ljava/lang/Object;)V

    .line 2053
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoModule;->stopObjectTracking(Z)V

    .line 2054
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-interface {v0, p1, p2}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->initializeObjectTrack(Landroid/graphics/RectF;Z)Z

    move-result p1

    return p1
.end method

.method private initializeRecorder(Z)Z
    .locals 10

    .line 1001
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v1, "initializeRecorder>>"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1002
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 1003
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v2

    .line 1004
    const/4 v3, 0x0

    if-nez v2, :cond_0

    .line 1005
    sget-object p1, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v0, "initializeRecorder: null host"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1006
    return v3

    .line 1009
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->closeVideoFileDescriptor()V

    .line 1010
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->cleanupEmptyFile()V

    .line 1012
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isCaptureIntent()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1013
    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/android/camera/module/VideoModule;->parseIntent(Landroid/content/Intent;)V

    .line 1015
    :cond_1
    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mVideoFileDescriptor:Landroid/os/ParcelFileDescriptor;

    if-nez v2, :cond_2

    .line 1016
    iget v2, p0, Lcom/android/camera/module/VideoModule;->mOutputFormat:I

    iget v4, p0, Lcom/android/camera/module/VideoModule;->mCurrentFileNumber:I

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isFPS960()Z

    move-result v5

    invoke-virtual {p0, v2, v4, v5, p1}, Lcom/android/camera/module/VideoModule;->genContentValues(IIZZ)Landroid/content/ContentValues;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoValues:Landroid/content/ContentValues;

    .line 1017
    iget-object p1, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoValues:Landroid/content/ContentValues;

    const-string v2, "_data"

    invoke-virtual {p1, v2}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoFilename:Ljava/lang/String;

    .line 1020
    :cond_2
    iget-object p1, p0, Lcom/android/camera/module/VideoModule;->mStopRecorderDone:Ljava/util/concurrent/CountDownLatch;

    if-eqz p1, :cond_3

    .line 1021
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 1023
    :try_start_0
    iget-object p1, p0, Lcom/android/camera/module/VideoModule;->mStopRecorderDone:Ljava/util/concurrent/CountDownLatch;

    const-wide/16 v6, 0x3e8

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p1, v6, v7, v2}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1026
    goto :goto_0

    .line 1024
    :catch_0
    move-exception p1

    .line 1025
    invoke-virtual {p1}, Ljava/lang/InterruptedException;->printStackTrace()V

    .line 1027
    :goto_0
    sget-object p1, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "initializeRecorder: waitTime="

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sub-long/2addr v6, v4

    invoke-virtual {v2, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1030
    :cond_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 1031
    nop

    .line 1032
    iget-object p1, p0, Lcom/android/camera/module/VideoModule;->mLock:Ljava/lang/Object;

    monitor-enter p1

    .line 1033
    :try_start_1
    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;

    if-nez v2, :cond_4

    .line 1034
    new-instance v2, Landroid/media/MediaRecorder;

    invoke-direct {v2}, Landroid/media/MediaRecorder;-><init>()V

    iput-object v2, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;

    goto :goto_1

    .line 1036
    :cond_4
    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v2}, Landroid/media/MediaRecorder;->reset()V

    .line 1037
    sget-boolean v2, Lcom/android/camera/module/VideoModule;->DEBUG:Z

    if-eqz v2, :cond_5

    .line 1038
    sget-object v2, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "initializeRecorder: t1="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    sub-long/2addr v7, v4

    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1041
    :cond_5
    :goto_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 1043
    const/4 p1, 0x0

    .line 1046
    const/4 v2, 0x1

    :try_start_2
    iget-object v4, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;

    invoke-direct {p0, v4}, Lcom/android/camera/module/VideoModule;->setupRecorder(Landroid/media/MediaRecorder;)V

    .line 1049
    iget-object v4, p0, Lcom/android/camera/module/VideoModule;->mVideoFileDescriptor:Landroid/os/ParcelFileDescriptor;

    if-eqz v4, :cond_6

    .line 1050
    iget-object v4, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;

    iget-object v5, p0, Lcom/android/camera/module/VideoModule;->mVideoFileDescriptor:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {v5}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/media/MediaRecorder;->setOutputFile(Ljava/io/FileDescriptor;)V

    goto :goto_2

    .line 1052
    :cond_6
    invoke-static {}, Lcom/android/camera/storage/Storage;->isUseDocumentMode()Z

    move-result v4

    if-nez v4, :cond_7

    .line 1053
    iget-object v4, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;

    iget-object v5, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoFilename:Ljava/lang/String;

    invoke-virtual {v4, v5}, Landroid/media/MediaRecorder;->setOutputFile(Ljava/lang/String;)V

    goto :goto_2

    .line 1055
    :cond_7
    iget-object v4, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoFilename:Ljava/lang/String;

    invoke-static {v4, v2}, Lcom/android/camera/FileCompat;->getParcelFileDescriptor(Ljava/lang/String;Z)Landroid/os/ParcelFileDescriptor;

    move-result-object v4
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 1057
    :try_start_3
    iget-object p1, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v4}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v5

    invoke-virtual {p1, v5}, Landroid/media/MediaRecorder;->setOutputFile(Ljava/io/FileDescriptor;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1060
    move-object p1, v4

    :goto_2
    :try_start_4
    iget-object v4, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;

    iget-object v5, p0, Lcom/android/camera/module/VideoModule;->mRecorderSurface:Landroid/view/Surface;

    invoke-virtual {v4, v5}, Landroid/media/MediaRecorder;->setInputSurface(Landroid/view/Surface;)V

    .line 1062
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 1063
    iget-object v6, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v6}, Landroid/media/MediaRecorder;->prepare()V

    .line 1064
    iget-object v6, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v6, p0}, Landroid/media/MediaRecorder;->setOnErrorListener(Landroid/media/MediaRecorder$OnErrorListener;)V

    .line 1065
    iget-object v6, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v6, p0}, Landroid/media/MediaRecorder;->setOnInfoListener(Landroid/media/MediaRecorder$OnInfoListener;)V

    .line 1066
    sget-boolean v6, Lcom/android/camera/module/VideoModule;->DEBUG:Z

    if-eqz v6, :cond_8

    .line 1067
    sget-object v6, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "initializeRecorder: t2="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    sub-long/2addr v8, v4

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v6, v4}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 1074
    :cond_8
    invoke-static {p1}, Lcom/android/camera/Util;->closeSilently(Ljava/io/Closeable;)V

    .line 1075
    goto :goto_4

    .line 1074
    :catchall_0
    move-exception v0

    move-object p1, v4

    goto :goto_5

    .line 1069
    :catch_1
    move-exception v2

    move-object p1, v4

    goto :goto_3

    .line 1074
    :catchall_1
    move-exception v0

    goto :goto_5

    .line 1069
    :catch_2
    move-exception v2

    .line 1070
    :goto_3
    :try_start_5
    sget-object v4, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "prepare failed for "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoFilename:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1071
    nop

    .line 1072
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->releaseMediaRecorder()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 1074
    invoke-static {p1}, Lcom/android/camera/Util;->closeSilently(Ljava/io/Closeable;)V

    .line 1075
    nop

    .line 1077
    move v2, v3

    :goto_4
    sget-boolean p1, Lcom/android/camera/module/VideoModule;->DEBUG:Z

    if-eqz p1, :cond_9

    .line 1078
    iget-object p1, p0, Lcom/android/camera/module/VideoModule;->mRecorderSurface:Landroid/view/Surface;

    invoke-direct {p0, p1}, Lcom/android/camera/module/VideoModule;->showSurfaceInfo(Landroid/view/Surface;)V

    .line 1080
    :cond_9
    sget-object p1, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "initializeRecorder<<time="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v0

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1081
    return v2

    .line 1074
    :goto_5
    invoke-static {p1}, Lcom/android/camera/Util;->closeSilently(Ljava/io/Closeable;)V

    throw v0

    .line 1041
    :catchall_2
    move-exception v0

    :try_start_6
    monitor-exit p1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    throw v0
.end method

.method private isActivityResumed()Z
    .locals 1

    .line 1578
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v0

    .line 1579
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private isDump960Orig()Z
    .locals 2

    .line 1797
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mDumpOrig960:Ljava/lang/Boolean;

    if-nez v0, :cond_1

    .line 1798
    const-string v0, "camera.record.960origdump"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 1799
    if-eqz v0, :cond_0

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_0

    :cond_0
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    :goto_0
    iput-object v0, p0, Lcom/android/camera/module/VideoModule;->mDumpOrig960:Ljava/lang/Boolean;

    .line 1801
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mDumpOrig960:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method private isEisOn()Z
    .locals 2

    .line 1954
    iget v0, p0, Lcom/android/camera/module/VideoModule;->mQuality:I

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/android/camera/module/VideoModule;->mQuality:I

    .line 1955
    invoke-static {v0}, Lcom/android/camera/CameraSettings;->is4KHigherVideoQuality(I)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/android/camera/module/VideoModule;->isSupport4KUHDEIS()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1956
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isBackCamera()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1957
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isBeautyOn()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1958
    invoke-static {}, Lcom/android/camera/CameraSettings;->isMovieSolidOn()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1959
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->getHSRValue()I

    move-result v0

    const/16 v1, 0x3c

    if-eq v0, v1, :cond_1

    .line 1960
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isNormalMode()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 1954
    :goto_0
    return v0
.end method

.method private isFPS120()Z
    .locals 2

    .line 689
    const-string v0, "slow_motion_120"

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mSlowModeFps:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private isFPS240()Z
    .locals 2

    .line 693
    const-string v0, "slow_motion_240"

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mSlowModeFps:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private isFPS960()Z
    .locals 2

    .line 698
    const-string v0, "slow_motion_960"

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mSlowModeFps:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private isHFRMode()Z
    .locals 2

    .line 735
    const-string v0, "hfr"

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mSpeed:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private isNormalMode()Z
    .locals 2

    .line 739
    const-string v0, "normal"

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mSpeed:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private isSlowMode()Z
    .locals 2

    .line 731
    const-string v0, "slow"

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mSpeed:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private isSplitWhenReachMaxSize()Z
    .locals 1

    .line 1231
    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mSplitWhenReachMaxSize:Z

    return v0
.end method

.method private static isSupport4KUHDEIS()Z
    .locals 1

    .line 1950
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->isSupport4KUHDEIS()Z

    move-result v0

    return v0
.end method

.method private isUsingUltraWideCamera()Z
    .locals 2

    .line 767
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getUltraWideCameraId()I

    move-result v0

    .line 768
    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1}, Lcom/android/camera2/Camera2Proxy;->getId()I

    move-result v1

    if-ne v1, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private needImageThumbnail(I)Z
    .locals 1

    .line 2611
    const/16 v0, 0xc

    if-eq p1, v0, :cond_0

    .line 2616
    const/4 p1, 0x1

    return p1

    .line 2613
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method private notifyAutoZoomStartUiHint()V
    .locals 3

    .line 2548
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0x3e8

    invoke-static {v1, v2, v0}, Lio/reactivex/Observable;->timer(JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Observable;

    move-result-object v0

    .line 2549
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    new-instance v1, Lcom/android/camera/module/VideoModule$11;

    invoke-direct {v1, p0}, Lcom/android/camera/module/VideoModule$11;-><init>(Lcom/android/camera/module/VideoModule;)V

    .line 2550
    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/VideoModule;->mAutoZoomUiDisposable:Lio/reactivex/disposables/Disposable;

    .line 2558
    return-void
.end method

.method private notifyAutoZoomStopUiHint()V
    .locals 1

    .line 2561
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mAutoZoomUiDisposable:Lio/reactivex/disposables/Disposable;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mAutoZoomUiDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2562
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mAutoZoomUiDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 2563
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/module/VideoModule;->mAutoZoomUiDisposable:Lio/reactivex/disposables/Disposable;

    .line 2565
    :cond_0
    return-void
.end method

.method private onMaxFileSizeReached()V
    .locals 3

    .line 1356
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoFilename:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 1357
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoFilename:Ljava/lang/String;

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoValues:Landroid/content/ContentValues;

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2, v2}, Lcom/android/camera/module/VideoModule;->saveVideo(Ljava/lang/String;Landroid/content/ContentValues;ZZ)Landroid/net/Uri;

    .line 1358
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoValues:Landroid/content/ContentValues;

    .line 1359
    iput-object v0, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoFilename:Ljava/lang/String;

    .line 1361
    :cond_0
    return-void
.end method

.method private onMediaRecorderReleased()V
    .locals 8

    .line 1668
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v1, "onMediaRecorderReleased>>"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1669
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 1671
    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mAudioManager:Landroid/media/AudioManager;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/media/AudioManager;->abandonAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;)I

    .line 1672
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->restoreMusicSound()V

    .line 1674
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isCaptureIntent()Z

    move-result v2

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz v2, :cond_3

    iget-boolean v2, p0, Lcom/android/camera/module/VideoModule;->mPaused:Z

    if-nez v2, :cond_3

    .line 1676
    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoUri:Landroid/net/Uri;

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoFilename:Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 1677
    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoFilename:Ljava/lang/String;

    iget-object v6, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoValues:Landroid/content/ContentValues;

    invoke-direct {p0, v2, v6, v4, v4}, Lcom/android/camera/module/VideoModule;->saveVideo(Ljava/lang/String;Landroid/content/ContentValues;ZZ)Landroid/net/Uri;

    move-result-object v2

    iput-object v2, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoUri:Landroid/net/Uri;

    .line 1678
    sget-object v2, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "onMediaRecorderReleased: outputUri="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v7, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoUri:Landroid/net/Uri;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v2, v6}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1680
    :cond_0
    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoUri:Landroid/net/Uri;

    if-eqz v2, :cond_1

    .line 1681
    move v2, v4

    goto :goto_0

    .line 1680
    :cond_1
    nop

    .line 1681
    move v2, v5

    :goto_0
    iget-boolean v6, p0, Lcom/android/camera/module/VideoModule;->mQuickCapture:Z

    if-eqz v6, :cond_2

    .line 1682
    invoke-virtual {p0, v2}, Lcom/android/camera/module/VideoModule;->doReturnToCaller(Z)V

    goto :goto_1

    .line 1683
    :cond_2
    if-eqz v2, :cond_3

    .line 1684
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->showAlert()V

    .line 1688
    :cond_3
    :goto_1
    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoFilename:Ljava/lang/String;

    if-eqz v2, :cond_5

    .line 1689
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isCaptureIntent()Z

    move-result v2

    if-nez v2, :cond_4

    .line 1690
    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoFilename:Ljava/lang/String;

    iget-object v6, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoValues:Landroid/content/ContentValues;

    invoke-direct {p0, v2, v6, v4, v5}, Lcom/android/camera/module/VideoModule;->saveVideo(Ljava/lang/String;Landroid/content/ContentValues;ZZ)Landroid/net/Uri;

    .line 1692
    :cond_4
    iput-object v3, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoFilename:Ljava/lang/String;

    .line 1693
    iput-object v3, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoValues:Landroid/content/ContentValues;

    goto :goto_2

    .line 1694
    :cond_5
    iget-boolean v2, p0, Lcom/android/camera/module/VideoModule;->mPaused:Z

    if-nez v2, :cond_6

    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result v2

    if-nez v2, :cond_6

    .line 1696
    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/ThumbnailUpdater;->getLastThumbnail()V

    .line 1700
    :cond_6
    :goto_2
    iget-boolean v2, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderPostProcessing:Z

    if-eqz v2, :cond_7

    .line 1702
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    const/16 v3, 0xd4

    .line 1703
    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v2

    check-cast v2, Lcom/android/camera/protocol/ModeProtocol$RecordState;

    .line 1705
    if-eqz v2, :cond_7

    .line 1707
    invoke-interface {v2}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onPostSavingFinish()V

    .line 1711
    :cond_7
    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    new-instance v3, Landroid/content/Intent;

    const-string v6, "com.android.camera.action.stop_video_recording"

    invoke-direct {v3, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Lcom/android/camera/Camera;->sendBroadcast(Landroid/content/Intent;)V

    .line 1712
    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mPhoneStateListener:Landroid/telephony/PhoneStateListener;

    invoke-virtual {v2, v3, v5}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V

    .line 1713
    sget-object v2, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v3, "listen none"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1714
    invoke-virtual {p0, v4}, Lcom/android/camera/module/VideoModule;->enableCameraControls(Z)V

    .line 1715
    const-string v2, "continuous-video"

    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mVideoFocusMode:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_8

    .line 1716
    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->resetFocusStateIfNeeded()V

    .line 1717
    iget-boolean v2, p0, Lcom/android/camera/module/VideoModule;->mPaused:Z

    if-nez v2, :cond_8

    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result v2

    if-nez v2, :cond_8

    .line 1718
    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    const/4 v3, 0x2

    invoke-interface {v2, v3}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->clearFocusView(I)V

    .line 1719
    const-string v2, "continuous-video"

    invoke-virtual {p0, v2, v5}, Lcom/android/camera/module/VideoModule;->setVideoFocusMode(Ljava/lang/String;Z)V

    .line 1720
    new-array v2, v4, [I

    const/16 v3, 0xe

    aput v3, v2, v5

    invoke-virtual {p0, v2}, Lcom/android/camera/module/VideoModule;->updatePreferenceInWorkThread([I)V

    .line 1724
    :cond_8
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->keepScreenOnAwhile()V

    .line 1725
    sget-object v2, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onMediaRecorderReleased<<time="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sub-long/2addr v6, v0

    invoke-virtual {v3, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1726
    invoke-static {}, Lcom/android/camera/statistic/ScenarioTrackUtil;->trackStopVideoRecordEnd()V

    .line 1728
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->doLaterReleaseIfNeed()V

    .line 1729
    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderPostProcessing:Z

    if-eqz v0, :cond_9

    .line 1730
    iput-boolean v5, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderPostProcessing:Z

    .line 1731
    iput-boolean v5, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    .line 1733
    :cond_9
    iput-boolean v5, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderWorking:Z

    .line 1734
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/camera/module/VideoModule$8;

    invoke-direct {v1, p0}, Lcom/android/camera/module/VideoModule$8;-><init>(Lcom/android/camera/module/VideoModule;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 1741
    return-void
.end method

.method private onStartRecorderFail()V
    .locals 2

    .line 1430
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoModule;->enableCameraControls(Z)V

    .line 1431
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->releaseMediaRecorder()V

    .line 1432
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mAudioManager:Landroid/media/AudioManager;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->abandonAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;)I

    .line 1433
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->restoreMusicSound()V

    .line 1435
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 1436
    const/16 v1, 0xd4

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$RecordState;

    .line 1437
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onFailed()V

    .line 1438
    return-void
.end method

.method private onStartRecorderSucceed()V
    .locals 5

    .line 1441
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isFPS960()Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 1442
    invoke-virtual {p0, v1}, Lcom/android/camera/module/VideoModule;->enableCameraControls(Z)V

    .line 1444
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    new-instance v2, Landroid/content/Intent;

    const-string v3, "com.android.camera.action.start_video_recording"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Lcom/android/camera/Camera;->sendBroadcast(Landroid/content/Intent;)V

    .line 1445
    iput-boolean v1, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderWorking:Z

    .line 1446
    iput-boolean v1, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    .line 1447
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecordingPaused:Z

    .line 1448
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/android/camera/module/VideoModule;->mRecordingStartTime:J

    .line 1449
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/android/camera/module/VideoModule;->mPauseClickTime:J

    .line 1450
    const-string v2, ""

    iput-object v2, p0, Lcom/android/camera/module/VideoModule;->mRecordingTime:Ljava/lang/String;

    .line 1451
    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mPhoneStateListener:Landroid/telephony/PhoneStateListener;

    const/16 v4, 0x20

    invoke-virtual {v2, v3, v4}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V

    .line 1452
    sget-object v2, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v3, "listen call state"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1453
    invoke-static {}, Lcom/android/camera/CameraSettings;->isVideoBokehOn()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1454
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->countDownForVideoBokeh()V

    goto :goto_0

    .line 1456
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->updateRecordingTime()V

    .line 1458
    :goto_0
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->keepScreenOn()V

    .line 1460
    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v2}, Lcom/android/camera/AutoLockManager;->getInstance(Landroid/content/Context;)Lcom/android/camera/AutoLockManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/AutoLockManager;->removeMessage()V

    .line 1461
    invoke-virtual {p0, v1, v0}, Lcom/android/camera/module/VideoModule;->trackGeneralInfo(IZ)V

    .line 1463
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->keepPowerSave()V

    .line 1464
    return-void
.end method

.method private pauseVideoRecording()V
    .locals 4

    .line 2197
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v1, "pauseVideoRecording"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2198
    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecordingPaused:Z

    if-nez v0, :cond_0

    .line 2200
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoModule;->pauseMediaRecorder(Landroid/media/MediaRecorder;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2203
    goto :goto_0

    .line 2201
    :catch_0
    move-exception v0

    .line 2202
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v1, "failed to pause media recorder"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2205
    :goto_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/android/camera/module/VideoModule;->mRecordingStartTime:J

    sub-long/2addr v0, v2

    iput-wide v0, p0, Lcom/android/camera/module/VideoModule;->mVideoRecordedDuration:J

    .line 2206
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecordingPaused:Z

    .line 2207
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x2a

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 2208
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->updateRecordingTime()V

    .line 2210
    :cond_0
    return-void
.end method

.method private postProcessVideo(Ljava/lang/String;)Ljava/lang/String;
    .locals 8

    .line 1764
    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 1765
    return-object v0

    .line 1768
    :cond_0
    nop

    .line 1771
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1772
    new-instance v2, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ".bak"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1773
    new-instance v3, Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/android/camera/storage/Storage;->generatePrimaryFilepath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1775
    const/4 v4, 0x0

    :try_start_0
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    .line 1776
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v7

    invoke-virtual {v7}, Lcom/mi/config/a;->fB()Z

    move-result v7

    .line 1775
    invoke-static {v5, v6, v7}, Lcom/miui/extravideo/interpolation/VideoInterpolator;->doDecodeAndEncodeSync(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v5

    .line 1777
    if-eqz v5, :cond_1

    invoke-virtual {v2, v3}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v5

    if-eqz v5, :cond_1

    const/4 v4, 0x1

    nop

    .line 1779
    :cond_1
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isDump960Orig()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 1780
    new-instance v5, Ljava/io/File;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ".orig.mp4"

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v5, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v5}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    goto :goto_0

    .line 1782
    :cond_2
    invoke-virtual {v1}, Ljava/io/File;->delete()Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1787
    :goto_0
    if-nez v4, :cond_3

    .line 1788
    :goto_1
    sget-object p1, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v5, "960fps processing failed. delete the files."

    invoke-static {p1, v5}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1789
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 1790
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    goto :goto_2

    .line 1787
    :catchall_0
    move-exception p1

    goto :goto_3

    .line 1784
    :catch_0
    move-exception p1

    .line 1785
    :try_start_1
    sget-object v5, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v6, "960fps processing failed."

    invoke-static {v5, v6, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1787
    if-nez v4, :cond_3

    goto :goto_1

    .line 1793
    :cond_3
    :goto_2
    if-eqz v4, :cond_4

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    nop

    :cond_4
    return-object v0

    .line 1787
    :goto_3
    if-nez v4, :cond_5

    .line 1788
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v3, "960fps processing failed. delete the files."

    invoke-static {v0, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1789
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 1790
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    :cond_5
    throw p1
.end method

.method private releaseMediaRecorder()V
    .locals 7

    .line 1254
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v1, "releaseRecorder"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1256
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 1257
    :try_start_0
    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;

    .line 1258
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;

    .line 1259
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1260
    if-eqz v1, :cond_0

    .line 1261
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->cleanupEmptyFile()V

    .line 1262
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 1263
    invoke-virtual {v1}, Landroid/media/MediaRecorder;->reset()V

    .line 1264
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "releaseRecorder: t1="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    sub-long/2addr v5, v2

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1265
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 1266
    invoke-virtual {v1}, Landroid/media/MediaRecorder;->release()V

    .line 1267
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "releaseRecorder: t2="

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v2

    invoke-virtual {v1, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1269
    :cond_0
    return-void

    .line 1259
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method private releaseRecorderSurface()V
    .locals 1

    .line 356
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mRecorderSurface:Landroid/view/Surface;

    if-eqz v0, :cond_0

    .line 357
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mRecorderSurface:Landroid/view/Surface;

    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 359
    :cond_0
    return-void
.end method

.method private releaseResources()V
    .locals 2

    .line 2219
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mAutoZoomEmitter:Lio/reactivex/FlowableEmitter;

    if-eqz v0, :cond_0

    .line 2220
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mAutoZoomEmitter:Lio/reactivex/FlowableEmitter;

    invoke-interface {v0}, Lio/reactivex/FlowableEmitter;->onComplete()V

    .line 2223
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mAutoZoomUiDisposable:Lio/reactivex/disposables/Disposable;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mAutoZoomUiDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    if-nez v0, :cond_1

    .line 2224
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mAutoZoomUiDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 2225
    iput-object v1, p0, Lcom/android/camera/module/VideoModule;->mAutoZoomUiDisposable:Lio/reactivex/disposables/Disposable;

    .line 2228
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mAutoZoomDataDisposable:Lio/reactivex/disposables/Disposable;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mAutoZoomDataDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    if-nez v0, :cond_2

    .line 2229
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mAutoZoomDataDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 2230
    iput-object v1, p0, Lcom/android/camera/module/VideoModule;->mAutoZoomDataDisposable:Lio/reactivex/disposables/Disposable;

    .line 2232
    :cond_2
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoModule;->stopTracking(I)V

    .line 2233
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->stopAutoZoom()V

    .line 2235
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->closeCamera()V

    .line 2236
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->releaseMediaRecorder()V

    .line 2237
    return-void
.end method

.method private saveVideo(Ljava/lang/String;Landroid/content/ContentValues;ZZ)Landroid/net/Uri;
    .locals 3

    .line 1364
    nop

    .line 1365
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    if-eqz v0, :cond_1

    .line 1366
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "saveVideo: path="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " isFinal="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1367
    if-nez p4, :cond_0

    .line 1368
    iget-object p4, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p4}, Lcom/android/camera/Camera;->getImageSaver()Lcom/android/camera/storage/ImageSaver;

    move-result-object p4

    invoke-virtual {p4, p1, p2, p3}, Lcom/android/camera/storage/ImageSaver;->addVideo(Ljava/lang/String;Landroid/content/ContentValues;Z)V

    goto :goto_0

    .line 1370
    :cond_0
    iget-object p3, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p3}, Lcom/android/camera/Camera;->getImageSaver()Lcom/android/camera/storage/ImageSaver;

    move-result-object p3

    const/4 p4, 0x0

    invoke-virtual {p3, p1, p2, p4}, Lcom/android/camera/storage/ImageSaver;->addVideoSync(Ljava/lang/String;Landroid/content/ContentValues;Z)Landroid/net/Uri;

    move-result-object p1

    goto :goto_1

    .line 1373
    :cond_1
    sget-object p2, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "saveVideo: failed to save "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1375
    :goto_0
    const/4 p1, 0x0

    :goto_1
    return-object p1
.end method

.method private setJpegQuality()V
    .locals 4

    .line 1964
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isDeviceAlive()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1965
    return-void

    .line 1967
    :cond_0
    iget v0, p0, Lcom/android/camera/module/VideoModule;->mBogusCameraId:I

    const/4 v1, 0x2

    invoke-static {v0, v1}, Landroid/media/CameraProfile;->getJpegEncodingQualityParameter(II)I

    move-result v0

    .line 1969
    sget-object v1, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "jpegQuality="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1970
    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v0}, Lcom/android/camera2/Camera2Proxy;->setJpegQuality(I)V

    .line 1971
    return-void
.end method

.method private setNextOutputFile(Ljava/lang/String;)Z
    .locals 5

    .line 1337
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 1338
    sget-object p1, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v0, "setNextOutputFile, filePath is empty"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1339
    return v1

    .line 1343
    :cond_0
    const/4 v0, 0x1

    :try_start_0
    invoke-static {p1, v0}, Lcom/android/camera/FileCompat;->getParcelFileDescriptor(Ljava/lang/String;Z)Landroid/os/ParcelFileDescriptor;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 1342
    const/4 v2, 0x0

    .line 1346
    :try_start_1
    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v0}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/lib/compatibility/util/CompatibilityUtils;->setNextOutputFile(Landroid/media/MediaRecorder;Ljava/io/FileDescriptor;)Z

    move-result v3
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1347
    if-eqz v0, :cond_1

    :try_start_2
    invoke-virtual {v0}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 1346
    :cond_1
    return v3

    .line 1347
    :catchall_0
    move-exception v3

    goto :goto_0

    .line 1342
    :catch_0
    move-exception v2

    :try_start_3
    throw v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1347
    :goto_0
    if-eqz v0, :cond_3

    if-eqz v2, :cond_2

    :try_start_4
    invoke-virtual {v0}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_1

    :catch_1
    move-exception v0

    :try_start_5
    invoke-virtual {v2, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_1

    :cond_2
    invoke-virtual {v0}, Landroid/os/ParcelFileDescriptor;->close()V

    :cond_3
    :goto_1
    throw v3
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    :catch_2
    move-exception v0

    .line 1349
    sget-object v2, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "open file failed, filePath "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1352
    return v1
.end method

.method private setParameterExtra(Landroid/media/MediaRecorder;Ljava/lang/String;)V
    .locals 5

    .line 1189
    const/4 v0, 0x1

    new-array v1, v0, [Ljava/lang/Class;

    const-class v2, Landroid/media/MediaRecorder;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    .line 1190
    const-string v2, "setParameter"

    const-string v4, "(Ljava/lang/String;)V"

    invoke-static {v1, v2, v4}, Lcom/android/camera/Util;->getMethod([Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)Lmiui/reflect/Method;

    move-result-object v2

    .line 1191
    if-eqz v2, :cond_0

    .line 1192
    aget-object v1, v1, v3

    new-array v0, v0, [Ljava/lang/Object;

    aput-object p2, v0, v3

    invoke-virtual {v2, v1, p1, v0}, Lmiui/reflect/Method;->invoke(Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)V

    .line 1194
    :cond_0
    return-void
.end method

.method private setSplitWhenReachMaxSize(Z)V
    .locals 0

    .line 1227
    iput-boolean p1, p0, Lcom/android/camera/module/VideoModule;->mSplitWhenReachMaxSize:Z

    .line 1228
    return-void
.end method

.method private setupRecorder(Landroid/media/MediaRecorder;)V
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 1094
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isNormalMode()Z

    move-result v0

    .line 1095
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isHFRMode()Z

    move-result v1

    .line 1096
    const/4 v2, 0x1

    const/4 v3, 0x0

    if-nez v0, :cond_1

    if-nez v1, :cond_1

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isFPS120()Z

    move-result v4

    if-nez v4, :cond_1

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isFPS240()Z

    move-result v4

    if-eqz v4, :cond_0

    goto :goto_0

    .line 1097
    :cond_0
    move v4, v3

    goto :goto_1

    .line 1096
    :cond_1
    :goto_0
    nop

    .line 1097
    move v4, v2

    :goto_1
    const/4 v5, 0x2

    invoke-virtual {p1, v5}, Landroid/media/MediaRecorder;->setVideoSource(I)V

    .line 1098
    const/4 v6, 0x5

    if-eqz v4, :cond_2

    .line 1099
    invoke-virtual {p1, v6}, Landroid/media/MediaRecorder;->setAudioSource(I)V

    .line 1101
    :cond_2
    iget-object v7, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v7, v7, Landroid/media/CamcorderProfile;->fileFormat:I

    invoke-virtual {p1, v7}, Landroid/media/MediaRecorder;->setOutputFormat(I)V

    .line 1103
    iget-object v7, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v7, v7, Landroid/media/CamcorderProfile;->videoCodec:I

    invoke-virtual {p1, v7}, Landroid/media/MediaRecorder;->setVideoEncoder(I)V

    .line 1104
    iget-object v7, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v7, v7, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    iget-object v8, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v8, v8, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    invoke-virtual {p1, v7, v8}, Landroid/media/MediaRecorder;->setVideoSize(II)V

    .line 1105
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->getHSRValue()I

    move-result v7

    .line 1106
    if-lez v7, :cond_3

    .line 1107
    invoke-virtual {p1, v7}, Landroid/media/MediaRecorder;->setVideoFrameRate(I)V

    .line 1108
    sget-object v8, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "setVideoFrameRate: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 1110
    :cond_3
    iget-object v8, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v8, v8, Landroid/media/CamcorderProfile;->videoFrameRate:I

    invoke-virtual {p1, v8}, Landroid/media/MediaRecorder;->setVideoFrameRate(I)V

    .line 1111
    sget-object v8, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "setVideoFrameRate: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v10, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v10, v10, Landroid/media/CamcorderProfile;->videoFrameRate:I

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1114
    :goto_2
    iget-object v8, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v8, v8, Landroid/media/CamcorderProfile;->videoCodec:I

    if-ne v6, v8, :cond_4

    .line 1115
    iget-object v6, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    invoke-direct {p0, v6}, Lcom/android/camera/module/VideoModule;->getHevcVideoEncoderBitRate(Landroid/media/CamcorderProfile;)I

    move-result v6

    .line 1116
    sget-object v8, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "H265 bitrate: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3

    .line 1118
    :cond_4
    iget-object v6, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v6, v6, Landroid/media/CamcorderProfile;->videoBitRate:I

    .line 1119
    sget-object v8, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "H264 bitrate: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1121
    :goto_3
    invoke-virtual {p1, v6}, Landroid/media/MediaRecorder;->setVideoEncodingBitRate(I)V

    .line 1123
    if-eqz v4, :cond_5

    .line 1124
    iget-object v4, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v4, v4, Landroid/media/CamcorderProfile;->audioBitRate:I

    invoke-virtual {p1, v4}, Landroid/media/MediaRecorder;->setAudioEncodingBitRate(I)V

    .line 1125
    iget-object v4, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v4, v4, Landroid/media/CamcorderProfile;->audioChannels:I

    invoke-virtual {p1, v4}, Landroid/media/MediaRecorder;->setAudioChannels(I)V

    .line 1126
    iget-object v4, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v4, v4, Landroid/media/CamcorderProfile;->audioSampleRate:I

    invoke-virtual {p1, v4}, Landroid/media/MediaRecorder;->setAudioSamplingRate(I)V

    .line 1127
    iget-object v4, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v4, v4, Landroid/media/CamcorderProfile;->audioCodec:I

    invoke-virtual {p1, v4}, Landroid/media/MediaRecorder;->setAudioEncoder(I)V

    .line 1129
    :cond_5
    iget-boolean v4, p0, Lcom/android/camera/module/VideoModule;->mCaptureTimeLapse:Z

    if-eqz v4, :cond_6

    .line 1130
    const-wide v0, 0x408f400000000000L    # 1000.0

    iget v4, p0, Lcom/android/camera/module/VideoModule;->mTimeBetweenTimeLapseFrameCaptureMs:I

    int-to-double v4, v4

    div-double/2addr v0, v4

    invoke-virtual {p1, v0, v1}, Landroid/media/MediaRecorder;->setCaptureRate(D)V

    goto :goto_5

    .line 1131
    :cond_6
    if-nez v0, :cond_a

    .line 1132
    if-nez v1, :cond_7

    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isVideoNewSlowMotion()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 1133
    :cond_7
    iget v0, p0, Lcom/android/camera/module/VideoModule;->mFrameRate:I

    invoke-virtual {p1, v0}, Landroid/media/MediaRecorder;->setVideoFrameRate(I)V

    .line 1134
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-ge v0, v1, :cond_8

    .line 1135
    int-to-long v0, v6

    iget v4, p0, Lcom/android/camera/module/VideoModule;->mFrameRate:I

    int-to-long v4, v4

    mul-long/2addr v0, v4

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->getNormalVideoFrameRate()I

    move-result v4

    int-to-long v4, v4

    div-long/2addr v0, v4

    long-to-int v0, v0

    goto :goto_4

    .line 1137
    :cond_8
    iget v0, p0, Lcom/android/camera/module/VideoModule;->mFrameRate:I

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->getNormalVideoFrameRate()I

    move-result v1

    div-int/2addr v0, v1

    div-int/2addr v0, v5

    mul-int/2addr v0, v6

    .line 1139
    :goto_4
    invoke-virtual {p1, v0}, Landroid/media/MediaRecorder;->setVideoEncodingBitRate(I)V

    .line 1141
    :cond_9
    iget v0, p0, Lcom/android/camera/module/VideoModule;->mFrameRate:I

    int-to-double v0, v0

    invoke-virtual {p1, v0, v1}, Landroid/media/MediaRecorder;->setCaptureRate(D)V

    goto :goto_5

    .line 1142
    :cond_a
    if-lez v7, :cond_b

    .line 1143
    invoke-virtual {p1, v7}, Landroid/media/MediaRecorder;->setVideoFrameRate(I)V

    .line 1144
    int-to-double v0, v7

    invoke-virtual {p1, v0, v1}, Landroid/media/MediaRecorder;->setCaptureRate(D)V

    .line 1147
    :cond_b
    :goto_5
    iget v0, p0, Lcom/android/camera/module/VideoModule;->mMaxVideoDurationInMs:I

    invoke-virtual {p1, v0}, Landroid/media/MediaRecorder;->setMaxDuration(I)V

    .line 1148
    invoke-static {}, Lcom/android/camera/LocationManager;->instance()Lcom/android/camera/LocationManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/LocationManager;->getCurrentLocation()Landroid/location/Location;

    move-result-object v0

    .line 1149
    if-eqz v0, :cond_c

    .line 1150
    invoke-virtual {v0}, Landroid/location/Location;->getLatitude()D

    move-result-wide v4

    double-to-float v1, v4

    invoke-virtual {v0}, Landroid/location/Location;->getLongitude()D

    move-result-wide v4

    double-to-float v0, v4

    invoke-virtual {p1, v1, v0}, Landroid/media/MediaRecorder;->setLocation(FF)V

    .line 1154
    :cond_c
    const-string v0, "camera.debug.video_max_size"

    invoke-static {v0, v3}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 1155
    invoke-direct {p0, v0}, Lcom/android/camera/module/VideoModule;->getRecorderMaxFileSize(I)J

    move-result-wide v4

    .line 1156
    const-wide/16 v6, 0x0

    cmp-long v1, v4, v6

    const-wide v6, 0xdac00000L

    if-lez v1, :cond_d

    .line 1157
    sget-object v1, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "maxFileSize="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v1, v8}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1158
    invoke-virtual {p1, v4, v5}, Landroid/media/MediaRecorder;->setMaxFileSize(J)V

    .line 1159
    cmp-long v1, v4, v6

    if-lez v1, :cond_d

    .line 1160
    const-string v1, "param-use-64bit-offset=1"

    invoke-direct {p0, p1, v1}, Lcom/android/camera/module/VideoModule;->setParameterExtra(Landroid/media/MediaRecorder;Ljava/lang/String;)V

    .line 1163
    :cond_d
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mi/config/a;->fk()Z

    move-result v1

    if-eqz v1, :cond_f

    if-gtz v0, :cond_e

    cmp-long v0, v4, v6

    if-nez v0, :cond_f

    .line 1165
    :cond_e
    invoke-direct {p0, v2}, Lcom/android/camera/module/VideoModule;->setSplitWhenReachMaxSize(Z)V

    goto :goto_6

    .line 1167
    :cond_f
    invoke-direct {p0, v3}, Lcom/android/camera/module/VideoModule;->setSplitWhenReachMaxSize(Z)V

    .line 1172
    :goto_6
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isFPS240()Z

    move-result v0

    if-nez v0, :cond_10

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isFPS960()Z

    move-result v0

    if-eqz v0, :cond_11

    .line 1178
    :cond_10
    :try_start_0
    const-string v0, "video-param-i-frames-interval=0.033"

    invoke-direct {p0, p1, v0}, Lcom/android/camera/module/VideoModule;->setParameterExtra(Landroid/media/MediaRecorder;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1181
    goto :goto_7

    .line 1179
    :catch_0
    move-exception v0

    .line 1180
    sget-object v1, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1183
    :cond_11
    :goto_7
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->getRecorderOrientationHint()I

    move-result v0

    .line 1184
    invoke-virtual {p1, v0}, Landroid/media/MediaRecorder;->setOrientationHint(I)V

    .line 1185
    iget p1, p0, Lcom/android/camera/module/VideoModule;->mOrientationCompensation:I

    iput p1, p0, Lcom/android/camera/module/VideoModule;->mOrientationCompensationAtRecordStart:I

    .line 1186
    return-void
.end method

.method private shouldApplyUltraWideLDC()Z
    .locals 3

    .line 1934
    iget v0, p0, Lcom/android/camera/module/VideoModule;->mModuleIndex:I

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->shouldUltraWideVideoLDCBeVisibleInMode(I)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 1935
    return v1

    .line 1937
    :cond_0
    iget v0, p0, Lcom/android/camera/module/VideoModule;->mActualCameraId:I

    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getUltraWideCameraId()I

    move-result v2

    if-eq v0, v2, :cond_1

    .line 1939
    return v1

    .line 1941
    :cond_1
    invoke-static {}, Lcom/android/camera/CameraSettings;->isUltraWideVideoLDCEnabled()Z

    move-result v0

    return v0
.end method

.method private showSurfaceInfo(Landroid/view/Surface;)V
    .locals 7

    .line 1085
    invoke-virtual {p1}, Landroid/view/Surface;->isValid()Z

    move-result v0

    .line 1086
    invoke-static {p1}, Landroid/hardware/camera2/utils/SurfaceUtils;->isSurfaceForHwVideoEncoder(Landroid/view/Surface;)Z

    move-result v1

    .line 1087
    invoke-static {p1}, Landroid/hardware/camera2/utils/SurfaceUtils;->getSurfaceSize(Landroid/view/Surface;)Landroid/util/Size;

    move-result-object v2

    .line 1088
    invoke-static {p1}, Landroid/hardware/camera2/utils/SurfaceUtils;->getSurfaceFormat(Landroid/view/Surface;)I

    move-result v3

    .line 1089
    sget-object v4, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "showSurfaceInfo: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, "|"

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string p1, "|"

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, "|"

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, "|"

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v4, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1091
    return-void
.end method

.method private startHighSpeedRecordSession()V
    .locals 6

    .line 878
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v1, "startHighSpeedRecordSession"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 879
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isDeviceAlive()Z

    move-result v0

    if-nez v0, :cond_0

    .line 880
    return-void

    .line 882
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->checkDisplayOrientation()V

    .line 883
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mErrorCallback:Lcom/android/camera/CameraErrorCallbackImpl;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setErrorCallback(Lcom/android/camera2/Camera2Proxy$CameraErrorCallback;)V

    .line 884
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setPictureSize(Lcom/android/camera/CameraSize;)V

    .line 887
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->getSurfaceCreatedTimestamp()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/module/VideoModule;->mSurfaceCreatedTimestamp:J

    .line 888
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    new-instance v1, Landroid/view/Surface;

    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    .line 889
    invoke-virtual {v2}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/CameraScreenNail;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mRecorderSurface:Landroid/view/Surface;

    new-instance v3, Landroid/util/Range;

    iget v4, p0, Lcom/android/camera/module/VideoModule;->mHfrFPSLower:I

    .line 891
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    iget v5, p0, Lcom/android/camera/module/VideoModule;->mHfrFPSUpper:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Landroid/util/Range;-><init>(Ljava/lang/Comparable;Ljava/lang/Comparable;)V

    .line 888
    invoke-virtual {v0, v1, v2, v3, p0}, Lcom/android/camera2/Camera2Proxy;->startHighSpeedRecordSession(Landroid/view/Surface;Landroid/view/Surface;Landroid/util/Range;Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;)V

    .line 893
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->resetFocused()V

    .line 894
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mRecorderSurface:Landroid/view/Surface;

    invoke-direct {p0, v0}, Lcom/android/camera/module/VideoModule;->showSurfaceInfo(Landroid/view/Surface;)V

    .line 895
    return-void
.end method

.method private startPreviewAfterRecord()V
    .locals 1

    .line 489
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isDeviceAlive()Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_2

    .line 492
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->unlockAEAF()V

    .line 493
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isCaptureIntent()Z

    move-result v0

    if-nez v0, :cond_3

    .line 494
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isHFRMode()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isSlowMode()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isVideoNewSlowMotion()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    .line 497
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->startRecordPreview()V

    goto :goto_1

    .line 495
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->startHighSpeedRecordPreview()V

    .line 500
    :cond_3
    :goto_1
    return-void

    .line 490
    :cond_4
    :goto_2
    return-void
.end method

.method private startPreviewSession()V
    .locals 9

    .line 898
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v1, "startPreviewSession"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 899
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isDeviceAlive()Z

    move-result v0

    if-nez v0, :cond_0

    .line 900
    return-void

    .line 902
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->checkDisplayOrientation()V

    .line 903
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, p0}, Lcom/android/camera2/Camera2Proxy;->setFocusCallback(Lcom/android/camera2/Camera2Proxy$FocusCallback;)V

    .line 904
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mErrorCallback:Lcom/android/camera/CameraErrorCallbackImpl;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setErrorCallback(Lcom/android/camera2/Camera2Proxy$CameraErrorCallback;)V

    .line 905
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setPictureSize(Lcom/android/camera/CameraSize;)V

    .line 907
    new-instance v3, Landroid/view/Surface;

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v0

    invoke-direct {v3, v0}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 908
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->getSurfaceCreatedTimestamp()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/module/VideoModule;->mSurfaceCreatedTimestamp:J

    .line 910
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->getOperationModeForPreview()I

    move-result v6

    .line 911
    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v7, 0x0

    move-object v8, p0

    invoke-virtual/range {v2 .. v8}, Lcom/android/camera2/Camera2Proxy;->startPreviewSession(Landroid/view/Surface;ZZIZLcom/android/camera2/Camera2Proxy$CameraPreviewCallback;)V

    .line 917
    return-void
.end method

.method private startRecordSession()V
    .locals 9

    .line 851
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "startRecordSession: mode="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mSpeed:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 852
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isDeviceAlive()Z

    move-result v0

    if-nez v0, :cond_0

    .line 853
    return-void

    .line 855
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->checkDisplayOrientation()V

    .line 856
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mErrorCallback:Lcom/android/camera/CameraErrorCallbackImpl;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setErrorCallback(Lcom/android/camera2/Camera2Proxy$CameraErrorCallback;)V

    .line 857
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setPictureSize(Lcom/android/camera/CameraSize;)V

    .line 858
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mPictureSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setVideoSnapshotSize(Lcom/android/camera/CameraSize;)V

    .line 862
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->getOperatingMode()I

    move-result v6

    .line 864
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v1, "startRecordSession: operatingMode = 0x%x"

    const/4 v8, 0x1

    new-array v2, v8, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 865
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->getSurfaceCreatedTimestamp()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/module/VideoModule;->mSurfaceCreatedTimestamp:J

    .line 867
    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    new-instance v3, Landroid/view/Surface;

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    .line 868
    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v0

    invoke-direct {v3, v0}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    iget-object v4, p0, Lcom/android/camera/module/VideoModule;->mRecorderSurface:Landroid/view/Surface;

    const/4 v5, 0x1

    .line 867
    move-object v7, p0

    invoke-virtual/range {v2 .. v7}, Lcom/android/camera2/Camera2Proxy;->startRecordSession(Landroid/view/Surface;Landroid/view/Surface;ZILcom/android/camera2/Camera2Proxy$CameraPreviewCallback;)V

    .line 873
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->resetFocused()V

    .line 874
    iput-boolean v8, p0, Lcom/android/camera/module/VideoModule;->mPreviewing:Z

    .line 875
    return-void
.end method

.method private startRecorder()Z
    .locals 4

    .line 1409
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/android/camera/module/VideoModule;->initializeRecorder(Z)Z

    move-result v1

    .line 1410
    const/4 v2, 0x0

    if-nez v1, :cond_0

    .line 1411
    return v2

    .line 1415
    :cond_0
    :try_start_0
    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v1}, Landroid/media/MediaRecorder;->start()V

    .line 1416
    iput-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderWorking:Z
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1424
    nop

    .line 1426
    return v0

    .line 1417
    :catch_0
    move-exception v0

    .line 1418
    sget-object v1, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v3, "could not start recorder"

    invoke-static {v1, v3, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1419
    instance-of v0, v0, Ljava/lang/IllegalStateException;

    if-eqz v0, :cond_1

    .line 1420
    const v0, 0x7f09017e

    const v1, 0x7f090180

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/module/VideoModule;->showConfirmMessage(II)V

    .line 1423
    :cond_1
    return v2
.end method

.method private startVideoRecordingIfNeeded()V
    .locals 5

    .line 968
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraIntentManager()Lcom/android/camera/CameraIntentManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraIntentManager;->checkCallerLegality()Z

    move-result v0

    if-nez v0, :cond_0

    .line 969
    return-void

    .line 971
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraIntentManager()Lcom/android/camera/CameraIntentManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraIntentManager;->isOpenOnly()Z

    move-result v0

    if-nez v0, :cond_3

    .line 973
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "android.intent.extra.CAMERA_OPEN_ONLY"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    .line 974
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraIntentManager()Lcom/android/camera/CameraIntentManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraIntentManager;->getTimerDurationSeconds()I

    move-result v0

    .line 975
    const/16 v1, 0x3c

    if-le v0, v1, :cond_1

    .line 976
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v1, "Caller delivered a wrong duration time large as 60s!"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 978
    return-void

    .line 980
    :cond_1
    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mHandler:Landroid/os/Handler;

    new-instance v2, Lcom/android/camera/module/VideoModule$4;

    invoke-direct {v2, p0}, Lcom/android/camera/module/VideoModule$4;-><init>(Lcom/android/camera/module/VideoModule;)V

    .line 985
    const/4 v3, -0x1

    if-ne v0, v3, :cond_2

    const-wide/16 v3, 0x5dc

    goto :goto_0

    :cond_2
    mul-int/lit16 v0, v0, 0x3e8

    int-to-long v3, v0

    .line 980
    :goto_0
    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 986
    goto :goto_1

    .line 987
    :cond_3
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "android.intent.extra.TIMER_DURATION_SECONDS"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    .line 989
    :goto_1
    return-void
.end method

.method private stopRecorder()V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "CheckResult"
        }
    .end annotation

    .line 1584
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mPendingStopRecorder:Z

    .line 1585
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x2e

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 1587
    new-instance v0, Lcom/android/camera/module/VideoModule$7;

    invoke-direct {v0, p0}, Lcom/android/camera/module/VideoModule$7;-><init>(Lcom/android/camera/module/VideoModule;)V

    invoke-static {v0}, Lio/reactivex/Single;->create(Lio/reactivex/SingleOnSubscribe;)Lio/reactivex/Single;

    move-result-object v0

    sget-object v1, Lcom/android/camera/constant/GlobalConstant;->sCameraSetupScheduler:Lio/reactivex/Scheduler;

    .line 1654
    invoke-virtual {v0, v1}, Lio/reactivex/Single;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Single;

    move-result-object v0

    .line 1655
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Single;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Single;

    move-result-object v0

    new-instance v1, Lcom/android/camera/module/VideoModule$6;

    invoke-direct {v1, p0}, Lcom/android/camera/module/VideoModule$6;-><init>(Lcom/android/camera/module/VideoModule;)V

    .line 1656
    invoke-virtual {v0, v1}, Lio/reactivex/Single;->subscribe(Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    .line 1662
    return-void
.end method

.method private updateAutoZoomMode()V
    .locals 2

    .line 2339
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    const-string v1, "pref_camera_auto_zoom"

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v0

    .line 2340
    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v0}, Lcom/android/camera2/Camera2Proxy;->setAutoZoomMode(I)V

    .line 2341
    if-eqz v0, :cond_0

    .line 2342
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setAutoZoomScaleOffset(F)V

    .line 2344
    :cond_0
    return-void
.end method

.method private updateFpsRange()V
    .locals 7

    .line 2408
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isDeviceAlive()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2409
    return-void

    .line 2411
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isHFRMode()Z

    move-result v0

    if-nez v0, :cond_6

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isSlowMode()Z

    move-result v0

    if-nez v0, :cond_6

    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isVideoNewSlowMotion()Z

    move-result v0

    if-eqz v0, :cond_1

    goto/16 :goto_3

    .line 2415
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->getSupportedFpsRange()[Landroid/util/Range;

    move-result-object v0

    .line 2416
    const/4 v1, 0x0

    aget-object v2, v0, v1

    .line 2417
    array-length v3, v0

    :goto_0
    if-ge v1, v3, :cond_5

    aget-object v4, v0, v1

    .line 2418
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->getHSRValue()I

    move-result v5

    .line 2419
    const/16 v6, 0x3c

    if-ne v5, v6, :cond_2

    .line 2420
    new-instance v2, Landroid/util/Range;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {v2, v0, v1}, Landroid/util/Range;-><init>(Ljava/lang/Comparable;Ljava/lang/Comparable;)V

    .line 2421
    goto :goto_2

    .line 2422
    :cond_2
    invoke-virtual {v2}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual {v4}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-ge v5, v6, :cond_3

    .line 2423
    goto :goto_1

    .line 2424
    :cond_3
    invoke-virtual {v2}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v5

    invoke-virtual {v4}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v6

    if-ne v5, v6, :cond_4

    .line 2425
    invoke-virtual {v2}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual {v4}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-ge v5, v6, :cond_4

    .line 2426
    nop

    .line 2417
    :goto_1
    move-object v2, v4

    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 2429
    :cond_5
    :goto_2
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "bestRange = "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2436
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v2}, Lcom/android/camera2/Camera2Proxy;->setFpsRange(Landroid/util/Range;)V

    .line 2437
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v2}, Lcom/android/camera2/Camera2Proxy;->setVideoFpsRange(Landroid/util/Range;)V

    goto :goto_4

    .line 2412
    :cond_6
    :goto_3
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mHfrFPSLower = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/android/camera/module/VideoModule;->mHfrFPSLower:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", mHfrFPSUpper = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/android/camera/module/VideoModule;->mHfrFPSUpper:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2413
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    new-instance v1, Landroid/util/Range;

    iget v2, p0, Lcom/android/camera/module/VideoModule;->mHfrFPSLower:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget v3, p0, Lcom/android/camera/module/VideoModule;->mHfrFPSUpper:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/util/Range;-><init>(Ljava/lang/Comparable;Ljava/lang/Comparable;)V

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setVideoFpsRange(Landroid/util/Range;)V

    .line 2439
    :goto_4
    return-void
.end method

.method private updateFrontMirror()V
    .locals 2

    .line 2347
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontMirror()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 2348
    :goto_0
    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v0}, Lcom/android/camera2/Camera2Proxy;->setFrontMirror(Z)V

    .line 2349
    return-void
.end method

.method private updateHfrFPSRange(Landroid/util/Size;I)V
    .locals 6

    .line 711
    nop

    .line 712
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraCapabilities;->getSupportedHighSpeedVideoFPSRange(Landroid/util/Size;)[Landroid/util/Range;

    move-result-object p1

    .line 713
    array-length v0, p1

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_2

    aget-object v3, p1, v2

    .line 714
    invoke-virtual {v3}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-ne v4, p2, :cond_1

    if-eqz v1, :cond_0

    .line 715
    invoke-virtual {v1}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-virtual {v3}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-ge v4, v5, :cond_1

    .line 716
    :cond_0
    nop

    .line 713
    move-object v1, v3

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 719
    :cond_2
    invoke-virtual {v1}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iput p1, p0, Lcom/android/camera/module/VideoModule;->mHfrFPSLower:I

    .line 720
    invoke-virtual {v1}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iput p1, p0, Lcom/android/camera/module/VideoModule;->mHfrFPSUpper:I

    .line 721
    return-void
.end method

.method private updateMutexModePreference()V
    .locals 2

    .line 1974
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentHdr()Lcom/android/camera/data/data/config/ComponentConfigHdr;

    move-result-object v0

    iget v1, p0, Lcom/android/camera/module/VideoModule;->mModuleIndex:I

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    .line 1975
    const-string v1, "on"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1976
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/android/camera/MutexModeManager;->setMutexMode(I)V

    .line 1978
    :cond_0
    return-void
.end method

.method private updatePictureAndPreviewSize()V
    .locals 7

    .line 2352
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v0, v0, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    int-to-double v0, v0

    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v2, v2, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    int-to-double v2, v2

    div-double/2addr v0, v2

    .line 2353
    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    const-class v3, Landroid/media/MediaRecorder;

    .line 2354
    invoke-virtual {v2, v3}, Lcom/android/camera2/CameraCapabilities;->getSupportedOutputSize(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v2

    .line 2355
    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v3, v3, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    iget-object v4, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v4, v4, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    invoke-static {v2, v0, v1, v3, v4}, Lcom/android/camera/Util;->getOptimalVideoSnapshotPictureSize(Ljava/util/List;DII)Lcom/android/camera/CameraSize;

    move-result-object v2

    .line 2357
    iput-object v2, p0, Lcom/android/camera/module/VideoModule;->mVideoSize:Lcom/android/camera/CameraSize;

    .line 2358
    sget-object v3, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "videoSize: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2361
    nop

    .line 2362
    nop

    .line 2363
    invoke-static {}, Lcom/mi/config/b;->gV()Z

    move-result v3

    const v4, 0x7fffffff

    if-eqz v3, :cond_0

    .line 2364
    iget v4, v2, Lcom/android/camera/CameraSize;->width:I

    .line 2365
    iget v3, v2, Lcom/android/camera/CameraSize;->height:I

    goto :goto_0

    .line 2367
    :cond_0
    move v3, v4

    :goto_0
    iget-object v5, p0, Lcom/android/camera/module/VideoModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    const/16 v6, 0x100

    .line 2368
    invoke-virtual {v5, v6}, Lcom/android/camera2/CameraCapabilities;->getSupportedOutputSize(I)Ljava/util/List;

    move-result-object v5

    .line 2369
    invoke-static {v5, v0, v1, v4, v3}, Lcom/android/camera/Util;->getOptimalVideoSnapshotPictureSize(Ljava/util/List;DII)Lcom/android/camera/CameraSize;

    move-result-object v3

    .line 2371
    iput-object v3, p0, Lcom/android/camera/module/VideoModule;->mPictureSize:Lcom/android/camera/CameraSize;

    .line 2372
    sget-object v4, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "pictureSize: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2376
    iget v3, v2, Lcom/android/camera/CameraSize;->width:I

    sget v4, Lcom/android/camera/Util;->sWindowHeight:I

    if-gt v3, v4, :cond_2

    iget v3, v2, Lcom/android/camera/CameraSize;->width:I

    const/16 v4, 0x2d0

    if-ge v3, v4, :cond_1

    goto :goto_1

    .line 2380
    :cond_1
    iget v3, v2, Lcom/android/camera/CameraSize;->width:I

    .line 2381
    iget v2, v2, Lcom/android/camera/CameraSize;->height:I

    goto :goto_2

    .line 2377
    :cond_2
    :goto_1
    sget v3, Lcom/android/camera/Util;->sWindowHeight:I

    .line 2378
    sget v2, Lcom/android/camera/Util;->sWindowWidth:I

    .line 2384
    :goto_2
    iget-object v4, p0, Lcom/android/camera/module/VideoModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    const-class v5, Landroid/graphics/SurfaceTexture;

    .line 2385
    invoke-virtual {v4, v5}, Lcom/android/camera2/CameraCapabilities;->getSupportedOutputSize(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v4

    .line 2386
    invoke-static {v4, v0, v1, v3, v2}, Lcom/android/camera/Util;->getOptimalVideoSnapshotPictureSize(Ljava/util/List;DII)Lcom/android/camera/CameraSize;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/VideoModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    .line 2389
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v0, v0, Lcom/android/camera/CameraSize;->width:I

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v1, v1, Lcom/android/camera/CameraSize;->height:I

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/module/VideoModule;->updateCameraScreenNailSize(II)V

    .line 2390
    return-void
.end method

.method private updateUltraWideLDC()V
    .locals 2

    .line 1930
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->shouldApplyUltraWideLDC()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setUltraWideLDC(Z)V

    .line 1931
    return-void
.end method

.method private updateVideoStabilization()V
    .locals 4

    .line 1901
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isDeviceAlive()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1902
    return-void

    .line 1904
    :cond_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isVideoBokehOn()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1905
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v2, "videoStabilization: disabled EIS and OIS when VIDEO_BOKEH is opened"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1906
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setEnableEIS(Z)V

    .line 1907
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setEnableOIS(Z)V

    .line 1908
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/android/camera/CameraScreenNail;->setVideoStabilizationCropped(Z)V

    .line 1909
    return-void

    .line 1911
    :cond_1
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isEisOn()Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_2

    .line 1912
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v3, "videoStabilization: EIS"

    invoke-static {v0, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1913
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v2}, Lcom/android/camera2/Camera2Proxy;->setEnableEIS(Z)V

    .line 1914
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setEnableOIS(Z)V

    .line 1915
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->isEISPreviewSupported()Z

    move-result v0

    if-nez v0, :cond_3

    .line 1916
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/android/camera/CameraScreenNail;->setVideoStabilizationCropped(Z)V

    goto :goto_0

    .line 1919
    :cond_2
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v3, "videoStabilization: OIS"

    invoke-static {v0, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1920
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setEnableEIS(Z)V

    .line 1921
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v2}, Lcom/android/camera2/Camera2Proxy;->setEnableOIS(Z)V

    .line 1922
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/android/camera/CameraScreenNail;->setVideoStabilizationCropped(Z)V

    .line 1924
    :cond_3
    :goto_0
    return-void
.end method


# virtual methods
.method public varargs consumePreference([I)V
    .locals 6
    .param p1    # [I
        .annotation build Lcom/android/camera/constant/UpdateConstant$UpdateType;
        .end annotation
    .end param

    .line 2241
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_4

    aget v2, p1, v1

    .line 2242
    sparse-switch v2, :sswitch_data_0

    .line 2328
    sget-boolean v3, Lcom/android/camera/module/VideoModule;->DEBUG:Z

    if-nez v3, :cond_3

    .line 2331
    sget-object v3, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "no consumer for this updateType: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    .line 2324
    :sswitch_0
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->updateAutoZoomMode()V

    .line 2325
    goto/16 :goto_2

    .line 2321
    :sswitch_1
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->updateUltraWideLDC()V

    .line 2322
    goto/16 :goto_2

    .line 2313
    :sswitch_2
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->updateFrontMirror()V

    .line 2314
    goto/16 :goto_2

    .line 2317
    :sswitch_3
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->updateDeviceOrientation()V

    .line 2318
    goto/16 :goto_2

    .line 2291
    :sswitch_4
    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v2, :cond_2

    .line 2292
    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mPictureSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v2, v3}, Lcom/android/camera2/Camera2Proxy;->setVideoSnapshotSize(Lcom/android/camera/CameraSize;)V

    goto :goto_2

    .line 2287
    :sswitch_5
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->updateVideoStabilization()V

    .line 2288
    goto :goto_2

    .line 2283
    :sswitch_6
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->updateExposureMeteringMode()V

    .line 2284
    goto :goto_2

    .line 2279
    :sswitch_7
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->focusCenter()V

    .line 2280
    goto :goto_2

    .line 2275
    :sswitch_8
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->getZoomValue()F

    move-result v2

    invoke-virtual {p0, v2}, Lcom/android/camera/module/VideoModule;->setZoomRatio(F)V

    .line 2276
    goto :goto_2

    .line 2271
    :sswitch_9
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->updateFpsRange()V

    .line 2272
    goto :goto_2

    .line 2267
    :sswitch_a
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->updateVideoFocusMode()V

    .line 2268
    goto :goto_2

    .line 2309
    :sswitch_b
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->updateBeauty()V

    .line 2310
    goto :goto_2

    .line 2297
    :sswitch_c
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->setEvValue()V

    .line 2298
    goto :goto_2

    .line 2306
    :sswitch_d
    goto :goto_2

    .line 2263
    :sswitch_e
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->updateFlashPreference()V

    .line 2264
    goto :goto_2

    .line 2256
    :sswitch_f
    invoke-static {}, Lcom/mi/config/b;->gw()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isHFRMode()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isSlowMode()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 2257
    :cond_0
    const-string v2, "0"

    goto :goto_1

    .line 2258
    :cond_1
    invoke-static {}, Lcom/android/camera/CameraSettings;->getAntiBanding()Ljava/lang/String;

    move-result-object v2

    .line 2259
    :goto_1
    invoke-virtual {p0, v2}, Lcom/android/camera/module/VideoModule;->updateAntiBanding(Ljava/lang/String;)V

    .line 2260
    goto :goto_2

    .line 2252
    :sswitch_10
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->updateFace()V

    .line 2253
    goto :goto_2

    .line 2248
    :sswitch_11
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->updateFocusArea()V

    .line 2249
    goto :goto_2

    .line 2244
    :sswitch_12
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->updatePictureAndPreviewSize()V

    .line 2245
    nop

    .line 2241
    :cond_2
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0

    .line 2329
    :cond_3
    new-instance p1, Ljava/lang/RuntimeException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "no consumer for this updateType: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 2336
    :cond_4
    return-void

    nop

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_12
        0x3 -> :sswitch_11
        0x5 -> :sswitch_10
        0x9 -> :sswitch_f
        0xa -> :sswitch_e
        0xb -> :sswitch_d
        0xc -> :sswitch_c
        0xd -> :sswitch_b
        0xe -> :sswitch_a
        0x13 -> :sswitch_9
        0x14 -> :sswitch_d
        0x18 -> :sswitch_8
        0x19 -> :sswitch_7
        0x1d -> :sswitch_6
        0x1e -> :sswitch_d
        0x1f -> :sswitch_5
        0x21 -> :sswitch_4
        0x22 -> :sswitch_d
        0x23 -> :sswitch_3
        0x28 -> :sswitch_2
        0x2a -> :sswitch_d
        0x2f -> :sswitch_1
        0x32 -> :sswitch_d
        0x33 -> :sswitch_0
    .end sparse-switch
.end method

.method protected doLaterReleaseIfNeed()V
    .locals 2

    .line 1744
    invoke-super {p0}, Lcom/android/camera/module/VideoBase;->doLaterReleaseIfNeed()V

    .line 1745
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isFPS960()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1746
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isTextureExpired()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1747
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v1, "doLaterReleaseIfNeed: restartModule..."

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1748
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->restartModule()V

    goto :goto_0

    .line 1750
    :cond_0
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v1, "doLaterReleaseIfNeed: dismissBlurCover..."

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1751
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->dismissBlurCover()V

    .line 1754
    :cond_1
    :goto_0
    return-void
.end method

.method protected enableFaceDetection()Z
    .locals 4

    .line 2394
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isHFRMode()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isSlowMode()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isVideoNewSlowMotion()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "pref_camera_facedetection_key"

    .line 2396
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0f0006

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    .line 2394
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method protected fetchProfile(II)Landroid/media/CamcorderProfile;
    .locals 0

    .line 784
    invoke-static {p1, p2}, Landroid/media/CamcorderProfile;->get(II)Landroid/media/CamcorderProfile;

    move-result-object p1

    return-object p1
.end method

.method protected getNormalVideoFrameRate()I
    .locals 1

    .line 1882
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isHFRMode()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isSlowMode()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    if-eqz v0, :cond_0

    .line 1883
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v0, v0, Landroid/media/CamcorderProfile;->videoFrameRate:I

    return v0

    .line 1886
    :cond_0
    const/16 v0, 0x1e

    return v0
.end method

.method protected getOperatingMode()I
    .locals 4

    .line 2650
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isFrontCamera()Z

    move-result v0

    const v1, 0x8009

    const/4 v2, 0x0

    if-eqz v0, :cond_2

    .line 2651
    invoke-static {}, Lcom/android/camera/CameraSettings;->isVideoBokehOn()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2652
    const v1, 0x8002

    goto :goto_1

    .line 2653
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->isSupportVideoBeauty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2654
    goto :goto_1

    .line 2656
    :cond_1
    nop

    .line 2678
    move v1, v2

    goto :goto_1

    .line 2659
    :cond_2
    const v0, 0xf010

    .line 2660
    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v3}, Lcom/android/camera2/CameraCapabilities;->isSupportVideoBeauty()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isBeautyOn()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 2661
    goto :goto_0

    .line 2662
    :cond_3
    iget v1, p0, Lcom/android/camera/module/VideoModule;->mQuality:I

    if-nez v1, :cond_4

    .line 2663
    nop

    .line 2667
    move v1, v2

    goto :goto_0

    .line 2664
    :cond_4
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isEisOn()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 2665
    const v1, 0x8004

    goto :goto_0

    .line 2667
    :cond_5
    move v1, v0

    :goto_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFovcEnabled()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 2668
    if-eqz v1, :cond_6

    const/4 v2, 0x1

    nop

    :cond_6
    iput-boolean v2, p0, Lcom/android/camera/module/VideoModule;->mFovcEnabled:Z

    .line 2670
    :cond_7
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->getHSRValue()I

    move-result v0

    const/16 v2, 0x3c

    if-ne v0, v2, :cond_8

    .line 2671
    const v0, 0x803c

    .line 2673
    move v1, v0

    :cond_8
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    const-string v2, "pref_camera_auto_zoom"

    invoke-virtual {v0, v2}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 2674
    const v1, 0x80f4

    .line 2678
    :cond_9
    :goto_1
    return v1
.end method

.method public getSupportedSettingKeys()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 253
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 254
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isBackCamera()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 255
    const-string v1, "pref_video_speed_fast_key"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 256
    invoke-static {}, Lcom/mi/config/b;->gw()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 257
    const-string v1, "pref_video_speed_slow_key"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 260
    :cond_0
    return-object v0
.end method

.method protected isAEAFLockSupported()Z
    .locals 1

    .line 2630
    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isFPS960()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public isNeedHapticFeedback()Z
    .locals 1

    .line 2022
    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecordingPaused:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public isNeedMute()Z
    .locals 1

    .line 2027
    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mObjectTrackingStarted:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecordingPaused:Z

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public isPostProcessing()Z
    .locals 1

    .line 2634
    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderPostProcessing:Z

    return v0
.end method

.method protected isShowHFRDuration()Z
    .locals 1

    .line 1878
    const/4 v0, 0x1

    return v0
.end method

.method public isUnInterruptable()Z
    .locals 1

    .line 2639
    invoke-super {p0}, Lcom/android/camera/module/VideoBase;->isUnInterruptable()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2640
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isNormalMode()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderWorking:Z

    if-eqz v0, :cond_0

    .line 2641
    const-string v0, "recorder release"

    iput-object v0, p0, Lcom/android/camera/module/VideoModule;->mUnInterruptableReason:Ljava/lang/String;

    .line 2644
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mUnInterruptableReason:Ljava/lang/String;

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method protected isZoomEnabled()Z
    .locals 1

    .line 2401
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isFPS960()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    if-eqz v0, :cond_0

    .line 2402
    const/4 v0, 0x0

    return v0

    .line 2404
    :cond_0
    invoke-super {p0}, Lcom/android/camera/module/VideoBase;->isZoomEnabled()Z

    move-result v0

    return v0
.end method

.method public onBackPressed()Z
    .locals 9

    .line 363
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isCreated()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 364
    return v1

    .line 367
    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mPaused:Z

    const/4 v2, 0x1

    if-nez v0, :cond_8

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_1

    .line 371
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mStereoSwitchThread:Lcom/android/camera/module/VideoBase$StereoSwitchThread;

    if-eqz v0, :cond_2

    .line 372
    return v1

    .line 375
    :cond_2
    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    if-eqz v0, :cond_5

    .line 376
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 377
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isFPS960()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderPostProcessing:Z

    if-eqz v0, :cond_3

    .line 379
    return v2

    .line 380
    :cond_3
    iget-wide v5, p0, Lcom/android/camera/module/VideoModule;->mLastBackPressedTime:J

    sub-long v5, v3, v5

    const-wide/16 v7, 0xbb8

    cmp-long v0, v5, v7

    if-lez v0, :cond_4

    .line 381
    iput-wide v3, p0, Lcom/android/camera/module/VideoModule;->mLastBackPressedTime:J

    .line 382
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    const v1, 0x7f090122

    invoke-static {v0, v1}, Lcom/android/camera/ToastUtils;->showToast(Landroid/content/Context;I)V

    goto :goto_0

    .line 384
    :cond_4
    invoke-virtual {p0, v2, v1}, Lcom/android/camera/module/VideoModule;->stopVideoRecording(ZZ)V

    .line 386
    :goto_0
    return v2

    .line 389
    :cond_5
    invoke-static {}, Lcom/android/camera/CameraSettings;->isStereoModeOn()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 390
    return v2

    .line 394
    :cond_6
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->isAutoZoomTracking:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 395
    invoke-virtual {p0, v1}, Lcom/android/camera/module/VideoModule;->stopTracking(I)V

    .line 396
    return v2

    .line 399
    :cond_7
    invoke-super {p0}, Lcom/android/camera/module/VideoBase;->onBackPressed()Z

    move-result v0

    return v0

    .line 368
    :cond_8
    :goto_1
    return v2
.end method

.method protected onCameraOpened()V
    .locals 1

    .line 290
    invoke-super {p0}, Lcom/android/camera/module/VideoBase;->onCameraOpened()V

    .line 291
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->updateBeauty()V

    .line 292
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->readVideoPreferences()V

    .line 293
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->initializeFocusManager()V

    .line 294
    sget-object v0, Lcom/android/camera/constant/UpdateConstant;->VIDEO_TYPES_INIT:[I

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoModule;->updatePreferenceTrampoline([I)V

    .line 297
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/camera/module/VideoModule;->initializeRecorder(Z)Z

    move-result v0

    .line 298
    if-eqz v0, :cond_2

    .line 299
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isHFRMode()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isSlowMode()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isVideoNewSlowMotion()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 302
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->startRecordSession()V

    goto :goto_1

    .line 300
    :cond_1
    :goto_0
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->startHighSpeedRecordSession()V

    goto :goto_1

    .line 305
    :cond_2
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->startPreviewSession()V

    .line 308
    :goto_1
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->initAutoZoom()V

    .line 309
    return-void
.end method

.method public onCreate(II)V
    .locals 0

    .line 265
    invoke-super {p0, p1, p2}, Lcom/android/camera/module/VideoBase;->onCreate(II)V

    .line 267
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->changeConflictPreference()V

    .line 268
    iget-object p1, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->getCameraIntentManager()Lcom/android/camera/CameraIntentManager;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/CameraIntentManager;->isVideoCaptureIntent()Z

    move-result p1

    invoke-virtual {p0, p1}, Lcom/android/camera/module/VideoModule;->setCaptureIntent(Z)V

    .line 269
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object p1

    sget p2, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    invoke-virtual {p1, p2}, Lcom/android/camera/effect/EffectController;->setEffect(I)V

    .line 271
    iget-object p1, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->getSensorStateManager()Lcom/android/camera/SensorStateManager;

    move-result-object p1

    iget-object p2, p0, Lcom/android/camera/module/VideoModule;->mSensorStateListener:Lcom/android/camera/SensorStateManager$SensorStateListener;

    invoke-virtual {p1, p2}, Lcom/android/camera/SensorStateManager;->setSensorStateListener(Lcom/android/camera/SensorStateManager$SensorStateListener;)V

    .line 273
    iget-object p1, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->getCameraIntentManager()Lcom/android/camera/CameraIntentManager;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/CameraIntentManager;->isQuickCapture()Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/android/camera/module/VideoModule;->mQuickCapture:Z

    .line 274
    iget-object p1, p0, Lcom/android/camera/module/VideoModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-interface {p1, p0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setObjectViewListener(Lcom/android/camera/ui/ObjectView$ObjectViewListener;)V

    .line 275
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/android/camera/module/VideoModule;->enableCameraControls(Z)V

    .line 276
    iget-object p1, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    const-string p2, "phone"

    invoke-virtual {p1, p2}, Lcom/android/camera/Camera;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/telephony/TelephonyManager;

    iput-object p1, p0, Lcom/android/camera/module/VideoModule;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    .line 278
    const-string p1, "continuous-video"

    iput-object p1, p0, Lcom/android/camera/module/VideoModule;->mVideoFocusMode:Ljava/lang/String;

    .line 280
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 p2, 0xd6

    invoke-virtual {p1, p2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$AutoZoomViewProtocol;

    iput-object p1, p0, Lcom/android/camera/module/VideoModule;->mAutoZoomViewProtocol:Lcom/android/camera/protocol/ModeProtocol$AutoZoomViewProtocol;

    .line 281
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    .line 282
    const/16 p2, 0xac

    invoke-virtual {p1, p2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    iput-object p1, p0, Lcom/android/camera/module/VideoModule;->mTopAlert:Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 284
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->initRecorderSurface()V

    .line 285
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->onCameraOpened()V

    .line 286
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .line 844
    invoke-super {p0}, Lcom/android/camera/module/VideoBase;->onDestroy()V

    .line 845
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->releaseRecorderSurface()V

    .line 846
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x2d

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 847
    return-void
.end method

.method public onError(Landroid/media/MediaRecorder;II)V
    .locals 2

    .line 1274
    sget-object p1, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "MediaRecorder error. what="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " extra="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p1, p3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1275
    const/4 p1, 0x1

    if-eq p2, p1, :cond_0

    const/16 p3, 0x64

    if-ne p2, p3, :cond_2

    .line 1278
    :cond_0
    iget-boolean p2, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    if-eqz p2, :cond_1

    .line 1279
    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/module/VideoModule;->stopVideoRecording(ZZ)V

    .line 1281
    :cond_1
    iget-object p1, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->getScreenHint()Lcom/android/camera/ui/ScreenHint;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/ui/ScreenHint;->updateHint()V

    .line 1283
    :cond_2
    return-void
.end method

.method public onGestureTrack(Landroid/graphics/RectF;Z)Z
    .locals 1

    .line 2033
    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mInStartingFocusRecording:Z

    if-nez v0, :cond_0

    .line 2034
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isBackCamera()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/mi/config/b;->gy()Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/android/camera/module/VideoModule;->mQuality:I

    .line 2035
    invoke-static {v0}, Lcom/android/camera/CameraSettings;->is4KHigherVideoQuality(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 2036
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isCaptureIntent()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2037
    invoke-direct {p0, p1, p2}, Lcom/android/camera/module/VideoModule;->initializeObjectTrack(Landroid/graphics/RectF;Z)Z

    move-result p1

    return p1

    .line 2039
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public onInfo(Landroid/media/MediaRecorder;II)V
    .locals 2

    .line 1287
    iget-boolean p1, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    if-nez p1, :cond_0

    .line 1288
    sget-object p1, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "onInfo: ignore event "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1289
    return-void

    .line 1291
    :cond_0
    const/4 p1, 0x0

    const/4 p3, 0x1

    packed-switch p2, :pswitch_data_0

    .line 1331
    sget-object p1, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "onInfo what : "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 1322
    :pswitch_0
    sget-object p1, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string p2, "next output file started"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1323
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->onMaxFileSizeReached()V

    .line 1324
    iget-object p1, p0, Lcom/android/camera/module/VideoModule;->mNextVideoValues:Landroid/content/ContentValues;

    iput-object p1, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoValues:Landroid/content/ContentValues;

    .line 1325
    iget-object p1, p0, Lcom/android/camera/module/VideoModule;->mNextVideoFileName:Ljava/lang/String;

    iput-object p1, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoFilename:Ljava/lang/String;

    .line 1326
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/android/camera/module/VideoModule;->mNextVideoValues:Landroid/content/ContentValues;

    .line 1327
    iput-object p1, p0, Lcom/android/camera/module/VideoModule;->mNextVideoFileName:Ljava/lang/String;

    .line 1328
    goto/16 :goto_0

    .line 1306
    :pswitch_1
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isSplitWhenReachMaxSize()Z

    move-result p1

    .line 1307
    sget-object p2, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "max file size is approaching. split: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1308
    if-eqz p1, :cond_2

    .line 1309
    iget p1, p0, Lcom/android/camera/module/VideoModule;->mCurrentFileNumber:I

    add-int/2addr p1, p3

    iput p1, p0, Lcom/android/camera/module/VideoModule;->mCurrentFileNumber:I

    .line 1310
    iget p1, p0, Lcom/android/camera/module/VideoModule;->mOutputFormat:I

    iget p2, p0, Lcom/android/camera/module/VideoModule;->mCurrentFileNumber:I

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/module/VideoModule;->genContentValues(II)Landroid/content/ContentValues;

    move-result-object p1

    .line 1311
    const-string p2, "_data"

    invoke-virtual {p1, p2}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 1312
    sget-object p3, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "nextVideoPath: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p3, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1314
    invoke-direct {p0, p2}, Lcom/android/camera/module/VideoModule;->setNextOutputFile(Ljava/lang/String;)Z

    move-result p3

    if-eqz p3, :cond_1

    .line 1315
    iput-object p1, p0, Lcom/android/camera/module/VideoModule;->mNextVideoValues:Landroid/content/ContentValues;

    .line 1316
    iput-object p2, p0, Lcom/android/camera/module/VideoModule;->mNextVideoFileName:Ljava/lang/String;

    .line 1318
    :cond_1
    goto :goto_0

    .line 1297
    :pswitch_2
    sget-object p2, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "reached max size. fileNumber="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/android/camera/module/VideoModule;->mCurrentFileNumber:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1298
    invoke-virtual {p0, p3, p1}, Lcom/android/camera/module/VideoModule;->stopVideoRecording(ZZ)V

    .line 1299
    iget-object p1, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->getScreenHint()Lcom/android/camera/ui/ScreenHint;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/ui/ScreenHint;->isScreenHintVisible()Z

    move-result p1

    if-nez p1, :cond_2

    .line 1300
    iget-object p1, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    const p2, 0x7f0900cb

    invoke-static {p1, p2, p3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object p1

    .line 1301
    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 1293
    :pswitch_3
    invoke-virtual {p0, p3, p1}, Lcom/android/camera/module/VideoModule;->stopVideoRecording(ZZ)V

    .line 1294
    nop

    .line 1334
    :cond_2
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x320
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onObjectStable()V
    .locals 0

    .line 2127
    return-void
.end method

.method public onPause()V
    .locals 3

    .line 802
    invoke-super {p0}, Lcom/android/camera/module/VideoBase;->onPause()V

    .line 803
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mFovcEnabled:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    .line 807
    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->isEISPreviewSupported()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isEisOn()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 808
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->notifyVideoStreamEnd()V

    .line 810
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->waitStereoSwitchThread()V

    .line 811
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoModule;->stopObjectTracking(Z)V

    .line 812
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->releaseResources()V

    .line 814
    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoModule;->updateStereoSettings(Z)V

    .line 822
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->closeVideoFileDescriptor()V

    .line 824
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getSensorStateManager()Lcom/android/camera/SensorStateManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/SensorStateManager;->reset()V

    .line 825
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoModule;->stopFaceDetection(Z)V

    .line 826
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->resetScreenOn()V

    .line 828
    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mHandler:Landroid/os/Handler;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 829
    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result v1

    if-nez v1, :cond_2

    invoke-static {}, Lcom/android/camera/CameraSettings;->isStereoModeOn()Z

    move-result v1

    if-nez v1, :cond_2

    .line 831
    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v1}, Lcom/android/camera/ui/PopupManager;->getInstance(Landroid/content/Context;)Lcom/android/camera/ui/PopupManager;

    move-result-object v1

    invoke-virtual {v1, v2, v0}, Lcom/android/camera/ui/PopupManager;->notifyShowPopup(Landroid/view/View;I)V

    .line 833
    :cond_2
    return-void
.end method

.method public onPauseButtonClick()V
    .locals 6

    .line 2158
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onPauseButtonClick: isRecordingPaused="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecordingPaused:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, " isRecording="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2160
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 2161
    iget-boolean v2, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    if-eqz v2, :cond_3

    iget-wide v2, p0, Lcom/android/camera/module/VideoModule;->mPauseClickTime:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0x1f4

    cmp-long v2, v2, v4

    if-gez v2, :cond_0

    goto :goto_3

    .line 2164
    :cond_0
    iput-wide v0, p0, Lcom/android/camera/module/VideoModule;->mPauseClickTime:J

    .line 2167
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xd4

    .line 2168
    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$RecordState;

    .line 2169
    iget-boolean v1, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecordingPaused:Z

    if-eqz v1, :cond_2

    .line 2171
    :try_start_0
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x18

    if-lt v1, v2, :cond_1

    .line 2172
    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;

    invoke-static {v1}, Lcom/android/camera/lib/compatibility/util/CompatibilityUtils;->resumeMediaRecorder(Landroid/media/MediaRecorder;)V

    goto :goto_0

    .line 2174
    :cond_1
    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v1}, Landroid/media/MediaRecorder;->start()V

    .line 2176
    :goto_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    iget-wide v3, p0, Lcom/android/camera/module/VideoModule;->mVideoRecordedDuration:J

    sub-long/2addr v1, v3

    iput-wide v1, p0, Lcom/android/camera/module/VideoModule;->mRecordingStartTime:J

    .line 2177
    const-wide/16 v1, 0x0

    iput-wide v1, p0, Lcom/android/camera/module/VideoModule;->mVideoRecordedDuration:J

    .line 2178
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecordingPaused:Z

    .line 2179
    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mHandler:Landroid/os/Handler;

    const/16 v2, 0x2a

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 2180
    const-string v1, ""

    iput-object v1, p0, Lcom/android/camera/module/VideoModule;->mRecordingTime:Ljava/lang/String;

    .line 2181
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->updateRecordingTime()V

    .line 2182
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onResume()V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 2183
    :catch_0
    move-exception v1

    .line 2184
    sget-object v2, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v3, "failed to resume media recorder"

    invoke-static {v2, v3, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 2185
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->releaseMediaRecorder()V

    .line 2186
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onFailed()V

    .line 2187
    :goto_1
    goto :goto_2

    .line 2189
    :cond_2
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->pauseVideoRecording()V

    .line 2190
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isFrontCamera()Z

    move-result v1

    invoke-static {v1}, Lcom/android/camera/statistic/CameraStatUtil;->trackPauseVideoRecording(Z)V

    .line 2191
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onPause()V

    .line 2193
    :goto_2
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v1, "onPauseButtonClick"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2194
    return-void

    .line 2162
    :cond_3
    :goto_3
    return-void
.end method

.method public onPreviewLayoutChanged(Landroid/graphics/Rect;)V
    .locals 3

    .line 239
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onPreviewLayoutChanged: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 240
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0, p1}, Lcom/android/camera/Camera;->onLayoutChange(Landroid/graphics/Rect;)V

    .line 242
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 243
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/camera/CameraScreenNail;->setRenderArea(Landroid/graphics/Rect;)V

    .line 244
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    .line 245
    invoke-virtual {v1}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/CameraScreenNail;->getRenderWidth()I

    move-result v1

    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    .line 246
    invoke-virtual {v2}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/CameraScreenNail;->getRenderHeight()I

    move-result v2

    .line 244
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setRenderSize(II)V

    .line 247
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v1

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result p1

    invoke-virtual {v0, v1, p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setPreviewSize(II)V

    .line 249
    :cond_0
    return-void
.end method

.method public onPreviewMetaDataUpdate(Landroid/hardware/camera2/CaptureResult;)V
    .locals 1

    .line 2044
    invoke-super {p0, p1}, Lcom/android/camera/module/VideoBase;->onPreviewMetaDataUpdate(Landroid/hardware/camera2/CaptureResult;)V

    .line 2046
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->isAutoZoomTracking:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2047
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mAutoZoomEmitter:Lio/reactivex/FlowableEmitter;

    invoke-interface {v0, p1}, Lio/reactivex/FlowableEmitter;->onNext(Ljava/lang/Object;)V

    .line 2049
    :cond_0
    return-void
.end method

.method public onPreviewSessionFailed(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 0

    .line 2459
    invoke-super {p0, p1}, Lcom/android/camera/module/VideoBase;->onPreviewSessionFailed(Landroid/hardware/camera2/CameraCaptureSession;)V

    .line 2460
    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/android/camera/module/VideoModule;->enableCameraControls(Z)V

    .line 2461
    return-void
.end method

.method public onPreviewSessionSuccess(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 4

    .line 2443
    invoke-super {p0, p1}, Lcom/android/camera/module/VideoBase;->onPreviewSessionSuccess(Landroid/hardware/camera2/CameraCaptureSession;)V

    .line 2445
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isCreated()Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 2446
    sget-object p1, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v0, "onPreviewSessionSuccess: module is not ready"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 2447
    invoke-virtual {p0, v1}, Lcom/android/camera/module/VideoModule;->enableCameraControls(Z)V

    .line 2448
    return-void

    .line 2451
    :cond_0
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onPreviewSessionSuccess: session="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2452
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/module/VideoModule;->mFaceDetectionEnabled:Z

    .line 2453
    sget-object p1, Lcom/android/camera/constant/UpdateConstant;->VIDEO_TYPES_ON_PREVIEW_SUCCESS:[I

    invoke-virtual {p0, p1}, Lcom/android/camera/module/VideoModule;->updatePreferenceInWorkThread([I)V

    .line 2454
    invoke-virtual {p0, v1}, Lcom/android/camera/module/VideoModule;->enableCameraControls(Z)V

    .line 2455
    return-void
.end method

.method protected onPreviewStart()V
    .locals 2
    .annotation build Landroid/support/annotation/MainThread;
    .end annotation

    .line 955
    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mPreviewing:Z

    if-eqz v0, :cond_0

    .line 956
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-interface {v0, p0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->initializeFocusView(Lcom/android/camera/ui/FocusView$ExposureViewListener;)V

    .line 957
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->updateMutexModePreference()V

    .line 958
    const/4 v0, 0x1

    const/4 v1, 0x3

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/module/VideoModule;->onShutterButtonFocus(ZI)V

    .line 959
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->startVideoRecordingIfNeeded()V

    .line 961
    :cond_0
    return-void
.end method

.method public onSharedPreferenceChanged()V
    .locals 8

    .line 505
    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mPaused:Z

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 509
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-nez v0, :cond_1

    .line 510
    return-void

    .line 513
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v0, v0, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    .line 514
    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v1, v1, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    .line 515
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->readVideoPreferences()V

    .line 516
    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v2, v2, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    if-ne v2, v0, :cond_2

    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v2, v2, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    if-eq v2, v1, :cond_3

    .line 517
    :cond_2
    sget-object v2, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    sget-object v3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v4, "profile size changed [%d %d]->[%d %d]"

    const/4 v5, 0x4

    new-array v5, v5, [Ljava/lang/Object;

    .line 518
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v6, 0x0

    aput-object v0, v5, v6

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v1, 0x1

    aput-object v0, v5, v1

    const/4 v0, 0x2

    iget-object v7, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v7, v7, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v0

    const/4 v0, 0x3

    iget-object v7, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v7, v7, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v0

    .line 517
    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 519
    new-array v0, v1, [I

    aput v1, v0, v6

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoModule;->updatePreferenceTrampoline([I)V

    .line 521
    :cond_3
    return-void

    .line 506
    :cond_4
    :goto_0
    return-void
.end method

.method public onShutterButtonClick(I)V
    .locals 4

    .line 426
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onShutterButtonClick isRecording="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, " inStartingFocusRecording="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Lcom/android/camera/module/VideoModule;->mInStartingFocusRecording:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 429
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mInStartingFocusRecording:Z

    .line 430
    const-wide/16 v1, 0x0

    iput-wide v1, p0, Lcom/android/camera/module/VideoModule;->mLastBackPressedTime:J

    .line 431
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isIgnoreTouchEvent()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 432
    sget-object p1, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v0, "onShutterButtonClick: ignore touch event"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 433
    return-void

    .line 436
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isFrontCamera()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->isScreenSlideOff()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 437
    return-void

    .line 441
    :cond_1
    iget-boolean v1, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    .line 442
    const/4 v2, 0x1

    if-eqz v1, :cond_2

    .line 444
    nop

    .line 445
    invoke-virtual {p0, v2, v0}, Lcom/android/camera/module/VideoModule;->stopVideoRecording(ZZ)V

    .line 446
    goto :goto_0

    .line 448
    :cond_2
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v3, 0xd4

    .line 449
    invoke-virtual {v1, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$RecordState;

    .line 450
    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onPrepare()V

    .line 452
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->checkCallingState()Z

    move-result v3

    if-nez v3, :cond_3

    .line 453
    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onFailed()V

    .line 454
    return-void

    .line 457
    :cond_3
    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v3}, Lcom/android/camera/Camera;->getScreenHint()Lcom/android/camera/ui/ScreenHint;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/ui/ScreenHint;->updateHint()V

    .line 458
    invoke-static {}, Lcom/android/camera/storage/Storage;->isLowStorageAtLastPoint()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 459
    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onFailed()V

    .line 460
    return-void

    .line 463
    :cond_4
    invoke-virtual {p0, p1}, Lcom/android/camera/module/VideoModule;->setTriggerMode(I)V

    .line 464
    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoModule;->enableCameraControls(Z)V

    .line 466
    const/4 p1, 0x2

    invoke-virtual {p0, p1}, Lcom/android/camera/module/VideoModule;->playCameraSound(I)V

    .line 467
    iget-object p1, p0, Lcom/android/camera/module/VideoModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->canRecord()Z

    move-result p1

    if-eqz p1, :cond_5

    .line 468
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->startVideoRecording()V

    goto :goto_0

    .line 470
    :cond_5
    sget-object p1, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v0, "wait for autoFocus"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 471
    iput-boolean v2, p0, Lcom/android/camera/module/VideoModule;->mInStartingFocusRecording:Z

    .line 472
    iget-object p1, p0, Lcom/android/camera/module/VideoModule;->mHandler:Landroid/os/Handler;

    const/16 v0, 0x37

    const-wide/16 v1, 0xbb8

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 475
    :goto_0
    return-void
.end method

.method public onShutterButtonFocus(ZI)V
    .locals 0

    .line 421
    return-void
.end method

.method public onSingleTapUp(II)V
    .locals 2

    .line 1983
    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mPaused:Z

    if-nez v0, :cond_5

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    .line 1985
    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->isSessionReady()Z

    move-result v0

    if-eqz v0, :cond_5

    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mSnapshotInProgress:Z

    if-nez v0, :cond_5

    .line 1987
    invoke-virtual {p0, p1, p2}, Lcom/android/camera/module/VideoModule;->isInTapableRect(II)Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->isAutoZoomTracking:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 1988
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 1992
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isFrameAvailable()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1993
    sget-object p1, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string p2, "onSingleTapUp: frame not available"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1994
    return-void

    .line 1997
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->isScreenSlideOff()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1998
    return-void

    .line 2002
    :cond_2
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xab

    .line 2003
    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BackStack;

    .line 2004
    invoke-interface {v0, p1, p2}, Lcom/android/camera/protocol/ModeProtocol$BackStack;->handleBackStackFromTapDown(II)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 2005
    return-void

    .line 2008
    :cond_3
    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mObjectTrackingStarted:Z

    if-eqz v0, :cond_4

    .line 2009
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoModule;->stopObjectTracking(Z)V

    .line 2011
    :cond_4
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->unlockAEAF()V

    .line 2013
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setFocusViewType(Z)V

    .line 2014
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/module/VideoModule;->mTouchFocusStartingTime:J

    .line 2015
    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0, p1, p2}, Landroid/graphics/Point;-><init>(II)V

    .line 2016
    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoModule;->mapTapCoordinate(Ljava/lang/Object;)V

    .line 2017
    iget-object p1, p0, Lcom/android/camera/module/VideoModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    iget p2, v0, Landroid/graphics/Point;->x:I

    iget v0, v0, Landroid/graphics/Point;->y:I

    invoke-virtual {p1, p2, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->onSingleTapUp(II)V

    .line 2018
    return-void

    .line 1989
    :cond_5
    :goto_0
    return-void
.end method

.method public onStop()V
    .locals 2

    .line 837
    invoke-super {p0}, Lcom/android/camera/module/VideoBase;->onStop()V

    .line 838
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 839
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->exitSavePowerMode()V

    .line 840
    return-void
.end method

.method public onUserInteraction()V
    .locals 1

    .line 2621
    invoke-super {p0}, Lcom/android/camera/module/VideoBase;->onUserInteraction()V

    .line 2622
    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    if-eqz v0, :cond_0

    .line 2623
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->keepPowerSave()V

    .line 2625
    :cond_0
    return-void
.end method

.method public onVideoRecordStopped()V
    .locals 3

    .line 2465
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onVideoRecordStopped: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Lcom/android/camera/module/VideoModule;->mPendingStopRecorder:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2466
    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mPendingStopRecorder:Z

    if-eqz v0, :cond_0

    .line 2467
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->stopRecorder()V

    .line 2468
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->startPreviewAfterRecord()V

    .line 2470
    :cond_0
    return-void
.end method

.method protected onWaitStopCallbackTimeout()V
    .locals 0

    .line 1573
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->stopRecorder()V

    .line 1574
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->startPreviewAfterRecord()V

    .line 1575
    return-void
.end method

.method protected pauseMediaRecorder(Landroid/media/MediaRecorder;)V
    .locals 0

    .line 2213
    invoke-static {p1}, Lcom/android/camera/lib/compatibility/util/CompatibilityUtils;->pauseMediaRecorder(Landroid/media/MediaRecorder;)V

    .line 2214
    return-void
.end method

.method public pausePreview()V
    .locals 2

    .line 930
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v1, "pausePreview"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 931
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mPreviewing:Z

    .line 932
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->currentIsMainThread()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 933
    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoModule;->stopObjectTracking(Z)V

    .line 935
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_1

    .line 936
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->pausePreview()V

    .line 938
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    if-eqz v0, :cond_2

    .line 939
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->resetFocused()V

    .line 941
    :cond_2
    return-void
.end method

.method protected readVideoPreferences()V
    .locals 10

    .line 527
    invoke-static {}, Lcom/android/camera/CameraSettings;->getVideoQuality()I

    move-result v0

    .line 531
    const/4 v1, 0x1

    const/4 v2, 0x0

    :try_start_0
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/Camera;->getCameraIntentManager()Lcom/android/camera/CameraIntentManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/CameraIntentManager;->getVideoQuality()I

    move-result v3
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    if-lez v3, :cond_0

    .line 532
    nop

    .line 538
    move v0, v1

    goto :goto_0

    .line 534
    :cond_0
    nop

    .line 538
    move v0, v2

    :goto_0
    goto :goto_1

    .line 536
    :catch_0
    move-exception v3

    .line 540
    :goto_1
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v3

    .line 541
    invoke-virtual {v3}, Lcom/android/camera/data/data/runing/DataItemRunning;->getVideoSpeed()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/android/camera/module/VideoModule;->mSpeed:Ljava/lang/String;

    .line 544
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isVideoNewSlowMotion()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 545
    const-string v3, "fps960"

    iput-object v3, p0, Lcom/android/camera/module/VideoModule;->mSpeed:Ljava/lang/String;

    goto :goto_2

    .line 547
    :cond_1
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/android/camera/module/VideoModule;->mSlowModeFps:Ljava/lang/String;

    .line 550
    :goto_2
    iput v2, p0, Lcom/android/camera/module/VideoModule;->mTimeBetweenTimeLapseFrameCaptureMs:I

    .line 551
    iput-boolean v2, p0, Lcom/android/camera/module/VideoModule;->mCaptureTimeLapse:Z

    .line 553
    const-string v3, "fast"

    iget-object v4, p0, Lcom/android/camera/module/VideoModule;->mSpeed:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const/16 v4, 0x3e8

    if-eqz v3, :cond_5

    .line 555
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v3

    const-string v5, "pref_video_time_lapse_frame_interval_key"

    const v6, 0x7f090037

    .line 557
    invoke-virtual {p0, v6}, Lcom/android/camera/module/VideoModule;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 555
    invoke-virtual {v3, v5, v6}, Lcom/android/camera/data/data/global/DataItemGlobal;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 558
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    iput v3, p0, Lcom/android/camera/module/VideoModule;->mTimeBetweenTimeLapseFrameCaptureMs:I

    .line 559
    iget v3, p0, Lcom/android/camera/module/VideoModule;->mTimeBetweenTimeLapseFrameCaptureMs:I

    if-eqz v3, :cond_2

    move v3, v1

    goto :goto_3

    :cond_2
    move v3, v2

    :goto_3
    iput-boolean v3, p0, Lcom/android/camera/module/VideoModule;->mCaptureTimeLapse:Z

    .line 561
    iget-boolean v3, p0, Lcom/android/camera/module/VideoModule;->mCaptureTimeLapse:Z

    if-eqz v3, :cond_4

    .line 562
    add-int/lit16 v0, v0, 0x3e8

    .line 563
    if-lt v0, v4, :cond_3

    const/16 v3, 0x3f0

    if-le v0, v3, :cond_4

    .line 565
    :cond_3
    add-int/lit16 v0, v0, -0x3e8

    .line 566
    iput-boolean v2, p0, Lcom/android/camera/module/VideoModule;->mCaptureTimeLapse:Z

    .line 567
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->forceToNormalMode()V

    .line 568
    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v3}, Lcom/android/camera/ui/RotateTextToast;->getInstance(Landroid/app/Activity;)Lcom/android/camera/ui/RotateTextToast;

    move-result-object v3

    const v5, 0x7f090124

    iget v6, p0, Lcom/android/camera/module/VideoModule;->mOrientation:I

    invoke-virtual {v3, v5, v6}, Lcom/android/camera/ui/RotateTextToast;->show(II)V

    .line 571
    :cond_4
    rem-int/lit16 v3, v0, 0x3e8

    iput v3, p0, Lcom/android/camera/module/VideoModule;->mQuality:I

    .line 572
    goto/16 :goto_b

    :cond_5
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isHFRMode()Z

    move-result v3

    const/4 v5, 0x5

    const/16 v6, 0x78

    const/4 v7, 0x6

    if-nez v3, :cond_d

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isSlowMode()Z

    move-result v3

    if-eqz v3, :cond_6

    goto :goto_6

    .line 606
    :cond_6
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isVideoNewSlowMotion()Z

    move-result v3

    if-eqz v3, :cond_b

    .line 608
    iput v7, p0, Lcom/android/camera/module/VideoModule;->mQuality:I

    .line 609
    sget-object v0, Lcom/android/camera/module/VideoModule;->SIZE_1080:Landroid/util/Size;

    .line 610
    invoke-static {}, Lcom/android/camera/CameraSettings;->getNewSlowMotionIQ()I

    move-result v3

    .line 611
    if-ne v3, v5, :cond_7

    .line 612
    sget-object v0, Lcom/android/camera/module/VideoModule;->SIZE_720:Landroid/util/Size;

    .line 613
    iput v3, p0, Lcom/android/camera/module/VideoModule;->mQuality:I

    .line 616
    :cond_7
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v7

    invoke-virtual {v7}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentConfigSlowMotion()Lcom/android/camera/data/data/config/ComponentConfigSlowMotion;

    move-result-object v7

    const/16 v8, 0xac

    .line 617
    invoke-virtual {v7, v8}, Lcom/android/camera/data/data/config/ComponentConfigSlowMotion;->getComponentValue(I)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/android/camera/module/VideoModule;->mSlowModeFps:Ljava/lang/String;

    .line 619
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isFPS120()Z

    move-result v7

    if-eqz v7, :cond_9

    .line 620
    invoke-direct {p0, v0, v6}, Lcom/android/camera/module/VideoModule;->updateHfrFPSRange(Landroid/util/Size;I)V

    .line 637
    :cond_8
    :goto_4
    move v0, v3

    goto :goto_5

    .line 623
    :cond_9
    invoke-static {v2}, Lcom/android/camera/CameraSettings;->getSupportedHfrSettings(I)Ljava/util/ArrayList;

    move-result-object v6

    .line 624
    const-string v7, "1920x1080:240"

    invoke-interface {v6, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v6

    .line 625
    if-nez v6, :cond_a

    .line 626
    sget-object v0, Lcom/android/camera/module/VideoModule;->SIZE_720:Landroid/util/Size;

    .line 627
    iput v5, p0, Lcom/android/camera/module/VideoModule;->mQuality:I

    .line 630
    move v3, v5

    :cond_a
    const/16 v5, 0xf0

    invoke-direct {p0, v0, v5}, Lcom/android/camera/module/VideoModule;->updateHfrFPSRange(Landroid/util/Size;I)V

    .line 631
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isFPS960()Z

    move-result v0

    if-eqz v0, :cond_8

    .line 633
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->showFPS960Hint()V

    goto :goto_4

    .line 637
    :goto_5
    goto/16 :goto_b

    .line 638
    :cond_b
    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v3}, Lcom/android/camera2/CameraCapabilities;->isSupportVideoBeauty()Z

    move-result v3

    if-eqz v3, :cond_c

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isBeautyOn()Z

    move-result v3

    if-eqz v3, :cond_c

    .line 639
    invoke-static {v0, v7}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 641
    :cond_c
    iput v0, p0, Lcom/android/camera/module/VideoModule;->mQuality:I

    goto/16 :goto_b

    .line 573
    :cond_d
    :goto_6
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->getHfrSetting()Ljava/lang/String;

    move-result-object v3

    .line 574
    const-string v8, ":"

    invoke-virtual {v3, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v8

    .line 575
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isSlowMode()Z

    move-result v9

    if-eqz v9, :cond_e

    .line 576
    aget-object v5, v8, v2

    invoke-direct {p0, v5}, Lcom/android/camera/module/VideoModule;->convertSizeToQuality(Ljava/lang/String;)I

    move-result v5

    iput v5, p0, Lcom/android/camera/module/VideoModule;->mQuality:I

    goto :goto_7

    .line 578
    :cond_e
    invoke-static {v0, v7}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 579
    invoke-static {v0, v5}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 580
    iput v0, p0, Lcom/android/camera/module/VideoModule;->mQuality:I

    .line 582
    :goto_7
    iget v5, p0, Lcom/android/camera/module/VideoModule;->mQuality:I

    const/4 v9, -0x1

    if-ne v5, v9, :cond_f

    .line 583
    sget-object v5, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "invalid hfr setting: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v5, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 584
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->forceToNormalMode()V

    .line 585
    iput v0, p0, Lcom/android/camera/module/VideoModule;->mQuality:I

    goto :goto_a

    .line 587
    :cond_f
    iget v0, p0, Lcom/android/camera/module/VideoModule;->mQuality:I

    .line 588
    nop

    .line 589
    if-ne v7, v0, :cond_10

    .line 590
    new-instance v3, Landroid/util/Size;

    const/16 v5, 0x780

    const/16 v7, 0x438

    invoke-direct {v3, v5, v7}, Landroid/util/Size;-><init>(II)V

    goto :goto_8

    .line 592
    :cond_10
    new-instance v3, Landroid/util/Size;

    const/16 v5, 0x500

    const/16 v7, 0x2d0

    invoke-direct {v3, v5, v7}, Landroid/util/Size;-><init>(II)V

    .line 595
    :goto_8
    aget-object v5, v8, v1

    invoke-static {v5, v6}, Lcom/android/camera/Util;->parseInt(Ljava/lang/String;I)I

    move-result v5

    .line 596
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isHFRMode()Z

    move-result v7

    if-eqz v7, :cond_12

    .line 597
    iget-object v5, p0, Lcom/android/camera/module/VideoModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v5, v3}, Lcom/android/camera2/CameraCapabilities;->getSupportedHFRVideoFPSList(Landroid/util/Size;)Ljava/util/List;

    move-result-object v5

    .line 598
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v5, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_11

    .line 599
    goto :goto_9

    .line 601
    :cond_11
    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v6

    goto :goto_9

    .line 604
    :cond_12
    move v6, v5

    :goto_9
    invoke-direct {p0, v3, v6}, Lcom/android/camera/module/VideoModule;->updateHfrFPSRange(Landroid/util/Size;I)V

    .line 606
    :goto_a
    nop

    .line 644
    :goto_b
    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    if-eqz v3, :cond_13

    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v3, v3, Landroid/media/CamcorderProfile;->quality:I

    rem-int/2addr v3, v4

    iget v5, p0, Lcom/android/camera/module/VideoModule;->mQuality:I

    if-eq v3, v5, :cond_13

    .line 645
    invoke-virtual {p0, v2}, Lcom/android/camera/module/VideoModule;->stopObjectTracking(Z)V

    .line 647
    :cond_13
    iget v3, p0, Lcom/android/camera/module/VideoModule;->mBogusCameraId:I

    invoke-virtual {p0, v3, v0}, Lcom/android/camera/module/VideoModule;->fetchProfile(II)Landroid/media/CamcorderProfile;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    .line 648
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    invoke-static {}, Lcom/android/camera/CameraSettings;->getVideoEncoder()I

    move-result v3

    iput v3, v0, Landroid/media/CamcorderProfile;->videoCodec:I

    .line 649
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v0, v0, Landroid/media/CamcorderProfile;->fileFormat:I

    iput v0, p0, Lcom/android/camera/module/VideoModule;->mOutputFormat:I

    .line 650
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    sget-object v3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v5, "frameRate=%d profileSize=%dx%d codec=%d"

    const/4 v6, 0x4

    new-array v6, v6, [Ljava/lang/Object;

    .line 651
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->getHSRValue()I

    move-result v7

    if-lez v7, :cond_14

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->getHSRValue()I

    move-result v7

    goto :goto_c

    :cond_14
    iget-object v7, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v7, v7, Landroid/media/CamcorderProfile;->videoFrameRate:I

    :goto_c
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v2

    iget-object v7, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v7, v7, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v1

    const/4 v1, 0x2

    iget-object v7, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v7, v7, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    .line 652
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v1

    const/4 v1, 0x3

    iget-object v7, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v7, v7, Landroid/media/CamcorderProfile;->videoCodec:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v1

    .line 650
    invoke-static {v3, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 654
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isHFRMode()Z

    move-result v0

    if-nez v0, :cond_16

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isSlowMode()Z

    move-result v0

    if-nez v0, :cond_16

    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isVideoNewSlowMotion()Z

    move-result v0

    if-eqz v0, :cond_15

    goto :goto_d

    .line 657
    :cond_15
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v0, v0, Landroid/media/CamcorderProfile;->videoFrameRate:I

    iput v0, p0, Lcom/android/camera/module/VideoModule;->mFrameRate:I

    goto :goto_e

    .line 655
    :cond_16
    :goto_d
    iget v0, p0, Lcom/android/camera/module/VideoModule;->mHfrFPSUpper:I

    iput v0, p0, Lcom/android/camera/module/VideoModule;->mFrameRate:I

    .line 662
    :goto_e
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isFPS960()Z

    move-result v0

    if-eqz v0, :cond_17

    .line 664
    const/16 v0, 0x7d0

    iput v0, p0, Lcom/android/camera/module/VideoModule;->mMaxVideoDurationInMs:I

    goto :goto_10

    .line 667
    :cond_17
    :try_start_1
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraIntentManager()Lcom/android/camera/CameraIntentManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraIntentManager;->getVideoDurationTime()I

    move-result v0

    mul-int/2addr v0, v4

    iput v0, p0, Lcom/android/camera/module/VideoModule;->mMaxVideoDurationInMs:I
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_1

    .line 674
    goto :goto_f

    .line 668
    :catch_1
    move-exception v0

    .line 669
    iget v0, p0, Lcom/android/camera/module/VideoModule;->mQuality:I

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->is4KHigherVideoQuality(I)Z

    move-result v0

    if-eqz v0, :cond_18

    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mCaptureTimeLapse:Z

    if-nez v0, :cond_18

    .line 670
    const v0, 0x75300

    iput v0, p0, Lcom/android/camera/module/VideoModule;->mMaxVideoDurationInMs:I

    goto :goto_f

    .line 672
    :cond_18
    iput v2, p0, Lcom/android/camera/module/VideoModule;->mMaxVideoDurationInMs:I

    .line 677
    :goto_f
    iget v0, p0, Lcom/android/camera/module/VideoModule;->mMaxVideoDurationInMs:I

    if-eqz v0, :cond_19

    iget v0, p0, Lcom/android/camera/module/VideoModule;->mMaxVideoDurationInMs:I

    if-ge v0, v4, :cond_19

    .line 679
    iput v4, p0, Lcom/android/camera/module/VideoModule;->mMaxVideoDurationInMs:I

    .line 682
    :cond_19
    :goto_10
    return-void
.end method

.method public registerProtocol()V
    .locals 3

    .line 215
    invoke-super {p0}, Lcom/android/camera/module/VideoBase;->registerProtocol()V

    .line 216
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 217
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa7

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 218
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa9

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 219
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc7

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 220
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xd7

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 221
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getImplFactory()Lcom/android/camera/module/impl/ImplFactory;

    move-result-object v0

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v1

    const/4 v2, 0x2

    new-array v2, v2, [I

    fill-array-data v2, :array_0

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/module/impl/ImplFactory;->initAdditional(Lcom/android/camera/ActivityBase;[I)V

    .line 224
    return-void

    :array_0
    .array-data 4
        0xa4
        0xd4
    .end array-data
.end method

.method protected resizeForPreviewAspectRatio()V
    .locals 3

    .line 789
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v0}, Lcom/android/camera/Util;->getDisplayRotation(Landroid/app/Activity;)I

    move-result v0

    .line 792
    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v1}, Lcom/android/camera2/CameraCapabilities;->getSensorOrientation()I

    move-result v1

    .line 793
    sub-int/2addr v1, v0

    add-int/lit16 v1, v1, 0x168

    rem-int/lit16 v1, v1, 0xb4

    if-nez v1, :cond_0

    .line 794
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mVideoSize:Lcom/android/camera/CameraSize;

    iget v1, v1, Lcom/android/camera/CameraSize;->height:I

    int-to-float v1, v1

    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mVideoSize:Lcom/android/camera/CameraSize;

    iget v2, v2, Lcom/android/camera/CameraSize;->width:I

    int-to-float v2, v2

    div-float/2addr v1, v2

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setPreviewAspectRatio(F)V

    goto :goto_0

    .line 796
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mVideoSize:Lcom/android/camera/CameraSize;

    iget v1, v1, Lcom/android/camera/CameraSize;->width:I

    int-to-float v1, v1

    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mVideoSize:Lcom/android/camera/CameraSize;

    iget v2, v2, Lcom/android/camera/CameraSize;->height:I

    int-to-float v2, v2

    div-float/2addr v1, v2

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setPreviewAspectRatio(F)V

    .line 798
    :goto_0
    return-void
.end method

.method public resumePreview()V
    .locals 2

    .line 945
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v1, "resumePreview"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 946
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mPreviewing:Z

    .line 947
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_0

    .line 948
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->resumePreview()V

    .line 950
    :cond_0
    return-void
.end method

.method public setAutoZoomMode(I)V
    .locals 2

    .line 2534
    const/4 p1, 0x1

    new-array p1, p1, [I

    const/4 v0, 0x0

    const/16 v1, 0x33

    aput v1, p1, v0

    invoke-virtual {p0, p1}, Lcom/android/camera/module/VideoModule;->updatePreferenceInWorkThread([I)V

    .line 2535
    return-void
.end method

.method public setAutoZoomStartCapture(Landroid/graphics/RectF;)V
    .locals 4

    .line 2539
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v1, 0x4

    new-array v1, v1, [F

    iget v2, p1, Landroid/graphics/RectF;->left:F

    const/4 v3, 0x0

    aput v2, v1, v3

    iget v2, p1, Landroid/graphics/RectF;->top:F

    const/4 v3, 0x1

    aput v2, v1, v3

    iget v2, p1, Landroid/graphics/RectF;->right:F

    const/4 v3, 0x2

    aput v2, v1, v3

    iget p1, p1, Landroid/graphics/RectF;->bottom:F

    const/4 v2, 0x3

    aput p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setAutoZoomStartCapture([F)V

    .line 2540
    return-void
.end method

.method public setAutoZoomStopCapture(I)V
    .locals 1

    .line 2544
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, p1}, Lcom/android/camera2/Camera2Proxy;->setAutoZoomStopCapture(I)V

    .line 2545
    return-void
.end method

.method public showFPS960Hint()V
    .locals 2

    .line 685
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x36

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 686
    return-void
.end method

.method public startAutoZoom()V
    .locals 2

    .line 2475
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->isAutoZoomTracking:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    .line 2476
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/camera/module/VideoModule$9;

    invoke-direct {v1, p0}, Lcom/android/camera/module/VideoModule$9;-><init>(Lcom/android/camera/module/VideoModule;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 2485
    return-void
.end method

.method public startObjectTracking()V
    .locals 3

    .line 2105
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "startObjectTracking: started="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Lcom/android/camera/module/VideoModule;->mObjectTrackingStarted:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2118
    return-void
.end method

.method public startPreview()V
    .locals 3

    .line 921
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "startPreview: previewing="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Lcom/android/camera/module/VideoModule;->mPreviewing:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 922
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->checkDisplayOrientation()V

    .line 925
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mPreviewing:Z

    .line 926
    return-void
.end method

.method public startTracking(Landroid/graphics/RectF;)V
    .locals 6

    .line 2504
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mTopAlert:Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    const/4 v1, 0x0

    const/4 v2, 0x4

    const-wide/16 v3, 0x0

    invoke-interface {v0, v2, v1, v3, v4}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertAiDetectTipHint(IIJ)V

    .line 2506
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mAutoZoomUiDisposable:Lio/reactivex/disposables/Disposable;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mAutoZoomUiDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2507
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mAutoZoomUiDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 2508
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/module/VideoModule;->mAutoZoomUiDisposable:Lio/reactivex/disposables/Disposable;

    .line 2511
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v3, -0x1

    invoke-virtual {v0, v3}, Lcom/android/camera2/Camera2Proxy;->setAutoZoomStopCapture(I)V

    .line 2512
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    new-array v3, v2, [F

    iget v4, p1, Landroid/graphics/RectF;->left:F

    aput v4, v3, v1

    iget v1, p1, Landroid/graphics/RectF;->top:F

    const/4 v4, 0x1

    aput v1, v3, v4

    const/4 v1, 0x2

    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v5

    aput v5, v3, v1

    const/4 v1, 0x3

    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result p1

    aput p1, v3, v1

    invoke-virtual {v0, v3}, Lcom/android/camera2/Camera2Proxy;->setAutoZoomStartCapture([F)V

    .line 2513
    iget-object p1, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    new-array v0, v2, [F

    fill-array-data v0, :array_0

    invoke-virtual {p1, v0}, Lcom/android/camera2/Camera2Proxy;->setAutoZoomStartCapture([F)V

    .line 2515
    iget-object p1, p0, Lcom/android/camera/module/VideoModule;->isAutoZoomTracking:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p1, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    .line 2517
    iget-boolean p1, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtil;->trackSelectObject(Z)V

    .line 2518
    return-void

    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x0
    .end array-data
.end method

.method protected startVideoRecording()V
    .locals 3

    .line 1380
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "startVideoRecording: mode="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mSpeed:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1381
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isDeviceAlive()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1382
    return-void

    .line 1384
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mSpeed:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isFrontCamera()Z

    move-result v1

    invoke-static {v0, v1}, Lcom/android/camera/statistic/ScenarioTrackUtil;->trackStartVideoRecordStart(Ljava/lang/String;Z)V

    .line 1385
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isCaptureIntent()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, -0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    iput v0, p0, Lcom/android/camera/module/VideoModule;->mCurrentFileNumber:I

    .line 1386
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->silenceSounds()V

    .line 1387
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->startRecorder()Z

    move-result v0

    if-nez v0, :cond_2

    .line 1388
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->onStartRecorderFail()V

    .line 1389
    return-void

    .line 1392
    :cond_2
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xd4

    .line 1393
    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$RecordState;

    .line 1394
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onStart()V

    .line 1396
    sget-object v0, Lcom/android/camera/constant/UpdateConstant;->VIDEO_TYPES_RECORD:[I

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoModule;->updatePreferenceTrampoline([I)V

    .line 1397
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isHFRMode()Z

    move-result v0

    if-nez v0, :cond_4

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isSlowMode()Z

    move-result v0

    if-nez v0, :cond_4

    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isVideoNewSlowMotion()Z

    move-result v0

    if-eqz v0, :cond_3

    goto :goto_1

    .line 1400
    :cond_3
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->startRecording()V

    goto :goto_2

    .line 1398
    :cond_4
    :goto_1
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->startHighSpeedRecording()V

    .line 1402
    :goto_2
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v1, "startVideoRecording process done"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1403
    invoke-static {}, Lcom/android/camera/statistic/ScenarioTrackUtil;->trackStartVideoRecordEnd()V

    .line 1404
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->onStartRecorderSucceed()V

    .line 1406
    return-void
.end method

.method public stopAutoZoom()V
    .locals 2

    .line 2490
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->isAutoZoomTracking:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    .line 2491
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/camera/module/VideoModule$10;

    invoke-direct {v1, p0}, Lcom/android/camera/module/VideoModule$10;-><init>(Lcom/android/camera/module/VideoModule;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 2500
    return-void
.end method

.method public stopObjectTracking(Z)V
    .locals 2

    .line 2131
    sget-object p1, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "stopObjectTracking: started="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/android/camera/module/VideoModule;->mObjectTrackingStarted:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2152
    return-void
.end method

.method public stopTracking(I)V
    .locals 2

    .line 2522
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->isAutoZoomTracking:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2523
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->isAutoZoomTracking:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    .line 2524
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_0

    .line 2525
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setAutoZoomStopCapture(I)V

    .line 2526
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setAutoZoomStopCapture(I)V

    .line 2528
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mAutoZoomViewProtocol:Lcom/android/camera/protocol/ModeProtocol$AutoZoomViewProtocol;

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$AutoZoomViewProtocol;->onTrackingStopped(I)V

    .line 2530
    :cond_1
    return-void
.end method

.method public stopVideoRecording(ZZ)V
    .locals 21

    move-object/from16 v0, p0

    move/from16 v1, p1

    .line 1499
    sget-object v2, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "stopVideoRecording>>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v4, v0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v4, "|"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v4, "|"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v4, v0, Lcom/android/camera/module/VideoModule;->mMediaRecorderPostProcessing:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1500
    iget-boolean v2, v0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    if-eqz v2, :cond_a

    invoke-direct/range {p0 .. p0}, Lcom/android/camera/module/VideoModule;->isFPS960()Z

    move-result v2

    if-eqz v2, :cond_0

    iget-boolean v2, v0, Lcom/android/camera/module/VideoModule;->mMediaRecorderPostProcessing:Z

    if-eqz v2, :cond_0

    goto/16 :goto_6

    .line 1504
    :cond_0
    iget-object v2, v0, Lcom/android/camera/module/VideoModule;->isAutoZoomTracking:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_1

    .line 1505
    invoke-virtual {v0, v3}, Lcom/android/camera/module/VideoModule;->stopTracking(I)V

    .line 1508
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 1509
    invoke-direct/range {p0 .. p0}, Lcom/android/camera/module/VideoModule;->isFPS960()Z

    move-result v2

    const/4 v6, 0x1

    if-eqz v2, :cond_3

    .line 1510
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v7

    iget-wide v9, v0, Lcom/android/camera/module/VideoModule;->mRecordingStartTime:J

    sub-long/2addr v7, v9

    .line 1511
    const-wide/16 v9, 0x7d0

    sub-long/2addr v9, v7

    .line 1512
    const-wide/16 v7, 0x64

    cmp-long v2, v9, v7

    if-lez v2, :cond_2

    .line 1513
    iput-boolean v3, v0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    goto :goto_0

    .line 1515
    :cond_2
    iput-boolean v6, v0, Lcom/android/camera/module/VideoModule;->mMediaRecorderPostProcessing:Z

    .line 1517
    :goto_0
    goto :goto_1

    .line 1519
    :cond_3
    iput-boolean v3, v0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    .line 1523
    :goto_1
    invoke-virtual {v0, v3}, Lcom/android/camera/module/VideoModule;->enableCameraControls(Z)V

    .line 1524
    iget-object v2, v0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v2, :cond_5

    .line 1525
    iget-object v2, v0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v1, :cond_4

    const/4 v3, 0x0

    goto :goto_2

    :cond_4
    move-object v3, v0

    :goto_2
    invoke-virtual {v2, v3}, Lcom/android/camera2/Camera2Proxy;->stopRecording(Lcom/android/camera2/Camera2Proxy$VideoRecordStateCallback;)V

    .line 1528
    :cond_5
    iget-object v2, v0, Lcom/android/camera/module/VideoModule;->mCountDownTimer:Landroid/os/CountDownTimer;

    if-eqz v2, :cond_6

    invoke-static {}, Lcom/android/camera/CameraSettings;->isVideoBokehOn()Z

    move-result v2

    if-eqz v2, :cond_6

    .line 1529
    iget-object v2, v0, Lcom/android/camera/module/VideoModule;->mCountDownTimer:Landroid/os/CountDownTimer;

    invoke-virtual {v2}, Landroid/os/CountDownTimer;->cancel()V

    .line 1533
    :cond_6
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    const/16 v3, 0xd4

    .line 1534
    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v2

    check-cast v2, Lcom/android/camera/protocol/ModeProtocol$RecordState;

    .line 1535
    iget-boolean v3, v0, Lcom/android/camera/module/VideoModule;->mMediaRecorderPostProcessing:Z

    if-eqz v3, :cond_7

    .line 1536
    invoke-interface {v2}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onPostSavingStart()V

    goto :goto_3

    .line 1539
    :cond_7
    invoke-interface {v2}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onFinish()V

    .line 1542
    :goto_3
    iget-object v2, v0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v2, :cond_8

    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isVideoNewSlowMotion()Z

    move-result v2

    if-nez v2, :cond_8

    .line 1543
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/module/VideoModule;->isFrontCamera()Z

    move-result v7

    .line 1544
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/module/VideoModule;->getModuleIndex()I

    move-result v8

    .line 1545
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v2

    const-string v3, "pref_camera_auto_zoom"

    invoke-virtual {v2, v3}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v9

    .line 1546
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/module/VideoModule;->getModuleIndex()I

    move-result v2

    invoke-static {v2}, Lcom/android/camera/CameraSettings;->isUltraWideConfigOpen(I)Z

    move-result v10

    iget-object v11, v0, Lcom/android/camera/module/VideoModule;->mSpeed:Ljava/lang/String;

    iget v12, v0, Lcom/android/camera/module/VideoModule;->mQuality:I

    iget-object v2, v0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    .line 1549
    invoke-virtual {v2}, Lcom/android/camera2/Camera2Proxy;->getFlashMode()I

    move-result v13

    iget v14, v0, Lcom/android/camera/module/VideoModule;->mFrameRate:I

    iget v15, v0, Lcom/android/camera/module/VideoModule;->mTimeBetweenTimeLapseFrameCaptureMs:I

    iget-object v2, v0, Lcom/android/camera/module/VideoModule;->mBeautyValues:Lcom/android/camera/fragment/beauty/BeautyValues;

    move-wide/from16 v19, v4

    iget-wide v3, v0, Lcom/android/camera/module/VideoModule;->mVideoRecordTime:J

    .line 1543
    move-object/from16 v16, v2

    move-wide/from16 v17, v3

    invoke-static/range {v7 .. v18}, Lcom/android/camera/statistic/CameraStatUtil;->trackVideoRecorded(ZIZZLjava/lang/String;IIIILcom/android/camera/fragment/beauty/BeautyValues;J)V

    .line 1554
    invoke-static {}, Lcom/android/camera/statistic/CameraStatUtil;->trackUltraWideVideoTaken()V

    goto :goto_4

    .line 1556
    :cond_8
    move-wide/from16 v19, v4

    :goto_4
    const-wide/16 v2, 0x0

    iput-wide v2, v0, Lcom/android/camera/module/VideoModule;->mVideoRecordTime:J

    .line 1558
    if-eqz v1, :cond_9

    .line 1559
    invoke-direct/range {p0 .. p0}, Lcom/android/camera/module/VideoModule;->stopRecorder()V

    .line 1560
    invoke-direct/range {p0 .. p0}, Lcom/android/camera/module/VideoModule;->startPreviewAfterRecord()V

    goto :goto_5

    .line 1562
    :cond_9
    iput-boolean v6, v0, Lcom/android/camera/module/VideoModule;->mPendingStopRecorder:Z

    .line 1564
    iget-object v1, v0, Lcom/android/camera/module/VideoModule;->mHandler:Landroid/os/Handler;

    const/16 v2, 0x2e

    const-wide/16 v3, 0x12c

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 1566
    :goto_5
    iget-object v1, v0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v1}, Lcom/android/camera/AutoLockManager;->getInstance(Landroid/content/Context;)Lcom/android/camera/AutoLockManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/AutoLockManager;->hibernateDelayed()V

    .line 1567
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/module/VideoModule;->exitSavePowerMode()V

    .line 1568
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "stopVideoRecording<<time="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long v2, v2, v19

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1569
    return-void

    .line 1501
    :cond_a
    :goto_6
    return-void
.end method

.method public takeVideoSnapShoot()Z
    .locals 4

    .line 2058
    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mPaused:Z

    const/4 v1, 0x0

    if-nez v0, :cond_5

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result v0

    if-nez v0, :cond_5

    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mSnapshotInProgress:Z

    if-nez v0, :cond_5

    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    if-nez v0, :cond_0

    goto/16 :goto_1

    .line 2063
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isDeviceAlive()Z

    move-result v0

    if-nez v0, :cond_1

    .line 2064
    return v1

    .line 2068
    :cond_1
    invoke-static {}, Lcom/android/camera/storage/Storage;->isLowStorageAtLastPoint()Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_2

    .line 2069
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v3, "capture: low storage"

    invoke-static {v0, v3}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 2071
    nop

    .line 2072
    invoke-virtual {p0, v2, v1}, Lcom/android/camera/module/VideoModule;->stopVideoRecording(ZZ)V

    .line 2073
    return v1

    .line 2076
    :cond_2
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getImageSaver()Lcom/android/camera/storage/ImageSaver;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/storage/ImageSaver;->isBusy()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 2077
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v2, "capture: ImageSaver is full"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 2078
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v0}, Lcom/android/camera/ui/RotateTextToast;->getInstance(Landroid/app/Activity;)Lcom/android/camera/ui/RotateTextToast;

    move-result-object v0

    const v2, 0x7f0901b5

    invoke-virtual {v0, v2, v1}, Lcom/android/camera/ui/RotateTextToast;->show(II)V

    .line 2079
    return v1

    .line 2083
    :cond_3
    iget v0, p0, Lcom/android/camera/module/VideoModule;->mBogusCameraId:I

    iget v1, p0, Lcom/android/camera/module/VideoModule;->mOrientation:I

    invoke-static {v0, v1}, Lcom/android/camera/Util;->getJpegRotation(II)I

    move-result v0

    .line 2084
    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v0}, Lcom/android/camera2/Camera2Proxy;->setJpegRotation(I)V

    .line 2085
    invoke-static {}, Lcom/android/camera/LocationManager;->instance()Lcom/android/camera/LocationManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/LocationManager;->getCurrentLocation()Landroid/location/Location;

    move-result-object v0

    .line 2086
    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v0}, Lcom/android/camera2/Camera2Proxy;->setGpsLocation(Landroid/location/Location;)V

    .line 2087
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->setJpegQuality()V

    .line 2089
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->updateFrontMirror()V

    .line 2090
    invoke-static {}, Lcom/mi/config/b;->hc()Z

    move-result v1

    if-eqz v1, :cond_4

    goto :goto_0

    .line 2093
    :cond_4
    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v1

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->getCameraRotation()I

    move-result v3

    invoke-virtual {v1, v3}, Lcom/android/camera/CameraScreenNail;->animateCapture(I)V

    .line 2095
    :goto_0
    sget-object v1, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v3, "capture: start"

    invoke-static {v1, v3}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2096
    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    new-instance v3, Lcom/android/camera/module/VideoModule$JpegPictureCallback;

    invoke-direct {v3, p0, v0}, Lcom/android/camera/module/VideoModule$JpegPictureCallback;-><init>(Lcom/android/camera/module/VideoModule;Landroid/location/Location;)V

    invoke-virtual {v1, v3}, Lcom/android/camera2/Camera2Proxy;->captureVideoSnapshot(Lcom/android/camera2/Camera2Proxy$PictureCallback;)V

    .line 2097
    iput-boolean v2, p0, Lcom/android/camera/module/VideoModule;->mSnapshotInProgress:Z

    .line 2098
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isFrontCamera()Z

    move-result v0

    invoke-static {v0}, Lcom/android/camera/statistic/CameraStatUtil;->trackVideoSnapshot(Z)V

    .line 2099
    return v2

    .line 2060
    :cond_5
    :goto_1
    return v1
.end method

.method public unRegisterProtocol()V
    .locals 2

    .line 228
    invoke-super {p0}, Lcom/android/camera/module/VideoBase;->unRegisterProtocol()V

    .line 229
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xd7

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 230
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 231
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa7

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 232
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa9

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 233
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc7

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 234
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getImplFactory()Lcom/android/camera/module/impl/ImplFactory;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/module/impl/ImplFactory;->detachAdditional()V

    .line 235
    return-void
.end method

.method protected updateRecordingTime()V
    .locals 13

    .line 1806
    invoke-super {p0}, Lcom/android/camera/module/VideoBase;->updateRecordingTime()V

    .line 1808
    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    if-nez v0, :cond_0

    .line 1809
    return-void

    .line 1812
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isFPS960()Z

    move-result v0

    if-nez v0, :cond_e

    invoke-static {}, Lcom/android/camera/CameraSettings;->isVideoBokehOn()Z

    move-result v0

    if-eqz v0, :cond_1

    goto/16 :goto_6

    .line 1816
    :cond_1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 1817
    iget-wide v2, p0, Lcom/android/camera/module/VideoModule;->mRecordingStartTime:J

    sub-long/2addr v0, v2

    .line 1818
    iget-boolean v2, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecordingPaused:Z

    if-eqz v2, :cond_2

    .line 1819
    iget-wide v0, p0, Lcom/android/camera/module/VideoModule;->mVideoRecordedDuration:J

    .line 1823
    :cond_2
    iget v2, p0, Lcom/android/camera/module/VideoModule;->mMaxVideoDurationInMs:I

    const/4 v3, 0x0

    if-eqz v2, :cond_3

    iget v2, p0, Lcom/android/camera/module/VideoModule;->mMaxVideoDurationInMs:I

    const v4, 0xea60

    sub-int/2addr v2, v4

    int-to-long v4, v2

    cmp-long v2, v0, v4

    if-ltz v2, :cond_3

    const/4 v2, 0x1

    goto :goto_0

    .line 1825
    :cond_3
    move v2, v3

    .line 1826
    :goto_0
    if-eqz v2, :cond_4

    .line 1827
    const-wide/16 v4, 0x0

    iget v6, p0, Lcom/android/camera/module/VideoModule;->mMaxVideoDurationInMs:I

    int-to-long v6, v6

    sub-long/2addr v6, v0

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v4

    const-wide/16 v6, 0x3e7

    add-long/2addr v4, v6

    goto :goto_1

    .line 1830
    :cond_4
    move-wide v4, v0

    .line 1831
    :goto_1
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isNormalMode()Z

    move-result v6

    const-wide/16 v7, 0x3e8

    if-nez v6, :cond_a

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isHFRMode()Z

    move-result v6

    if-eqz v6, :cond_5

    goto :goto_4

    .line 1835
    :cond_5
    nop

    .line 1836
    const-string v6, "fast"

    iget-object v9, p0, Lcom/android/camera/module/VideoModule;->mSpeed:Ljava/lang/String;

    invoke-virtual {v6, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    const-wide/16 v9, 0x0

    if-eqz v6, :cond_6

    .line 1837
    iget v6, p0, Lcom/android/camera/module/VideoModule;->mTimeBetweenTimeLapseFrameCaptureMs:I

    int-to-double v6, v6

    .line 1838
    double-to-long v11, v6

    goto :goto_2

    .line 1839
    :cond_6
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isSlowMode()Z

    move-result v6

    if-eqz v6, :cond_7

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isShowHFRDuration()Z

    move-result v6

    if-eqz v6, :cond_7

    .line 1840
    const-wide v6, 0x408f400000000000L    # 1000.0

    iget v8, p0, Lcom/android/camera/module/VideoModule;->mFrameRate:I

    int-to-double v11, v8

    div-double/2addr v6, v11

    .line 1841
    const/16 v8, 0x3e8

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->getNormalVideoFrameRate()I

    move-result v11

    mul-int/2addr v8, v11

    iget v11, p0, Lcom/android/camera/module/VideoModule;->mFrameRate:I

    div-int/2addr v8, v11

    int-to-long v11, v8

    goto :goto_2

    .line 1846
    :cond_7
    move-wide v11, v7

    move-wide v6, v9

    :goto_2
    cmpl-double v8, v6, v9

    if-eqz v8, :cond_9

    .line 1847
    nop

    .line 1848
    invoke-direct {p0, v0, v1, v6, v7}, Lcom/android/camera/module/VideoModule;->getSpeedRecordVideoLength(JD)J

    move-result-wide v3

    const-string v5, "fast"

    iget-object v8, p0, Lcom/android/camera/module/VideoModule;->mSpeed:Ljava/lang/String;

    .line 1849
    invoke-virtual {v5, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    .line 1847
    invoke-static {v3, v4, v5}, Lcom/android/camera/Util;->millisecondToTimeString(JZ)Ljava/lang/String;

    move-result-object v3

    .line 1851
    iget-object v4, p0, Lcom/android/camera/module/VideoModule;->mRecordingTime:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 1852
    double-to-long v7, v6

    goto :goto_5

    .line 1859
    :cond_8
    :goto_3
    move-wide v7, v11

    goto :goto_5

    .line 1855
    :cond_9
    invoke-static {v4, v5, v3}, Lcom/android/camera/Util;->millisecondToTimeString(JZ)Ljava/lang/String;

    move-result-object v3

    goto :goto_3

    .line 1832
    :cond_a
    :goto_4
    div-long v9, v4, v7

    iput-wide v9, p0, Lcom/android/camera/module/VideoModule;->mVideoRecordTime:J

    .line 1833
    invoke-static {v4, v5, v3}, Lcom/android/camera/Util;->millisecondToTimeString(JZ)Ljava/lang/String;

    move-result-object v3

    .line 1859
    :goto_5
    iget-object v4, p0, Lcom/android/camera/module/VideoModule;->mTopAlert:Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    if-eqz v4, :cond_b

    .line 1860
    iget-object v4, p0, Lcom/android/camera/module/VideoModule;->mTopAlert:Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    invoke-interface {v4, v3}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->updateRecordingTime(Ljava/lang/String;)V

    .line 1862
    :cond_b
    iput-object v3, p0, Lcom/android/camera/module/VideoModule;->mRecordingTime:Ljava/lang/String;

    .line 1864
    iget-boolean v3, p0, Lcom/android/camera/module/VideoModule;->mRecordingTimeCountsDown:Z

    if-eq v3, v2, :cond_c

    .line 1867
    iput-boolean v2, p0, Lcom/android/camera/module/VideoModule;->mRecordingTimeCountsDown:Z

    .line 1870
    :cond_c
    const-wide/16 v2, 0x1f4

    .line 1871
    iget-boolean v4, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecordingPaused:Z

    if-nez v4, :cond_d

    .line 1872
    rem-long/2addr v0, v7

    sub-long v2, v7, v0

    .line 1874
    :cond_d
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x2a

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 1875
    return-void

    .line 1813
    :cond_e
    :goto_6
    return-void
.end method
