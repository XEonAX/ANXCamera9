.class public Lcom/ss/android/vesdk/TERecorder;
.super Ljava/lang/Object;
.source "TERecorder.java"


# instance fields
.field private mAudioEncodeSettings:Lcom/ss/android/vesdk/VEAudioEncodeSettings;

.field private mPreviewSettings:Lcom/ss/android/vesdk/VEPreviewSettings;

.field private mRecordCount:I

.field private mRecorder:Lcom/ss/android/vesdk/IRecorder;

.field private mResManager:Lcom/ss/android/vesdk/runtime/VERecorderResManager;

.field private mVERuntime:Lcom/ss/android/vesdk/runtime/VERuntime;

.field private mVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/content/Context;)V
    .locals 1

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mAudioEncodeSettings:Lcom/ss/android/vesdk/VEAudioEncodeSettings;

    .line 26
    iput-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    .line 27
    iput-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mPreviewSettings:Lcom/ss/android/vesdk/VEPreviewSettings;

    .line 37
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 41
    if-eqz p2, :cond_0

    .line 45
    new-instance v0, Lcom/ss/android/vesdk/runtime/VERecorderResManager;

    invoke-direct {v0, p1}, Lcom/ss/android/vesdk/runtime/VERecorderResManager;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mResManager:Lcom/ss/android/vesdk/runtime/VERecorderResManager;

    .line 47
    invoke-static {}, Lcom/ss/android/vesdk/runtime/VERuntime;->getInstance()Lcom/ss/android/vesdk/runtime/VERuntime;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mVERuntime:Lcom/ss/android/vesdk/runtime/VERuntime;

    .line 48
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mVERuntime:Lcom/ss/android/vesdk/runtime/VERuntime;

    invoke-virtual {v0, p2, p1}, Lcom/ss/android/vesdk/runtime/VERuntime;->init(Landroid/content/Context;Ljava/lang/String;)V

    .line 49
    new-instance p1, Lcom/ss/android/vesdk/RecordV1;

    invoke-direct {p1, p2}, Lcom/ss/android/vesdk/RecordV1;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    .line 50
    return-void

    .line 42
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "context could not be null"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 38
    :cond_1
    new-instance p1, Lcom/ss/android/vesdk/VEException;

    const/16 p2, -0x64

    const-string v0, "workSpace is null"

    invoke-direct {p1, p2, v0}, Lcom/ss/android/vesdk/VEException;-><init>(ILjava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public clearEnv()V
    .locals 1

    .line 180
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v0}, Lcom/ss/android/vesdk/IRecorder;->clearEnv()V

    .line 181
    return-void
.end method

.method public concat()[Ljava/lang/String;
    .locals 5
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/VEException;
        }
    .end annotation

    .line 194
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mResManager:Lcom/ss/android/vesdk/runtime/VERecorderResManager;

    invoke-virtual {v0}, Lcom/ss/android/vesdk/runtime/VERecorderResManager;->genConcatSegmentVideoPath()V

    .line 195
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mResManager:Lcom/ss/android/vesdk/runtime/VERecorderResManager;

    invoke-virtual {v0}, Lcom/ss/android/vesdk/runtime/VERecorderResManager;->genConcatSegmentAudioPath()V

    .line 196
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mResManager:Lcom/ss/android/vesdk/runtime/VERecorderResManager;

    invoke-virtual {v0}, Lcom/ss/android/vesdk/runtime/VERecorderResManager;->getConcatSegmentVideoPath()Ljava/lang/String;

    move-result-object v0

    .line 197
    iget-object v1, p0, Lcom/ss/android/vesdk/TERecorder;->mResManager:Lcom/ss/android/vesdk/runtime/VERecorderResManager;

    invoke-virtual {v1}, Lcom/ss/android/vesdk/runtime/VERecorderResManager;->getConcatSegmentAudioPath()Ljava/lang/String;

    move-result-object v1

    .line 198
    iget-object v2, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v2, v0, v1}, Lcom/ss/android/vesdk/IRecorder;->concat(Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    .line 199
    if-ltz v2, :cond_0

    .line 202
    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object v1, v2, v0

    return-object v2

    .line 200
    :cond_0
    new-instance v0, Lcom/ss/android/vesdk/VEException;

    const/4 v1, -0x1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "concat failed: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/ss/android/vesdk/VEException;-><init>(ILjava/lang/String;)V

    throw v0
.end method

.method public deleteLastFrag()V
    .locals 1

    .line 173
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v0}, Lcom/ss/android/vesdk/IRecorder;->deleteLastFrag()V

    .line 174
    return-void
.end method

.method public destroy()V
    .locals 1

    .line 226
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v0}, Lcom/ss/android/vesdk/IRecorder;->destroy()V

    .line 227
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    .line 228
    return-void
.end method

.method public getEndFrameTime()J
    .locals 2

    .line 165
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v0}, Lcom/ss/android/vesdk/IRecorder;->getEndFrameTime()J

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

    .line 210
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v0}, Lcom/ss/android/vesdk/IRecorder;->getSegmentInfo()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public init(Lcom/ss/android/vesdk/VEVideoEncodeSettings;Lcom/ss/android/vesdk/VEAudioEncodeSettings;Lcom/ss/android/vesdk/VEPreviewSettings;)I
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
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/VEException;
        }
    .end annotation

    .line 75
    iput-object p1, p0, Lcom/ss/android/vesdk/TERecorder;->mVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    .line 76
    iput-object p2, p0, Lcom/ss/android/vesdk/TERecorder;->mAudioEncodeSettings:Lcom/ss/android/vesdk/VEAudioEncodeSettings;

    .line 77
    iput-object p3, p0, Lcom/ss/android/vesdk/TERecorder;->mPreviewSettings:Lcom/ss/android/vesdk/VEPreviewSettings;

    .line 79
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mVERuntime:Lcom/ss/android/vesdk/runtime/VERuntime;

    invoke-virtual {v0}, Lcom/ss/android/vesdk/runtime/VERuntime;->getEnv()Lcom/ss/android/vesdk/runtime/VEEnv;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/vesdk/runtime/VEEnv;->getDetectModelsDir()Ljava/lang/String;

    move-result-object v5

    .line 80
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mResManager:Lcom/ss/android/vesdk/runtime/VERecorderResManager;

    invoke-virtual {v0}, Lcom/ss/android/vesdk/runtime/VERecorderResManager;->getSegmentDirPath()Ljava/lang/String;

    move-result-object v6

    .line 82
    invoke-static {}, Lcom/ss/android/ttve/oauth/TEOAuth;->isPermitted()Z

    move-result v0

    if-nez v0, :cond_0

    .line 83
    const/16 p1, -0x16d

    return p1

    .line 86
    :cond_0
    iget-object v1, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    invoke-interface/range {v1 .. v6}, Lcom/ss/android/vesdk/IRecorder;->init(Lcom/ss/android/vesdk/VEVideoEncodeSettings;Lcom/ss/android/vesdk/VEAudioEncodeSettings;Lcom/ss/android/vesdk/VEPreviewSettings;Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method public pauseEffectAudio(Z)I
    .locals 1

    .line 320
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v0, p1}, Lcom/ss/android/vesdk/IRecorder;->pauseEffectAudio(Z)I

    move-result p1

    return p1
.end method

.method public setBeautyFace(ILjava/lang/String;)I
    .locals 1

    .line 268
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v0, p1, p2}, Lcom/ss/android/vesdk/IRecorder;->setBeautyFace(ILjava/lang/String;)I

    move-result p1

    return p1
.end method

.method public setBeautyFaceIntensity(FF)I
    .locals 1

    .line 279
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v0, p1, p2}, Lcom/ss/android/vesdk/IRecorder;->setBeautyFaceIntensity(FF)I

    move-result p1

    return p1
.end method

.method public setDeviceRotation([F)I
    .locals 1

    .line 311
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v0, p1}, Lcom/ss/android/vesdk/IRecorder;->setDeviceRotation([F)I

    move-result p1

    return p1
.end method

.method public setFaceReshape(Ljava/lang/String;FF)I
    .locals 1

    .line 291
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v0, p1, p2, p3}, Lcom/ss/android/vesdk/IRecorder;->setFaceReshape(Ljava/lang/String;FF)I

    move-result p1

    return p1
.end method

.method public setFilter(Ljava/lang/String;F)I
    .locals 1

    .line 240
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v0, p1, p2}, Lcom/ss/android/vesdk/IRecorder;->setFilter(Ljava/lang/String;F)I

    move-result p1

    return p1
.end method

.method public setFilter(Ljava/lang/String;Ljava/lang/String;F)I
    .locals 1

    .line 252
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v0, p1, p2, p3}, Lcom/ss/android/vesdk/IRecorder;->setFilter(Ljava/lang/String;Ljava/lang/String;F)I

    move-result p1

    return p1
.end method

.method public setRecordBGM(Ljava/lang/String;III)I
    .locals 1

    .line 131
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v0, p1, p2, p3, p4}, Lcom/ss/android/vesdk/IRecorder;->setRecordBGM(Ljava/lang/String;III)I

    move-result p1

    return p1
.end method

.method public setRecrodStateCallback(Lcom/ss/android/vesdk/VEListener$VERecorderStateListener;)V
    .locals 1

    .line 61
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v0, p1}, Lcom/ss/android/vesdk/IRecorder;->setRecordStateCallback(Lcom/ss/android/vesdk/VEListener$VERecorderStateListener;)V

    .line 62
    return-void
.end method

.method public setRenderCallback(Lcom/ss/android/vesdk/IRenderCallback;)V
    .locals 1

    .line 57
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v0, p1}, Lcom/ss/android/vesdk/IRecorder;->setRenderCallback(Lcom/ss/android/vesdk/IRenderCallback;)V

    .line 58
    return-void
.end method

.method public startPreview(Landroid/view/Surface;)I
    .locals 1

    .line 96
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v0, p1}, Lcom/ss/android/vesdk/IRecorder;->startPreview(Landroid/view/Surface;)I

    move-result p1

    return p1
.end method

.method public startRecord(F)I
    .locals 3

    .line 141
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mResManager:Lcom/ss/android/vesdk/runtime/VERecorderResManager;

    iget v1, p0, Lcom/ss/android/vesdk/TERecorder;->mRecordCount:I

    invoke-virtual {v0, v1}, Lcom/ss/android/vesdk/runtime/VERecorderResManager;->genSegmentVideoPath(I)Ljava/lang/String;

    move-result-object v0

    .line 142
    iget-object v1, p0, Lcom/ss/android/vesdk/TERecorder;->mResManager:Lcom/ss/android/vesdk/runtime/VERecorderResManager;

    iget v2, p0, Lcom/ss/android/vesdk/TERecorder;->mRecordCount:I

    invoke-virtual {v1, v2}, Lcom/ss/android/vesdk/runtime/VERecorderResManager;->genSegmentAudioPath(I)Ljava/lang/String;

    move-result-object v1

    .line 143
    iget v2, p0, Lcom/ss/android/vesdk/TERecorder;->mRecordCount:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/ss/android/vesdk/TERecorder;->mRecordCount:I

    .line 145
    iget-object v2, p0, Lcom/ss/android/vesdk/TERecorder;->mResManager:Lcom/ss/android/vesdk/runtime/VERecorderResManager;

    invoke-virtual {v2, v1}, Lcom/ss/android/vesdk/runtime/VERecorderResManager;->addSegmentAudioPath(Ljava/lang/String;)V

    .line 146
    iget-object v2, p0, Lcom/ss/android/vesdk/TERecorder;->mResManager:Lcom/ss/android/vesdk/runtime/VERecorderResManager;

    invoke-virtual {v2, v0}, Lcom/ss/android/vesdk/runtime/VERecorderResManager;->addSegmentVideoPath(Ljava/lang/String;)V

    .line 147
    iget-object v2, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v2, v0, v1, p1}, Lcom/ss/android/vesdk/IRecorder;->startRecord(Ljava/lang/String;Ljava/lang/String;F)I

    move-result p1

    return p1
.end method

.method public stopPreview()I
    .locals 1

    .line 115
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v0}, Lcom/ss/android/vesdk/IRecorder;->stopPreview()I

    move-result v0

    return v0
.end method

.method public stopRecord()I
    .locals 1

    .line 156
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v0}, Lcom/ss/android/vesdk/IRecorder;->stopRecord()I

    move-result v0

    return v0
.end method

.method public switchEffect(Ljava/lang/String;)I
    .locals 1

    .line 301
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v0, p1}, Lcom/ss/android/vesdk/IRecorder;->switchEffect(Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method public tryRestore()I
    .locals 1

    .line 218
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v0}, Lcom/ss/android/vesdk/IRecorder;->tryRestore()I

    move-result v0

    return v0
.end method

.method public updatePreviewSettings(Lcom/ss/android/vesdk/VEPreviewSettings;)V
    .locals 1

    .line 105
    iput-object p1, p0, Lcom/ss/android/vesdk/TERecorder;->mPreviewSettings:Lcom/ss/android/vesdk/VEPreviewSettings;

    .line 106
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v0, p1}, Lcom/ss/android/vesdk/IRecorder;->updatePreviewSettings(Lcom/ss/android/vesdk/VEPreviewSettings;)I

    .line 107
    return-void
.end method
