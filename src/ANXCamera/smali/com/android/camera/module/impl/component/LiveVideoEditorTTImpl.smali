.class public Lcom/android/camera/module/impl/component/LiveVideoEditorTTImpl;
.super Ljava/lang/Object;
.source "LiveVideoEditorTTImpl.java"

# interfaces
.implements Lcom/android/camera/protocol/ModeProtocol$LiveVideoEditor;


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mContext:Landroid/content/Context;

.field private mEditor:Lcom/ss/android/vesdk/VEEditor;

.field private mNeedPrepare:Z

.field private mSurfaceView:Landroid/view/SurfaceView;

.field private mVideoSavePath:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 19
    const-class v0, Lcom/android/camera/module/impl/component/LiveVideoEditorTTImpl;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/module/impl/component/LiveVideoEditorTTImpl;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Lcom/android/camera/ActivityBase;)V
    .locals 1

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/module/impl/component/LiveVideoEditorTTImpl;->mNeedPrepare:Z

    .line 27
    invoke-virtual {p1}, Lcom/android/camera/ActivityBase;->getCameraAppImpl()Lcom/android/camera/CameraAppImpl;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/CameraAppImpl;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/module/impl/component/LiveVideoEditorTTImpl;->mContext:Landroid/content/Context;

    .line 28
    return-void
.end method

.method public static create(Lcom/android/camera/ActivityBase;)Lcom/android/camera/module/impl/component/LiveVideoEditorTTImpl;
    .locals 1

    .line 31
    new-instance v0, Lcom/android/camera/module/impl/component/LiveVideoEditorTTImpl;

    invoke-direct {v0, p0}, Lcom/android/camera/module/impl/component/LiveVideoEditorTTImpl;-><init>(Lcom/android/camera/ActivityBase;)V

    return-object v0
.end method


# virtual methods
.method public combineVideoAudio(Ljava/lang/String;Lcom/ss/android/vesdk/VECommonCallback;Lcom/ss/android/vesdk/VECommonCallback;)V
    .locals 1

    .line 84
    new-instance p2, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;

    invoke-direct {p2}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;-><init>()V

    sget-object p3, Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;->COMPILE_TYPE_MP4:Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;

    .line 85
    invoke-virtual {p2, p3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->setCompileType(Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;)Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;

    move-result-object p2

    .line 86
    const/16 p3, 0x240

    const/16 v0, 0x400

    invoke-virtual {p2, p3, v0}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->setVideoRes(II)Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;

    move-result-object p2

    .line 87
    const/4 p3, 0x1

    invoke-virtual {p2, p3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->setHwEnc(Z)Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;

    move-result-object p2

    .line 88
    const/16 p3, 0x1e

    invoke-virtual {p2, p3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->setGopSize(I)Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;

    move-result-object p2

    sget-object p3, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;->ENCODE_BITRATE_ABR:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    .line 89
    const/high16 v0, 0x400000

    invoke-virtual {p2, p3, v0}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->setVideoBitrate(Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;I)Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;

    move-result-object p2

    .line 90
    const/16 p3, 0x19

    invoke-virtual {p2, p3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->setFps(I)Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;

    move-result-object p2

    .line 91
    invoke-virtual {p2}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->build()Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    move-result-object p2

    .line 92
    iget-object p3, p0, Lcom/android/camera/module/impl/component/LiveVideoEditorTTImpl;->mEditor:Lcom/ss/android/vesdk/VEEditor;

    const/4 v0, 0x0

    invoke-virtual {p3, p1, v0, p2}, Lcom/ss/android/vesdk/VEEditor;->compile(Ljava/lang/String;Ljava/lang/String;Lcom/ss/android/vesdk/VEVideoEncodeSettings;)V

    .line 94
    return-void
.end method

.method public init(Landroid/view/TextureView;Ljava/lang/String;Ljava/lang/String;Lcom/ss/android/vesdk/VECommonCallback;Lcom/ss/android/vesdk/VECommonCallback;)V
    .locals 5

    .line 45
    new-instance v0, Lcom/ss/android/vesdk/VEEditor;

    sget-object v1, Lcom/android/camera/module/impl/component/FileUtils;->ROOT_DIR:Ljava/lang/String;

    invoke-direct {v0, v1, p1}, Lcom/ss/android/vesdk/VEEditor;-><init>(Ljava/lang/String;Landroid/view/TextureView;)V

    iput-object v0, p0, Lcom/android/camera/module/impl/component/LiveVideoEditorTTImpl;->mEditor:Lcom/ss/android/vesdk/VEEditor;

    .line 46
    nop

    .line 47
    const-string p1, ""

    invoke-virtual {p3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p1, :cond_0

    .line 48
    nop

    .line 49
    move p1, v1

    goto :goto_0

    :cond_0
    move p1, v0

    :goto_0
    new-array v2, v0, [Ljava/lang/String;

    aput-object p2, v2, v1

    .line 50
    const/4 p2, 0x0

    if-eqz p1, :cond_1

    new-array p1, v0, [Ljava/lang/String;

    aput-object p3, p1, v1

    goto :goto_1

    .line 52
    :cond_1
    move-object p1, p2

    :goto_1
    iget-object v3, p0, Lcom/android/camera/module/impl/component/LiveVideoEditorTTImpl;->mEditor:Lcom/ss/android/vesdk/VEEditor;

    sget-object v4, Lcom/ss/android/vesdk/VEEditor$VIDEO_RATIO;->VIDEO_OUT_RATIO_ORIGINAL:Lcom/ss/android/vesdk/VEEditor$VIDEO_RATIO;

    invoke-virtual {v3, v2, p2, p1, v4}, Lcom/ss/android/vesdk/VEEditor;->init([Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Lcom/ss/android/vesdk/VEEditor$VIDEO_RATIO;)I

    move-result p1

    .line 53
    iget-object v2, p0, Lcom/android/camera/module/impl/component/LiveVideoEditorTTImpl;->mEditor:Lcom/ss/android/vesdk/VEEditor;

    invoke-virtual {v2, p4}, Lcom/ss/android/vesdk/VEEditor;->setOnInfoListener(Lcom/ss/android/vesdk/VECommonCallback;)V

    .line 54
    iget-object p4, p0, Lcom/android/camera/module/impl/component/LiveVideoEditorTTImpl;->mEditor:Lcom/ss/android/vesdk/VEEditor;

    invoke-virtual {p4, p5}, Lcom/ss/android/vesdk/VEEditor;->setOnErrorListener(Lcom/ss/android/vesdk/VECommonCallback;)V

    .line 55
    if-eqz p1, :cond_3

    .line 56
    sget-object p3, Lcom/android/camera/module/impl/component/LiveVideoEditorTTImpl;->TAG:Ljava/lang/String;

    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    const-string p5, "Video editor init failed, ret = "

    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p3, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    iget-object p1, p0, Lcom/android/camera/module/impl/component/LiveVideoEditorTTImpl;->mEditor:Lcom/ss/android/vesdk/VEEditor;

    if-eqz p1, :cond_2

    .line 59
    iget-object p1, p0, Lcom/android/camera/module/impl/component/LiveVideoEditorTTImpl;->mEditor:Lcom/ss/android/vesdk/VEEditor;

    invoke-virtual {p1}, Lcom/ss/android/vesdk/VEEditor;->destroy()V

    .line 60
    iput-object p2, p0, Lcom/android/camera/module/impl/component/LiveVideoEditorTTImpl;->mEditor:Lcom/ss/android/vesdk/VEEditor;

    .line 62
    :cond_2
    return-void

    .line 65
    :cond_3
    iget-object p1, p0, Lcom/android/camera/module/impl/component/LiveVideoEditorTTImpl;->mEditor:Lcom/ss/android/vesdk/VEEditor;

    invoke-virtual {p1, v1}, Lcom/ss/android/vesdk/VEEditor;->setLoopPlay(Z)V

    .line 66
    iget-object p1, p0, Lcom/android/camera/module/impl/component/LiveVideoEditorTTImpl;->mEditor:Lcom/ss/android/vesdk/VEEditor;

    sget-object p2, Lcom/ss/android/vesdk/VEEditor$SCALE_MODE;->SCALE_MODE_CENTER_CROP:Lcom/ss/android/vesdk/VEEditor$SCALE_MODE;

    invoke-virtual {p1, p2}, Lcom/ss/android/vesdk/VEEditor;->setScaleMode(Lcom/ss/android/vesdk/VEEditor$SCALE_MODE;)I

    .line 67
    iget-object p1, p0, Lcom/android/camera/module/impl/component/LiveVideoEditorTTImpl;->mEditor:Lcom/ss/android/vesdk/VEEditor;

    invoke-virtual {p1}, Lcom/ss/android/vesdk/VEEditor;->prepare()I

    .line 68
    iput-boolean v1, p0, Lcom/android/camera/module/impl/component/LiveVideoEditorTTImpl;->mNeedPrepare:Z

    .line 69
    iget-object p1, p0, Lcom/android/camera/module/impl/component/LiveVideoEditorTTImpl;->mEditor:Lcom/ss/android/vesdk/VEEditor;

    const/16 p2, 0x3a98

    invoke-virtual {p1, p3, v1, p2, v0}, Lcom/ss/android/vesdk/VEEditor;->addAudioTrack(Ljava/lang/String;IIZ)I

    .line 70
    iget-object p1, p0, Lcom/android/camera/module/impl/component/LiveVideoEditorTTImpl;->mEditor:Lcom/ss/android/vesdk/VEEditor;

    sget-object p2, Lcom/ss/android/vesdk/VEEditor$SEEK_MODE;->EDITOR_SEEK_FLAG_LastSeek:Lcom/ss/android/vesdk/VEEditor$SEEK_MODE;

    invoke-virtual {p1, v1, p2}, Lcom/ss/android/vesdk/VEEditor;->seek(ILcom/ss/android/vesdk/VEEditor$SEEK_MODE;)I

    .line 75
    return-void
.end method

.method public onDestory()V
    .locals 1

    .line 126
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveVideoEditorTTImpl;->mEditor:Lcom/ss/android/vesdk/VEEditor;

    if-eqz v0, :cond_0

    .line 127
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveVideoEditorTTImpl;->mEditor:Lcom/ss/android/vesdk/VEEditor;

    invoke-virtual {v0}, Lcom/ss/android/vesdk/VEEditor;->destroy()V

    .line 128
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/module/impl/component/LiveVideoEditorTTImpl;->mEditor:Lcom/ss/android/vesdk/VEEditor;

    .line 130
    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 1

    .line 98
    iget-boolean v0, p0, Lcom/android/camera/module/impl/component/LiveVideoEditorTTImpl;->mNeedPrepare:Z

    if-eqz v0, :cond_0

    .line 99
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveVideoEditorTTImpl;->mEditor:Lcom/ss/android/vesdk/VEEditor;

    invoke-virtual {v0}, Lcom/ss/android/vesdk/VEEditor;->prepare()I

    .line 100
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/impl/component/LiveVideoEditorTTImpl;->mNeedPrepare:Z

    .line 101
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveVideoEditorTTImpl;->mEditor:Lcom/ss/android/vesdk/VEEditor;

    invoke-virtual {v0}, Lcom/ss/android/vesdk/VEEditor;->play()I

    .line 104
    :cond_0
    return-void
.end method

.method public pausePlay()V
    .locals 1

    .line 118
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveVideoEditorTTImpl;->mEditor:Lcom/ss/android/vesdk/VEEditor;

    if-nez v0, :cond_0

    .line 119
    return-void

    .line 121
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveVideoEditorTTImpl;->mEditor:Lcom/ss/android/vesdk/VEEditor;

    invoke-virtual {v0}, Lcom/ss/android/vesdk/VEEditor;->destroy()V

    .line 122
    return-void
.end method

.method public registerProtocol()V
    .locals 2

    .line 35
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xd1

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 36
    return-void
.end method

.method public startPlay()V
    .locals 1

    .line 108
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveVideoEditorTTImpl;->mEditor:Lcom/ss/android/vesdk/VEEditor;

    if-nez v0, :cond_0

    .line 109
    return-void

    .line 112
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveVideoEditorTTImpl;->mEditor:Lcom/ss/android/vesdk/VEEditor;

    invoke-virtual {v0}, Lcom/ss/android/vesdk/VEEditor;->play()I

    .line 113
    return-void
.end method

.method public unRegisterProtocol()V
    .locals 2

    .line 40
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xd1

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 41
    return-void
.end method
