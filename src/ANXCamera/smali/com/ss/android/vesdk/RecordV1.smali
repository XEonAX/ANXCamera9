.class public Lcom/ss/android/vesdk/RecordV1;
.super Ljava/lang/Object;
.source "RecordV1.java"

# interfaces
.implements Lcom/ss/android/vesdk/IRecorder;


# instance fields
.field private mAudioEncodeSettings:Lcom/ss/android/vesdk/VEAudioEncodeSettings;

.field private mContext:Landroid/content/Context;

.field private mPreviewSettings:Lcom/ss/android/vesdk/VEPreviewSettings;

.field private mRecorder:Lcom/ss/android/medialib/TTRecorder;

.field private mRecorderStateCallback:Lcom/ss/android/vesdk/VEListener$VERecorderStateListener;

.field private mRenderCallback:Lcom/ss/android/vesdk/IRenderCallback;

.field private mTexture:Lcom/ss/android/vesdk/Texture;

.field private mTextureHolder:Lcom/ss/android/medialib/camera/TextureHolder;

.field private mVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/ss/android/vesdk/RecordV1;->mAudioEncodeSettings:Lcom/ss/android/vesdk/VEAudioEncodeSettings;

    .line 28
    iput-object v0, p0, Lcom/ss/android/vesdk/RecordV1;->mVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    .line 29
    iput-object v0, p0, Lcom/ss/android/vesdk/RecordV1;->mPreviewSettings:Lcom/ss/android/vesdk/VEPreviewSettings;

    .line 32
    iput-object p1, p0, Lcom/ss/android/vesdk/RecordV1;->mContext:Landroid/content/Context;

    .line 33
    new-instance v0, Lcom/ss/android/medialib/camera/TextureHolder;

    invoke-direct {v0}, Lcom/ss/android/medialib/camera/TextureHolder;-><init>()V

    iput-object v0, p0, Lcom/ss/android/vesdk/RecordV1;->mTextureHolder:Lcom/ss/android/medialib/camera/TextureHolder;

    .line 34
    new-instance v0, Lcom/ss/android/medialib/TTRecorder;

    invoke-direct {v0, p1}, Lcom/ss/android/medialib/TTRecorder;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/ss/android/vesdk/RecordV1;->mRecorder:Lcom/ss/android/medialib/TTRecorder;

    .line 35
    iget-object p1, p0, Lcom/ss/android/vesdk/RecordV1;->mRecorder:Lcom/ss/android/medialib/TTRecorder;

    new-instance v0, Lcom/ss/android/vesdk/RecordV1$1;

    invoke-direct {v0, p0}, Lcom/ss/android/vesdk/RecordV1$1;-><init>(Lcom/ss/android/vesdk/RecordV1;)V

    invoke-virtual {p1, v0}, Lcom/ss/android/medialib/TTRecorder;->setGLCallback(Lcom/ss/android/medialib/listener/GLCallback;)V

    .line 58
    iget-object p1, p0, Lcom/ss/android/vesdk/RecordV1;->mRecorder:Lcom/ss/android/medialib/TTRecorder;

    new-instance v0, Lcom/ss/android/vesdk/RecordV1$2;

    invoke-direct {v0, p0}, Lcom/ss/android/vesdk/RecordV1$2;-><init>(Lcom/ss/android/vesdk/RecordV1;)V

    invoke-virtual {p1, v0}, Lcom/ss/android/medialib/TTRecorder;->setNativeInitListener(Lcom/ss/android/medialib/listener/NativeInitListener;)V

    .line 73
    return-void
.end method

.method static synthetic access$000(Lcom/ss/android/vesdk/RecordV1;)Lcom/ss/android/vesdk/Texture;
    .locals 0

    .line 17
    iget-object p0, p0, Lcom/ss/android/vesdk/RecordV1;->mTexture:Lcom/ss/android/vesdk/Texture;

    return-object p0
.end method

.method static synthetic access$002(Lcom/ss/android/vesdk/RecordV1;Lcom/ss/android/vesdk/Texture;)Lcom/ss/android/vesdk/Texture;
    .locals 0

    .line 17
    iput-object p1, p0, Lcom/ss/android/vesdk/RecordV1;->mTexture:Lcom/ss/android/vesdk/Texture;

    return-object p1
.end method

.method static synthetic access$100(Lcom/ss/android/vesdk/RecordV1;)Lcom/ss/android/vesdk/IRenderCallback;
    .locals 0

    .line 17
    iget-object p0, p0, Lcom/ss/android/vesdk/RecordV1;->mRenderCallback:Lcom/ss/android/vesdk/IRenderCallback;

    return-object p0
.end method

.method static synthetic access$200(Lcom/ss/android/vesdk/RecordV1;)Lcom/ss/android/vesdk/VEListener$VERecorderStateListener;
    .locals 0

    .line 17
    iget-object p0, p0, Lcom/ss/android/vesdk/RecordV1;->mRecorderStateCallback:Lcom/ss/android/vesdk/VEListener$VERecorderStateListener;

    return-object p0
.end method


# virtual methods
.method public clearEnv()V
    .locals 1

    .line 147
    iget-object v0, p0, Lcom/ss/android/vesdk/RecordV1;->mRecorder:Lcom/ss/android/medialib/TTRecorder;

    invoke-virtual {v0}, Lcom/ss/android/medialib/TTRecorder;->clearEnv()V

    .line 148
    return-void
.end method

.method public concat(Ljava/lang/String;Ljava/lang/String;)I
    .locals 1

    .line 152
    iget-object v0, p0, Lcom/ss/android/vesdk/RecordV1;->mRecorder:Lcom/ss/android/medialib/TTRecorder;

    invoke-virtual {v0, p1, p2}, Lcom/ss/android/medialib/TTRecorder;->concatSyn(Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method public deleteLastFrag()V
    .locals 1

    .line 142
    iget-object v0, p0, Lcom/ss/android/vesdk/RecordV1;->mRecorder:Lcom/ss/android/medialib/TTRecorder;

    invoke-virtual {v0}, Lcom/ss/android/medialib/TTRecorder;->deleteLastFrag()V

    .line 143
    return-void
.end method

.method public destroy()V
    .locals 1

    .line 166
    iget-object v0, p0, Lcom/ss/android/vesdk/RecordV1;->mRecorder:Lcom/ss/android/medialib/TTRecorder;

    invoke-virtual {v0}, Lcom/ss/android/medialib/TTRecorder;->destroy()V

    .line 167
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/ss/android/vesdk/RecordV1;->mRecorder:Lcom/ss/android/medialib/TTRecorder;

    .line 168
    return-void
.end method

.method public getEndFrameTime()J
    .locals 2

    .line 137
    iget-object v0, p0, Lcom/ss/android/vesdk/RecordV1;->mRecorder:Lcom/ss/android/medialib/TTRecorder;

    invoke-virtual {v0}, Lcom/ss/android/medialib/TTRecorder;->getEndFrameTime()J

    move-result-wide v0

    return-wide v0
.end method

.method public getSegmentInfo()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/ss/android/medialib/model/TimeSpeedModel;",
            ">;"
        }
    .end annotation

    .line 156
    iget-object v0, p0, Lcom/ss/android/vesdk/RecordV1;->mRecorder:Lcom/ss/android/medialib/TTRecorder;

    invoke-virtual {v0}, Lcom/ss/android/medialib/TTRecorder;->getSegmentInfo()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public init(Lcom/ss/android/vesdk/VEVideoEncodeSettings;Lcom/ss/android/vesdk/VEAudioEncodeSettings;Lcom/ss/android/vesdk/VEPreviewSettings;Ljava/lang/String;Ljava/lang/String;)I
    .locals 7
    .param p1    # Lcom/ss/android/vesdk/VEVideoEncodeSettings;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/ss/android/vesdk/VEAudioEncodeSettings;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Lcom/ss/android/vesdk/VEPreviewSettings;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 87
    iput-object p1, p0, Lcom/ss/android/vesdk/RecordV1;->mVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    .line 88
    iput-object p2, p0, Lcom/ss/android/vesdk/RecordV1;->mAudioEncodeSettings:Lcom/ss/android/vesdk/VEAudioEncodeSettings;

    .line 89
    iput-object p3, p0, Lcom/ss/android/vesdk/RecordV1;->mPreviewSettings:Lcom/ss/android/vesdk/VEPreviewSettings;

    .line 90
    invoke-virtual {p3}, Lcom/ss/android/vesdk/VEPreviewSettings;->getSize()Lcom/ss/android/vesdk/VESize;

    move-result-object p2

    .line 91
    invoke-virtual {p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->getVideoRes()Lcom/ss/android/vesdk/VESize;

    move-result-object p1

    .line 92
    const-string p3, "/"

    invoke-virtual {p5, p3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p3

    if-nez p3, :cond_0

    .line 93
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p3, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p5, "/"

    invoke-virtual {p3, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p5

    .line 95
    :cond_0
    move-object v3, p5

    iget-object v0, p0, Lcom/ss/android/vesdk/RecordV1;->mRecorder:Lcom/ss/android/medialib/TTRecorder;

    iget v1, p2, Lcom/ss/android/vesdk/VESize;->width:I

    iget v2, p2, Lcom/ss/android/vesdk/VESize;->height:I

    iget v4, p1, Lcom/ss/android/vesdk/VESize;->width:I

    iget v5, p1, Lcom/ss/android/vesdk/VESize;->height:I

    move-object v6, p4

    invoke-virtual/range {v0 .. v6}, Lcom/ss/android/medialib/TTRecorder;->init(IILjava/lang/String;IILjava/lang/String;)I

    move-result p1

    return p1
.end method

.method public pauseEffectAudio(Z)I
    .locals 0

    .line 207
    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/ss/android/vesdk/RecordV1;->mRecorder:Lcom/ss/android/medialib/TTRecorder;

    invoke-virtual {p1}, Lcom/ss/android/medialib/TTRecorder;->pauseEffectAudio()I

    move-result p1

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/ss/android/vesdk/RecordV1;->mRecorder:Lcom/ss/android/medialib/TTRecorder;

    invoke-virtual {p1}, Lcom/ss/android/medialib/TTRecorder;->resumeEffectAudio()I

    move-result p1

    :goto_0
    return p1
.end method

.method public setBeautyFace(ILjava/lang/String;)I
    .locals 1

    .line 182
    iget-object v0, p0, Lcom/ss/android/vesdk/RecordV1;->mRecorder:Lcom/ss/android/medialib/TTRecorder;

    invoke-virtual {v0, p1, p2}, Lcom/ss/android/medialib/TTRecorder;->setBeautyFace(ILjava/lang/String;)I

    move-result p1

    return p1
.end method

.method public setBeautyFaceIntensity(FF)I
    .locals 1

    .line 187
    iget-object v0, p0, Lcom/ss/android/vesdk/RecordV1;->mRecorder:Lcom/ss/android/medialib/TTRecorder;

    invoke-virtual {v0, p1, p2}, Lcom/ss/android/medialib/TTRecorder;->setBeautyFaceIntensity(FF)I

    move-result p1

    return p1
.end method

.method public setDeviceRotation([F)I
    .locals 1

    .line 202
    iget-object v0, p0, Lcom/ss/android/vesdk/RecordV1;->mRecorder:Lcom/ss/android/medialib/TTRecorder;

    invoke-virtual {v0, p1}, Lcom/ss/android/medialib/TTRecorder;->setDeviceRotation([F)I

    move-result p1

    return p1
.end method

.method public setFaceReshape(Ljava/lang/String;FF)I
    .locals 1

    .line 192
    iget-object v0, p0, Lcom/ss/android/vesdk/RecordV1;->mRecorder:Lcom/ss/android/medialib/TTRecorder;

    invoke-virtual {v0, p1, p2, p3}, Lcom/ss/android/medialib/TTRecorder;->setFaceReshape(Ljava/lang/String;FF)I

    move-result p1

    return p1
.end method

.method public setFilter(Ljava/lang/String;F)I
    .locals 1

    .line 172
    iget-object v0, p0, Lcom/ss/android/vesdk/RecordV1;->mRecorder:Lcom/ss/android/medialib/TTRecorder;

    invoke-virtual {v0, p1, p2}, Lcom/ss/android/medialib/TTRecorder;->setFilter(Ljava/lang/String;F)I

    move-result p1

    return p1
.end method

.method public setFilter(Ljava/lang/String;Ljava/lang/String;F)I
    .locals 1

    .line 177
    iget-object v0, p0, Lcom/ss/android/vesdk/RecordV1;->mRecorder:Lcom/ss/android/medialib/TTRecorder;

    invoke-virtual {v0, p1, p2, p3}, Lcom/ss/android/medialib/TTRecorder;->setFilter(Ljava/lang/String;Ljava/lang/String;F)I

    move-result p1

    return p1
.end method

.method public setRecordBGM(Ljava/lang/String;III)I
    .locals 0

    .line 119
    iget-object p3, p0, Lcom/ss/android/vesdk/RecordV1;->mRecorder:Lcom/ss/android/medialib/TTRecorder;

    invoke-virtual {p3, p1}, Lcom/ss/android/medialib/TTRecorder;->setMusicPath(Ljava/lang/String;)V

    .line 120
    iget-object p1, p0, Lcom/ss/android/vesdk/RecordV1;->mRecorder:Lcom/ss/android/medialib/TTRecorder;

    int-to-long p2, p2

    invoke-virtual {p1, p2, p3}, Lcom/ss/android/medialib/TTRecorder;->setMusicStart(J)I

    .line 121
    const/4 p1, 0x0

    return p1
.end method

.method public setRecordStateCallback(Lcom/ss/android/vesdk/VEListener$VERecorderStateListener;)V
    .locals 0

    .line 81
    iput-object p1, p0, Lcom/ss/android/vesdk/RecordV1;->mRecorderStateCallback:Lcom/ss/android/vesdk/VEListener$VERecorderStateListener;

    .line 82
    return-void
.end method

.method public setRenderCallback(Lcom/ss/android/vesdk/IRenderCallback;)V
    .locals 0

    .line 76
    iput-object p1, p0, Lcom/ss/android/vesdk/RecordV1;->mRenderCallback:Lcom/ss/android/vesdk/IRenderCallback;

    .line 77
    return-void
.end method

.method public startPreview(Landroid/view/Surface;)I
    .locals 4

    .line 100
    iget-object v0, p0, Lcom/ss/android/vesdk/RecordV1;->mRecorder:Lcom/ss/android/medialib/TTRecorder;

    iget-object v1, p0, Lcom/ss/android/vesdk/RecordV1;->mPreviewSettings:Lcom/ss/android/vesdk/VEPreviewSettings;

    invoke-virtual {v1}, Lcom/ss/android/vesdk/VEPreviewSettings;->getRotation()I

    move-result v1

    iget-object v2, p0, Lcom/ss/android/vesdk/RecordV1;->mPreviewSettings:Lcom/ss/android/vesdk/VEPreviewSettings;

    .line 101
    invoke-virtual {v2}, Lcom/ss/android/vesdk/VEPreviewSettings;->getFacingID()Lcom/ss/android/vesdk/VEPreviewSettings$CAMERA_FACING_ID;

    move-result-object v2

    sget-object v3, Lcom/ss/android/vesdk/VEPreviewSettings$CAMERA_FACING_ID;->FACING_FRONT:Lcom/ss/android/vesdk/VEPreviewSettings$CAMERA_FACING_ID;

    if-ne v2, v3, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    .line 100
    :goto_0
    invoke-virtual {v0, p1, v1, v2}, Lcom/ss/android/medialib/TTRecorder;->startPreview(Landroid/view/Surface;IZ)I

    move-result p1

    return p1
.end method

.method public startRecord(Ljava/lang/String;Ljava/lang/String;F)I
    .locals 7

    .line 126
    iget-object v0, p0, Lcom/ss/android/vesdk/RecordV1;->mRecorder:Lcom/ss/android/medialib/TTRecorder;

    float-to-double v1, p3

    iget-object p1, p0, Lcom/ss/android/vesdk/RecordV1;->mVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    invoke-virtual {p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->isHwEnc()Z

    move-result p1

    xor-int/lit8 v3, p1, 0x1

    const/high16 v4, 0x3f800000    # 1.0f

    const/4 v5, 0x1

    iget-object p1, p0, Lcom/ss/android/vesdk/RecordV1;->mVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    .line 127
    invoke-virtual {p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->getEncodeProfile()I

    move-result v6

    .line 126
    invoke-virtual/range {v0 .. v6}, Lcom/ss/android/medialib/TTRecorder;->startRecord(DZFII)I

    move-result p1

    return p1
.end method

.method public stopPreview()I
    .locals 1

    .line 114
    iget-object v0, p0, Lcom/ss/android/vesdk/RecordV1;->mRecorder:Lcom/ss/android/medialib/TTRecorder;

    invoke-virtual {v0}, Lcom/ss/android/medialib/TTRecorder;->stopPreview()I

    move-result v0

    return v0
.end method

.method public stopRecord()I
    .locals 1

    .line 132
    iget-object v0, p0, Lcom/ss/android/vesdk/RecordV1;->mRecorder:Lcom/ss/android/medialib/TTRecorder;

    invoke-virtual {v0}, Lcom/ss/android/medialib/TTRecorder;->stopRecord()I

    move-result v0

    return v0
.end method

.method public switchEffect(Ljava/lang/String;)I
    .locals 1

    .line 197
    iget-object v0, p0, Lcom/ss/android/vesdk/RecordV1;->mRecorder:Lcom/ss/android/medialib/TTRecorder;

    invoke-virtual {v0, p1}, Lcom/ss/android/medialib/TTRecorder;->setSticker(Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method public tryRestore()I
    .locals 1

    .line 161
    iget-object v0, p0, Lcom/ss/android/vesdk/RecordV1;->mRecorder:Lcom/ss/android/medialib/TTRecorder;

    invoke-virtual {v0}, Lcom/ss/android/medialib/TTRecorder;->tryRestore()I

    move-result v0

    return v0
.end method

.method public updatePreviewSettings(Lcom/ss/android/vesdk/VEPreviewSettings;)I
    .locals 4

    .line 106
    iput-object p1, p0, Lcom/ss/android/vesdk/RecordV1;->mPreviewSettings:Lcom/ss/android/vesdk/VEPreviewSettings;

    .line 107
    iget-object p1, p0, Lcom/ss/android/vesdk/RecordV1;->mRecorder:Lcom/ss/android/medialib/TTRecorder;

    iget-object v0, p0, Lcom/ss/android/vesdk/RecordV1;->mPreviewSettings:Lcom/ss/android/vesdk/VEPreviewSettings;

    invoke-virtual {v0}, Lcom/ss/android/vesdk/VEPreviewSettings;->getRotation()I

    move-result v0

    iget-object v1, p0, Lcom/ss/android/vesdk/RecordV1;->mPreviewSettings:Lcom/ss/android/vesdk/VEPreviewSettings;

    .line 108
    invoke-virtual {v1}, Lcom/ss/android/vesdk/VEPreviewSettings;->getFacingID()Lcom/ss/android/vesdk/VEPreviewSettings$CAMERA_FACING_ID;

    move-result-object v1

    sget-object v2, Lcom/ss/android/vesdk/VEPreviewSettings$CAMERA_FACING_ID;->FACING_FRONT:Lcom/ss/android/vesdk/VEPreviewSettings$CAMERA_FACING_ID;

    const/4 v3, 0x0

    if-ne v1, v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    .line 107
    :cond_0
    move v1, v3

    :goto_0
    invoke-virtual {p1, v0, v1}, Lcom/ss/android/medialib/TTRecorder;->updateCameraInfo(IZ)V

    .line 109
    return v3
.end method
