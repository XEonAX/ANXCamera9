.class public Lcom/ss/android/medialib/TTRecorder;
.super Ljava/lang/Object;
.source "TTRecorder.java"

# interfaces
.implements Lcom/bef/effectsdk/message/MessageCenter$Listener;
.implements Lcom/ss/android/medialib/AVCEncoderInterface;
.implements Lorg/a/a/c;


# annotations
.annotation build Landroid/support/annotation/Keep;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/android/medialib/TTRecorder$OnConcatFinishListener;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;

.field private static sMessageListener:Lcom/bef/effectsdk/message/MessageCenter$Listener;


# instance fields
.field private glCallback:Lcom/ss/android/medialib/common/Common$IOnOpenGLCallback;

.field private handle:J

.field private mAVCEncoder:Lcom/ss/android/medialib/AVCEncoder;

.field private mAudioInited:Z

.field private mAudioLoop:Z

.field private mAudioRecorder:Lorg/a/a/d;

.field private mContext:Landroid/content/Context;

.field private mGLCallback:Lcom/ss/android/medialib/listener/GLCallback;

.field private mMusicPath:Ljava/lang/String;

.field private mMusicStart:J

.field private mNativeInitListener:Lcom/ss/android/medialib/listener/NativeInitListener;

.field private sFaceDetectListener:Lcom/ss/android/medialib/listener/FaceDetectListener;

.field private textureHolder:Lcom/ss/android/medialib/camera/TextureHolder;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 34
    const-class v0, Lcom/ss/android/medialib/TTRecorder;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/ss/android/medialib/TTRecorder;->TAG:Ljava/lang/String;

    .line 53
    invoke-static {}, Lcom/ss/android/medialib/NativePort/NativeLibsLoader;->loadLibrary()V

    .line 54
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mGLCallback:Lcom/ss/android/medialib/listener/GLCallback;

    .line 38
    iput-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mAVCEncoder:Lcom/ss/android/medialib/AVCEncoder;

    .line 39
    new-instance v0, Lcom/ss/android/medialib/camera/TextureHolder;

    invoke-direct {v0}, Lcom/ss/android/medialib/camera/TextureHolder;-><init>()V

    iput-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->textureHolder:Lcom/ss/android/medialib/camera/TextureHolder;

    .line 47
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/ss/android/medialib/TTRecorder;->mAudioLoop:Z

    .line 59
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->mMusicStart:J

    .line 681
    new-instance v0, Lcom/ss/android/medialib/TTRecorder$2;

    invoke-direct {v0, p0}, Lcom/ss/android/medialib/TTRecorder$2;-><init>(Lcom/ss/android/medialib/TTRecorder;)V

    iput-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->glCallback:Lcom/ss/android/medialib/common/Common$IOnOpenGLCallback;

    .line 65
    if-eqz p1, :cond_0

    .line 66
    iput-object p1, p0, Lcom/ss/android/medialib/TTRecorder;->mContext:Landroid/content/Context;

    .line 67
    invoke-direct {p0}, Lcom/ss/android/medialib/TTRecorder;->nativeCreate()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    .line 68
    return-void

    .line 65
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "context can not be null"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method static synthetic access$000(Lcom/ss/android/medialib/TTRecorder;)J
    .locals 2

    .line 33
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    return-wide v0
.end method

.method static synthetic access$100(Lcom/ss/android/medialib/TTRecorder;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .locals 0

    .line 33
    invoke-direct/range {p0 .. p6}, Lcom/ss/android/medialib/TTRecorder;->nativeConcat(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method static synthetic access$200(Lcom/ss/android/medialib/TTRecorder;)Lcom/ss/android/medialib/listener/GLCallback;
    .locals 0

    .line 33
    iget-object p0, p0, Lcom/ss/android/medialib/TTRecorder;->mGLCallback:Lcom/ss/android/medialib/listener/GLCallback;

    return-object p0
.end method

.method static synthetic access$300(Lcom/ss/android/medialib/TTRecorder;)Lcom/ss/android/medialib/camera/TextureHolder;
    .locals 0

    .line 33
    iget-object p0, p0, Lcom/ss/android/medialib/TTRecorder;->textureHolder:Lcom/ss/android/medialib/camera/TextureHolder;

    return-object p0
.end method

.method static synthetic access$400(Lcom/ss/android/medialib/TTRecorder;JI[F)I
    .locals 0

    .line 33
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/ss/android/medialib/TTRecorder;->nativeOnFrameAvailable(JI[F)I

    move-result p0

    return p0
.end method

.method static synthetic access$500()Ljava/lang/String;
    .locals 1

    .line 33
    sget-object v0, Lcom/ss/android/medialib/TTRecorder;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method private destroyMessageCenter()V
    .locals 1

    .line 77
    invoke-static {}, Lcom/bef/effectsdk/message/MessageCenter;->destroy()V

    .line 78
    const/4 v0, 0x0

    sput-object v0, Lcom/ss/android/medialib/TTRecorder;->sMessageListener:Lcom/bef/effectsdk/message/MessageCenter$Listener;

    .line 79
    return-void
.end method

.method private getTextureDeltaTime(Z)J
    .locals 6

    .line 661
    iget-object p1, p0, Lcom/ss/android/medialib/TTRecorder;->textureHolder:Lcom/ss/android/medialib/camera/TextureHolder;

    invoke-virtual {p1}, Lcom/ss/android/medialib/camera/TextureHolder;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iget-object p1, p0, Lcom/ss/android/medialib/TTRecorder;->textureHolder:Lcom/ss/android/medialib/camera/TextureHolder;

    invoke-virtual {p1}, Lcom/ss/android/medialib/camera/TextureHolder;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/SurfaceTexture;->getTimestamp()J

    move-result-wide v2

    const-wide/16 v4, 0x3e8

    div-long/2addr v2, v4

    div-long/2addr v2, v4

    sub-long/2addr v0, v2

    goto :goto_0

    :cond_0
    const-wide/16 v0, -0x1

    :goto_0
    return-wide v0
.end method

.method private handleAudioRecord(D)V
    .locals 1

    .line 379
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mAudioRecorder:Lorg/a/a/d;

    if-eqz v0, :cond_0

    .line 380
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mAudioRecorder:Lorg/a/a/d;

    invoke-virtual {v0, p1, p2}, Lorg/a/a/d;->d(D)V

    .line 382
    :cond_0
    return-void
.end method

.method private initAudioIfNeed()V
    .locals 11

    .line 363
    iget-boolean v0, p0, Lcom/ss/android/medialib/TTRecorder;->mAudioInited:Z

    if-nez v0, :cond_1

    .line 365
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mMusicPath:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 366
    new-instance v0, Lorg/a/a/d;

    invoke-direct {v0, p0}, Lorg/a/a/d;-><init>(Lorg/a/a/c;)V

    iput-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mAudioRecorder:Lorg/a/a/d;

    .line 367
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mAudioRecorder:Lorg/a/a/d;

    const/4 v2, 0x5

    invoke-virtual {v0, v2}, Lorg/a/a/d;->init(I)V

    .line 368
    iget-wide v2, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const/4 v0, 0x0

    invoke-direct {p0, v2, v3, v0}, Lcom/ss/android/medialib/TTRecorder;->nativeSetUseMusic(JI)I

    goto :goto_0

    .line 370
    :cond_0
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/ss/android/medialib/utils/Utils;->getSystemAudioInfo(Landroid/content/Context;)Landroid/util/Pair;

    move-result-object v0

    .line 371
    iget-wide v3, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    iget-object v5, p0, Lcom/ss/android/medialib/TTRecorder;->mMusicPath:Ljava/lang/String;

    iget-object v2, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v6

    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v7

    const-wide/16 v8, 0x0

    iget-boolean v10, p0, Lcom/ss/android/medialib/TTRecorder;->mAudioLoop:Z

    move-object v2, p0

    invoke-direct/range {v2 .. v10}, Lcom/ss/android/medialib/TTRecorder;->nativeInitAudioPlayer(JLjava/lang/String;IIJZ)I

    .line 372
    iget-wide v2, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-direct {p0, v2, v3, v1}, Lcom/ss/android/medialib/TTRecorder;->nativeSetUseMusic(JI)I

    .line 374
    :goto_0
    iput-boolean v1, p0, Lcom/ss/android/medialib/TTRecorder;->mAudioInited:Z

    .line 376
    :cond_1
    return-void
.end method

.method private initMessageCenter()V
    .locals 0

    .line 71
    invoke-static {}, Lcom/bef/effectsdk/message/MessageCenter;->init()V

    .line 72
    invoke-static {p0}, Lcom/bef/effectsdk/message/MessageCenter;->setListener(Lcom/bef/effectsdk/message/MessageCenter$Listener;)V

    .line 73
    return-void
.end method

.method private native nativeAddPCMData(J[BI)I
.end method

.method private native nativeClearFragFile(J)I
.end method

.method private native nativeCloseWavFile(J)I
.end method

.method private native nativeConcat(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
.end method

.method private native nativeCreate()J
.end method

.method private native nativeDeleteLastFrag(J)I
.end method

.method private native nativeDestroy(J)I
.end method

.method private native nativeGetEndFrameTime(J)J
.end method

.method private native nativeGetSegments(J)Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Ljava/util/ArrayList<",
            "Lcom/ss/android/medialib/model/TimeSpeedModel;",
            ">;"
        }
    .end annotation
.end method

.method private native nativeInit(JIILjava/lang/String;IILjava/lang/String;)I
.end method

.method private native nativeInitAudioPlayer(JLjava/lang/String;IIJZ)I
.end method

.method private native nativeInitWavFile(JIID)I
.end method

.method private native nativeOnFrameAvailable(JI[F)I
.end method

.method private native nativePauseEffectAudio(J)I
.end method

.method private native nativeResumeEffectAudio(J)I
.end method

.method private native nativeSave(J)I
.end method

.method private native nativeSetBeautyFace(JILjava/lang/String;)I
.end method

.method private native nativeSetBeautyFaceIntensity(JFF)I
.end method

.method private native nativeSetCameraInfo(JIZ)I
.end method

.method private native nativeSetCodecConfig(JLjava/nio/ByteBuffer;I)I
.end method

.method private native nativeSetColorFormat(JI)I
.end method

.method private native nativeSetDeviceRotation(J[F)I
.end method

.method private native nativeSetFaceReshape(JLjava/lang/String;FF)I
.end method

.method private native nativeSetFilter(JLjava/lang/String;F)I
.end method

.method private native nativeSetHardEncoderStatus(JZ)I
.end method

.method private native nativeSetMusicTime(JJJ)I
.end method

.method private native nativeSetPreviewSizeRatio(JF)V
.end method

.method private native nativeSetStickerPath(JLjava/lang/String;)I
.end method

.method private native nativeSetUseMusic(JI)I
.end method

.method private native nativeStartPreview(JLandroid/view/Surface;IZLjava/lang/String;)I
.end method

.method private native nativeStartRecord(JDZIII)I
.end method

.method private native nativeStopPreview(J)I
.end method

.method private native nativeStopRecord(J)I
.end method

.method private native nativeSwitchFilter(JLjava/lang/String;Ljava/lang/String;F)I
.end method

.method private native nativeTryRestore(J)I
.end method

.method private native nativeWriteFile(JLjava/nio/ByteBuffer;III)I
.end method

.method private native nativeWriteFile2(JLjava/nio/ByteBuffer;IJJI)I
.end method

.method public static setEffectMessageListener(Lcom/bef/effectsdk/message/MessageCenter$Listener;)V
    .locals 0

    .line 87
    sput-object p0, Lcom/ss/android/medialib/TTRecorder;->sMessageListener:Lcom/bef/effectsdk/message/MessageCenter$Listener;

    .line 88
    return-void
.end method


# virtual methods
.method public addPCMData([BI)I
    .locals 2

    .line 673
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/ss/android/medialib/TTRecorder;->nativeAddPCMData(J[BI)I

    move-result p1

    return p1
.end method

.method public clearEnv()V
    .locals 4

    .line 309
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 310
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-direct {p0, v0, v1}, Lcom/ss/android/medialib/TTRecorder;->nativeClearFragFile(J)I

    .line 312
    :cond_0
    return-void
.end method

.method public closeWavFile()I
    .locals 2

    .line 678
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-direct {p0, v0, v1}, Lcom/ss/android/medialib/TTRecorder;->nativeCloseWavFile(J)I

    move-result v0

    return v0
.end method

.method public concat(Ljava/lang/String;Ljava/lang/String;Lcom/ss/android/medialib/TTRecorder$OnConcatFinishListener;)V
    .locals 4

    .line 249
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 250
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/ss/android/medialib/TTRecorder$1;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/ss/android/medialib/TTRecorder$1;-><init>(Lcom/ss/android/medialib/TTRecorder;Ljava/lang/String;Ljava/lang/String;Lcom/ss/android/medialib/TTRecorder$OnConcatFinishListener;)V

    const-string p1, "ConcatThread"

    invoke-direct {v0, v1, p1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 258
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    goto :goto_0

    .line 261
    :cond_0
    if-eqz p3, :cond_1

    .line 262
    const/16 p1, -0x64

    invoke-interface {p3, p1}, Lcom/ss/android/medialib/TTRecorder$OnConcatFinishListener;->onConcatFinish(I)V

    .line 265
    :cond_1
    :goto_0
    return-void
.end method

.method public concatSyn(Ljava/lang/String;Ljava/lang/String;)I
    .locals 8

    .line 268
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 269
    iget-wide v2, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-string v6, ""

    const-string v7, ""

    move-object v1, p0

    move-object v4, p1

    move-object v5, p2

    invoke-direct/range {v1 .. v7}, Lcom/ss/android/medialib/TTRecorder;->nativeConcat(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    return p1

    .line 272
    :cond_0
    const/16 p1, -0x64

    return p1
.end method

.method public deleteLastFrag()V
    .locals 4

    .line 300
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 301
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-direct {p0, v0, v1}, Lcom/ss/android/medialib/TTRecorder;->nativeDeleteLastFrag(J)I

    .line 303
    :cond_0
    return-void
.end method

.method public destroy()V
    .locals 4

    .line 232
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mAudioRecorder:Lorg/a/a/d;

    if-eqz v0, :cond_0

    .line 233
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mAudioRecorder:Lorg/a/a/d;

    invoke-virtual {v0}, Lorg/a/a/d;->unInit()V

    .line 235
    :cond_0
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1

    .line 236
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-direct {p0, v0, v1}, Lcom/ss/android/medialib/TTRecorder;->nativeDestroy(J)I

    .line 238
    :cond_1
    iput-wide v2, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    .line 239
    return-void
.end method

.method public getEndFrameTime()J
    .locals 4

    .line 319
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    return-wide v2

    .line 320
    :cond_0
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-direct {p0, v0, v1}, Lcom/ss/android/medialib/TTRecorder;->nativeGetEndFrameTime(J)J

    move-result-wide v0

    return-wide v0
.end method

.method public getProfile()I
    .locals 1

    .line 516
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mAVCEncoder:Lcom/ss/android/medialib/AVCEncoder;

    invoke-virtual {v0}, Lcom/ss/android/medialib/AVCEncoder;->getProfile()I

    move-result v0

    return v0
.end method

.method public getSegmentInfo()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/ss/android/medialib/model/TimeSpeedModel;",
            ">;"
        }
    .end annotation

    .line 149
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    return-object v0

    .line 150
    :cond_0
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-direct {p0, v0, v1}, Lcom/ss/android/medialib/TTRecorder;->nativeGetSegments(J)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public getSurfaceTexture()Landroid/graphics/SurfaceTexture;
    .locals 1

    .line 389
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->textureHolder:Lcom/ss/android/medialib/camera/TextureHolder;

    invoke-virtual {v0}, Lcom/ss/android/medialib/camera/TextureHolder;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v0

    return-object v0
.end method

.method public init(IILjava/lang/String;IILjava/lang/String;)I
    .locals 9

    .line 127
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/16 p1, -0x64

    return p1

    .line 128
    :cond_0
    iget-wide v1, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    move-object v0, p0

    move v3, p1

    move v4, p2

    move-object v5, p3

    move v6, p4

    move v7, p5

    move-object v8, p6

    invoke-direct/range {v0 .. v8}, Lcom/ss/android/medialib/TTRecorder;->nativeInit(JIILjava/lang/String;IILjava/lang/String;)I

    move-result p1

    return p1
.end method

.method public initWavFile(IID)I
    .locals 7

    .line 668
    iget-wide v1, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    move-object v0, p0

    move v3, p1

    move v4, p2

    move-wide v5, p3

    invoke-direct/range {v0 .. v6}, Lcom/ss/android/medialib/TTRecorder;->nativeInitWavFile(JIID)I

    move-result p1

    return p1
.end method

.method public onEncodeData(IIZ)I
    .locals 1

    .line 596
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/ss/android/medialib/TTRecorder;->onEncoderData(IIIZ)I

    move-result p1

    return p1
.end method

.method public onEncoderData(IIIZ)I
    .locals 1

    .line 541
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mAVCEncoder:Lcom/ss/android/medialib/AVCEncoder;

    if-eqz v0, :cond_0

    .line 542
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mAVCEncoder:Lcom/ss/android/medialib/AVCEncoder;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/ss/android/medialib/AVCEncoder;->encode(IIIZ)I

    move-result p1

    return p1

    .line 544
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public onEncoderData(Ljava/nio/ByteBuffer;IZ)V
    .locals 0

    .line 537
    return-void
.end method

.method public onEncoderData([BIZ)V
    .locals 1

    .line 529
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mAVCEncoder:Lcom/ss/android/medialib/AVCEncoder;

    if-eqz v0, :cond_0

    .line 530
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mAVCEncoder:Lcom/ss/android/medialib/AVCEncoder;

    invoke-virtual {v0, p1, p2, p3}, Lcom/ss/android/medialib/AVCEncoder;->encode([BIZ)I

    .line 532
    :cond_0
    return-void
.end method

.method public onInitHardEncoder(IIIIIIZ)Landroid/view/Surface;
    .locals 10

    move-object v0, p0

    .line 495
    iget-object v1, v0, Lcom/ss/android/medialib/TTRecorder;->mAVCEncoder:Lcom/ss/android/medialib/AVCEncoder;

    if-nez v1, :cond_0

    .line 496
    new-instance v1, Lcom/ss/android/medialib/AVCEncoder;

    invoke-direct {v1}, Lcom/ss/android/medialib/AVCEncoder;-><init>()V

    iput-object v1, v0, Lcom/ss/android/medialib/TTRecorder;->mAVCEncoder:Lcom/ss/android/medialib/AVCEncoder;

    .line 499
    :cond_0
    iget-object v1, v0, Lcom/ss/android/medialib/TTRecorder;->mAVCEncoder:Lcom/ss/android/medialib/AVCEncoder;

    invoke-virtual {v1, v0}, Lcom/ss/android/medialib/AVCEncoder;->setEncoderCaller(Lcom/ss/android/medialib/AVCEncoderInterface;)V

    .line 500
    iget-object v2, v0, Lcom/ss/android/medialib/TTRecorder;->mAVCEncoder:Lcom/ss/android/medialib/AVCEncoder;

    move v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    move v7, p5

    move/from16 v8, p6

    move/from16 v9, p7

    invoke-virtual/range {v2 .. v9}, Lcom/ss/android/medialib/AVCEncoder;->initAVCEncoder(IIIIIIZ)Landroid/view/Surface;

    move-result-object v1

    .line 501
    if-nez v1, :cond_1

    .line 503
    const/4 v1, 0x0

    iput-object v1, v0, Lcom/ss/android/medialib/TTRecorder;->mAVCEncoder:Lcom/ss/android/medialib/AVCEncoder;

    .line 504
    iget-wide v2, v0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const/4 v4, 0x0

    invoke-direct {v0, v2, v3, v4}, Lcom/ss/android/medialib/TTRecorder;->nativeSetHardEncoderStatus(JZ)I

    .line 505
    return-object v1

    .line 507
    :cond_1
    iget-wide v2, v0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const/4 v4, 0x1

    invoke-direct {v0, v2, v3, v4}, Lcom/ss/android/medialib/TTRecorder;->nativeSetHardEncoderStatus(JZ)I

    .line 511
    return-object v1
.end method

.method public onInitHardEncoder(IIIIZ)Landroid/view/Surface;
    .locals 7

    .line 477
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mAVCEncoder:Lcom/ss/android/medialib/AVCEncoder;

    if-nez v0, :cond_0

    .line 478
    new-instance v0, Lcom/ss/android/medialib/AVCEncoder;

    invoke-direct {v0}, Lcom/ss/android/medialib/AVCEncoder;-><init>()V

    iput-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mAVCEncoder:Lcom/ss/android/medialib/AVCEncoder;

    .line 481
    :cond_0
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mAVCEncoder:Lcom/ss/android/medialib/AVCEncoder;

    invoke-virtual {v0, p0}, Lcom/ss/android/medialib/AVCEncoder;->setEncoderCaller(Lcom/ss/android/medialib/AVCEncoderInterface;)V

    .line 482
    iget-object v1, p0, Lcom/ss/android/medialib/TTRecorder;->mAVCEncoder:Lcom/ss/android/medialib/AVCEncoder;

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    invoke-virtual/range {v1 .. v6}, Lcom/ss/android/medialib/AVCEncoder;->initAVCEncoder(IIIIZ)Landroid/view/Surface;

    move-result-object p1

    .line 483
    if-nez p1, :cond_1

    .line 484
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/ss/android/medialib/TTRecorder;->mAVCEncoder:Lcom/ss/android/medialib/AVCEncoder;

    .line 485
    iget-wide p2, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const/4 p4, 0x0

    invoke-direct {p0, p2, p3, p4}, Lcom/ss/android/medialib/TTRecorder;->nativeSetHardEncoderStatus(JZ)I

    .line 486
    return-object p1

    .line 488
    :cond_1
    iget-wide p2, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const/4 p4, 0x1

    invoke-direct {p0, p2, p3, p4}, Lcom/ss/android/medialib/TTRecorder;->nativeSetHardEncoderStatus(JZ)I

    .line 490
    return-object p1
.end method

.method public onMessageReceived(IIILjava/lang/String;)V
    .locals 1

    .line 649
    sget-object v0, Lcom/ss/android/medialib/TTRecorder;->sMessageListener:Lcom/bef/effectsdk/message/MessageCenter$Listener;

    if-eqz v0, :cond_0

    .line 650
    sget-object v0, Lcom/ss/android/medialib/TTRecorder;->sMessageListener:Lcom/bef/effectsdk/message/MessageCenter$Listener;

    invoke-interface {v0, p1, p2, p3, p4}, Lcom/bef/effectsdk/message/MessageCenter$Listener;->onMessageReceived(IIILjava/lang/String;)V

    .line 652
    :cond_0
    return-void
.end method

.method public onNativeCallback_GetHardEncoderProfile()I
    .locals 1

    .line 585
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mAVCEncoder:Lcom/ss/android/medialib/AVCEncoder;

    if-eqz v0, :cond_0

    .line 586
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mAVCEncoder:Lcom/ss/android/medialib/AVCEncoder;

    invoke-virtual {v0}, Lcom/ss/android/medialib/AVCEncoder;->getProfile()I

    move-result v0

    return v0

    .line 588
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public onNativeCallback_Init(I)V
    .locals 3

    .line 459
    if-gez p1, :cond_0

    .line 460
    const-string v0, "TTRecorder"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onNativeCallback_Init error = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 462
    :cond_0
    const-string v0, "TTRecorder"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onNativeCallback_Init success = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 464
    :goto_0
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mNativeInitListener:Lcom/ss/android/medialib/listener/NativeInitListener;

    if-eqz v0, :cond_1

    .line 465
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mNativeInitListener:Lcom/ss/android/medialib/listener/NativeInitListener;

    invoke-interface {v0, p1}, Lcom/ss/android/medialib/listener/NativeInitListener;->onNativeInitCallBack(I)V

    .line 467
    :cond_1
    return-void
.end method

.method public onNativeCallback_InitHardEncoder(IIIIIIZ)Landroid/view/Surface;
    .locals 0

    .line 574
    invoke-virtual/range {p0 .. p7}, Lcom/ss/android/medialib/TTRecorder;->onInitHardEncoder(IIIIIIZ)Landroid/view/Surface;

    move-result-object p1

    return-object p1
.end method

.method public onNativeCallback_InitHardEncoderRet(II)V
    .locals 1

    .line 579
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mNativeInitListener:Lcom/ss/android/medialib/listener/NativeInitListener;

    if-eqz v0, :cond_0

    .line 580
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mNativeInitListener:Lcom/ss/android/medialib/listener/NativeInitListener;

    invoke-interface {v0, p1, p2}, Lcom/ss/android/medialib/listener/NativeInitListener;->onNativeInitHardEncoderRetCallback(II)V

    .line 582
    :cond_0
    return-void
.end method

.method public onNativeCallback_UninitHardEncoder()V
    .locals 0

    .line 592
    invoke-virtual {p0}, Lcom/ss/android/medialib/TTRecorder;->onUninitHardEncoder()V

    .line 593
    return-void
.end method

.method public onNativeCallback_encodeTexture(IIZ)I
    .locals 0

    .line 604
    invoke-virtual {p0, p1, p2, p3}, Lcom/ss/android/medialib/TTRecorder;->onEncodeData(IIZ)I

    .line 605
    const/4 p1, 0x0

    return p1
.end method

.method public onNativeCallback_onFaceDetect(II)V
    .locals 1

    .line 628
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->sFaceDetectListener:Lcom/ss/android/medialib/listener/FaceDetectListener;

    if-eqz v0, :cond_0

    .line 629
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->sFaceDetectListener:Lcom/ss/android/medialib/listener/FaceDetectListener;

    invoke-interface {v0, p1, p2}, Lcom/ss/android/medialib/listener/FaceDetectListener;->onResult(II)V

    .line 631
    :cond_0
    return-void
.end method

.method public onNativeCallback_onOpenGLCreate()V
    .locals 1

    .line 609
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->glCallback:Lcom/ss/android/medialib/common/Common$IOnOpenGLCallback;

    if-eqz v0, :cond_0

    .line 610
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->glCallback:Lcom/ss/android/medialib/common/Common$IOnOpenGLCallback;

    invoke-interface {v0}, Lcom/ss/android/medialib/common/Common$IOnOpenGLCallback;->onOpenGLCreate()V

    .line 612
    :cond_0
    return-void
.end method

.method public onNativeCallback_onOpenGLDestroy()V
    .locals 1

    .line 622
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->glCallback:Lcom/ss/android/medialib/common/Common$IOnOpenGLCallback;

    if-eqz v0, :cond_0

    .line 623
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->glCallback:Lcom/ss/android/medialib/common/Common$IOnOpenGLCallback;

    invoke-interface {v0}, Lcom/ss/android/medialib/common/Common$IOnOpenGLCallback;->onOpenGLDestroy()V

    .line 625
    :cond_0
    return-void
.end method

.method public onNativeCallback_onOpenGLRunning(D)I
    .locals 0

    .line 615
    iget-object p1, p0, Lcom/ss/android/medialib/TTRecorder;->glCallback:Lcom/ss/android/medialib/common/Common$IOnOpenGLCallback;

    if-eqz p1, :cond_0

    .line 616
    iget-object p1, p0, Lcom/ss/android/medialib/TTRecorder;->glCallback:Lcom/ss/android/medialib/common/Common$IOnOpenGLCallback;

    invoke-interface {p1}, Lcom/ss/android/medialib/common/Common$IOnOpenGLCallback;->onOpenGLRunning()I

    .line 618
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public onSetCodecConfig(Ljava/nio/ByteBuffer;)V
    .locals 4

    .line 549
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 550
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    invoke-direct {p0, v0, v1, p1, v2}, Lcom/ss/android/medialib/TTRecorder;->nativeSetCodecConfig(JLjava/nio/ByteBuffer;I)I

    .line 552
    :cond_0
    return-void
.end method

.method public onSwapGlBuffers()V
    .locals 0

    .line 571
    return-void
.end method

.method public onUninitHardEncoder()V
    .locals 1

    .line 521
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mAVCEncoder:Lcom/ss/android/medialib/AVCEncoder;

    if-eqz v0, :cond_0

    .line 522
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mAVCEncoder:Lcom/ss/android/medialib/AVCEncoder;

    invoke-virtual {v0}, Lcom/ss/android/medialib/AVCEncoder;->uninitAVCEncoder()V

    .line 523
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mAVCEncoder:Lcom/ss/android/medialib/AVCEncoder;

    .line 525
    :cond_0
    return-void
.end method

.method public onWriteFile(Ljava/nio/ByteBuffer;III)V
    .locals 7

    .line 556
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v2, 0x0

    cmp-long p3, v0, v2

    if-eqz p3, :cond_0

    .line 557
    iget-wide v1, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v4

    move-object v0, p0

    move-object v3, p1

    move v5, p2

    move v6, p4

    invoke-direct/range {v0 .. v6}, Lcom/ss/android/medialib/TTRecorder;->nativeWriteFile(JLjava/nio/ByteBuffer;III)I

    .line 559
    :cond_0
    return-void
.end method

.method public onWriteFile(Ljava/nio/ByteBuffer;JJII)V
    .locals 10

    move-object v0, p0

    .line 563
    iget-wide v1, v0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-eqz v1, :cond_0

    .line 564
    iget-wide v1, v0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v4

    move-object v3, p1

    move-wide v5, p2

    move-wide v7, p4

    move/from16 v9, p7

    invoke-direct/range {v0 .. v9}, Lcom/ss/android/medialib/TTRecorder;->nativeWriteFile2(JLjava/nio/ByteBuffer;IJJI)I

    .line 566
    :cond_0
    return-void
.end method

.method public pauseEffectAudio()I
    .locals 4

    .line 344
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 345
    const/16 v0, -0x64

    return v0

    .line 347
    :cond_0
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-direct {p0, v0, v1}, Lcom/ss/android/medialib/TTRecorder;->nativePauseEffectAudio(J)I

    move-result v0

    return v0
.end method

.method public resumeEffectAudio()I
    .locals 4

    .line 355
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 356
    const/16 v0, -0x64

    return v0

    .line 358
    :cond_0
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-direct {p0, v0, v1}, Lcom/ss/android/medialib/TTRecorder;->nativeResumeEffectAudio(J)I

    move-result v0

    return v0
.end method

.method public setAudioLoop(Z)V
    .locals 0

    .line 112
    iput-boolean p1, p0, Lcom/ss/android/medialib/TTRecorder;->mAudioLoop:Z

    .line 113
    return-void
.end method

.method public setBeautyFace(ILjava/lang/String;)I
    .locals 4

    .line 421
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/16 p1, -0x64

    return p1

    .line 422
    :cond_0
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/ss/android/medialib/TTRecorder;->nativeSetBeautyFace(JILjava/lang/String;)I

    move-result p1

    return p1
.end method

.method public setBeautyFaceIntensity(FF)I
    .locals 4

    .line 433
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/16 p1, -0x64

    return p1

    .line 434
    :cond_0
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/ss/android/medialib/TTRecorder;->nativeSetBeautyFaceIntensity(JFF)I

    move-result p1

    return p1
.end method

.method public setColorFormat(I)V
    .locals 2

    .line 472
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-direct {p0, v0, v1, p1}, Lcom/ss/android/medialib/TTRecorder;->nativeSetColorFormat(JI)I

    .line 473
    return-void
.end method

.method public setDeviceRotation([F)I
    .locals 4

    .line 411
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/16 p1, -0x64

    return p1

    .line 412
    :cond_0
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-direct {p0, v0, v1, p1}, Lcom/ss/android/medialib/TTRecorder;->nativeSetDeviceRotation(J[F)I

    move-result p1

    return p1
.end method

.method public setFaceDetectListener(Lcom/ss/android/medialib/listener/FaceDetectListener;)V
    .locals 0

    .line 657
    iput-object p1, p0, Lcom/ss/android/medialib/TTRecorder;->sFaceDetectListener:Lcom/ss/android/medialib/listener/FaceDetectListener;

    .line 658
    return-void
.end method

.method public setFaceReshape(Ljava/lang/String;FF)I
    .locals 6

    .line 448
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/16 p1, -0x64

    return p1

    .line 449
    :cond_0
    iget-wide v1, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    move-object v0, p0

    move-object v3, p1

    move v4, p2

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/ss/android/medialib/TTRecorder;->nativeSetFaceReshape(JLjava/lang/String;FF)I

    move-result p1

    return p1
.end method

.method public setFilter(Ljava/lang/String;F)I
    .locals 4

    .line 438
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/16 p1, -0x64

    return p1

    .line 439
    :cond_0
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/ss/android/medialib/TTRecorder;->nativeSetFilter(JLjava/lang/String;F)I

    move-result p1

    return p1
.end method

.method public setFilter(Ljava/lang/String;Ljava/lang/String;F)I
    .locals 6

    .line 443
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/16 p1, -0x64

    return p1

    .line 444
    :cond_0
    iget-wide v1, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    move-object v0, p0

    move-object v3, p1

    move-object v4, p2

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/ss/android/medialib/TTRecorder;->nativeSwitchFilter(JLjava/lang/String;Ljava/lang/String;F)I

    move-result p1

    return p1
.end method

.method public setGLCallback(Lcom/ss/android/medialib/listener/GLCallback;)V
    .locals 0

    .line 600
    iput-object p1, p0, Lcom/ss/android/medialib/TTRecorder;->mGLCallback:Lcom/ss/android/medialib/listener/GLCallback;

    .line 601
    return-void
.end method

.method public setMusicPath(Ljava/lang/String;)V
    .locals 4

    .line 97
    iput-object p1, p0, Lcom/ss/android/medialib/TTRecorder;->mMusicPath:Ljava/lang/String;

    .line 99
    iget-object p1, p0, Lcom/ss/android/medialib/TTRecorder;->mMusicPath:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_0

    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v2, 0x0

    cmp-long p1, v0, v2

    if-eqz p1, :cond_0

    .line 100
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const/4 p1, 0x1

    invoke-direct {p0, v0, v1, p1}, Lcom/ss/android/medialib/TTRecorder;->nativeSetUseMusic(JI)I

    move-result p1

    goto :goto_0

    .line 102
    :cond_0
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const/4 p1, 0x0

    invoke-direct {p0, v0, v1, p1}, Lcom/ss/android/medialib/TTRecorder;->nativeSetUseMusic(JI)I

    move-result p1

    .line 104
    :goto_0
    sget-object v0, Lcom/ss/android/medialib/TTRecorder;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setMusicPath result with:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 105
    return-void
.end method

.method public setMusicStart(J)I
    .locals 8

    .line 330
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 331
    const/16 p1, -0x64

    return p1

    .line 333
    :cond_0
    iput-wide p1, p0, Lcom/ss/android/medialib/TTRecorder;->mMusicStart:J

    .line 334
    invoke-virtual {p0}, Lcom/ss/android/medialib/TTRecorder;->getSegmentInfo()Ljava/util/List;

    move-result-object v0

    .line 335
    invoke-static {v0}, Lcom/ss/android/medialib/model/TimeSpeedModel;->calculateRealTime(Ljava/util/List;)I

    move-result v0

    .line 336
    iget-wide v2, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    int-to-long v6, v0

    move-object v1, p0

    move-wide v4, p1

    invoke-direct/range {v1 .. v7}, Lcom/ss/android/medialib/TTRecorder;->nativeSetMusicTime(JJJ)I

    move-result p1

    return p1
.end method

.method public setNativeInitListener(Lcom/ss/android/medialib/listener/NativeInitListener;)V
    .locals 0

    .line 636
    iput-object p1, p0, Lcom/ss/android/medialib/TTRecorder;->mNativeInitListener:Lcom/ss/android/medialib/listener/NativeInitListener;

    .line 637
    return-void
.end method

.method public setPreviewSizeRatio(F)V
    .locals 4

    .line 280
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 281
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-direct {p0, v0, v1, p1}, Lcom/ss/android/medialib/TTRecorder;->nativeSetPreviewSizeRatio(JF)V

    .line 283
    :cond_0
    return-void
.end method

.method public setSticker(Ljava/lang/String;)I
    .locals 4

    .line 401
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/16 p1, -0x64

    return p1

    .line 402
    :cond_0
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-direct {p0, v0, v1, p1}, Lcom/ss/android/medialib/TTRecorder;->nativeSetStickerPath(JLjava/lang/String;)I

    move-result p1

    return p1
.end method

.method public startPreview(Landroid/view/Surface;IZ)I
    .locals 8

    .line 161
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/16 p1, -0x64

    return p1

    .line 162
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/ss/android/medialib/TTRecorder;->mAudioInited:Z

    .line 163
    invoke-direct {p0}, Lcom/ss/android/medialib/TTRecorder;->initMessageCenter()V

    .line 164
    iget-wide v2, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    sget-object v7, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    move-object v1, p0

    move-object v4, p1

    move v5, p2

    move v6, p3

    invoke-direct/range {v1 .. v7}, Lcom/ss/android/medialib/TTRecorder;->nativeStartPreview(JLandroid/view/Surface;IZLjava/lang/String;)I

    move-result p1

    return p1
.end method

.method public startRecord(DZFII)I
    .locals 10

    move-object v9, p0

    .line 187
    iget-wide v0, v9, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/16 v0, -0x64

    return v0

    .line 188
    :cond_0
    iget-wide v0, v9, Lcom/ss/android/medialib/TTRecorder;->mMusicStart:J

    invoke-virtual {v9, v0, v1}, Lcom/ss/android/medialib/TTRecorder;->setMusicStart(J)I

    .line 189
    invoke-direct {v9}, Lcom/ss/android/medialib/TTRecorder;->initAudioIfNeed()V

    .line 190
    const v0, 0x3d0900

    .line 191
    int-to-float v0, v0

    mul-float/2addr v0, p4

    float-to-int v0, v0

    .line 192
    const v1, 0xb71b00

    if-le v0, v1, :cond_1

    .line 194
    move v6, v1

    goto :goto_0

    :cond_1
    move v6, v0

    :goto_0
    iget-wide v1, v9, Lcom/ss/android/medialib/TTRecorder;->handle:J

    move-object v0, v9

    move-wide v3, p1

    move v5, p3

    move v7, p5

    move/from16 v8, p6

    invoke-direct/range {v0 .. v8}, Lcom/ss/android/medialib/TTRecorder;->nativeStartRecord(JDZIII)I

    move-result v0

    .line 195
    if-nez v0, :cond_2

    .line 196
    invoke-direct {v9, p1, p2}, Lcom/ss/android/medialib/TTRecorder;->handleAudioRecord(D)V

    .line 198
    :cond_2
    return v0
.end method

.method public stopPreview()I
    .locals 4

    .line 222
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/16 v0, -0x64

    return v0

    .line 223
    :cond_0
    invoke-direct {p0}, Lcom/ss/android/medialib/TTRecorder;->destroyMessageCenter()V

    .line 224
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-direct {p0, v0, v1}, Lcom/ss/android/medialib/TTRecorder;->nativeStopPreview(J)I

    move-result v0

    return v0
.end method

.method public stopRecord()I
    .locals 4

    .line 207
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/16 v0, -0x64

    return v0

    .line 208
    :cond_0
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-direct {p0, v0, v1}, Lcom/ss/android/medialib/TTRecorder;->nativeStopRecord(J)I

    move-result v0

    .line 209
    iget-object v1, p0, Lcom/ss/android/medialib/TTRecorder;->mAudioRecorder:Lorg/a/a/d;

    if-eqz v1, :cond_1

    .line 210
    iget-object v1, p0, Lcom/ss/android/medialib/TTRecorder;->mAudioRecorder:Lorg/a/a/d;

    invoke-virtual {v1}, Lorg/a/a/d;->stopRecording()Z

    .line 213
    :cond_1
    iget-wide v1, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-direct {p0, v1, v2}, Lcom/ss/android/medialib/TTRecorder;->nativeSave(J)I

    .line 214
    return v0
.end method

.method public tryRestore()I
    .locals 4

    .line 136
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/16 v0, -0x64

    return v0

    .line 137
    :cond_0
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-direct {p0, v0, v1}, Lcom/ss/android/medialib/TTRecorder;->nativeTryRestore(J)I

    move-result v0

    .line 138
    nop

    .line 141
    return v0
.end method

.method public updateCameraInfo(IZ)V
    .locals 4

    .line 291
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 292
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/ss/android/medialib/TTRecorder;->nativeSetCameraInfo(JIZ)I

    .line 294
    :cond_0
    return-void
.end method
