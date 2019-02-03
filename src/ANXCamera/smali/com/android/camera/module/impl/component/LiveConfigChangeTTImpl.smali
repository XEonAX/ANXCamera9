.class public Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;
.super Ljava/lang/Object;
.source "LiveConfigChangeTTImpl.java"

# interfaces
.implements Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;


# static fields
.field private static final APPID:Ljava/lang/String; = "100024"

.field private static final LICENSE:Ljava/lang/String; = "1449eb247881d7452b662746d329a48755efdda8eab980d11c86626450eca036c9195afca03e8af8c096583bcce73bca1ab2308603ef6fc31f8b9441b95cd9ba"

.field private static final MIN_RECORD_TIME:J = 0x186a0L

.field private static final START_OFFSET_MS:J = 0x1c2L

.field private static final TAG:Ljava/lang/String;

.field private static final WHITE_INTENSITY:F = 0.2f


# instance fields
.field private final SPEEDS:[F

.field private mActivity:Lcom/android/camera/ActivityBase;

.field private mAudioEncodeSettings:Lcom/ss/android/vesdk/VEAudioEncodeSettings;

.field private mAuthResult:Lcom/ss/android/ttve/oauth/TEOAuthResult;

.field private mBGMPath:Ljava/lang/String;

.field private mBeautyImpl:Lcom/android/camera/protocol/ModeProtocol$OnFaceBeautyChangedProtocol;

.field private mConcatVideoPath:Ljava/lang/String;

.field private mConcatWavPath:Ljava/lang/String;

.field private mContext:Landroid/content/Context;

.field private mCountDownTimer:Landroid/os/CountDownTimer;

.field private mDurings:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/ss/android/medialib/model/TimeSpeedModel;",
            ">;"
        }
    .end annotation
.end field

.field private mFilterImpl:Lcom/android/camera/protocol/ModeProtocol$FilterProtocol;

.field private mInitialized:Z

.field private mInputSurfaceReady:Z

.field private mInputSurfaceTexture:Landroid/graphics/SurfaceTexture;

.field private mIsFrontCamera:Z

.field private mMaxVideoDurationInMs:I

.field private mMediaRecorderRecording:Z

.field private mMediaRecorderRecordingPaused:Z

.field private mPreviewSettings:Lcom/ss/android/vesdk/VEPreviewSettings;

.field private mRecorder:Lcom/ss/android/vesdk/TERecorder;

.field private final mRecorderLock:Ljava/lang/Object;

.field private mReleased:Z

.field private mSpeed:F

.field private mStartTime:J

.field private mStickerImpl:Lcom/android/camera/protocol/ModeProtocol$StickerProtocol;

.field private mStickerPath:Ljava/lang/String;

.field private mTTNativeIsInit:Z

.field private mTotalRecordingTime:J

.field private mVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 53
    const-class v0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Lcom/android/camera/ActivityBase;)V
    .locals 3

    .line 94
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mDurings:Ljava/util/List;

    .line 72
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mTotalRecordingTime:J

    .line 73
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mTTNativeIsInit:Z

    .line 77
    const/4 v1, 0x5

    new-array v1, v1, [F

    fill-array-data v1, :array_0

    iput-object v1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->SPEEDS:[F

    .line 86
    iput-boolean v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mMediaRecorderRecording:Z

    .line 92
    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorderLock:Ljava/lang/Object;

    .line 95
    iput-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mActivity:Lcom/android/camera/ActivityBase;

    .line 96
    invoke-virtual {p1}, Lcom/android/camera/ActivityBase;->getCameraAppImpl()Lcom/android/camera/CameraAppImpl;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/CameraAppImpl;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mContext:Landroid/content/Context;

    .line 99
    new-instance p1, Lcom/ss/android/vesdk/TERecorder;

    sget-object v1, Lcom/android/camera/module/impl/component/FileUtils;->ROOT_DIR:Ljava/lang/String;

    iget-object v2, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mContext:Landroid/content/Context;

    invoke-direct {p1, v1, v2}, Lcom/ss/android/vesdk/TERecorder;-><init>(Ljava/lang/String;Landroid/content/Context;)V

    iput-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    .line 100
    new-instance p1, Lcom/android/camera/module/impl/component/LiveFilterChangeImpl;

    iget-object v1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    invoke-direct {p1, v1}, Lcom/android/camera/module/impl/component/LiveFilterChangeImpl;-><init>(Lcom/ss/android/vesdk/TERecorder;)V

    iput-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mFilterImpl:Lcom/android/camera/protocol/ModeProtocol$FilterProtocol;

    .line 101
    new-instance p1, Lcom/android/camera/module/impl/component/LiveBeautyChangeImpl;

    iget-object v1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    invoke-direct {p1, v1}, Lcom/android/camera/module/impl/component/LiveBeautyChangeImpl;-><init>(Lcom/ss/android/vesdk/TERecorder;)V

    iput-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mBeautyImpl:Lcom/android/camera/protocol/ModeProtocol$OnFaceBeautyChangedProtocol;

    .line 102
    new-instance p1, Lcom/android/camera/module/impl/component/LiveStickerChangeImpl;

    iget-object v1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    invoke-direct {p1, v1}, Lcom/android/camera/module/impl/component/LiveStickerChangeImpl;-><init>(Lcom/ss/android/vesdk/TERecorder;)V

    iput-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mStickerImpl:Lcom/android/camera/protocol/ModeProtocol$StickerProtocol;

    .line 103
    new-instance p1, Landroid/graphics/SurfaceTexture;

    invoke-direct {p1, v0}, Landroid/graphics/SurfaceTexture;-><init>(Z)V

    iput-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mInputSurfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 104
    const/16 p1, 0x3d54

    iput p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mMaxVideoDurationInMs:I

    .line 105
    return-void

    :array_0
    .array-data 4
        0x3ea8f5c3    # 0.33f
        0x3f000000    # 0.5f
        0x3f800000    # 1.0f
        0x40000000    # 2.0f
        0x40400000    # 3.0f
    .end array-data
.end method

.method static synthetic access$000(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;)Z
    .locals 0

    .line 52
    iget-boolean p0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mReleased:Z

    return p0
.end method

.method static synthetic access$100()Ljava/lang/String;
    .locals 1

    .line 52
    sget-object v0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;J)V
    .locals 0

    .line 52
    invoke-direct {p0, p1, p2}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->updateRecordingTime(J)V

    return-void
.end method

.method static synthetic access$1100(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;)Lcom/android/camera/ActivityBase;
    .locals 0

    .line 52
    iget-object p0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mActivity:Lcom/android/camera/ActivityBase;

    return-object p0
.end method

.method static synthetic access$202(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;Z)Z
    .locals 0

    .line 52
    iput-boolean p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mInputSurfaceReady:Z

    return p1
.end method

.method static synthetic access$300(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;)Landroid/graphics/SurfaceTexture;
    .locals 0

    .line 52
    iget-object p0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mInputSurfaceTexture:Landroid/graphics/SurfaceTexture;

    return-object p0
.end method

.method static synthetic access$402(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;Z)Z
    .locals 0

    .line 52
    iput-boolean p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mTTNativeIsInit:Z

    return p1
.end method

.method static synthetic access$500(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;)Z
    .locals 0

    .line 52
    iget-boolean p0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mIsFrontCamera:Z

    return p0
.end method

.method static synthetic access$600(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;)Lcom/ss/android/vesdk/TERecorder;
    .locals 0

    .line 52
    iget-object p0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    return-object p0
.end method

.method static synthetic access$700(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;)Ljava/lang/String;
    .locals 0

    .line 52
    iget-object p0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mStickerPath:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$800(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;)Landroid/content/Context;
    .locals 0

    .line 52
    iget-object p0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mContext:Landroid/content/Context;

    return-object p0
.end method

.method static synthetic access$900(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;)V
    .locals 0

    .line 52
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->updateBeauty()V

    return-void
.end method

.method public static create(Lcom/android/camera/ActivityBase;)Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;
    .locals 1

    .line 108
    new-instance v0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;

    invoke-direct {v0, p0}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;-><init>(Lcom/android/camera/ActivityBase;)V

    return-object v0
.end method

.method private deleteLastSegment()V
    .locals 1

    .line 168
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    if-nez v0, :cond_0

    return-void

    .line 169
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    invoke-virtual {v0}, Lcom/ss/android/vesdk/TERecorder;->deleteLastFrag()V

    .line 170
    return-void
.end method

.method private getTimestamp(Landroid/hardware/SensorEvent;)D
    .locals 8

    .line 517
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    .line 518
    iget-wide v2, p1, Landroid/hardware/SensorEvent;->timestamp:J

    sub-long v2, v0, v2

    invoke-static {v2, v3}, Ljava/lang/Math;->abs(J)J

    move-result-wide v2

    .line 519
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtimeNanos()J

    move-result-wide v4

    iget-wide v6, p1, Landroid/hardware/SensorEvent;->timestamp:J

    sub-long/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Math;->abs(J)J

    move-result-wide v4

    .line 520
    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    sub-long/2addr v0, v2

    long-to-double v0, v0

    .line 521
    return-wide v0
.end method

.method private resumeEffect()V
    .locals 3

    .line 208
    invoke-static {}, Lcom/android/camera/CameraSettings;->getCurrentLiveMusic()[Ljava/lang/String;

    move-result-object v0

    .line 209
    const/4 v1, 0x0

    aget-object v2, v0, v1

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 210
    aget-object v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->onBGMChanged(Ljava/lang/String;)V

    .line 213
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/android/camera/module/impl/component/FileUtils;->STICKER_RESOURCE_DIR:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/android/camera/CameraSettings;->getCurrentLiveSticker()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mStickerPath:Ljava/lang/String;

    .line 214
    invoke-static {}, Lcom/android/camera/CameraSettings;->getCurrentLiveSpeed()Ljava/lang/String;

    move-result-object v0

    .line 215
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->setRecordSpeed(I)V

    .line 216
    return-void
.end method

.method private updateBeauty()V
    .locals 5

    .line 656
    const-string v0, "key_live_shrink_face_ratio"

    const/16 v1, 0x28

    invoke-static {v0, v1}, Lcom/android/camera/CameraSettings;->getFaceBeautyRatio(Ljava/lang/String;I)I

    move-result v0

    int-to-float v0, v0

    const/high16 v2, 0x42c80000    # 100.0f

    div-float/2addr v0, v2

    .line 657
    const-string v3, "key_live_enlarge_eye_ratio"

    invoke-static {v3, v1}, Lcom/android/camera/CameraSettings;->getFaceBeautyRatio(Ljava/lang/String;I)I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v3, v2

    .line 658
    const-string v4, "key_live_smooth_strength"

    invoke-static {v4, v1}, Lcom/android/camera/CameraSettings;->getFaceBeautyRatio(Ljava/lang/String;I)I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v1, v2

    .line 660
    const/4 v2, 0x0

    cmpl-float v4, v0, v2

    if-gtz v4, :cond_1

    cmpl-float v4, v3, v2

    if-gtz v4, :cond_1

    cmpl-float v4, v1, v2

    if-lez v4, :cond_0

    goto :goto_0

    .line 664
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0, v2, v2}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->setBeautyFaceReshape(ZFF)V

    .line 665
    invoke-virtual {p0, v0, v2}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->setBeautify(ZF)V

    goto :goto_1

    .line 661
    :cond_1
    :goto_0
    const/4 v2, 0x1

    invoke-virtual {p0, v2, v3, v0}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->setBeautyFaceReshape(ZFF)V

    .line 662
    invoke-virtual {p0, v2, v1}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->setBeautify(ZF)V

    .line 667
    :goto_1
    return-void
.end method

.method private updateRecordingTime(J)V
    .locals 2

    .line 588
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 589
    const/16 v1, 0xa2

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    .line 590
    if-eqz v0, :cond_0

    .line 591
    long-to-float p1, p1

    const/high16 p2, 0x3f800000    # 1.0f

    mul-float/2addr p1, p2

    iget p2, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mSpeed:F

    div-float/2addr p1, p2

    float-to-long p1, p1

    const/4 v1, 0x0

    invoke-static {p1, p2, v1}, Lcom/android/camera/Util;->millisecondToTimeString(JZ)Ljava/lang/String;

    move-result-object p1

    .line 593
    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->updateRecordingTime(Ljava/lang/String;)V

    .line 595
    :cond_0
    return-void
.end method


# virtual methods
.method public closeBGM()V
    .locals 5

    .line 403
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    if-eqz v0, :cond_0

    .line 404
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mBGMPath:Ljava/lang/String;

    .line 405
    iget-object v1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    const-string v2, ""

    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v4, v4, v3}, Lcom/ss/android/vesdk/TERecorder;->setRecordBGM(Ljava/lang/String;III)I

    .line 406
    invoke-static {v0, v0}, Lcom/android/camera/CameraSettings;->setCurrentLiveMusic(Ljava/lang/String;Ljava/lang/String;)V

    .line 408
    :cond_0
    return-void
.end method

.method public getAuthResult()Lcom/ss/android/ttve/oauth/TEOAuthResult;
    .locals 1

    .line 381
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mAuthResult:Lcom/ss/android/ttve/oauth/TEOAuthResult;

    return-object v0
.end method

.method public getConcatResult()Landroid/util/Pair;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/Pair<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 609
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mConcatWavPath:Ljava/lang/String;

    .line 610
    iget-object v1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mBGMPath:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 611
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mBGMPath:Ljava/lang/String;

    .line 613
    :cond_0
    new-instance v1, Landroid/util/Pair;

    iget-object v2, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mConcatVideoPath:Ljava/lang/String;

    invoke-direct {v1, v2, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v1
.end method

.method public getInputSurfaceTexture()Landroid/graphics/SurfaceTexture;
    .locals 1

    .line 294
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mInputSurfaceTexture:Landroid/graphics/SurfaceTexture;

    return-object v0
.end method

.method public getRecordSpeed()F
    .locals 1

    .line 624
    iget v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mSpeed:F

    return v0
.end method

.method public getSegments()I
    .locals 1

    .line 599
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mDurings:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getStartRecordingTime()J
    .locals 2

    .line 642
    iget-wide v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mStartTime:J

    return-wide v0
.end method

.method public getTimeValue()Ljava/lang/String;
    .locals 6

    .line 629
    iget-wide v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mTotalRecordingTime:J

    .line 630
    const-wide/16 v2, 0x3e8

    const-wide/16 v4, 0x3a98

    invoke-static/range {v0 .. v5}, Lcom/android/camera/Util;->clamp(JJJ)J

    move-result-wide v0

    .line 629
    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/android/camera/Util;->millisecondToTimeString(JZ)Ljava/lang/String;

    move-result-object v0

    .line 632
    return-object v0
.end method

.method public getTotalRecordingTime()J
    .locals 2

    .line 637
    iget-wide v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mTotalRecordingTime:J

    return-wide v0
.end method

.method public hasSegments()Z
    .locals 1

    .line 604
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mDurings:Ljava/util/List;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mDurings:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public initPreview(IIZI)V
    .locals 3

    .line 174
    const-string v0, "live initPreview:"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 175
    iput-boolean p3, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mIsFrontCamera:Z

    .line 176
    new-instance v0, Lcom/ss/android/vesdk/VEPreviewSettings;

    if-eqz p3, :cond_0

    sget-object p3, Lcom/ss/android/vesdk/VEPreviewSettings$CAMERA_FACING_ID;->FACING_FRONT:Lcom/ss/android/vesdk/VEPreviewSettings$CAMERA_FACING_ID;

    goto :goto_0

    :cond_0
    sget-object p3, Lcom/ss/android/vesdk/VEPreviewSettings$CAMERA_FACING_ID;->FACING_BACK:Lcom/ss/android/vesdk/VEPreviewSettings$CAMERA_FACING_ID;

    :goto_0
    new-instance v1, Lcom/ss/android/vesdk/VESize;

    invoke-direct {v1, p1, p2}, Lcom/ss/android/vesdk/VESize;-><init>(II)V

    invoke-direct {v0, p3, p4, v1}, Lcom/ss/android/vesdk/VEPreviewSettings;-><init>(Lcom/ss/android/vesdk/VEPreviewSettings$CAMERA_FACING_ID;ILcom/ss/android/vesdk/VESize;)V

    iput-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mPreviewSettings:Lcom/ss/android/vesdk/VEPreviewSettings;

    .line 177
    iget-object p3, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mInputSurfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-virtual {p3, p1, p2}, Landroid/graphics/SurfaceTexture;->setDefaultBufferSize(II)V

    .line 178
    iget-boolean p3, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mInitialized:Z

    if-eqz p3, :cond_1

    .line 179
    iget-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    iget-object p2, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mPreviewSettings:Lcom/ss/android/vesdk/VEPreviewSettings;

    invoke-virtual {p1, p2}, Lcom/ss/android/vesdk/TERecorder;->updatePreviewSettings(Lcom/ss/android/vesdk/VEPreviewSettings;)V

    goto :goto_2

    .line 181
    :cond_1
    new-instance p3, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;

    const/4 p4, 0x1

    invoke-direct {p3, p4}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;-><init>(I)V

    .line 183
    invoke-virtual {p3, p4}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->setHwEnc(Z)Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;

    move-result-object p3

    sget-object v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;->ENCODE_PROFILE_MAIN:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;

    .line 184
    invoke-virtual {p3, v0}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->setEncodeProfile(Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;)Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;

    move-result-object p3

    .line 185
    invoke-virtual {p3, p2, p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->setVideoRes(II)Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;

    move-result-object p1

    .line 186
    invoke-virtual {p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->build()Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    .line 188
    iget-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    iget-object p2, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    const/4 p3, 0x0

    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mPreviewSettings:Lcom/ss/android/vesdk/VEPreviewSettings;

    invoke-virtual {p1, p2, p3, v0}, Lcom/ss/android/vesdk/TERecorder;->init(Lcom/ss/android/vesdk/VEVideoEncodeSettings;Lcom/ss/android/vesdk/VEAudioEncodeSettings;Lcom/ss/android/vesdk/VEPreviewSettings;)I

    .line 189
    iget-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    invoke-virtual {p1}, Lcom/ss/android/vesdk/TERecorder;->tryRestore()I

    .line 190
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object p1

    .line 191
    invoke-virtual {p1}, Lcom/android/camera/data/data/runing/DataItemRunning;->getLiveConfigIsNeedRestore()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 192
    iget-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    invoke-virtual {p1}, Lcom/ss/android/vesdk/TERecorder;->getSegmentInfo()Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mDurings:Ljava/util/List;

    .line 193
    iget-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mDurings:Ljava/util/List;

    invoke-static {p1}, Lcom/ss/android/medialib/model/TimeSpeedModel;->calculateRealTime(Ljava/util/List;)I

    move-result p1

    int-to-long p1, p1

    iput-wide p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mTotalRecordingTime:J

    .line 195
    iput-boolean p4, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mMediaRecorderRecordingPaused:Z

    .line 196
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mMediaRecorderRecording:Z

    goto :goto_1

    .line 198
    :cond_2
    iget-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    invoke-virtual {p1}, Lcom/ss/android/vesdk/TERecorder;->clearEnv()V

    .line 200
    :goto_1
    iput-boolean p4, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mInitialized:Z

    .line 204
    :goto_2
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->resumeEffect()V

    .line 205
    return-void
.end method

.method public initResource()V
    .locals 7

    .line 332
    sget-object v0, Lcom/android/camera/module/impl/component/MyOwnMonitor;->Instance:Lcom/android/camera/module/impl/component/MyOwnMonitor;

    invoke-static {v0}, Lcom/ss/android/vesdk/VESDK;->setExternalMonitorListener(Lcom/ss/android/vesdk/runtime/VEExternalMonitorListener;)V

    .line 333
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mContext:Landroid/content/Context;

    sget-object v1, Lcom/android/camera/module/impl/component/FileUtils;->ROOT_DIR:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/ss/android/vesdk/VESDK;->init(Landroid/content/Context;Ljava/lang/String;)V

    .line 334
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/extra/DataItemLive;->getActivation()Ljava/lang/String;

    move-result-object v0

    .line 335
    iget-object v1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mContext:Landroid/content/Context;

    const-string v2, "1449eb247881d7452b662746d329a48755efdda8eab980d11c86626450eca036c9195afca03e8af8c096583bcce73bca1ab2308603ef6fc31f8b9441b95cd9ba"

    const-string v3, "100024"

    invoke-static {v1, v2, v3, v0}, Lcom/ss/android/vesdk/VESDK;->activate(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/ttve/oauth/TEOAuthResult;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mAuthResult:Lcom/ss/android/ttve/oauth/TEOAuthResult;

    .line 336
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mAuthResult:Lcom/ss/android/ttve/oauth/TEOAuthResult;

    sget-object v1, Lcom/ss/android/ttve/oauth/TEOAuthResult;->OK:Lcom/ss/android/ttve/oauth/TEOAuthResult;

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mAuthResult:Lcom/ss/android/ttve/oauth/TEOAuthResult;

    sget-object v1, Lcom/ss/android/ttve/oauth/TEOAuthResult;->TBD:Lcom/ss/android/ttve/oauth/TEOAuthResult;

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 341
    :cond_0
    sget-object v0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "activation failed: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mAuthResult:Lcom/ss/android/ttve/oauth/TEOAuthResult;

    invoke-virtual {v2}, Lcom/ss/android/ttve/oauth/TEOAuthResult;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 337
    :cond_1
    :goto_0
    invoke-static {}, Lcom/ss/android/vesdk/VESDK;->getActivationCode()Ljava/lang/String;

    move-result-object v0

    .line 338
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/android/camera/data/data/extra/DataItemLive;->setActivation(Ljava/lang/String;)V

    .line 339
    sget-object v0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "activation success: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mAuthResult:Lcom/ss/android/ttve/oauth/TEOAuthResult;

    invoke-virtual {v2}, Lcom/ss/android/ttve/oauth/TEOAuthResult;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 344
    :goto_1
    sget-object v0, Lcom/android/camera/module/impl/component/FileUtils;->ROOT_DIR:Ljava/lang/String;

    invoke-static {v0}, Lcom/android/camera/module/impl/component/FileUtils;->hasDir(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 345
    sget-object v0, Lcom/android/camera/module/impl/component/FileUtils;->ROOT_DIR:Ljava/lang/String;

    invoke-static {v0}, Lcom/android/camera/module/impl/component/FileUtils;->delDir(Ljava/lang/String;)Z

    .line 347
    :try_start_0
    sget-object v0, Lcom/android/camera/module/impl/component/FileUtils;->FILTER_DIR:Ljava/lang/String;

    invoke-static {v0}, Lcom/android/camera/module/impl/component/FileUtils;->makeDir(Ljava/lang/String;)Z

    .line 348
    sget-object v0, Lcom/android/camera/module/impl/component/FileUtils;->RESOURCE_DIR:Ljava/lang/String;

    invoke-static {v0}, Lcom/android/camera/module/impl/component/FileUtils;->makeDir(Ljava/lang/String;)Z

    .line 349
    sget-object v0, Lcom/android/camera/module/impl/component/FileUtils;->RESHAPE_DIR_NAME:Ljava/lang/String;

    invoke-static {v0}, Lcom/android/camera/module/impl/component/FileUtils;->makeDir(Ljava/lang/String;)Z

    .line 350
    sget-object v0, Lcom/android/camera/module/impl/component/FileUtils;->VIDEO_TMP:Ljava/lang/String;

    invoke-static {v0}, Lcom/android/camera/module/impl/component/FileUtils;->makeDir(Ljava/lang/String;)Z

    .line 351
    sget-object v0, Lcom/android/camera/module/impl/component/FileUtils;->MUSIC_LOCAL:Ljava/lang/String;

    invoke-static {v0}, Lcom/android/camera/module/impl/component/FileUtils;->makeDir(Ljava/lang/String;)Z

    .line 352
    sget-object v0, Lcom/android/camera/module/impl/component/FileUtils;->MUSIC_ONLINE:Ljava/lang/String;

    invoke-static {v0}, Lcom/android/camera/module/impl/component/FileUtils;->makeDir(Ljava/lang/String;)Z

    .line 353
    sget-object v0, Lcom/android/camera/module/impl/component/FileUtils;->ROOT_DIR:Ljava/lang/String;

    invoke-static {v0}, Lcom/android/camera/module/impl/component/FileUtils;->makeSureNoMedia(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 356
    goto :goto_2

    .line 354
    :catch_0
    move-exception v0

    .line 355
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 360
    :cond_2
    :goto_2
    const v0, 0x8000

    .line 361
    :try_start_1
    iget-object v1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mContext:Landroid/content/Context;

    const-string v2, "live/music.zip"

    sget-object v3, Lcom/android/camera/module/impl/component/FileUtils;->MUSIC_LOCAL:Ljava/lang/String;

    invoke-static {v1, v2, v3, v0}, Lcom/android/camera/Util;->verifyAssetZip(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;I)V

    .line 362
    sget-object v1, Lcom/android/camera/module/impl/component/FileUtils;->MUSIC_ONLINE:Ljava/lang/String;

    invoke-static {v1}, Lcom/android/camera/module/impl/component/FileUtils;->makeDir(Ljava/lang/String;)Z

    .line 363
    sget-object v1, Lcom/android/camera/module/impl/component/FileUtils;->ResourcesList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 364
    iget-object v3, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mContext:Landroid/content/Context;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "live/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, ".zip"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v6, Lcom/android/camera/module/impl/component/FileUtils;->STICKER_RESOURCE_DIR:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v4, v2, v0}, Lcom/android/camera/Util;->verifyAssetZip(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;I)V

    .line 366
    goto :goto_3

    .line 367
    :cond_3
    iget-object v1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mContext:Landroid/content/Context;

    const-string v2, "live/Beauty_12.zip"

    sget-object v3, Lcom/android/camera/module/impl/component/FileUtils;->BEAUTY_12_DIR:Ljava/lang/String;

    invoke-static {v1, v2, v3, v0}, Lcom/android/camera/Util;->verifyAssetZip(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;I)V

    .line 368
    iget-object v1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mContext:Landroid/content/Context;

    const-string v2, "live/filter.zip"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/android/camera/module/impl/component/FileUtils;->RESOURCE_DIR:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "filter"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3, v0}, Lcom/android/camera/Util;->verifyAssetZip(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;I)V

    .line 369
    iget-object v1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mContext:Landroid/content/Context;

    const-string v2, "live/FaceReshape_V2.zip"

    sget-object v3, Lcom/android/camera/module/impl/component/FileUtils;->RESHAPE_DIR_NAME:Ljava/lang/String;

    invoke-static {v1, v2, v3, v0}, Lcom/android/camera/Util;->verifyAssetZip(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 372
    goto :goto_4

    .line 370
    :catch_1
    move-exception v0

    .line 371
    sget-object v1, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->TAG:Ljava/lang/String;

    const-string v2, "verify asset zip failed..."

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 374
    :goto_4
    invoke-static {}, Lcom/ss/android/vesdk/VESDK;->needUpdateEffectModelFiles()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 375
    invoke-static {}, Lcom/ss/android/vesdk/VESDK;->updateEffectModelFiles()V

    .line 377
    :cond_4
    return-void
.end method

.method public isRecording()Z
    .locals 1

    .line 317
    iget-boolean v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mMediaRecorderRecording:Z

    return v0
.end method

.method public isRecordingPaused()Z
    .locals 1

    .line 322
    iget-boolean v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mMediaRecorderRecordingPaused:Z

    return v0
.end method

.method public onBGMChanged(Ljava/lang/String;)V
    .locals 4

    .line 467
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    if-eqz v0, :cond_0

    .line 468
    iput-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mBGMPath:Ljava/lang/String;

    .line 469
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    const/4 v1, 0x0

    const/16 v2, 0x3a98

    const/4 v3, 0x1

    invoke-virtual {v0, p1, v1, v2, v3}, Lcom/ss/android/vesdk/TERecorder;->setRecordBGM(Ljava/lang/String;III)I

    .line 471
    :cond_0
    return-void
.end method

.method public onDeviceRotationChange([F)V
    .locals 2

    .line 508
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorderLock:Ljava/lang/Object;

    monitor-enter v0

    .line 509
    :try_start_0
    iget-object v1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    if-nez v1, :cond_0

    .line 510
    monitor-exit v0

    return-void

    .line 512
    :cond_0
    iget-object v1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    invoke-virtual {v1, p1}, Lcom/ss/android/vesdk/TERecorder;->setDeviceRotation([F)I

    .line 513
    monitor-exit v0

    .line 514
    return-void

    .line 513
    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public onRecordConcat()Z
    .locals 5

    .line 489
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->hasSegments()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 491
    sget-object v0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->TAG:Ljava/lang/String;

    const-string v2, "record segments is empty, stop concat"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 492
    return v1

    .line 495
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    invoke-virtual {v0}, Lcom/ss/android/vesdk/TERecorder;->concat()[Ljava/lang/String;

    move-result-object v0

    .line 496
    aget-object v2, v0, v1

    iput-object v2, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mConcatVideoPath:Ljava/lang/String;

    .line 497
    const/4 v2, 0x1

    aget-object v0, v0, v2

    iput-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mConcatWavPath:Ljava/lang/String;
    :try_end_0
    .catch Lcom/ss/android/vesdk/VEException; {:try_start_0 .. :try_end_0} :catch_0

    .line 501
    nop

    .line 503
    return v2

    .line 498
    :catch_0
    move-exception v0

    .line 499
    sget-object v2, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "concat failed: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Lcom/ss/android/vesdk/VEException;->getMsgDes()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 500
    return v1
.end method

.method public onRecordPause()V
    .locals 6

    .line 412
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    if-eqz v0, :cond_3

    iget-boolean v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mMediaRecorderRecordingPaused:Z

    if-eqz v0, :cond_0

    goto :goto_1

    .line 415
    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->setLiveConfigIsNeedRestore(Z)V

    .line 417
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    invoke-virtual {v0}, Lcom/ss/android/vesdk/TERecorder;->stopRecord()I

    .line 419
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    invoke-virtual {v0}, Lcom/ss/android/vesdk/TERecorder;->getEndFrameTime()J

    move-result-wide v2

    .line 422
    const-wide/32 v4, 0x186a0

    cmp-long v0, v2, v4

    if-gtz v0, :cond_1

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    if-ltz v0, :cond_1

    .line 423
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->deleteLastSegment()V

    .line 424
    sget-object v0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "recording time = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v2, ", it\'s too short"

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 426
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    invoke-virtual {v0}, Lcom/ss/android/vesdk/TERecorder;->getSegmentInfo()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mDurings:Ljava/util/List;

    .line 427
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mDurings:Ljava/util/List;

    invoke-static {v0}, Lcom/ss/android/medialib/model/TimeSpeedModel;->calculateRealTime(Ljava/util/List;)I

    move-result v0

    int-to-long v2, v0

    iput-wide v2, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mTotalRecordingTime:J

    .line 430
    :goto_0
    iput-boolean v1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mMediaRecorderRecordingPaused:Z

    .line 431
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mMediaRecorderRecording:Z

    .line 432
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mCountDownTimer:Landroid/os/CountDownTimer;

    if-eqz v0, :cond_2

    .line 433
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mCountDownTimer:Landroid/os/CountDownTimer;

    invoke-virtual {v0}, Landroid/os/CountDownTimer;->cancel()V

    .line 435
    :cond_2
    return-void

    .line 413
    :cond_3
    :goto_1
    return-void
.end method

.method public onRecordResume()V
    .locals 2

    .line 439
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mMediaRecorderRecordingPaused:Z

    if-nez v0, :cond_0

    goto :goto_0

    .line 442
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mMediaRecorderRecordingPaused:Z

    .line 443
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mMediaRecorderRecording:Z

    .line 444
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    iget v1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mSpeed:F

    invoke-virtual {v0, v1}, Lcom/ss/android/vesdk/TERecorder;->startRecord(F)I

    .line 445
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->updateRecordingTime()V

    .line 446
    return-void

    .line 440
    :cond_1
    :goto_0
    return-void
.end method

.method public onRecordReverse()V
    .locals 4

    .line 450
    sget-object v0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->TAG:Ljava/lang/String;

    const-string v1, "delete last frag !!!"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 451
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    if-nez v0, :cond_0

    .line 452
    return-void

    .line 454
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    invoke-virtual {v0}, Lcom/ss/android/vesdk/TERecorder;->getSegmentInfo()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mDurings:Ljava/util/List;

    .line 455
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mDurings:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_1

    .line 456
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mDurings:Ljava/util/List;

    iget-object v1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mDurings:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ss/android/medialib/model/TimeSpeedModel;

    .line 457
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mDurings:Ljava/util/List;

    invoke-static {v0}, Lcom/ss/android/medialib/model/TimeSpeedModel;->calculateRealTime(Ljava/util/List;)I

    move-result v0

    int-to-long v0, v0

    iput-wide v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mTotalRecordingTime:J

    .line 460
    iget v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mMaxVideoDurationInMs:I

    int-to-long v0, v0

    iget-wide v2, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mTotalRecordingTime:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x3a98

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->updateRecordingTime(J)V

    .line 462
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    invoke-virtual {v0}, Lcom/ss/android/vesdk/TERecorder;->deleteLastFrag()V

    .line 463
    return-void
.end method

.method public onRecordStart()V
    .locals 5

    .line 386
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    if-nez v0, :cond_0

    .line 387
    return-void

    .line 389
    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->setLiveConfigIsNeedRestore(Z)V

    .line 390
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    iget v2, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mSpeed:F

    invoke-virtual {v0, v2}, Lcom/ss/android/vesdk/TERecorder;->startRecord(F)I

    .line 392
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mBGMPath:Ljava/lang/String;

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    .line 393
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    iget-object v3, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mBGMPath:Ljava/lang/String;

    const/16 v4, 0x3a98

    invoke-virtual {v0, v3, v2, v4, v1}, Lcom/ss/android/vesdk/TERecorder;->setRecordBGM(Ljava/lang/String;III)I

    .line 396
    :cond_1
    iput-boolean v2, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mMediaRecorderRecordingPaused:Z

    .line 397
    iput-boolean v1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mMediaRecorderRecording:Z

    .line 398
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->updateRecordingTime()V

    .line 399
    return-void
.end method

.method public onRecordStop()V
    .locals 4

    .line 475
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    if-nez v0, :cond_0

    .line 476
    return-void

    .line 478
    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->setLiveConfigIsNeedRestore(Z)V

    .line 479
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->onRecordPause()V

    .line 480
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mTotalRecordingTime:J

    .line 481
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mDurings:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 482
    iput-boolean v1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mMediaRecorderRecordingPaused:Z

    .line 483
    iput-boolean v1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mMediaRecorderRecording:Z

    .line 484
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    invoke-virtual {v0}, Lcom/ss/android/vesdk/TERecorder;->clearEnv()V

    .line 485
    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 14

    .line 526
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorderLock:Ljava/lang/Object;

    monitor-enter v0

    .line 527
    :try_start_0
    iget-object v1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    if-nez v1, :cond_0

    .line 528
    monitor-exit v0

    return-void

    .line 531
    :cond_0
    invoke-direct {p0, p1}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->getTimestamp(Landroid/hardware/SensorEvent;)D

    move-result-wide v8

    .line 532
    iget-object v1, p1, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    invoke-virtual {v1}, Landroid/hardware/Sensor;->getType()I

    move-result v1

    const/4 v2, 0x2

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eq v1, v4, :cond_5

    const/4 v5, 0x4

    if-eq v1, v5, :cond_4

    const/16 v5, 0x9

    if-eq v1, v5, :cond_3

    const/16 v2, 0xf

    if-eq v1, v2, :cond_1

    goto/16 :goto_1

    .line 545
    :cond_1
    new-array v1, v5, [F

    .line 546
    iget-object p1, p1, Landroid/hardware/SensorEvent;->values:[F

    invoke-static {v1, p1}, Landroid/hardware/SensorManager;->getRotationMatrixFromVector([F[F)V

    .line 547
    new-array p1, v5, [D

    .line 548
    :goto_0
    array-length v2, v1

    if-ge v3, v2, :cond_2

    .line 549
    aget v2, v1, v3

    float-to-double v4, v2

    aput-wide v4, p1, v3

    .line 548
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 551
    :cond_2
    iget-object v1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    invoke-virtual {v1, p1, v8, v9}, Lcom/ss/android/vesdk/TERecorder;->slamProcessIngestOri([DD)I

    .line 552
    goto :goto_1

    .line 541
    :cond_3
    iget-object v1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    iget-object v5, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v3, v5, v3

    float-to-double v5, v3

    iget-object v3, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v3, v3, v4

    float-to-double v10, v3

    iget-object p1, p1, Landroid/hardware/SensorEvent;->values:[F

    aget p1, p1, v2

    float-to-double v12, p1

    move-wide v2, v5

    move-wide v4, v10

    move-wide v6, v12

    invoke-virtual/range {v1 .. v9}, Lcom/ss/android/vesdk/TERecorder;->slamProcessIngestGra(DDDD)I

    .line 543
    goto :goto_1

    .line 537
    :cond_4
    iget-object v1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    iget-object v5, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v3, v5, v3

    float-to-double v5, v3

    iget-object v3, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v3, v3, v4

    float-to-double v10, v3

    iget-object p1, p1, Landroid/hardware/SensorEvent;->values:[F

    aget p1, p1, v2

    float-to-double v12, p1

    move-wide v2, v5

    move-wide v4, v10

    move-wide v6, v12

    invoke-virtual/range {v1 .. v9}, Lcom/ss/android/vesdk/TERecorder;->slamProcessIngestGyr(DDDD)I

    .line 539
    goto :goto_1

    .line 534
    :cond_5
    iget-object v1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    iget-object v5, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v3, v5, v3

    float-to-double v5, v3

    iget-object v3, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v3, v3, v4

    float-to-double v10, v3

    iget-object p1, p1, Landroid/hardware/SensorEvent;->values:[F

    aget p1, p1, v2

    float-to-double v12, p1

    move-wide v2, v5

    move-wide v4, v10

    move-wide v6, v12

    invoke-virtual/range {v1 .. v9}, Lcom/ss/android/vesdk/TERecorder;->slamProcessIngestAcc(DDDD)I

    .line 535
    nop

    .line 556
    :goto_1
    monitor-exit v0

    .line 557
    return-void

    .line 556
    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public registerProtocol()V
    .locals 2

    .line 114
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc9

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 115
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mStickerImpl:Lcom/android/camera/protocol/ModeProtocol$StickerProtocol;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$StickerProtocol;->registerProtocol()V

    .line 116
    return-void
.end method

.method public release()V
    .locals 3

    .line 299
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mReleased:Z

    .line 300
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorderLock:Ljava/lang/Object;

    monitor-enter v0

    .line 301
    :try_start_0
    sget-object v1, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->TAG:Ljava/lang/String;

    const-string v2, "release"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 302
    iget-object v1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    if-eqz v1, :cond_0

    .line 303
    iget-object v1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    invoke-virtual {v1}, Lcom/ss/android/vesdk/TERecorder;->stopPreview()I

    .line 304
    iget-object v1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/ss/android/vesdk/TERecorder;->setRecrodStateCallback(Lcom/ss/android/vesdk/VEListener$VERecorderStateListener;)V

    .line 305
    iget-object v1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    invoke-virtual {v1, v2}, Lcom/ss/android/vesdk/TERecorder;->setRenderCallback(Lcom/ss/android/vesdk/IRenderCallback;)V

    .line 306
    iget-object v1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    invoke-virtual {v1}, Lcom/ss/android/vesdk/TERecorder;->destroy()V

    .line 308
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mInputSurfaceReady:Z

    .line 309
    iget-object v1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mInputSurfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-virtual {v1}, Landroid/graphics/SurfaceTexture;->release()V

    .line 310
    iput-object v2, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    .line 312
    :cond_0
    monitor-exit v0

    .line 313
    return-void

    .line 312
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public setBeautify(ZF)V
    .locals 2

    .line 141
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mTTNativeIsInit:Z

    if-nez v0, :cond_0

    goto :goto_1

    .line 142
    :cond_0
    if-eqz p1, :cond_1

    .line 143
    iget-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    const/4 v0, 0x3

    sget-object v1, Lcom/android/camera/module/impl/component/FileUtils;->BEAUTY_12_DIR:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lcom/ss/android/vesdk/TERecorder;->setBeautyFace(ILjava/lang/String;)I

    .line 144
    iget-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    const v0, 0x3e4ccccd    # 0.2f

    invoke-virtual {p1, p2, v0}, Lcom/ss/android/vesdk/TERecorder;->setBeautyFaceIntensity(FF)I

    goto :goto_0

    .line 146
    :cond_1
    iget-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    const/4 p2, 0x0

    const-string v0, ""

    invoke-virtual {p1, p2, v0}, Lcom/ss/android/vesdk/TERecorder;->setBeautyFace(ILjava/lang/String;)I

    .line 147
    iget-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    const/4 p2, 0x0

    invoke-virtual {p1, p2, p2}, Lcom/ss/android/vesdk/TERecorder;->setBeautyFaceIntensity(FF)I

    .line 149
    :goto_0
    return-void

    .line 141
    :cond_2
    :goto_1
    return-void
.end method

.method public setBeautyFaceReshape(ZFF)V
    .locals 1

    .line 160
    if-eqz p1, :cond_0

    .line 161
    iget-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    sget-object v0, Lcom/android/camera/module/impl/component/FileUtils;->RESHAPE_DIR_NAME:Ljava/lang/String;

    invoke-virtual {p1, v0, p2, p3}, Lcom/ss/android/vesdk/TERecorder;->setFaceReshape(Ljava/lang/String;FF)I

    goto :goto_0

    .line 163
    :cond_0
    iget-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    const-string p2, ""

    const/4 p3, 0x0

    invoke-virtual {p1, p2, p3, p3}, Lcom/ss/android/vesdk/TERecorder;->setFaceReshape(Ljava/lang/String;FF)I

    .line 165
    :goto_0
    return-void
.end method

.method public setEffectAudio(Z)V
    .locals 1

    .line 135
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mTTNativeIsInit:Z

    if-nez v0, :cond_0

    goto :goto_0

    .line 136
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    xor-int/lit8 p1, p1, 0x1

    invoke-virtual {v0, p1}, Lcom/ss/android/vesdk/TERecorder;->pauseEffectAudio(Z)I

    .line 137
    return-void

    .line 135
    :cond_1
    :goto_0
    return-void
.end method

.method public setFilter(ZLjava/lang/String;)V
    .locals 2

    .line 647
    const/high16 v0, 0x3f800000    # 1.0f

    if-eqz p1, :cond_0

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 648
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/android/camera/module/impl/component/FileUtils;->FILTER_DIR:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object p2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 649
    iget-object p2, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    invoke-virtual {p2, p1, v0}, Lcom/ss/android/vesdk/TERecorder;->setFilter(Ljava/lang/String;F)I

    goto :goto_0

    .line 651
    :cond_0
    iget-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    const-string p2, ""

    invoke-virtual {p1, p2, v0}, Lcom/ss/android/vesdk/TERecorder;->setFilter(Ljava/lang/String;F)I

    .line 653
    :goto_0
    return-void
.end method

.method public setRecordSpeed(I)V
    .locals 1

    .line 619
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->SPEEDS:[F

    aget p1, v0, p1

    iput p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mSpeed:F

    .line 620
    return-void
.end method

.method public startPreview(Landroid/view/Surface;Lcom/ss/android/medialib/TTRecorder$SlamDetectListener;)V
    .locals 3

    .line 219
    iget-boolean v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mInputSurfaceReady:Z

    if-eqz v0, :cond_0

    .line 220
    sget-object p1, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->TAG:Ljava/lang/String;

    const-string p2, "startPreview return"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 221
    return-void

    .line 223
    :cond_0
    sget-object v0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->TAG:Ljava/lang/String;

    const-string v1, "startPreview"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 224
    new-instance v0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$1;

    invoke-direct {v0, p0}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$1;-><init>(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;)V

    .line 259
    iget-object v1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    new-instance v2, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$2;

    invoke-direct {v2, p0}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$2;-><init>(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;)V

    invoke-virtual {v1, v2}, Lcom/ss/android/vesdk/TERecorder;->setRecrodStateCallback(Lcom/ss/android/vesdk/VEListener$VERecorderStateListener;)V

    .line 286
    iget-object v1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    invoke-virtual {v1, v0}, Lcom/ss/android/vesdk/TERecorder;->setRenderCallback(Lcom/ss/android/vesdk/IRenderCallback;)V

    .line 287
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    invoke-virtual {v0, p1}, Lcom/ss/android/vesdk/TERecorder;->startPreview(Landroid/view/Surface;)I

    .line 289
    invoke-static {p2}, Lcom/ss/android/vesdk/TERecorder;->addSlamDetectListener(Lcom/ss/android/medialib/TTRecorder$SlamDetectListener;)V

    .line 290
    return-void
.end method

.method public unRegisterProtocol()V
    .locals 2

    .line 120
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc9

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 121
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mStickerImpl:Lcom/android/camera/protocol/ModeProtocol$StickerProtocol;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$StickerProtocol;->unRegisterProtocol()V

    .line 122
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->release()V

    .line 123
    return-void
.end method

.method public updateRecordingTime()V
    .locals 7

    .line 561
    iget-boolean v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mMediaRecorderRecording:Z

    if-nez v0, :cond_0

    .line 562
    return-void

    .line 565
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mCountDownTimer:Landroid/os/CountDownTimer;

    if-eqz v0, :cond_1

    .line 566
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mCountDownTimer:Landroid/os/CountDownTimer;

    invoke-virtual {v0}, Landroid/os/CountDownTimer;->cancel()V

    .line 569
    :cond_1
    new-instance v0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$3;

    iget v1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mMaxVideoDurationInMs:I

    int-to-long v1, v1

    iget-wide v3, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mTotalRecordingTime:J

    sub-long/2addr v1, v3

    long-to-float v1, v1

    iget v2, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mSpeed:F

    mul-float/2addr v1, v2

    float-to-long v3, v1

    const/high16 v1, 0x447a0000    # 1000.0f

    iget v2, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mSpeed:F

    mul-float/2addr v1, v2

    float-to-long v5, v1

    move-object v1, v0

    move-object v2, p0

    invoke-direct/range {v1 .. v6}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$3;-><init>(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;JJ)V

    iput-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mCountDownTimer:Landroid/os/CountDownTimer;

    .line 582
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mStartTime:J

    .line 583
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mCountDownTimer:Landroid/os/CountDownTimer;

    invoke-virtual {v0}, Landroid/os/CountDownTimer;->start()Landroid/os/CountDownTimer;

    .line 584
    return-void
.end method
