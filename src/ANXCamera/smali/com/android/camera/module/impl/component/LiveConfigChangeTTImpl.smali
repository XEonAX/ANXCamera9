.class public Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;
.super Ljava/lang/Object;
.source "LiveConfigChangeTTImpl.java"

# interfaces
.implements Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;


# static fields
.field private static final APPID:Ljava/lang/String; = "100012"

.field private static final LICENSE:Ljava/lang/String; = "36ed10517245d52898e49b5e9cff6184dbaed4d373bf673cadeccd2322c1f0c0ea34824b4c3be2a18823fedfff368e2670e7361fc9f6b32e27c7bd16445821f6"

.field private static final START_OFFSET_MS:J = 0x1c2L

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final BEAUTY_LEVEL:[F

.field private final SPEEDS:[F

.field private mActivity:Lcom/android/camera/ActivityBase;

.field private mAudioEncodeSettings:Lcom/ss/android/vesdk/VEAudioEncodeSettings;

.field private mBGMPath:Ljava/lang/String;

.field private mBeautyImpl:Lcom/android/camera/protocol/ModeProtocol$OnFaceBeautyChangedProtocol;

.field private mConcatPaths:[Ljava/lang/String;

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

.field private mMaxVideoDurationInMs:I

.field private mMediaRecorderRecording:Z

.field private mMediaRecorderRecordingPaused:Z

.field private mPreviewSettings:Lcom/ss/android/vesdk/VEPreviewSettings;

.field private mRecorder:Lcom/ss/android/vesdk/TERecorder;

.field private mSpeed:F

.field private mStartTime:J

.field private mStickerImpl:Lcom/android/camera/protocol/ModeProtocol$StickerProtocol;

.field private mTTNativeIsInit:Z

.field private mTotalRecordingTime:J

.field private mVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 45
    const-class v0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Lcom/android/camera/ActivityBase;)V
    .locals 3

    .line 84
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mDurings:Ljava/util/List;

    .line 62
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mTotalRecordingTime:J

    .line 63
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mTTNativeIsInit:Z

    .line 66
    const/4 v1, 0x5

    new-array v2, v1, [F

    fill-array-data v2, :array_0

    iput-object v2, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->SPEEDS:[F

    .line 67
    new-array v1, v1, [F

    fill-array-data v1, :array_1

    iput-object v1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->BEAUTY_LEVEL:[F

    .line 76
    iput-boolean v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mMediaRecorderRecording:Z

    .line 85
    iput-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mActivity:Lcom/android/camera/ActivityBase;

    .line 86
    invoke-virtual {p1}, Lcom/android/camera/ActivityBase;->getCameraAppImpl()Lcom/android/camera/CameraAppImpl;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/CameraAppImpl;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mContext:Landroid/content/Context;

    .line 89
    new-instance p1, Lcom/ss/android/vesdk/TERecorder;

    sget-object v1, Lcom/android/camera/module/impl/component/FileUtils;->ROOT_DIR:Ljava/lang/String;

    iget-object v2, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mContext:Landroid/content/Context;

    invoke-direct {p1, v1, v2}, Lcom/ss/android/vesdk/TERecorder;-><init>(Ljava/lang/String;Landroid/content/Context;)V

    iput-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    .line 90
    new-instance p1, Lcom/android/camera/module/impl/component/LiveFilterChangeImpl;

    iget-object v1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    invoke-direct {p1, v1}, Lcom/android/camera/module/impl/component/LiveFilterChangeImpl;-><init>(Lcom/ss/android/vesdk/TERecorder;)V

    iput-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mFilterImpl:Lcom/android/camera/protocol/ModeProtocol$FilterProtocol;

    .line 91
    new-instance p1, Lcom/android/camera/module/impl/component/LiveBeautyChangeImpl;

    iget-object v1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    invoke-direct {p1, v1}, Lcom/android/camera/module/impl/component/LiveBeautyChangeImpl;-><init>(Lcom/ss/android/vesdk/TERecorder;)V

    iput-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mBeautyImpl:Lcom/android/camera/protocol/ModeProtocol$OnFaceBeautyChangedProtocol;

    .line 92
    new-instance p1, Lcom/android/camera/module/impl/component/LiveStickerChangeImpl;

    iget-object v1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    invoke-direct {p1, v1}, Lcom/android/camera/module/impl/component/LiveStickerChangeImpl;-><init>(Lcom/ss/android/vesdk/TERecorder;)V

    iput-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mStickerImpl:Lcom/android/camera/protocol/ModeProtocol$StickerProtocol;

    .line 93
    new-instance p1, Landroid/graphics/SurfaceTexture;

    invoke-direct {p1, v0}, Landroid/graphics/SurfaceTexture;-><init>(Z)V

    iput-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mInputSurfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 94
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v0, Lcom/android/camera/module/impl/component/FileUtils;->MUSIC:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v0, Lcom/android/camera/module/impl/component/FileUtils;->musicList:Ljava/util/List;

    const/4 v1, 0x2

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mBGMPath:Ljava/lang/String;

    .line 95
    const/16 p1, 0x3a98

    iput p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mMaxVideoDurationInMs:I

    .line 96
    return-void

    :array_0
    .array-data 4
        0x40400000    # 3.0f
        0x40000000    # 2.0f
        0x3f800000    # 1.0f
        0x3f000000    # 0.5f
        0x3ea8f5c3    # 0.33f
    .end array-data

    :array_1
    .array-data 4
        0x3e4ccccd    # 0.2f
        0x3ecccccd    # 0.4f
        0x3f19999a    # 0.6f
        0x3f4ccccd    # 0.8f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .line 44
    sget-object v0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$102(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;Z)Z
    .locals 0

    .line 44
    iput-boolean p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mInputSurfaceReady:Z

    return p1
.end method

.method static synthetic access$200(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;)Landroid/graphics/SurfaceTexture;
    .locals 0

    .line 44
    iget-object p0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mInputSurfaceTexture:Landroid/graphics/SurfaceTexture;

    return-object p0
.end method

.method static synthetic access$302(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;Z)Z
    .locals 0

    .line 44
    iput-boolean p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mTTNativeIsInit:Z

    return p1
.end method

.method static synthetic access$400(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;)Lcom/ss/android/vesdk/TERecorder;
    .locals 0

    .line 44
    iget-object p0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    return-object p0
.end method

.method static synthetic access$500(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;)F
    .locals 0

    .line 44
    iget p0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mSpeed:F

    return p0
.end method

.method static synthetic access$600(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;)Lcom/android/camera/ActivityBase;
    .locals 0

    .line 44
    iget-object p0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mActivity:Lcom/android/camera/ActivityBase;

    return-object p0
.end method

.method public static create(Lcom/android/camera/ActivityBase;)Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;
    .locals 1

    .line 99
    new-instance v0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;

    invoke-direct {v0, p0}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;-><init>(Lcom/android/camera/ActivityBase;)V

    return-object v0
.end method

.method private deleteLastSegment()V
    .locals 1

    .line 128
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    if-nez v0, :cond_0

    return-void

    .line 129
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    invoke-virtual {v0}, Lcom/ss/android/vesdk/TERecorder;->deleteLastFrag()V

    .line 130
    return-void
.end method


# virtual methods
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

    .line 418
    new-instance v0, Landroid/util/Pair;

    iget-object v1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mConcatVideoPath:Ljava/lang/String;

    iget-object v2, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mBGMPath:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v0
.end method

.method public getInputSurfaceTexture()Landroid/graphics/SurfaceTexture;
    .locals 1

    .line 213
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mInputSurfaceTexture:Landroid/graphics/SurfaceTexture;

    return-object v0
.end method

.method public getRecordSpeed()F
    .locals 1

    .line 429
    iget v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mSpeed:F

    return v0
.end method

.method public getStartRecordintTime()J
    .locals 2

    .line 439
    iget-wide v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mStartTime:J

    return-wide v0
.end method

.method public getTotalRecordintTime()J
    .locals 2

    .line 434
    iget-wide v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mTotalRecordingTime:J

    return-wide v0
.end method

.method public initPreview(IIZI)V
    .locals 3

    .line 133
    const-string v0, "live initPreview:"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 134
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

    .line 135
    iget-object p3, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mInputSurfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-virtual {p3, p1, p2}, Landroid/graphics/SurfaceTexture;->setDefaultBufferSize(II)V

    .line 136
    iget-boolean p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mInitialized:Z

    if-eqz p1, :cond_1

    .line 137
    iget-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    iget-object p2, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mPreviewSettings:Lcom/ss/android/vesdk/VEPreviewSettings;

    invoke-virtual {p1, p2}, Lcom/ss/android/vesdk/TERecorder;->updatePreviewSettings(Lcom/ss/android/vesdk/VEPreviewSettings;)V

    goto :goto_2

    .line 139
    :cond_1
    new-instance p1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;

    invoke-direct {p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;-><init>()V

    .line 140
    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->setUsage(I)Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;

    move-result-object p1

    .line 141
    const/4 p3, 0x0

    invoke-virtual {p1, p3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->isUseCloudConfig(Z)Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;

    move-result-object p1

    .line 142
    invoke-virtual {p1, p2}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->setHwEnc(Z)Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;

    move-result-object p1

    sget-object p4, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;->ENCODE_PROFILE_MAIN:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;

    .line 143
    invoke-virtual {p1, p4}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->setEncodeProfile(Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;)Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;

    move-result-object p1

    const/16 p4, 0x240

    const/16 v0, 0x400

    .line 144
    invoke-virtual {p1, p4, v0}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->setVideoRes(II)Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;

    move-result-object p1

    .line 145
    invoke-virtual {p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->build()Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    .line 147
    iget-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    iget-object p4, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mPreviewSettings:Lcom/ss/android/vesdk/VEPreviewSettings;

    invoke-virtual {p1, p4, v0, v1}, Lcom/ss/android/vesdk/TERecorder;->init(Lcom/ss/android/vesdk/VEVideoEncodeSettings;Lcom/ss/android/vesdk/VEAudioEncodeSettings;Lcom/ss/android/vesdk/VEPreviewSettings;)I

    .line 148
    iget-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    invoke-virtual {p1}, Lcom/ss/android/vesdk/TERecorder;->tryRestore()I

    .line 149
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object p1

    .line 150
    invoke-virtual {p1}, Lcom/android/camera/data/data/runing/DataItemRunning;->getLiveConfigIsNeedRestore()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 151
    iget-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    invoke-virtual {p1}, Lcom/ss/android/vesdk/TERecorder;->getSegmentInfo()Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mDurings:Ljava/util/List;

    .line 152
    iget-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mDurings:Ljava/util/List;

    invoke-static {p1}, Lcom/ss/android/medialib/model/TimeSpeedModel;->calculateRealTime(Ljava/util/List;)I

    move-result p1

    int-to-long v0, p1

    iput-wide v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mTotalRecordingTime:J

    .line 154
    iput-boolean p2, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mMediaRecorderRecordingPaused:Z

    .line 155
    iput-boolean p3, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mMediaRecorderRecording:Z

    goto :goto_1

    .line 157
    :cond_2
    iget-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    invoke-virtual {p1}, Lcom/ss/android/vesdk/TERecorder;->clearEnv()V

    .line 159
    :goto_1
    const-string p1, ""

    invoke-virtual {p0, p1}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->onBGMChanged(Ljava/lang/String;)V

    .line 160
    iput-boolean p2, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mInitialized:Z

    .line 162
    :goto_2
    return-void
.end method

.method public initResource()V
    .locals 5

    .line 245
    const-string v0, "live test :"

    const-string v1, "01"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 246
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mContext:Landroid/content/Context;

    sget-object v1, Lcom/android/camera/module/impl/component/FileUtils;->ROOT_DIR:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/ss/android/vesdk/VESDK;->init(Landroid/content/Context;Ljava/lang/String;)V

    .line 248
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mContext:Landroid/content/Context;

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 249
    const-string v1, "activationCode"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 250
    iget-object v2, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mContext:Landroid/content/Context;

    const-string v3, "36ed10517245d52898e49b5e9cff6184dbaed4d373bf673cadeccd2322c1f0c0ea34824b4c3be2a18823fedfff368e2670e7361fc9f6b32e27c7bd16445821f6"

    const-string v4, "100012"

    invoke-static {v2, v3, v4, v1}, Lcom/ss/android/vesdk/VESDK;->activate(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/ttve/oauth/TEOAuthResult;

    move-result-object v1

    .line 251
    sget-object v2, Lcom/ss/android/ttve/oauth/TEOAuthResult;->OK:Lcom/ss/android/ttve/oauth/TEOAuthResult;

    if-eq v1, v2, :cond_1

    sget-object v2, Lcom/ss/android/ttve/oauth/TEOAuthResult;->TBD:Lcom/ss/android/ttve/oauth/TEOAuthResult;

    if-ne v1, v2, :cond_0

    goto :goto_0

    .line 256
    :cond_0
    const-string v0, "live active:"

    const-string v1, "failed"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 252
    :cond_1
    :goto_0
    invoke-static {}, Lcom/ss/android/vesdk/VESDK;->getActivationCode()Ljava/lang/String;

    move-result-object v1

    .line 253
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v2, "activationCode"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 254
    const-string v0, "live active:"

    const-string v1, "success"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 259
    :goto_1
    invoke-static {}, Lcom/ss/android/vesdk/VESDK;->needUpdateEffectModelFiles()Z

    .line 263
    sget-object v0, Lcom/android/camera/module/impl/component/FileUtils;->ROOT_DIR:Ljava/lang/String;

    invoke-static {v0}, Lcom/android/camera/module/impl/component/FileUtils;->hasDir(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 264
    return-void

    .line 267
    :cond_2
    sget-object v0, Lcom/android/camera/module/impl/component/FileUtils;->ROOT_DIR:Ljava/lang/String;

    invoke-static {v0}, Lcom/android/camera/module/impl/component/FileUtils;->delDir(Ljava/lang/String;)Z

    .line 268
    const-string v0, "live test :"

    const-string v1, "02"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 270
    :try_start_0
    sget-object v0, Lcom/android/camera/module/impl/component/FileUtils;->FILTER_DIR:Ljava/lang/String;

    invoke-static {v0}, Lcom/android/camera/module/impl/component/FileUtils;->makeDir(Ljava/lang/String;)Z

    .line 271
    sget-object v0, Lcom/android/camera/module/impl/component/FileUtils;->RESOURCE_DIR:Ljava/lang/String;

    invoke-static {v0}, Lcom/android/camera/module/impl/component/FileUtils;->makeDir(Ljava/lang/String;)Z

    .line 272
    sget-object v0, Lcom/android/camera/module/impl/component/FileUtils;->RESHAPE_DIR_NAME:Ljava/lang/String;

    invoke-static {v0}, Lcom/android/camera/module/impl/component/FileUtils;->makeDir(Ljava/lang/String;)Z

    .line 273
    sget-object v0, Lcom/android/camera/module/impl/component/FileUtils;->VIDEO_TMP:Ljava/lang/String;

    invoke-static {v0}, Lcom/android/camera/module/impl/component/FileUtils;->makeDir(Ljava/lang/String;)Z

    .line 274
    sget-object v0, Lcom/android/camera/module/impl/component/FileUtils;->MUSIC:Ljava/lang/String;

    invoke-static {v0}, Lcom/android/camera/module/impl/component/FileUtils;->makeDir(Ljava/lang/String;)Z

    .line 275
    sget-object v0, Lcom/android/camera/module/impl/component/FileUtils;->ROOT_DIR:Ljava/lang/String;

    invoke-static {v0}, Lcom/android/camera/module/impl/component/FileUtils;->makeSureNoMedia(Ljava/lang/String;)V

    .line 277
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mContext:Landroid/content/Context;

    sget-object v1, Lcom/android/camera/module/impl/component/FileUtils;->MUSIC:Ljava/lang/String;

    const-string v2, "music00001.mp3"

    invoke-static {v0, v1, v2}, Lcom/android/camera/module/impl/component/FileUtils;->copyFileIfNeed(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    .line 278
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mContext:Landroid/content/Context;

    sget-object v1, Lcom/android/camera/module/impl/component/FileUtils;->MUSIC:Ljava/lang/String;

    const-string v2, "music00002.mp3"

    invoke-static {v0, v1, v2}, Lcom/android/camera/module/impl/component/FileUtils;->copyFileIfNeed(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    .line 279
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mContext:Landroid/content/Context;

    sget-object v1, Lcom/android/camera/module/impl/component/FileUtils;->MUSIC:Ljava/lang/String;

    const-string v2, "music00003.mp3"

    invoke-static {v0, v1, v2}, Lcom/android/camera/module/impl/component/FileUtils;->copyFileIfNeed(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    .line 280
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mContext:Landroid/content/Context;

    sget-object v1, Lcom/android/camera/module/impl/component/FileUtils;->MUSIC:Ljava/lang/String;

    const-string v2, "music00004.mp3"

    invoke-static {v0, v1, v2}, Lcom/android/camera/module/impl/component/FileUtils;->copyFileIfNeed(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    .line 282
    sget-object v0, Lcom/android/camera/module/impl/component/FileUtils;->ResourcesList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 283
    iget-object v2, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mContext:Landroid/content/Context;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ".zip"

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sget-object v3, Lcom/android/camera/module/impl/component/FileUtils;->STICKER_RESOURCE_DIR:Ljava/lang/String;

    invoke-static {v2, v1, v3}, Lcom/android/camera/module/impl/component/FileUtils;->UnZipAssetFolder(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 284
    goto :goto_2

    .line 285
    :cond_3
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mContext:Landroid/content/Context;

    const-string v1, "Beauty_12.zip"

    sget-object v2, Lcom/android/camera/module/impl/component/FileUtils;->RESOURCE_DIR:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/android/camera/module/impl/component/FileUtils;->UnZipAssetFolder(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 286
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mContext:Landroid/content/Context;

    const-string v1, "filter.zip"

    sget-object v2, Lcom/android/camera/module/impl/component/FileUtils;->RESOURCE_DIR:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/android/camera/module/impl/component/FileUtils;->UnZipAssetFolder(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 289
    goto :goto_3

    .line 287
    :catch_0
    move-exception v0

    .line 288
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 291
    :goto_3
    return-void
.end method

.method public isRecording()Z
    .locals 1

    .line 231
    iget-boolean v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mMediaRecorderRecording:Z

    return v0
.end method

.method public isRecordingPaused()Z
    .locals 1

    .line 236
    iget-boolean v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mMediaRecorderRecordingPaused:Z

    return v0
.end method

.method public onBGMChanged(Ljava/lang/String;)V
    .locals 4

    .line 357
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    if-eqz v0, :cond_0

    .line 358
    iput-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mBGMPath:Ljava/lang/String;

    .line 359
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    const/4 v1, 0x0

    const/16 v2, 0x3a98

    const/4 v3, 0x1

    invoke-virtual {v0, p1, v1, v2, v3}, Lcom/ss/android/vesdk/TERecorder;->setRecordBGM(Ljava/lang/String;III)I

    .line 361
    :cond_0
    return-void
.end method

.method public onRecordConcat()V
    .locals 2

    .line 377
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    invoke-virtual {v0}, Lcom/ss/android/vesdk/TERecorder;->concat()[Ljava/lang/String;

    move-result-object v0

    .line 378
    const/4 v1, 0x0

    aget-object v1, v0, v1

    iput-object v1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mConcatVideoPath:Ljava/lang/String;

    .line 379
    const/4 v1, 0x1

    aget-object v0, v0, v1

    iput-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mConcatWavPath:Ljava/lang/String;

    .line 380
    return-void
.end method

.method public onRecordPause()V
    .locals 6

    .line 309
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    if-eqz v0, :cond_3

    iget-boolean v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mMediaRecorderRecordingPaused:Z

    if-eqz v0, :cond_0

    goto :goto_1

    .line 313
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    invoke-virtual {v0}, Lcom/ss/android/vesdk/TERecorder;->stopRecord()I

    .line 315
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    invoke-virtual {v0}, Lcom/ss/android/vesdk/TERecorder;->getEndFrameTime()J

    move-result-wide v0

    .line 318
    const-wide/16 v2, 0xa

    cmp-long v2, v0, v2

    if-gtz v2, :cond_1

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-ltz v0, :cond_1

    .line 319
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->deleteLastSegment()V

    goto :goto_0

    .line 321
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    invoke-virtual {v0}, Lcom/ss/android/vesdk/TERecorder;->getSegmentInfo()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mDurings:Ljava/util/List;

    .line 322
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mStartTime:J

    sub-long/2addr v0, v2

    .line 323
    iget-wide v2, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mTotalRecordingTime:J

    long-to-double v2, v2

    long-to-double v0, v0

    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    mul-double/2addr v0, v4

    iget v4, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mSpeed:F

    float-to-double v4, v4

    div-double/2addr v0, v4

    add-double/2addr v2, v0

    double-to-long v0, v2

    iput-wide v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mTotalRecordingTime:J

    .line 326
    :goto_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mMediaRecorderRecordingPaused:Z

    .line 327
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mMediaRecorderRecording:Z

    .line 328
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mCountDownTimer:Landroid/os/CountDownTimer;

    if-eqz v0, :cond_2

    .line 329
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mCountDownTimer:Landroid/os/CountDownTimer;

    invoke-virtual {v0}, Landroid/os/CountDownTimer;->cancel()V

    .line 331
    :cond_2
    return-void

    .line 310
    :cond_3
    :goto_1
    return-void
.end method

.method public onRecordResume()V
    .locals 2

    .line 335
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mMediaRecorderRecordingPaused:Z

    if-nez v0, :cond_0

    goto :goto_0

    .line 338
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mMediaRecorderRecordingPaused:Z

    .line 339
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mMediaRecorderRecording:Z

    .line 340
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    iget v1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mSpeed:F

    invoke-virtual {v0, v1}, Lcom/ss/android/vesdk/TERecorder;->startRecord(F)I

    .line 341
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->updateRecordingTime()V

    .line 342
    return-void

    .line 336
    :cond_1
    :goto_0
    return-void
.end method

.method public onRecordReverse()V
    .locals 2

    .line 346
    sget-object v0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->TAG:Ljava/lang/String;

    const-string v1, "delete last frag !!!"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 347
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    if-nez v0, :cond_0

    return-void

    .line 348
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    invoke-virtual {v0}, Lcom/ss/android/vesdk/TERecorder;->getSegmentInfo()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mDurings:Ljava/util/List;

    .line 349
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mDurings:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_1

    .line 350
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mDurings:Ljava/util/List;

    iget-object v1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mDurings:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ss/android/medialib/model/TimeSpeedModel;

    .line 351
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mDurings:Ljava/util/List;

    invoke-static {v0}, Lcom/ss/android/medialib/model/TimeSpeedModel;->calculateRealTime(Ljava/util/List;)I

    move-result v0

    int-to-long v0, v0

    iput-wide v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mTotalRecordingTime:J

    .line 353
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    invoke-virtual {v0}, Lcom/ss/android/vesdk/TERecorder;->deleteLastFrag()V

    .line 354
    return-void
.end method

.method public onRecordStart()V
    .locals 3

    .line 295
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    if-nez v0, :cond_0

    .line 296
    return-void

    .line 298
    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->setLiveConfigIsNeedRestore(Z)V

    .line 299
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    iget v2, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mSpeed:F

    invoke-virtual {v0, v2}, Lcom/ss/android/vesdk/TERecorder;->startRecord(F)I

    .line 302
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mMediaRecorderRecordingPaused:Z

    .line 303
    iput-boolean v1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mMediaRecorderRecording:Z

    .line 304
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->updateRecordingTime()V

    .line 305
    return-void
.end method

.method public onRecordStop()V
    .locals 2

    .line 365
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    if-nez v0, :cond_0

    .line 366
    return-void

    .line 368
    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->setLiveConfigIsNeedRestore(Z)V

    .line 369
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->onRecordPause()V

    .line 370
    iput-boolean v1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mMediaRecorderRecordingPaused:Z

    .line 371
    iput-boolean v1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mMediaRecorderRecording:Z

    .line 372
    return-void
.end method

.method public registerProtocol()V
    .locals 2

    .line 105
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc9

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 106
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mStickerImpl:Lcom/android/camera/protocol/ModeProtocol$StickerProtocol;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$StickerProtocol;->registerProtocol()V

    .line 107
    return-void
.end method

.method public release()V
    .locals 2

    .line 217
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    if-eqz v0, :cond_1

    .line 218
    iget-boolean v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mMediaRecorderRecording:Z

    if-eqz v0, :cond_0

    .line 219
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->onRecordPause()V

    .line 220
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    invoke-virtual {v0}, Lcom/ss/android/vesdk/TERecorder;->stopPreview()I

    .line 221
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/ss/android/vesdk/TERecorder;->setRecrodStateCallback(Lcom/ss/android/vesdk/VEListener$VERecorderStateListener;)V

    .line 222
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    invoke-virtual {v0, v1}, Lcom/ss/android/vesdk/TERecorder;->setRenderCallback(Lcom/ss/android/vesdk/IRenderCallback;)V

    .line 223
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    invoke-virtual {v0}, Lcom/ss/android/vesdk/TERecorder;->destroy()V

    .line 224
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mInputSurfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->release()V

    .line 225
    iput-object v1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    .line 227
    :cond_1
    return-void
.end method

.method public setBeautyLevel(I)V
    .locals 3

    .line 122
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mTTNativeIsInit:Z

    if-nez v0, :cond_0

    goto :goto_0

    .line 123
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    const/4 v1, 0x3

    sget-object v2, Lcom/android/camera/module/impl/component/FileUtils;->BEAUTY_12_DIR:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/ss/android/vesdk/TERecorder;->setBeautyFace(ILjava/lang/String;)I

    .line 124
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    iget-object v1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->BEAUTY_LEVEL:[F

    aget v1, v1, p1

    iget-object v2, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->BEAUTY_LEVEL:[F

    aget p1, v2, p1

    invoke-virtual {v0, v1, p1}, Lcom/ss/android/vesdk/TERecorder;->setBeautyFaceIntensity(FF)I

    .line 125
    return-void

    .line 122
    :cond_1
    :goto_0
    return-void
.end method

.method public setRecordSpeed(I)V
    .locals 1

    .line 424
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->SPEEDS:[F

    aget p1, v0, p1

    iput p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mSpeed:F

    .line 425
    return-void
.end method

.method public setSticker(I)V
    .locals 3

    .line 117
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mTTNativeIsInit:Z

    if-nez v0, :cond_0

    goto :goto_0

    .line 118
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/android/camera/module/impl/component/FileUtils;->STICKER_RESOURCE_DIR:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Lcom/android/camera/module/impl/component/FileUtils;->ResourcesList:Ljava/util/List;

    invoke-interface {v2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/ss/android/vesdk/TERecorder;->switchEffect(Ljava/lang/String;)I

    .line 119
    return-void

    .line 117
    :cond_1
    :goto_0
    return-void
.end method

.method public startPreview(Landroid/view/Surface;)V
    .locals 6

    .line 165
    iget-boolean v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mInputSurfaceReady:Z

    if-eqz v0, :cond_0

    .line 166
    return-void

    .line 169
    :cond_0
    new-instance v0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$1;

    invoke-direct {v0, p0}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$1;-><init>(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;)V

    .line 194
    iget-object v1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    new-instance v2, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$2;

    invoke-direct {v2, p0}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$2;-><init>(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;)V

    invoke-virtual {v1, v2}, Lcom/ss/android/vesdk/TERecorder;->setRecrodStateCallback(Lcom/ss/android/vesdk/VEListener$VERecorderStateListener;)V

    .line 206
    iget-object v1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    iget-object v2, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mBGMPath:Ljava/lang/String;

    const/4 v3, 0x0

    const/16 v4, 0x3a98

    const/4 v5, 0x1

    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/ss/android/vesdk/TERecorder;->setRecordBGM(Ljava/lang/String;III)I

    .line 207
    iget-object v1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    invoke-virtual {v1, v0}, Lcom/ss/android/vesdk/TERecorder;->setRenderCallback(Lcom/ss/android/vesdk/IRenderCallback;)V

    .line 208
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    invoke-virtual {v0, p1}, Lcom/ss/android/vesdk/TERecorder;->startPreview(Landroid/view/Surface;)I

    .line 210
    return-void
.end method

.method public unRegisterProtocol()V
    .locals 2

    .line 111
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc9

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 112
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mStickerImpl:Lcom/android/camera/protocol/ModeProtocol$StickerProtocol;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$StickerProtocol;->unRegisterProtocol()V

    .line 113
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->release()V

    .line 114
    return-void
.end method

.method public updateRecordingTime()V
    .locals 7

    .line 384
    iget-boolean v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mMediaRecorderRecording:Z

    if-nez v0, :cond_0

    .line 385
    return-void

    .line 388
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mCountDownTimer:Landroid/os/CountDownTimer;

    if-eqz v0, :cond_1

    .line 389
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mCountDownTimer:Landroid/os/CountDownTimer;

    invoke-virtual {v0}, Landroid/os/CountDownTimer;->cancel()V

    .line 392
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

    .line 412
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mStartTime:J

    .line 413
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->mCountDownTimer:Landroid/os/CountDownTimer;

    invoke-virtual {v0}, Landroid/os/CountDownTimer;->start()Landroid/os/CountDownTimer;

    .line 414
    return-void
.end method
